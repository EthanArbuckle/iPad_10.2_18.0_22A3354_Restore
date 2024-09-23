@implementation VCScreenCaptureManager

- (VCScreenCaptureManager)init
{
  VCScreenCaptureManager *v2;
  NSObject *CustomRootQueue;
  dispatch_queue_t v4;
  NSMutableDictionary *v5;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)VCScreenCaptureManager;
  v2 = -[VCScreenCaptureManager init](&v7, sel_init);
  if (v2)
  {
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
    v4 = dispatch_queue_create_with_target_V2("com.apple.AVConference.VCScreenCaptureManager.xpc.commands", 0, CustomRootQueue);
    v2->_xpcCommandQueue = (OS_dispatch_queue *)v4;
    if (v4)
    {
      v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v2->_screenShare = v5;
      if (v5)
        return v2;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCScreenCaptureManager init].cold.2();
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCScreenCaptureManager init].cold.1();
    }

    return 0;
  }
  return v2;
}

VCScreenCaptureManager *__VCScreenCaptureManager_SharedInstance_block_invoke()
{
  VCScreenCaptureManager *result;

  result = objc_alloc_init(VCScreenCaptureManager);
  VCScreenCaptureManager_SharedInstance__vcScreenCaptureManager = (uint64_t)result;
  return result;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  -[VCScreenCaptureManager invalidatePicker](self, "invalidatePicker");
  v3.receiver = self;
  v3.super_class = (Class)VCScreenCaptureManager;
  -[VCScreenCaptureManager dealloc](&v3, sel_dealloc);
}

- (id)getErrorDictionaryFromError:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "AVConferenceServiceError:detailCode:description:", 32000, 0, CFSTR("Screen Capture unknown error"));
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 3);
  if (a3)
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(a3, "domain"), CFSTR("ERROR_DOMAIN"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a3, "code")), CFSTR("ERROR_CODE"));
    v6 = a3;
  }
  else
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(v4, "domain"), CFSTR("ERROR_DOMAIN"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "code")), CFSTR("ERROR_CODE"));
    v6 = v4;
  }
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(v6, "userInfo"), CFSTR("ERROR_USERINFO"));
  return v5;
}

- (void)screenCaptureStartFor:(id)a3 didSucceed:(BOOL)a4 withError:(id)a5
{
  NSObject *xpcCommandQueue;
  _QWORD block[7];
  BOOL v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  xpcCommandQueue = self->_xpcCommandQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__VCScreenCaptureManager_screenCaptureStartFor_didSucceed_withError___block_invoke;
  block[3] = &unk_1E9E53608;
  v7 = a4;
  block[4] = self;
  block[5] = a5;
  block[6] = a3;
  dispatch_async(xpcCommandQueue, block);
}

uint64_t __69__VCScreenCaptureManager_screenCaptureStartFor_didSucceed_withError___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[2];
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("vcScreenCaptureDidStartSuccess");
  v2 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 56));
  v5[1] = CFSTR("vcScreenCaptureDidStartError");
  v6[0] = v2;
  if (*(_BYTE *)(a1 + 56))
    v3 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
  else
    v3 = objc_msgSend(*(id *)(a1 + 32), "getErrorDictionaryFromError:", *(_QWORD *)(a1 + 40));
  v6[1] = v3;
  return objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "vcScreenCaptureStartReturn", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 2), *(_QWORD *)(a1 + 48));
}

- (void)screenCaptureStopFor:(id)a3 didSucceed:(BOOL)a4 withError:(id)a5
{
  NSObject *xpcCommandQueue;
  _QWORD block[7];
  BOOL v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  xpcCommandQueue = self->_xpcCommandQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__VCScreenCaptureManager_screenCaptureStopFor_didSucceed_withError___block_invoke;
  block[3] = &unk_1E9E53608;
  v7 = a4;
  block[4] = a5;
  block[5] = self;
  block[6] = a3;
  dispatch_async(xpcCommandQueue, block);
}

uint64_t __68__VCScreenCaptureManager_screenCaptureStopFor_didSucceed_withError___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[2];
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("vcScreenCaptureDidStopSuccess");
  v2 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 56));
  v5[1] = CFSTR("vcScreenCaptureDidStopError");
  v6[0] = v2;
  if (*(_QWORD *)(a1 + 32))
    v3 = objc_msgSend(*(id *)(a1 + 40), "getErrorDictionaryFromError:");
  else
    v3 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v6[1] = v3;
  return objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "vcScreenCaptureStopReturn", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 2), *(_QWORD *)(a1 + 48));
}

void __VCScreenCaptureManager_ScreenShareDidClearScreen_block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v2 = (_QWORD *)(a1 + 40);
  v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 40)));
  if (v3)
  {
    v4 = v3;
    v7 = CFSTR("vcScreenCaptureIsScreenCleared");
    v8[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 48));
    objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "vcScreenCaptureScreenDidClear", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1), v4);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      __VCScreenCaptureManager_ScreenShareDidClearScreen_block_invoke_cold_1(v5, v2, v6);
  }
}

