@implementation VCMediaRecorder

- (VCMediaRecorder)initWithStreamToken:(unsigned int)a3 delegate:(id)a4 reportingAgent:(opaqueRTCReporting *)a5
{
  VCMediaRecorder *v8;
  NSObject *CustomRootQueue;
  NSObject *v10;
  void *v11;
  objc_super v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)VCMediaRecorder;
  v8 = -[VCObject init](&v13, sel_init);
  if (v8)
  {
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
    v8->_stateQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCMediaRecorder.stateQueue", 0, CustomRootQueue);
    v8->_streamToken = a3;
    -[VCMediaRecorder setTransportDelegate:](v8, "setTransportDelegate:", a4);
    v10 = VCDispatchQueue_GetCustomRootQueue(37);
    v8->_delegateNotificationQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCMediaRecorder.notificationQueue", 0, v10);
    v8->_mode = 0;
    v8->_requests = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v8->_mediaRecorderHistory = -[VCMediaRecorderHistory initWithDelegateQueue:]([VCMediaRecorderHistory alloc], "initWithDelegateQueue:", v8->_stateQueue);
    v8->_isActive = 0;
    v8->_currentTimestamp = 0;
    if (a5)
    {
      v11 = (void *)CFRetain(a5);
      v8->super._reportingAgent = v11;
      if (v11)
      {
LABEL_7:
        v8->_lastHealthPrintCallAbsoluteSeconds = NAN;
        return v8;
      }
    }
    else
    {
      v8->super._reportingAgent = 0;
    }
    -[VCMediaRecorder setUpReportingAgent](v8, "setUpReportingAgent");
    goto LABEL_7;
  }
  return v8;
}

- (void)dealloc
{
  NSObject *delegateNotificationQueue;
  NSObject *stateQueue;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_storeWeak(&self->_delegate, 0);
  objc_storeWeak(&self->_transportDelegate, 0);
  delegateNotificationQueue = self->_delegateNotificationQueue;
  if (delegateNotificationQueue)
    dispatch_release(delegateNotificationQueue);
  stateQueue = self->_stateQueue;
  if (stateQueue)
    dispatch_release(stateQueue);

  v5.receiver = self;
  v5.super_class = (Class)VCMediaRecorder;
  -[VCObject dealloc](&v5, sel_dealloc);
}

- (int)videoCodec
{
  NSObject *stateQueue;
  int v3;
  _QWORD block[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 128;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__VCMediaRecorder_videoCodec__block_invoke;
  block[3] = &unk_1E9E52938;
  block[4] = self;
  block[5] = &v6;
  dispatch_sync(stateQueue, block);
  v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __29__VCMediaRecorder_videoCodec__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 192), "videoCodec");
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setVideoCodec:(int)a3
{
  NSObject *stateQueue;
  _QWORD block[5];
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__VCMediaRecorder_setVideoCodec___block_invoke;
  block[3] = &unk_1E9E52300;
  block[4] = self;
  v5 = a3;
  dispatch_sync(stateQueue, block);
}

uint64_t __33__VCMediaRecorder_setVideoCodec___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 192), "setVideoCodec:", *(unsigned int *)(a1 + 40));
}

- (int)imageType
{
  NSObject *stateQueue;
  int v3;
  _QWORD block[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__VCMediaRecorder_imageType__block_invoke;
  block[3] = &unk_1E9E52938;
  block[4] = self;
  block[5] = &v6;
  dispatch_sync(stateQueue, block);
  v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __28__VCMediaRecorder_imageType__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 192), "imageType");
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setImageType:(int)a3
{
  NSObject *stateQueue;
  _QWORD block[5];
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__VCMediaRecorder_setImageType___block_invoke;
  block[3] = &unk_1E9E52300;
  block[4] = self;
  v5 = a3;
  dispatch_sync(stateQueue, block);
}

uint64_t __32__VCMediaRecorder_setImageType___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 192), "setImageType:", *(unsigned int *)(a1 + 40));
}

- (VideoAttributes)targetScreenAttributes
{
  NSObject *stateQueue;
  VideoAttributes *v3;
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
  v9 = __Block_byref_object_copy__5;
  v10 = __Block_byref_object_dispose__5;
  v11 = 0;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__VCMediaRecorder_targetScreenAttributes__block_invoke;
  block[3] = &unk_1E9E52938;
  block[4] = self;
  block[5] = &v6;
  dispatch_sync(stateQueue, block);
  v3 = (VideoAttributes *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __41__VCMediaRecorder_targetScreenAttributes__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(a1 + 32) + 232);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)setInitialRemoteScreenAttributes:(id)a3
{
  if (!objc_msgSend(a3, "orientation"))
    VCMediaRecorder_UpdateTargetScreenAttributes((uint64_t)self, (uint64_t)a3);
}

void __VCMediaRecorder_UpdateTargetScreenAttributes_block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  const void *v4;
  CFTypeRef v5;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(const void **)(v3 + 232);
  if (v2 != v4)
  {
    if (v4)
    {
      CFRelease(v4);
      v2 = *(void **)(a1 + 32);
    }
    if (v2)
      v5 = CFRetain(v2);
    else
      v5 = 0;
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 232) = v5;
    v2 = *(void **)(a1 + 32);
    v3 = *(_QWORD *)(a1 + 40);
  }
  VCMediaRecorderHistory_UpdateTargetScreenAttributes(*(_QWORD *)(v3 + 192), v2);
}

+ (BOOL)validateIncomingRequest:(id)a3
{
  uint64_t v4;
  void *v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  unint64_t v8;
  _BOOL4 v9;
  uint64_t v10;
  NSObject *v11;
  int v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  int v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (!+[VCHardwareSettings isMediaRecordingSupported](VCHardwareSettings, "isMediaRecordingSupported"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v9 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v9)
        return v9;
      +[VCMediaRecorder validateIncomingRequest:].cold.12();
    }
    goto LABEL_17;
  }
  v4 = +[VCMediaRecorder typeForRequest:](VCMediaRecorder, "typeForRequest:", a3);
  v5 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMomentsRequestMode"));
  if (!v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v9 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v9)
        return v9;
      +[VCMediaRecorder validateIncomingRequest:].cold.1();
    }
    goto LABEL_17;
  }
  v6 = objc_msgSend(v5, "intValue");
  if (!(_DWORD)v4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v9 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v9)
        return v9;
      +[VCMediaRecorder validateIncomingRequest:].cold.2();
    }
    goto LABEL_17;
  }
  v7 = v6;
  v8 = objc_msgSend(a3, "count");
  if (v8 > +[VCMediaRecorder countForRequestType:requestMode:](VCMediaRecorder, "countForRequestType:requestMode:", v4, v7))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      v9 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v9)
        return v9;
      v13 = 136316418;
      v14 = v10;
      v15 = 2080;
      v16 = "+[VCMediaRecorder validateIncomingRequest:]";
      v17 = 1024;
      v18 = 232;
      v19 = 2048;
      v20 = objc_msgSend(a3, "count");
      v21 = 1024;
      v22 = v4;
      v23 = 1024;
      v24 = v7;
      _os_log_error_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_ERROR, " [%s] %s:%d Invalid count=%lu requestType=%u requestMode=%hhu", (uint8_t *)&v13, 0x32u);
    }
    goto LABEL_17;
  }
  if (!objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMomentsTransactionID")))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v9 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v9)
        return v9;
      +[VCMediaRecorder validateIncomingRequest:].cold.3();
    }
    goto LABEL_17;
  }
  if (!objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMomentsRequestState")))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v9 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v9)
        return v9;
      +[VCMediaRecorder validateIncomingRequest:].cold.4();
    }
    goto LABEL_17;
  }
  if (!objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMomentsRequestTimestamp")))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v9 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v9)
        return v9;
      +[VCMediaRecorder validateIncomingRequest:].cold.5();
    }
    goto LABEL_17;
  }
  if (!objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMomentsMediaType")))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v9 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v9)
        return v9;
      +[VCMediaRecorder validateIncomingRequest:].cold.6();
    }
    goto LABEL_17;
  }
  if ((_DWORD)v4 != 1)
  {
    if ((v4 & 0xFFFFFFFE) == 4)
    {
      if (v7 != 1 && !objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMomentsRequesteeID")))
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          v9 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
          if (!v9)
            return v9;
          +[VCMediaRecorder validateIncomingRequest:].cold.11();
        }
        goto LABEL_17;
      }
      if (!objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMomentsRequesterID")))
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          v9 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
          if (!v9)
            return v9;
          +[VCMediaRecorder validateIncomingRequest:].cold.8();
        }
        goto LABEL_17;
      }
    }
    if ((_DWORD)v4 == 5 || (_DWORD)v4 == 3)
    {
      if (!objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMomentsFileSize")))
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          v9 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
          if (!v9)
            return v9;
          +[VCMediaRecorder validateIncomingRequest:].cold.9();
        }
        goto LABEL_17;
      }
      if (!objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMomentsRequestDidSucceed")))
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          v9 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
          if (!v9)
            return v9;
          +[VCMediaRecorder validateIncomingRequest:].cold.10();
        }
        goto LABEL_17;
      }
    }
