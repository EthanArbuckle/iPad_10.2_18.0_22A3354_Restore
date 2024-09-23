@implementation AVCScreenCapture

+ (unsigned)capabilities
{
  int64_t v2;
  uint64_t v3;
  NSObject *v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  int64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = +[VCHardwareSettings screenShareCapabilities](VCHardwareSettings, "screenShareCapabilities");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315906;
      v7 = v3;
      v8 = 2080;
      v9 = "+[AVCScreenCapture capabilities]";
      v10 = 1024;
      v11 = 51;
      v12 = 2048;
      v13 = v2;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d screen capture capability: %ld", (uint8_t *)&v6, 0x26u);
    }
  }
  if (v2 == 1)
    return 1;
  else
    return 2 * (v2 == 2);
}

+ (unsigned)captureCapabilities
{
  return +[AVCScreenCapture capabilities](AVCScreenCapture, "capabilities");
}

- (AVCScreenCapture)initWithDelegate:(id)a3 withConfig:(id)a4
{
  uint64_t v7;
  NSObject *v8;
  AVCScreenCapture *v9;
  __int128 v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *CustomRootQueue;
  dispatch_queue_t v17;
  uint64_t v18;
  VCScreenShare *v19;
  AVConferenceXPCClient *v20;
  id v21;
  uint64_t v22;
  NSObject *v23;
  objc_super v25;
  _QWORD v26[12];
  _QWORD v27[12];
  _OWORD v28[2];
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  id v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v30 = v7;
      v31 = 2080;
      v32 = "-[AVCScreenCapture initWithDelegate:withConfig:]";
      v33 = 1024;
      v34 = 69;
      v35 = 2112;
      v36 = a3;
      v37 = 2112;
      v38 = a4;
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d inDelegate=%@ config=%@", buf, 0x30u);
    }
  }
  v25.receiver = self;
  v25.super_class = (Class)AVCScreenCapture;
  v9 = -[AVCScreenCapture init](&v25, sel_init);
  if (v9)
  {
    *(_QWORD *)&v10 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v28[0] = v10;
    v28[1] = v10;
    VCUtil_AuditTokenForCurrentProcess(v28);
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v28, 32);
    v12 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle"), "bundleIdentifier");
    v26[0] = CFSTR("vcScreenCaptureXpcAuthToken");
    v26[1] = CFSTR("vcScreenCaptureClientBundleID");
    v27[0] = v11;
    v27[1] = v12;
    v26[2] = CFSTR("vcScreenCaptureHeight");
    v27[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(a4, "height"));
    v26[3] = CFSTR("vcScreenCaptureWidth");
    v27[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(a4, "width"));
    v26[4] = CFSTR("vcScreenCaptureFramerate");
    v27[4] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(a4, "frameRate"));
    v26[5] = CFSTR("vcScreenCaptureScreenDisplayID");
    v27[5] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(a4, "screenCaptureDisplayID"));
    v26[6] = CFSTR("vcScreenCaptureScreenDisplayMode");
    v27[6] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(a4, "displayMode"));
    v26[7] = CFSTR("vcScreenCaptureScreenIsWindowed");
    v27[7] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a4, "isWindowed"));
    v26[8] = CFSTR("vcScreenCaptureScreenMachPort");
    v27[8] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(a4, "selectiveSharingPort"));
    v26[9] = CFSTR("vcScreenCaptureScreenUUID");
    if (objc_msgSend(a4, "selectiveScreenUUID"))
      v13 = objc_msgSend(a4, "selectiveScreenUUID");
    else
      v13 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v27[9] = v13;
    v26[10] = CFSTR("vcScreenCaptureIsCursorCaptured");
    v27[10] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a4, "isCursorCaptured"));
    v26[11] = CFSTR("vcScreenCaptureCaptureExcludedBundleIDs");
    if (objc_msgSend(a4, "excludedApplicationBundleIDs")
      && objc_msgSend((id)objc_msgSend(a4, "excludedApplicationBundleIDs"), "count"))
    {
      v14 = objc_msgSend(a4, "excludedApplicationBundleIDs");
    }
    else
    {
      v14 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
    }
    v27[11] = v14;
    v15 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 12);
    v9->_isInProcess = objc_msgSend(a4, "shouldRunInProcess");
    objc_storeWeak(&v9->_delegate, a3);
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(47);
    v17 = dispatch_queue_create_with_target_V2("com.apple.AVConference.screenCapture", 0, CustomRootQueue);
    v9->_avConferenceScreenCaptureQueue = (OS_dispatch_queue *)v17;
    if (v17)
    {
      if (v9->_isInProcess)
      {
        v18 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", getpid());
        if (v18)
        {
          v19 = (VCScreenShare *)objc_msgSend(+[VCScreenCaptureManager sharedManager](VCScreenCaptureManager, "sharedManager"), "newScreenShareWithConfig:pid:", v15, v18);
          v9->_screenShare = v19;
          if (v19)
          {
            v9->_captureSourceID = -[VCScreenShare captureSourceID](v19, "captureSourceID");
LABEL_24:

            return v9;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              -[AVCScreenCapture initWithDelegate:withConfig:].cold.5();
          }
        }
        else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[AVCScreenCapture initWithDelegate:withConfig:].cold.4();
        }
      }
      else
      {
        v20 = objc_alloc_init(AVConferenceXPCClient);
        v9->_connection = v20;
        if (v20)
        {
          v21 = -[AVConferenceXPCClient sendMessageSync:arguments:](v20, "sendMessageSync:arguments:", "vcScreenCaptureInitialize", v15);
          if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
          {
            v22 = VRTraceErrorLogLevelToCSTR();
            v23 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315906;
              v30 = v22;
              v31 = 2080;
              v32 = "-[AVCScreenCapture initWithDelegate:withConfig:]";
              v33 = 1024;
              v34 = 108;
              v35 = 2112;
              v36 = v21;
              _os_log_impl(&dword_1D8A54000, v23, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Results from initialization: %@", buf, 0x26u);
            }
          }
          if (v21 && !objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("ERROR")))
          {
            v9->_captureSourceID = objc_msgSend((id)objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("vcScreenCaptureCaptureSourceID")), "integerValue");
            -[AVCScreenCapture registerBlocksForNotifications](v9, "registerBlocksForNotifications");
            goto LABEL_24;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              -[AVCScreenCapture initWithDelegate:withConfig:].cold.3();
          }
        }
        else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[AVCScreenCapture initWithDelegate:withConfig:].cold.2();
        }
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[AVCScreenCapture initWithDelegate:withConfig:].cold.1();
    }

    return 0;
  }
  return v9;
}

