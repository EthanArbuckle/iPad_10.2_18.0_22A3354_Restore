@implementation AVCCaptionsClient

- (AVCCaptionsClient)initWithDelegate:(id)a3 streamToken:(int64_t)a4
{
  AVCCaptionsClient *v6;
  AVCCaptionsClient *v7;
  NSObject *CustomRootQueue;
  dispatch_queue_t v9;
  uint64_t v11;
  NSObject *v12;
  objc_super v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)AVCCaptionsClient;
  v6 = -[AVCCaptionsClient init](&v13, sel_init);
  v7 = v6;
  if (!v6)
    return v7;
  v6->_streamToken = a4;
  if (!+[VCHardwareSettings isCaptionsSupported](VCHardwareSettings, "isCaptionsSupported"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v15 = v11;
        v16 = 2080;
        v17 = "-[AVCCaptionsClient initWithDelegate:streamToken:]";
        v18 = 1024;
        v19 = 50;
        _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVC Captioning is not supported on the device", buf, 0x1Cu);
      }
    }
    goto LABEL_25;
  }
  if (!a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[AVCCaptionsClient initWithDelegate:streamToken:].cold.1();
    }
    goto LABEL_25;
  }
  if ((objc_msgSend(a3, "conformsToProtocol:", &unk_1F023C9D8) & 1) == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[AVCCaptionsClient initWithDelegate:streamToken:].cold.5();
    }
    goto LABEL_25;
  }
  v7->_connection = objc_alloc_init(AVConferenceXPCClient);
  objc_storeWeak(&v7->_delegate, a3);
  if (!v7->_connection)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[AVCCaptionsClient initWithDelegate:streamToken:].cold.2();
    }
    goto LABEL_25;
  }
  if (!-[AVCCaptionsClient connect](v7, "connect"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[AVCCaptionsClient initWithDelegate:streamToken:].cold.4();
    }
LABEL_25:

    return 0;
  }
  CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(47);
  v9 = dispatch_queue_create_with_target_V2("com.apple.AVConference.avccaptionsclient.callback.queue", 0, CustomRootQueue);
  v7->_callbackQueue = (OS_dispatch_queue *)v9;
  if (v9)
  {
    -[AVCCaptionsClient registerBlocksForNotifications](v7, "registerBlocksForNotifications");
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[AVCCaptionsClient initWithDelegate:streamToken:].cold.3();
  }
  return v7;
}

- (void)dealloc
{
  NSObject *callbackQueue;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  -[AVCCaptionsClient deregisterBlocksForNotifications](self, "deregisterBlocksForNotifications");
  -[AVCCaptionsClient disconnect](self, "disconnect");
  objc_storeWeak(&self->_delegate, 0);
  callbackQueue = self->_callbackQueue;
  if (callbackQueue)
  {
    dispatch_release(callbackQueue);
    self->_callbackQueue = 0;
  }

  v4.receiver = self;
  v4.super_class = (Class)AVCCaptionsClient;
  -[AVCCaptionsClient dealloc](&v4, sel_dealloc);
}

- (BOOL)connect
{
  uint64_t v3;
  NSObject *v4;
  int64_t streamToken;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  int64_t v13;
  uint64_t v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      streamToken = self->_streamToken;
      *(_DWORD *)buf = 136315906;
      v16 = v3;
      v17 = 2080;
      v18 = "-[AVCCaptionsClient connect]";
      v19 = 1024;
      v20 = 89;
      v21 = 1024;
      v22 = streamToken;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCCaptionsClient: connect for streamToken:%u", buf, 0x22u);
    }
  }
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", LODWORD(self->_streamToken));
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v6, CFSTR("vcCaptionsStreamToken"), 0);
  v8 = -[AVConferenceXPCClient sendMessageSync:arguments:](self->_connection, "sendMessageSync:arguments:", "vcCaptionsClientInitialize", v7);

  v9 = (void *)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ERROR"));
  if (v9)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v13 = self->_streamToken;
        v14 = objc_msgSend((id)objc_msgSend(v9, "description"), "UTF8String");
        *(_DWORD *)buf = 136316162;
        v16 = v10;
        v17 = 2080;
        v18 = "-[AVCCaptionsClient connect]";
        v19 = 1024;
        v20 = 98;
        v21 = 1024;
        v22 = v13;
        v23 = 2080;
        v24 = v14;
        _os_log_error_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_ERROR, " [%s] %s:%d AVCCaptionsClient: Failed connection for streamToken=%u Error=%s", buf, 0x2Cu);
      }
    }
  }
  return v9 == 0;
}