LABEL_26:
    LOBYTE(v9) = 1;
    return v9;
  }
  if (objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMomentsInitiatorID")))
    goto LABEL_26;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    v9 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
    if (!v9)
      return v9;
    +[VCMediaRecorder validateIncomingRequest:].cold.7();
  }
LABEL_17:
  LOBYTE(v9) = 0;
  return v9;
}

- (void)processRequest:(id)a3
{
  NSObject *stateQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__VCMediaRecorder_processRequest___block_invoke;
  block[3] = &unk_1E9E52238;
  block[4] = self;
  block[5] = a3;
  dispatch_sync(stateQueue, block);
}

uint64_t __34__VCMediaRecorder_processRequest___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dispatchedProcessRequest:", *(_QWORD *)(a1 + 40));
}

- (void)dispatchedProcessRequest:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  unsigned __int8 v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  MEMORY[0x1DF087EC4](&dword_1D8A54000, "-[VCMediaRecorder dispatchedProcessRequest:]");
  if (+[VCMediaRecorder validateIncomingRequest:](VCMediaRecorder, "validateIncomingRequest:", a3))
  {
    self->_mode = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMomentsRequestMode")), "intValue");
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", a3);
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("vcMomentsTransactionID")));
    if (v6)
    {
      v7 = v6;
      objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(v6, "UUIDString"), CFSTR("vcMomentsTransactionID"));

      if ((-[NSMutableSet containsObject:](self->_requests, "containsObject:", v5) & 1) != 0)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v8 = VRTraceErrorLogLevelToCSTR();
          v9 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v13 = 136315906;
            v14 = v8;
            v15 = 2080;
            v16 = "-[VCMediaRecorder dispatchedProcessRequest:]";
            v17 = 1024;
            v18 = 296;
            v19 = 2112;
            v20 = objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("vcMomentsTransactionID"));
            _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCMediaRecorder request %@ is processed, ignoring the duplicate", (uint8_t *)&v13, 0x26u);
          }
        }
      }
      else
      {
        -[NSMutableSet addObject:](self->_requests, "addObject:", v5);
        v12 = objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("vcMomentsMediaType")), "intValue");
        switch(v12)
        {
          case 1u:
            -[VCMediaRecorder processRemotePhotoRequest:](self, "processRemotePhotoRequest:", v5);
            break;
          case 2u:
          case 4u:
          case 5u:
            -[VCMediaRecorder processRemoteRequest:withMediaType:](self, "processRemoteRequest:withMediaType:", v5, v12);
            break;
          case 3u:
            -[VCMediaRecorder processRemoteLivePhotoRequest:](self, "processRemoteLivePhotoRequest:", v5);
            break;
          default:
            return;
        }
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaRecorder dispatchedProcessRequest:].cold.1(v10, v5, v11);
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCMediaRecorder dispatchedProcessRequest:].cold.2();
  }
}

- (unsigned)capabilities
{
  NSObject *stateQueue;
  unsigned int v3;
  _QWORD block[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__VCMediaRecorder_capabilities__block_invoke;
  block[3] = &unk_1E9E52938;
  block[4] = self;
  block[5] = &v6;
  dispatch_sync(stateQueue, block);
  v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __31__VCMediaRecorder_capabilities__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_DWORD *)(*(_QWORD *)(result + 32) + 200);
  return result;
}

- (void)setCapabilities:(unsigned int)a3
{
  NSObject *stateQueue;
  _QWORD block[5];
  unsigned int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__VCMediaRecorder_setCapabilities___block_invoke;
  block[3] = &unk_1E9E52300;
  block[4] = self;
  v5 = a3;
  dispatch_async(stateQueue, block);
}

uint64_t __35__VCMediaRecorder_setCapabilities___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dispatchedSetCapabilities:", *(unsigned int *)(a1 + 40));
}

- (void)dispatchedSetCapabilities:(unsigned int)a3
{
  unsigned int capabilities;
  unsigned int v6;
  id v7;
  uint64_t streamToken;
  unsigned int v9;
  NSObject *delegateNotificationQueue;
  uint64_t v11;
  NSObject *v12;
  unsigned int v13;
  _QWORD block[6];
  unsigned int v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  unsigned int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  capabilities = self->_capabilities;
  if (+[VCMediaRecorder deviceHasSufficientFreeSpace](VCMediaRecorder, "deviceHasSufficientFreeSpace"))
    v6 = a3;
  else
    v6 = 0;
  self->_capabilities = v6;
  if (v6 != capabilities)
  {
    v7 = -[VCMediaRecorder dispatchedMediaRecorderDelegate](self, "dispatchedMediaRecorderDelegate");
    streamToken = self->_streamToken;
    v9 = self->_capabilities;
    delegateNotificationQueue = self->_delegateNotificationQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45__VCMediaRecorder_dispatchedSetCapabilities___block_invoke;
    block[3] = &unk_1E9E52350;
    block[4] = v7;
    block[5] = streamToken;
    v15 = v9;
    dispatch_async(delegateNotificationQueue, block);
  }
  -[VCMediaRecorder updateActiveStatus](self, "updateActiveStatus");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v13 = self->_capabilities;
      *(_DWORD *)buf = 136315906;
      v17 = v11;
      v18 = 2080;
      v19 = "-[VCMediaRecorder dispatchedSetCapabilities:]";
      v20 = 1024;
      v21 = 349;
      v22 = 1024;
      v23 = v13;
      _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCMediaRecorder set capabilities %d", buf, 0x22u);
    }
  }
}

uint64_t __45__VCMediaRecorder_dispatchedSetCapabilities___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "streamToken:didUpdateCapabilities:", *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 48));
}

- (void)setFrameRate:(float)a3
{
  NSObject *stateQueue;
  _QWORD block[5];
  float v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__VCMediaRecorder_setFrameRate___block_invoke;
  block[3] = &unk_1E9E52300;
  block[4] = self;
  v5 = a3;
  dispatch_async(stateQueue, block);
}

uint64_t __32__VCMediaRecorder_setFrameRate___block_invoke(uint64_t a1, double a2)
{
  LODWORD(a2) = *(_DWORD *)(a1 + 40);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 192), "setFrameRate:", a2);
}

- (id)dispatchedTransportDelegate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  return objc_loadWeak(&self->_transportDelegate);
}

- (void)setTransportDelegate:(id)a3
{
  NSObject *stateQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__VCMediaRecorder_setTransportDelegate___block_invoke;
  block[3] = &unk_1E9E52238;
  block[4] = self;
  block[5] = a3;
  dispatch_sync(stateQueue, block);
}

id __40__VCMediaRecorder_setTransportDelegate___block_invoke(uint64_t a1)
{
  return objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 176), *(id *)(a1 + 40));
}

- (id)dispatchedMediaRecorderDelegate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  return objc_loadWeak(&self->_delegate);
}

- (void)setMediaRecorderDelegate:(id)a3
{
  NSObject *stateQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__VCMediaRecorder_setMediaRecorderDelegate___block_invoke;
  block[3] = &unk_1E9E52238;
  block[4] = self;
  block[5] = a3;
  dispatch_sync(stateQueue, block);
}

void __44__VCMediaRecorder_setMediaRecorderDelegate___block_invoke(uint64_t a1)
{
  objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 168), *(id *)(a1 + 40));
  if (!*(_QWORD *)(a1 + 40))
    dispatch_sync(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 216), &__block_literal_global_31);
}

