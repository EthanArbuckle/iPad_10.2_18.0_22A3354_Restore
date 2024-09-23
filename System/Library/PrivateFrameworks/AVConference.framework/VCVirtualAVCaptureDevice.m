@implementation VCVirtualAVCaptureDevice

- (VCVirtualAVCaptureDevice)initWithUniqueID:(id)a3 orientation:(int)a4
{
  NSMutableArray *v7;
  NSString *v8;
  VCVirtualAVCaptureHardware *v9;
  void *v10;
  id v11;
  NSObject *CustomRootQueue;
  OS_dispatch_queue *v13;
  _QWORD v15[6];
  pthread_mutexattr_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v16.__sig = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)v16.__opaque = 0xAAAAAAAAAAAAAAAALL;
  pthread_mutexattr_init(&v16);
  pthread_mutexattr_settype(&v16, 2);
  pthread_mutex_init(&self->_deviceMutex, &v16);
  pthread_mutexattr_destroy(&v16);
  self->_lockCount = 0;
  self->_orientation = a4;
  v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  self->_deviceInputs = v7;
  if (!v7)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVirtualAVCaptureDevice initWithUniqueID:orientation:].cold.1();
    }
    goto LABEL_27;
  }
  v8 = (NSString *)objc_msgSend(a3, "copy");
  self->_deviceUniqueID = v8;
  if (!v8)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVirtualAVCaptureDevice initWithUniqueID:orientation:].cold.2();
    }
    goto LABEL_27;
  }
  v9 = -[VCVirtualAVCaptureHardware initForDevice:]([VCVirtualAVCaptureHardware alloc], "initForDevice:", -[VCVirtualAVCaptureDevice deviceCode](self, "deviceCode"));
  self->_captureHardware = v9;
  if (!v9)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVirtualAVCaptureDevice initWithUniqueID:orientation:].cold.3();
    }
    goto LABEL_27;
  }
  v10 = (void *)VCDefaults_CopyStringValueForKey(CFSTR("cannedReplay"));
  self->_captureSource = -[VCCannedVideoCaptureSource initWithVideo:callbackContext:frameCallback:]([VCCannedVideoCaptureSource alloc], "initWithVideo:callbackContext:frameCallback:", v10, self, VCVirtualAVCaptureDevice_OnVideoFrame);

  if (!self->_captureSource)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVirtualAVCaptureDevice initWithUniqueID:orientation:].cold.4();
    }
    goto LABEL_27;
  }
  v11 = -[VCVirtualAVCaptureHardware defaultFormatForDeviceID:](self->_captureHardware, "defaultFormatForDeviceID:", self->_deviceUniqueID);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __57__VCVirtualAVCaptureDevice_initWithUniqueID_orientation___block_invoke;
  v15[3] = &unk_1E9E52238;
  v15[4] = self;
  v15[5] = v11;
  -[VCVirtualAVCaptureDevice executeBlockUnderConfigurationLock:](self, "executeBlockUnderConfigurationLock:", v15);
  if (!self->_activeFormat)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVirtualAVCaptureDevice initWithUniqueID:orientation:].cold.5();
    }
    goto LABEL_27;
  }
  CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
  v13 = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCVirtualAVCaptureDevice.xpc.commands", 0, CustomRootQueue);
  self->_xpcCommandQueue = v13;
  if (!v13)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVirtualAVCaptureDevice initWithUniqueID:orientation:].cold.6();
    }
LABEL_27:

    return 0;
  }
  -[VCVirtualAVCaptureDevice registerBlocksForService](self, "registerBlocksForService");
  return self;
}

uint64_t __57__VCVirtualAVCaptureDevice_initWithUniqueID_orientation___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setActiveFormat:", *(_QWORD *)(a1 + 40));
}

