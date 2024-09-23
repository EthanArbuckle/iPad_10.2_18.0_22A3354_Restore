@implementation VCTransportSession

- (VCTransportSession)initWithNotificationQueue:(id)a3 reportingAgent:(opaqueRTCReporting *)a4
{
  return -[VCTransportSession initWithNotificationQueue:reportingAgent:notificationHandler:eventHandler:handlerQueue:context:](self, "initWithNotificationQueue:reportingAgent:notificationHandler:eventHandler:handlerQueue:context:", a3, a4, 0, 0, 0, 0);
}

- (VCTransportSession)initWithNotificationQueue:(id)a3 reportingAgent:(opaqueRTCReporting *)a4 notificationHandler:(void *)a5 eventHandler:(void *)a6 handlerQueue:(id)a7 context:(void *)a8
{
  VCTransportSession *v14;
  opaqueRTCReporting *v15;
  unsigned int v16;
  NSObject *CustomRootQueue;
  objc_super v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v19.receiver = self;
  v19.super_class = (Class)VCTransportSession;
  v14 = -[VCTransportSession init](&v19, sel_init);
  if (v14)
  {
    +[VCVTPWrapper startVTP](VCVTPWrapper, "startVTP");
    v14->_isCallActive = 1;
    if (a4)
      v15 = (opaqueRTCReporting *)CFRetain(a4);
    else
      v15 = 0;
    v14->_reportingAgent = v15;
    if (!v14->_basebandNotificationRegistrationToken)
    {
      do
      {
        v16 = hwrandom();
        v14->_basebandNotificationRegistrationToken = v16;
      }
      while (!v16);
    }
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(58);
    v14->_stateQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.VideoConference.VCTransportSession.stateQueue", 0, CustomRootQueue);
    if (a3)
      dispatch_retain((dispatch_object_t)a3);
    else
      a3 = dispatch_queue_create_with_target_V2("com.apple.VideoConference.VCTransportSession.notificationQueue", 0, CustomRootQueue);
    v14->_notificationQueue = (OS_dispatch_queue *)a3;
    v14->_streams = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    pthread_mutex_init(&v14->_stateLock, 0);
    v14->_nwMonitorLock._os_unfair_lock_opaque = 0;
    v14->_notificationHandler = a5;
    v14->_packetEventHandler = a6;
    v14->_handlerContext = a8;
    if (a7)
    {
      v14->_handlerQueue = (OS_dispatch_queue *)a7;
      dispatch_retain((dispatch_object_t)a7);
    }
  }
  return v14;
}

- (void)dealloc
{
  NSMutableArray *streams;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  opaqueRTCReporting *reportingAgent;
  NSObject *notificationQueue;
  NSObject *stateQueue;
  NSObject *handlerQueue;
  objc_super v12;
  _BYTE v13[128];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  streams = self->_streams;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](streams, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(streams);
        -[VCTransportSession deregisterNotificationForTransportStream:](self, "deregisterNotificationForTransportStream:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i));
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](streams, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
    }
    while (v5);
  }

  reportingAgent = self->_reportingAgent;
  if (reportingAgent)
    CFRelease(reportingAgent);
  _Block_release(self->_eventHandler);
  notificationQueue = self->_notificationQueue;
  if (notificationQueue)
    dispatch_release(notificationQueue);
  stateQueue = self->_stateQueue;
  if (stateQueue)
    dispatch_release(stateQueue);

  -[VCTransportSession destroyNWMonitor](self, "destroyNWMonitor");
  handlerQueue = self->_handlerQueue;
  if (handlerQueue)
    dispatch_release(handlerQueue);
  pthread_mutex_destroy(&self->_stateLock);
  +[VCVTPWrapper stopVTP](VCVTPWrapper, "stopVTP");
  v12.receiver = self;
  v12.super_class = (Class)VCTransportSession;
  -[VCTransportSession dealloc](&v12, sel_dealloc);
}

- (void)start
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[VCTransportSession start]"), 0));
}

- (void)stop
{
  NSObject *stateQueue;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  stateQueue = self->_stateQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __26__VCTransportSession_stop__block_invoke;
  v3[3] = &unk_1E9E521C0;
  v3[4] = self;
  dispatch_async(stateQueue, v3);
}

