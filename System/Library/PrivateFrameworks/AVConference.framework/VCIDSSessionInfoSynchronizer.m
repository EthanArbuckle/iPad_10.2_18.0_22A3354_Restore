@implementation VCIDSSessionInfoSynchronizer

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  objc_storeWeak(&self->_delegate, 0);
  -[VCIDSSessionInfoSynchronizer deregisterPeriodicTask](self, "deregisterPeriodicTask");
  objc_storeWeak(&self->_reportingAgentWeak, 0);

  _Block_release(self->_peerSubscribedStreamCallback);
  _Block_release(self->_peerPublishedStreamCallback);
  _Block_release(self->_errorReponseCallback);

  dispatch_release((dispatch_object_t)self->_stateQueue);
  v3.receiver = self;
  v3.super_class = (Class)VCIDSSessionInfoSynchronizer;
  -[VCIDSSessionInfoSynchronizer dealloc](&v3, sel_dealloc);
}

- (void)setVCIDSSessionInfoSubscribedStreamIDs:(id)a3
{
  NSObject *stateQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    stateQueue = self->_stateQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __71__VCIDSSessionInfoSynchronizer_setVCIDSSessionInfoSubscribedStreamIDs___block_invoke;
    block[3] = &unk_1E9E52238;
    block[4] = a3;
    block[5] = self;
    dispatch_async(stateQueue, block);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCIDSSessionInfoSynchronizer setVCIDSSessionInfoSubscribedStreamIDs:].cold.1();
  }
}

void __71__VCIDSSessionInfoSynchronizer_setVCIDSSessionInfoSubscribedStreamIDs___block_invoke(uint64_t a1)
{
  void *v2;
  const char *v3;
  char *v4;
  os_log_t *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  char *__lasts;
  char *__str;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    __str = 0;
    v2 = *(void **)(a1 + 32);
    v3 = v2 ? (const char *)objc_msgSend((id)objc_msgSend(v2, "description"), "UTF8String") : "<nil>";
    asprintf(&__str, "%s", v3);
    if (__str)
    {
      __lasts = 0;
      v4 = strtok_r(__str, "\n", &__lasts);
      v5 = (os_log_t *)MEMORY[0x1E0CF2758];
      do
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v6 = VRTraceErrorLogLevelToCSTR();
          v7 = *v5;
          if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316162;
            v13 = v6;
            v14 = 2080;
            v15 = "-[VCIDSSessionInfoSynchronizer setVCIDSSessionInfoSubscribedStreamIDs:]_block_invoke";
            v16 = 1024;
            v17 = 95;
            v18 = 2080;
            v19 = "streamIDsDictionary=";
            v20 = 2080;
            v21 = v4;
            _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s %s", buf, 0x30u);
          }
        }
        v4 = strtok_r(0, "\n", &__lasts);
      }
      while (v4);
      free(__str);
    }
  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "isEqualToDictionary:", *(_QWORD *)(a1 + 32)))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v13 = v8;
        v14 = 2080;
        v15 = "-[VCIDSSessionInfoSynchronizer setVCIDSSessionInfoSubscribedStreamIDs:]_block_invoke";
        v16 = 1024;
        v17 = 98;
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d subscribedStreamIDs is the same. Don't subscribe again", buf, 0x1Cu);
      }
    }
  }
  else
  {

    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32) = objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
    *(_DWORD *)(*(_QWORD *)(a1 + 40) + 168) = 0;
    objc_msgSend(*(id *)(a1 + 40), "sendVCIDSSessionInfoSubscribedStreamIDs:", *(_QWORD *)(a1 + 32));
  }
}

- (void)retryVCIDSSessionInfoSubscribedStreamIDs
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d streamIDsDictionary is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __72__VCIDSSessionInfoSynchronizer_retryVCIDSSessionInfoSubscribedStreamIDs__block_invoke(uint64_t a1)
{
  uint64_t v1;
  id *v2;
  unsigned int v3;
  uint64_t v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 32);
  v3 = *(_DWORD *)(v1 + 168);
  if (v3 > 9)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __72__VCIDSSessionInfoSynchronizer_retryVCIDSSessionInfoSubscribedStreamIDs__block_invoke_cold_1(v8, (uint64_t)v2, v9);
    }
  }
  else
  {
    *(_DWORD *)(v1 + 168) = v3 + 1;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v6 = *((_DWORD *)*v2 + 42);
        v7 = *((_QWORD *)*v2 + 4);
        v10 = 136316162;
        v11 = v4;
        v12 = 2080;
        v13 = "-[VCIDSSessionInfoSynchronizer retryVCIDSSessionInfoSubscribedStreamIDs]_block_invoke";
        v14 = 1024;
        v15 = 117;
        v16 = 1024;
        v17 = v6;
        v18 = 2112;
        v19 = v7;
        _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d retry %d times subscribedStreamIDs equal: %@", (uint8_t *)&v10, 0x2Cu);
      }
    }
    objc_msgSend(*v2, "sendVCIDSSessionInfoSubscribedStreamIDs:", *((_QWORD *)*v2 + 4));
  }
}

