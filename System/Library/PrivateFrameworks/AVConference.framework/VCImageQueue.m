@implementation VCImageQueue

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("VCImageQueue=%p FigImageQueue=%p CAImageQueue=%p slot=%u frameRate=%u imageQueueProtected=%d isLowLatencyEnabled=%d enqueuedFrameCount=%u, transformForRemoteVideoOrientationEnabled=%u"), self, self->_figQueue, self->_caQueue, self->_slot, self->_frameRate, self->_imageQueueProtected, self->_isLowLatencyEnabled, self->_enqueuedFrameCount, self->_transformForRemoteVideoOrientationEnabled);
}

- (int)frameCount
{
  return atomic_load((unsigned int *)&self->_frameCount);
}

- (void)resetFrameCount
{
  atomic_store(0, (unsigned int *)&self->_frameCount);
}

- (void)start
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
  OUTLINED_FUNCTION_2_3(&dword_1D8A54000, v0, v1, " [%s] %s:%d ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setFrameRate:(unsigned int)a3
{
  self->_frameRate = a3;
}

- (unsigned)frameRate
{
  return self->_frameRate;
}

- (unsigned)setVideoDestination:(id)a3
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
  uint64_t v15;
  unsigned int v16;
  uint64_t v17;
  NSObject *v18;
  _BOOL4 layerHostMode;
  unsigned int slot;
  unsigned int contextId;
  _QWORD v23[6];
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  _BYTE v31[10];
  VCImageQueue *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if ((VCImageQueue *)objc_opt_class() == self)
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
          *(_DWORD *)buf = 136315650;
          v25 = v6;
          v26 = 2080;
          v27 = "-[VCImageQueue setVideoDestination:]";
          v28 = 1024;
          v29 = 608;
          v9 = " [%s] %s:%d ";
          v10 = v7;
          v11 = 28;
          goto LABEL_13;
        }
      }
      else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        -[VCImageQueue setVideoDestination:].cold.1();
        if (!a3)
          goto LABEL_14;
        goto LABEL_24;
      }
    }
    goto LABEL_23;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = (const __CFString *)-[VCImageQueue performSelector:](self, "performSelector:", sel_logPrefix);
  else
    v5 = &stru_1E9E58EE0;
  if ((int)VRTraceGetErrorLogLevelForModule() < 8)
  {
LABEL_23:
    if (!a3)
      goto LABEL_14;
LABEL_24:
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __36__VCImageQueue_setVideoDestination___block_invoke;
    v23[3] = &unk_1E9E52238;
    v23[4] = a3;
    v23[5] = self;
    dispatch_async(MEMORY[0x1E0C80D38], v23);
    return 0;
  }
  v12 = VRTraceErrorLogLevelToCSTR();
  v13 = *MEMORY[0x1E0CF2758];
  v14 = *MEMORY[0x1E0CF2758];
  if (!*MEMORY[0x1E0CF2748])
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136316162;
      v25 = v12;
      v26 = 2080;
      v27 = "-[VCImageQueue setVideoDestination:]";
      v28 = 1024;
      v29 = 608;
      v30 = 2112;
      *(_QWORD *)v31 = v5;
      *(_WORD *)&v31[8] = 2048;
      v32 = self;
      _os_log_debug_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEBUG, " [%s] %s:%d %@(%p) ", buf, 0x30u);
      if (!a3)
        goto LABEL_14;
      goto LABEL_24;
    }
    goto LABEL_23;
  }
  if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    goto LABEL_23;
  *(_DWORD *)buf = 136316162;
  v25 = v12;
  v26 = 2080;
  v27 = "-[VCImageQueue setVideoDestination:]";
  v28 = 1024;
  v29 = 608;
  v30 = 2112;
  *(_QWORD *)v31 = v5;
  *(_WORD *)&v31[8] = 2048;
  v32 = self;
  v9 = " [%s] %s:%d %@(%p) ";
  v10 = v13;
  v11 = 48;
LABEL_13:
  _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
  if (a3)
    goto LABEL_24;
LABEL_14:
  v15 = 168;
  if (!self->_layerHostMode)
    v15 = 104;
  v16 = *(_DWORD *)((char *)&self->super.isa + v15);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v17 = VRTraceErrorLogLevelToCSTR();
    v18 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      layerHostMode = self->_layerHostMode;
      slot = self->_slot;
      contextId = self->_contextId;
      *(_DWORD *)buf = 136316418;
      v25 = v17;
      v26 = 2080;
      v27 = "-[VCImageQueue setVideoDestination:]";
      v28 = 1024;
      v29 = 619;
      v30 = 1024;
      *(_DWORD *)v31 = layerHostMode;
      *(_WORD *)&v31[4] = 1024;
      *(_DWORD *)&v31[6] = slot;
      LOWORD(v32) = 1024;
      *(_DWORD *)((char *)&v32 + 2) = contextId;
      _os_log_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d layer host mode=%d slot=%u context=%u", buf, 0x2Eu);
    }
  }
  return v16;
}