void __26__VCTransportSession_stop__block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v8 = v2;
      v9 = 2080;
      v10 = "-[VCTransportSession stop]_block_invoke";
      v11 = 1024;
      v12 = 169;
      _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d stopping transport session", buf, 0x1Cu);
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "cleanupBaseband");
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 24);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__VCTransportSession_stop__block_invoke_51;
  block[3] = &unk_1E9E521C0;
  block[4] = v4;
  dispatch_async(v5, block);
}

uint64_t __26__VCTransportSession_stop__block_invoke_51(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(a1 + 32), "eventHandler");
  if (result)
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "eventHandler");
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(v3 + 16))(v3, 16, 0);
  }
  return result;
}

- (void)callEventHandlerWithEvent:(unsigned int)a3 info:(id)a4
{
  NSObject *notificationQueue;
  _QWORD v5[6];
  unsigned int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  notificationQueue = self->_notificationQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__VCTransportSession_callEventHandlerWithEvent_info___block_invoke;
  v5[3] = &unk_1E9E522D8;
  v6 = a3;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(notificationQueue, v5);
}

void __53__VCTransportSession_callEventHandlerWithEvent_info___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  int v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "eventHandler"))
  {
    v2 = objc_msgSend(*(id *)(a1 + 32), "eventHandler");
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v2 + 16))(v2, *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 40));
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_DWORD *)(a1 + 48);
      v6 = 136315906;
      v7 = v3;
      v8 = 2080;
      v9 = "-[VCTransportSession callEventHandlerWithEvent:info:]_block_invoke";
      v10 = 1024;
      v11 = 187;
      v12 = 1024;
      v13 = v5;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Could not dispatch transportSessionEvent %d as eventHandler is nil", (uint8_t *)&v6, 0x22u);
    }
  }
}

- (void)handleTransportStreamDeactivated:(OpaqueVCTransportStream *)a3
{
  CMNotificationCenterGetDefaultLocalCenter();
  CMNotificationCenterRemoveListener();
  pthread_mutex_lock(&self->_stateLock);
  -[NSMutableArray removeObject:](self->_streams, "removeObject:", a3);
  pthread_mutex_unlock(&self->_stateLock);
}

- (int)createTransportStream:(OpaqueVCTransportStream *)a3 withType:(unsigned int)a4 options:(id)a5
{
  uint64_t v6;
  int v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  int v15;
  uint64_t v17;
  NSObject *v18;
  int v19;
  CFTypeRef cf;
  unsigned int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v21 = -1;
  cf = 0;
  if (!a3)
  {
    v14 = -2144665599;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v17 = VRTraceErrorLogLevelToCSTR();
      v18 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCTransportSession createTransportStream:withType:options:].cold.1(v17, v18);
    }
    goto LABEL_17;
  }
  v6 = *(_QWORD *)&a4;
  v9 = -[VCTransportSession createVFD:forStreamType:](self, "createVFD:forStreamType:", &v21);
  if (v9 < 0)
  {
    v14 = v9;
LABEL_17:
    v13 = 0;
    goto LABEL_10;
  }
  v10 = +[VCTransportSession trafficClassForStreamType:](VCTransportSession, "trafficClassForStreamType:", v6);
  if ((_DWORD)v10)
  {
    v11 = v10;
    if (a5)
      v12 = (void *)objc_msgSend(a5, "mutableCopy");
    else
      v12 = (void *)objc_opt_new();
    v13 = v12;
    objc_msgSend(v12, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v11), CFSTR("TrafficClass"));
    v14 = VCTransportStreamVTPCreate((const __CFAllocator *)*MEMORY[0x1E0C9AE00], v21, (uint64_t)v13, &cf);
    if ((v14 & 0x80000000) == 0)
    {
      v21 = -1;
      CMNotificationCenterGetDefaultLocalCenter();
      v15 = CMNotificationCenterAddListener();
      if (v15)
      {
        if (v15 >= 0)
          v19 = v15;
        else
          v19 = -v15;
        v14 = v19 | 0xD02B0000;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCTransportSession createTransportStream:withType:options:].cold.2();
        }
      }
      else
      {
        pthread_mutex_lock(&self->_stateLock);
        -[NSMutableArray addObject:](self->_streams, "addObject:", cf);
        pthread_mutex_unlock(&self->_stateLock);
        *a3 = (OpaqueVCTransportStream *)cf;
        cf = 0;
      }
    }
  }
  else
  {
    v13 = 0;
    v14 = -2144665599;
  }