- (id)screenShareDictionary:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v9[10];
  _QWORD v10[11];

  v10[10] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("ScreenCaptureIsWindowed");
  v10[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a3, "isWindowed"));
  v9[1] = CFSTR("ScreenCaptureUUID");
  if (objc_msgSend(a3, "selectiveScreenUUID"))
    v4 = objc_msgSend(a3, "selectiveScreenUUID");
  else
    v4 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v10[1] = v4;
  v9[2] = CFSTR("ScreenDisplayID");
  v10[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(a3, "screenCaptureDisplayID"));
  v9[3] = CFSTR("ScreenCaptureConfigurationDisplayMode");
  v10[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(a3, "displayMode"));
  v9[4] = CFSTR("IsCursorCapturedForScreen");
  v10[4] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a3, "isCursorCaptured"));
  v9[5] = CFSTR("CaptureSourceID");
  v10[5] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a3, "captureSourceID"));
  v9[6] = CFSTR("ClientBundleID");
  if (objc_msgSend(a3, "clientBundleID"))
    v5 = objc_msgSend(a3, "clientBundleID");
  else
    v5 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v10[6] = v5;
  v9[7] = CFSTR("HasPrivateCaptureEntitlement");
  v10[7] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a3, "privateContentCaptureAllowed"));
  v9[8] = CFSTR("CaptureExcludedBundleIDs");
  if (objc_msgSend(a3, "excludedApplicationBundleIDs"))
    v6 = objc_msgSend(a3, "excludedApplicationBundleIDs");
  else
    v6 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v10[8] = v6;
  v9[9] = CFSTR("ScreenVirtualDisplayLabel");
  if (objc_msgSend(a3, "screenVirtualDisplayLabel"))
    v7 = objc_msgSend(a3, "screenVirtualDisplayLabel");
  else
    v7 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v10[9] = v7;
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 10);
}

- (id)newCaptureSourceID
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v3 = 0;
  v15 = *MEMORY[0x1E0C80C00];
  do
  {
    do
    {

      v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", arc4random_uniform(0x7FFFFFFFu));
    }
    while (!objc_msgSend(v3, "integerValue"));
  }
  while (-[NSMutableDictionary objectForKeyedSubscript:](self->_screenShare, "objectForKeyedSubscript:", v3));
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315906;
      v8 = v4;
      v9 = 2080;
      v10 = "-[VCScreenCaptureManager newCaptureSourceID]";
      v11 = 1024;
      v12 = 187;
      v13 = 2112;
      v14 = v3;
      _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d captureSourceID=%@", (uint8_t *)&v7, 0x26u);
    }
  }
  return v3;
}

- (BOOL)isPickerClientProcessId:(id)a3
{
  void *v4;
  char v5;
  _BYTE __b[4096];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  memset(__b, 170, sizeof(__b));
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", __b, proc_pidpath(objc_msgSend(a3, "intValue"), __b, 0x1000u), 4);
  if (v4 && objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v4))
  {
    if ((objc_msgSend(CFSTR("callservicesd"), "isEqualToString:", objc_msgSend(v4, "lastPathComponent")) & 1) != 0)
      v5 = 1;
    else
      v5 = objc_msgSend(CFSTR("AVConferenceTestRunner"), "isEqualToString:", objc_msgSend(v4, "lastPathComponent"));
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)newScreenShareWithConfig:(id)a3 pid:(id)a4
{
  id v7;
  VCScreenShare *v8;
  int ErrorLogLevelForModule;
  uint64_t v10;
  NSObject *v11;
  int v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  VCScreenShare *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = -[VCScreenCaptureManager newCaptureSourceID](self, "newCaptureSourceID");
  if (!v7)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCScreenCaptureManager newScreenShareWithConfig:pid:].cold.1();
    }
    goto LABEL_15;
  }
  v8 = -[VCScreenShare initWithConfig:pid:captureSourceID:]([VCScreenShare alloc], "initWithConfig:pid:captureSourceID:", a3, a4, v7);
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (!v8)
  {
    if (ErrorLogLevelForModule >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCScreenCaptureManager newScreenShareWithConfig:pid:].cold.2();
    }