- (VCImageQueue)initWithFrameRate:(unsigned __int8)a3 imageQueueProtected:(BOOL)a4
{
  return -[VCImageQueue initWithFrameRate:imageQueueProtected:vcImageQueueConfig:](self, "initWithFrameRate:imageQueueProtected:vcImageQueueConfig:", a3, a4, 0);
}

- (VCImageQueue)initWithFrameRate:(unsigned __int8)a3
{
  return -[VCImageQueue initWithFrameRate:imageQueueProtected:](self, "initWithFrameRate:imageQueueProtected:", a3, 0);
}

- (BOOL)createAllocators
{
  int v2;
  uint64_t v3;
  NSObject *v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  _OWORD v12[2];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v12[0] = xmmword_1D910CF40;
  v12[1] = unk_1D910CF50;
  v2 = VCAllocatorMultiQueue_Create((const __CFAllocator *)*MEMORY[0x1E0C9AE00], (uint64_t)"StreamOutputAllocator", 4u, (unint64_t *)v12, &self->_streamOutputAllocator);
  if (v2)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v6 = 136315650;
        v7 = v3;
        v8 = 2080;
        v9 = "-[VCImageQueue createAllocators]";
        v10 = 1024;
        v11 = 525;
        _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Failed to create stream input allocator", (uint8_t *)&v6, 0x1Cu);
      }
    }
  }
  return v2 == 0;
}

+ (id)drawingContext
{
  id v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  int IsRunning;
  const char *v19;
  _BYTE v21[24];
  _BYTE v22[14];
  __int16 v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v3 = (void *)sContext;
  objc_sync_enter((id)sContext);
  if (!sContext)
    goto LABEL_14;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    v6 = *MEMORY[0x1E0CF2758];
    if (*MEMORY[0x1E0CF2748])
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v21 = 136315650;
        *(_QWORD *)&v21[4] = v4;
        *(_WORD *)&v21[12] = 2080;
        *(_QWORD *)&v21[14] = "+[VCImageQueue drawingContext]";
        *(_WORD *)&v21[22] = 1024;
        *(_DWORD *)v22 = 126;
        _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d drawingContext sContext is not Null", v21, 0x1Cu);
      }
    }
    else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      +[VCImageQueue drawingContext].cold.3();
    }
  }
  objc_msgSend(MEMORY[0x1E0CD28B0], "synchronize");
  if ((objc_msgSend((id)sContext, "valid") & 1) == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v21 = 136315650;
        *(_QWORD *)&v21[4] = v7;
        *(_WORD *)&v21[12] = 2080;
        *(_QWORD *)&v21[14] = "+[VCImageQueue drawingContext]";
        *(_WORD *)&v21[22] = 1024;
        *(_DWORD *)v22 = 129;
        _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d drawingContext sContext is invalid, getting rid of it since it is probably stale", v21, 0x1Cu);
      }
    }
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");

    sContext = 0;
    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  }
  if (!sContext)
  {
LABEL_14:
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    if (CARenderServerIsRunning())
    {
      sContext = (uint64_t)(id)objc_msgSend(MEMORY[0x1E0CD2720], "localContext");
      if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
      {
        v9 = VRTraceErrorLogLevelToCSTR();
        v10 = *MEMORY[0x1E0CF2758];
        v11 = *MEMORY[0x1E0CF2758];
        if (!*MEMORY[0x1E0CF2748])
        {
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
            +[VCImageQueue drawingContext].cold.1();
          goto LABEL_28;
        }
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v21 = 136315650;
          *(_QWORD *)&v21[4] = v9;
          *(_WORD *)&v21[12] = 2080;
          *(_QWORD *)&v21[14] = "+[VCImageQueue drawingContext]";
          *(_WORD *)&v21[22] = 1024;
          *(_DWORD *)v22 = 146;
          v12 = " [%s] %s:%d drawingContext sContext is now [CAContext localContext]";
LABEL_23:
          _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, v12, v21, 0x1Cu);
        }
      }
    }
    else
    {
      sContext = (uint64_t)(id)objc_msgSend(MEMORY[0x1E0CD2720], "remoteContext");
      if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
      {
        v13 = VRTraceErrorLogLevelToCSTR();
        v10 = *MEMORY[0x1E0CF2758];
        v14 = *MEMORY[0x1E0CF2758];
        if (!*MEMORY[0x1E0CF2748])
        {
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
            +[VCImageQueue drawingContext].cold.2();
          goto LABEL_28;
        }
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v21 = 136315650;
          *(_QWORD *)&v21[4] = v13;
          *(_WORD *)&v21[12] = 2080;
          *(_QWORD *)&v21[14] = "+[VCImageQueue drawingContext]";
          *(_WORD *)&v21[22] = 1024;
          *(_DWORD *)v22 = 149;
          v12 = " [%s] %s:%d drawingContext sContext is now [CAContext remoteContext]";
          goto LABEL_23;
        }
      }
    }