- (void)disconnect
{
  uint64_t v3;
  NSObject *v4;
  int64_t streamToken;
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
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      streamToken = self->_streamToken;
      v6 = 136315906;
      v7 = v3;
      v8 = 2080;
      v9 = "-[AVCCaptionsClient disconnect]";
      v10 = 1024;
      v11 = 104;
      v12 = 1024;
      v13 = streamToken;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCCaptionsClient: disconnect for streamToken:%u", (uint8_t *)&v6, 0x22u);
    }
  }
  -[AVConferenceXPCClient sendMessageSync:](self->_connection, "sendMessageSync:", "vcCaptionsClientUninitialize");
}

- (void)registerBlocksForNotifications
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[5];
  _QWORD v6[5];
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[5];
  _QWORD v10[5];
  _QWORD v11[6];

  v11[5] = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(MEMORY[0x1E0CF26A0], "weakObjectHolderWithObject:", self);
  v4 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __51__AVCCaptionsClient_registerBlocksForNotifications__block_invoke;
  v11[3] = &unk_1E9E52730;
  v11[4] = v3;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->_connection, "registerBlockForService:block:queue:", "vcCaptionsDidEnableCaptions", v11, self->_callbackQueue);
  v10[0] = v4;
  v10[1] = 3221225472;
  v10[2] = __51__AVCCaptionsClient_registerBlocksForNotifications__block_invoke_2;
  v10[3] = &unk_1E9E52730;
  v10[4] = v3;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->_connection, "registerBlockForService:block:queue:", "vcCaptionsDidDisableCaptions", v10, self->_callbackQueue);
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __51__AVCCaptionsClient_registerBlocksForNotifications__block_invoke_3;
  v9[3] = &unk_1E9E52730;
  v9[4] = v3;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->_connection, "registerBlockForService:block:queue:", "vcCaptionsDidCaptionsStart", v9, self->_callbackQueue);
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __51__AVCCaptionsClient_registerBlocksForNotifications__block_invoke_4;
  v8[3] = &unk_1E9E52730;
  v8[4] = v3;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->_connection, "registerBlockForService:block:queue:", "vcCaptionsDidCaptionsEnd", v8, self->_callbackQueue);
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __51__AVCCaptionsClient_registerBlocksForNotifications__block_invoke_5;
  v7[3] = &unk_1E9E52730;
  v7[4] = v3;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->_connection, "registerBlockForService:block:queue:", "vcCaptionsDidUpdateCaptions", v7, self->_callbackQueue);
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __51__AVCCaptionsClient_registerBlocksForNotifications__block_invoke_100;
  v6[3] = &unk_1E9E52730;
  v6[4] = v3;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->_connection, "registerBlockForService:block:queue:", "vcCaptionsDidDetectGibberish", v6, self->_callbackQueue);
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __51__AVCCaptionsClient_registerBlocksForNotifications__block_invoke_2_104;
  v5[3] = &unk_1E9E52730;
  v5[4] = v3;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->_connection, "registerBlockForService:block:queue:", "conferenceDidServerDie", v5, self->_callbackQueue);
}