- (BOOL)processClientRequest:(id)a3 error:(id *)a4
{
  NSObject *stateQueue;
  char v5;
  _QWORD block[8];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__VCMediaRecorder_processClientRequest_error___block_invoke;
  block[3] = &unk_1E9E54B18;
  block[4] = self;
  block[5] = a3;
  block[6] = &v8;
  block[7] = a4;
  dispatch_sync(stateQueue, block);
  v5 = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __46__VCMediaRecorder_processClientRequest_error___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "dispatchedProcessClientRequest:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (BOOL)dispatchedProcessClientRequest:(id)a3 error:(id *)a4
{
  void *v6;
  uint64_t v7;
  NSObject *v8;
  int mode;
  unsigned int currentTimestamp;
  int v11;
  id v12;
  NSObject *delegateNotificationQueue;
  _QWORD block[7];
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
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  self->_mode = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMomentsRequestMode")), "intValue");
  v6 = (void *)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_currentTimestamp), CFSTR("vcMomentsRequestTimestamp"));
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      mode = self->_mode;
      currentTimestamp = self->_currentTimestamp;
      *(_DWORD *)buf = 136316418;
      v17 = v7;
      v18 = 2080;
      v19 = "-[VCMediaRecorder dispatchedProcessClientRequest:error:]";
      v20 = 1024;
      v21 = 403;
      v22 = 1024;
      v23 = mode;
      v24 = 1024;
      v25 = currentTimestamp;
      v26 = 2112;
      v27 = a3;
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d mode=%d, timestamp=%d, request=%@", buf, 0x32u);
    }
  }
  v11 = self->_mode;
  if (v11 == 1)
  {
    -[VCMediaRecorder dispatchedProcessRequest:](self, "dispatchedProcessRequest:", v6);
  }
  else if (v11 == 2)
  {
    v12 = -[VCMediaRecorder dispatchedTransportDelegate](self, "dispatchedTransportDelegate");
    delegateNotificationQueue = self->_delegateNotificationQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__VCMediaRecorder_dispatchedProcessClientRequest_error___block_invoke;
    block[3] = &unk_1E9E527D0;
    block[4] = v12;
    block[5] = self;
    block[6] = a3;
    dispatch_async(delegateNotificationQueue, block);
  }
  if (objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMomentsRequestState")), "intValue") == 3)-[VCMediaRecorderHistory cancelRequestWithTransactionID:](self->_mediaRecorderHistory, "cancelRequestWithTransactionID:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMomentsTransactionID")));

  return 0;
}

uint64_t __56__VCMediaRecorder_dispatchedProcessClientRequest_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "mediaRecorder:shouldProcessRequest:recipientID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("vcMomentsRequesteeID")));
}

- (void)cleanUpActiveRequests
{
  NSObject *stateQueue;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  stateQueue = self->_stateQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __40__VCMediaRecorder_cleanUpActiveRequests__block_invoke;
  v3[3] = &unk_1E9E521C0;
  v3[4] = self;
  dispatch_async(stateQueue, v3);
}

uint64_t __40__VCMediaRecorder_cleanUpActiveRequests__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dispatchedCleanUpActiveRequests");
}

- (void)dispatchedCleanUpActiveRequests
{
  const __CFString *v3;
  uint64_t v4;
  NSObject *v5;
  unsigned int streamToken;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  uint64_t v10;
  NSObject *v11;
  unsigned int v12;
  id v13;
  uint64_t v14;
  NSObject *delegateNotificationQueue;
  _QWORD v16[6];
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  const __CFString *v24;
  __int16 v25;
  VCMediaRecorder *v26;
  __int16 v27;
  unsigned int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  if (self->_currentActiveRequestsCount)
  {
    self->_lastRequest = 1;
    _VCMediaRecorder_DispatchedClearHistoryBuffer((uint64_t)self);
    dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
    VCMediaRecorderHistory_StopProcessingAllRequests((uint64_t)self->_mediaRecorderHistory);
    return;
  }
  if ((VCMediaRecorder *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_14;
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    streamToken = self->_streamToken;
    *(_DWORD *)buf = 136315906;
    v18 = v4;
    v19 = 2080;
    v20 = "-[VCMediaRecorder dispatchedCleanUpActiveRequests]";
    v21 = 1024;
    v22 = 435;
    v23 = 1024;
    LODWORD(v24) = streamToken;
    v7 = " [%s] %s:%d No active requests for token=%d";
    v8 = v5;
    v9 = 34;
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v3 = (const __CFString *)-[VCMediaRecorder performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v3 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_14;
    v10 = VRTraceErrorLogLevelToCSTR();
    v11 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    v12 = self->_streamToken;
    *(_DWORD *)buf = 136316418;
    v18 = v10;
    v19 = 2080;
    v20 = "-[VCMediaRecorder dispatchedCleanUpActiveRequests]";
    v21 = 1024;
    v22 = 435;
    v23 = 2112;
    v24 = v3;
    v25 = 2048;
    v26 = self;
    v27 = 1024;
    v28 = v12;
    v7 = " [%s] %s:%d %@(%p) No active requests for token=%d";
    v8 = v11;
    v9 = 54;
  }
  _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, v7, buf, v9);
LABEL_14:
  v13 = -[VCMediaRecorder dispatchedMediaRecorderDelegate](self, "dispatchedMediaRecorderDelegate");
  v14 = self->_streamToken;
  delegateNotificationQueue = self->_delegateNotificationQueue;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __50__VCMediaRecorder_dispatchedCleanUpActiveRequests__block_invoke;
  v16[3] = &unk_1E9E52960;
  v16[4] = v13;
  v16[5] = v14;
  dispatch_async(delegateNotificationQueue, v16);
}

uint64_t __50__VCMediaRecorder_dispatchedCleanUpActiveRequests__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "streamTokenDidCleanupAllRequests:", *(_QWORD *)(a1 + 40));
}

void __VCMediaRecorder_StopProcessingAllRequests_block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(v1 + 208));
  VCMediaRecorderHistory_StopProcessingAllRequests(*(_QWORD *)(v1 + 192));
}

void __VCMediaRecorder_ClearHistoryBuffer_block_invoke(uint64_t a1)
{
  _VCMediaRecorder_DispatchedClearHistoryBuffer(*(_QWORD *)(a1 + 32));
}

- (void)registerClient
{
  uint64_t v3;
  NSObject *v4;
  NSObject *stateQueue;
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
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v8 = v3;
      v9 = 2080;
      v10 = "-[VCMediaRecorder registerClient]";
      v11 = 1024;
      v12 = 484;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ", buf, 0x1Cu);
    }
  }
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__VCMediaRecorder_registerClient__block_invoke;
  block[3] = &unk_1E9E521C0;
  block[4] = self;
  dispatch_sync(stateQueue, block);
}

uint64_t __33__VCMediaRecorder_registerClient__block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 229) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "updateActiveStatus");
}

- (void)deregisterClient
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
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315650;
      v6 = v3;
      v7 = 2080;
      v8 = "-[VCMediaRecorder deregisterClient]";
      v9 = 1024;
      v10 = 493;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ", (uint8_t *)&v5, 0x1Cu);
    }
  }
  self->_isClientRegistered = 0;
  -[VCMediaRecorder updateActiveStatus](self, "updateActiveStatus");
}

- (void)invalidate
{
  NSObject *stateQueue;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  stateQueue = self->_stateQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __29__VCMediaRecorder_invalidate__block_invoke;
  v3[3] = &unk_1E9E521C0;
  v3[4] = self;
  dispatch_sync(stateQueue, v3);
}

void __29__VCMediaRecorder_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v2;

  objc_msgSend(*(id *)(a1 + 32), "deregisterClient");
  _VCMediaRecorder_DispatchedClearHistoryBuffer(*(_QWORD *)(a1 + 32));
  v2 = *(_QWORD *)(a1 + 32);
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(v2 + 208));
  VCMediaRecorderHistory_StopProcessingAllRequests(*(_QWORD *)(v2 + 192));
}