- (void)sendVCIDSSessionInfoSubscribedStreamIDs:(id)a3
{
  uint64_t v5;
  const void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  VCConnectionProtocol *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  _QWORD v17[4];
  _QWORD v18[4];
  _QWORD v19[4];
  _QWORD v20[4];
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = VCConnectionManager_CopyPrimaryConnection((uint64_t)self->_connectionManager);
  if (v5)
  {
    v6 = (const void *)v5;
    if (VCConnection_IsEndToEndLink(v5))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCIDSSessionInfoSynchronizer sendVCIDSSessionInfoSubscribedStreamIDs:].cold.1();
      }
    }
    else
    {
      v7 = VCConnectionIDS_LinkID((uint64_t)v6);
      v8 = *MEMORY[0x1E0D33ED0];
      v19[0] = *MEMORY[0x1E0D33ED0];
      v20[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v7);
      v9 = *MEMORY[0x1E0D33ED8];
      v19[1] = *MEMORY[0x1E0D33ED8];
      v10 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v7);
      v11 = *MEMORY[0x1E0D33FE8];
      v20[1] = v10;
      v20[2] = a3;
      v12 = *MEMORY[0x1E0D33F00];
      v19[2] = v11;
      v19[3] = v12;
      v20[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_currentParticipantGenerationCounter);
      objc_msgSend(-[VCIDSSessionInfoSynchronizer sessionInfoSynchronizerDelegate](self, "sessionInfoSynchronizerDelegate"), "VCIDSSessionInfoSynchronizer:sendVCIDSSessionInfoRequest:", self, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 4));
      if (-[VCConnectionManager isDuplicationEnabled](self->_connectionManager, "isDuplicationEnabled"))
      {
        v13 = -[VCConnectionManager secondaryConnection](self->_connectionManager, "secondaryConnection");
        if (VCConnection_IsEndToEndLink((uint64_t)v13))
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              -[VCIDSSessionInfoSynchronizer sendVCIDSSessionInfoSubscribedStreamIDs:].cold.2();
          }
          return;
        }
        v14 = VCConnectionIDS_LinkID((uint64_t)v13);
        v18[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v14, v8);
        v17[1] = v9;
        v18[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v14);
        v18[2] = a3;
        v17[2] = v11;
        v17[3] = v12;
        v18[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_currentParticipantGenerationCounter);
        objc_msgSend(-[VCIDSSessionInfoSynchronizer sessionInfoSynchronizerDelegate](self, "sessionInfoSynchronizerDelegate"), "VCIDSSessionInfoSynchronizer:sendVCIDSSessionInfoRequest:", self, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 4));
      }
    }
    CFRelease(v6);
    return;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v15 = VRTraceErrorLogLevelToCSTR();
    v16 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v22 = v15;
      v23 = 2080;
      v24 = "-[VCIDSSessionInfoSynchronizer sendVCIDSSessionInfoSubscribedStreamIDs:]";
      v25 = 1024;
      v26 = 127;
      _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d primary connection is nil", buf, 0x1Cu);
    }
  }
}

- (void)setVCIDSSessionInfoPublishedStreamIDs:(id)a3
{
  NSObject *stateQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    stateQueue = self->_stateQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __70__VCIDSSessionInfoSynchronizer_setVCIDSSessionInfoPublishedStreamIDs___block_invoke;
    block[3] = &unk_1E9E52238;
    block[4] = a3;
    block[5] = self;
    dispatch_async(stateQueue, block);
  }
}

void __70__VCIDSSessionInfoSynchronizer_setVCIDSSessionInfoPublishedStreamIDs___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  const void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  _QWORD v17[4];
  _QWORD v18[4];
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 136315906;
      v20 = v2;
      v21 = 2080;
      v22 = "-[VCIDSSessionInfoSynchronizer setVCIDSSessionInfoPublishedStreamIDs:]_block_invoke";
      v23 = 1024;
      v24 = 159;
      v25 = 2112;
      v26 = v4;
      _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d set publishedStreamIDs: %@", buf, 0x26u);
    }
  }
  v5 = (const void *)VCConnectionManager_CopyPrimaryConnection(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 96));
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "isEqualToArray:", *(_QWORD *)(a1 + 32)))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v14 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 136315906;
        v20 = v12;
        v21 = 2080;
        v22 = "-[VCIDSSessionInfoSynchronizer setVCIDSSessionInfoPublishedStreamIDs:]_block_invoke";
        v23 = 1024;
        v24 = 162;
        v25 = 2112;
        v26 = v14;
        _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d publishedStreamIDs equal: %@", buf, 0x26u);
      }
    }
    if (v5)
      goto LABEL_8;
  }
  else
  {

    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24) = objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
    if (v5)
    {
      if (VCConnection_IsEndToEndLink((uint64_t)v5))
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            __70__VCIDSSessionInfoSynchronizer_setVCIDSSessionInfoPublishedStreamIDs___block_invoke_cold_1();
        }
      }
      else
      {
        v6 = VCConnectionIDS_LinkID((uint64_t)v5);
        v18[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v6, *MEMORY[0x1E0D33ED0]);
        v17[1] = *MEMORY[0x1E0D33ED8];
        v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v6);
        v8 = *MEMORY[0x1E0D33F88];
        v9 = *(_QWORD *)(a1 + 32);
        v10 = *(_QWORD *)(a1 + 40);
        v18[1] = v7;
        v18[2] = v9;
        v11 = *MEMORY[0x1E0D33F00];
        v17[2] = v8;
        v17[3] = v11;
        v18[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(v10 + 72));
        objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "sessionInfoSynchronizerDelegate"), "VCIDSSessionInfoSynchronizer:sendVCIDSSessionInfoRequest:", *(_QWORD *)(a1 + 40), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 4));
      }
LABEL_8:
      CFRelease(v5);
      return;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v15 = VRTraceErrorLogLevelToCSTR();
      v16 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v20 = v15;
        v21 = 2080;
        v22 = "-[VCIDSSessionInfoSynchronizer setVCIDSSessionInfoPublishedStreamIDs:]_block_invoke";
        v23 = 1024;
        v24 = 166;
        _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d primary connection is nil", buf, 0x1Cu);
      }
    }
  }
}

- (id)reportingAgent
{
  return objc_loadWeak(&self->_reportingAgentWeak);
}

- (id)sessionInfoSynchronizerDelegate
{
  return objc_loadWeak(&self->_delegate);
}