LABEL_15:
    v8 = 0;
    goto LABEL_8;
  }
  if (ErrorLogLevelForModule >= 7)
  {
    v10 = VRTraceErrorLogLevelToCSTR();
    v11 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v13 = 136315906;
      v14 = v10;
      v15 = 2080;
      v16 = "-[VCScreenCaptureManager newScreenShareWithConfig:pid:]";
      v17 = 1024;
      v18 = 217;
      v19 = 2112;
      v20 = v8;
      _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCScreenShare created: %@", (uint8_t *)&v13, 0x26u);
    }
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_screenShare, "setObject:forKeyedSubscript:", v8, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[VCScreenShare captureSourceID](v8, "captureSourceID")));
  if (-[VCScreenCaptureManager isPickerClientProcessId:](self, "isPickerClientProcessId:", a4))
  {

    self->_pickerClientScreenShare = v8;
  }
LABEL_8:

  return v8;
}

- (void)removePickerClientScreenShare:(id)a3
{
  if (self->_pickerClientScreenShare == a3)
  {

    self->_pickerClientScreenShare = 0;
  }
}

- (id)stopScreenShare:(id)a3
{
  void *v5;

  if ((objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "stopScreenShareCapture:", objc_msgSend(a3, "captureSourceID")) & 1) != 0)v5 = 0;
  else
    v5 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "AVConferenceServiceError:detailCode:description:", 32000, 0, CFSTR("Screen Capture failed to stop"));
  -[VCScreenCaptureManager endPrivacyAccountingInterval:](self, "endPrivacyAccountingInterval:", a3);

  self->_screenStream = 0;
  return v5;
}

- (id)stopScreenShareAndNotifyDelegate:(id)a3
{
  VCScreenShare *pickerClientScreenShare;
  id v6;
  _BOOL8 v7;
  const __CFString *v8;
  uint64_t v9;
  NSObject *v10;
  const __CFString *v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  uint64_t v17;
  NSObject *v18;
  int v20;
  uint64_t v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  _BYTE v27[18];
  __int16 v28;
  _WORD v29[15];

  *(_QWORD *)&v29[11] = *MEMORY[0x1E0C80C00];
  pickerClientScreenShare = self->_pickerClientScreenShare;
  if (!pickerClientScreenShare)
    return 0;
  v6 = -[VCScreenCaptureManager stopScreenShare:](self, "stopScreenShare:", self->_pickerClientScreenShare);
  if (v6)
  {
    v7 = objc_msgSend(a3, "code") != 32000;
    if ((VCScreenCaptureManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCScreenCaptureManager stopScreenShareAndNotifyDelegate:].cold.1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v8 = (const __CFString *)-[VCScreenCaptureManager performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v8 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v9 = VRTraceErrorLogLevelToCSTR();
        v10 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v20 = 136316418;
          v21 = v9;
          v22 = 2080;
          v23 = "-[VCScreenCaptureManager stopScreenShareAndNotifyDelegate:]";
          v24 = 1024;
          v25 = 264;
          v26 = 2112;
          *(_QWORD *)v27 = v8;
          *(_WORD *)&v27[8] = 2048;
          *(_QWORD *)&v27[10] = self;
          v28 = 2112;
          *(_QWORD *)v29 = v6;
          _os_log_error_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to stop video capture server error=%@", (uint8_t *)&v20, 0x3Au);
        }
      }
    }
  }
  else
  {
    v7 = 1;
  }
  if (!a3)
    a3 = v6;
  -[VCScreenCaptureManager screenCaptureStopFor:didSucceed:withError:](self, "screenCaptureStopFor:didSucceed:withError:", pickerClientScreenShare, v7, a3);
  if ((VCScreenCaptureManager *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v20 = 136316162;
        v21 = v12;
        v22 = 2080;
        v23 = "-[VCScreenCaptureManager stopScreenShareAndNotifyDelegate:]";
        v24 = 1024;
        v25 = 269;
        v26 = 1024;
        *(_DWORD *)v27 = v7;
        *(_WORD *)&v27[4] = 2112;
        *(_QWORD *)&v27[6] = a3;
        v14 = " [%s] %s:%d didSucceed=%hhd error=%@";
        v15 = v13;
        v16 = 44;
LABEL_26:
        _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v20, v16);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v11 = (const __CFString *)-[VCScreenCaptureManager performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v11 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v17 = VRTraceErrorLogLevelToCSTR();
      v18 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v20 = 136316674;
        v21 = v17;
        v22 = 2080;
        v23 = "-[VCScreenCaptureManager stopScreenShareAndNotifyDelegate:]";
        v24 = 1024;
        v25 = 269;
        v26 = 2112;
        *(_QWORD *)v27 = v11;
        *(_WORD *)&v27[8] = 2048;
        *(_QWORD *)&v27[10] = self;
        v28 = 1024;
        *(_DWORD *)v29 = v7;
        v29[2] = 2112;
        *(_QWORD *)&v29[3] = a3;
        v14 = " [%s] %s:%d %@(%p) didSucceed=%hhd error=%@";
        v15 = v18;
        v16 = 64;
        goto LABEL_26;
      }
    }
  }
  return v6;
}