- (void)updateActiveStatus
{
  _BOOL4 isActive;
  unsigned int capabilities;
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  _BOOL4 v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  NSObject *v13;
  _BOOL4 v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  VCMediaRecorder *v24;
  __int16 v25;
  _BOOL4 v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  isActive = self->_isActive;
  LOBYTE(capabilities) = self->_isClientRegistered;
  if ((_BYTE)capabilities)
  {
    if (-[VCMediaRecorder isHistorySupported](self, "isHistorySupported"))
    {
      capabilities = self->_capabilities;
      if (capabilities)
      {
        VCMediaRecorderHistory_UpdateTargetScreenAttributes((uint64_t)self->_mediaRecorderHistory, self->_targetScreenAttributes);
        LOBYTE(capabilities) = 1;
      }
    }
    else
    {
      LOBYTE(capabilities) = 0;
    }
  }
  self->_isActive = capabilities;
  if (self->_isActive != isActive)
  {
    if ((VCMediaRecorder *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v6 = VRTraceErrorLogLevelToCSTR();
        v7 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v8 = self->_isActive;
          v15 = 136315906;
          v16 = v6;
          v17 = 2080;
          v18 = "-[VCMediaRecorder updateActiveStatus]";
          v19 = 1024;
          v20 = 518;
          v21 = 1024;
          LODWORD(v22) = v8;
          v9 = " [%s] %s:%d isActive=%{BOOL}d";
          v10 = v7;
          v11 = 34;
LABEL_17:
          _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v15, v11);
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v5 = (const __CFString *)-[VCMediaRecorder performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v5 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v12 = VRTraceErrorLogLevelToCSTR();
        v13 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v14 = self->_isActive;
          v15 = 136316418;
          v16 = v12;
          v17 = 2080;
          v18 = "-[VCMediaRecorder updateActiveStatus]";
          v19 = 1024;
          v20 = 518;
          v21 = 2112;
          v22 = v5;
          v23 = 2048;
          v24 = self;
          v25 = 1024;
          v26 = v14;
          v9 = " [%s] %s:%d %@(%p) isActive=%{BOOL}d";
          v10 = v13;
          v11 = 54;
          goto LABEL_17;
        }
      }
    }
  }
}

- (void)setUpReportingAgent
{
  const __CFString *v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  uint64_t v9;
  NSObject *v10;
  const void *Agent;
  uint8_t buf[4];
  uint64_t v13;
  __int128 v14;
  _BYTE v15[108];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if ((VCMediaRecorder *)objc_opt_class() != self)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v3 = (const __CFString *)-[VCMediaRecorder performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v3 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 6)
      goto LABEL_12;
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    *(_DWORD *)buf = 136316162;
    v13 = v9;
    LOWORD(v14) = 2080;
    *(_QWORD *)((char *)&v14 + 2) = "-[VCMediaRecorder setUpReportingAgent]";
    WORD5(v14) = 1024;
    HIDWORD(v14) = 523;
    *(_WORD *)v15 = 2112;
    *(_QWORD *)&v15[2] = v3;
    *(_WORD *)&v15[10] = 2048;
    *(_QWORD *)&v15[12] = self;
    v6 = " [%s] %s:%d %@(%p) Register Reporting Agent";
    v7 = v10;
    v8 = 48;
    goto LABEL_11;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v13 = v4;
      LOWORD(v14) = 2080;
      *(_QWORD *)((char *)&v14 + 2) = "-[VCMediaRecorder setUpReportingAgent]";
      WORD5(v14) = 1024;
      HIDWORD(v14) = 523;
      v6 = " [%s] %s:%d Register Reporting Agent";
      v7 = v5;
      v8 = 28;
LABEL_11:
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
    }
  }
LABEL_12:
  *(_DWORD *)buf = VCUniqueIDGenerator_GenerateID();
  *(_QWORD *)&v14 = 0;
  v13 = 0;
  *((_QWORD *)&v14 + 1) = 0x700000000;
  memset(v15, 0, sizeof(v15));
  Agent = (const void *)reportingCreateAgent();
  -[VCObject setReportingAgent:](self, "setReportingAgent:", Agent);
  if (Agent)
    CFRelease(Agent);
  objc_msgSend(MEMORY[0x1E0CF26A0], "weakObjectHolderWithObject:", self);
  -[VCObject reportingAgent](self, "reportingAgent");
  reportingSetUserInfo();
}

void __38__VCMediaRecorder_setUpReportingAgent__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  const __CFString *v4;
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
  const __CFString *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a2, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "strong");
    v3 = objc_opt_class();
    if (v3 == objc_msgSend(*(id *)(a1 + 32), "strong"))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          __38__VCMediaRecorder_setUpReportingAgent__block_invoke_cold_1();
      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "strong");
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v4 = (const __CFString *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "strong"), "performSelector:", sel_logPrefix);
      else
        v4 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v5 = VRTraceErrorLogLevelToCSTR();
        v6 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v7 = objc_msgSend(*(id *)(a1 + 32), "strong");
          v8 = 136316162;
          v9 = v5;
          v10 = 2080;
          v11 = "-[VCMediaRecorder setUpReportingAgent]_block_invoke";
          v12 = 1024;
          v13 = 535;
          v14 = 2112;
          v15 = v4;
          v16 = 2048;
          v17 = v7;
          _os_log_error_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Reporting not available (no backends)", (uint8_t *)&v8, 0x30u);
        }
      }
    }
  }
}

- (void)reportingMediaRecorderLivePhotoWithRequest:(id)a3
{
  unsigned __int8 v4;
  unsigned __int8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const __CFString *v9;
  id v10;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  v4 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMomentsRequestState")), "intValue");
  v5 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMomentsMediaType")), "intValue");
  v6 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMomentsRequesteeID"));
  v7 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMomentsFileSize")), "longLongValue");
  v8 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMomentsRequestDidSucceed")), "BOOLValue");
  v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v4), CFSTR("VCMRState"));
  objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v5), CFSTR("VCMRMediaType"));
  if (v6)
    v9 = (const __CFString *)v6;
  else
    v9 = &stru_1E9E58EE0;
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, CFSTR("VCMRRecipientUUID"));
  objc_msgSend(v10, "setObject:forKeyedSubscript:", &unk_1E9EF4AF0, CFSTR("VCMRMode"));
  if (objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMomentsFileSize")))
    objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v7), CFSTR("VCMRFileSize"));
  if (objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMomentsRequestDidSucceed")))
    objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8), CFSTR("VCMRFinishDidSucceed"));
  reportingMediaRecorderEvents();

}

- (void)reportingMediaRecorderWithRequest:(id)a3 fileLength:(double)a4 fileSize:(unint64_t)a5
{
  unsigned __int8 v8;
  unsigned __int8 v9;
  uint64_t v10;
  const __CFString *v11;
  uint64_t v12;
  const __CFString *v13;
  uint64_t v14;
  id v15;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  v8 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMomentsRequestState")), "intValue");
  v9 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMomentsMediaType")), "intValue");
  v10 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMomentsRequesteeID"));
  v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v15, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v8), CFSTR("VCMRState"));
  objc_msgSend(v15, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v9), CFSTR("VCMRMediaType"));
  if (v10)
    v11 = (const __CFString *)v10;
  else
    v11 = &stru_1E9E58EE0;
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v11, CFSTR("VCMRRecipientUUID"));
  objc_msgSend(v15, "setObject:forKeyedSubscript:", &unk_1E9EF4B08, CFSTR("VCMRMode"));
  if (v8 == 4)
  {
    v14 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMomentsRequestDidSucceed")), "BOOLValue");
    v12 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v14);
    v13 = CFSTR("VCMRFinishDidSucceed");
    goto LABEL_8;
  }
  if (v8 == 2)
  {
    objc_msgSend(v15, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a5), CFSTR("VCMRFileSize"));
    v12 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
    v13 = CFSTR("VCMRFileLength");
LABEL_8:
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v12, v13);
  }
  reportingMediaRecorderEvents();

}