- (void)dealloc
{
  int ErrorLogLevelForModule;
  os_log_t *v4;
  uint64_t v5;
  NSObject *v6;
  id *p_screenShare;
  id v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *avConferenceScreenCaptureQueue;
  uint64_t v12;
  NSObject *v13;
  objc_super v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  v4 = (os_log_t *)MEMORY[0x1E0CF2758];
  if (ErrorLogLevelForModule >= 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v16 = v5;
      v17 = 2080;
      v18 = "-[AVCScreenCapture dealloc]";
      v19 = 1024;
      v20 = 128;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Begin", buf, 0x1Cu);
    }
  }
  if (self->_isInProcess)
  {
    p_screenShare = (id *)&self->_screenShare;
    objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "stopScreenShareCapture:", -[VCScreenShare captureSourceID](self->_screenShare, "captureSourceID"));
  }
  else
  {
    -[AVCScreenCapture deregisterBlocksForNotifications](self, "deregisterBlocksForNotifications");
    p_screenShare = (id *)&self->_connection;
    v8 = -[AVConferenceXPCClient sendMessageSync:](self->_connection, "sendMessageSync:", "vcScreenCaptureTerminate");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *v4;
      if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v16 = v9;
        v17 = 2080;
        v18 = "-[AVCScreenCapture dealloc]";
        v19 = 1024;
        v20 = 137;
        v21 = 2112;
        v22 = v8;
        _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Results from termination: %@", buf, 0x26u);
      }
    }
  }

  avConferenceScreenCaptureQueue = self->_avConferenceScreenCaptureQueue;
  if (avConferenceScreenCaptureQueue)
  {
    dispatch_release(avConferenceScreenCaptureQueue);
    self->_avConferenceScreenCaptureQueue = 0;
  }
  objc_storeWeak(&self->_delegate, 0);
  v14.receiver = self;
  v14.super_class = (Class)AVCScreenCapture;
  -[AVCScreenCapture dealloc](&v14, sel_dealloc);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v12 = VRTraceErrorLogLevelToCSTR();
    v13 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v16 = v12;
      v17 = 2080;
      v18 = "-[AVCScreenCapture dealloc]";
      v19 = 1024;
      v20 = 143;
      _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d End", buf, 0x1Cu);
    }
  }
}

- (AVCScreenCaptureDelegate)delegate
{
  return (AVCScreenCaptureDelegate *)objc_loadWeak(&self->_delegate);
}

- (id)newNSErrorWithErrorDictionary:(id)a3
{
  if (a3)
    return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("ERROR_DOMAIN")), (int)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("ERROR_CODE")), "intValue"), objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("ERROR_USERINFO")));
  else
    return 0;
}