uint64_t __51__AVCCaptionsClient_registerBlocksForNotifications__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;
  void *v5;
  uint64_t v6;

  result = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED"));
  if (!result)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "strong");
    if (result)
    {
      v5 = (void *)result;
      v6 = objc_msgSend(a2, "objectForKey:", CFSTR("vcCaptionsError"));
      if (v6)
        v6 = objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v6, 0);
      return objc_msgSend(v5, "didEnableCaptions:error:", objc_msgSend((id)objc_msgSend(a2, "objectForKey:", CFSTR("vcCaptionsEnabled")), "BOOLValue"), v6);
    }
  }
  return result;
}

uint64_t __51__AVCCaptionsClient_registerBlocksForNotifications__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result;
  void *v5;
  uint64_t v6;

  result = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED"));
  if (!result)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "strong");
    if (result)
    {
      v5 = (void *)result;
      v6 = objc_msgSend(a2, "objectForKey:", CFSTR("vcCaptionsError"));
      if (v6)
        v6 = objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v6, 0);
      return objc_msgSend(v5, "didDisableCaptions:error:", objc_msgSend((id)objc_msgSend(a2, "objectForKey:", CFSTR("vcCaptionsDisabled")), "BOOLValue"), v6);
    }
  }
  return result;
}

void *__51__AVCCaptionsClient_registerBlocksForNotifications__block_invoke_3(uint64_t a1, void *a2)
{
  void *result;

  result = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED"));
  if (!result)
  {
    result = (void *)objc_msgSend(*(id *)(a1 + 32), "strong");
    if (result)
      return (void *)objc_msgSend(result, "didStartCaptioningWithReason:", objc_msgSend((id)objc_msgSend(a2, "objectForKey:", CFSTR("vcCaptionsStartReason")), "unsignedCharValue"));
  }
  return result;
}

void *__51__AVCCaptionsClient_registerBlocksForNotifications__block_invoke_4(uint64_t a1, void *a2)
{
  void *result;

  result = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED"));
  if (!result)
  {
    result = (void *)objc_msgSend(*(id *)(a1 + 32), "strong");
    if (result)
      return (void *)objc_msgSend(result, "didStopCaptioningWithReason:", objc_msgSend((id)objc_msgSend(a2, "objectForKey:", CFSTR("vcCaptionsStopReason")), "unsignedCharValue"));
  }
  return result;
}

void __51__AVCCaptionsClient_registerBlocksForNotifications__block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v4;
  void *v5;
  id v6;
  const __CFString *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED")))
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "strong");
    if (v4)
    {
      v5 = (void *)v4;
      v13 = 0;
      v6 = +[VCCaptionsTranscriptionArchiving unarchivedTranscriptionFromData:error:](VCCaptionsTranscriptionArchiving, "unarchivedTranscriptionFromData:error:", objc_msgSend(a2, "objectForKey:", CFSTR("vcCaptionsTranscription")), &v13);
      if (v13)
      {
        if ((void *)objc_opt_class() == v5)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            v8 = VRTraceErrorLogLevelToCSTR();
            v9 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              __51__AVCCaptionsClient_registerBlocksForNotifications__block_invoke_5_cold_1(v8, &v13, v9);
          }
        }
        else
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v7 = (const __CFString *)objc_msgSend(v5, "performSelector:", sel_logPrefix);
          else
            v7 = &stru_1E9E58EE0;
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            v10 = VRTraceErrorLogLevelToCSTR();
            v11 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            {
              v12 = objc_msgSend(v13, "debugDescription");
              *(_DWORD *)buf = 136316418;
              v15 = v10;
              v16 = 2080;
              v17 = "-[AVCCaptionsClient registerBlocksForNotifications]_block_invoke";
              v18 = 1024;
              v19 = 183;
              v20 = 2112;
              v21 = v7;
              v22 = 2048;
              v23 = v5;
              v24 = 2112;
              v25 = v12;
              _os_log_error_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to unarchive captions transcription in XPC callback, error=%@", buf, 0x3Au);
            }
          }
        }
      }
      else
      {
        objc_msgSend(v5, "didUpdateCaptions:isRemote:", v6, objc_msgSend(v6, "isLocal") ^ 1);
      }
    }
  }
}