- (void)setErrorResponseCallback:(id)a3
{
  self->_errorReponseCallback = _Block_copy(a3);
}

- (void)deregisterPeriodicTask
{
  -[VCIDSSessionInfoSynchronizer reportingAgent](self, "reportingAgent");
  reportingUnregisterPeriodicTask();
}

- (id)peerSubscribedStreamCallback
{
  return self->_peerSubscribedStreamCallback;
}

- (void)setPeerSubscribedStreamCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)peerPublishedStreamCallback
{
  return self->_peerPublishedStreamCallback;
}

- (void)setPeerPublishedStreamCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)errorReponseCallback
{
  return self->_errorReponseCallback;
}

- (void)setErrorReponseCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (VCIDSSessionInfoSynchronizer)initWithDelegate:(id)a3 connectionManager:(id)a4 reportingAgent:(id)a5
{
  VCIDSSessionInfoSynchronizer *v8;
  NSObject *CustomRootQueue;
  objc_super v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)VCIDSSessionInfoSynchronizer;
  v8 = -[VCIDSSessionInfoSynchronizer init](&v11, sel_init);
  if (v8)
  {
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
    v8->_stateQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCIDSSessionInfoSynchronizer.stateQueue", 0, CustomRootQueue);
    objc_storeWeak(&v8->_delegate, a3);
    objc_storeWeak(&v8->_reportingAgentWeak, a5);
    -[VCIDSSessionInfoSynchronizer registerPeriodicTask](v8, "registerPeriodicTask");
    v8->_peerSubscribedStreams = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v8->_peerPublishedStreams = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v8->_publishedStreams = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v8->_subscribedStreams = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v8->_currentParticipantGenerationCounter = 0;
    v8->_primaryLinkID = (NSNumber *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", 0);
    v8->_duplicationLinkID = (NSNumber *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", 0);
    v8->_connectionManager = (VCConnectionManager *)a4;
  }
  return v8;
}

- (void)setPrimaryLinkID:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  self->_primaryLinkID = (NSNumber *)a3;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315906;
      v7 = v4;
      v8 = 2080;
      v9 = "-[VCIDSSessionInfoSynchronizer(PrivateMethods) setPrimaryLinkID:]";
      v10 = 1024;
      v11 = 225;
      v12 = 2112;
      v13 = a3;
      _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d set primaryLinkID: %@", (uint8_t *)&v6, 0x26u);
    }
  }
}

- (NSNumber)primaryLinkID
{
  return self->_primaryLinkID;
}

- (void)setDuplicationLinkID:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  self->_duplicationLinkID = (NSNumber *)a3;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315906;
      v7 = v4;
      v8 = 2080;
      v9 = "-[VCIDSSessionInfoSynchronizer(PrivateMethods) setDuplicationLinkID:]";
      v10 = 1024;
      v11 = 234;
      v12 = 2112;
      v13 = a3;
      _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d set duplicationLinkID: %@", (uint8_t *)&v6, 0x26u);
    }
  }
}

- (NSNumber)duplicationLinkID
{
  return self->_duplicationLinkID;
}

- (void)resetParticipantGenerationCounter
{
  uint64_t v3;
  NSObject *v4;
  unsigned int currentParticipantGenerationCounter;
  int v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  unsigned int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      currentParticipantGenerationCounter = self->_currentParticipantGenerationCounter;
      v6 = 136315906;
      v7 = v3;
      v8 = 2080;
      v9 = "-[VCIDSSessionInfoSynchronizer(PrivateMethods) resetParticipantGenerationCounter]";
      v10 = 1024;
      v11 = 242;
      v12 = 1024;
      v13 = currentParticipantGenerationCounter;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Reset participant generation counter from %d to 0", (uint8_t *)&v6, 0x22u);
    }
  }
  self->_currentParticipantGenerationCounter = 0;
}

- (void)resetPeerSubscribedStreams
{
  uint64_t v3;
  NSObject *v4;
  NSMutableArray *peerSubscribedStreams;
  void (**peerSubscribedStreamCallback)(id, id);
  const __CFString *v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  NSObject *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  VCIDSSessionInfoSynchronizer *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      peerSubscribedStreams = self->_peerSubscribedStreams;
      v15 = 136315906;
      v16 = v3;
      v17 = 2080;
      v18 = "-[VCIDSSessionInfoSynchronizer(PrivateMethods) resetPeerSubscribedStreams]";
      v19 = 1024;
      v20 = 247;
      v21 = 2112;
      v22 = peerSubscribedStreams;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Reset peer subscribed streams: current subscription=%@", (uint8_t *)&v15, 0x26u);
    }
  }
  if (-[NSMutableArray count](self->_peerSubscribedStreams, "count"))
  {
    -[NSMutableArray removeAllObjects](self->_peerSubscribedStreams, "removeAllObjects");
    -[VCIDSSessionInfoSynchronizer resetParticipantGenerationCounter](self, "resetParticipantGenerationCounter");
    peerSubscribedStreamCallback = (void (**)(id, id))self->_peerSubscribedStreamCallback;
    if (peerSubscribedStreamCallback)
    {
      peerSubscribedStreamCallback[2](peerSubscribedStreamCallback, (id)-[NSMutableArray copy](self->_peerSubscribedStreams, "copy"));
      return;
    }
    if ((VCIDSSessionInfoSynchronizer *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        v8 = VRTraceErrorLogLevelToCSTR();
        v9 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v15 = 136315650;
          v16 = v8;
          v17 = 2080;
          v18 = "-[VCIDSSessionInfoSynchronizer(PrivateMethods) resetPeerSubscribedStreams]";
          v19 = 1024;
          v20 = 254;
          v10 = " [%s] %s:%d peerSubscribedStreamCallback is not set up";
          v11 = v9;
          v12 = 28;
LABEL_18:
          _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v15, v12);
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v7 = (const __CFString *)-[VCIDSSessionInfoSynchronizer performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v7 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        v13 = VRTraceErrorLogLevelToCSTR();
        v14 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v15 = 136316162;
          v16 = v13;
          v17 = 2080;
          v18 = "-[VCIDSSessionInfoSynchronizer(PrivateMethods) resetPeerSubscribedStreams]";
          v19 = 1024;
          v20 = 254;
          v21 = 2112;
          v22 = (void *)v7;
          v23 = 2048;
          v24 = self;
          v10 = " [%s] %s:%d %@(%p) peerSubscribedStreamCallback is not set up";
          v11 = v14;
          v12 = 48;
          goto LABEL_18;
        }
      }
    }
  }
}