LABEL_10:

  VCCloseVFDIfValid(v21);
  if (cf)
    CFRelease(cf);
  return v14;
}

- (int)createVFD:(int *)a3 forStreamType:(unsigned int)a4
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), *(_QWORD *)&a4, "-[VCTransportSession createVFD:forStreamType:]"), 0));
}

- (int)deregisterNotificationForTransportStream:(OpaqueVCTransportStream *)a3
{
  int v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t CMBaseObject;
  _QWORD *v8;
  uint64_t (*v9)(uint64_t);
  int v10;
  int v11;
  int v13;

  CMNotificationCenterGetDefaultLocalCenter();
  v4 = CMNotificationCenterRemoveListener();
  if (v4)
  {
    if (v4 >= 0)
      v13 = v4;
    else
      v13 = -v4;
    v6 = v13 | 0xD02B0000;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCTransportSession deregisterNotificationForTransportStream:].cold.2();
    }
  }
  else
  {
    v6 = -802016786;
    CMBaseObject = VCPacketFilterGetCMBaseObject(a3, v5);
    v8 = *(_QWORD **)(CMBaseObjectGetVTable() + 8);
    if (*v8 >= 2uLL)
    {
      v9 = (uint64_t (*)(uint64_t))v8[8];
      if (v9)
      {
        v10 = v9(CMBaseObject);
        if (v10 >= 0)
          v11 = v10;
        else
          v11 = -v10;
        if (!v10)
          return 0;
        v6 = v11 | 0xD0320000;
      }
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCTransportSession deregisterNotificationForTransportStream:].cold.1();
    }
  }
  return v6;
}

- (BOOL)isCallActive
{
  return self->_isCallActive;
}

- (void)setCallActive:(BOOL)a3
{
  NSObject *stateQueue;
  _QWORD block[5];
  BOOL v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__VCTransportSession_setCallActive___block_invoke;
  block[3] = &unk_1E9E521E8;
  v5 = a3;
  block[4] = self;
  dispatch_async(stateQueue, block);
}

void __36__VCTransportSession_setCallActive___block_invoke(uint64_t a1)
{
  int v1;
  uint64_t v2;
  int v4;
  uint64_t *v5;
  const void *v6;

  v1 = *(unsigned __int8 *)(a1 + 40);
  v2 = *(_QWORD *)(a1 + 32);
  if (v1 != *(unsigned __int8 *)(v2 + 8))
  {
    *(_BYTE *)(v2 + 8) = v1;
    v4 = *(unsigned __int8 *)(a1 + 40);
    v5 = *(uint64_t **)(a1 + 32);
    if (v4)
    {
      v6 = (const void *)VCConnectionManager_CopyConnectionForQuality(v5[9], 1);
      objc_msgSend(*(id *)(a1 + 32), "updateBasebandForConnection:", v6);
      if (v6)
        CFRelease(v6);
    }
    else
    {
      objc_msgSend(v5, "cleanupBaseband");
    }
  }
}

- (void)setConnectionSelectionVersionWithLocalFrameworkVersion:(id)a3 remoteFrameworkVersion:(id)a4
{
  uint64_t v7;
  NSObject *v8;
  NSString *localFrameworkVersion;
  NSString *remoteFrameworkVersion;
  int v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  NSString *v18;
  __int16 v19;
  NSString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];

  self->_localFrameworkVersion = (NSString *)objc_msgSend(a3, "copy");
  self->_remoteFrameworkVersion = (NSString *)objc_msgSend(a4, "copy");
  -[VCConnectionManager setConnectionSelectionVersionWithLocalFrameworkVersion:remoteFrameworkVersion:](self->_connectionManager, "setConnectionSelectionVersionWithLocalFrameworkVersion:remoteFrameworkVersion:", a3, a4);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      localFrameworkVersion = self->_localFrameworkVersion;
      remoteFrameworkVersion = self->_remoteFrameworkVersion;
      v11 = 136316162;
      v12 = v7;
      v13 = 2080;
      v14 = "-[VCTransportSession setConnectionSelectionVersionWithLocalFrameworkVersion:remoteFrameworkVersion:]";
      v15 = 1024;
      v16 = 289;
      v17 = 2112;
      v18 = localFrameworkVersion;
      v19 = 2112;
      v20 = remoteFrameworkVersion;
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCTransportSession: Setting connection selection version: local='%@', remote='%@'", (uint8_t *)&v11, 0x30u);
    }
  }
}