LABEL_28:
    if (!sContext && (int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v15 = VRTraceErrorLogLevelToCSTR();
      v16 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v17 = sContext;
        IsRunning = CARenderServerIsRunning();
        v19 = "remoteContext";
        *(_DWORD *)v21 = 136316162;
        *(_QWORD *)&v21[4] = v15;
        *(_WORD *)&v21[12] = 2080;
        *(_QWORD *)&v21[14] = "+[VCImageQueue drawingContext]";
        if (IsRunning)
          v19 = "localContext";
        *(_WORD *)&v21[22] = 1024;
        *(_DWORD *)v22 = 152;
        *(_WORD *)&v22[4] = 2048;
        *(_QWORD *)&v22[6] = v17;
        v23 = 2080;
        v24 = v19;
        _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d drawingContext sContext=%p type=%s", v21, 0x30u);
      }
    }
    objc_msgSend(MEMORY[0x1E0CD28B0], "commit", *(_OWORD *)v21, *(_QWORD *)&v21[16], *(_QWORD *)v22);
  }
  objc_msgSend(MEMORY[0x1E0CD28B0], "flush");
  objc_sync_exit(v3);

  return (id)sContext;
}

- (int64_t)streamToken
{
  NSObject *stateQueue;
  int64_t v3;
  _QWORD block[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__VCImageQueue_streamToken__block_invoke;
  block[3] = &unk_1E9E52938;
  block[4] = self;
  block[5] = &v6;
  dispatch_sync(stateQueue, block);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __27__VCImageQueue_streamToken__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 120);
  return result;
}

- (void)setStreamToken:(int64_t)a3
{
  NSObject *stateQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__VCImageQueue_setStreamToken___block_invoke;
  block[3] = &unk_1E9E52960;
  block[4] = self;
  block[5] = a3;
  dispatch_async(stateQueue, block);
}

_QWORD *__31__VCImageQueue_setStreamToken___block_invoke(_QWORD *result)
{
  _QWORD *v1;

  if (result[5] != *(_QWORD *)(result[4] + 120))
  {
    v1 = result;
    VCOverlayManager_updateOverlayEnabledState();
    VCOverlayManager_unregisterOverlayForToken(*(_QWORD *)(v1[4] + 120));

    *(_QWORD *)(v1[4] + 120) = v1[5];
    *(_QWORD *)(v1[4] + 144) = VCOverlayManager_registerOverlayForToken(v1[5]);
    return *(id *)(v1[4] + 144);
  }
  return result;
}

- (void)setTransformForRemoteVideoOrientationEnabled:(BOOL)a3
{
  _BOOL4 v3;
  _opaque_pthread_mutex_t *p_enqueueLock;
  CALayer *caLayer;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _OWORD v11[8];
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x1E0C80C00];
  p_enqueueLock = &self->_enqueueLock;
  pthread_mutex_lock(&self->_enqueueLock);
  if (self->_transformForRemoteVideoOrientationEnabled != v3)
  {
    self->_transformForRemoteVideoOrientationEnabled = v3;
    if (v3)
    {
      _VCImageQueue_applyLayerTransforms((uint64_t)self, 0);
    }
    else if (self->_caLayer)
    {
      objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
      objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
      caLayer = self->_caLayer;
      v7 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
      v11[4] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
      v11[5] = v7;
      v8 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
      v11[6] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
      v11[7] = v8;
      v9 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
      v11[0] = *MEMORY[0x1E0CD2610];
      v11[1] = v9;
      v10 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
      v11[2] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
      v11[3] = v10;
      -[CALayer setTransform:](caLayer, "setTransform:", v11);
      objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
    }
  }
  pthread_mutex_unlock(p_enqueueLock);
}