- (void)processRemoteRequest:(id)a3 withMediaType:(unsigned __int8)a4
{
  unsigned int v4;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t streamToken;
  id v11;
  VCMediaRecorderHistoryRequestContext *v12;
  uint64_t v13;
  NSObject *v14;
  VCMediaRecorderHistory *mediaRecorderHistory;
  CFStringRef v16;
  uint64_t v17;
  NSObject *v18;
  BOOL v19;
  VCMediaRecorderHistory *v20;
  char v21;
  NSObject *delegateNotificationQueue;
  _QWORD *v23;
  _QWORD v24[7];
  _QWORD block[7];
  _QWORD v26[8];
  char v27;
  _QWORD v28[8];
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  VCMediaRecorder *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v4 = a4;
  v39 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  v7 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMomentsTransactionID"));
  v8 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMomentsRequestState")), "intValue");
  v9 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMomentsRequestTimestamp")), "intValue");
  streamToken = self->_streamToken;
  v11 = -[VCMediaRecorder dispatchedMediaRecorderDelegate](self, "dispatchedMediaRecorderDelegate");
  switch(v8)
  {
    case 1:
      if (+[VCMediaRecorder deviceHasSufficientFreeSpace](VCMediaRecorder, "deviceHasSufficientFreeSpace"))
      {
        v12 = -[VCMediaRecorderHistoryRequestContext initWithSerializedRequest:]([VCMediaRecorderHistoryRequestContext alloc], "initWithSerializedRequest:", a3);
        MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ VCMediaRecorder-startRecording");
        if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
        {
          v13 = VRTraceErrorLogLevelToCSTR();
          v14 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316162;
            v30 = v13;
            v31 = 2080;
            v32 = "-[VCMediaRecorder processRemoteRequest:withMediaType:]";
            v33 = 1024;
            v34 = 612;
            v35 = 2112;
            v36 = self;
            v37 = 2112;
            v38 = v12;
            _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ VCMediaRecorder-startRecording instance=%@, requestContext=%@", buf, 0x30u);
          }
        }
        mediaRecorderHistory = self->_mediaRecorderHistory;
        v28[0] = MEMORY[0x1E0C809B0];
        v28[1] = 3221225472;
        v28[2] = __54__VCMediaRecorder_processRemoteRequest_withMediaType___block_invoke;
        v28[3] = &unk_1E9E54B68;
        v28[4] = self;
        v28[5] = a3;
        v28[6] = v11;
        v28[7] = streamToken;
        -[VCMediaRecorderHistory startRecordingWithContext:completionHandler:](mediaRecorderHistory, "startRecordingWithContext:completionHandler:", v12, v28);

      }
      else
      {
        -[VCMediaRecorder handleInsufficientFreeSpaceWithRequest:delegate:](self, "handleInsufficientFreeSpaceWithRequest:delegate:", a3, v11);
      }
      break;
    case 2:
      v16 = VCMediaRecorderUtil_CopyDescriptionForMediaType((const __CFAllocator *)*MEMORY[0x1E0C9AE00], v4);
      MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ VCMediaRecorder-endRecording");
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v17 = VRTraceErrorLogLevelToCSTR();
        v18 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          v30 = v17;
          v31 = 2080;
          v32 = "-[VCMediaRecorder processRemoteRequest:withMediaType:]";
          v33 = 1024;
          v34 = 630;
          v35 = 2112;
          v36 = self;
          v37 = 2112;
          v38 = (void *)v16;
          _os_log_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ VCMediaRecorder-endRecording instance=%@, mediaType=%@", buf, 0x30u);
        }
      }
      if (v16)
        CFRelease(v16);
      v19 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaRecorderDirectoryURL")) == 0;
      --self->_currentActiveRequestsCount;
      v20 = self->_mediaRecorderHistory;
      v21 = v19;
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __54__VCMediaRecorder_processRemoteRequest_withMediaType___block_invoke_59;
      v26[3] = &unk_1E9E54BB8;
      v26[4] = self;
      v26[5] = a3;
      v27 = v21;
      v26[6] = v11;
      v26[7] = streamToken;
      -[VCMediaRecorderHistory endRecording:timestamp:completionHandler:](v20, "endRecording:timestamp:completionHandler:", v7, v9, v26);
      break;
    case 3:
      delegateNotificationQueue = self->_delegateNotificationQueue;
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __54__VCMediaRecorder_processRemoteRequest_withMediaType___block_invoke_3;
      v24[3] = &unk_1E9E53820;
      v24[5] = a3;
      v24[6] = streamToken;
      v24[4] = v11;
      v23 = v24;
      goto LABEL_18;
    case 4:
      -[VCMediaRecorder reportingMediaRecorderWithRequest:fileLength:fileSize:](self, "reportingMediaRecorderWithRequest:fileLength:fileSize:", a3, 0, 0.0);
      delegateNotificationQueue = self->_delegateNotificationQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __54__VCMediaRecorder_processRemoteRequest_withMediaType___block_invoke_2_63;
      block[3] = &unk_1E9E53820;
      block[4] = a3;
      block[5] = v11;
      block[6] = streamToken;
      v23 = block;
LABEL_18:
      dispatch_async(delegateNotificationQueue, v23);
      break;
    default:
      return;
  }
}

void __54__VCMediaRecorder_processRemoteRequest_withMediaType___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  _QWORD block[4];
  int8x16_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 208));
  if (!a2)
    ++*(_DWORD *)(*(_QWORD *)(a1 + 32) + 224);
  objc_msgSend(*(id *)(a1 + 32), "reportingMediaRecorderWithRequest:fileLength:fileSize:", *(_QWORD *)(a1 + 40), 0, 0.0);
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 216);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__VCMediaRecorder_processRemoteRequest_withMediaType___block_invoke_2;
  block[3] = &unk_1E9E54B40;
  v5 = *(_QWORD *)(a1 + 56);
  v7 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
  v8 = a2;
  v9 = v5;
  dispatch_async(v4, block);
}

uint64_t __54__VCMediaRecorder_processRemoteRequest_withMediaType___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "streamToken:didStartProcessingRequest:error:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __54__VCMediaRecorder_processRemoteRequest_withMediaType___block_invoke_59(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v6;
  double v7;
  double v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  _QWORD block[5];
  int8x16_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v19 = a4;
  v6 = +[VCFileUtil sizeOfFile:](VCFileUtil, "sizeOfFile:");
  +[VCFileUtil contentLengthOfFile:](VCFileUtil, "contentLengthOfFile:", a3);
  v8 = v7;
  if (!+[VCMediaRecorder validateNonzeroAudioRecordingLengthURL:error:](VCMediaRecorder, "validateNonzeroAudioRecordingLengthURL:error:", a3, &v19)&& (int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v21 = v9;
      v22 = 2080;
      v23 = "-[VCMediaRecorder processRemoteRequest:withMediaType:]_block_invoke";
      v24 = 1024;
      v25 = 640;
      v26 = 2112;
      v27 = a3;
      v28 = 2112;
      v29 = v19;
      _os_log_error_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed audio recording length validation movieURL=%@, error=%@", buf, 0x30u);
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "reportingMediaRecorderWithRequest:fileLength:fileSize:", *(_QWORD *)(a1 + 40), v6, v8);
  v11 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 216);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__VCMediaRecorder_processRemoteRequest_withMediaType___block_invoke_61;
  block[3] = &unk_1E9E54B90;
  block[4] = a3;
  v18 = *(_BYTE *)(a1 + 64);
  v12 = *(_QWORD *)(a1 + 56);
  v15 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
  v16 = v19;
  v17 = v12;
  dispatch_async(v11, block);
  return objc_msgSend(*(id *)(a1 + 32), "notifyFinishWithRequest:didSucceed:fileSize:", *(_QWORD *)(a1 + 40), v19 == 0, v6);
}

uint64_t __54__VCMediaRecorder_processRemoteRequest_withMediaType___block_invoke_61(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  _QWORD v4[2];
  unint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v1 = *(void **)(a1 + 40);
  v4[0] = 0;
  v4[1] = v2;
  v5 = 0xAAAAAAAAAAAAAAAALL;
  LOBYTE(v5) = *(_BYTE *)(a1 + 72);
  return objc_msgSend(v1, "streamToken:didEndProcessingRequest:urlContext:error:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48), v4, *(_QWORD *)(a1 + 56));
}

uint64_t __54__VCMediaRecorder_processRemoteRequest_withMediaType___block_invoke_2_63(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 40), "streamToken:didFinishRequest:didSucceed:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("vcMomentsRequestDidSucceed")), "BOOLValue"));
}

uint64_t __54__VCMediaRecorder_processRemoteRequest_withMediaType___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "streamToken:didFinishRequest:didSucceed:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), 0);
}