- (int)updateBasebandForConnection:(id)a3
{
  int v5;
  VCConnectionProtocol *registeredConnection;
  uint64_t v7;
  NSObject *v8;
  unsigned int basebandNotificationRegistrationToken;
  NSObject *stateQueue;
  _QWORD v12[6];
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  VCTransportSession *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  unsigned int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = VCConnection_ConnectionID((uint64_t)a3);
  registeredConnection = self->_registeredConnection;
  if (registeredConnection && VCConnection_ConnectionID((uint64_t)registeredConnection) == v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        basebandNotificationRegistrationToken = self->_basebandNotificationRegistrationToken;
        *(_DWORD *)buf = 136316418;
        v14 = v7;
        v15 = 2080;
        v16 = "-[VCTransportSession updateBasebandForConnection:]";
        v17 = 1024;
        v18 = 296;
        v19 = 2048;
        v20 = self;
        v21 = 1024;
        v22 = v5;
        v23 = 1024;
        v24 = basebandNotificationRegistrationToken;
        _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCTransportSession[%p]: Skip registering baseband notifications for the same connection with id %d, registrationToken %u", buf, 0x32u);
      }
    }
  }
  else
  {
    stateQueue = self->_stateQueue;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __50__VCTransportSession_updateBasebandForConnection___block_invoke;
    v12[3] = &unk_1E9E52238;
    v12[4] = self;
    v12[5] = a3;
    dispatch_async(stateQueue, v12);
  }
  return 0;
}

void __50__VCTransportSession_updateBasebandForConnection___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  const char *v5;
  const char *v6;
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  const char *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "cleanupBaseband");
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) && VCConnection_IsLocalOnCellular(*(_QWORD *)(a1 + 40)))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v2 = VRTraceErrorLogLevelToCSTR();
      v3 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v5 = *(const char **)(a1 + 32);
        v4 = *(void **)(a1 + 40);
        if (v4)
          v6 = (const char *)objc_msgSend((id)objc_msgSend(v4, "description"), "UTF8String");
        else
          v6 = "<nil>";
        v7 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 12);
        v14 = 136316418;
        v15 = v2;
        v16 = 2080;
        v17 = "-[VCTransportSession updateBasebandForConnection:]_block_invoke";
        v18 = 1024;
        v19 = 303;
        v20 = 2048;
        v21 = v5;
        v22 = 2080;
        v23 = v6;
        v24 = 1024;
        v25 = v7;
        _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCTransportSession[%p]: Registering for baseband notifications for connection %s, registrationToken %u", (uint8_t *)&v14, 0x36u);
      }
    }
    v8 = objc_msgSend(*(id *)(a1 + 32), "registerBasebandNotificationsForConnection:", *(_QWORD *)(a1 + 40));
    if (v8 < 0)
    {
      v9 = v8;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v10 = VRTraceErrorLogLevelToCSTR();
        v11 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v12 = *(void **)(a1 + 40);
          if (v12)
            v13 = (const char *)objc_msgSend((id)objc_msgSend(v12, "description"), "UTF8String");
          else
            v13 = "<nil>";
          v14 = 136316162;
          v15 = v10;
          v16 = 2080;
          v17 = "-[VCTransportSession updateBasebandForConnection:]_block_invoke";
          v18 = 1024;
          v19 = 309;
          v20 = 2080;
          v21 = v13;
          v22 = 1024;
          LODWORD(v23) = v9;
          _os_log_error_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_ERROR, " [%s] %s:%d Baseband notification registration for connection %s failed %x", (uint8_t *)&v14, 0x2Cu);
        }
      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "setRegisteredConnection:", *(_QWORD *)(a1 + 40));
    }
  }
}

- (void)cleanupBaseband
{
  uint64_t v3;
  NSObject *v4;
  int v5;
  unsigned int basebandNotificationRegistrationToken;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  VCTransportSession *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  unsigned int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (self->_registeredConnection)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v5 = VCConnection_ConnectionID((uint64_t)self->_registeredConnection);
        basebandNotificationRegistrationToken = self->_basebandNotificationRegistrationToken;
        v7 = 136316418;
        v8 = v3;
        v9 = 2080;
        v10 = "-[VCTransportSession cleanupBaseband]";
        v11 = 1024;
        v12 = 319;
        v13 = 2048;
        v14 = self;
        v15 = 1024;
        v16 = v5;
        v17 = 1024;
        v18 = basebandNotificationRegistrationToken;
        _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCTransportSession[%p]: Deregistering baseband notifications for connectionId %d, registrationToken %u", (uint8_t *)&v7, 0x32u);
      }
    }
    -[VCTransportSession deregisterBasebandNotifications](self, "deregisterBasebandNotifications");
    -[VCTransportSession setRegisteredConnection:](self, "setRegisteredConnection:", 0);
  }
}

