@implementation CannedVideoCapture

- (CannedVideoCapture)initWithCaptureServer:(id)a3 protocolFunctions:(const tagVCVideoCaptureServerProtocolRealtimeInstanceVTable *)a4 width:(int)a5 height:(int)a6 frameRate:(int)a7 videoSourceToken:(_VCVideoSourceToken)a8 video:(id)a9 isCamera:(BOOL)a10 error:(int *)a11
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v18;
  NSObject *v19;
  id v20;
  CannedVideoCapture *v21;
  NSObject *CustomRootQueue;
  OS_dispatch_queue *v23;
  VCCannedVideoCaptureSource *v24;
  CannedVideoCapturePrivate *v25;
  CannedVideoCapturePrivate *pimpl;
  int v27;
  objc_super v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  int v37;
  __int16 v38;
  int v39;
  __int16 v40;
  int v41;
  __int16 v42;
  $948446A44E2BC96870B572155DF52E0B var0;
  __int16 v44;
  id v45;
  uint64_t v46;

  v12 = *(_QWORD *)&a7;
  v13 = *(_QWORD *)&a6;
  v14 = *(_QWORD *)&a5;
  v46 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v18 = VRTraceErrorLogLevelToCSTR();
    v19 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316930;
      v31 = v18;
      v32 = 2080;
      v33 = "-[CannedVideoCapture initWithCaptureServer:protocolFunctions:width:height:frameRate:videoSourceToken:video:isCamera:error:]";
      v34 = 1024;
      v35 = 63;
      v36 = 1024;
      v37 = v14;
      v38 = 1024;
      v39 = v13;
      v40 = 1024;
      v41 = v12;
      v42 = 1024;
      var0 = a8.var0.var0;
      v44 = 2112;
      v45 = a9;
      _os_log_impl(&dword_1D8A54000, v19, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d width=%d, height=%d, frameRate=%d, sourceToken=0x%x, video=%@", buf, 0x3Eu);
    }
  }
  v20 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  if (!v20)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[CannedVideoCapture initWithCaptureServer:protocolFunctions:width:height:frameRate:videoSourceToken:video:isCamera:error:].cold.1();
    }
    goto LABEL_32;
  }
  v29.receiver = self;
  v29.super_class = (Class)CannedVideoCapture;
  v21 = -[VCVideoCapture initWithCaptureServer:protocolFunctions:](&v29, sel_initWithCaptureServer_protocolFunctions_, a3, a4);
  if (!v21)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[CannedVideoCapture initWithCaptureServer:protocolFunctions:width:height:frameRate:videoSourceToken:video:isCamera:error:].cold.2();
    }
    self = 0;
    goto LABEL_32;
  }
  self = v21;
  CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(47);
  v23 = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.CannedVideoCapture.captureSessionQueue", 0, CustomRootQueue);
  self->_captureSessionQueue = v23;
  if (!v23)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[CannedVideoCapture initWithCaptureServer:protocolFunctions:width:height:frameRate:videoSourceToken:video:isCamera:error:].cold.3();
    }
    goto LABEL_32;
  }
  v24 = -[VCCannedVideoCaptureSource initWithVideo:callbackContext:frameCallback:]([VCCannedVideoCaptureSource alloc], "initWithVideo:callbackContext:frameCallback:", a9, self, CannedVideoCapture_OnVideoFrame);
  self->_captureSource = v24;
  if (!v24)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[CannedVideoCapture initWithCaptureServer:protocolFunctions:width:height:frameRate:videoSourceToken:video:isCamera:error:].cold.4();
    }
    goto LABEL_32;
  }
  -[VCCannedVideoCaptureSource setWidth:height:](v24, "setWidth:height:", v14, v13);
  -[VCCannedVideoCaptureSource setFrameRate:](self->_captureSource, "setFrameRate:", v12);
  v25 = (CannedVideoCapturePrivate *)malloc_type_calloc(1uLL, 0x60uLL, 0x10000402F8A9FFCuLL);
  self->_pimpl = v25;
  if (!v25)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[CannedVideoCapture initWithCaptureServer:protocolFunctions:width:height:frameRate:videoSourceToken:video:isCamera:error:].cold.5();
    }