void *__51__AVCCaptionsClient_registerBlocksForNotifications__block_invoke_100(uint64_t a1, void *a2)
{
  void *result;

  result = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED"));
  if (!result)
  {
    result = (void *)objc_msgSend(*(id *)(a1 + 32), "strong");
    if (result)
      return (void *)objc_msgSend(result, "didDetectGibberish:", objc_msgSend((id)objc_msgSend(a2, "objectForKey:", CFSTR("vcCaptionsGibberish")), "BOOLValue"));
  }
  return result;
}

void __51__AVCCaptionsClient_registerBlocksForNotifications__block_invoke_2_104(uint64_t a1, void *a2)
{
  void *v3;
  int ErrorLogLevelForModule;

  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED")))
  {
    v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "strong");
    ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    if (v3)
    {
      if (ErrorLogLevelForModule >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          __51__AVCCaptionsClient_registerBlocksForNotifications__block_invoke_2_104_cold_2();
      }
      objc_msgSend((id)objc_msgSend(v3, "delegate"), "captionsServerDidDie:", v3);
    }
    else if (ErrorLogLevelForModule >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __51__AVCCaptionsClient_registerBlocksForNotifications__block_invoke_2_104_cold_1();
    }
  }
}

- (void)deregisterBlocksForNotifications
{
  -[AVConferenceXPCClient deregisterFromService:](self->_connection, "deregisterFromService:", "vcCaptionsDidEnableCaptions");
  -[AVConferenceXPCClient deregisterFromService:](self->_connection, "deregisterFromService:", "vcCaptionsDidDisableCaptions");
  -[AVConferenceXPCClient deregisterFromService:](self->_connection, "deregisterFromService:", "vcCaptionsDidCaptionsStart");
  -[AVConferenceXPCClient deregisterFromService:](self->_connection, "deregisterFromService:", "vcCaptionsDidCaptionsEnd");
  -[AVConferenceXPCClient deregisterFromService:](self->_connection, "deregisterFromService:", "vcCaptionsDidUpdateCaptions");
  -[AVConferenceXPCClient deregisterFromService:](self->_connection, "deregisterFromService:", "vcCaptionsDidDetectGibberish");
}

- (id)captionsResultsWithInternalResults:(id)a3
{
  AVCCaptionsResult *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  AVCCaptionsResult *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  const __CFString *v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  _BYTE v24[128];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = [AVCCaptionsResult alloc];
  v5 = objc_msgSend((id)objc_msgSend(a3, "segments"), "count");
  v6 = objc_msgSend(a3, "isFinal");
  v7 = objc_msgSend(a3, "utteranceNumber");
  v8 = objc_msgSend(a3, "updateNumber");
  objc_msgSend(a3, "utteranceStartTimestamp");
  v10 = v9;
  objc_msgSend(a3, "utteranceDuration");
  v12 = -[AVCCaptionsResult initWithCapacity:utteranceComplete:utteranceNumber:updateNumber:utteranceStartTimestamp:utteranceDuration:](v4, "initWithCapacity:utteranceComplete:utteranceNumber:updateNumber:utteranceStartTimestamp:utteranceDuration:", v5, v6, v7, v8, v10, v11);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v13 = (void *)objc_msgSend(a3, "segments");
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v24, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v26 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        if (objc_msgSend(v18, "text"))
          v19 = (const __CFString *)objc_msgSend(v18, "text");
        else
          v19 = &stru_1E9E58EE0;
        v20 = (double)objc_msgSend(v18, "confidence");
        v21 = objc_msgSend(v18, "range");
        -[AVCCaptionsResult addTokenWithString:confidence:range:](v12, "addTokenWithString:confidence:range:", v19, v21, v22, v20);
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v24, 16);
    }
    while (v15);
  }
  return v12;
}