- (void)processRemoteLivePhotoRequest:(id)a3
{
  uint64_t streamToken;
  id v6;
  int v7;
  NSObject *v8;
  uint64_t v9;
  VCMediaRecorderHistoryRequestContext *v10;
  uint64_t v11;
  NSObject *v12;
  BOOL v13;
  VCMediaRecorderHistory *mediaRecorderHistory;
  NSObject *delegateNotificationQueue;
  _QWORD *v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  _QWORD v20[7];
  _QWORD v21[7];
  _QWORD v22[8];
  _QWORD v23[8];
  BOOL v24;
  _QWORD block[7];
  uint64_t v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  VCMediaRecorder *v34;
  __int16 v35;
  VCMediaRecorderHistoryRequestContext *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  MEMORY[0x1DF087EC4](&dword_1D8A54000, "-[VCMediaRecorder processRemoteLivePhotoRequest:]");
  streamToken = self->_streamToken;
  v6 = -[VCMediaRecorder dispatchedMediaRecorderDelegate](self, "dispatchedMediaRecorderDelegate");
  v26 = 0;
  v7 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMomentsRequestState")), "intValue");
  switch(v7)
  {
    case 4:
      -[VCMediaRecorder reportingMediaRecorderLivePhotoWithRequest:](self, "reportingMediaRecorderLivePhotoWithRequest:", a3);
      delegateNotificationQueue = self->_delegateNotificationQueue;
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __49__VCMediaRecorder_processRemoteLivePhotoRequest___block_invoke_2_67;
      v21[3] = &unk_1E9E53820;
      v21[4] = a3;
      v21[5] = v6;
      v21[6] = streamToken;
      v16 = v21;
      goto LABEL_12;
    case 3:
      delegateNotificationQueue = self->_delegateNotificationQueue;
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __49__VCMediaRecorder_processRemoteLivePhotoRequest___block_invoke_3;
      v20[3] = &unk_1E9E53820;
      v20[5] = a3;
      v20[6] = streamToken;
      v20[4] = v6;
      v16 = v20;
LABEL_12:
      dispatch_async(delegateNotificationQueue, v16);
      return;
    case 1:
      if (+[VCMediaRecorder deviceHasSufficientFreeSpace](VCMediaRecorder, "deviceHasSufficientFreeSpace"))
      {
        v8 = self->_delegateNotificationQueue;
        v9 = MEMORY[0x1E0C809B0];
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __49__VCMediaRecorder_processRemoteLivePhotoRequest___block_invoke;
        block[3] = &unk_1E9E53820;
        block[5] = a3;
        block[6] = streamToken;
        block[4] = v6;
        dispatch_async(v8, block);
        if (-[VCMediaRecorder validateNumberOfRequestsWithError:](self, "validateNumberOfRequestsWithError:", &v26))
        {
          ++self->_currentActiveRequestsCount;
          v10 = -[VCMediaRecorderHistoryRequestContext initWithSerializedRequest:]([VCMediaRecorderHistoryRequestContext alloc], "initWithSerializedRequest:", a3);
          MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ VCMediaRecorder-startRecording");
          if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
          {
            v11 = VRTraceErrorLogLevelToCSTR();
            v12 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136316162;
              v28 = v11;
              v29 = 2080;
              v30 = "-[VCMediaRecorder processRemoteLivePhotoRequest:]";
              v31 = 1024;
              v32 = 696;
              v33 = 2112;
              v34 = self;
              v35 = 2112;
              v36 = v10;
              _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ VCMediaRecorder-startRecording instance=%@, requestContext=%@", buf, 0x30u);
            }
          }
          v13 = -[VCMediaRecorderHistoryRequestContext hasDirectoryURL](v10, "hasDirectoryURL");
          mediaRecorderHistory = self->_mediaRecorderHistory;
          v23[0] = v9;
          v23[1] = 3221225472;
          v23[2] = __49__VCMediaRecorder_processRemoteLivePhotoRequest___block_invoke_64;
          v23[3] = &unk_1E9E54BB8;
          v24 = !v13;
          v23[4] = self;
          v23[5] = v6;
          v23[6] = a3;
          v23[7] = streamToken;
          -[VCMediaRecorderHistory takeLivePhotoWithContext:completionHandler:](mediaRecorderHistory, "takeLivePhotoWithContext:completionHandler:", v10, v23);

        }
        else
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            v17 = VRTraceErrorLogLevelToCSTR();
            v18 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              -[VCMediaRecorder processRemoteLivePhotoRequest:].cold.1(v17, (uint64_t)self, v18);
          }
          v19 = self->_delegateNotificationQueue;
          v22[0] = v9;
          v22[1] = 3221225472;
          v22[2] = __49__VCMediaRecorder_processRemoteLivePhotoRequest___block_invoke_66;
          v22[3] = &unk_1E9E54B40;
          v22[4] = v6;
          v22[5] = a3;
          v22[6] = v26;
          v22[7] = streamToken;
          dispatch_async(v19, v22);
          -[VCMediaRecorder notifyFinishWithRequest:didSucceed:fileSize:](self, "notifyFinishWithRequest:didSucceed:fileSize:", a3, 0, 0);
        }
      }
      else
      {
        -[VCMediaRecorder handleInsufficientFreeSpaceWithRequest:delegate:](self, "handleInsufficientFreeSpaceWithRequest:delegate:", a3, v6);
      }
      break;
  }
}

uint64_t __49__VCMediaRecorder_processRemoteLivePhotoRequest___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "streamToken:didStartProcessingRequest:error:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), 0);
}

uint64_t __49__VCMediaRecorder_processRemoteLivePhotoRequest___block_invoke_64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  BOOL v9;
  BOOL v10;
  char v11;
  unint64_t v12;
  unint64_t v13;
  NSObject *v14;
  uint64_t v15;
  _QWORD v17[6];
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  char v22;
  BOOL v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 208));
  --*(_DWORD *)(*(_QWORD *)(a1 + 32) + 224);
  v8 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v8 + 248))
    v9 = *(_DWORD *)(v8 + 224) == 0;
  else
    v9 = 0;
  if (a2)
    v10 = a3 == 0;
  else
    v10 = 1;
  v11 = !v10;
  if (v10)
  {
    v13 = 0;
  }
  else
  {
    v12 = +[VCFileUtil sizeOfFile:](VCFileUtil, "sizeOfFile:", a2);
    v13 = +[VCFileUtil sizeOfFile:](VCFileUtil, "sizeOfFile:", a3) + v12;
    v8 = *(_QWORD *)(a1 + 32);
  }
  v14 = *(NSObject **)(v8 + 216);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __49__VCMediaRecorder_processRemoteLivePhotoRequest___block_invoke_2;
  v17[3] = &unk_1E9E54BE0;
  v21 = v11;
  v17[4] = a2;
  v17[5] = a3;
  v22 = *(_BYTE *)(a1 + 64);
  v15 = *(_QWORD *)(a1 + 56);
  v18 = *(_OWORD *)(a1 + 40);
  v19 = a4;
  v20 = v15;
  v23 = v9;
  dispatch_async(v14, v17);
  return objc_msgSend(*(id *)(a1 + 32), "notifyFinishWithRequest:didSucceed:fileSize:", *(_QWORD *)(a1 + 48), a4 == 0, v13);
}

uint64_t __49__VCMediaRecorder_processRemoteLivePhotoRequest___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t result;
  __int128 v5;
  unint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 80))
  {
    v6 = 0xAAAAAAAAAAAAAAAALL;
    v5 = *(_OWORD *)(a1 + 32);
    LOBYTE(v6) = *(_BYTE *)(a1 + 81);
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v2 = VRTraceErrorLogLevelToCSTR();
      v3 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __49__VCMediaRecorder_processRemoteLivePhotoRequest___block_invoke_2_cold_1(v2, (_QWORD *)a1, v3);
    }
    v5 = 0uLL;
    v6 = 0;
  }
  result = objc_msgSend(*(id *)(a1 + 48), "streamToken:didEndProcessingRequest:urlContext:error:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 56), &v5, *(_QWORD *)(a1 + 64));
  if (*(_BYTE *)(a1 + 82))
    return objc_msgSend(*(id *)(a1 + 48), "streamTokenDidCleanupAllRequests:", *(_QWORD *)(a1 + 72), v5, v6, v7);
  return result;
}

uint64_t __49__VCMediaRecorder_processRemoteLivePhotoRequest___block_invoke_66(uint64_t a1)
{
  _QWORD v2[4];

  v2[3] = *MEMORY[0x1E0C80C00];
  memset(v2, 0, 24);
  return objc_msgSend(*(id *)(a1 + 32), "streamToken:didEndProcessingRequest:urlContext:error:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), v2, *(_QWORD *)(a1 + 48));
}

uint64_t __49__VCMediaRecorder_processRemoteLivePhotoRequest___block_invoke_2_67(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 40), "streamToken:didFinishRequest:didSucceed:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("vcMomentsRequestDidSucceed")), "BOOLValue"));
}

uint64_t __49__VCMediaRecorder_processRemoteLivePhotoRequest___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "streamToken:didFinishRequest:didSucceed:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), 0);
}