- (void)registerBlocksForNotifications
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[5];
  _QWORD v6[5];
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(MEMORY[0x1E0CF26A0], "weakObjectHolderWithObject:", self);
  v4 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __50__AVCScreenCapture_registerBlocksForNotifications__block_invoke;
  v9[3] = &unk_1E9E52730;
  v9[4] = v3;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->_connection, "registerBlockForService:block:queue:", "vcScreenCaptureServerDidDisconnect", v9, self->_avConferenceScreenCaptureQueue);
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __50__AVCScreenCapture_registerBlocksForNotifications__block_invoke_60;
  v8[3] = &unk_1E9E52730;
  v8[4] = v3;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->_connection, "registerBlockForService:block:queue:", "vcScreenCaptureStartReturn", v8, self->_avConferenceScreenCaptureQueue);
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __50__AVCScreenCapture_registerBlocksForNotifications__block_invoke_68;
  v7[3] = &unk_1E9E52730;
  v7[4] = v3;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->_connection, "registerBlockForService:block:queue:", "vcScreenCaptureStopReturn", v7, self->_avConferenceScreenCaptureQueue);
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __50__AVCScreenCapture_registerBlocksForNotifications__block_invoke_76;
  v6[3] = &unk_1E9E52730;
  v6[4] = v3;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->_connection, "registerBlockForService:block:queue:", "vcScreenCaptureDidUpdateAttributes", v6, self->_avConferenceScreenCaptureQueue);
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __50__AVCScreenCapture_registerBlocksForNotifications__block_invoke_81;
  v5[3] = &unk_1E9E52730;
  v5[4] = v3;
  -[AVConferenceXPCClient registerBlockForService:block:queue:](self->_connection, "registerBlockForService:block:queue:", "vcScreenCaptureScreenDidClear", v5, self->_avConferenceScreenCaptureQueue);
}

uint64_t __50__AVCScreenCapture_registerBlocksForNotifications__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;
  void *v4;
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  uint64_t v11;
  NSObject *v12;
  _BYTE v13[24];
  __int128 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED"));
  if (result)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "strong");
    if (result)
    {
      v4 = (void *)result;
      objc_msgSend((id)result, "delegate");
      result = objc_opt_respondsToSelector();
      if ((result & 1) != 0)
      {
        if ((void *)objc_opt_class() == v4)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() < 7)
            return objc_msgSend((id)objc_msgSend(v4, "delegate", *(_OWORD *)v13, *(_QWORD *)&v13[16], v14, v15), "serverDidDisconnect:", v4);
          v6 = VRTraceErrorLogLevelToCSTR();
          v7 = *MEMORY[0x1E0CF2758];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            return objc_msgSend((id)objc_msgSend(v4, "delegate", *(_OWORD *)v13, *(_QWORD *)&v13[16], v14, v15), "serverDidDisconnect:", v4);
          *(_DWORD *)v13 = 136315650;
          *(_QWORD *)&v13[4] = v6;
          *(_WORD *)&v13[12] = 2080;
          *(_QWORD *)&v13[14] = "-[AVCScreenCapture registerBlocksForNotifications]_block_invoke";
          *(_WORD *)&v13[22] = 1024;
          LODWORD(v14) = 169;
          v8 = " [%s] %s:%d received callback for serverDidDisconnect";
          v9 = v7;
          v10 = 28;
        }
        else
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v5 = (const __CFString *)objc_msgSend(v4, "performSelector:", sel_logPrefix);
          else
            v5 = &stru_1E9E58EE0;
          if ((int)VRTraceGetErrorLogLevelForModule() < 7)
            return objc_msgSend((id)objc_msgSend(v4, "delegate", *(_OWORD *)v13, *(_QWORD *)&v13[16], v14, v15), "serverDidDisconnect:", v4);
          v11 = VRTraceErrorLogLevelToCSTR();
          v12 = *MEMORY[0x1E0CF2758];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            return objc_msgSend((id)objc_msgSend(v4, "delegate", *(_OWORD *)v13, *(_QWORD *)&v13[16], v14, v15), "serverDidDisconnect:", v4);
          *(_DWORD *)v13 = 136316162;
          *(_QWORD *)&v13[4] = v11;
          *(_WORD *)&v13[12] = 2080;
          *(_QWORD *)&v13[14] = "-[AVCScreenCapture registerBlocksForNotifications]_block_invoke";
          *(_WORD *)&v13[22] = 1024;
          LODWORD(v14) = 169;
          WORD2(v14) = 2112;
          *(_QWORD *)((char *)&v14 + 6) = v5;
          HIWORD(v14) = 2048;
          v15 = v4;
          v8 = " [%s] %s:%d %@(%p) received callback for serverDidDisconnect";
          v9 = v12;
          v10 = 48;
        }
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, v8, v13, v10);
        return objc_msgSend((id)objc_msgSend(v4, "delegate", *(_OWORD *)v13, *(_QWORD *)&v13[16], v14, v15), "serverDidDisconnect:", v4);
      }
    }
  }
  return result;
}

void __50__AVCScreenCapture_registerBlocksForNotifications__block_invoke_60(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;
  const __CFString *v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  _BYTE v18[24];
  __int128 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED")))
    return;
  v4 = (void *)objc_msgSend(*(id *)(a1 + 32), "strong");
  if (!v4)
    return;
  v5 = v4;
  objc_msgSend(v4, "delegate");
  if ((objc_opt_respondsToSelector() & 1) == 0)
    return;
  if ((void *)objc_opt_class() != v5)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = (const __CFString *)objc_msgSend(v5, "performSelector:", sel_logPrefix);
    else
      v6 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_16;
    v12 = VRTraceErrorLogLevelToCSTR();
    v13 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_16;
    *(_DWORD *)v18 = 136316162;
    *(_QWORD *)&v18[4] = v12;
    *(_WORD *)&v18[12] = 2080;
    *(_QWORD *)&v18[14] = "-[AVCScreenCapture registerBlocksForNotifications]_block_invoke";
    *(_WORD *)&v18[22] = 1024;
    LODWORD(v19) = 184;
    WORD2(v19) = 2112;
    *(_QWORD *)((char *)&v19 + 6) = v6;
    HIWORD(v19) = 2048;
    v20 = v5;
    v9 = " [%s] %s:%d %@(%p) received callback for screenCapture didStart";
    v10 = v13;
    v11 = 48;
    goto LABEL_15;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v18 = 136315650;
      *(_QWORD *)&v18[4] = v7;
      *(_WORD *)&v18[12] = 2080;
      *(_QWORD *)&v18[14] = "-[AVCScreenCapture registerBlocksForNotifications]_block_invoke";
      *(_WORD *)&v18[22] = 1024;
      LODWORD(v19) = 184;
      v9 = " [%s] %s:%d received callback for screenCapture didStart";
      v10 = v8;
      v11 = 28;
LABEL_15:
      _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, v9, v18, v11);
    }
  }