- (void)configureResizingConverterWithFormat:(id)a3
{
  const opaqueCMFormatDescription *v4;
  FourCharCode MediaSubType;
  CMVideoDimensions Dimensions;
  _QWORD v7[6];
  FourCharCode v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = (const opaqueCMFormatDescription *)objc_msgSend(a3, "formatDescription");
  MediaSubType = CMFormatDescriptionGetMediaSubType(v4);
  Dimensions = CMVideoFormatDescriptionGetDimensions(v4);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__VCVirtualAVCaptureDevice_configureResizingConverterWithFormat___block_invoke;
  v7[3] = &unk_1E9E52350;
  v7[4] = self;
  v7[5] = Dimensions;
  v8 = MediaSubType;
  -[VCVirtualAVCaptureDevice executeBlockUnderConfigurationLock:](self, "executeBlockUnderConfigurationLock:", v7);
}

void __65__VCVirtualAVCaptureDevice_configureResizingConverterWithFormat___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  int v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 192);
  if (v2
    || (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 192) = -[VCImageResizingConverter initWithOutputWidth:outputHeight:formatType:]([VCImageResizingConverter alloc], "initWithOutputWidth:outputHeight:formatType:", *(unsigned int *)(a1 + 40), *(unsigned int *)(a1 + 44), *(unsigned int *)(a1 + 48)), (v2 = *(void **)(*(_QWORD *)(a1 + 32) + 192)) != 0))
  {
    if ((objc_msgSend(v2, "ensureBufferPoolSupportsOutputWidth:outputHeight:", *(unsigned int *)(a1 + 40), *(unsigned int *)(a1 + 44)) & 1) == 0&& (int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v5 = *(_DWORD *)(a1 + 40);
        v6 = *(_DWORD *)(a1 + 44);
        v7 = 136316162;
        v8 = v3;
        v9 = 2080;
        v10 = "-[VCVirtualAVCaptureDevice configureResizingConverterWithFormat:]_block_invoke";
        v11 = 1024;
        v12 = 134;
        v13 = 1024;
        v14 = v5;
        v15 = 1024;
        v16 = v6;
        _os_log_error_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_ERROR, " [%s] %s:%d Resizing converter failed to support dimensions width=%d height=%d", (uint8_t *)&v7, 0x28u);
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      __65__VCVirtualAVCaptureDevice_configureResizingConverterWithFormat___block_invoke_cold_1();
  }
}

- (id)deviceCode
{
  return (id)(id)VCDefaults_CopyStringValueForKey(CFSTR("virtualHardware"));
}

- (void)startDumpCollector
{
  if (!self->_dumpCollector)
    self->_dumpCollector = objc_alloc_init(VCVideoHardwareDumpCollector);
}

- (void)stopDumpCollector
{
  -[VCVideoHardwareDumpCollector invalidate](self->_dumpCollector, "invalidate");

  self->_dumpCollector = 0;
}

- (int)startVirtualCapture
{
  uint64_t v3;
  NSObject *v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  VCVirtualAVCaptureDevice *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ VCVirtualAVCaptureDevice-startVirtualCapture");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315906;
      v7 = v3;
      v8 = 2080;
      v9 = "-[VCVirtualAVCaptureDevice startVirtualCapture]";
      v10 = 1024;
      v11 = 158;
      v12 = 2048;
      v13 = self;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ VCVirtualAVCaptureDevice-startVirtualCapture [%p]", (uint8_t *)&v6, 0x26u);
    }
  }
  -[VCVirtualAVCaptureDevice startDumpCollector](self, "startDumpCollector");
  return -[VCCannedVideoCaptureSource start](self->_captureSource, "start");
}

- (int)stopVirtualCapture
{
  uint64_t v3;
  NSObject *v4;
  int v5;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  VCVirtualAVCaptureDevice *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ VCVirtualAVCaptureDevice-stopVirtualCapture");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315906;
      v8 = v3;
      v9 = 2080;
      v10 = "-[VCVirtualAVCaptureDevice stopVirtualCapture]";
      v11 = 1024;
      v12 = 164;
      v13 = 2048;
      v14 = self;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ VCVirtualAVCaptureDevice-stopVirtualCapture [%p]", (uint8_t *)&v7, 0x26u);
    }
  }
  v5 = -[VCCannedVideoCaptureSource stop](self->_captureSource, "stop");
  -[VCVirtualAVCaptureDevice stopDumpCollector](self, "stopDumpCollector");
  return v5;
}

