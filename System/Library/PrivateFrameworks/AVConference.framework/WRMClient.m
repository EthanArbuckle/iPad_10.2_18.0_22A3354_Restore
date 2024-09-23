@implementation WRMClient

- (WRMClient)init
{
  WRMClient *v2;
  uint64_t v3;
  NSObject *v4;
  NSObject *CustomRootQueue;
  objc_super v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  WRMClient *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)WRMClient;
  v2 = -[WRMClient init](&v7, sel_init);
  if (v2)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v9 = v3;
        v10 = 2080;
        v11 = "-[WRMClient init]";
        v12 = 1024;
        v13 = 110;
        v14 = 2048;
        v15 = v2;
        _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d WRMClient[%p] init", buf, 0x26u);
      }
    }
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
    v2->_connectionQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.WRMClient.clientQueue", 0, CustomRootQueue);
    v2->_rssiThreshold = -80;
  }
  return v2;
}

- (WRMClient)initWithDelegate:(id)a3
{
  WRMClient *v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *CustomRootQueue;
  objc_super v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  WRMClient *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)WRMClient;
  v4 = -[WRMClient init](&v9, sel_init);
  if (v4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v11 = v5;
        v12 = 2080;
        v13 = "-[WRMClient initWithDelegate:]";
        v14 = 1024;
        v15 = 121;
        v16 = 2048;
        v17 = v4;
        _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d WRMClient[%p] init", buf, 0x26u);
      }
    }
    objc_storeWeak(&v4->_wrmClientDelegate, a3);
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
    v4->_connectionQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.WRMClient.clientQueue", 0, CustomRootQueue);
  }
  return v4;
}

- (void)dealloc
{
  uint64_t v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[4];
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  WRMClient *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v7 = v3;
      v8 = 2080;
      v9 = "-[WRMClient dealloc]";
      v10 = 1024;
      v11 = 128;
      v12 = 2048;
      v13 = self;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d WRMClient[%p] dealloc", buf, 0x26u);
    }
  }
  -[WRMClient releaseServiceConnection](self, "releaseServiceConnection");
  dispatch_release((dispatch_object_t)self->_connectionQueue);
  objc_storeWeak(&self->_wrmClientDelegate, 0);
  v5.receiver = self;
  v5.super_class = (Class)WRMClient;
  -[WRMClient dealloc](&v5, sel_dealloc);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak(&self->_wrmClientDelegate, a3);
}

- (WRMClientDelegate)delegate
{
  return (WRMClientDelegate *)objc_loadWeak(&self->_wrmClientDelegate);
}

- (BOOL)setupServiceConnection
{
  OS_xpc_object *connection;
  NSObject *global_queue;
  uint64_t v5;
  OS_xpc_object *v6;
  _QWORD v8[6];

  v8[5] = *MEMORY[0x1E0C80C00];
  connection = self->_connection;
  if (!connection)
  {
    global_queue = dispatch_get_global_queue(0, 0);
    self->_connection = xpc_connection_create_mach_service("com.apple.WirelessCoexManager", global_queue, 0);
    v5 = objc_msgSend(MEMORY[0x1E0CF26A0], "weakObjectHolderWithObject:", self);
    v6 = self->_connection;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __35__WRMClient_setupServiceConnection__block_invoke;
    v8[3] = &unk_1E9E561E0;
    v8[4] = v5;
    xpc_connection_set_event_handler(v6, v8);
    xpc_connection_resume(self->_connection);
  }
  return connection == 0;
}

void __35__WRMClient_setupServiceConnection__block_invoke(uint64_t a1, void *a2)
{
  HandleWRMEvent(a2, (void *)objc_msgSend(*(id *)(a1 + 32), "strong"));
}

- (void)releaseServiceConnection
{
  OS_xpc_object *connection;
  uint64_t v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  WRMClient *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  connection = self->_connection;
  if (connection)
  {
    xpc_release(connection);
    self->_connection = 0;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315906;
      v7 = v4;
      v8 = 2080;
      v9 = "-[WRMClient releaseServiceConnection]";
      v10 = 1024;
      v11 = 167;
      v12 = 2048;
      v13 = self;
      _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d WRMClient(%p): stopped.", (uint8_t *)&v6, 0x26u);
    }
  }
}

- (void)startWRMClientWithMode:(int)a3 metricsConfig:(id)a4
{
  NSObject *connectionQueue;
  _QWORD block[5];
  int v6;
  $EB925890EBEBD6850280D1FB85A9BD43 v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__WRMClient_startWRMClientWithMode_metricsConfig___block_invoke;
  block[3] = &unk_1E9E56CE8;
  block[4] = self;
  v7 = a4;
  v6 = a3;
  dispatch_async(connectionQueue, block);
}

void __50__WRMClient_startWRMClientWithMode_metricsConfig___block_invoke(uint64_t a1)
{
  uint64_t v2;
  __int16 v3;
  int v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "setupServiceConnection"))
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(_WORD *)(a1 + 44);
    *(_BYTE *)(v2 + 42) = *(_BYTE *)(a1 + 46);
    *(_WORD *)(v2 + 40) = v3;
    v4 = *(_DWORD *)(a1 + 40);
    if (v4 == 1)
    {
      objc_msgSend(*(id *)(a1 + 32), "sendProcessInfoWithProcessID:", 14);
      objc_msgSend(*(id *)(a1 + 32), "sendSubscriptionInfoFaceTimeCalling");
    }
    else if (!v4)
    {
      objc_msgSend(*(id *)(a1 + 32), "sendProcessInfoWithProcessID:", 9);
    }
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 36) = *(_DWORD *)(a1 + 40);
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 136315906;
      v9 = v5;
      v10 = 2080;
      v11 = "-[WRMClient startWRMClientWithMode:metricsConfig:]_block_invoke";
      v12 = 1024;
      v13 = 188;
      v14 = 2048;
      v15 = v7;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d WRMClient(%p): started.", (uint8_t *)&v8, 0x26u);
    }
  }
}

- (void)stopWRMClient
{
  NSObject *connectionQueue;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  connectionQueue = self->_connectionQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __26__WRMClient_stopWRMClient__block_invoke;
  v3[3] = &unk_1E9E521C0;
  v3[4] = self;
  dispatch_sync(connectionQueue, v3);
}

uint64_t __26__WRMClient_stopWRMClient__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "releaseServiceConnection");
}

- (int)getWRMSubscribeVersion
{
  return dword_1D910E870[(self->_metricsConfig.reportRtpErasureMetricsEnabled | (2
                                                                                                * self->_metricsConfig.reportImmediateMetricsEnabled))];
}

- (void)sendProcessInfoWithProcessID:(unint64_t)a3
{
  xpc_object_t v4;
  xpc_object_t v5;
  xpc_object_t v6;
  xpc_object_t v7;
  xpc_object_t v8[2];
  char *v9[2];
  xpc_object_t values;
  char *keys[2];

  keys[1] = *(char **)MEMORY[0x1E0C80C00];
  keys[0] = "kWCMRegisterProcess_ProcessId";
  v4 = xpc_uint64_create(a3);
  values = v4;
  v5 = xpc_dictionary_create((const char *const *)keys, &values, 1uLL);
  *(_OWORD *)v9 = xmmword_1E9E56D30;
  v6 = xpc_uint64_create(1uLL);
  v8[0] = v6;
  v8[1] = v5;
  v7 = xpc_dictionary_create((const char *const *)v9, v8, 2uLL);
  xpc_connection_send_message(self->_connection, v7);
  xpc_release(v4);
  xpc_release(v6);
  xpc_release(v5);
  xpc_release(v7);
}

- (void)sendSubscriptionInfoFaceTimeCalling
{
  xpc_object_t v3;
  xpc_object_t v4;
  xpc_object_t v5;
  xpc_object_t v6;
  xpc_object_t v7;
  xpc_object_t v8;
  xpc_object_t v9;
  xpc_object_t v10;
  xpc_object_t v11;
  xpc_object_t v12;
  NSObject *connectionQueue;
  xpc_object_t v14;
  xpc_object_t object;
  xpc_object_t v16;
  _QWORD block[6];
  xpc_object_t v18[2];
  char *v19[2];
  xpc_object_t v20;
  char *v21;
  xpc_object_t objects[2];
  xpc_object_t v23[5];
  char *v24[2];
  __int128 v25;
  const char *v26;
  xpc_object_t values[5];
  char *keys[2];
  __int128 v29;
  const char *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = xpc_uint64_create(-[WRMClient getWRMSubscribeVersion](self, "getWRMSubscribeVersion"));
  v4 = xpc_int64_create(self->_rssiThreshold);
  object = xpc_uint64_create(1uLL);
  v14 = xpc_uint64_create(2uLL);
  v5 = xpc_uint64_create(0);
  v16 = xpc_uint64_create(0x32uLL);
  v6 = xpc_uint64_create(0x1F4uLL);
  *(_OWORD *)keys = xmmword_1E9E56D08;
  v29 = *(_OWORD *)&off_1E9E56D18;
  v30 = "kWRMRSSITh";
  values[0] = object;
  values[1] = v5;
  values[2] = v16;
  values[3] = v3;
  values[4] = v4;
  v7 = xpc_dictionary_create((const char *const *)keys, values, 5uLL);
  *(_OWORD *)v24 = xmmword_1E9E56D08;
  v25 = *(_OWORD *)&off_1E9E56D18;
  v26 = "kWRMRSSITh";
  v23[0] = v14;
  v23[1] = v5;
  v23[2] = v6;
  v23[3] = v3;
  v23[4] = v4;
  v8 = xpc_dictionary_create((const char *const *)v24, v23, 5uLL);
  objects[0] = v7;
  objects[1] = v8;
  v9 = xpc_array_create(objects, 2uLL);
  v20 = v9;
  v21 = "kWRMApplicationTypeList";
  v10 = xpc_dictionary_create((const char *const *)&v21, &v20, 1uLL);
  *(_OWORD *)v19 = xmmword_1E9E56D30;
  v11 = xpc_uint64_create(0x196uLL);
  v18[0] = v11;
  v18[1] = v10;
  v12 = xpc_dictionary_create((const char *const *)v19, v18, 2uLL);
  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__WRMClient_sendSubscriptionInfoFaceTimeCalling__block_invoke;
  block[3] = &unk_1E9E52238;
  block[4] = self;
  block[5] = v12;
  dispatch_async(connectionQueue, block);
  xpc_release(v3);
  xpc_release(object);
  xpc_release(v14);
  xpc_release(v5);
  xpc_release(v16);
  xpc_release(v6);
  xpc_release(v7);
  xpc_release(v8);
  xpc_release(v9);
  xpc_release(v10);
  xpc_release(v11);
  xpc_release(v12);
}