- (int)registerBasebandNotificationsForConnection:(id)a3
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[VCTransportSession registerBasebandNotificationsForConnection:]"), 0));
}

- (void)deregisterBasebandNotifications
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[VCTransportSession deregisterBasebandNotifications]"), 0));
}

- (int)flushBasebandQueueWithPayloads:(id)a3 flushCount:(unsigned int *)a4
{
  NSObject *stateQueue;
  uint64_t v6;
  NSObject *v7;
  int v8;
  _QWORD block[8];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  _QWORD v16[2];
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v15 = 0;
  v16[0] = &v15;
  v16[1] = 0x2020000000;
  v17 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__VCTransportSession_flushBasebandQueueWithPayloads_flushCount___block_invoke;
  block[3] = &unk_1E9E56A38;
  block[4] = self;
  block[5] = a3;
  block[6] = &v15;
  block[7] = &v11;
  dispatch_sync(stateQueue, block);
  if (a4)
    *a4 = *((_DWORD *)v12 + 6);
  if ((*(_DWORD *)(v16[0] + 24) & 0x80000000) != 0 && (int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCTransportSession flushBasebandQueueWithPayloads:flushCount:].cold.1(v6, (uint64_t)v16, v7);
  }
  v8 = *(_DWORD *)(v16[0] + 24);
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);
  return v8;
}

void __64__VCTransportSession_flushBasebandQueueWithPayloads_flushCount___block_invoke(uint64_t a1)
{
  const void *v2;
  const void *v3;
  int v4;
  uint64_t v5;

  v2 = (const void *)VCConnectionManager_CopyConnectionForQuality(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72), 1);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "flushBasebandQueueForConnection:payloadInfoList:", v2, *(_QWORD *)(a1 + 40));
  if ((*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) & 0x80000000) == 0)
    ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  v3 = (const void *)VCConnectionManager_CopyConnectionForQuality(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72), 0);
  if ((VCConnection_Equal((uint64_t)v3, (uint64_t)v2) & 1) != 0)
    goto LABEL_7;
  v4 = objc_msgSend(*(id *)(a1 + 32), "flushBasebandQueueForConnection:payloadInfoList:", v3, *(_QWORD *)(a1 + 40));
  if ((v4 & 0x80000000) == 0)
    ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if ((*(_DWORD *)(v5 + 24) & 0x80000000) == 0)
  {
LABEL_7:
    if (!v2)
      goto LABEL_9;
    goto LABEL_8;
  }
  *(_DWORD *)(v5 + 24) = v4;
  if (v2)
LABEL_8:
    CFRelease(v2);
LABEL_9:
  if (v3)
    CFRelease(v3);
}

- (int)flushBasebandQueueForConnection:(id)a3 payloadInfoList:(id)a4
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), a4, "-[VCTransportSession flushBasebandQueueForConnection:payloadInfoList:]"), 0));
}

- (int)getSignalStrengthBars:(int *)a3 displayBars:(int *)a4 maxDisplayBars:(int *)a5
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), a4, a5, "-[VCTransportSession getSignalStrengthBars:displayBars:maxDisplayBars:]"), 0));
}

- (int)updateQualityIndicator:(int)a3 isIPv6:(BOOL)a4
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), a4, "-[VCTransportSession updateQualityIndicator:isIPv6:]"), 0));
}

- (int)detailedErrorCode
{
  return 1100;
}

- (BOOL)isHandoverSupported
{
  return 1;
}

- (BOOL)isRemoteOSPreLion
{
  return 0;
}

- (unsigned)connectionSetupRTTEstimate
{
  return 0;
}

- (BOOL)getConnectionSetupData:(id *)a3 withOptions:(id)a4 error:(id *)a5
{
  return 1;
}