- (void)dealloc
{
  uint64_t v3;
  NSObject *v4;
  NSObject *xpcCommandQueue;
  objc_super v6;
  uint8_t buf[4];
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  VCVirtualAVCaptureDevice *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ VCVirtualAVCaptureDevice-dealloc");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v8 = v3;
      v9 = 2080;
      v10 = "-[VCVirtualAVCaptureDevice dealloc]";
      v11 = 1024;
      v12 = 171;
      v13 = 2048;
      v14 = self;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ VCVirtualAVCaptureDevice-dealloc [%p]", buf, 0x26u);
    }
  }
  -[VCVirtualAVCaptureDevice stopVirtualCapture](self, "stopVirtualCapture");
  -[VCVirtualAVCaptureDevice deregisterBlocksFromService](self, "deregisterBlocksFromService");

  pthread_mutex_destroy(&self->_deviceMutex);
  xpcCommandQueue = self->_xpcCommandQueue;
  if (xpcCommandQueue)
  {
    dispatch_release(xpcCommandQueue);
    self->_xpcCommandQueue = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)VCVirtualAVCaptureDevice;
  -[VCVirtualAVCaptureDevice dealloc](&v6, sel_dealloc);
}

- (void)registerBlocksForService
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (VRTraceIsInternalOSInstalled())
  {
    v3 = objc_msgSend(MEMORY[0x1E0CF26A0], "weakObjectHolderWithObject:", self);
    objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton", MEMORY[0x1E0C809B0], 3221225472, __52__VCVirtualAVCaptureDevice_registerBlocksForService__block_invoke, &unk_1E9E53848, v3, v5), "registerBlockForService:block:queue:", "previewSetVirtualCaptureAttributes", &v4, self->_xpcCommandQueue);
  }
}

uint64_t __52__VCVirtualAVCaptureDevice_registerBlocksForService__block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  VideoAttributes *v5;
  VideoAttributes *v6;
  _QWORD v8[7];

  v8[6] = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
  {
    v4 = (void *)objc_msgSend(*(id *)(a1 + 32), "strong");
    v5 = -[VideoAttributes initWithEncodedDictionary:]([VideoAttributes alloc], "initWithEncodedDictionary:", objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("localVideoAttributes")));
    if (v5)
    {
      v6 = v5;
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __52__VCVirtualAVCaptureDevice_registerBlocksForService__block_invoke_18;
      v8[3] = &unk_1E9E52238;
      v8[4] = v4;
      v8[5] = v5;
      objc_msgSend(v4, "executeBlockUnderConfigurationLock:", v8);

    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __52__VCVirtualAVCaptureDevice_registerBlocksForService__block_invoke_cold_1();
    }
  }
  return 0;
}

uint64_t __52__VCVirtualAVCaptureDevice_registerBlocksForService__block_invoke_18(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 40), "orientation");
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 188) = result;
  return result;
}

- (void)deregisterBlocksFromService
{
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "previewSetVirtualCaptureAttributes");
}

- (void)executeBlockUnderConfigurationLock:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8[2];

  v8[1] = *(id *)MEMORY[0x1E0C80C00];
  v8[0] = 0;
  if (!-[VCVirtualAVCaptureDevice lockForConfiguration:](self, "lockForConfiguration:", v8))
  {
    v5 = (void *)MEMORY[0x1E0C99DA0];
    v6 = *MEMORY[0x1E0C99750];
    v7 = objc_msgSend(v8[0], "description");
    objc_exception_throw((id)objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v7, objc_msgSend(v8[0], "userInfo")));
  }
  (*((void (**)(id))a3 + 2))(a3);
  -[VCVirtualAVCaptureDevice unlockForConfiguration](self, "unlockForConfiguration");
}

- (void)setActiveFormat:(id)a3
{
  AVCaptureDeviceFormat *v5;
  CMVideoDimensions Dimensions;

  -[VCVirtualAVCaptureDevice verifyLockForConfiguration](self, "verifyLockForConfiguration");

  v5 = (AVCaptureDeviceFormat *)a3;
  self->_activeFormat = v5;
  -[VCVirtualAVCaptureDevice configureResizingConverterWithFormat:](self, "configureResizingConverterWithFormat:", v5);
  Dimensions = CMVideoFormatDescriptionGetDimensions(-[AVCaptureDeviceFormat formatDescription](self->_activeFormat, "formatDescription"));
  -[VCCannedVideoCaptureSource setWidth:height:](self->_captureSource, "setWidth:height:", Dimensions, HIDWORD(*(unint64_t *)&Dimensions));
}