- (void)didEnableCaptions:(BOOL)a3 error:(id)a4
{
  _BOOL8 v5;
  uint64_t v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  AVCCaptionsClient *v16;
  __int16 v17;
  _BOOL4 v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v5 = a3;
  v21 = *MEMORY[0x1E0C80C00];
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVCCaptionsClient-didEnableCaptions");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136316418;
      v10 = v7;
      v11 = 2080;
      v12 = "-[AVCCaptionsClient didEnableCaptions:error:]";
      v13 = 1024;
      v14 = 245;
      v15 = 2048;
      v16 = self;
      v17 = 1024;
      v18 = v5;
      v19 = 2112;
      v20 = a4;
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ AVCCaptionsClient-didEnableCaptions (%p) enabled=%d error=%@", (uint8_t *)&v9, 0x36u);
    }
  }
  -[AVCCaptionsClientDelegate captionsClient:didEnableCaptions:error:](-[AVCCaptionsClient delegate](self, "delegate"), "captionsClient:didEnableCaptions:error:", self, v5, a4);
}

- (void)didDisableCaptions:(BOOL)a3 error:(id)a4
{
  _BOOL8 v5;
  uint64_t v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  AVCCaptionsClient *v16;
  __int16 v17;
  _BOOL4 v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v5 = a3;
  v21 = *MEMORY[0x1E0C80C00];
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVCCaptionsClient-didDisableCaptions");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136316418;
      v10 = v7;
      v11 = 2080;
      v12 = "-[AVCCaptionsClient didDisableCaptions:error:]";
      v13 = 1024;
      v14 = 250;
      v15 = 2048;
      v16 = self;
      v17 = 1024;
      v18 = v5;
      v19 = 2112;
      v20 = a4;
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ AVCCaptionsClient-didDisableCaptions (%p) disabled=%d error=%@", (uint8_t *)&v9, 0x36u);
    }
  }
  -[AVCCaptionsClientDelegate captionsClient:didDisableCaptions:error:](-[AVCCaptionsClient delegate](self, "delegate"), "captionsClient:didDisableCaptions:error:", self, v5, a4);
}

- (void)didStartCaptioningWithReason:(unsigned __int8)a3
{
  -[AVCCaptionsClientDelegate captionsClient:didStartCaptioningWithReason:](-[AVCCaptionsClient delegate](self, "delegate"), "captionsClient:didStartCaptioningWithReason:", self, a3);
}

- (void)didStopCaptioningWithReason:(unsigned __int8)a3
{
  -[AVCCaptionsClientDelegate captionsClient:didStopCaptioningWithReason:](-[AVCCaptionsClient delegate](self, "delegate"), "captionsClient:didStopCaptioningWithReason:", self, a3);
}

- (void)didUpdateCaptions:(id)a3 isRemote:(BOOL)a4
{
  -[AVCCaptionsClientDelegate captionsClient:didUpdateCaptions:source:](-[AVCCaptionsClient delegate](self, "delegate"), "captionsClient:didUpdateCaptions:source:", self, -[AVCCaptionsClient captionsResultsWithInternalResults:](self, "captionsResultsWithInternalResults:", a3), a4);
}

- (void)didDetectGibberish:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  AVCCaptionsClient *v14;
  __int16 v15;
  _BOOL4 v16;
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVCCaptionsClient-didDetectGibberish");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136316162;
      v8 = v5;
      v9 = 2080;
      v10 = "-[AVCCaptionsClient didDetectGibberish:]";
      v11 = 1024;
      v12 = 268;
      v13 = 2048;
      v14 = self;
      v15 = 1024;
      v16 = v3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ AVCCaptionsClient-didDetectGibberish (%p) gibberish=%d", (uint8_t *)&v7, 0x2Cu);
    }
  }
  -[AVCCaptionsClient delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[AVCCaptionsClientDelegate captionsClient:didDetectGibberish:](-[AVCCaptionsClient delegate](self, "delegate"), "captionsClient:didDetectGibberish:", self, v3);
}