+ (unsigned)trafficClassForStreamType:(unsigned int)a3
{
  unsigned int result;
  uint64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  unsigned int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a3 - 1 < 6)
    return dword_1D910DB90[a3 - 1];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    v7 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (!v7)
      return result;
    v8 = 136315906;
    v9 = v5;
    v10 = 2080;
    v11 = "+[VCTransportSession trafficClassForStreamType:]";
    v12 = 1024;
    v13 = 438;
    v14 = 1024;
    v15 = a3;
    _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Invalid stream type %d", (uint8_t *)&v8, 0x22u);
  }
  return 0;
}

+ (int)vtpPacketTypeForStreamType:(unsigned int)a3
{
  int result;
  uint64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  unsigned int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a3 - 1 < 6)
    return dword_1D910DBA8[a3 - 1];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    v7 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (!v7)
      return result;
    v8 = 136315906;
    v9 = v5;
    v10 = 2080;
    v11 = "+[VCTransportSession vtpPacketTypeForStreamType:]";
    v12 = 1024;
    v13 = 458;
    v14 = 1024;
    v15 = a3;
    _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Invalid stream type %d", (uint8_t *)&v8, 0x22u);
  }
  return 0;
}

- (int)networkInterfaceType
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[VCTransportSession networkInterfaceType]"), 0));
}

- (unsigned)networkMTU
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[VCTransportSession networkMTU]"), 0));
}

- (BOOL)isIPv6
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[VCTransportSession isIPv6]"), 0));
}

- (void)setupNWMonitor
{
  os_unfair_lock_s *p_nwMonitorLock;

  if (self->_shouldSetupNWMonitor)
  {
    p_nwMonitorLock = &self->_nwMonitorLock;
    os_unfair_lock_lock(&self->_nwMonitorLock);
    if (!self->_monitor)
      self->_monitor = -[VCTransportSession createNWMonitor](self, "createNWMonitor");
    os_unfair_lock_unlock(p_nwMonitorLock);
  }
}

- (void)destroyNWMonitor
{
  os_unfair_lock_s *p_nwMonitorLock;
  tagVCNWConnectionMonitor *monitor;

  p_nwMonitorLock = &self->_nwMonitorLock;
  os_unfair_lock_lock(&self->_nwMonitorLock);
  monitor = self->_monitor;
  if (monitor)
  {
    VCNWConnectionMonitor_Destroy((uint64_t)monitor);
    self->_monitor = 0;
  }
  os_unfair_lock_unlock(p_nwMonitorLock);
}

- (void)setupNWMonitorNotificationHandler
{
  os_unfair_lock_s *p_nwMonitorLock;

  p_nwMonitorLock = &self->_nwMonitorLock;
  os_unfair_lock_lock(&self->_nwMonitorLock);
  VCNWConnectionMonitor_SetNotificationHandler(self->_monitor, (uint64_t)self->_handlerQueue, (uint64_t)self->_handlerContext, (uint64_t)self->_notificationHandler);
  os_unfair_lock_unlock(p_nwMonitorLock);
}

- (void)setupNWMonitorPacketEventHandler
{
  os_unfair_lock_s *p_nwMonitorLock;

  p_nwMonitorLock = &self->_nwMonitorLock;
  os_unfair_lock_lock(&self->_nwMonitorLock);
  VCNWConnectionMonitor_SetPacketEventHandler(self->_monitor, (uint64_t)self->_handlerQueue, (uint64_t)self->_handlerContext, (uint64_t)self->_packetEventHandler);
  os_unfair_lock_unlock(p_nwMonitorLock);
}

- (tagVCNWConnectionMonitor)createNWMonitor
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[VCTransportSession createNWMonitor]"), 0));
}

- (void)addNetworkAssertionWithInterfaceType:(int)a3
{
  int v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  if (self->_didAddNetworkAssertion)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v10 = 136315650;
        v11 = v8;
        v12 = 2080;
        v13 = "-[VCTransportSession addNetworkAssertionWithInterfaceType:]";
        v14 = 1024;
        v15 = 520;
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Unexpected: Adding assertion multiple times", (uint8_t *)&v10, 0x1Cu);
      }
    }
  }
  else
  {
    v5 = VCFeatureFlagManager_SkipNonInfraWiFiAssertion();
    if (a3 == 3 && v5)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v6 = VRTraceErrorLogLevelToCSTR();
        v7 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v10 = 136315650;
          v11 = v6;
          v12 = 2080;
          v13 = "-[VCTransportSession addNetworkAssertionWithInterfaceType:]";
          v14 = 1024;
          v15 = 525;
          _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d NetworkAgent assertion added", (uint8_t *)&v10, 0x1Cu);
        }
      }
      -[VCNetworkAgent addAssertion](+[VCNetworkAgent sharedInstance](VCNetworkAgent, "sharedInstance"), "addAssertion");
      self->_didAddNetworkAssertion = 1;
    }
  }
}