- (id)startScreenShare:(id)a3
{
  void *v5;

  if ((objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "startScreenShareCapture:", -[VCScreenCaptureManager screenShareDictionary:](self, "screenShareDictionary:")) & 1) != 0)v5 = 0;
  else
    v5 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "AVConferenceServiceError:detailCode:description:", 32000, 0, CFSTR("Screen Capture failed to start"));
  -[VCScreenCaptureManager startPrivacyAccountingInterval:](self, "startPrivacyAccountingInterval:", a3);
  return v5;
}

- (id)updateScreenCapture:(id)a3 withConfig:(id)a4
{
  objc_msgSend(a3, "updateScreenCaptureWithConfig:", a4);
  -[VCScreenCapturePicker setRepickingAllowed:](self->_picker, "setRepickingAllowed:", objc_msgSend(a3, "contentRepickingAllowed"));
  return (id)objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "updateScreenCapture:withConfig:", objc_msgSend(a3, "captureSourceID"), -[VCScreenCaptureManager screenShareDictionary:](self, "screenShareDictionary:", a3));
}

- (void)createPicker
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Picker already exists", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)invalidatePicker
{
  -[VCScreenCapturePicker invalidate](self->_picker, "invalidate");

  self->_picker = 0;
}

- (void)registerBlocksForService
{
  uint64_t v3;
  _QWORD v4[5];
  _QWORD v5[5];
  _QWORD v6[5];
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[5];
  _QWORD v10[5];
  _QWORD v11[6];

  v11[5] = *MEMORY[0x1E0C80C00];
  v3 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __50__VCScreenCaptureManager_registerBlocksForService__block_invoke;
  v11[3] = &unk_1E9E53848;
  v11[4] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcScreenCaptureInitialize", v11, self->_xpcCommandQueue);
  v10[0] = v3;
  v10[1] = 3221225472;
  v10[2] = __50__VCScreenCaptureManager_registerBlocksForService__block_invoke_58;
  v10[3] = &unk_1E9E53848;
  v10[4] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcScreenCaptureTerminate", v10, self->_xpcCommandQueue);
  v9[0] = v3;
  v9[1] = 3221225472;
  v9[2] = __50__VCScreenCaptureManager_registerBlocksForService__block_invoke_60;
  v9[3] = &unk_1E9E53848;
  v9[4] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcScreenCaptureStart", v9, self->_xpcCommandQueue);
  v8[0] = v3;
  v8[1] = 3221225472;
  v8[2] = __50__VCScreenCaptureManager_registerBlocksForService__block_invoke_62;
  v8[3] = &unk_1E9E53848;
  v8[4] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcScreenCaptureStop", v8, self->_xpcCommandQueue);
  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = __50__VCScreenCaptureManager_registerBlocksForService__block_invoke_64;
  v7[3] = &unk_1E9E53848;
  v7[4] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcScreenCaptureUpdate", v7, self->_xpcCommandQueue);
  v6[0] = v3;
  v6[1] = 3221225472;
  v6[2] = __50__VCScreenCaptureManager_registerBlocksForService__block_invoke_2;
  v6[3] = &unk_1E9E53848;
  v6[4] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcScreenCapturePickerInitialize", v6, self->_xpcCommandQueue);
  v5[0] = v3;
  v5[1] = 3221225472;
  v5[2] = __50__VCScreenCaptureManager_registerBlocksForService__block_invoke_67;
  v5[3] = &unk_1E9E53848;
  v5[4] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcScreenCapturePickerTerminate", v5, self->_xpcCommandQueue);
  v4[0] = v3;
  v4[1] = 3221225472;
  v4[2] = __50__VCScreenCaptureManager_registerBlocksForService__block_invoke_69;
  v4[3] = &unk_1E9E53848;
  v4[4] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcScreenCapturePickerShow", v4, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcScreenCapturePickerShowUsingContentStyle", &__block_literal_global_72, self->_xpcCommandQueue);
}