- (VCImageQueue)initWithFrameRate:(unsigned __int8)a3 imageQueueProtected:(BOOL)a4 vcImageQueueConfig:(const tagVCImageQueueConfig *)a5
{
  _BOOL4 v6;
  unsigned int v7;
  int ErrorLogLevelForModule;
  os_log_t *v10;
  uint64_t v11;
  NSObject *v12;
  VCImageQueue *v13;
  uint64_t v14;
  NSObject *v15;
  const __CFAllocator *v16;
  NSObject *CustomRootQueue;
  OpaqueCMClock *HostTimeClock;
  CMTimebaseRef v19;
  uint64_t FigBaseObject;
  void (*v21)(uint64_t, _QWORD, CMTimebaseRef);
  OpaqueFigImageQueue *figQueue;
  void (*v23)(OpaqueFigImageQueue *, _QWORD);
  uint64_t v24;
  void (*v25)(uint64_t, _QWORD, const __CFString *);
  uint64_t v26;
  void (*v27)(uint64_t, _QWORD, _QWORD);
  _BOOL4 var0;
  uint64_t v29;
  NSObject *v30;
  OpaqueFigImageQueue *v31;
  _CAImageQueue *caQueue;
  unsigned int slot;
  _BOOL4 layerHostMode;
  _BOOL4 isLocalVideo;
  _BOOL4 isExternalCamera;
  __int128 *v37;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  CMTime v51;
  CMTimebaseRef timebaseOut;
  objc_super v53;
  CMTime buf;
  int v55;
  __int16 v56;
  _BYTE v57[10];
  OpaqueFigImageQueue *v58;
  __int16 v59;
  _CAImageQueue *v60;
  __int16 v61;
  unsigned int v62;
  __int16 v63;
  _BOOL4 v64;
  __int16 v65;
  _BOOL4 v66;
  __int16 v67;
  _BOOL4 v68;
  uint64_t v69;

  v6 = a4;
  v7 = a3;
  v69 = *MEMORY[0x1E0C80C00];
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ VCImageQueue-init");
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  v10 = (os_log_t *)MEMORY[0x1E0CF2758];
  if (ErrorLogLevelForModule >= 6)
  {
    v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf.value) = 136316162;
      *(CMTimeValue *)((char *)&buf.value + 4) = v11;
      LOWORD(buf.flags) = 2080;
      *(_QWORD *)((char *)&buf.flags + 2) = "-[VCImageQueue initWithFrameRate:imageQueueProtected:vcImageQueueConfig:]";
      HIWORD(buf.epoch) = 1024;
      v55 = 228;
      v56 = 1024;
      *(_DWORD *)v57 = v7;
      *(_WORD *)&v57[4] = 1024;
      *(_DWORD *)&v57[6] = v6;
      _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ VCImageQueue-init frameRate=%d imageQueueProtected=%d", (uint8_t *)&buf, 0x28u);
    }
  }
  v53.receiver = self;
  v53.super_class = (Class)VCImageQueue;
  v13 = -[VCImageQueue init](&v53, sel_init);
  +[VCDefaults integerValueForKey:defaultValue:](VCDefaults, "integerValueForKey:defaultValue:", CFSTR("caImageQueueCapacity"), 16);
  v13->_caQueue = (_CAImageQueue *)CAImageQueueCreate();
  v13->_imageQueueProtected = v6;
  if (v6)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *v10;
      if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf.value) = 136315650;
        *(CMTimeValue *)((char *)&buf.value + 4) = v14;
        LOWORD(buf.flags) = 2080;
        *(_QWORD *)((char *)&buf.flags + 2) = "-[VCImageQueue initWithFrameRate:imageQueueProtected:vcImageQueueConfig:]";
        HIWORD(buf.epoch) = 1024;
        v55 = 236;
        _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Setting kCAImageQueueProtected to CAImageQueue", (uint8_t *)&buf, 0x1Cu);
      }
    }
    CAImageQueueSetFlags();
  }
  CAImageQueueSetFlags();
  v16 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  FigImageQueueCreateForCoreAnimation();
  pthread_mutex_init(&v13->_enqueueLock, 0);
  CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(47);
  v13->_stateQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCImageQueue.streamTokenQueue", 0, CustomRootQueue);
  timebaseOut = 0;
  HostTimeClock = CMClockGetHostTimeClock();
  CMTimebaseCreateWithSourceClock(v16, HostTimeClock, &timebaseOut);
  buf = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
  v51 = buf;
  CMTimebaseSetRateAndAnchorTime(timebaseOut, 1.0, &buf, &v51);
  v19 = timebaseOut;
  if (timebaseOut)
  {
    FigBaseObject = FigImageQueueGetFigBaseObject();
    v21 = *(void (**)(uint64_t, _QWORD, CMTimebaseRef))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
    if (v21)
      v21(FigBaseObject, *MEMORY[0x1E0CC46B0], v19);
    CFRelease(timebaseOut);
  }
  figQueue = v13->_figQueue;
  v23 = *(void (**)(OpaqueFigImageQueue *, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 40);
  if (v23)
    v23(figQueue, 0);
  CAImageQueueSetFlags();
  v24 = FigImageQueueGetFigBaseObject();
  v25 = *(void (**)(uint64_t, _QWORD, const __CFString *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v25)
    v25(v24, *MEMORY[0x1E0CC46C0], CFSTR("None"));
  v26 = FigImageQueueGetFigBaseObject();
  v27 = *(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v27)
    v27(v26, *MEMORY[0x1E0CC46B8], *MEMORY[0x1E0C9AE50]);
  -[VCImageQueue createAllocators](v13, "createAllocators");
  v13->_slot = 0;
  v13->_frameRate = v7;
  v13->_frameCount = 0;
  v13->_frameCountHistory = CFArrayCreateMutable(v16, 10, MEMORY[0x1E0C9B378]);
  if (a5
    && (v13->_isLocalVideo = a5->var2,
        v13->_isExternalCamera = a5->var3,
        var0 = a5->var0,
        v13->_layerHostMode = var0,
        v13->_cameraFacing = a5->var4,
        var0))
  {
    -[VCImageQueue createCAContextWithSize:](v13, "createCAContextWithSize:", a5->var1.origin.x, a5->var1.origin.y, a5->var1.size.width, a5->var1.size.height);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    -[VCImageQueue createSlotAndConnectCAQueue](v13, "createSlotAndConnectCAQueue");
    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  }
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ VCImageQueue-init");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v29 = VRTraceErrorLogLevelToCSTR();
    v30 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
    {
      caQueue = v13->_caQueue;
      v31 = v13->_figQueue;
      slot = v13->_slot;
      layerHostMode = v13->_layerHostMode;
      isLocalVideo = v13->_isLocalVideo;
      isExternalCamera = v13->_isExternalCamera;
      LODWORD(buf.value) = 136317442;
      *(CMTimeValue *)((char *)&buf.value + 4) = v29;
      LOWORD(buf.flags) = 2080;
      *(_QWORD *)((char *)&buf.flags + 2) = "-[VCImageQueue initWithFrameRate:imageQueueProtected:vcImageQueueConfig:]";
      HIWORD(buf.epoch) = 1024;
      v55 = 287;
      v56 = 2048;
      *(_QWORD *)v57 = v13;
      *(_WORD *)&v57[8] = 2048;
      v58 = v31;
      v59 = 2048;
      v60 = caQueue;
      v61 = 1024;
      v62 = slot;
      v63 = 1024;
      v64 = layerHostMode;
      v65 = 1024;
      v66 = isLocalVideo;
      v67 = 1024;
      v68 = isExternalCamera;
      _os_log_impl(&dword_1D8A54000, v30, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ VCImageQueue-init VCImageQueue=%p FigImageQueue=%p CAImageQueue=%p, slot=%u, layerHostMode=%d localVideo=%d externalCamera=%d", (uint8_t *)&buf, 0x52u);
    }
  }
  v37 = (__int128 *)MEMORY[0x1E0CD2610];
  __asm { FMOV            V0.2D, #1.0 }
  v43 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
  v44 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
  v45 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
  *(_OWORD *)&v13->_transform.m33 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
  *(_OWORD *)&v13->_transform.m41 = v44;
  *(_OWORD *)&v13->_transform.m43 = v45;
  v46 = *v37;
  v47 = v37[1];
  v13->_contentsRect.size = _Q0;
  *(_OWORD *)&v13->_transform.m11 = v46;
  v48 = v37[2];
  v49 = v37[3];
  *(_OWORD *)&v13->_transform.m13 = v47;
  *(_OWORD *)&v13->_transform.m21 = v48;
  v13->_contentsRect.origin.x = 0.0;
  v13->_contentsRect.origin.y = 0.0;
  v13->_transformForRemoteVideoOrientationEnabled = 1;
  *(_OWORD *)&v13->_transform.m23 = v49;
  *(_OWORD *)&v13->_transform.m31 = v43;
  pthread_cond_init(&v13->_waitForLayoutChangeCondition, 0);
  return v13;
}

- (void)dealloc
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
  OUTLINED_FUNCTION_2_3(&dword_1D8A54000, v0, v1, " [%s] %s:%d ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)configureCALayerWithRect:(CGRect)a3 name:(id)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  _QWORD *v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[CALayer setContents:](self->_caLayer, "setContents:", self->_caQueue);
  _VCImageQueue_configureCALayerBounds((uint64_t)self, 0, x, y, width, height);
  if (self->_isLocalVideo)
    v10 = (_QWORD *)MEMORY[0x1E0CD2F98];
  else
    v10 = (_QWORD *)MEMORY[0x1E0CD2F90];
  -[CALayer setContentsGravity:](self->_caLayer, "setContentsGravity:", *v10);
  -[CALayer setName:](self->_caLayer, "setName:", a4);
  -[CALayer setAllowsHitTesting:](self->_caLayer, "setAllowsHitTesting:", 0);
  -[CALayer setInheritsTiming:](self->_caLayer, "setInheritsTiming:", 0);
  -[CALayer setAllowsDisplayCompositing:](self->_caLayer, "setAllowsDisplayCompositing:", 1);
}

- (unsigned)createCAContextWithSize:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  CAContext *v9;
  CALayer *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  uint64_t v20;
  NSObject *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  const __CFString *v36;
  __int16 v37;
  VCImageQueue *v38;
  uint64_t v39;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v39 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  if (!self->_caQueue)
  {
    if ((VCImageQueue *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCImageQueue createCAContextWithSize:].cold.1();
      }
      goto LABEL_62;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v15 = (const __CFString *)-[VCImageQueue performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v15 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_62;
    v20 = VRTraceErrorLogLevelToCSTR();
    v21 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_62;
    *(_DWORD *)buf = 136316162;
    v30 = v20;
    v31 = 2080;
    v32 = "-[VCImageQueue createCAContextWithSize:]";
    v33 = 1024;
    v34 = 433;
    v35 = 2112;
    v36 = v15;
    v37 = 2048;
    v38 = self;
    v22 = " [%s] %s:%d %@(%p) Invalid caQueue";
    goto LABEL_61;
  }
  -[VCImageQueue cleanupCAContextAndCALayer](self, "cleanupCAContextAndCALayer");
  if (self->_isLocalVideo)
  {
    v27 = *MEMORY[0x1E0CD2A50];
    v28 = MEMORY[0x1E0C9AAB0];
    v8 = (void *)objc_msgSend(MEMORY[0x1E0CD2720], "remoteContextWithOptions:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1));
  }
  else
  {
    v8 = (void *)objc_msgSend(MEMORY[0x1E0CD2720], "remoteContext");
  }
  v9 = v8;
  self->_caContext = v9;
  if (!v9)
  {
    if ((VCImageQueue *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCImageQueue createCAContextWithSize:].cold.2();
      }
      goto LABEL_62;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v16 = (const __CFString *)-[VCImageQueue performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v16 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_62;
    v23 = VRTraceErrorLogLevelToCSTR();
    v21 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_62;
    *(_DWORD *)buf = 136316162;
    v30 = v23;
    v31 = 2080;
    v32 = "-[VCImageQueue createCAContextWithSize:]";
    v33 = 1024;
    v34 = 442;
    v35 = 2112;
    v36 = v16;
    v37 = 2048;
    v38 = self;
    v22 = " [%s] %s:%d %@(%p) Invalid remoteContext";
    goto LABEL_61;
  }
  v10 = (CALayer *)(id)objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
  self->_caLayer = v10;
  if (!v10)
  {
    if ((VCImageQueue *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCImageQueue createCAContextWithSize:].cold.3();
      }
      goto LABEL_62;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v17 = (const __CFString *)-[VCImageQueue performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v17 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_62;
    v24 = VRTraceErrorLogLevelToCSTR();
    v21 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_62;
    *(_DWORD *)buf = 136316162;
    v30 = v24;
    v31 = 2080;
    v32 = "-[VCImageQueue createCAContextWithSize:]";
    v33 = 1024;
    v34 = 444;
    v35 = 2112;
    v36 = v17;
    v37 = 2048;
    v38 = self;
    v22 = " [%s] %s:%d %@(%p) CALayer create failed";
    goto LABEL_61;
  }
  -[CAContext setLayer:](self->_caContext, "setLayer:", v10);
  v11 = -[CAContext createSlot](self->_caContext, "createSlot");
  self->_layerHostSlot = v11;
  if (!(_DWORD)v11)
  {
    if ((VCImageQueue *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCImageQueue createCAContextWithSize:].cold.4();
      }
      goto LABEL_62;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v18 = (const __CFString *)-[VCImageQueue performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v18 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_62;
    v25 = VRTraceErrorLogLevelToCSTR();
    v21 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_62;
    *(_DWORD *)buf = 136316162;
    v30 = v25;
    v31 = 2080;
    v32 = "-[VCImageQueue createCAContextWithSize:]";
    v33 = 1024;
    v34 = 448;
    v35 = 2112;
    v36 = v18;
    v37 = 2048;
    v38 = self;
    v22 = " [%s] %s:%d %@(%p) Invalid slot for layer host";
LABEL_61:
    _os_log_error_impl(&dword_1D8A54000, v21, OS_LOG_TYPE_ERROR, v22, buf, 0x30u);
    goto LABEL_62;
  }
  -[CAContext setObject:forSlot:](self->_caContext, "setObject:forSlot:", self->_caQueue, v11);
  v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("VCImageQueueRemoteLayer%p(%d)"), self, 0);
  if (!v12)
  {
    if ((VCImageQueue *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCImageQueue createCAContextWithSize:].cold.5();
      }
      goto LABEL_62;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v19 = (const __CFString *)-[VCImageQueue performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v19 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v26 = VRTraceErrorLogLevelToCSTR();
      v21 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v30 = v26;
        v31 = 2080;
        v32 = "-[VCImageQueue createCAContextWithSize:]";
        v33 = 1024;
        v34 = 451;
        v35 = 2112;
        v36 = v19;
        v37 = 2048;
        v38 = self;
        v22 = " [%s] %s:%d %@(%p) Failed to allocate layer name";
        goto LABEL_61;
      }
    }
LABEL_62:
    -[VCImageQueue cleanupCAContextAndCALayer](self, "cleanupCAContextAndCALayer");
    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
    v13 = 0;
    goto LABEL_10;
  }
  v13 = (void *)v12;
  -[VCImageQueue configureCALayerWithRect:name:](self, "configureCALayerWithRect:name:", v12, x, y, width, height);
  self->_contextId = -[CAContext contextId](self->_caContext, "contextId");
  _VCImageQueue_signalWaitForLayoutChangeCondition((uint64_t)self);
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  objc_msgSend(MEMORY[0x1E0CD28B0], "flush");
  objc_msgSend(MEMORY[0x1E0CD28B0], "synchronize");
  self->_layerHostMode = 1;
LABEL_10:

  return self->_contextId;
}

- (void)cleanupCAContextAndCALayer
{
  CAContext *caContext;
  CALayer *caLayer;
  CAContext *v5;

  if (self->_layerHostSlot)
  {
    -[CAContext deleteSlot:](self->_caContext, "deleteSlot:");
    self->_layerHostSlot = 0;
  }
  caContext = self->_caContext;
  if (caContext)
    -[CAContext setLayer:](caContext, "setLayer:", 0);
  caLayer = self->_caLayer;
  if (caLayer)
  {
    -[CALayer removeFromSuperlayer](caLayer, "removeFromSuperlayer");

    self->_caLayer = 0;
  }
  v5 = self->_caContext;
  if (v5)
  {
    -[CAContext invalidate](v5, "invalidate");

    self->_caContext = 0;
  }
}

- (void)createSlotAndConnectCAQueue
{
  id v3;
  void *v4;
  uint64_t slot;

  v3 = +[VCImageQueue drawingContext](VCImageQueue, "drawingContext");
  v4 = v3;
  slot = self->_slot;
  if (!(_DWORD)slot)
  {
    slot = objc_msgSend(v3, "createSlot");
    self->_slot = slot;
  }
  objc_msgSend(v4, "setObject:forSlot:", self->_caQueue, slot);
}

- (void)releaseSlot
{
  if (self->_slot)
  {
    objc_msgSend(+[VCImageQueue drawingContext](VCImageQueue, "drawingContext"), "deleteSlot:", self->_slot);
    self->_slot = 0;
  }
}

- (void)releaseAllocators
{
  __CFAllocator *streamOutputAllocator;

  streamOutputAllocator = self->_streamOutputAllocator;
  if (streamOutputAllocator)
    CFRelease(streamOutputAllocator);
}

- (VCStreamOutput)streamOutput
{
  _opaque_pthread_mutex_t *p_enqueueLock;
  VCStreamOutput *v4;

  p_enqueueLock = &self->_enqueueLock;
  pthread_mutex_lock(&self->_enqueueLock);
  v4 = self->_streamOutput;
  pthread_mutex_unlock(p_enqueueLock);
  return v4;
}

- (void)setStreamOutput:(id)a3
{
  _opaque_pthread_mutex_t *p_enqueueLock;
  VCStreamOutput *streamOutput;
  BOOL v7;
  __CFDictionary *storedAttributes;
  VCPixelBufferOverlay *pixelBufferOverlay;
  _OWORD v10[5];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  p_enqueueLock = &self->_enqueueLock;
  pthread_mutex_lock(&self->_enqueueLock);
  streamOutput = self->_streamOutput;
  if (streamOutput)
    v7 = streamOutput == a3;
  else
    v7 = 1;
  if (!v7)
  {

    streamOutput = 0;
    self->_streamOutput = 0;
  }
  if (a3)
  {
    streamOutput = (VCStreamOutput *)a3;
    self->_streamOutput = streamOutput;
    storedAttributes = self->_storedAttributes;
    if (storedAttributes)
    {
      pixelBufferOverlay = self->_pixelBufferOverlay;
      if (pixelBufferOverlay)
      {
        v13 = xmmword_1D910CF80;
        v14 = unk_1D910CF90;
        v15 = xmmword_1D910CFA0;
        v11 = xmmword_1D910CF60;
        v12 = unk_1D910CF70;
        -[VCPixelBufferOverlay currentDetails](pixelBufferOverlay, "currentDetails");
        *(_QWORD *)&v15 = self->_storedAttributes;
        v10[2] = v13;
        v10[3] = v14;
        v10[0] = v11;
        v10[1] = v12;
        v10[4] = v15;
        -[VCPixelBufferOverlay setCurrentDetails:](self->_pixelBufferOverlay, "setCurrentDetails:", v10);
        streamOutput = self->_streamOutput;
        storedAttributes = self->_storedAttributes;
      }
      VCStreamOutput_EnqueueAttributes((uint64_t)streamOutput, (unint64_t)storedAttributes);
      streamOutput = self->_streamOutput;
    }
  }
  self->_usingRemoteQueue = streamOutput != 0;
  pthread_mutex_unlock(p_enqueueLock);
}

uint64_t __36__VCImageQueue_setVideoDestination___block_invoke(uint64_t a1)
{
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(*(id *)(a1 + 32), "setContents:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8));
  return objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (void)getQueueRepresentation:(void *)a3
{
  if (a3)
    *(_DWORD *)a3 = self->_slot;
}

- (void)stop
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
  OUTLINED_FUNCTION_2_3(&dword_1D8A54000, v0, v1, " [%s] %s:%d ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)pause
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
  OUTLINED_FUNCTION_2_3(&dword_1D8A54000, v0, v1, " [%s] %s:%d ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)createAndCopyPerformanceDictionary:(const __CFDictionary *)a3
{
  OpaqueFigImageQueue *figQueue;
  void (*v5)(OpaqueFigImageQueue *, const __CFDictionary **);

  figQueue = self->_figQueue;
  v5 = *(void (**)(OpaqueFigImageQueue *, const __CFDictionary **))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                             + 72);
  if (v5)
    v5(figQueue, a3);
}

- (void)createAndCopyLatencyStatsDictionary:(const __CFDictionary *)a3
{
  uint64_t FigBaseObject;
  void (*v5)(uint64_t, const __CFString *, _QWORD, const __CFDictionary **);

  FigBaseObject = FigImageQueueGetFigBaseObject();
  v5 = *(void (**)(uint64_t, const __CFString *, _QWORD, const __CFDictionary **))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                                           + 48);
  if (v5)
    v5(FigBaseObject, CFSTR("OriginToPresentationLatencyStatistics"), *MEMORY[0x1E0C9AE00], a3);
}

- (BOOL)imageQueueProtected
{
  return self->_imageQueueProtected;
}

- (void)setImageQueueProtected:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  NSObject *v6;
  _CAImageQueue *caQueue;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  int v15;
  __int16 v16;
  _BOOL4 v17;
  uint64_t v18;

  v3 = a3;
  v18 = *MEMORY[0x1E0C80C00];
  self->_imageQueueProtected = a3;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      caQueue = self->_caQueue;
      v8 = 136316162;
      v9 = v5;
      v10 = 2080;
      v11 = "-[VCImageQueue setImageQueueProtected:]";
      v12 = 1024;
      v13 = 1274;
      v14 = 1024;
      v15 = (int)caQueue;
      v16 = 1024;
      v17 = v3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d _caQueue=%x, imageQueueProtected=%d", (uint8_t *)&v8, 0x28u);
    }
  }
  if (self->_caQueue)
    CAImageQueueSetFlags();
}

- (BOOL)isLowLatencyEnabled
{
  return self->_isLowLatencyEnabled;
}

- (void)setLowLatencyEnabled:(BOOL)a3
{
  self->_isLowLatencyEnabled = a3;
}

- (BOOL)usingRemoteQueue
{
  return self->_usingRemoteQueue;
}

- (BOOL)isLayerHostMode
{
  return self->_layerHostMode;
}

- (void)setLayerHostMode:(BOOL)a3
{
  self->_layerHostMode = a3;
}

- (BOOL)isExternalCamera
{
  return self->_isExternalCamera;
}

- (void)setIsExternalCamera:(BOOL)a3
{
  self->_isExternalCamera = a3;
}

- (BOOL)isTransformForRemoteVideoOrientationEnabled
{
  return self->_transformForRemoteVideoOrientationEnabled;
}

void ___VCImageQueue_setFenceWithCompletionHandler_block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  int v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x1E0CF2758];
    v4 = *MEMORY[0x1E0CF2758];
    if (*MEMORY[0x1E0CF2748])
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v6 = *(_QWORD *)(a1 + 32);
        v5 = *(void **)(a1 + 40);
        v7 = 136316674;
        v8 = v2;
        v9 = 2080;
        v10 = "_VCImageQueue_setFenceWithCompletionHandler_block_invoke";
        v11 = 1024;
        v12 = 372;
        v13 = 1024;
        v14 = 372;
        v15 = 2048;
        v16 = v6;
        v17 = 2048;
        v18 = v5;
        v19 = 2048;
        v20 = objc_msgSend(v5, "context");
        _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCImageQueue.m:%d: fence=%p for layer=%p and context=%p resolved successfully", (uint8_t *)&v7, 0x40u);
      }
    }
    else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      ___VCImageQueue_setFenceWithCompletionHandler_block_invoke_cold_1(v2, a1, v3);
    }
  }
}