- (void)removeNetworkAssertion
{
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
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  if (self->_didAddNetworkAssertion)
  {
    -[VCNetworkAgent removeAssertion](+[VCNetworkAgent sharedInstance](VCNetworkAgent, "sharedInstance"), "removeAssertion");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v5 = 136315650;
        v6 = v3;
        v7 = 2080;
        v8 = "-[VCTransportSession removeNetworkAssertion]";
        v9 = 1024;
        v10 = 539;
        _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d NetworkAgent assertion removed", (uint8_t *)&v5, 0x1Cu);
      }
    }
    self->_didAddNetworkAssertion = 0;
  }
}

- (id)eventHandler
{
  return self->_eventHandler;
}

- (void)setEventHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (VCConnectionManager)connectionManager
{
  return self->_connectionManager;
}

- (BOOL)useCompressedConnectionData
{
  return self->_useCompressedConnectionData;
}

- (void)setUseCompressedConnectionData:(BOOL)a3
{
  self->_useCompressedConnectionData = a3;
}

- (BOOL)requiresWiFi
{
  return self->_requiresWiFi;
}

- (void)setRequiresWiFi:(BOOL)a3
{
  self->_requiresWiFi = a3;
}

- (TimingCollection)perfTimings
{
  return self->_perfTimings;
}

- (void)setPerfTimings:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (unsigned)basebandNotificationRegistrationToken
{
  return self->_basebandNotificationRegistrationToken;
}

- (NSObject)connectionSetupPiggybackBlob
{
  return self->_connectionSetupPiggybackBlob;
}

- (void)setConnectionSetupPiggybackBlob:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (VCConnectionProtocol)registeredConnection
{
  return self->_registeredConnection;
}

- (void)setRegisteredConnection:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 160);
}

- (BOOL)shouldSetupNWMonitor
{
  return self->_shouldSetupNWMonitor;
}

- (void)setShouldSetupNWMonitor:(BOOL)a3
{
  self->_shouldSetupNWMonitor = a3;
}

- (OS_dispatch_queue)nwMonitorEventHandlerQueue
{
  return self->_handlerQueue;
}

- (tagVCNWConnectionMonitor)nwMonitor
{
  return self->_monitor;
}

- (BOOL)shouldIgnoreConnectionRefusedError
{
  return self->_shouldIgnoreConnectionRefusedError;
}

- (void)setShouldIgnoreConnectionRefusedError:(BOOL)a3
{
  self->_shouldIgnoreConnectionRefusedError = a3;
}

- (void)createTransportStream:(uint64_t)a1 withType:(NSObject *)a2 options:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = 136315650;
  v3 = a1;
  v4 = 2080;
  v5 = "-[VCTransportSession createTransportStream:withType:options:]";
  v6 = 1024;
  v7 = 209;
  _os_log_error_impl(&dword_1D8A54000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d NULL transportStream", (uint8_t *)&v2, 0x1Cu);
  OUTLINED_FUNCTION_3();
}

- (void)createTransportStream:withType:options:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to add notification listener %d", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)deregisterNotificationForTransportStream:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d VCTransportStreamNotificationBarrier failed %x", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)deregisterNotificationForTransportStream:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Remove listener failed %d", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)flushBasebandQueueWithPayloads:(NSObject *)a3 flushCount:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[22];

  *(_DWORD *)v3 = 136315906;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2080;
  *(_QWORD *)&v3[14] = "-[VCTransportSession flushBasebandQueueWithPayloads:flushCount:]";
  OUTLINED_FUNCTION_5(&dword_1D8A54000, a2, a3, " [%s] %s:%d Baseband flush failed (%x)", *(const char **)v3, *(const char **)&v3[8], (unint64_t)"-[VCTransportSession flushBasebandQueueWithPayloads:flushCount:]" >> 16, 364);
  OUTLINED_FUNCTION_3();
}

@end