uint64_t __50__VCScreenCaptureManager_registerBlocksForService__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
  {
    if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT")))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
      {
        v4 = VRTraceErrorLogLevelToCSTR();
        v5 = *MEMORY[0x1E0CF2758];
        v6 = *MEMORY[0x1E0CF2758];
        if (*MEMORY[0x1E0CF2748])
        {
          if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            v18 = v4;
            v19 = 2080;
            v20 = "-[VCScreenCaptureManager registerBlocksForService]_block_invoke";
            v21 = 1024;
            v22 = 322;
            _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Client has died. Cleaning up VCScreenCaptureManager by removing associated objects", buf, 0x1Cu);
          }
        }
        else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        {
          __50__VCScreenCaptureManager_registerBlocksForService__block_invoke_cold_3();
        }
      }
      v14 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKeyedSubscript:", objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT")));
      if (v14)
      {
        v15 = (void *)v14;
        objc_msgSend(*(id *)(a1 + 32), "removePickerClientScreenShare:", v14);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setObject:forKeyedSubscript:", 0, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v15, "captureSourceID")));
      }
    }
    return 0;
  }
  v7 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTPID"));
  if (!v7)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __50__VCScreenCaptureManager_registerBlocksForService__block_invoke_cold_1();
    }
    return 0;
  }
  v8 = (void *)objc_msgSend(*(id *)(a1 + 32), "newScreenShareWithConfig:pid:", a2, v7);
  if (!v8)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __50__VCScreenCaptureManager_registerBlocksForService__block_invoke_cold_2();
    }
    return 0;
  }
  v9 = v8;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setRepickingAllowed:", objc_msgSend(v8, "contentRepickingAllowed"));
  v10 = objc_alloc(MEMORY[0x1E0C99E08]);
  v11 = objc_msgSend(v10, "initWithObjectsAndKeys:", v9, CFSTR("CONTEXT"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v9, "captureSourceID")), CFSTR("vcScreenCaptureCaptureSourceID"), 0);

  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v12 = VRTraceErrorLogLevelToCSTR();
    v13 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v18 = v12;
      v19 = 2080;
      v20 = "-[VCScreenCaptureManager registerBlocksForService]_block_invoke";
      v21 = 1024;
      v22 = 344;
      _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Client initialized", buf, 0x1Cu);
    }
  }
  return v11;
}

uint64_t __50__VCScreenCaptureManager_registerBlocksForService__block_invoke_58(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = objc_alloc(MEMORY[0x1E0C99D80]);
    v5 = objc_msgSend(v4, "initWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E0C99E38], "null"), CFSTR("CONTEXT"), 0);
    v6 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
    if (v6)
    {
      v7 = v6;
      objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "stopScreenShareCapture:", objc_msgSend(v6, "captureSourceID"));
      objc_msgSend(*(id *)(a1 + 32), "endPrivacyAccountingInterval:", v7);
      objc_msgSend(*(id *)(a1 + 32), "removePickerClientScreenShare:", v7);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setObject:forKeyedSubscript:", 0, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v7, "captureSourceID")));
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v8 = VRTraceErrorLogLevelToCSTR();
        v9 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v14 = v8;
          v15 = 2080;
          v16 = "-[VCScreenCaptureManager registerBlocksForService]_block_invoke";
          v17 = 1024;
          v18 = 366;
          _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Capture stopped and removed from manager", buf, 0x1Cu);
        }
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __50__VCScreenCaptureManager_registerBlocksForService__block_invoke_58_cold_1();
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v14 = v10;
        v15 = 2080;
        v16 = "-[VCScreenCaptureManager registerBlocksForService]_block_invoke";
        v17 = 1024;
        v18 = 353;
        _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d context is not a class of VCScreenShare", buf, 0x1Cu);
      }
    }
    return 0;
  }
  return v5;
}

uint64_t __50__VCScreenCaptureManager_registerBlocksForService__block_invoke_60(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  _BOOL4 v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
  {
    v4 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
    v5 = objc_msgSend(*(id *)(a1 + 32), "startScreenShare:", v4);
    v6 = v5;
    if (v4)
    {
      if (v5)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            __50__VCScreenCaptureManager_registerBlocksForService__block_invoke_60_cold_2();
        }
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __50__VCScreenCaptureManager_registerBlocksForService__block_invoke_60_cold_1();
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v10 = 136316162;
        v11 = v7;
        v12 = 2080;
        v13 = "-[VCScreenCaptureManager registerBlocksForService]_block_invoke";
        v14 = 1024;
        v15 = 386;
        v16 = 1024;
        v17 = v6 == 0;
        v18 = 2112;
        v19 = v6;
        _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d didStart=%d error=%@", (uint8_t *)&v10, 0x2Cu);
      }
    }
    objc_msgSend(*(id *)(a1 + 32), "screenCaptureStartFor:didSucceed:withError:", v4, v6 == 0, v6);
  }
  return 0;
}

uint64_t __50__VCScreenCaptureManager_registerBlocksForService__block_invoke_62(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  _BOOL4 v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
  {
    v4 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
    v5 = objc_msgSend(*(id *)(a1 + 32), "stopScreenShare:", v4);
    v6 = v5;
    if (v4)
    {
      if (v5)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            __50__VCScreenCaptureManager_registerBlocksForService__block_invoke_62_cold_2();
        }
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __50__VCScreenCaptureManager_registerBlocksForService__block_invoke_62_cold_1();
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v10 = 136316162;
        v11 = v7;
        v12 = 2080;
        v13 = "-[VCScreenCaptureManager registerBlocksForService]_block_invoke";
        v14 = 1024;
        v15 = 405;
        v16 = 1024;
        v17 = v6 == 0;
        v18 = 2112;
        v19 = v6;
        _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d screenCaptureStopFor didSucceed=%d error=%@", (uint8_t *)&v10, 0x2Cu);
      }
    }
    objc_msgSend(*(id *)(a1 + 32), "screenCaptureStopFor:didSucceed:withError:", v4, v6 == 0, v6);
  }
  return 0;
}