- (id)activeFormat
{
  void *v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = 0;
  v6 = &v5;
  v7 = 0x3052000000;
  v8 = __Block_byref_object_copy__36;
  v9 = __Block_byref_object_dispose__36;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __40__VCVirtualAVCaptureDevice_activeFormat__block_invoke;
  v4[3] = &unk_1E9E52938;
  v4[4] = self;
  v4[5] = &v5;
  -[VCVirtualAVCaptureDevice executeBlockUnderConfigurationLock:](self, "executeBlockUnderConfigurationLock:", v4);
  v2 = (void *)v6[5];
  _Block_object_dispose(&v5, 8);
  return v2;
}

id __40__VCVirtualAVCaptureDevice_activeFormat__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(a1 + 32) + 120);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)setActiveVideoMinFrameDuration:(id *)a3
{
  int64_t var3;
  double v6;
  unint64_t v7;

  -[VCVirtualAVCaptureDevice verifyLockForConfiguration](self, "verifyLockForConfiguration");
  var3 = a3->var3;
  *(_OWORD *)&self->_activeVideoMinFrameDuration.value = *(_OWORD *)&a3->var0;
  self->_activeVideoMinFrameDuration.epoch = var3;
  v6 = (double)self->_activeVideoMinFrameDuration.value / (double)self->_activeVideoMinFrameDuration.timescale;
  if (v6 == 0.0)
    v7 = 0;
  else
    v7 = llround(1.0 / v6);
  -[VCCannedVideoCaptureSource setFrameRate:](self->_captureSource, "setFrameRate:", v7);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)activeVideoMinFrameDuration
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  v7 = &v6;
  v8 = 0x3810000000;
  v9 = "";
  v10 = 0;
  v11 = 0;
  v12 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55__VCVirtualAVCaptureDevice_activeVideoMinFrameDuration__block_invoke;
  v5[3] = &unk_1E9E52938;
  v5[4] = self;
  v5[5] = &v6;
  -[VCVirtualAVCaptureDevice executeBlockUnderConfigurationLock:](self, "executeBlockUnderConfigurationLock:", v5);
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)(v7 + 4);
  _Block_object_dispose(&v6, 8);
  return result;
}

__n128 __55__VCVirtualAVCaptureDevice_activeVideoMinFrameDuration__block_invoke(uint64_t a1)
{
  __n128 *v1;
  __n128 *v2;
  unint64_t v3;
  __n128 result;

  v1 = *(__n128 **)(*(_QWORD *)(a1 + 40) + 8);
  v2 = (__n128 *)(*(_QWORD *)(a1 + 32) + 160);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 176);
  result = *v2;
  v1[2] = *v2;
  v1[3].n128_u64[0] = v3;
  return result;
}

- (void)setActiveVideoMaxFrameDuration:(id *)a3
{
  int64_t var3;

  -[VCVirtualAVCaptureDevice verifyLockForConfiguration](self, "verifyLockForConfiguration");
  var3 = a3->var3;
  *(_OWORD *)&self->_activeVideoMaxFrameDuration.value = *(_OWORD *)&a3->var0;
  self->_activeVideoMaxFrameDuration.epoch = var3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)activeVideoMaxFrameDuration
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  v7 = &v6;
  v8 = 0x3810000000;
  v9 = "";
  v10 = 0;
  v11 = 0;
  v12 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55__VCVirtualAVCaptureDevice_activeVideoMaxFrameDuration__block_invoke;
  v5[3] = &unk_1E9E52938;
  v5[4] = self;
  v5[5] = &v6;
  -[VCVirtualAVCaptureDevice executeBlockUnderConfigurationLock:](self, "executeBlockUnderConfigurationLock:", v5);
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)(v7 + 4);
  _Block_object_dispose(&v6, 8);
  return result;
}