void __48__WRMClient_sendSubscriptionInfoFaceTimeCalling__block_invoke(uint64_t a1)
{
  _xpc_connection_s *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = *(_xpc_connection_s **)(*(_QWORD *)(a1 + 32) + 8);
  if (v2)
  {
    xpc_connection_send_message(v2, *(xpc_object_t *)(a1 + 40));
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v5 = *(_QWORD *)(a1 + 32);
        v6 = 136315906;
        v7 = v3;
        v8 = 2080;
        v9 = "-[WRMClient sendSubscriptionInfoFaceTimeCalling]_block_invoke";
        v10 = 1024;
        v11 = 279;
        v12 = 2048;
        v13 = v5;
        _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d WRMClient(%p): Subscribed to WRM iRAT notification", (uint8_t *)&v6, 0x26u);
      }
    }
  }
}

- (void)sendUnsubscriptionInfoFaceTimeCalling
{
  xpc_object_t v3;
  xpc_object_t v4;
  NSObject *connectionQueue;
  _QWORD v6[6];
  xpc_object_t values[2];
  char *keys[2];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  *(_OWORD *)keys = xmmword_1E9E56D30;
  v3 = xpc_uint64_create(0x196uLL);
  values[0] = v3;
  values[1] = 0;
  v4 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
  connectionQueue = self->_connectionQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__WRMClient_sendUnsubscriptionInfoFaceTimeCalling__block_invoke;
  v6[3] = &unk_1E9E52238;
  v6[4] = self;
  v6[5] = v4;
  dispatch_async(connectionQueue, v6);
  xpc_release(v3);
  xpc_release(v4);
}

void __50__WRMClient_sendUnsubscriptionInfoFaceTimeCalling__block_invoke(uint64_t a1)
{
  _xpc_connection_s *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = *(_xpc_connection_s **)(*(_QWORD *)(a1 + 32) + 8);
  if (v2)
  {
    xpc_connection_send_message(v2, *(xpc_object_t *)(a1 + 40));
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v5 = *(_QWORD *)(a1 + 32);
        v6 = 136315906;
        v7 = v3;
        v8 = 2080;
        v9 = "-[WRMClient sendUnsubscriptionInfoFaceTimeCalling]_block_invoke";
        v10 = 1024;
        v11 = 307;
        v12 = 2048;
        v13 = v5;
        _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d WRMClient(%p): Unsubscribed to WRM iRAT notification", (uint8_t *)&v6, 0x26u);
      }
    }
  }
}

- (void)requestNotificationFaceTimeCalling
{
  -[WRMClient sendUnsubscriptionInfoFaceTimeCalling](self, "sendUnsubscriptionInfoFaceTimeCalling");
  -[WRMClient sendSubscriptionInfoFaceTimeCalling](self, "sendSubscriptionInfoFaceTimeCalling");
}

- (void)sendStatusUpdateInfoFaceTimeCalling:(id)a3
{
  xpc_object_t v4;
  xpc_object_t v5;
  xpc_object_t v6;
  xpc_object_t v7;
  NSObject *connectionQueue;
  _QWORD v9[6];
  xpc_object_t v10[2];
  char *v11[2];
  xpc_object_t values;
  char *keys;
  xpc_object_t objects[2];

  objects[1] = *(xpc_object_t *)MEMORY[0x1E0C80C00];
  objects[0] = a3;
  v4 = xpc_array_create(objects, 1uLL);
  keys = "kWRMApplicationTypeList";
  values = v4;
  v5 = xpc_dictionary_create((const char *const *)&keys, &values, 1uLL);
  *(_OWORD *)v11 = xmmword_1E9E56D30;
  v6 = xpc_uint64_create(0x197uLL);
  v10[0] = v6;
  v10[1] = v5;
  v7 = xpc_dictionary_create((const char *const *)v11, v10, 2uLL);
  connectionQueue = self->_connectionQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __49__WRMClient_sendStatusUpdateInfoFaceTimeCalling___block_invoke;
  v9[3] = &unk_1E9E52238;
  v9[4] = self;
  v9[5] = v7;
  dispatch_async(connectionQueue, v9);
  xpc_release(v4);
  xpc_release(v5);
  xpc_release(v6);
  xpc_release(v7);
}

void __49__WRMClient_sendStatusUpdateInfoFaceTimeCalling___block_invoke(uint64_t a1)
{
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8))
    xpc_connection_send_message(*(xpc_connection_t *)(*(_QWORD *)(a1 + 32) + 8), *(xpc_object_t *)(a1 + 40));
}

- (void)sendStatusUpdateFaceTimeCalling:(id *)a3
{
  xpc_object_t v5;

  if (self->_connection)
  {
    v5 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v5, "kWRMApplicationType", a3->var0);
    xpc_dictionary_set_uint64(v5, "kWRMLinkType", a3->var1);
    xpc_dictionary_set_uint64(v5, "kWRMFaceTimeReactionType", a3->var2);
    xpc_dictionary_set_uint64(v5, "kWRMFaceTimeTimeDuration", a3->var3);
    -[WRMClient sendStatusUpdateInfoFaceTimeCalling:](self, "sendStatusUpdateInfoFaceTimeCalling:", v5);
    xpc_release(v5);
  }
}