uint64_t __50__VCScreenCaptureManager_registerBlocksForService__block_invoke_64(uint64_t a1, void *a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;

  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
  {
    v6 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = objc_msgSend(*(id *)(a1 + 32), "updateScreenCapture:withConfig:", v6, a2);
      if (a3)
      {
        if (v7)
          *a3 = v7;
      }
    }
  }
  return 0;
}

uint64_t __50__VCScreenCaptureManager_registerBlocksForService__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v5;
  const __CFString *v6;
  uint64_t v7;
  NSObject *v8;
  const __CFString *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  const __CFString *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  const __CFString *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
    return 0;
  objc_msgSend(*(id *)(a1 + 32), "createPicker");
  v5 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v5 + 40))
  {
    if (objc_opt_class() == *(_QWORD *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          __50__VCScreenCaptureManager_registerBlocksForService__block_invoke_2_cold_1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v17 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
      else
        v17 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v18 = VRTraceErrorLogLevelToCSTR();
        v19 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v20 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 136316162;
          v22 = v18;
          v23 = 2080;
          v24 = "-[VCScreenCaptureManager registerBlocksForService]_block_invoke";
          v25 = 1024;
          v26 = 439;
          v27 = 2112;
          v28 = v17;
          v29 = 2048;
          v30 = v20;
          _os_log_error_impl(&dword_1D8A54000, v19, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) could not create picker", buf, 0x30u);
        }
      }
    }
    return 0;
  }
  objc_msgSend(*(id *)(v5 + 40), "setActive:", 1);
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithObjectsAndKeys:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40), CFSTR("CONTEXT"), 0);
  if (objc_opt_class() == *(_QWORD *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v9 = *(const __CFString **)(*(_QWORD *)(a1 + 32) + 40);
        *(_DWORD *)buf = 136315906;
        v22 = v7;
        v23 = 2080;
        v24 = "-[VCScreenCaptureManager registerBlocksForService]_block_invoke";
        v25 = 1024;
        v26 = 443;
        v27 = 2048;
        v28 = v9;
        v10 = " [%s] %s:%d picker=%p initialized";
        v11 = v8;
        v12 = 38;
LABEL_15:
        _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
    else
      v6 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v15 = *(_QWORD *)(a1 + 32);
        v16 = *(_QWORD *)(v15 + 40);
        *(_DWORD *)buf = 136316418;
        v22 = v13;
        v23 = 2080;
        v24 = "-[VCScreenCaptureManager registerBlocksForService]_block_invoke";
        v25 = 1024;
        v26 = 443;
        v27 = 2112;
        v28 = v6;
        v29 = 2048;
        v30 = v15;
        v31 = 2048;
        v32 = v16;
        v10 = " [%s] %s:%d %@(%p) picker=%p initialized";
        v11 = v14;
        v12 = 58;
        goto LABEL_15;
      }
    }
  }
  return v3;
}

uint64_t __50__VCScreenCaptureManager_registerBlocksForService__block_invoke_67(uint64_t a1, void *a2)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  NSObject *v7;
  id v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
    v5 = *(_QWORD **)(a1 + 32);
    if (v4 == v5[5])
    {
      objc_msgSend(v5, "invalidatePicker");
      v9 = objc_alloc(MEMORY[0x1E0C99D80]);
      return objc_msgSend(v9, "initWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E0C99E38], "null"), CFSTR("CONTEXT"), 0);
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v11 = v6;
        v12 = 2080;
        v13 = "-[VCScreenCaptureManager registerBlocksForService]_block_invoke";
        v14 = 1024;
        v15 = 455;
        v16 = 2048;
        v17 = v4;
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Invalid picker=%p", buf, 0x26u);
      }
    }
  }
  return 0;
}

uint64_t __50__VCScreenCaptureManager_registerBlocksForService__block_invoke_69(uint64_t a1, void *a2)
{
  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "showWithStream:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
  return 0;
}

uint64_t __50__VCScreenCaptureManager_registerBlocksForService__block_invoke_2_71(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED"));
  return 0;
}

- (void)startPrivacyAccountingInterval:(id)a3
{
  uint64_t v4;
  void *v5;

  if (objc_msgSend(a3, "selectiveScreenUUID"))
  {
    v4 = objc_msgSend(MEMORY[0x1E0D80C58], "applicationWithType:identifier:", 0, CFSTR("com.apple.facetime"));
    v5 = (void *)objc_msgSend(MEMORY[0x1E0D80C48], "sharedInstance");
    self->_accessInterval = (PAAccessInterval *)(id)objc_msgSend(v5, "beginIntervalForAccess:", objc_msgSend(MEMORY[0x1E0D80C78], "accessWithAccessor:fromBroadcaster:", v4, v4));
  }
}