__n128 __55__VCVirtualAVCaptureDevice_activeVideoMaxFrameDuration__block_invoke(uint64_t a1)
{
  __n128 *v1;
  __n128 *v2;
  unint64_t v3;
  __n128 result;

  v1 = *(__n128 **)(*(_QWORD *)(a1 + 40) + 8);
  v2 = (__n128 *)(*(_QWORD *)(a1 + 32) + 136);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 152);
  result = *v2;
  v1[2] = *v2;
  v1[3].n128_u64[0] = v3;
  return result;
}

- (void)addDeviceInput:(id)a3
{
  _QWORD v3[7];

  v3[6] = *MEMORY[0x1E0C80C00];
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __43__VCVirtualAVCaptureDevice_addDeviceInput___block_invoke;
  v3[3] = &unk_1E9E52238;
  v3[4] = self;
  v3[5] = a3;
  -[VCVirtualAVCaptureDevice executeBlockUnderConfigurationLock:](self, "executeBlockUnderConfigurationLock:", v3);
}

void __43__VCVirtualAVCaptureDevice_addDeviceInput___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
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
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "containsObject:", *(_QWORD *)(a1 + 40)))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v2 = VRTraceErrorLogLevelToCSTR();
      v3 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v5 = *(_QWORD *)(a1 + 32);
        v4 = *(_QWORD *)(a1 + 40);
        v6 = 136316162;
        v7 = v2;
        v8 = 2080;
        v9 = "-[VCVirtualAVCaptureDevice addDeviceInput:]_block_invoke";
        v10 = 1024;
        v11 = 284;
        v12 = 2112;
        v13 = v4;
        v14 = 2112;
        v15 = v5;
        _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Device input[%@] already added to device[%@]", (uint8_t *)&v6, 0x30u);
      }
    }
  }
  else
  {
    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "count"))
      objc_msgSend(*(id *)(a1 + 32), "startDumpCollector");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "addObject:", *(_QWORD *)(a1 + 40));
  }
}

- (void)removeDeviceInput:(id)a3
{
  _QWORD v3[7];

  v3[6] = *MEMORY[0x1E0C80C00];
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __46__VCVirtualAVCaptureDevice_removeDeviceInput___block_invoke;
  v3[3] = &unk_1E9E52238;
  v3[4] = self;
  v3[5] = a3;
  -[VCVirtualAVCaptureDevice executeBlockUnderConfigurationLock:](self, "executeBlockUnderConfigurationLock:", v3);
}

void __46__VCVirtualAVCaptureDevice_removeDeviceInput___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
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
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "containsObject:", *(_QWORD *)(a1 + 40)) & 1) != 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "removeObject:", *(_QWORD *)(a1 + 40));
    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "count"))
      objc_msgSend(*(id *)(a1 + 32), "stopDumpCollector");
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v4 = *(_QWORD *)(a1 + 40);
      v6 = 136316162;
      v7 = v2;
      v8 = 2080;
      v9 = "-[VCVirtualAVCaptureDevice removeDeviceInput:]_block_invoke";
      v10 = 1024;
      v11 = 298;
      v12 = 2112;
      v13 = v4;
      v14 = 2112;
      v15 = v5;
      _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Device input[%@] does not exist for device[%@]", (uint8_t *)&v6, 0x30u);
    }
  }
}