- (void)dumpReport:(id)a3
{
  int ErrorLogLevelForModule;
  _BYTE *v5;
  NSObject **v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t uint64;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  NSObject *v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  NSObject *v44;
  uint64_t v45;
  uint64_t v46;
  NSObject *v47;
  NSObject *v48;
  uint64_t v49;
  uint64_t v50;
  NSObject *v51;
  NSObject *v52;
  uint64_t v53;
  uint64_t v54;
  NSObject *v55;
  NSObject *v56;
  uint64_t v57;
  uint64_t v58;
  NSObject *v59;
  NSObject *v60;
  uint64_t v61;
  uint64_t v62;
  NSObject *v63;
  NSObject *v64;
  uint64_t v65;
  uint64_t v66;
  NSObject *v67;
  NSObject *v68;
  uint64_t v69;
  uint64_t v70;
  NSObject *v71;
  NSObject *v72;
  uint64_t v73;
  uint64_t v74;
  NSObject *v75;
  NSObject *v76;
  uint64_t v77;
  uint64_t v78;
  NSObject *v79;
  NSObject *v80;
  uint64_t v81;
  uint64_t v82;
  NSObject *v83;
  NSObject *v84;
  uint64_t v85;
  uint64_t v86;
  NSObject *v87;
  NSObject *v88;
  uint64_t v89;
  uint64_t v90;
  NSObject *v91;
  NSObject *v92;
  uint64_t v93;
  uint64_t v94;
  NSObject *v95;
  NSObject *v96;
  uint64_t v97;
  uint64_t v98;
  NSObject *v99;
  NSObject *v100;
  uint64_t v101;
  uint64_t v102;
  NSObject *v103;
  NSObject *v104;
  uint64_t v105;
  uint64_t v106;
  NSObject *v107;
  NSObject *v108;
  uint64_t v109;
  uint64_t v110;
  NSObject *v111;
  NSObject *v112;
  uint64_t v113;
  uint64_t v114;
  NSObject *v115;
  NSObject *v116;
  uint64_t v117;
  uint64_t v118;
  NSObject *v119;
  NSObject *v120;
  uint64_t v121;
  uint64_t v122;
  NSObject *v123;
  NSObject *v124;
  uint64_t v125;
  uint64_t v126;
  NSObject *v127;
  NSObject *v128;
  uint64_t v129;
  uint64_t v130;
  NSObject *v131;
  NSObject *v132;
  uint64_t v133;
  uint64_t v134;
  NSObject *v135;
  NSObject *v136;
  uint64_t v137;
  uint64_t v138;
  NSObject *v139;
  NSObject *v140;
  uint64_t v141;
  int v142;
  uint64_t v143;
  __int16 v144;
  const char *v145;
  __int16 v146;
  int v147;
  __int16 v148;
  uint64_t v149;
  uint64_t v150;

  v150 = *MEMORY[0x1E0C80C00];
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  v5 = (_BYTE *)MEMORY[0x1E0CF2748];
  v6 = (NSObject **)MEMORY[0x1E0CF2758];
  if (ErrorLogLevelForModule >= 8)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *v6;
    v9 = *v6;
    if (*v5)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v142 = 136315650;
        v143 = v7;
        v144 = 2080;
        v145 = "-[WRMClient dumpReport:]";
        v146 = 1024;
        v147 = 371;
        _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d WRMClient: New report:", (uint8_t *)&v142, 0x1Cu);
      }
    }
    else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      -[WRMClient dumpReport:].cold.34();
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    v10 = VRTraceErrorLogLevelToCSTR();
    v11 = *v6;
    v12 = *v6;
    if (*v5)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64 = xpc_dictionary_get_uint64(a3, "kWRMAVConferencePeriodicReport_CallID");
        v142 = 136315906;
        v143 = v10;
        v144 = 2080;
        v145 = "-[WRMClient dumpReport:]";
        v146 = 1024;
        v147 = 372;
        v148 = 2048;
        v149 = uint64;
        _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_CallID: %llu", (uint8_t *)&v142, 0x26u);
      }
    }
    else if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      -[WRMClient dumpReport:].cold.33();
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    v14 = VRTraceErrorLogLevelToCSTR();
    v15 = *v6;
    v16 = *v6;
    if (*v5)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = xpc_dictionary_get_uint64(a3, "kWRMAVConferencePeriodicReport_Timestamp");
        v142 = 136315906;
        v143 = v14;
        v144 = 2080;
        v145 = "-[WRMClient dumpReport:]";
        v146 = 1024;
        v147 = 373;
        v148 = 2048;
        v149 = v17;
        _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_Timestamp: %llu", (uint8_t *)&v142, 0x26u);
      }
    }
    else if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      -[WRMClient dumpReport:].cold.32();
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    v18 = VRTraceErrorLogLevelToCSTR();
    v19 = *v6;
    v20 = *v6;
    if (*v5)
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = xpc_dictionary_get_uint64(a3, "kWRMAVConferencePeriodicReport_TotalPlaybacks");
        v142 = 136315906;
        v143 = v18;
        v144 = 2080;
        v145 = "-[WRMClient dumpReport:]";
        v146 = 1024;
        v147 = 374;
        v148 = 2048;
        v149 = v21;
        _os_log_impl(&dword_1D8A54000, v19, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_TotalPlaybacks: %llu", (uint8_t *)&v142, 0x26u);
      }
    }
    else if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      -[WRMClient dumpReport:].cold.31();
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    v22 = VRTraceErrorLogLevelToCSTR();
    v23 = *v6;
    v24 = *v6;
    if (*v5)
    {
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        v25 = xpc_dictionary_get_uint64(a3, "kWRMAVConferencePeriodicReport_PlaybacksInSpeech");
        v142 = 136315906;
        v143 = v22;
        v144 = 2080;
        v145 = "-[WRMClient dumpReport:]";
        v146 = 1024;
        v147 = 375;
        v148 = 2048;
        v149 = v25;
        _os_log_impl(&dword_1D8A54000, v23, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_PlaybacksInSpeech: %llu", (uint8_t *)&v142, 0x26u);
      }
    }
    else if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      -[WRMClient dumpReport:].cold.30();
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    v26 = VRTraceErrorLogLevelToCSTR();
    v27 = *v6;
    v28 = *v6;
    if (*v5)
    {
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        v29 = xpc_dictionary_get_uint64(a3, "kWRMAVConferencePeriodicReport_TotalErasures");
        v142 = 136315906;
        v143 = v26;
        v144 = 2080;
        v145 = "-[WRMClient dumpReport:]";
        v146 = 1024;
        v147 = 376;
        v148 = 2048;
        v149 = v29;
        _os_log_impl(&dword_1D8A54000, v27, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_TotalErasures: %llu", (uint8_t *)&v142, 0x26u);
      }
    }
    else if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      -[WRMClient dumpReport:].cold.29();
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    v30 = VRTraceErrorLogLevelToCSTR();
    v31 = *v6;
    v32 = *v6;
    if (*v5)
    {
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        v33 = xpc_dictionary_get_uint64(a3, "kWRMAVConferencePeriodicReport_ErasuresInSpeech");
        v142 = 136315906;
        v143 = v30;
        v144 = 2080;
        v145 = "-[WRMClient dumpReport:]";
        v146 = 1024;
        v147 = 377;
        v148 = 2048;
        v149 = v33;
        _os_log_impl(&dword_1D8A54000, v31, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_ErasuresInSpeech: %llu", (uint8_t *)&v142, 0x26u);
      }
    }
    else if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      -[WRMClient dumpReport:].cold.28();
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    v34 = VRTraceErrorLogLevelToCSTR();
    v35 = *v6;
    v36 = *v6;
    if (*v5)
    {
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        v37 = xpc_dictionary_get_uint64(a3, "kWRMAVConferencePeriodicReport_ErasuresInSilence");
        v142 = 136315906;
        v143 = v34;
        v144 = 2080;
        v145 = "-[WRMClient dumpReport:]";
        v146 = 1024;
        v147 = 378;
        v148 = 2048;
        v149 = v37;
        _os_log_impl(&dword_1D8A54000, v35, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_ErasuresInSilence: %llu", (uint8_t *)&v142, 0x26u);
      }
    }
    else if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
    {
      -[WRMClient dumpReport:].cold.27();
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    v38 = VRTraceErrorLogLevelToCSTR();
    v39 = *v6;
    v40 = *v6;
    if (*v5)
    {
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        v41 = xpc_dictionary_get_uint64(a3, "VidErasure");
        v142 = 136315906;
        v143 = v38;
        v144 = 2080;
        v145 = "-[WRMClient dumpReport:]";
        v146 = 1024;
        v147 = 379;
        v148 = 2048;
        v149 = v41;
        _os_log_impl(&dword_1D8A54000, v39, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_ErasuresInVideo: %llu", (uint8_t *)&v142, 0x26u);
      }
    }
    else if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
    {
      -[WRMClient dumpReport:].cold.26();
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    v42 = VRTraceErrorLogLevelToCSTR();
    v43 = *v6;
    v44 = *v6;
    if (*v5)
    {
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        v45 = xpc_dictionary_get_uint64(a3, "kWRMAVConferencePeriodicReport_TotalPacketsReceived");
        v142 = 136315906;
        v143 = v42;
        v144 = 2080;
        v145 = "-[WRMClient dumpReport:]";
        v146 = 1024;
        v147 = 380;
        v148 = 2048;
        v149 = v45;
        _os_log_impl(&dword_1D8A54000, v43, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_TotalPacketsReceived: %llu", (uint8_t *)&v142, 0x26u);
      }
    }
    else if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
    {
      -[WRMClient dumpReport:].cold.25();
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    v46 = VRTraceErrorLogLevelToCSTR();
    v47 = *v6;
    v48 = *v6;
    if (*v5)
    {
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
        v49 = xpc_dictionary_get_uint64(a3, "PriVidRxCnt");
        v142 = 136315906;
        v143 = v46;
        v144 = 2080;
        v145 = "-[WRMClient dumpReport:]";
        v146 = 1024;
        v147 = 381;
        v148 = 2048;
        v149 = v49;
        _os_log_impl(&dword_1D8A54000, v47, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_PrimaryVideoPacketReceivedCount: %llu", (uint8_t *)&v142, 0x26u);
      }
    }
    else if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
    {
      -[WRMClient dumpReport:].cold.24();
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    v50 = VRTraceErrorLogLevelToCSTR();
    v51 = *v6;
    v52 = *v6;
    if (*v5)
    {
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        v53 = xpc_dictionary_get_uint64(a3, "PriAudRxCnt");
        v142 = 136315906;
        v143 = v50;
        v144 = 2080;
        v145 = "-[WRMClient dumpReport:]";
        v146 = 1024;
        v147 = 382;
        v148 = 2048;
        v149 = v53;
        _os_log_impl(&dword_1D8A54000, v51, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_PrimaryAudioPacketReceivedCount: %llu", (uint8_t *)&v142, 0x26u);
      }
    }
    else if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
    {
      -[WRMClient dumpReport:].cold.23();
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    v54 = VRTraceErrorLogLevelToCSTR();
    v55 = *v6;
    v56 = *v6;
    if (*v5)
    {
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
      {
        v57 = xpc_dictionary_get_uint64(a3, "TotVidRxCnt");
        v142 = 136315906;
        v143 = v54;
        v144 = 2080;
        v145 = "-[WRMClient dumpReport:]";
        v146 = 1024;
        v147 = 383;
        v148 = 2048;
        v149 = v57;
        _os_log_impl(&dword_1D8A54000, v55, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d WRMClient:\tWRMAVConferencePeriodicReport_TotalVideoPacketReceivedCount: %llu", (uint8_t *)&v142, 0x26u);
      }
    }
    else if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
    {
      -[WRMClient dumpReport:].cold.22();
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    v58 = VRTraceErrorLogLevelToCSTR();
    v59 = *v6;
    v60 = *v6;
    if (*v5)
    {
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        v61 = xpc_dictionary_get_uint64(a3, "TotAudRxCnt");
        v142 = 136315906;
        v143 = v58;
        v144 = 2080;
        v145 = "-[WRMClient dumpReport:]";
        v146 = 1024;
        v147 = 384;
        v148 = 2048;
        v149 = v61;
        _os_log_impl(&dword_1D8A54000, v59, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_TotalAudioPacketReceivedCount: %llu", (uint8_t *)&v142, 0x26u);
      }
    }
    else if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
    {
      -[WRMClient dumpReport:].cold.21();
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    v62 = VRTraceErrorLogLevelToCSTR();
    v63 = *v6;
    v64 = *v6;
    if (*v5)
    {
      if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
      {
        v65 = xpc_dictionary_get_uint64(a3, "TotVidRxExpCnt");
        v142 = 136315906;
        v143 = v62;
        v144 = 2080;
        v145 = "-[WRMClient dumpReport:]";
        v146 = 1024;
        v147 = 385;
        v148 = 2048;
        v149 = v65;
        _os_log_impl(&dword_1D8A54000, v63, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_TotalVideoPacketExpectedReceivedCount: %llu", (uint8_t *)&v142, 0x26u);
      }
    }
    else if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
    {
      -[WRMClient dumpReport:].cold.20();
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    v66 = VRTraceErrorLogLevelToCSTR();
    v67 = *v6;
    v68 = *v6;
    if (*v5)
    {
      if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
      {
        v69 = xpc_dictionary_get_uint64(a3, "TotAudRxExpCnt");
        v142 = 136315906;
        v143 = v66;
        v144 = 2080;
        v145 = "-[WRMClient dumpReport:]";
        v146 = 1024;
        v147 = 386;
        v148 = 2048;
        v149 = v69;
        _os_log_impl(&dword_1D8A54000, v67, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_TotalAudioPacketExpectedReceivedCount: %llu", (uint8_t *)&v142, 0x26u);
      }
    }
    else if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
    {
      -[WRMClient dumpReport:].cold.19();
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    v70 = VRTraceErrorLogLevelToCSTR();
    v71 = *v6;
    v72 = *v6;
    if (*v5)
    {
      if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
      {
        v73 = xpc_dictionary_get_uint64(a3, "kWRMAVConferencePeriodicReport_SpeechPacketsReceived");
        v142 = 136315906;
        v143 = v70;
        v144 = 2080;
        v145 = "-[WRMClient dumpReport:]";
        v146 = 1024;
        v147 = 387;
        v148 = 2048;
        v149 = v73;
        _os_log_impl(&dword_1D8A54000, v71, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_SpeechPacketsReceived: %llu", (uint8_t *)&v142, 0x26u);
      }
    }
    else if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
    {
      -[WRMClient dumpReport:].cold.18();
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    v74 = VRTraceErrorLogLevelToCSTR();
    v75 = *v6;
    v76 = *v6;
    if (*v5)
    {
      if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
      {
        v77 = xpc_dictionary_get_uint64(a3, "kWRMMAVConferencePeriodicReport_SIDPacketsReceived");
        v142 = 136315906;
        v143 = v74;
        v144 = 2080;
        v145 = "-[WRMClient dumpReport:]";
        v146 = 1024;
        v147 = 388;
        v148 = 2048;
        v149 = v77;
        _os_log_impl(&dword_1D8A54000, v75, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d WRMClient:\tkWRMMAVConferencePeriodicReport_SIDPacketsReceived: %llu", (uint8_t *)&v142, 0x26u);
      }
    }
    else if (os_log_type_enabled(v76, OS_LOG_TYPE_DEBUG))
    {
      -[WRMClient dumpReport:].cold.17();
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    v78 = VRTraceErrorLogLevelToCSTR();
    v79 = *v6;
    v80 = *v6;
    if (*v5)
    {
      if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
      {
        v81 = xpc_dictionary_get_uint64(a3, "kWRMMAVConferencPeriodicReport_RTT");
        v142 = 136315906;
        v143 = v78;
        v144 = 2080;
        v145 = "-[WRMClient dumpReport:]";
        v146 = 1024;
        v147 = 389;
        v148 = 2048;
        v149 = v81;
        _os_log_impl(&dword_1D8A54000, v79, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d WRMClient:\tkWRMMAVConferencPeriodicReport_RTT: %llu", (uint8_t *)&v142, 0x26u);
      }
    }
    else if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG))
    {
      -[WRMClient dumpReport:].cold.16();
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    v82 = VRTraceErrorLogLevelToCSTR();
    v83 = *v6;
    v84 = *v6;
    if (*v5)
    {
      if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
      {
        v85 = xpc_dictionary_get_uint64(a3, "kWRMMAVConferencePeriodicReport_CountSinceRTTupdated");
        v142 = 136315906;
        v143 = v82;
        v144 = 2080;
        v145 = "-[WRMClient dumpReport:]";
        v146 = 1024;
        v147 = 390;
        v148 = 2048;
        v149 = v85;
        _os_log_impl(&dword_1D8A54000, v83, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d WRMClient:\tkWRMMAVConferencePeriodicReport_CountSinceRTTupdated: %llu", (uint8_t *)&v142, 0x26u);
      }
    }
    else if (os_log_type_enabled(v84, OS_LOG_TYPE_DEBUG))
    {
      -[WRMClient dumpReport:].cold.15();
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    v86 = VRTraceErrorLogLevelToCSTR();
    v87 = *v6;
    v88 = *v6;
    if (*v5)
    {
      if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
      {
        v89 = xpc_dictionary_get_uint64(a3, "kWRMAVConferencePeriodicReport_TxPacketsCount");
        v142 = 136315906;
        v143 = v86;
        v144 = 2080;
        v145 = "-[WRMClient dumpReport:]";
        v146 = 1024;
        v147 = 391;
        v148 = 2048;
        v149 = v89;
        _os_log_impl(&dword_1D8A54000, v87, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_TxPacketsCount: %llu", (uint8_t *)&v142, 0x26u);
      }
    }
    else if (os_log_type_enabled(v88, OS_LOG_TYPE_DEBUG))
    {
      -[WRMClient dumpReport:].cold.14();
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    v90 = VRTraceErrorLogLevelToCSTR();
    v91 = *v6;
    v92 = *v6;
    if (*v5)
    {
      if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
      {
        v93 = xpc_dictionary_get_uint64(a3, "kWRMAVConferencePeriodicReport_TxPacketLoss");
        v142 = 136315906;
        v143 = v90;
        v144 = 2080;
        v145 = "-[WRMClient dumpReport:]";
        v146 = 1024;
        v147 = 392;
        v148 = 2048;
        v149 = v93;
        _os_log_impl(&dword_1D8A54000, v91, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_TxPacketLoss: %llu", (uint8_t *)&v142, 0x26u);
      }
    }
    else if (os_log_type_enabled(v92, OS_LOG_TYPE_DEBUG))
    {
      -[WRMClient dumpReport:].cold.13();
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    v94 = VRTraceErrorLogLevelToCSTR();
    v95 = *v6;
    v96 = *v6;
    if (*v5)
    {
      if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
      {
        v97 = xpc_dictionary_get_uint64(a3, "kWRMAVConferencePeriodicReport_CountSinceTxPacketLossReported");
        v142 = 136315906;
        v143 = v94;
        v144 = 2080;
        v145 = "-[WRMClient dumpReport:]";
        v146 = 1024;
        v147 = 393;
        v148 = 2048;
        v149 = v97;
        _os_log_impl(&dword_1D8A54000, v95, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_CountSinceTxPacketLossReported: %llu", (uint8_t *)&v142, 0x26u);
      }
    }
    else if (os_log_type_enabled(v96, OS_LOG_TYPE_DEBUG))
    {
      -[WRMClient dumpReport:].cold.12();
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    v98 = VRTraceErrorLogLevelToCSTR();
    v99 = *v6;
    v100 = *v6;
    if (*v5)
    {
      if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
      {
        v101 = xpc_dictionary_get_uint64(a3, "kWRMAVConferencePeriodicReport_RxJitter");
        v142 = 136315906;
        v143 = v98;
        v144 = 2080;
        v145 = "-[WRMClient dumpReport:]";
        v146 = 1024;
        v147 = 394;
        v148 = 2048;
        v149 = v101;
        _os_log_impl(&dword_1D8A54000, v99, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_RxJitter: %llu", (uint8_t *)&v142, 0x26u);
      }
    }
    else if (os_log_type_enabled(v100, OS_LOG_TYPE_DEBUG))
    {
      -[WRMClient dumpReport:].cold.11();
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    v102 = VRTraceErrorLogLevelToCSTR();
    v103 = *v6;
    v104 = *v6;
    if (*v5)
    {
      if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
      {
        v105 = xpc_dictionary_get_uint64(a3, "kWRMAVConferencePeriodicReport_TxJitter");
        v142 = 136315906;
        v143 = v102;
        v144 = 2080;
        v145 = "-[WRMClient dumpReport:]";
        v146 = 1024;
        v147 = 395;
        v148 = 2048;
        v149 = v105;
        _os_log_impl(&dword_1D8A54000, v103, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_TxJitter: %llu", (uint8_t *)&v142, 0x26u);
      }
    }
    else if (os_log_type_enabled(v104, OS_LOG_TYPE_DEBUG))
    {
      -[WRMClient dumpReport:].cold.10();
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    v106 = VRTraceErrorLogLevelToCSTR();
    v107 = *v6;
    v108 = *v6;
    if (*v5)
    {
      if (os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
      {
        v109 = xpc_dictionary_get_uint64(a3, "kWRMAVConferencePeriodicReport_CountSinceTxJitterUpdated");
        v142 = 136315906;
        v143 = v106;
        v144 = 2080;
        v145 = "-[WRMClient dumpReport:]";
        v146 = 1024;
        v147 = 396;
        v148 = 2048;
        v149 = v109;
        _os_log_impl(&dword_1D8A54000, v107, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_CountSinceTxJitterUpdated: %llu", (uint8_t *)&v142, 0x26u);
      }
    }
    else if (os_log_type_enabled(v108, OS_LOG_TYPE_DEBUG))
    {
      -[WRMClient dumpReport:].cold.9();
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    v110 = VRTraceErrorLogLevelToCSTR();
    v111 = *v6;
    v112 = *v6;
    if (*v5)
    {
      if (os_log_type_enabled(v112, OS_LOG_TYPE_DEFAULT))
      {
        v113 = xpc_dictionary_get_uint64(a3, "kWRMAVConferencePeriodicReport_NominalJitterBufferQueueSize");
        v142 = 136315906;
        v143 = v110;
        v144 = 2080;
        v145 = "-[WRMClient dumpReport:]";
        v146 = 1024;
        v147 = 397;
        v148 = 2048;
        v149 = v113;
        _os_log_impl(&dword_1D8A54000, v111, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_NominalJitterBufferQueueSize: %llu", (uint8_t *)&v142, 0x26u);
      }
    }
    else if (os_log_type_enabled(v112, OS_LOG_TYPE_DEBUG))
    {
      -[WRMClient dumpReport:].cold.8();
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    v114 = VRTraceErrorLogLevelToCSTR();
    v115 = *v6;
    v116 = *v6;
    if (*v5)
    {
      if (os_log_type_enabled(v116, OS_LOG_TYPE_DEFAULT))
      {
        v117 = xpc_dictionary_get_uint64(a3, "kWRMAVConferencePeriodicReport_TargetJitterQueueSize");
        v142 = 136315906;
        v143 = v114;
        v144 = 2080;
        v145 = "-[WRMClient dumpReport:]";
        v146 = 1024;
        v147 = 398;
        v148 = 2048;
        v149 = v117;
        _os_log_impl(&dword_1D8A54000, v115, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_TargetJitterQueueSize: %llu", (uint8_t *)&v142, 0x26u);
      }
    }
    else if (os_log_type_enabled(v116, OS_LOG_TYPE_DEBUG))
    {
      -[WRMClient dumpReport:].cold.7();
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    v118 = VRTraceErrorLogLevelToCSTR();
    v119 = *v6;
    v120 = *v6;
    if (*v5)
    {
      if (os_log_type_enabled(v120, OS_LOG_TYPE_DEFAULT))
      {
        v121 = xpc_dictionary_get_uint64(a3, "kWRMAVConferencePeriodicReport_CallType");
        v142 = 136315906;
        v143 = v118;
        v144 = 2080;
        v145 = "-[WRMClient dumpReport:]";
        v146 = 1024;
        v147 = 399;
        v148 = 2048;
        v149 = v121;
        _os_log_impl(&dword_1D8A54000, v119, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_CallType: %llu", (uint8_t *)&v142, 0x26u);
      }
    }
    else if (os_log_type_enabled(v120, OS_LOG_TYPE_DEBUG))
    {
      -[WRMClient dumpReport:].cold.6();
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    v122 = VRTraceErrorLogLevelToCSTR();
    v123 = *v6;
    v124 = *v6;
    if (*v5)
    {
      if (os_log_type_enabled(v124, OS_LOG_TYPE_DEFAULT))
      {
        v125 = xpc_dictionary_get_uint64(a3, "kWRMAVConferencePeriodicReport_BWEstimation");
        v142 = 136315906;
        v143 = v122;
        v144 = 2080;
        v145 = "-[WRMClient dumpReport:]";
        v146 = 1024;
        v147 = 400;
        v148 = 2048;
        v149 = v125;
        _os_log_impl(&dword_1D8A54000, v123, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_BWEstimation: %llu", (uint8_t *)&v142, 0x26u);
      }
    }
    else if (os_log_type_enabled(v124, OS_LOG_TYPE_DEBUG))
    {
      -[WRMClient dumpReport:].cold.5();
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    v126 = VRTraceErrorLogLevelToCSTR();
    v127 = *v6;
    v128 = *v6;
    if (*v5)
    {
      if (os_log_type_enabled(v128, OS_LOG_TYPE_DEFAULT))
      {
        v129 = xpc_dictionary_get_uint64(a3, "kWRMAVConferencePeriodicReport_TargetBitRate");
        v142 = 136315906;
        v143 = v126;
        v144 = 2080;
        v145 = "-[WRMClient dumpReport:]";
        v146 = 1024;
        v147 = 401;
        v148 = 2048;
        v149 = v129;
        _os_log_impl(&dword_1D8A54000, v127, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_TargetBitRate: %llu", (uint8_t *)&v142, 0x26u);
      }
    }
    else if (os_log_type_enabled(v128, OS_LOG_TYPE_DEBUG))
    {
      -[WRMClient dumpReport:].cold.4();
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    v130 = VRTraceErrorLogLevelToCSTR();
    v131 = *v6;
    v132 = *v6;
    if (*v5)
    {
      if (os_log_type_enabled(v132, OS_LOG_TYPE_DEFAULT))
      {
        v133 = xpc_dictionary_get_uint64(a3, "kWRMAVConferencePeriodicReport_AdaptationPacketLoss");
        v142 = 136315906;
        v143 = v130;
        v144 = 2080;
        v145 = "-[WRMClient dumpReport:]";
        v146 = 1024;
        v147 = 402;
        v148 = 2048;
        v149 = v133;
        _os_log_impl(&dword_1D8A54000, v131, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_AdaptationPacketLoss: %llu", (uint8_t *)&v142, 0x26u);
      }
    }
    else if (os_log_type_enabled(v132, OS_LOG_TYPE_DEBUG))
    {
      -[WRMClient dumpReport:].cold.3();
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    v134 = VRTraceErrorLogLevelToCSTR();
    v135 = *v6;
    v136 = *v6;
    if (*v5)
    {
      if (os_log_type_enabled(v136, OS_LOG_TYPE_DEFAULT))
      {
        v137 = xpc_dictionary_get_uint64(a3, "kWRMAVConferencePeriodicReport_OneWayRelativeDelay");
        v142 = 136315906;
        v143 = v134;
        v144 = 2080;
        v145 = "-[WRMClient dumpReport:]";
        v146 = 1024;
        v147 = 403;
        v148 = 2048;
        v149 = v137;
        _os_log_impl(&dword_1D8A54000, v135, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_OneWayRelativeDelay: %llu", (uint8_t *)&v142, 0x26u);
      }
    }
    else if (os_log_type_enabled(v136, OS_LOG_TYPE_DEBUG))
    {
      -[WRMClient dumpReport:].cold.2();
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    v138 = VRTraceErrorLogLevelToCSTR();
    v139 = *v6;
    v140 = *v6;
    if (*v5)
    {
      if (os_log_type_enabled(v140, OS_LOG_TYPE_DEFAULT))
      {
        v141 = xpc_dictionary_get_uint64(a3, "kWRMAVConferencePeriodicReport_LinkType");
        v142 = 136315906;
        v143 = v138;
        v144 = 2080;
        v145 = "-[WRMClient dumpReport:]";
        v146 = 1024;
        v147 = 404;
        v148 = 2048;
        v149 = v141;
        _os_log_impl(&dword_1D8A54000, v139, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_LinkType: %llu", (uint8_t *)&v142, 0x26u);
      }
    }
    else if (os_log_type_enabled(v140, OS_LOG_TYPE_DEBUG))
    {
      -[WRMClient dumpReport:].cold.1();
    }
  }
}

- (void)sendReport:(id)a3
{
  xpc_object_t v5;
  xpc_object_t v6;
  NSObject *connectionQueue;
  _QWORD block[7];
  xpc_object_t values[2];
  char *keys[2];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  *(_OWORD *)keys = xmmword_1E9E56D30;
  v5 = xpc_uint64_create(0xCAuLL);
  values[0] = v5;
  values[1] = a3;
  v6 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __24__WRMClient_sendReport___block_invoke;
  block[3] = &unk_1E9E527D0;
  block[4] = self;
  block[5] = a3;
  block[6] = v6;
  dispatch_async(connectionQueue, block);
  xpc_release(v5);
  xpc_release(v6);
}

void __24__WRMClient_sendReport___block_invoke(uint64_t a1)
{
  _QWORD *v2;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2[1])
  {
    objc_msgSend(v2, "dumpReport:", *(_QWORD *)(a1 + 40));
    xpc_connection_send_message(*(xpc_connection_t *)(*(_QWORD *)(a1 + 32) + 8), *(xpc_object_t *)(a1 + 48));
  }
}

- (void)reportMetricsWifiCalling:(id *)a3
{
  xpc_object_t v5;

  if (self->_connection)
  {
    v5 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v5, "kWRMAVConferencePeriodicReport_CallID", a3->var21);
    xpc_dictionary_set_uint64(v5, "kWRMAVConferencePeriodicReport_Timestamp", a3->var0);
    xpc_dictionary_set_uint64(v5, "kWRMAVConferencePeriodicReport_TotalPlaybacks", a3->var1);
    xpc_dictionary_set_uint64(v5, "kWRMAVConferencePeriodicReport_PlaybacksInSpeech", a3->var2);
    xpc_dictionary_set_uint64(v5, "kWRMAVConferencePeriodicReport_TotalErasures", a3->var6);
    xpc_dictionary_set_uint64(v5, "kWRMAVConferencePeriodicReport_ErasuresInSpeech", a3->var8);
    xpc_dictionary_set_uint64(v5, "kWRMAVConferencePeriodicReport_ErasuresInSilence", a3->var7);
    xpc_dictionary_set_uint64(v5, "kWRMAVConferencePeriodicReport_TotalPacketsReceived", a3->var3);
    xpc_dictionary_set_uint64(v5, "kWRMAVConferencePeriodicReport_SpeechPacketsReceived", a3->var5);
    xpc_dictionary_set_uint64(v5, "kWRMMAVConferencePeriodicReport_SIDPacketsReceived", a3->var4);
    xpc_dictionary_set_uint64(v5, "kWRMMAVConferencPeriodicReport_RTT", a3->var17);
    xpc_dictionary_set_uint64(v5, "kWRMMAVConferencePeriodicReport_CountSinceRTTupdated", a3->var18);
    xpc_dictionary_set_uint64(v5, "kWRMAVConferencePeriodicReport_TxPacketsCount", a3->var14);
    xpc_dictionary_set_uint64(v5, "kWRMAVConferencePeriodicReport_TxPacketLoss", a3->var12);
    xpc_dictionary_set_uint64(v5, "kWRMAVConferencePeriodicReport_CountSinceTxPacketLossReported", a3->var13);
    xpc_dictionary_set_uint64(v5, "kWRMAVConferencePeriodicReport_RxJitter", a3->var15);
    xpc_dictionary_set_uint64(v5, "kWRMAVConferencePeriodicReport_TxJitter", a3->var10);
    xpc_dictionary_set_uint64(v5, "kWRMAVConferencePeriodicReport_CountSinceTxJitterUpdated", a3->var16);
    xpc_dictionary_set_uint64(v5, "kWRMAVConferencePeriodicReport_NominalJitterBufferQueueSize", a3->var19);
    xpc_dictionary_set_uint64(v5, "kWRMAVConferencePeriodicReport_TargetJitterQueueSize", a3->var20);
    xpc_dictionary_set_uint64(v5, "kWRMAVConferencePeriodicReport_LinkType", a3->var27);
    -[WRMClient sendReport:](self, "sendReport:", v5);
    xpc_release(v5);
  }
}

- (void)reportImmediateMetric:(int)a3 value:(unint64_t)a4
{
  const char *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  xpc_object_t v14;
  xpc_object_t v15;
  xpc_object_t v16;
  NSObject *connectionQueue;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  _QWORD v23[6];
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  _BYTE v31[18];
  xpc_object_t values[2];
  char *keys[2];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (self->_metricsConfig.reportImmediateMetricsEnabled)
  {
    if (a3)
    {
      if (a3 != 1)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v21 = VRTraceErrorLogLevelToCSTR();
          v22 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316162;
            v25 = v21;
            v26 = 2080;
            v27 = "-[WRMClient reportImmediateMetric:value:]";
            v28 = 1024;
            v29 = 478;
            v30 = 1024;
            *(_DWORD *)v31 = a3;
            *(_WORD *)&v31[4] = 2048;
            *(_QWORD *)&v31[6] = a4;
            _os_log_error_impl(&dword_1D8A54000, v22, OS_LOG_TYPE_ERROR, " [%s] %s:%d WRMClient: Immediate reporting not supported for metric type: %d: %llu", buf, 0x2Cu);
          }
        }
        return;
      }
      v7 = "IsMedStall";
    }
    else
    {
      v7 = "AnyPoorCon";
    }
    v14 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v14, v7, a4);
    *(_OWORD *)keys = xmmword_1E9E56D30;
    v15 = xpc_uint64_create(0xC9uLL);
    values[0] = v15;
    values[1] = v14;
    v16 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
    connectionQueue = self->_connectionQueue;
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __41__WRMClient_reportImmediateMetric_value___block_invoke;
    v23[3] = &unk_1E9E52238;
    v23[4] = self;
    v23[5] = v16;
    dispatch_async(connectionQueue, v23);
    xpc_release(v15);
    xpc_release(v16);
    xpc_release(v14);
    if ((int)VRTraceGetErrorLogLevelForModule() < 8)
      return;
    v18 = VRTraceErrorLogLevelToCSTR();
    v19 = *MEMORY[0x1E0CF2758];
    v20 = *MEMORY[0x1E0CF2758];
    if (*MEMORY[0x1E0CF2748])
    {
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        return;
      *(_DWORD *)buf = 136316162;
      v25 = v18;
      v26 = 2080;
      v27 = "-[WRMClient reportImmediateMetric:value:]";
      v28 = 1024;
      v29 = 500;
      v30 = 2080;
      *(_QWORD *)v31 = v7;
      *(_WORD *)&v31[8] = 2048;
      *(_QWORD *)&v31[10] = a4;
      v11 = " [%s] %s:%d WRMClient: Immediate metric reported:%s: %llu";
      v12 = v19;
      v13 = 48;
      goto LABEL_14;
    }
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136316162;
      v25 = v18;
      v26 = 2080;
      v27 = "-[WRMClient reportImmediateMetric:value:]";
      v28 = 1024;
      v29 = 500;
      v30 = 2080;
      *(_QWORD *)v31 = v7;
      *(_WORD *)&v31[8] = 2048;
      *(_QWORD *)&v31[10] = a4;
      _os_log_debug_impl(&dword_1D8A54000, v19, OS_LOG_TYPE_DEBUG, " [%s] %s:%d WRMClient: Immediate metric reported:%s: %llu", buf, 0x30u);
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 8)
      return;
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    v10 = *MEMORY[0x1E0CF2758];
    if (*MEMORY[0x1E0CF2748])
    {
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        return;
      *(_DWORD *)buf = 136315650;
      v25 = v8;
      v26 = 2080;
      v27 = "-[WRMClient reportImmediateMetric:value:]";
      v28 = 1024;
      v29 = 466;
      v11 = " [%s] %s:%d Not reporting WRM metrics as directed by the storebag settings";
      v12 = v9;
      v13 = 28;
LABEL_14:
      _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
      return;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[WRMClient reportImmediateMetric:value:].cold.1();
  }
}

void __41__WRMClient_reportImmediateMetric_value___block_invoke(uint64_t a1)
{
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8))
    xpc_connection_send_message(*(xpc_connection_t *)(*(_QWORD *)(a1 + 32) + 8), *(xpc_object_t *)(a1 + 40));
}

- (void)reportMetricsFaceTimeCalling:(id *)a3
{
  xpc_object_t v5;
  uint64_t var29;
  uint64_t var30;
  uint64_t var31;
  uint64_t var32;
  uint64_t var33;
  uint64_t var34;
  uint64_t var9;
  uint64_t v13;
  NSObject *v14;
  unint64_t var21;
  unint64_t var22;
  unint64_t var27;
  unint64_t var28;
  unint64_t var1;
  unint64_t var6;
  unint64_t var8;
  unint64_t var4;
  unint64_t var19;
  uint64_t v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  unint64_t v32;
  __int16 v33;
  unint64_t v34;
  __int16 v35;
  unint64_t v36;
  __int16 v37;
  unint64_t v38;
  __int16 v39;
  unint64_t v40;
  __int16 v41;
  unint64_t v42;
  __int16 v43;
  unint64_t v44;
  __int16 v45;
  unint64_t v46;
  __int16 v47;
  unint64_t v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  uint64_t v52;
  __int16 v53;
  uint64_t v54;
  __int16 v55;
  uint64_t v56;
  __int16 v57;
  uint64_t v58;
  __int16 v59;
  uint64_t v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  if (self->_connection)
  {
    v5 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v5, "kWRMAVConferencePeriodicReport_CallID", a3->var21);
    xpc_dictionary_set_uint64(v5, "kWRMAVConferencePeriodicReport_Timestamp", a3->var0);
    xpc_dictionary_set_uint64(v5, "kWRMAVConferencePeriodicReport_TotalPlaybacks", a3->var1);
    xpc_dictionary_set_uint64(v5, "kWRMAVConferencePeriodicReport_PlaybacksInSpeech", a3->var2);
    xpc_dictionary_set_uint64(v5, "kWRMAVConferencePeriodicReport_TotalErasures", a3->var6);
    xpc_dictionary_set_uint64(v5, "kWRMAVConferencePeriodicReport_ErasuresInSpeech", a3->var8);
    xpc_dictionary_set_uint64(v5, "kWRMAVConferencePeriodicReport_ErasuresInSilence", a3->var7);
    xpc_dictionary_set_uint64(v5, "kWRMAVConferencePeriodicReport_TotalPacketsReceived", a3->var3);
    xpc_dictionary_set_uint64(v5, "kWRMAVConferencePeriodicReport_SpeechPacketsReceived", a3->var5);
    xpc_dictionary_set_uint64(v5, "kWRMMAVConferencePeriodicReport_SIDPacketsReceived", a3->var4);
    xpc_dictionary_set_uint64(v5, "kWRMMAVConferencPeriodicReport_RTT", a3->var17);
    xpc_dictionary_set_uint64(v5, "kWRMMAVConferencePeriodicReport_CountSinceRTTupdated", a3->var18);
    xpc_dictionary_set_uint64(v5, "kWRMAVConferencePeriodicReport_TxPacketsCount", a3->var14);
    xpc_dictionary_set_uint64(v5, "kWRMAVConferencePeriodicReport_TxPacketLoss", a3->var12);
    xpc_dictionary_set_uint64(v5, "kWRMAVConferencePeriodicReport_CountSinceTxPacketLossReported", a3->var13);
    xpc_dictionary_set_uint64(v5, "kWRMAVConferencePeriodicReport_RxJitter", a3->var15);
    xpc_dictionary_set_uint64(v5, "kWRMAVConferencePeriodicReport_TxJitter", a3->var10);
    xpc_dictionary_set_uint64(v5, "kWRMAVConferencePeriodicReport_CountSinceTxJitterUpdated", a3->var16);
    xpc_dictionary_set_uint64(v5, "kWRMAVConferencePeriodicReport_NominalJitterBufferQueueSize", a3->var19);
    xpc_dictionary_set_uint64(v5, "kWRMAVConferencePeriodicReport_TargetJitterQueueSize", a3->var20);
    xpc_dictionary_set_uint64(v5, "kWRMAVConferencePeriodicReport_CallType", a3->var22);
    xpc_dictionary_set_uint64(v5, "kWRMAVConferencePeriodicReport_BWEstimation", a3->var23);
    xpc_dictionary_set_uint64(v5, "kWRMAVConferencePeriodicReport_TargetBitRate", a3->var24);
    xpc_dictionary_set_uint64(v5, "kWRMAVConferencePeriodicReport_AdaptationPacketLoss", a3->var26);
    xpc_dictionary_set_uint64(v5, "kWRMAVConferencePeriodicReport_OneWayRelativeDelay", a3->var25);
    xpc_dictionary_set_uint64(v5, "kWRMAVConferencePeriodicReport_LinkType", a3->var27);
    xpc_dictionary_set_uint64(v5, "kWRMAVConferencePeriodicReport_VideoPause", a3->var28);
    if (self->_metricsConfig.reportRtpErasureMetricsEnabled)
    {
      var29 = a3->var29;
      var30 = a3->var30;
      var31 = a3->var31;
      var32 = a3->var32;
      var33 = a3->var33;
      var34 = a3->var34;
    }
    else
    {
      var33 = 10;
      var31 = 10;
      var29 = 10;
      var30 = 10;
      var32 = 10;
      var34 = 10;
    }
    v24 = var29;
    xpc_dictionary_set_uint64(v5, "PriVidRxCnt", var29);
    xpc_dictionary_set_uint64(v5, "PriAudRxCnt", var30);
    xpc_dictionary_set_uint64(v5, "TotVidRxCnt", var31);
    xpc_dictionary_set_uint64(v5, "TotAudRxCnt", var32);
    xpc_dictionary_set_uint64(v5, "TotVidRxExpCnt", var33);
    xpc_dictionary_set_uint64(v5, "TotAudRxExpCnt", var34);
    if (self->_mediaControlInfoVersion == 2)
    {
      if (self->_metricsConfig.reportRtpErasureMetricsEnabled)
        var9 = a3->var9;
      else
        var9 = 0;
      xpc_dictionary_set_uint64(v5, "VidErasure", var9);
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        var21 = a3->var21;
        var22 = a3->var22;
        var27 = a3->var27;
        var28 = a3->var28;
        var1 = a3->var1;
        var6 = a3->var6;
        var8 = a3->var8;
        var4 = a3->var4;
        var19 = a3->var19;
        *(_DWORD *)buf = 136319490;
        v26 = v13;
        v27 = 2080;
        v28 = "-[WRMClient reportMetricsFaceTimeCalling:]";
        v29 = 1024;
        v30 = 559;
        v31 = 2048;
        v32 = var21;
        v33 = 2048;
        v34 = var22;
        v35 = 2048;
        v36 = var27;
        v37 = 2048;
        v38 = var28;
        v39 = 2048;
        v40 = var1;
        v41 = 2048;
        v42 = var6;
        v43 = 2048;
        v44 = var8;
        v45 = 2048;
        v46 = var4;
        v47 = 2048;
        v48 = var19;
        v49 = 2048;
        v50 = v24;
        v51 = 2048;
        v52 = var30;
        v53 = 2048;
        v54 = var31;
        v55 = 2048;
        v56 = var32;
        v57 = 2048;
        v58 = var33;
        v59 = 2048;
        v60 = var34;
        _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d WRM reporting metrics callID=%llu callType=%llu linkType=%llu videoPause=%llu playBackCount=%llu erasureCount=%llu erasureCountSpeech=%llu packetsReceivedSilence=%llu nominalJitterBufferDelay=%llu primaryVideoPacketsReceived=%llu primaryAudioPacketsReceived=%llu totalVideoPacketsReceived=%llu totalAudioPacketsReceived=%llu totalVideoPacketsExpected=%llu totalAudioPacketsExpected=%llu", buf, 0xB2u);
      }
    }
    -[WRMClient sendReport:](self, "sendReport:", v5);
    xpc_release(v5);
  }
}

- (void)setConfiguration:(id *)a3
{
  void *v4;

  v4 = (void *)MEMORY[0x1DF086F1C](&self->_wrmClientDelegate, a2);
  objc_msgSend(v4, "setWRMMetricConfig:", a3);
  if (v4)
    CFRelease(v4);
}

- (void)processWRMCoexMetrics:(id)a3 isAlertedMode:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  void *v8;

  if (a3)
  {
    v4 = a4;
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4), CFSTR("WRMAlertedMode"));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_rssiThreshold), CFSTR("WRMwRSSIThreshold"));
    if (xpc_dictionary_get_value(a3, "kwRSSI"))
      objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", xpc_dictionary_get_int64(a3, "kwRSSI")), CFSTR("WRMwRSSI"));
    if (xpc_dictionary_get_value(a3, "kwSNR"))
      objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", xpc_dictionary_get_int64(a3, "kwSNR")), CFSTR("WRMwSNR"));
    if (xpc_dictionary_get_value(a3, "kwCCA"))
      objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", xpc_dictionary_get_int64(a3, "kwCCA")), CFSTR("WRMwCCA"));
    if (xpc_dictionary_get_value(a3, "kwPER"))
      objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", xpc_dictionary_get_int64(a3, "kwPER")), CFSTR("WRMwPacketLoss"));
    if (xpc_dictionary_get_value(a3, "kcSigStrength"))
      objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", xpc_dictionary_get_int64(a3, "kcSigStrength")), CFSTR("WRMcSigStrength"));
    if (xpc_dictionary_get_value(a3, "kcSignalBar"))
      objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", xpc_dictionary_get_int64(a3, "kcSignalBar")), CFSTR("WRMcSignalBar"));
    if (xpc_dictionary_get_value(a3, "kcServingCellType"))
      objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", xpc_dictionary_get_int64(a3, "kcServingCellType")), CFSTR("WRMcServingCellType"));
    if (objc_msgSend(v7, "count"))
    {
      v8 = (void *)MEMORY[0x1DF086F1C](&self->_wrmClientDelegate);
      objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("WRMCoexIsLocal"));
      objc_msgSend(v8, "setWRMCoexMetrics:", v7);
      if (v8)
        CFRelease(v8);
    }
  }
}

- (void)processNotificationList:(id)a3
{
  int count;
  size_t v6;
  id *p_wrmClientDelegate;
  uint64_t v8;
  xpc_object_t value;
  const char *string;
  void *v11;
  __int128 v12;
  _OWORD v13[7];
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  memset(v13, 0, sizeof(v13));
  count = xpc_array_get_count(a3);
  if (count >= 1)
  {
    v6 = 0;
    p_wrmClientDelegate = &self->_wrmClientDelegate;
    v8 = count;
    do
    {
      value = xpc_array_get_value(a3, v6);
      LODWORD(v12) = xpc_dictionary_get_uint64(value, "kWRMApplicationType");
      DWORD1(v12) = xpc_dictionary_get_uint64(value, "kWRMLinkType");
      *((_QWORD *)&v12 + 1) = xpc_dictionary_get_uint64(value, "kWRMLinkTypeChangeReasonCode");
      string = xpc_dictionary_get_string(value, "kWRMLinkTypeChangeReasonString");
      strncpy((char *)v13, string, 0x80uLL);
      HIBYTE(v14) = 0;
      *((_QWORD *)&v15 + 1) = xpc_dictionary_get_uint64(value, "kWRMCurrentLinkMovBandwidthEstimateMax");
      *(_QWORD *)&v15 = xpc_dictionary_get_uint64(value, "kWRMCurrentLinkMovBandwidthEstimateMin");
      v11 = (void *)MEMORY[0x1DF086F1C](p_wrmClientDelegate);
      objc_msgSend(v11, "setWRMNotification:", &v12);
      if (v11)
        CFRelease(v11);
      ++v6;
    }
    while (v8 != v6);
  }
}

- (void)setPreWarmState:(BOOL)a3
{
  _BOOL8 v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  uint64_t v11;
  NSObject *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  WRMClient *v20;
  __int16 v21;
  _BOOL4 v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (self->_metricsConfig.allowPreWarmCellEnabled)
  {
    v4 = a3;
    v5 = (void *)MEMORY[0x1DF086F1C](&self->_wrmClientDelegate, a2);
    objc_msgSend(v5, "setPreWarmState:", v4);
    if (v5)
      CFRelease(v5);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v13 = 136316162;
        v14 = v6;
        v15 = 2080;
        v16 = "-[WRMClient setPreWarmState:]";
        v17 = 1024;
        v18 = 652;
        v19 = 2048;
        v20 = self;
        v21 = 1024;
        v22 = v4;
        v8 = " [%s] %s:%d WRMClient(%p): Get PreWarmState %d from iRAT";
        v9 = v7;
        v10 = 44;
LABEL_10:
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v13, v10);
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v13 = 136315906;
      v14 = v11;
      v15 = 2080;
      v16 = "-[WRMClient setPreWarmState:]";
      v17 = 1024;
      v18 = 645;
      v19 = 2048;
      v20 = self;
      v8 = " [%s] %s:%d WRMClient(%p): Ignoring prewarm signal from iRAT as directed by storebagsettings";
      v9 = v12;
      v10 = 38;
      goto LABEL_10;
    }
  }
}

- (void)setRSSIThresholdEnabled:(BOOL)a3
{
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  int rssiThreshold;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  WRMClient *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (a3)
    v4 = +[GKSConnectivitySettings getWRMRSSIThresholdValue:](GKSConnectivitySettings, "getWRMRSSIThresholdValue:", 4294967216);
  else
    v4 = -80;
  self->_rssiThreshold = +[VCDefaults integerValueForKey:defaultValue:](VCDefaults, "integerValueForKey:defaultValue:", CFSTR("wrmRSSIThreshold"), v4);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      rssiThreshold = self->_rssiThreshold;
      v8 = 136316162;
      v9 = v5;
      v10 = 2080;
      v11 = "-[WRMClient setRSSIThresholdEnabled:]";
      v12 = 1024;
      v13 = 665;
      v14 = 2048;
      v15 = self;
      v16 = 1024;
      v17 = rssiThreshold;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d WRMClient(%p): Picked WRM RSSI Threshold value %d", (uint8_t *)&v8, 0x2Cu);
    }
  }
}

- (void)updateMetricsConfig:(id)a3
{
  self->_metricsConfig = ($3F05CAD367707F359A92B6E46C9E9A87)a3;
}

- (int)mediaControlInfoVersion
{
  return self->_mediaControlInfoVersion;
}

- (void)setMediaControlInfoVersion:(int)a3
{
  self->_mediaControlInfoVersion = a3;
}

- (void)dumpReport:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_5_8();
  OUTLINED_FUNCTION_6_16("kWRMAVConferencePeriodicReport_LinkType", v0);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_13_6();
  OUTLINED_FUNCTION_9_0(&dword_1D8A54000, v1, v2, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_LinkType: %llu", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)dumpReport:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_5_8();
  OUTLINED_FUNCTION_6_16("kWRMAVConferencePeriodicReport_OneWayRelativeDelay", v0);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_13_6();
  OUTLINED_FUNCTION_9_0(&dword_1D8A54000, v1, v2, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_OneWayRelativeDelay: %llu", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)dumpReport:.cold.3()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_5_8();
  OUTLINED_FUNCTION_6_16("kWRMAVConferencePeriodicReport_AdaptationPacketLoss", v0);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_13_6();
  OUTLINED_FUNCTION_9_0(&dword_1D8A54000, v1, v2, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_AdaptationPacketLoss: %llu", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)dumpReport:.cold.4()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_5_8();
  OUTLINED_FUNCTION_6_16("kWRMAVConferencePeriodicReport_TargetBitRate", v0);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_13_6();
  OUTLINED_FUNCTION_9_0(&dword_1D8A54000, v1, v2, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_TargetBitRate: %llu", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)dumpReport:.cold.5()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_5_8();
  OUTLINED_FUNCTION_6_16("kWRMAVConferencePeriodicReport_BWEstimation", v0);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_13_6();
  OUTLINED_FUNCTION_9_0(&dword_1D8A54000, v1, v2, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_BWEstimation: %llu", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)dumpReport:.cold.6()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_5_8();
  OUTLINED_FUNCTION_6_16("kWRMAVConferencePeriodicReport_CallType", v0);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_13_6();
  OUTLINED_FUNCTION_9_0(&dword_1D8A54000, v1, v2, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_CallType: %llu", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)dumpReport:.cold.7()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_5_8();
  OUTLINED_FUNCTION_6_16("kWRMAVConferencePeriodicReport_TargetJitterQueueSize", v0);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_13_6();
  OUTLINED_FUNCTION_9_0(&dword_1D8A54000, v1, v2, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_TargetJitterQueueSize: %llu", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)dumpReport:.cold.8()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_5_8();
  OUTLINED_FUNCTION_6_16("kWRMAVConferencePeriodicReport_NominalJitterBufferQueueSize", v0);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_13_6();
  OUTLINED_FUNCTION_9_0(&dword_1D8A54000, v1, v2, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_NominalJitterBufferQueueSize: %llu", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)dumpReport:.cold.9()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_5_8();
  OUTLINED_FUNCTION_6_16("kWRMAVConferencePeriodicReport_CountSinceTxJitterUpdated", v0);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_13_6();
  OUTLINED_FUNCTION_9_0(&dword_1D8A54000, v1, v2, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_CountSinceTxJitterUpdated: %llu", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)dumpReport:.cold.10()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_5_8();
  OUTLINED_FUNCTION_6_16("kWRMAVConferencePeriodicReport_TxJitter", v0);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_13_6();
  OUTLINED_FUNCTION_9_0(&dword_1D8A54000, v1, v2, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_TxJitter: %llu", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)dumpReport:.cold.11()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_5_8();
  OUTLINED_FUNCTION_6_16("kWRMAVConferencePeriodicReport_RxJitter", v0);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_13_6();
  OUTLINED_FUNCTION_9_0(&dword_1D8A54000, v1, v2, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_RxJitter: %llu", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)dumpReport:.cold.12()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_5_8();
  OUTLINED_FUNCTION_6_16("kWRMAVConferencePeriodicReport_CountSinceTxPacketLossReported", v0);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_13_6();
  OUTLINED_FUNCTION_9_0(&dword_1D8A54000, v1, v2, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_CountSinceTxPacketLossReported: %llu", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)dumpReport:.cold.13()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_5_8();
  OUTLINED_FUNCTION_6_16("kWRMAVConferencePeriodicReport_TxPacketLoss", v0);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_13_6();
  OUTLINED_FUNCTION_9_0(&dword_1D8A54000, v1, v2, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_TxPacketLoss: %llu", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)dumpReport:.cold.14()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_5_8();
  OUTLINED_FUNCTION_6_16("kWRMAVConferencePeriodicReport_TxPacketsCount", v0);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_13_6();
  OUTLINED_FUNCTION_9_0(&dword_1D8A54000, v1, v2, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_TxPacketsCount: %llu", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)dumpReport:.cold.15()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_5_8();
  OUTLINED_FUNCTION_6_16("kWRMMAVConferencePeriodicReport_CountSinceRTTupdated", v0);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_13_6();
  OUTLINED_FUNCTION_9_0(&dword_1D8A54000, v1, v2, " [%s] %s:%d WRMClient:\tkWRMMAVConferencePeriodicReport_CountSinceRTTupdated: %llu", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)dumpReport:.cold.16()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_5_8();
  OUTLINED_FUNCTION_6_16("kWRMMAVConferencPeriodicReport_RTT", v0);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_13_6();
  OUTLINED_FUNCTION_9_0(&dword_1D8A54000, v1, v2, " [%s] %s:%d WRMClient:\tkWRMMAVConferencPeriodicReport_RTT: %llu", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)dumpReport:.cold.17()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_5_8();
  OUTLINED_FUNCTION_6_16("kWRMMAVConferencePeriodicReport_SIDPacketsReceived", v0);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_13_6();
  OUTLINED_FUNCTION_9_0(&dword_1D8A54000, v1, v2, " [%s] %s:%d WRMClient:\tkWRMMAVConferencePeriodicReport_SIDPacketsReceived: %llu", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)dumpReport:.cold.18()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_5_8();
  OUTLINED_FUNCTION_6_16("kWRMAVConferencePeriodicReport_SpeechPacketsReceived", v0);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_13_6();
  OUTLINED_FUNCTION_9_0(&dword_1D8A54000, v1, v2, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_SpeechPacketsReceived: %llu", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)dumpReport:.cold.19()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_5_8();
  OUTLINED_FUNCTION_6_16("TotAudRxExpCnt", v0);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_13_6();
  OUTLINED_FUNCTION_9_0(&dword_1D8A54000, v1, v2, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_TotalAudioPacketExpectedReceivedCount: %llu", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)dumpReport:.cold.20()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_5_8();
  OUTLINED_FUNCTION_6_16("TotVidRxExpCnt", v0);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_13_6();
  OUTLINED_FUNCTION_9_0(&dword_1D8A54000, v1, v2, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_TotalVideoPacketExpectedReceivedCount: %llu", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)dumpReport:.cold.21()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_5_8();
  OUTLINED_FUNCTION_6_16("TotAudRxCnt", v0);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_13_6();
  OUTLINED_FUNCTION_9_0(&dword_1D8A54000, v1, v2, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_TotalAudioPacketReceivedCount: %llu", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)dumpReport:.cold.22()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_5_8();
  OUTLINED_FUNCTION_6_16("TotVidRxCnt", v0);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_13_6();
  OUTLINED_FUNCTION_9_0(&dword_1D8A54000, v1, v2, " [%s] %s:%d WRMClient:\tWRMAVConferencePeriodicReport_TotalVideoPacketReceivedCount: %llu", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)dumpReport:.cold.23()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_5_8();
  OUTLINED_FUNCTION_6_16("PriAudRxCnt", v0);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_13_6();
  OUTLINED_FUNCTION_9_0(&dword_1D8A54000, v1, v2, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_PrimaryAudioPacketReceivedCount: %llu", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)dumpReport:.cold.24()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_5_8();
  OUTLINED_FUNCTION_6_16("PriVidRxCnt", v0);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_13_6();
  OUTLINED_FUNCTION_9_0(&dword_1D8A54000, v1, v2, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_PrimaryVideoPacketReceivedCount: %llu", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)dumpReport:.cold.25()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_5_8();
  OUTLINED_FUNCTION_6_16("kWRMAVConferencePeriodicReport_TotalPacketsReceived", v0);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_13_6();
  OUTLINED_FUNCTION_9_0(&dword_1D8A54000, v1, v2, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_TotalPacketsReceived: %llu", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)dumpReport:.cold.26()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_5_8();
  OUTLINED_FUNCTION_6_16("VidErasure", v0);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_13_6();
  OUTLINED_FUNCTION_9_0(&dword_1D8A54000, v1, v2, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_ErasuresInVideo: %llu", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)dumpReport:.cold.27()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_5_8();
  OUTLINED_FUNCTION_6_16("kWRMAVConferencePeriodicReport_ErasuresInSilence", v0);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_13_6();
  OUTLINED_FUNCTION_9_0(&dword_1D8A54000, v1, v2, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_ErasuresInSilence: %llu", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)dumpReport:.cold.28()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_5_8();
  OUTLINED_FUNCTION_6_16("kWRMAVConferencePeriodicReport_ErasuresInSpeech", v0);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_13_6();
  OUTLINED_FUNCTION_9_0(&dword_1D8A54000, v1, v2, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_ErasuresInSpeech: %llu", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)dumpReport:.cold.29()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_5_8();
  OUTLINED_FUNCTION_6_16("kWRMAVConferencePeriodicReport_TotalErasures", v0);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_13_6();
  OUTLINED_FUNCTION_9_0(&dword_1D8A54000, v1, v2, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_TotalErasures: %llu", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)dumpReport:.cold.30()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_5_8();
  OUTLINED_FUNCTION_6_16("kWRMAVConferencePeriodicReport_PlaybacksInSpeech", v0);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_13_6();
  OUTLINED_FUNCTION_9_0(&dword_1D8A54000, v1, v2, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_PlaybacksInSpeech: %llu", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)dumpReport:.cold.31()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_5_8();
  OUTLINED_FUNCTION_6_16("kWRMAVConferencePeriodicReport_TotalPlaybacks", v0);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_13_6();
  OUTLINED_FUNCTION_9_0(&dword_1D8A54000, v1, v2, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_TotalPlaybacks: %llu", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)dumpReport:.cold.32()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_5_8();
  OUTLINED_FUNCTION_6_16("kWRMAVConferencePeriodicReport_Timestamp", v0);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_13_6();
  OUTLINED_FUNCTION_9_0(&dword_1D8A54000, v1, v2, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_Timestamp: %llu", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)dumpReport:.cold.33()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_5_8();
  OUTLINED_FUNCTION_6_16("kWRMAVConferencePeriodicReport_CallID", v0);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_13_6();
  OUTLINED_FUNCTION_9_0(&dword_1D8A54000, v1, v2, " [%s] %s:%d WRMClient:\tkWRMAVConferencePeriodicReport_CallID: %llu", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)dumpReport:.cold.34()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_3(&dword_1D8A54000, v0, v1, " [%s] %s:%d WRMClient: New report:", v2, v3, v4, v5, v6);
}

- (void)reportImmediateMetric:value:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_3(&dword_1D8A54000, v0, v1, " [%s] %s:%d Not reporting WRM metrics as directed by the storebag settings", v2, v3, v4, v5, v6);
}

@end