- (void)endPrivacyAccountingInterval:(id)a3
{
  PAAccessInterval *accessInterval;

  if (objc_msgSend(a3, "selectiveScreenUUID"))
  {
    accessInterval = self->_accessInterval;
    if (accessInterval)
    {
      -[PAAccessInterval end](accessInterval, "end");

      self->_accessInterval = 0;
    }
  }
}

- (id)errorForAttributesError:(id)a3
{
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  const __CFString *v16;
  uint64_t v17;
  _QWORD v18[3];
  _QWORD v19[3];
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  id v27;
  __int16 v28;
  VCScreenCaptureManager *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if ((VCScreenCaptureManager *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      v8 = *MEMORY[0x1E0CF2758];
      if (*MEMORY[0x1E0CF2748])
      {
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          v21 = v6;
          v22 = 2080;
          v23 = "-[VCScreenCaptureManager errorForAttributesError:]";
          v24 = 1024;
          v25 = 516;
          v26 = 2112;
          v27 = a3;
          v9 = " [%s] %s:%d error=%@";
          v10 = v7;
          v11 = 38;
LABEL_13:
          _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
        }
      }
      else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        -[VCScreenCaptureManager errorForAttributesError:].cold.1();
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = (const __CFString *)-[VCScreenCaptureManager performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v5 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      v14 = *MEMORY[0x1E0CF2758];
      if (*MEMORY[0x1E0CF2748])
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316418;
          v21 = v12;
          v22 = 2080;
          v23 = "-[VCScreenCaptureManager errorForAttributesError:]";
          v24 = 1024;
          v25 = 516;
          v26 = 2112;
          v27 = (id)v5;
          v28 = 2048;
          v29 = self;
          v30 = 2112;
          v31 = a3;
          v9 = " [%s] %s:%d %@(%p) error=%@";
          v10 = v13;
          v11 = 58;
          goto LABEL_13;
        }
      }
      else if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136316418;
        v21 = v12;
        v22 = 2080;
        v23 = "-[VCScreenCaptureManager errorForAttributesError:]";
        v24 = 1024;
        v25 = 516;
        v26 = 2112;
        v27 = (id)v5;
        v28 = 2048;
        v29 = self;
        v30 = 2112;
        v31 = a3;
        _os_log_debug_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEBUG, " [%s] %s:%d %@(%p) error=%@", buf, 0x3Au);
      }
    }
  }
  v18[0] = CFSTR("vcScreenCaptureAttributesErrorDomain");
  v19[0] = objc_msgSend(a3, "domain");
  v18[1] = CFSTR("vcScreenCaptureAttributesErrorCode");
  v19[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a3, "code"));
  v18[2] = CFSTR("vcScreenCaptureAttributesErrorUserInfo");
  v19[2] = objc_msgSend(a3, "userInfo");
  v16 = CFSTR("vcScreenCaptureAttributesError");
  v17 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 3);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
}

+ (int64_t)contentTypeForFilter:(id)a3
{
  return 1;
}

- (id)attributesForContentFilter:(id)a3
{
  return 0;
}

- (id)updateCurrentPickerScreenCapture
{
  SCContentFilter *v3;
  const __CFString *v4;
  uint64_t v5;
  NSObject *v6;
  SCContentFilter *contentFilter;
  VCScreenShare *pickerClientScreenShare;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  NSObject *v13;
  SCContentFilter *v15;
  VCScreenShare *v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  VCScreenCaptureManager *v26;
  __int16 v27;
  SCContentFilter *v28;
  __int16 v29;
  VCScreenShare *v30;
  __int16 v31;
  SCContentFilter *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = (SCContentFilter *)objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "updateScreenCapture:withConfig:", -[VCScreenShare captureSourceID](self->_pickerClientScreenShare, "captureSourceID"), -[VCScreenCaptureManager screenShareDictionary:](self, "screenShareDictionary:", self->_pickerClientScreenShare));
  if (!v3)
    return v3;
  if ((VCScreenCaptureManager *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      return v3;
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      return v3;
    contentFilter = self->_contentFilter;
    pickerClientScreenShare = self->_pickerClientScreenShare;
    v17 = 136316418;
    v18 = v5;
    v19 = 2080;
    v20 = "-[VCScreenCaptureManager updateCurrentPickerScreenCapture]";
    v21 = 1024;
    v22 = 568;
    v23 = 2048;
    v24 = contentFilter;
    v25 = 2112;
    v26 = (VCScreenCaptureManager *)pickerClientScreenShare;
    v27 = 2112;
    v28 = v3;
    v9 = " [%s] %s:%d failed to update content filter=%p on screenshare=%@ with error=%@";
    v10 = v6;
    v11 = 58;
LABEL_13:
    _os_log_error_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_ERROR, v9, (uint8_t *)&v17, v11);
    return v3;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = (const __CFString *)-[VCScreenCaptureManager performSelector:](self, "performSelector:", sel_logPrefix);
  else
    v4 = &stru_1E9E58EE0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v12 = VRTraceErrorLogLevelToCSTR();
    v13 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
    {
      v15 = self->_contentFilter;
      v16 = self->_pickerClientScreenShare;
      v17 = 136316930;
      v18 = v12;
      v19 = 2080;
      v20 = "-[VCScreenCaptureManager updateCurrentPickerScreenCapture]";
      v21 = 1024;
      v22 = 568;
      v23 = 2112;
      v24 = (void *)v4;
      v25 = 2048;
      v26 = self;
      v27 = 2048;
      v28 = v15;
      v29 = 2112;
      v30 = v16;
      v31 = 2112;
      v32 = v3;
      v9 = " [%s] %s:%d %@(%p) failed to update content filter=%p on screenshare=%@ with error=%@";
      v10 = v13;
      v11 = 78;
      goto LABEL_13;
    }
  }
  return v3;
}