LABEL_16:
  v14 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcScreenCaptureDidStartSuccess"), *(_OWORD *)v18, *(_QWORD *)&v18[16], v19, v20), "BOOLValue");
  if ((v14 & 1) != 0)
    v15 = 0;
  else
    v15 = (void *)objc_msgSend(v5, "newNSErrorWithErrorDictionary:", objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcScreenCaptureDidStartError")));
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v16 = VRTraceErrorLogLevelToCSTR();
    v17 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v18 = 136315906;
      *(_QWORD *)&v18[4] = v16;
      *(_WORD *)&v18[12] = 2080;
      *(_QWORD *)&v18[14] = "-[AVCScreenCapture registerBlocksForNotifications]_block_invoke";
      *(_WORD *)&v18[22] = 1024;
      LODWORD(v19) = 191;
      WORD2(v19) = 2112;
      *(_QWORD *)((char *)&v19 + 6) = v15;
      _os_log_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d capture didStart error=%@", v18, 0x26u);
    }
  }
  objc_msgSend((id)objc_msgSend(v5, "delegate"), "screenCapture:didStart:withError:", v5, v14, v15);

}

void __50__AVCScreenCapture_registerBlocksForNotifications__block_invoke_68(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;
  const __CFString *v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _BYTE v17[24];
  __int128 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED")))
    return;
  v4 = (void *)objc_msgSend(*(id *)(a1 + 32), "strong");
  if (!v4)
    return;
  v5 = v4;
  objc_msgSend(v4, "delegate");
  if ((objc_opt_respondsToSelector() & 1) == 0)
    return;
  if ((void *)objc_opt_class() != v5)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = (const __CFString *)objc_msgSend(v5, "performSelector:", sel_logPrefix);
    else
      v6 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_16;
    v12 = VRTraceErrorLogLevelToCSTR();
    v13 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_16;
    *(_DWORD *)v17 = 136316162;
    *(_QWORD *)&v17[4] = v12;
    *(_WORD *)&v17[12] = 2080;
    *(_QWORD *)&v17[14] = "-[AVCScreenCapture registerBlocksForNotifications]_block_invoke";
    *(_WORD *)&v17[22] = 1024;
    LODWORD(v18) = 207;
    WORD2(v18) = 2112;
    *(_QWORD *)((char *)&v18 + 6) = v6;
    HIWORD(v18) = 2048;
    v19 = v5;
    v9 = " [%s] %s:%d %@(%p) received callback for screenCapture didStop";
    v10 = v13;
    v11 = 48;
    goto LABEL_15;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v17 = 136315650;
      *(_QWORD *)&v17[4] = v7;
      *(_WORD *)&v17[12] = 2080;
      *(_QWORD *)&v17[14] = "-[AVCScreenCapture registerBlocksForNotifications]_block_invoke";
      *(_WORD *)&v17[22] = 1024;
      LODWORD(v18) = 207;
      v9 = " [%s] %s:%d received callback for screenCapture didStop";
      v10 = v8;
      v11 = 28;
LABEL_15:
      _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, v9, v17, v11);
    }
  }