LABEL_32:
    objc_msgSend(v20, "drain");

    return 0;
  }
  v25->var1 = a8;
  pimpl = self->_pimpl;
  if (a10)
    v27 = 0;
  else
    v27 = 3;
  pimpl->var4.var0 = a10;
  pimpl->var4.var1 = a10;
  *(_WORD *)(&pimpl->var4.var1 + 1) = -21846;
  pimpl->var4.var2 = v27;
  *(_QWORD *)&pimpl->var4.var3 = 2863267840;
  pimpl->var4.var6 = 0;
  *(_WORD *)(&pimpl->var4.var6 + 1) = -21846;
  *(&pimpl->var4.var6 + 3) = -86;
  if (a11)
    *a11 = 0;
  objc_msgSend(v20, "drain");
  return self;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  free(self->_pimpl);

  dispatch_release((dispatch_object_t)self->_captureSessionQueue);
  v3.receiver = self;
  v3.super_class = (Class)CannedVideoCapture;
  -[VCVideoCapture dealloc](&v3, sel_dealloc);
}

- (int)setWidth:(int)a3 height:(int)a4 frameRate:(int)a5
{
  uint64_t v5;

  v5 = *(_QWORD *)&a5;
  -[VCCannedVideoCaptureSource setWidth:height:](self->_captureSource, "setWidth:height:", *(_QWORD *)&a3, *(_QWORD *)&a4);
  -[VCCannedVideoCaptureSource setFrameRate:](self->_captureSource, "setFrameRate:", v5);
  -[VCVideoCaptureServer sourceFrameRateDidChange:](-[VCVideoCapture captureServer](self, "captureServer"), "sourceFrameRateDidChange:", v5);
  return 0;
}

- (int)copyColorInfo:(const __CFDictionary *)a3
{
  __CFDictionary *Mutable;
  __CFDictionary *v5;
  int result;

  Mutable = CFDictionaryCreateMutable(0, 3, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (!Mutable)
    return -2146893820;
  v5 = Mutable;
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CECF48], CFSTR("ITU_R_709_2"));
  CFDictionaryAddValue(v5, (const void *)*MEMORY[0x1E0CED238], CFSTR("ITU_R_709_2"));
  CFDictionaryAddValue(v5, (const void *)*MEMORY[0x1E0CED290], CFSTR("ITU_R_709_2"));
  result = 0;
  if (a3)
    *a3 = v5;
  return result;
}

- (int)configureCaptureWithToken:(_VCVideoSourceToken)a3
{
  self->_pimpl->var1 = a3;
  return 0;
}

- (BOOL)isPreviewRunning
{
  return self->_pimpl->var3;
}

- (int)setFrameRate:(int)a3
{
  return 0;
}

- (int)getFrameRate
{
  return -[VCCannedVideoCaptureSource frameRate](self->_captureSource, "frameRate");
}

- (int)startPreview
{
  CannedVideoCapturePrivate *pimpl;
  int v5;
  NSObject *captureSessionQueue;
  _QWORD v7[6];

  v7[5] = *MEMORY[0x1E0C80C00];
  pthread_mutex_lock(&self->_pimpl->var0);
  pimpl = self->_pimpl;
  if (pimpl->var3)
  {
    pthread_mutex_unlock(&pimpl->var0);
    return -2146893775;
  }
  else
  {
    pimpl->var3 = 1;
    v5 = -[VCCannedVideoCaptureSource start](self->_captureSource, "start");
    captureSessionQueue = self->_captureSessionQueue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __34__CannedVideoCapture_startPreview__block_invoke;
    v7[3] = &unk_1E9E521C0;
    v7[4] = self;
    dispatch_async(captureSessionQueue, v7);
    pthread_mutex_unlock(&self->_pimpl->var0);
    return v5;
  }
}

uint64_t __34__CannedVideoCapture_startPreview__block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "captureServer"), "handleCaptureEvent:", CFSTR("avCaptureCameraDidStart"));
}