+ (void)drawingContext
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
  OUTLINED_FUNCTION_2_3(&dword_1D8A54000, v0, v1, " [%s] %s:%d drawingContext sContext is not Null", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)createCAContextWithSize:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid caQueue", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)createCAContextWithSize:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid remoteContext", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)createCAContextWithSize:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d CALayer create failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)createCAContextWithSize:.cold.4()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid slot for layer host", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)createCAContextWithSize:.cold.5()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate layer name", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setVideoDestination:.cold.1()
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
  OUTLINED_FUNCTION_2_3(&dword_1D8A54000, v0, v1, " [%s] %s:%d ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void ___VCImageQueue_setFenceWithCompletionHandler_block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = *(_QWORD *)(a2 + 32);
  v5 = *(void **)(a2 + 40);
  objc_msgSend(v5, "context");
  v8 = 136316674;
  v9 = a1;
  v10 = 2080;
  v11 = "_VCImageQueue_setFenceWithCompletionHandler_block_invoke";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8_5();
  v12 = 2048;
  v13 = v6;
  v14 = 2048;
  v15 = v5;
  v16 = 2048;
  v17 = v7;
  _os_log_debug_impl(&dword_1D8A54000, a3, OS_LOG_TYPE_DEBUG, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCImageQueue.m:%d: fence=%p for layer=%p and context=%p resolved successfully", (uint8_t *)&v8, 0x40u);
}

@end