LABEL_16:
  v14 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcScreenCaptureDidStopSuccess"), *(_OWORD *)v17, *(_QWORD *)&v17[16], v18, v19), "BOOLValue");
  v15 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
  if (v15 == objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcScreenCaptureDidStopError")))
    v16 = 0;
  else
    v16 = (void *)objc_msgSend(v5, "newNSErrorWithErrorDictionary:", objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcScreenCaptureDidStopError")));
  objc_msgSend((id)objc_msgSend(v5, "delegate"), "screenCapture:didStop:withError:", v5, v14, v16);

}

void __50__AVCScreenCapture_registerBlocksForNotifications__block_invoke_76(uint64_t a1, void *a2, const __CFString *a3)
{
  void *v6;
  void *v7;
  const __CFString *v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  uint64_t v14;
  NSObject *v15;
  AVCScreenCaptureAttributes *v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  const __CFString *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  const __CFString *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED")))
  {
    v6 = (void *)objc_msgSend(*(id *)(a1 + 32), "strong");
    if (v6)
    {
      v7 = v6;
      objc_msgSend(v6, "delegate");
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        if ((void *)objc_opt_class() == v7)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() < 7)
            goto LABEL_16;
          v9 = VRTraceErrorLogLevelToCSTR();
          v10 = *MEMORY[0x1E0CF2758];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            goto LABEL_16;
          v17 = 136315906;
          v18 = v9;
          v19 = 2080;
          v20 = "-[AVCScreenCapture registerBlocksForNotifications]_block_invoke";
          v21 = 1024;
          v22 = 229;
          v23 = 2112;
          v24 = a3;
          v11 = " [%s] %s:%d received callback for didUpdateAttributes error=%@";
          v12 = v10;
          v13 = 38;
        }
        else
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v8 = (const __CFString *)objc_msgSend(v7, "performSelector:", sel_logPrefix);
          else
            v8 = &stru_1E9E58EE0;
          if ((int)VRTraceGetErrorLogLevelForModule() < 7)
            goto LABEL_16;
          v14 = VRTraceErrorLogLevelToCSTR();
          v15 = *MEMORY[0x1E0CF2758];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            goto LABEL_16;
          v17 = 136316418;
          v18 = v14;
          v19 = 2080;
          v20 = "-[AVCScreenCapture registerBlocksForNotifications]_block_invoke";
          v21 = 1024;
          v22 = 229;
          v23 = 2112;
          v24 = v8;
          v25 = 2048;
          v26 = v7;
          v27 = 2112;
          v28 = a3;
          v11 = " [%s] %s:%d %@(%p) received callback for didUpdateAttributes error=%@";
          v12 = v15;
          v13 = 58;
        }
        _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v17, v13);
LABEL_16:
        v16 = -[AVCScreenCaptureAttributes initWithConfiguration:]([AVCScreenCaptureAttributes alloc], "initWithConfiguration:", a2);
        objc_msgSend((id)objc_msgSend(v7, "delegate"), "screenCapture:didUpdateAttributes:error:", v7, v16, a3);

      }
    }
  }
}

uint64_t __50__AVCScreenCapture_registerBlocksForNotifications__block_invoke_81(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result;
  void *v7;
  void *v8;
  uint64_t v9;
  const __CFString *v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  uint64_t v16;
  NSObject *v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  _BYTE v25[18];
  __int16 v26;
  int v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SERVERDIED"));
  if (!result)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "strong");
    if (result)
    {
      v7 = (void *)result;
      v8 = (void *)objc_msgSend((id)result, "delegate");
      v9 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcScreenCaptureIsScreenCleared")), "BOOLValue");
      if ((void *)objc_opt_class() == v7)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 7)
          goto LABEL_15;
        v11 = VRTraceErrorLogLevelToCSTR();
        v12 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_15;
        v18 = 136316162;
        v19 = v11;
        v20 = 2080;
        v21 = "-[AVCScreenCapture registerBlocksForNotifications]_block_invoke";
        v22 = 1024;
        v23 = 247;
        v24 = 1024;
        *(_DWORD *)v25 = v9;
        *(_WORD *)&v25[4] = 2112;
        *(_QWORD *)&v25[6] = a3;
        v13 = " [%s] %s:%d received callback for isScreenCleared=%d error=%@";
        v14 = v12;
        v15 = 44;
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v10 = (const __CFString *)objc_msgSend(v7, "performSelector:", sel_logPrefix);
        else
          v10 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 7)
          goto LABEL_15;
        v16 = VRTraceErrorLogLevelToCSTR();
        v17 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_15;
        v18 = 136316674;
        v19 = v16;
        v20 = 2080;
        v21 = "-[AVCScreenCapture registerBlocksForNotifications]_block_invoke";
        v22 = 1024;
        v23 = 247;
        v24 = 2112;
        *(_QWORD *)v25 = v10;
        *(_WORD *)&v25[8] = 2048;
        *(_QWORD *)&v25[10] = v7;
        v26 = 1024;
        v27 = v9;
        v28 = 2112;
        v29 = a3;
        v13 = " [%s] %s:%d %@(%p) received callback for isScreenCleared=%d error=%@";
        v14 = v17;
        v15 = 64;
      }
      _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v18, v15);
LABEL_15:
      result = objc_opt_respondsToSelector();
      if ((result & 1) != 0)
        return objc_msgSend(v8, "screenCapture:screenDidClear:", v7, v9);
    }
  }
  return result;
}

- (void)deregisterBlocksForNotifications
{
  -[AVConferenceXPCClient deregisterFromService:](self->_connection, "deregisterFromService:", "vcScreenCaptureStopReturn");
  -[AVConferenceXPCClient deregisterFromService:](self->_connection, "deregisterFromService:", "vcScreenCaptureStartReturn");
  -[AVConferenceXPCClient deregisterFromService:](self->_connection, "deregisterFromService:", "vcScreenCaptureServerDidDisconnect");
  -[AVConferenceXPCClient deregisterFromService:](self->_connection, "deregisterFromService:", "vcScreenCaptureDidUpdateAttributes");
  -[AVConferenceXPCClient deregisterFromService:](self->_connection, "deregisterFromService:", "vcScreenCaptureScreenDidClear");
}