- (id)deviceInputs
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = 0;
  v6 = &v5;
  v7 = 0x3052000000;
  v8 = __Block_byref_object_copy__36;
  v9 = __Block_byref_object_dispose__36;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __40__VCVirtualAVCaptureDevice_deviceInputs__block_invoke;
  v4[3] = &unk_1E9E52938;
  v4[4] = self;
  v4[5] = &v5;
  -[VCVirtualAVCaptureDevice executeBlockUnderConfigurationLock:](self, "executeBlockUnderConfigurationLock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __40__VCVirtualAVCaptureDevice_deviceInputs__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (NSArray)formats
{
  return (NSArray *)-[NSDictionary objectForKeyedSubscript:](-[VCVirtualAVCaptureHardware devices](self->_captureHardware, "devices"), "objectForKeyedSubscript:", self->_deviceUniqueID);
}

- (void)verifyLockForConfiguration
{
  _opaque_pthread_mutex_t *p_deviceMutex;
  uint64_t v4;
  uint64_t v5;

  p_deviceMutex = &self->_deviceMutex;
  v4 = pthread_mutex_trylock(&self->_deviceMutex);
  v5 = v4;
  if ((_DWORD)v4)
  {
    if ((_DWORD)v4 == 16)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("Another thread is holding the device lock. result=%d"), 16);
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Failed to lock the device. result=%d"), v5);
  }
  if (!self->_lockCount)
  {
    pthread_mutex_unlock(p_deviceMutex);
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("Attempting to set virtual device configuration without first locking the device. result=%d"), v5);
  }
  pthread_mutex_unlock(p_deviceMutex);
}

- (BOOL)lockForConfiguration:(id *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v5 = pthread_mutex_lock(&self->_deviceMutex);
  if ((_DWORD)v5)
  {
    if (a3)
    {
      v6 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("pthread mutex lock failed with result=%d"), v5);
      v8 = *MEMORY[0x1E0CB2D50];
      v9[0] = v6;
      *a3 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("VCVirtualAVCaptureDevice"), -1, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1));
    }
  }
  else
  {
    ++self->_lockCount;
  }
  return (_DWORD)v5 == 0;
}

- (void)unlockForConfiguration
{
  --self->_lockCount;
  pthread_mutex_unlock(&self->_deviceMutex);
}

- (id)description
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (CGRect)centerStageRectOfInterest
{
  __int128 v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  _QWORD v11[6];
  uint64_t v12;
  double *v13;
  uint64_t v14;
  const char *v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  CGRect result;

  v18 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  v13 = (double *)&v12;
  v14 = 0x4010000000;
  v15 = "";
  v2 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
  v16 = *MEMORY[0x1E0C9D628];
  v17 = v2;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __53__VCVirtualAVCaptureDevice_centerStageRectOfInterest__block_invoke;
  v11[3] = &unk_1E9E52938;
  v11[4] = self;
  v11[5] = &v12;
  -[VCVirtualAVCaptureDevice executeBlockUnderConfigurationLock:](self, "executeBlockUnderConfigurationLock:", v11);
  v3 = v13[4];
  v4 = v13[5];
  v5 = v13[6];
  v6 = v13[7];
  _Block_object_dispose(&v12, 8);
  v7 = v3;
  v8 = v4;
  v9 = v5;
  v10 = v6;
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

__n128 __53__VCVirtualAVCaptureDevice_centerStageRectOfInterest__block_invoke(uint64_t a1)
{
  uint64_t v1;
  __n128 result;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  result = *(__n128 *)(*(_QWORD *)(a1 + 32) + 240);
  *(_OWORD *)(v1 + 32) = *(_OWORD *)(*(_QWORD *)(a1 + 32) + 224);
  *(__n128 *)(v1 + 48) = result;
  return result;
}

- (void)setCenterStageRectOfInterest:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[VCVirtualAVCaptureDevice verifyLockForConfiguration](self, "verifyLockForConfiguration");
  self->_centerStageRectOfInterest.origin.x = x;
  self->_centerStageRectOfInterest.origin.y = y;
  self->_centerStageRectOfInterest.size.width = width;
  self->_centerStageRectOfInterest.size.height = height;
}

- (NSString)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 272);
}

- (id)uniqueID
{
  return self->_deviceUniqueID;
}

- (void)initWithUniqueID:orientation:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate device inputs array", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithUniqueID:orientation:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Received nil device ID", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithUniqueID:orientation:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate virtual capture hardware", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithUniqueID:orientation:.cold.4()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate capture source", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithUniqueID:orientation:.cold.5()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Attempting to initialize with nil active format", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithUniqueID:orientation:.cold.6()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create xpc command queue", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __65__VCVirtualAVCaptureDevice_configureResizingConverterWithFormat___block_invoke_cold_1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create image resizing converter", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __52__VCVirtualAVCaptureDevice_registerBlocksForService__block_invoke_cold_1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create local video attributes", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