- (void)processRemotePhotoRequest:(id)a3
{
  uint64_t streamToken;
  id v6;
  int v7;
  NSObject *v8;
  uint64_t v9;
  VCMediaRecorderHistoryRequestContext *v10;
  BOOL v11;
  VCMediaRecorderHistory *mediaRecorderHistory;
  NSObject *delegateNotificationQueue;
  _QWORD *v14;
  _QWORD v15[7];
  _QWORD v16[7];
  _QWORD v17[8];
  BOOL v18;
  _QWORD block[8];

  block[7] = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  MEMORY[0x1DF087EC4](&dword_1D8A54000, "-[VCMediaRecorder processRemotePhotoRequest:]");
  streamToken = self->_streamToken;
  v6 = -[VCMediaRecorder dispatchedMediaRecorderDelegate](self, "dispatchedMediaRecorderDelegate");
  v7 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMomentsRequestState")), "intValue");
  switch(v7)
  {
    case 4:
      delegateNotificationQueue = self->_delegateNotificationQueue;
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __45__VCMediaRecorder_processRemotePhotoRequest___block_invoke_4;
      v16[3] = &unk_1E9E53820;
      v16[4] = a3;
      v16[5] = v6;
      v16[6] = streamToken;
      v14 = v16;
      goto LABEL_8;
    case 3:
      delegateNotificationQueue = self->_delegateNotificationQueue;
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __45__VCMediaRecorder_processRemotePhotoRequest___block_invoke_5;
      v15[3] = &unk_1E9E53820;
      v15[5] = a3;
      v15[6] = streamToken;
      v15[4] = v6;
      v14 = v15;
LABEL_8:
      dispatch_async(delegateNotificationQueue, v14);
      return;
    case 1:
      if (+[VCMediaRecorder deviceHasSufficientFreeSpace](VCMediaRecorder, "deviceHasSufficientFreeSpace"))
      {
        v8 = self->_delegateNotificationQueue;
        v9 = MEMORY[0x1E0C809B0];
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __45__VCMediaRecorder_processRemotePhotoRequest___block_invoke;
        block[3] = &unk_1E9E53820;
        block[5] = a3;
        block[6] = streamToken;
        block[4] = v6;
        dispatch_async(v8, block);
        v10 = -[VCMediaRecorderHistoryRequestContext initWithSerializedRequest:]([VCMediaRecorderHistoryRequestContext alloc], "initWithSerializedRequest:", a3);
        v11 = -[VCMediaRecorderHistoryRequestContext hasDirectoryURL](v10, "hasDirectoryURL");
        mediaRecorderHistory = self->_mediaRecorderHistory;
        v17[0] = v9;
        v17[1] = 3221225472;
        v17[2] = __45__VCMediaRecorder_processRemotePhotoRequest___block_invoke_2;
        v17[3] = &unk_1E9E54BB8;
        v18 = !v11;
        v17[4] = self;
        v17[5] = v6;
        v17[6] = a3;
        v17[7] = streamToken;
        -[VCMediaRecorderHistory takePhotoWithContext:completionHandler:](mediaRecorderHistory, "takePhotoWithContext:completionHandler:", v10, v17);

      }
      else
      {
        -[VCMediaRecorder handleInsufficientFreeSpaceWithRequest:delegate:](self, "handleInsufficientFreeSpaceWithRequest:delegate:", a3, v6);
      }
      break;
  }
}

uint64_t __45__VCMediaRecorder_processRemotePhotoRequest___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "streamToken:didStartProcessingRequest:error:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), 0);
}

uint64_t __45__VCMediaRecorder_processRemotePhotoRequest___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v7;
  NSObject *v8;
  uint64_t v9;
  _QWORD block[5];
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v7 = +[VCFileUtil sizeOfFile:](VCFileUtil, "sizeOfFile:", a2);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 216);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__VCMediaRecorder_processRemotePhotoRequest___block_invoke_3;
  block[3] = &unk_1E9E54B90;
  block[4] = a2;
  v15 = *(_BYTE *)(a1 + 64);
  v9 = *(_QWORD *)(a1 + 56);
  v12 = *(_OWORD *)(a1 + 40);
  v13 = a4;
  v14 = v9;
  dispatch_async(v8, block);
  return objc_msgSend(*(id *)(a1 + 32), "notifyFinishWithRequest:didSucceed:fileSize:", *(_QWORD *)(a1 + 48), a4 == 0, v7);
}

uint64_t __45__VCMediaRecorder_processRemotePhotoRequest___block_invoke_3(uint64_t a1)
{
  void *v1;
  _QWORD v3[2];
  unint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3[1] = 0;
  v4 = 0xAAAAAAAAAAAAAAAALL;
  v1 = *(void **)(a1 + 40);
  v3[0] = *(_QWORD *)(a1 + 32);
  LOBYTE(v4) = *(_BYTE *)(a1 + 72);
  return objc_msgSend(v1, "streamToken:didEndProcessingRequest:urlContext:error:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48), v3, *(_QWORD *)(a1 + 56));
}

uint64_t __45__VCMediaRecorder_processRemotePhotoRequest___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 40), "streamToken:didFinishRequest:didSucceed:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("vcMomentsRequestDidSucceed")), "BOOLValue"));
}

uint64_t __45__VCMediaRecorder_processRemotePhotoRequest___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "streamToken:didFinishRequest:didSucceed:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), 0);
}

- (void)notifyFinishWithRequest:(id)a3 didSucceed:(BOOL)a4 fileSize:(int64_t)a5
{
  _BOOL8 v6;
  uint64_t v9;
  NSObject *v10;
  int mode;
  int v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  int v20;
  __int16 v21;
  _BOOL4 v22;
  __int16 v23;
  int64_t v24;
  uint64_t v25;

  v6 = a4;
  v25 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  if ((int)VRTraceGetErrorLogLevelForModule() > 6)
  {
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      mode = self->_mode;
      v13 = 136316418;
      v14 = v9;
      v15 = 2080;
      v16 = "-[VCMediaRecorder notifyFinishWithRequest:didSucceed:fileSize:]";
      v17 = 1024;
      v18 = 810;
      v19 = 1024;
      v20 = mode;
      v21 = 1024;
      v22 = v6;
      v23 = 2048;
      v24 = a5;
      _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d mode=%d, didSucceed=%d, fileSize=%ld", (uint8_t *)&v13, 0x32u);
    }
  }
  v12 = self->_mode;
  if (v12 == 1)
  {
    -[VCMediaRecorder notifyLocalFinishWithRequest:didSucceed:fileSize:](self, "notifyLocalFinishWithRequest:didSucceed:fileSize:", a3, v6, a5);
  }
  else if (v12 == 2)
  {
    -[VCMediaRecorder notifyRemoteFinishWithRequest:didSucceed:fileSize:](self, "notifyRemoteFinishWithRequest:didSucceed:fileSize:", a3, v6, a5);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCMediaRecorder notifyFinishWithRequest:didSucceed:fileSize:].cold.1();
  }
}

- (void)notifyRemoteFinishWithRequest:(id)a3 didSucceed:(BOOL)a4 fileSize:(int64_t)a5
{
  _BOOL8 v6;
  void *v9;
  id v10;
  NSObject *delegateNotificationQueue;
  _QWORD v12[8];

  v6 = a4;
  v12[7] = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  v9 = (void *)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v9, "setObject:forKeyedSubscript:", &unk_1E9EF4B20, CFSTR("vcMomentsRequestState"));
  objc_msgSend(v9, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6), CFSTR("vcMomentsRequestDidSucceed"));
  objc_msgSend(v9, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", a5), CFSTR("vcMomentsFileSize"));
  v10 = -[VCMediaRecorder dispatchedTransportDelegate](self, "dispatchedTransportDelegate");
  delegateNotificationQueue = self->_delegateNotificationQueue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __69__VCMediaRecorder_notifyRemoteFinishWithRequest_didSucceed_fileSize___block_invoke;
  v12[3] = &unk_1E9E527D0;
  v12[4] = v10;
  v12[5] = self;
  v12[6] = v9;
  dispatch_async(delegateNotificationQueue, v12);

}

uint64_t __69__VCMediaRecorder_notifyRemoteFinishWithRequest_didSucceed_fileSize___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "mediaRecorder:shouldProcessRequest:recipientID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("vcMomentsRequesterID")));
}

- (void)notifyLocalFinishWithRequest:(id)a3 didSucceed:(BOOL)a4 fileSize:(int64_t)a5
{
  _BOOL8 v6;
  id v9;

  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  v9 = (id)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v9, "setObject:forKeyedSubscript:", &unk_1E9EF4B20, CFSTR("vcMomentsRequestState"));
  objc_msgSend(v9, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6), CFSTR("vcMomentsRequestDidSucceed"));
  objc_msgSend(v9, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", a5), CFSTR("vcMomentsFileSize"));
  -[VCMediaRecorder dispatchedProcessRequest:](self, "dispatchedProcessRequest:", v9);

}