- (void)startCapture
{
  int ErrorLogLevelForModule;
  os_log_t *v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *avConferenceScreenCaptureQueue;
  uint64_t v8;
  NSObject *v9;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  AVCScreenCapture *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  v4 = (os_log_t *)MEMORY[0x1E0CF2758];
  if (ErrorLogLevelForModule >= 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v12 = v5;
      v13 = 2080;
      v14 = "-[AVCScreenCapture startCapture]";
      v15 = 1024;
      v16 = 268;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d start capture", buf, 0x1Cu);
    }
  }
  avConferenceScreenCaptureQueue = self->_avConferenceScreenCaptureQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__AVCScreenCapture_startCapture__block_invoke;
  block[3] = &unk_1E9E521C0;
  block[4] = self;
  dispatch_async(avConferenceScreenCaptureQueue, block);
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVScreenCapture started");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v12 = v8;
      v13 = 2080;
      v14 = "-[AVCScreenCapture startCapture]";
      v15 = 1024;
      v16 = 285;
      v17 = 2048;
      v18 = self;
      _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ AVScreenCapture started (%p)", buf, 0x26u);
    }
  }
  -[AVCScreenCapture reportScreenShareIsStarting:](self, "reportScreenShareIsStarting:", 1);
}

uint64_t __32__AVCScreenCapture_startCapture__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 32))
    return objc_msgSend(*(id *)(v1 + 16), "sendMessageAsync:arguments:reply:", "vcScreenCaptureStart", 0, 0);
  objc_msgSend(+[VCScreenCaptureManager sharedManager](VCScreenCaptureManager, "sharedManager"), "startScreenShare:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "screenCapture:didStart:withError:");
  return result;
}

- (void)stopCapture
{
  int ErrorLogLevelForModule;
  os_log_t *v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *avConferenceScreenCaptureQueue;
  uint64_t v8;
  NSObject *v9;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  AVCScreenCapture *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  v4 = (os_log_t *)MEMORY[0x1E0CF2758];
  if (ErrorLogLevelForModule >= 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v12 = v5;
      v13 = 2080;
      v14 = "-[AVCScreenCapture stopCapture]";
      v15 = 1024;
      v16 = 291;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d stop capture", buf, 0x1Cu);
    }
  }
  avConferenceScreenCaptureQueue = self->_avConferenceScreenCaptureQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__AVCScreenCapture_stopCapture__block_invoke;
  block[3] = &unk_1E9E521C0;
  block[4] = self;
  dispatch_async(avConferenceScreenCaptureQueue, block);
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ AVScreenCapture stopped");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v12 = v8;
      v13 = 2080;
      v14 = "-[AVCScreenCapture stopCapture]";
      v15 = 1024;
      v16 = 309;
      v17 = 2048;
      v18 = self;
      _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ AVScreenCapture stopped (%p)", buf, 0x26u);
    }
  }
  -[AVCScreenCapture reportScreenShareIsStarting:](self, "reportScreenShareIsStarting:", 0);
}

uint64_t __31__AVCScreenCapture_stopCapture__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 32))
    return objc_msgSend(*(id *)(v1 + 16), "sendMessageAsync:arguments:reply:", "vcScreenCaptureStop", 0, 0);
  objc_msgSend(+[VCScreenCaptureManager sharedManager](VCScreenCaptureManager, "sharedManager"), "stopScreenShare:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "screenCapture:didStop:withError:");
  return result;
}

- (id)updateScreenCaptureWithConfig:(id)a3
{
  uint64_t v5;
  NSObject *v6;
  NSObject *avConferenceScreenCaptureQueue;
  void *v8;
  _QWORD block[7];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  uint64_t v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v11 = 0;
  v12 = &v11;
  v13 = 0x3052000000;
  v14 = __Block_byref_object_copy__17;
  v15 = __Block_byref_object_dispose__17;
  v16 = 0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v18 = v5;
      v19 = 2080;
      v20 = "-[AVCScreenCapture updateScreenCaptureWithConfig:]";
      v21 = 1024;
      v22 = 316;
      v23 = 2112;
      v24 = a3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d config=%@", buf, 0x26u);
    }
  }
  avConferenceScreenCaptureQueue = self->_avConferenceScreenCaptureQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__AVCScreenCapture_updateScreenCaptureWithConfig___block_invoke;
  block[3] = &unk_1E9E550C8;
  block[4] = a3;
  block[5] = self;
  block[6] = &v11;
  dispatch_sync(avConferenceScreenCaptureQueue, block);
  v8 = (void *)v12[5];
  _Block_object_dispose(&v11, 8);
  return v8;
}