- (void)checkVCIDSSessionInfoNeedUpdate:(unsigned __int8)a3
{
  int v3;
  uint64_t v5;
  NSObject *v6;
  unsigned int currentParticipantGenerationCounter;
  uint64_t v8;
  const void *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  _QWORD v14[3];
  _QWORD v15[3];
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  int v23;
  __int16 v24;
  unsigned int v25;
  uint64_t v26;

  v3 = a3;
  v26 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      currentParticipantGenerationCounter = self->_currentParticipantGenerationCounter;
      *(_DWORD *)buf = 136316162;
      v17 = v5;
      v18 = 2080;
      v19 = "-[VCIDSSessionInfoSynchronizer(PrivateMethods) checkVCIDSSessionInfoNeedUpdate:]";
      v20 = 1024;
      v21 = 260;
      v22 = 1024;
      v23 = v3;
      v24 = 1024;
      v25 = currentParticipantGenerationCounter;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d participantGenerationCounterLSByte = %d, %d", buf, 0x28u);
    }
  }
  if (LOBYTE(self->_currentParticipantGenerationCounter) != v3)
  {
    v8 = VCConnectionManager_CopyPrimaryConnection((uint64_t)self->_connectionManager);
    if (v8)
    {
      v9 = (const void *)v8;
      v10 = VCConnectionIDS_LinkID(v8);
      v15[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v10, *MEMORY[0x1E0D33ED0]);
      v14[1] = *MEMORY[0x1E0D33ED8];
      v15[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v10);
      v14[2] = *MEMORY[0x1E0D33F00];
      v15[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_currentParticipantGenerationCounter);
      objc_msgSend(-[VCIDSSessionInfoSynchronizer sessionInfoSynchronizerDelegate](self, "sessionInfoSynchronizerDelegate"), "VCIDSSessionInfoSynchronizer:sendVCIDSSessionInfoRequest:", self, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 3));
      CFRelease(v9);
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      v13 = *MEMORY[0x1E0CF2758];
      if (*MEMORY[0x1E0CF2748])
      {
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v17 = v11;
          v18 = 2080;
          v19 = "-[VCIDSSessionInfoSynchronizer(PrivateMethods) checkVCIDSSessionInfoNeedUpdate:]";
          v20 = 1024;
          v21 = 264;
          _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d primary connection is nil", buf, 0x1Cu);
        }
      }
      else if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        -[VCIDSSessionInfoSynchronizer(PrivateMethods) checkVCIDSSessionInfoNeedUpdate:].cold.1();
      }
    }
  }
}