- (AVCCaptionsClientDelegate)delegate
{
  return (AVCCaptionsClientDelegate *)objc_loadWeak(&self->_delegate);
}

- (BOOL)captionsEnabled
{
  id v2;

  v2 = -[AVConferenceXPCClient sendMessageSync:arguments:](self->_connection, "sendMessageSync:arguments:", "vcCaptionsGetCaptionsEnabled", 0);
  if (v2)
    LOBYTE(v2) = objc_msgSend((id)objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("vcCaptionsEnabled")), "BOOLValue");
  return (char)v2;
}

- (BOOL)captionsSupported
{
  id v2;

  v2 = -[AVConferenceXPCClient sendMessageSync:arguments:](self->_connection, "sendMessageSync:arguments:", "vcCaptionsGetCaptionsSupported", 0);
  if (v2)
    LOBYTE(v2) = objc_msgSend((id)objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("vcCaptionsSupported")), "BOOLValue");
  return (char)v2;
}

- (void)enableCaptions:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  AVCCaptionsClient *v16;
  __int16 v17;
  _BOOL4 v18;
  uint64_t v19;

  v3 = a3;
  v19 = *MEMORY[0x1E0C80C00];
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVCCaptionsClient-enableCaptions");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v10 = v5;
      v11 = 2080;
      v12 = "-[AVCCaptionsClient enableCaptions:]";
      v13 = 1024;
      v14 = 303;
      v15 = 2112;
      v16 = self;
      v17 = 1024;
      v18 = v3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ AVCCaptionsClient-enableCaptions self=%@, isEnabled=%{BOOL}d", buf, 0x2Cu);
    }
  }
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", v3);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v7, CFSTR("vcCaptionsEnable"), 0);
  -[AVConferenceXPCClient sendMessageAsync:arguments:](self->_connection, "sendMessageAsync:arguments:", "vcCaptionsSetCaptionsEnabled", v8);

}

- (void)configureCaptions:(id)a3
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  AVCCaptionsClient *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  _BOOL4 v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = +[AVCCaptionsClient serializeConfiguration:](AVCCaptionsClient, "serializeConfiguration:");
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVCCaptionsClient-configureCaptions");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136316418;
      v9 = v6;
      v10 = 2080;
      v11 = "-[AVCCaptionsClient configureCaptions:]";
      v12 = 1024;
      v13 = 313;
      v14 = 2112;
      v15 = self;
      v16 = 2112;
      v17 = a3;
      v18 = 1024;
      v19 = v5 != 0;
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ AVCCaptionsClient-configureCaptions self=%@ configuration=%@ argumentsSerialized=%{BOOL}d", (uint8_t *)&v8, 0x36u);
    }
  }
  if (v5)
    -[AVConferenceXPCClient sendMessageAsync:arguments:](self->_connection, "sendMessageAsync:arguments:", "vcCaptionsSetCaptionsConfiguration", v5);
}

+ (id)serializeConfiguration:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  _BOOL4 v6;
  _BOOL4 v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(a3, "locale");
  v5 = objc_msgSend(a3, "usage");
  v6 = +[AVCCaptionsConfig isValidUsage:](AVCCaptionsConfig, "isValidUsage:", v5);
  v7 = v6;
  if (!v4 && !v6)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        +[AVCCaptionsClient serializeConfiguration:].cold.2();
    }
    return 0;
  }
  v8 = objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  if (!v8)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        +[AVCCaptionsClient serializeConfiguration:].cold.1();
    }
    return 0;
  }
  v9 = (void *)v8;
  if (v4)
  {
    v14 = 0;
    v10 = objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, &v14);
    if (v10 && !v14)
    {
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("vcCaptionsLocale"));
      if (!v7)
        return v9;
      goto LABEL_10;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v16 = v12;
        v17 = 2080;
        v18 = "+[AVCCaptionsClient serializeConfiguration:]";
        v19 = 1024;
        v20 = 331;
        v21 = 2112;
        v22 = v10;
        v23 = 2112;
        v24 = v14;
        _os_log_error_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_ERROR, " [%s] %s:%d serializedLocale=%@ error=%@", buf, 0x30u);
      }
    }
  }
  else if (v7)
  {
LABEL_10:
    objc_msgSend(v9, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v5), CFSTR("vcCaptionsUsage"));
  }
  return v9;
}

