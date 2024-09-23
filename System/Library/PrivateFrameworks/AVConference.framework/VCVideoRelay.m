@implementation VCVideoRelay

+ (id)sharedInstance
{
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __30__VCVideoRelay_sharedInstance__block_invoke;
  v3[3] = &unk_1E9E521C0;
  v3[4] = a1;
  if (sharedInstance_onceToken_16 != -1)
    dispatch_once(&sharedInstance_onceToken_16, v3);
  return (id)sharedInstance__vcVideoRelaySingleton;
}

Class *__30__VCVideoRelay_sharedInstance__block_invoke(Class *result)
{
  if (!sharedInstance__vcVideoRelaySingleton)
  {
    result = (Class *)objc_alloc_init(result[4]);
    sharedInstance__vcVideoRelaySingleton = (uint64_t)result;
  }
  return result;
}

- (VCVideoRelay)init
{
  VCVideoRelay *v2;
  NSObject *CustomRootQueue;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)VCVideoRelay;
  v2 = -[VCVideoRelay init](&v5, sel_init);
  if (v2)
  {
    v2->_videoCaptureSinks = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(47);
    v2->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCVideoRelay.dispatchQueue", 0, CustomRootQueue);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  dispatch_release((dispatch_object_t)self->_dispatchQueue);
  v3.receiver = self;
  v3.super_class = (Class)VCVideoRelay;
  -[VCVideoRelay dealloc](&v3, sel_dealloc);
}

- (BOOL)enqueueFrame:(__CVBuffer *)a3 atTime:(id *)a4 cameraStatusBits:(unsigned __int8)a5
{
  CMSampleBufferRef SampleBufferWithPixelBuffer;
  NSObject *dispatchQueue;
  _BOOL4 v10;
  _QWORD v12[6];
  __int128 v13;
  int64_t var3;
  uint64_t v15;
  uint64_t v16;
  unsigned __int8 v17;
  __int16 v18;
  char v19;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v10 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v10)
        return v10;
      -[VCVideoRelay enqueueFrame:atTime:cameraStatusBits:].cold.1();
    }
LABEL_10:
    LOBYTE(v10) = 0;
    return v10;
  }
  v20 = *a4;
  SampleBufferWithPixelBuffer = createSampleBufferWithPixelBuffer(a3, (__int128 *)&v20.var0);
  if (!SampleBufferWithPixelBuffer)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v10 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v10)
        return v10;
      -[VCVideoRelay enqueueFrame:atTime:cameraStatusBits:].cold.2();
    }
    goto LABEL_10;
  }
  v16 = 0;
  v18 = 0;
  v19 = 0;
  dispatchQueue = self->_dispatchQueue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __53__VCVideoRelay_enqueueFrame_atTime_cameraStatusBits___block_invoke;
  v12[3] = &unk_1E9E584E8;
  v12[4] = self;
  v12[5] = SampleBufferWithPixelBuffer;
  v13 = *(_OWORD *)&a4->var0;
  var3 = a4->var3;
  v15 = 0;
  v17 = a5;
  dispatch_sync(dispatchQueue, v12);
  LOBYTE(v10) = 1;
  return v10;
}

void __53__VCVideoRelay_enqueueFrame_atTime_cameraStatusBits___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  uint64_t v8;
  const void *v9;
  __int128 v10;
  int v11;
  __int128 v12;
  uint64_t v13;
  _BYTE v14[128];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v16 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        v8 = *(_QWORD *)(a1 + 40);
        v12 = *(_OWORD *)(a1 + 48);
        v13 = *(_QWORD *)(a1 + 64);
        v10 = *(_OWORD *)(a1 + 72);
        v11 = *(_DWORD *)(a1 + 88);
        objc_msgSend(v7, "onVideoFrame:frameTime:attribute:", v8, &v12, &v10);
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
    }
    while (v4);
  }
  v9 = *(const void **)(a1 + 40);
  if (v9)
    CFRelease(v9);
}

- (BOOL)registerForVideoFrames:(id)a3
{
  NSObject *dispatchQueue;
  BOOL v4;
  _QWORD v6[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v7 = 0;
    v8 = &v7;
    v9 = 0x2020000000;
    v10 = 0;
    dispatchQueue = self->_dispatchQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __39__VCVideoRelay_registerForVideoFrames___block_invoke;
    v6[3] = &unk_1E9E550C8;
    v6[4] = self;
    v6[5] = a3;
    v6[6] = &v7;
    dispatch_sync(dispatchQueue, v6);
    v4 = *((_BYTE *)v8 + 24) != 0;
    _Block_object_dispose(&v7, 8);
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVideoRelay registerForVideoFrames:].cold.1();
    }
    return 0;
  }
  return v4;
}

void __39__VCVideoRelay_registerForVideoFrames___block_invoke(_QWORD *a1)
{
  if (objc_msgSend(*(id *)(a1[4] + 8), "containsObject:", a1[5]))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __39__VCVideoRelay_registerForVideoFrames___block_invoke_cold_1();
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1[4] + 8), "addObject:", a1[5]);
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  }
}

- (BOOL)deregisterForVideoFrames:(id)a3
{
  NSObject *dispatchQueue;
  BOOL v4;
  _QWORD v6[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v7 = 0;
    v8 = &v7;
    v9 = 0x2020000000;
    v10 = 0;
    dispatchQueue = self->_dispatchQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __41__VCVideoRelay_deregisterForVideoFrames___block_invoke;
    v6[3] = &unk_1E9E550C8;
    v6[4] = self;
    v6[5] = a3;
    v6[6] = &v7;
    dispatch_sync(dispatchQueue, v6);
    v4 = *((_BYTE *)v8 + 24) != 0;
    _Block_object_dispose(&v7, 8);
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVideoRelay deregisterForVideoFrames:].cold.1();
    }
    return 0;
  }
  return v4;
}

void __41__VCVideoRelay_deregisterForVideoFrames___block_invoke(_QWORD *a1)
{
  if ((objc_msgSend(*(id *)(a1[4] + 8), "containsObject:", a1[5]) & 1) != 0)
  {
    objc_msgSend(*(id *)(a1[4] + 8), "removeObject:", a1[5]);
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      __41__VCVideoRelay_deregisterForVideoFrames___block_invoke_cold_1();
  }
}

- (void)enqueueFrame:atTime:cameraStatusBits:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d frameBuffer is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)enqueueFrame:atTime:cameraStatusBits:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create CMSampleBuffer", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)registerForVideoFrames:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d client is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __39__VCVideoRelay_registerForVideoFrames___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  const void *v4;

  OUTLINED_FUNCTION_8_0();
  *(_QWORD *)&v3[6] = "-[VCVideoRelay registerForVideoFrames:]_block_invoke";
  OUTLINED_FUNCTION_7_3();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d client %p is already in_videoCaptureSinks", v2, *(const char **)v3, (unint64_t)"-[VCVideoRelay registerForVideoFrames:]_block_invoke" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)deregisterForVideoFrames:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d client is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __41__VCVideoRelay_deregisterForVideoFrames___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  const void *v4;

  OUTLINED_FUNCTION_8_0();
  *(_QWORD *)&v3[6] = "-[VCVideoRelay deregisterForVideoFrames:]_block_invoke";
  OUTLINED_FUNCTION_7_3();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d client %p is not in _videoCaptureSinks", v2, *(const char **)v3, (unint64_t)"-[VCVideoRelay deregisterForVideoFrames:]_block_invoke" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

@end