- (void)updateVCIDSSessionInfoResponse:(id)a3
{
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  void (**v12)(id, _QWORD);
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int v17;
  unsigned int v18;
  const __CFString *v19;
  void (**errorReponseCallback)(id, uint64_t);
  uint64_t v21;
  void *v22;
  const __CFString *v23;
  uint64_t v24;
  NSObject *v25;
  const char *v26;
  NSObject *v27;
  uint32_t v28;
  uint64_t v29;
  NSObject *v30;
  void (**peerSubscribedStreamCallback)(id, void *);
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  const char *v35;
  NSObject *v36;
  uint32_t v37;
  const __CFString *v38;
  uint64_t v39;
  NSObject *v40;
  uint64_t v41;
  NSObject *v42;
  uint64_t v43;
  NSObject *v44;
  uint64_t v45;
  void *v46;
  const __CFString *v47;
  NSMutableDictionary *v48;
  void (**peerPublishedStreamCallback)(id, NSMutableDictionary *);
  uint64_t v50;
  NSObject *v51;
  const __CFString *v52;
  uint64_t v53;
  NSObject *v54;
  uint64_t v55;
  NSObject *v56;
  uint64_t v57;
  NSObject *v58;
  _BYTE v59[24];
  __int128 v60;
  VCIDSSessionInfoSynchronizer *v61;
  __int128 v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v59 = 136315906;
      *(_QWORD *)&v59[4] = v5;
      *(_WORD *)&v59[12] = 2080;
      *(_QWORD *)&v59[14] = "-[VCIDSSessionInfoSynchronizer(PrivateMethods) updateVCIDSSessionInfoResponse:]";
      *(_WORD *)&v59[22] = 1024;
      LODWORD(v60) = 277;
      WORD2(v60) = 2112;
      *(_QWORD *)((char *)&v60 + 6) = a3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d eventInfo=%@", v59, 0x26u);
    }
  }
  v7 = *MEMORY[0x1E0D33E80];
  if (objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0D33E80]))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v32 = objc_msgSend(a3, "objectForKeyedSubscript:", v7);
        *(_DWORD *)v59 = 136315906;
        *(_QWORD *)&v59[4] = v8;
        *(_WORD *)&v59[12] = 2080;
        *(_QWORD *)&v59[14] = "-[VCIDSSessionInfoSynchronizer(PrivateMethods) updateVCIDSSessionInfoResponse:]";
        *(_WORD *)&v59[22] = 1024;
        LODWORD(v60) = 280;
        WORD2(v60) = 2112;
        *(_QWORD *)((char *)&v60 + 6) = v32;
        _os_log_error_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_ERROR, " [%s] %s:%d eventInfo has IDSDataChannelError, ERROR = %@", v59, 0x26u);
      }
    }
    v10 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", v7), "code");
    if ((v10 - 2) < 2 || v10 == 8)
    {
      -[VCIDSSessionInfoSynchronizer reportingAgent](self, "reportingAgent");
      reportingSymptom();
    }
    else if (v10 == 7)
    {
      errorReponseCallback = (void (**)(id, uint64_t))self->_errorReponseCallback;
      if (errorReponseCallback)
        errorReponseCallback[2](errorReponseCallback, 7);
    }
    ++self->_countResponseFailure;
    return;
  }
  v12 = (void (**)(id, _QWORD))self->_errorReponseCallback;
  if (v12)
    v12[2](v12, 0);
  v13 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D33EA8]);
  if (v13)
  {
    v14 = v13;
    v15 = *MEMORY[0x1E0D33FC0];
    if (objc_msgSend(v13, "objectForKey:", *MEMORY[0x1E0D33FC0]))
      self->_sessionInfoRequestBytesUsed = objc_msgSend((id)objc_msgSend(v14, "objectForKeyedSubscript:", v15), "intValue");
    v16 = *MEMORY[0x1E0D33FC8];
    if (objc_msgSend(v14, "objectForKey:", *MEMORY[0x1E0D33FC8]))
      self->_sessionInfoResponseBytesUsed = objc_msgSend((id)objc_msgSend(v14, "objectForKeyedSubscript:", v16), "intValue");
    v17 = objc_msgSend((id)objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E0D33F00]), "intValue");
    v18 = v17;
    if (v17 == self->_currentParticipantGenerationCounter)
    {
      if ((VCIDSSessionInfoSynchronizer *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 5)
          return;
        v24 = VRTraceErrorLogLevelToCSTR();
        v25 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          return;
        *(_DWORD *)v59 = 136315906;
        *(_QWORD *)&v59[4] = v24;
        *(_WORD *)&v59[12] = 2080;
        *(_QWORD *)&v59[14] = "-[VCIDSSessionInfoSynchronizer(PrivateMethods) updateVCIDSSessionInfoResponse:]";
        *(_WORD *)&v59[22] = 1024;
        LODWORD(v60) = 318;
        WORD2(v60) = 1024;
        *(_DWORD *)((char *)&v60 + 6) = v18;
        v26 = " [%s] %s:%d Getting duplicated participantGenerationCounter=%u";
        v27 = v25;
        v28 = 34;
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v19 = (const __CFString *)-[VCIDSSessionInfoSynchronizer performSelector:](self, "performSelector:", sel_logPrefix);
        else
          v19 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 5)
          return;
        v29 = VRTraceErrorLogLevelToCSTR();
        v30 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          return;
        *(_DWORD *)v59 = 136316418;
        *(_QWORD *)&v59[4] = v29;
        *(_WORD *)&v59[12] = 2080;
        *(_QWORD *)&v59[14] = "-[VCIDSSessionInfoSynchronizer(PrivateMethods) updateVCIDSSessionInfoResponse:]";
        *(_WORD *)&v59[22] = 1024;
        LODWORD(v60) = 318;
        WORD2(v60) = 2112;
        *(_QWORD *)((char *)&v60 + 6) = v19;
        HIWORD(v60) = 2048;
        v61 = self;
        LOWORD(v62) = 1024;
        *(_DWORD *)((char *)&v62 + 2) = v18;
        v26 = " [%s] %s:%d %@(%p) Getting duplicated participantGenerationCounter=%u";
        v27 = v30;
        v28 = 54;
      }
      goto LABEL_89;
    }
    self->_currentParticipantGenerationCounter = v17;
    v21 = *MEMORY[0x1E0D33F10];
    if (objc_msgSend(v14, "objectForKey:", *MEMORY[0x1E0D33F10]))
    {
      v22 = (void *)objc_msgSend(v14, "objectForKeyedSubscript:", v21);
      if ((-[NSMutableArray isEqualToArray:](self->_peerSubscribedStreams, "isEqualToArray:", v22) & 1) != 0)
      {
        if ((VCIDSSessionInfoSynchronizer *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v33 = VRTraceErrorLogLevelToCSTR();
            v34 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v59 = 136315906;
              *(_QWORD *)&v59[4] = v33;
              *(_WORD *)&v59[12] = 2080;
              *(_QWORD *)&v59[14] = "-[VCIDSSessionInfoSynchronizer(PrivateMethods) updateVCIDSSessionInfoResponse:]";
              *(_WORD *)&v59[22] = 1024;
              LODWORD(v60) = 335;
              WORD2(v60) = 2112;
              *(_QWORD *)((char *)&v60 + 6) = v22;
              v35 = " [%s] %s:%d Ignoring identical peerSubscribedStreams=%@";
              v36 = v34;
              v37 = 38;
LABEL_64:
              _os_log_impl(&dword_1D8A54000, v36, OS_LOG_TYPE_DEFAULT, v35, v59, v37);
            }
          }
        }
        else
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v23 = (const __CFString *)-[VCIDSSessionInfoSynchronizer performSelector:](self, "performSelector:", sel_logPrefix);
          else
            v23 = &stru_1E9E58EE0;
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v39 = VRTraceErrorLogLevelToCSTR();
            v40 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v59 = 136316418;
              *(_QWORD *)&v59[4] = v39;
              *(_WORD *)&v59[12] = 2080;
              *(_QWORD *)&v59[14] = "-[VCIDSSessionInfoSynchronizer(PrivateMethods) updateVCIDSSessionInfoResponse:]";
              *(_WORD *)&v59[22] = 1024;
              LODWORD(v60) = 335;
              WORD2(v60) = 2112;
              *(_QWORD *)((char *)&v60 + 6) = v23;
              HIWORD(v60) = 2048;
              v61 = self;
              LOWORD(v62) = 2112;
              *(_QWORD *)((char *)&v62 + 2) = v22;
              v35 = " [%s] %s:%d %@(%p) Ignoring identical peerSubscribedStreams=%@";
              v36 = v40;
              v37 = 58;
              goto LABEL_64;
            }
          }
        }
      }
      else
      {

        self->_peerSubscribedStreams = (NSMutableArray *)objc_msgSend(v22, "mutableCopy");
        peerSubscribedStreamCallback = (void (**)(id, void *))self->_peerSubscribedStreamCallback;
        if (peerSubscribedStreamCallback)
        {
          peerSubscribedStreamCallback[2](peerSubscribedStreamCallback, v22);
          goto LABEL_65;
        }
        if ((VCIDSSessionInfoSynchronizer *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
          {
            v41 = VRTraceErrorLogLevelToCSTR();
            v42 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v59 = 136315650;
              *(_QWORD *)&v59[4] = v41;
              *(_WORD *)&v59[12] = 2080;
              *(_QWORD *)&v59[14] = "-[VCIDSSessionInfoSynchronizer(PrivateMethods) updateVCIDSSessionInfoResponse:]";
              *(_WORD *)&v59[22] = 1024;
              LODWORD(v60) = 332;
              v35 = " [%s] %s:%d peerSubscribedStreamCallback is not set up";
              v36 = v42;
              v37 = 28;
              goto LABEL_64;
            }
          }
        }
        else
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v38 = (const __CFString *)-[VCIDSSessionInfoSynchronizer performSelector:](self, "performSelector:", sel_logPrefix);
          else
            v38 = &stru_1E9E58EE0;
          if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
          {
            v43 = VRTraceErrorLogLevelToCSTR();
            v44 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v59 = 136316162;
              *(_QWORD *)&v59[4] = v43;
              *(_WORD *)&v59[12] = 2080;
              *(_QWORD *)&v59[14] = "-[VCIDSSessionInfoSynchronizer(PrivateMethods) updateVCIDSSessionInfoResponse:]";
              *(_WORD *)&v59[22] = 1024;
              LODWORD(v60) = 332;
              WORD2(v60) = 2112;
              *(_QWORD *)((char *)&v60 + 6) = v38;
              HIWORD(v60) = 2048;
              v61 = self;
              v35 = " [%s] %s:%d %@(%p) peerSubscribedStreamCallback is not set up";
              v36 = v44;
              v37 = 48;
              goto LABEL_64;
            }
          }
        }
      }
    }