void __50__AVCScreenCapture_updateScreenCaptureWithConfig___block_invoke(uint64_t a1)
{
  id *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  const __CFString *v10;
  void *v11;
  const __CFString *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const __CFString *v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  const char *v36;
  _BYTE v37[24];
  __int128 v38;
  uint64_t v39;
  __int128 v40;
  _QWORD v41[9];
  _QWORD v42[10];

  v42[9] = *MEMORY[0x1E0C80C00];
  v41[0] = CFSTR("vcScreenCaptureHeight");
  v2 = (id *)(a1 + 32);
  v42[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(*(id *)(a1 + 32), "height"));
  v41[1] = CFSTR("vcScreenCaptureWidth");
  v42[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(*v2, "width"));
  v41[2] = CFSTR("vcScreenCaptureFramerate");
  v42[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(*v2, "frameRate"));
  v41[3] = CFSTR("vcScreenCaptureScreenDisplayID");
  v42[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(*v2, "screenCaptureDisplayID"));
  v41[4] = CFSTR("vcScreenCaptureScreenIsWindowed");
  v42[4] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*v2, "isWindowed"));
  v41[5] = CFSTR("vcScreenCaptureScreenMachPort");
  v42[5] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(*v2, "selectiveSharingPort"));
  v41[6] = CFSTR("vcScreenCaptureScreenUUID");
  if (objc_msgSend(*v2, "selectiveScreenUUID"))
    v3 = objc_msgSend(*v2, "selectiveScreenUUID");
  else
    v3 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v42[6] = v3;
  v41[7] = CFSTR("vcScreenCaptureIsCursorCaptured");
  v42[7] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*v2, "isCursorCaptured"));
  v41[8] = CFSTR("vcScreenCaptureCaptureExcludedBundleIDs");
  if (objc_msgSend(*v2, "excludedApplicationBundleIDs")
    && objc_msgSend((id)objc_msgSend(*v2, "excludedApplicationBundleIDs"), "count"))
  {
    v4 = objc_msgSend(*v2, "excludedApplicationBundleIDs");
  }
  else
  {
    v4 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
  }
  v42[8] = v4;
  v5 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, v41, 9);
  v6 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 32);
  v7 = objc_msgSend(*(id *)(a1 + 32), "shouldRunInProcess");
  v8 = *(_QWORD *)(a1 + 40);
  if (v6 != v7)
  {
    if (objc_opt_class() == *(_QWORD *)(a1 + 40))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v13 = VRTraceErrorLogLevelToCSTR();
        v14 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          __50__AVCScreenCapture_updateScreenCaptureWithConfig___block_invoke_cold_2(v13, v2, v14);
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v10 = (const __CFString *)objc_msgSend(*(id *)(a1 + 40), "performSelector:", sel_logPrefix);
      else
        v10 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v15 = VRTraceErrorLogLevelToCSTR();
        v16 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v34 = *(_QWORD *)(a1 + 40);
          v35 = objc_msgSend(*(id *)(a1 + 32), "shouldRunInProcess");
          *(_DWORD *)v37 = 136316418;
          v36 = "NO";
          *(_QWORD *)&v37[4] = v15;
          *(_QWORD *)&v37[14] = "-[AVCScreenCapture updateScreenCaptureWithConfig:]_block_invoke";
          *(_WORD *)&v37[12] = 2080;
          *(_WORD *)&v37[22] = 1024;
          if (v35)
            v36 = "YES";
          LODWORD(v38) = 334;
          WORD2(v38) = 2112;
          *(_QWORD *)((char *)&v38 + 6) = v10;
          HIWORD(v38) = 2048;
          v39 = v34;
          LOWORD(v40) = 2080;
          *(_QWORD *)((char *)&v40 + 2) = v36;
          _os_log_error_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Unsupported configuration change of shouldRunInProcess=%s", v37, 0x3Au);
        }
      }
    }
    v9 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("AVCScreenCapture"), -2146893808, 0, *(_OWORD *)v37, *(_QWORD *)&v37[16]);
    goto LABEL_24;
  }
  if (*(_BYTE *)(v8 + 32))
  {
    v9 = objc_msgSend(+[VCScreenCaptureManager sharedManager](VCScreenCaptureManager, "sharedManager"), "updateScreenCapture:withConfig:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40), v5);
LABEL_24:
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = v9;
    return;
  }
  v11 = (void *)objc_msgSend(*(id *)(v8 + 16), "sendMessageSync:arguments:", "vcScreenCaptureUpdate", v5);
  if (objc_opt_class() == *(_QWORD *)(a1 + 40))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v17 = VRTraceErrorLogLevelToCSTR();
      v18 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v37 = 136315906;
        *(_QWORD *)&v37[4] = v17;
        *(_WORD *)&v37[12] = 2080;
        *(_QWORD *)&v37[14] = "-[AVCScreenCapture updateScreenCaptureWithConfig:]_block_invoke";
        *(_WORD *)&v37[22] = 1024;
        LODWORD(v38) = 341;
        WORD2(v38) = 2112;
        *(_QWORD *)((char *)&v38 + 6) = v11;
        v19 = " [%s] %s:%d Results from updateConfig=%@";
        v20 = v18;
        v21 = 38;
LABEL_33:
        _os_log_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_DEFAULT, v19, v37, v21);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v12 = (const __CFString *)objc_msgSend(*(id *)(a1 + 40), "performSelector:", sel_logPrefix);
    else
      v12 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v22 = VRTraceErrorLogLevelToCSTR();
      v23 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v24 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)v37 = 136316418;
        *(_QWORD *)&v37[4] = v22;
        *(_WORD *)&v37[12] = 2080;
        *(_QWORD *)&v37[14] = "-[AVCScreenCapture updateScreenCaptureWithConfig:]_block_invoke";
        *(_WORD *)&v37[22] = 1024;
        LODWORD(v38) = 341;
        WORD2(v38) = 2112;
        *(_QWORD *)((char *)&v38 + 6) = v12;
        HIWORD(v38) = 2048;
        v39 = v24;
        LOWORD(v40) = 2112;
        *(_QWORD *)((char *)&v40 + 2) = v11;
        v19 = " [%s] %s:%d %@(%p) Results from updateConfig=%@";
        v20 = v23;
        v21 = 58;
        goto LABEL_33;
      }
    }
  }
  v25 = objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("ERROR"), *(_QWORD *)v37, *(_OWORD *)&v37[8], v38, v39, v40);
  v26 = a1 + 48;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = v25;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    if (objc_opt_class() == *(_QWORD *)(a1 + 40))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v28 = VRTraceErrorLogLevelToCSTR();
        v29 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          __50__AVCScreenCapture_updateScreenCaptureWithConfig___block_invoke_cold_1(v28, v26, v29);
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v27 = (const __CFString *)objc_msgSend(*(id *)(a1 + 40), "performSelector:", sel_logPrefix);
      else
        v27 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v30 = VRTraceErrorLogLevelToCSTR();
        v31 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v32 = *(_QWORD *)(a1 + 40);
          v33 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
          *(_DWORD *)v37 = 136316418;
          *(_QWORD *)&v37[4] = v30;
          *(_WORD *)&v37[12] = 2080;
          *(_QWORD *)&v37[14] = "-[AVCScreenCapture updateScreenCaptureWithConfig:]_block_invoke";
          *(_WORD *)&v37[22] = 1024;
          LODWORD(v38) = 345;
          WORD2(v38) = 2112;
          *(_QWORD *)((char *)&v38 + 6) = v27;
          HIWORD(v38) = 2048;
          v39 = v32;
          LOWORD(v40) = 2112;
          *(_QWORD *)((char *)&v40 + 2) = v33;
          _os_log_error_impl(&dword_1D8A54000, v31, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Updating Screen Capture Configuration failed with error=%@", v37, 0x3Au);
        }
      }
    }
  }
}