- (BOOL)shouldUpdateFilter:(id)a3
{
  return 0;
}

- (VCScreenCapturePicker)picker
{
  return self->_picker;
}

- (SCContentFilter)contentFilter
{
  return self->_contentFilter;
}

- (SCStream)screenStream
{
  return self->_screenStream;
}

- (void)setScreenStream:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (void)init
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create client to vcscreenshare array", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __VCScreenCaptureManager_ScreenShareDidClearScreen_block_invoke_cold_1(uint64_t a1, _QWORD *a2, NSObject *a3)
{
  _BYTE v3[22];
  __int128 v4;

  *(_DWORD *)v3 = 136315906;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2080;
  *(_QWORD *)&v3[14] = "VCScreenCaptureManager_ScreenShareDidClearScreen_block_invoke";
  LODWORD(v4) = 156;
  WORD2(v4) = 2048;
  *(_QWORD *)((char *)&v4 + 6) = *a2;
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, (uint64_t)a2, a3, " [%s] %s:%d Missing screen share object for captureSourceID=%ld", *(const char **)v3, *(const char **)&v3[8], (unint64_t)"VCScreenCaptureManager_ScreenShareDidClearScreen_block_invoke" >> 16, (_QWORD)v4);
  OUTLINED_FUNCTION_3();
}

- (void)newScreenShareWithConfig:pid:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to get capture source id", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newScreenShareWithConfig:pid:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create VCScreenShare object", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)stopScreenShareAndNotifyDelegate:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to stop video capture server error=%@");
  OUTLINED_FUNCTION_3();
}

void __50__VCScreenCaptureManager_registerBlocksForService__block_invoke_cold_1()
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

void __50__VCScreenCaptureManager_registerBlocksForService__block_invoke_cold_2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create VCScreenShare object", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __50__VCScreenCaptureManager_registerBlocksForService__block_invoke_cold_3()
{
  os_log_t v0;
  uint8_t v1[24];
  int v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  v2 = 322;
  _os_log_debug_impl(&dword_1D8A54000, v0, OS_LOG_TYPE_DEBUG, " [%s] %s:%d Client has died. Cleaning up VCScreenCaptureManager by removing associated objects", v1, 0x1Cu);
  OUTLINED_FUNCTION_3();
}

void __50__VCScreenCaptureManager_registerBlocksForService__block_invoke_58_cold_1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Did not find corresponding screen share while terminating", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __50__VCScreenCaptureManager_registerBlocksForService__block_invoke_60_cold_1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed get corresponding screen share object", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __50__VCScreenCaptureManager_registerBlocksForService__block_invoke_60_cold_2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed setup and start video capture server", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __50__VCScreenCaptureManager_registerBlocksForService__block_invoke_62_cold_1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed get corresponding screen share object", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __50__VCScreenCaptureManager_registerBlocksForService__block_invoke_62_cold_2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to stop video capture server", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __50__VCScreenCaptureManager_registerBlocksForService__block_invoke_2_cold_1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d could not create picker", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)errorForAttributesError:.cold.1()
{
  os_log_t v0;
  uint8_t v1[14];
  const char *v2;
  __int16 v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  v2 = "-[VCScreenCaptureManager errorForAttributesError:]";
  v3 = 1024;
  OUTLINED_FUNCTION_10_2();
  _os_log_debug_impl(&dword_1D8A54000, v0, OS_LOG_TYPE_DEBUG, " [%s] %s:%d error=%@", v1, 0x26u);
  OUTLINED_FUNCTION_3();
}

@end