LABEL_65:
    v45 = *MEMORY[0x1E0D33F08];
    if (!objc_msgSend(v14, "objectForKey:", *MEMORY[0x1E0D33F08], *(_OWORD *)v59, *(_QWORD *)&v59[16], v60, v61, v62))
      return;
    v46 = (void *)objc_msgSend(v14, "objectForKeyedSubscript:", v45);
    if ((-[NSMutableDictionary isEqualToDictionary:](self->_peerPublishedStreams, "isEqualToDictionary:", v46) & 1) != 0)
    {
      if ((VCIDSSessionInfoSynchronizer *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 7)
          return;
        v50 = VRTraceErrorLogLevelToCSTR();
        v51 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          return;
        *(_DWORD *)v59 = 136315906;
        *(_QWORD *)&v59[4] = v50;
        *(_WORD *)&v59[12] = 2080;
        *(_QWORD *)&v59[14] = "-[VCIDSSessionInfoSynchronizer(PrivateMethods) updateVCIDSSessionInfoResponse:]";
        *(_WORD *)&v59[22] = 1024;
        LODWORD(v60) = 350;
        WORD2(v60) = 2112;
        *(_QWORD *)((char *)&v60 + 6) = v46;
        v26 = " [%s] %s:%d Ignoring identical peerPublishedStreams=%@";
        v27 = v51;
        v28 = 38;
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v47 = (const __CFString *)-[VCIDSSessionInfoSynchronizer performSelector:](self, "performSelector:", sel_logPrefix);
        else
          v47 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 7)
          return;
        v53 = VRTraceErrorLogLevelToCSTR();
        v54 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          return;
        *(_DWORD *)v59 = 136316418;
        *(_QWORD *)&v59[4] = v53;
        *(_WORD *)&v59[12] = 2080;
        *(_QWORD *)&v59[14] = "-[VCIDSSessionInfoSynchronizer(PrivateMethods) updateVCIDSSessionInfoResponse:]";
        *(_WORD *)&v59[22] = 1024;
        LODWORD(v60) = 350;
        WORD2(v60) = 2112;
        *(_QWORD *)((char *)&v60 + 6) = v47;
        HIWORD(v60) = 2048;
        v61 = self;
        LOWORD(v62) = 2112;
        *(_QWORD *)((char *)&v62 + 2) = v46;
        v26 = " [%s] %s:%d %@(%p) Ignoring identical peerPublishedStreams=%@";
        v27 = v54;
        v28 = 58;
      }
    }
    else
    {

      v48 = (NSMutableDictionary *)objc_msgSend(v46, "mutableCopy");
      self->_peerPublishedStreams = v48;
      peerPublishedStreamCallback = (void (**)(id, NSMutableDictionary *))self->_peerPublishedStreamCallback;
      if (peerPublishedStreamCallback)
      {
        peerPublishedStreamCallback[2](peerPublishedStreamCallback, v48);
        return;
      }
      if ((VCIDSSessionInfoSynchronizer *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 5)
          return;
        v55 = VRTraceErrorLogLevelToCSTR();
        v56 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          return;
        *(_DWORD *)v59 = 136315650;
        *(_QWORD *)&v59[4] = v55;
        *(_WORD *)&v59[12] = 2080;
        *(_QWORD *)&v59[14] = "-[VCIDSSessionInfoSynchronizer(PrivateMethods) updateVCIDSSessionInfoResponse:]";
        *(_WORD *)&v59[22] = 1024;
        LODWORD(v60) = 347;
        v26 = " [%s] %s:%d peerPublishedStreamCallback is not set up";
        v27 = v56;
        v28 = 28;
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v52 = (const __CFString *)-[VCIDSSessionInfoSynchronizer performSelector:](self, "performSelector:", sel_logPrefix);
        else
          v52 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 5)
          return;
        v57 = VRTraceErrorLogLevelToCSTR();
        v58 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          return;
        *(_DWORD *)v59 = 136316162;
        *(_QWORD *)&v59[4] = v57;
        *(_WORD *)&v59[12] = 2080;
        *(_QWORD *)&v59[14] = "-[VCIDSSessionInfoSynchronizer(PrivateMethods) updateVCIDSSessionInfoResponse:]";
        *(_WORD *)&v59[22] = 1024;
        LODWORD(v60) = 347;
        WORD2(v60) = 2112;
        *(_QWORD *)((char *)&v60 + 6) = v52;
        HIWORD(v60) = 2048;
        v61 = self;
        v26 = " [%s] %s:%d %@(%p) peerPublishedStreamCallback is not set up";
        v27 = v58;
        v28 = 48;
      }
    }