+ (BOOL)isCaptioningSupported
{
  return +[VCHardwareSettings isCaptionsSupported](VCHardwareSettings, "isCaptionsSupported");
}

- (int64_t)streamToken
{
  return self->_streamToken;
}

- (void)initWithDelegate:streamToken:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Delegate parameter is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithDelegate:streamToken:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[AVCCaptionsClient initWithDelegate:streamToken:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate captions XPC connection for streamToken:%u", v2, *(const char **)v3, (unint64_t)"-[AVCCaptionsClient initWithDelegate:streamToken:]" >> 16, 55);
  OUTLINED_FUNCTION_3();
}

- (void)initWithDelegate:streamToken:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create callback queue", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithDelegate:streamToken:.cold.4()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[AVCCaptionsClient initWithDelegate:streamToken:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to connect to captions server with streamToken:%u", v2, *(const char **)v3, (unint64_t)"-[AVCCaptionsClient initWithDelegate:streamToken:]" >> 16, 57);
  OUTLINED_FUNCTION_3();
}

- (void)initWithDelegate:streamToken:.cold.5()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Delegate doesn't conform to AVCCaptionsClientDelegate protocol", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __51__AVCCaptionsClient_registerBlocksForNotifications__block_invoke_5_cold_1(uint64_t a1, id *a2, NSObject *a3)
{
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  int v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*a2, "debugDescription");
  v7 = 136315906;
  v8 = a1;
  v9 = 2080;
  v10 = "-[AVCCaptionsClient registerBlocksForNotifications]_block_invoke_5";
  OUTLINED_FUNCTION_4();
  v11 = 183;
  v12 = 2112;
  v13 = v5;
  OUTLINED_FUNCTION_11(&dword_1D8A54000, a3, v6, " [%s] %s:%d Failed to unarchive captions transcription in XPC callback, error=%@", (uint8_t *)&v7);
}

void __51__AVCCaptionsClient_registerBlocksForNotifications__block_invoke_2_104_cold_1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d AVCCaptionsClient: server died", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __51__AVCCaptionsClient_registerBlocksForNotifications__block_invoke_2_104_cold_2()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[14];
  const char *v3;
  int v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  v3 = "-[AVCCaptionsClient registerBlocksForNotifications]_block_invoke_2";
  OUTLINED_FUNCTION_4();
  v4 = 209;
  v5 = 2048;
  v6 = v0;
  OUTLINED_FUNCTION_11(&dword_1D8A54000, v1, (uint64_t)v1, " [%s] %s:%d AVCCaptionsClient: serverd died, notifying client. self=%p", v2);
  OUTLINED_FUNCTION_3();
}

+ (void)serializeConfiguration:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate arguments", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)serializeConfiguration:.cold.2()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[14];
  const char *v3;
  int v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  v3 = "+[AVCCaptionsClient serializeConfiguration:]";
  OUTLINED_FUNCTION_4();
  v4 = 325;
  v5 = 2112;
  v6 = v0;
  OUTLINED_FUNCTION_11(&dword_1D8A54000, v1, (uint64_t)v1, " [%s] %s:%d No valid locale or usage on configuration=%@", v2);
  OUTLINED_FUNCTION_3();
}

@end