- (int)startCaptureWithWidth:(int)a3 height:(int)a4 frameRate:(int)a5
{
  int v6;

  -[CannedVideoCapture setWidth:height:frameRate:](self, "setWidth:height:frameRate:", *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5);
  pthread_mutex_lock(&self->_pimpl->var0);
  v6 = -[VCCannedVideoCaptureSource start](self->_captureSource, "start");
  pthread_mutex_unlock(&self->_pimpl->var0);
  return v6;
}

- (int)stop:(BOOL)a3
{
  _BOOL4 v3;
  CannedVideoCapturePrivate *pimpl;
  NSObject *captureSessionQueue;
  BOOL var3;
  _QWORD v10[6];

  v3 = a3;
  v10[5] = *MEMORY[0x1E0C80C00];
  pthread_mutex_lock(&self->_pimpl->var0);
  pimpl = self->_pimpl;
  if (pimpl->var3 && !v3)
  {
    var3 = 1;
  }
  else
  {
    -[VCCannedVideoCaptureSource stop](self->_captureSource, "stop");
    captureSessionQueue = self->_captureSessionQueue;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __27__CannedVideoCapture_stop___block_invoke;
    v10[3] = &unk_1E9E521C0;
    v10[4] = self;
    dispatch_async(captureSessionQueue, v10);
    pimpl = self->_pimpl;
    var3 = pimpl->var3;
  }
  pimpl->var3 = var3 && !v3;
  pthread_mutex_unlock(&pimpl->var0);
  return 0;
}

uint64_t __27__CannedVideoCapture_stop___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "captureServer"), "handleCaptureEvent:", CFSTR("avCaptureCameraDidStop"));
}

- (BOOL)isFrontCamera
{
  return 1;
}

- (BOOL)cameraSupportsFormatWidth:(int)a3 height:(int)a4
{
  return 0;
}

- (int)frameBecameAvailableCount:(int *)a3 figBufferQueueEmptyCount:(int *)a4 figBufferQueueErrorCount:(int *)a5
{
  return 16;
}

- (BOOL)isPortraitResolutionCaptureActive
{
  return 0;
}

- (int)frameCount:(BOOL)a3
{
  return 0;
}

+ (int)cannedVideoTypeForPath:(id)a3
{
  int result;
  char v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:"), "scheme"))
    return 2;
  v5 = 0;
  result = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "fileExistsAtPath:isDirectory:", a3, &v5);
  if (!v5)
    return 0;
  return result;
}

+ (int)createPixelBufferPool:(__CVPixelBufferPool *)a3 withWidth:(int)a4 height:(int)a5
{
  uint64_t v5;
  uint64_t v7;
  const __CFDictionary *v8;
  _QWORD v10[2];
  _QWORD v11[2];
  _QWORD v12[4];
  _QWORD v13[5];

  v5 = *(_QWORD *)&a5;
  v13[4] = *MEMORY[0x1E0C80C00];
  v12[0] = *MEMORY[0x1E0CA90E0];
  v13[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(_QWORD *)&a4);
  v12[1] = *MEMORY[0x1E0CA8FD8];
  v13[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v5);
  v12[2] = *MEMORY[0x1E0CA9040];
  v13[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)"v024");
  v12[3] = *MEMORY[0x1E0CA8FF0];
  v7 = *MEMORY[0x1E0CBC048];
  v10[0] = *MEMORY[0x1E0CBC018];
  v10[1] = v7;
  v11[0] = MEMORY[0x1E0C9AAB0];
  v11[1] = CFSTR("AVConference:CannedVideo");
  v13[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v8 = (const __CFDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 4);
  return CVPixelBufferPoolCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, v8, a3);
}

- (void)initWithCaptureServer:protocolFunctions:width:height:frameRate:videoSourceToken:video:isCamera:error:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate autorelease pool", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithCaptureServer:protocolFunctions:width:height:frameRate:videoSourceToken:video:isCamera:error:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to initialize self", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithCaptureServer:protocolFunctions:width:height:frameRate:videoSourceToken:video:isCamera:error:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create capture session queue", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithCaptureServer:protocolFunctions:width:height:frameRate:videoSourceToken:video:isCamera:error:.cold.4()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to init capture source", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithCaptureServer:protocolFunctions:width:height:frameRate:videoSourceToken:video:isCamera:error:.cold.5()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate canned video capture implementation", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