LABEL_89:
    _os_log_impl(&dword_1D8A54000, v27, OS_LOG_TYPE_DEFAULT, v26, v59, v28);
    return;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCIDSSessionInfoSynchronizer(PrivateMethods) updateVCIDSSessionInfoResponse:].cold.1();
  }
}

- (void)optInStreamIDsForConnection:(id)a3
{
  NSObject *stateQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    stateQueue = self->_stateQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __76__VCIDSSessionInfoSynchronizer_PrivateMethods__optInStreamIDsForConnection___block_invoke;
    block[3] = &unk_1E9E52238;
    block[4] = self;
    block[5] = a3;
    dispatch_async(stateQueue, block);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCIDSSessionInfoSynchronizer(PrivateMethods) optInStreamIDsForConnection:].cold.1();
  }
}

uint64_t __76__VCIDSSessionInfoSynchronizer_PrivateMethods__optInStreamIDsForConnection___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  _QWORD v20[4];
  _QWORD v21[5];

  v21[4] = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count");
  if (result)
  {
    v3 = VCConnectionIDS_LinkID(*(_QWORD *)(a1 + 40));
    v20[0] = *MEMORY[0x1E0D33ED0];
    v21[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v3);
    v20[1] = *MEMORY[0x1E0D33ED8];
    v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v3);
    v5 = *MEMORY[0x1E0D33FE8];
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(_QWORD *)(v6 + 32);
    v21[1] = v4;
    v21[2] = v7;
    v8 = *MEMORY[0x1E0D33F00];
    v20[2] = v5;
    v20[3] = v8;
    v21[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(v6 + 72));
    v9 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 4);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v12 = 136315906;
        v13 = v10;
        v14 = 2080;
        v15 = "-[VCIDSSessionInfoSynchronizer(PrivateMethods) optInStreamIDsForConnection:]_block_invoke";
        v16 = 1024;
        v17 = 369;
        v18 = 2112;
        v19 = v9;
        _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Opt in for connection, request = %@", (uint8_t *)&v12, 0x26u);
      }
    }
    return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "sessionInfoSynchronizerDelegate"), "VCIDSSessionInfoSynchronizer:sendVCIDSSessionInfoRequest:", *(_QWORD *)(a1 + 32), v9);
  }
  return result;
}

- (void)optInAllStreamsForConnection:(id)a3
{
  if (a3)
    -[VCIDSSessionInfoSynchronizer optInStreamIDsForConnection:](self, "optInStreamIDsForConnection:");
}

- (void)optInStreamIDsForNewPrimaryConnection:(id)a3 oldPrimaryConnection:(id)a4
{
  -[VCIDSSessionInfoSynchronizer optInStreamIDsForConnection:](self, "optInStreamIDsForConnection:");
  if (a4 != a3)
    -[VCIDSSessionInfoSynchronizer optOutStreamIDsForNonPrimaryConnection:sentOnConnection:](self, "optOutStreamIDsForNonPrimaryConnection:sentOnConnection:", a4, a3);
}

- (void)optOutStreamIDsForNonPrimaryConnection:(id)a3 sentOnConnection:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[4];
  _QWORD v20[5];

  v20[4] = *MEMORY[0x1E0C80C00];
  if (a3 && a4)
  {
    v19[0] = *MEMORY[0x1E0D33ED0];
    v20[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", VCConnectionIDS_LinkID((uint64_t)a4));
    v19[1] = *MEMORY[0x1E0D33ED8];
    v20[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", VCConnectionIDS_LinkID((uint64_t)a3));
    v19[2] = *MEMORY[0x1E0D33FE8];
    v17 = *MEMORY[0x1E0D33E38];
    v18 = *MEMORY[0x1E0D33EE0];
    v20[2] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
    v19[3] = *MEMORY[0x1E0D33F00];
    v20[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_currentParticipantGenerationCounter);
    v6 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 4);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v9 = 136315906;
        v10 = v7;
        v11 = 2080;
        v12 = "-[VCIDSSessionInfoSynchronizer(PrivateMethods) optOutStreamIDsForNonPrimaryConnection:sentOnConnection:]";
        v13 = 1024;
        v14 = 401;
        v15 = 2112;
        v16 = v6;
        _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Opt out for non primary connection, request = %@", (uint8_t *)&v9, 0x26u);
      }
    }
    objc_msgSend(-[VCIDSSessionInfoSynchronizer sessionInfoSynchronizerDelegate](self, "sessionInfoSynchronizerDelegate"), "VCIDSSessionInfoSynchronizer:sendVCIDSSessionInfoRequest:", self, v6);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCIDSSessionInfoSynchronizer(PrivateMethods) optOutStreamIDsForNonPrimaryConnection:sentOnConnection:].cold.1();
  }
}