- (BOOL)validateNumberOfRequestsWithError:(id *)a3
{
  int currentActiveRequestsCount;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  currentActiveRequestsCount = self->_currentActiveRequestsCount;
  if (a3 && currentActiveRequestsCount >= 100000)
    *a3 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("VCMediaRecorderError"), -1, 0);
  return currentActiveRequestsCount < 100000;
}

- (BOOL)isHistorySupported
{
  return -[VCVideoRuleCollectionsMediaRecorder mediaRecorderCapabilities](+[VCVideoRuleCollectionsMediaRecorder sharedInstance](VCVideoRuleCollectionsMediaRecorder, "sharedInstance"), "mediaRecorderCapabilities") != 0;
}

- (void)handleInsufficientFreeSpaceWithRequest:(id)a3 delegate:(id)a4
{
  uint64_t v7;
  uint64_t streamToken;
  NSObject *delegateNotificationQueue;
  _QWORD block[9];

  block[8] = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  -[VCMediaRecorder notifyFinishWithRequest:didSucceed:fileSize:](self, "notifyFinishWithRequest:didSucceed:fileSize:", a3, 0, 0);
  v7 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("VCMediaRecorderError"), -2, 0);
  streamToken = self->_streamToken;
  delegateNotificationQueue = self->_delegateNotificationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__VCMediaRecorder_handleInsufficientFreeSpaceWithRequest_delegate___block_invoke;
  block[3] = &unk_1E9E54B40;
  block[4] = a4;
  block[5] = a3;
  block[6] = v7;
  block[7] = streamToken;
  dispatch_async(delegateNotificationQueue, block);
}

uint64_t __67__VCMediaRecorder_handleInsufficientFreeSpaceWithRequest_delegate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "streamToken:didStartProcessingRequest:error:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

+ (BOOL)validateNonzeroAudioRecordingLengthURL:(id)a3 error:(id *)a4
{
  double v5;
  _BOOL4 v6;
  void *v7;

  if (!a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v6)
        return v6;
      +[VCMediaRecorder validateNonzeroAudioRecordingLengthURL:error:].cold.1();
    }
    goto LABEL_9;
  }
  +[VCFileUtil audioContentLengthOfFile:](VCFileUtil, "audioContentLengthOfFile:");
  LOBYTE(v6) = v5 > 0.0;
  if (a4 && v5 <= 0.0)
  {
    if (!*a4)
    {
      v7 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("VCMediaRecorderError"), -3, 0);
      LOBYTE(v6) = 0;
      *a4 = v7;
      return v6;
    }
LABEL_9:
    LOBYTE(v6) = 0;
  }
  return v6;
}

+ (BOOL)deviceHasSufficientFreeSpace
{
  return +[VCMediaRecorder deviceFreeDiskSpace](VCMediaRecorder, "deviceFreeDiskSpace") > 0x989680;
}

+ (unint64_t)deviceFreeDiskSpace
{
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "attributesOfFileSystemForPath:error:", NSTemporaryDirectory(), 0), "objectForKeyedSubscript:", *MEMORY[0x1E0CB2B00]), "unsignedLongValue");
}

+ (int)typeForRequest:(id)a3
{
  void *v4;
  int v5;
  int result;
  uint64_t v7;
  int v8;

  v4 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMomentsRequestState"));
  if (v4)
  {
    v5 = objc_msgSend(v4, "intValue");
    if (objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMomentsRequesterID")))
    {
      if (v5 == 4)
        return 5;
      else
        return 4;
    }
    else
    {
      v7 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMomentsInitiatorID"));
      if (v5 == 4)
        v8 = 3;
      else
        v8 = 2;
      if (v7)
        return 1;
      else
        return v8;
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      result = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!result)
        return result;
      +[VCMediaRecorder typeForRequest:].cold.1();
    }
    return 0;
  }
}

+ (unint64_t)countForRequestType:(int)a3 requestMode:(unsigned __int8)a4
{
  unint64_t result;
  BOOL v5;
  unint64_t v6;

  result = 6;
  switch(a3)
  {
    case 1:
      return result;
    case 2:
      if (a4 == 1)
        result = 7;
      else
        result = 5;
      break;
    case 3:
      result = 7;
      break;
    case 4:
      v5 = a4 == 1;
      v6 = 6;
      goto LABEL_9;
    case 5:
      v5 = a4 == 1;
      v6 = 8;
LABEL_9:
      if (v5)
        result = v6;
      else
        result = v6 + 1;
      break;
    default:
      result = -1;
      break;
  }
  return result;
}

- (BOOL)isActive
{
  return self->_isActive;
}

+ (void)validateIncomingRequest:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d RequestMode is nil!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)validateIncomingRequest:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid request!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)validateIncomingRequest:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d TransactionID is nil!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)validateIncomingRequest:.cold.4()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d RequestState is nil!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)validateIncomingRequest:.cold.5()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d RequestTimestamp is nil!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)validateIncomingRequest:.cold.6()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d MediaType is nil!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)validateIncomingRequest:.cold.7()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d InitiatorID is nil!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)validateIncomingRequest:.cold.8()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d RequesterID is nil!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)validateIncomingRequest:.cold.9()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d FileSize is nil!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)validateIncomingRequest:.cold.10()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d RequestDidSucceed is nil!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)validateIncomingRequest:.cold.11()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d RequesteeID is nil!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)validateIncomingRequest:.cold.12()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Media recording is not supported on this platform!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)dispatchedProcessRequest:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  int v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcMomentsTransactionID"));
  v7 = 136315906;
  v8 = a1;
  v9 = 2080;
  OUTLINED_FUNCTION_4_0();
  v10 = 290;
  v11 = 2112;
  v12 = v5;
  OUTLINED_FUNCTION_11(&dword_1D8A54000, a3, v6, " [%s] %s:%d VCMediaRecorder request %@ invalid transactionID!", (uint8_t *)&v7);
}

- (void)dispatchedProcessRequest:.cold.2()
{
  NSObject *v0;
  uint8_t v1[40];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_11(&dword_1D8A54000, v0, (uint64_t)v0, " [%s] %s:%d VCMediaRecorder request %@ has unexpected contents!", v1);
  OUTLINED_FUNCTION_3();
}

void __38__VCMediaRecorder_setUpReportingAgent__block_invoke_cold_1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Reporting not available (no backends)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)processRemoteLivePhotoRequest:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
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
  v3 = *(_DWORD *)(a2 + 224);
  v4 = 136315906;
  v5 = a1;
  v6 = 2080;
  v7 = "-[VCMediaRecorder processRemoteLivePhotoRequest:]";
  v8 = 1024;
  v9 = 732;
  v10 = 1024;
  v11 = v3;
  _os_log_error_impl(&dword_1D8A54000, log, OS_LOG_TYPE_ERROR, " [%s] %s:%d The number of requests exceeds the max %d", (uint8_t *)&v4, 0x22u);
  OUTLINED_FUNCTION_3();
}

void __49__VCMediaRecorder_processRemoteLivePhotoRequest___block_invoke_2_cold_1(uint64_t a1, _QWORD *a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2[4];
  v4 = a2[5];
  v5 = a2[8];
  v6 = 136316418;
  v7 = a1;
  v8 = 2080;
  v9 = "-[VCMediaRecorder processRemoteLivePhotoRequest:]_block_invoke_2";
  v10 = 1024;
  v11 = 719;
  v12 = 2112;
  v13 = v3;
  v14 = 2112;
  v15 = v4;
  v16 = 2112;
  v17 = v5;
  _os_log_error_impl(&dword_1D8A54000, log, OS_LOG_TYPE_ERROR, " [%s] %s:%d getLivePhotoWithTransactionID failed! stillImageURL:%@ movieURL:%@ error:%@", (uint8_t *)&v6, 0x3Au);
}

- (void)notifyFinishWithRequest:didSucceed:fileSize:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d AVCMomentsRequestMode invalid", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)validateNonzeroAudioRecordingLengthURL:error:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to get audio recording length for null movieURL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)typeForRequest:.cold.1()
{
  NSObject *v0;
  uint8_t v1[40];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_11(&dword_1D8A54000, v0, (uint64_t)v0, " [%s] %s:%d Missing state in recording request %@", v1);
  OUTLINED_FUNCTION_3();
}

@end