- (void)reportScreenShareIsStarting:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *CTGreenTeaOsLogHandle;
  NSObject *v5;
  const __CFString *v6;
  int v7;
  const __CFString *v8;
  uint64_t v9;

  v3 = a3;
  v9 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle"), "bundleIdentifier"), "isEqualToString:", CFSTR("com.apple.TelephonyUtilities")))
  {
    ct_green_tea_logger_create_static();
    CTGreenTeaOsLogHandle = getCTGreenTeaOsLogHandle();
    if (CTGreenTeaOsLogHandle)
    {
      v5 = CTGreenTeaOsLogHandle;
      if (os_log_type_enabled(CTGreenTeaOsLogHandle, OS_LOG_TYPE_INFO))
      {
        v6 = CFSTR("Stop");
        if (v3)
          v6 = CFSTR("Start");
        v7 = 138412290;
        v8 = v6;
        _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_INFO, "<FaceTime>[FaceTime][com.apple.AVConference]:Expanse Screen Share %@", (uint8_t *)&v7, 0xCu);
      }
    }
  }
}

- (int64_t)captureSourceID
{
  return self->_captureSourceID;
}

- (void)initWithDelegate:withConfig:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create process queue", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithDelegate:withConfig:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create XPC connection", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithDelegate:withConfig:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Error initializing Screen Capture. Deallocing", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithDelegate:withConfig:.cold.4()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to get client pid", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithDelegate:withConfig:.cold.5()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create the screenshare object", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __50__AVCScreenCapture_updateScreenCaptureWithConfig___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a2 + 8) + 40);
  v4 = 136315906;
  v5 = a1;
  v6 = 2080;
  v7 = "-[AVCScreenCapture updateScreenCaptureWithConfig:]_block_invoke";
  v8 = 1024;
  v9 = 345;
  v10 = 2112;
  v11 = v3;
  OUTLINED_FUNCTION_11(&dword_1D8A54000, a3, (uint64_t)a3, " [%s] %s:%d Updating Screen Capture Configuration failed with error=%@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_3();
}

void __50__AVCScreenCapture_updateScreenCaptureWithConfig___block_invoke_cold_2(uint64_t a1, id *a2, NSObject *a3)
{
  int v5;
  uint64_t v6;
  const char *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(*a2, "shouldRunInProcess");
  v7 = "NO";
  v9 = a1;
  v8 = 136315906;
  v11 = "-[AVCScreenCapture updateScreenCaptureWithConfig:]_block_invoke";
  v10 = 2080;
  if (v5)
    v7 = "YES";
  v12 = 1024;
  v13 = 334;
  v14 = 2080;
  v15 = v7;
  OUTLINED_FUNCTION_11(&dword_1D8A54000, a3, v6, " [%s] %s:%d Unsupported configuration change of shouldRunInProcess=%s", (uint8_t *)&v8);
}

@end