- (void)periodicTask:(void *)a3
{
  double v5;
  double v6;
  int sessionInfoRequestBytesUsed;
  int v8;
  int minSentRate;
  double maxSentRate;
  double v11;
  int v12;
  int sessionInfoResponseBytesUsed;
  int v14;
  int maxReceivedRate;
  int minReceivedRate;
  double v17;
  double v18;
  int v19;

  v5 = micro();
  v6 = v5 - self->_lastUpdateTimestamp;
  self->_lastUpdateTimestamp = v5;
  sessionInfoRequestBytesUsed = self->_sessionInfoRequestBytesUsed;
  v8 = sessionInfoRequestBytesUsed - self->_lastProcessedBytesSent;
  self->_lastProcessedBytesSent = sessionInfoRequestBytesUsed;
  if (v6 == 0.0)
  {
    v12 = 0;
    self->_maxSentRate = 0;
  }
  else
  {
    minSentRate = self->_minSentRate;
    maxSentRate = (double)self->_maxSentRate;
    v11 = (double)v8 / v6;
    if (v11 > maxSentRate)
      maxSentRate = (double)v8 / v6;
    self->_maxSentRate = (int)maxSentRate;
    if (v11 > (double)minSentRate)
      v11 = (double)minSentRate;
    v12 = (int)v11;
  }
  self->_bytesSentToReport += v8;
  sessionInfoResponseBytesUsed = self->_sessionInfoResponseBytesUsed;
  v14 = sessionInfoResponseBytesUsed - self->_lastProcessedBytesReceived;
  self->_minSentRate = v12;
  self->_lastProcessedBytesReceived = sessionInfoResponseBytesUsed;
  if (v6 == 0.0)
  {
    v19 = 0;
    self->_maxReceivedRate = 0;
  }
  else
  {
    maxReceivedRate = self->_maxReceivedRate;
    minReceivedRate = self->_minReceivedRate;
    v17 = (double)v14 / v6;
    if (v17 <= (double)maxReceivedRate)
      v18 = (double)maxReceivedRate;
    else
      v18 = (double)v14 / v6;
    self->_maxReceivedRate = (int)v18;
    if (v17 > (double)minReceivedRate)
      v17 = (double)minReceivedRate;
    v19 = (int)v17;
  }
  self->_minReceivedRate = v19;
  self->_bytesReceivedToReport += v14;
  if (a3)
  {
    objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:"), CFSTR("SIMinBytesSent"));
    objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_maxSentRate), CFSTR("SIMaxBytesSent"));
    objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_bytesSentToReport), CFSTR("SIRawBytesSent"));
    objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_minReceivedRate), CFSTR("SIMinBytesReceived"));
    objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_maxReceivedRate), CFSTR("SIMaxBytesReceived"));
    objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_bytesReceivedToReport), CFSTR("SIRawBytesReceived"));
    objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_countResponseFailure), CFSTR("SyncIDSFailure"));
    -[VCIDSSessionInfoSynchronizer flushRealTimeReportingStats](self, "flushRealTimeReportingStats");
  }
}

- (void)registerPeriodicTask
{
  -[VCIDSSessionInfoSynchronizer reportingAgent](self, "reportingAgent");
  reportingRegisterPeriodicTaskWeak();
}

uint64_t __68__VCIDSSessionInfoSynchronizer_PrivateMethods__registerPeriodicTask__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "periodicTask:");
}

- (void)flushRealTimeReportingStats
{
  self->_minSentRate = 0x7FFFFFFF;
  self->_minReceivedRate = 0x7FFFFFFF;
  *(_QWORD *)&self->_bytesSentToReport = 0;
  *(_QWORD *)&self->_bytesReceivedToReport = 0;
}

- (void)setVCIDSSessionInfoSubscribedStreamIDs:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d streamIDsDictionary is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __72__VCIDSSessionInfoSynchronizer_retryVCIDSSessionInfoSubscribedStreamIDs__block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = *(_DWORD *)(*(_QWORD *)a2 + 168);
  v4 = 136315906;
  v5 = a1;
  v6 = 2080;
  v7 = "-[VCIDSSessionInfoSynchronizer retryVCIDSSessionInfoSubscribedStreamIDs]_block_invoke";
  v8 = 1024;
  v9 = 120;
  v10 = 1024;
  v11 = v3;
  _os_log_error_impl(&dword_1D8A54000, log, OS_LOG_TYPE_ERROR, " [%s] %s:%d Hit the retry limit=%d for subscribedStreamIDs", (uint8_t *)&v4, 0x22u);
  OUTLINED_FUNCTION_3();
}

- (void)sendVCIDSSessionInfoSubscribedStreamIDs:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Primary connection is end-to-end when subscribing to streams.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)sendVCIDSSessionInfoSubscribedStreamIDs:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Secondary connection is end-to-end when subscribing to streams.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __70__VCIDSSessionInfoSynchronizer_setVCIDSSessionInfoPublishedStreamIDs___block_invoke_cold_1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Primary connection is end-to-end when publishing streams.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
