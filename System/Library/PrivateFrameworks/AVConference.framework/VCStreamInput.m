@implementation VCStreamInput

- (VCStreamInput)initWithStreamInputID:(id)a3 format:(opaqueCMFormatDescription *)a4 delegate:(id)a5 delegateQueue:(id)a6 remoteQueue:(id)a7
{
  VCStreamInput *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  const char *v16;
  NSObject *CustomRootQueue;
  dispatch_queue_t v18;
  uint64_t v19;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  const __CFString *v24;
  uint64_t v25;
  NSObject *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  NSObject *v32;
  uint32_t v33;
  uint64_t v34;
  objc_super v36;
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  int v42;
  __int16 v43;
  const __CFString *v44;
  __int16 v45;
  VCStreamInput *v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v36.receiver = self;
  v36.super_class = (Class)VCStreamInput;
  v12 = -[VCObject init](&v36, sel_init);
  if (!v12)
    goto LABEL_66;
  if (!a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCStreamInput initWithStreamInputID:format:delegate:delegateQueue:remoteQueue:].cold.1();
    }
    goto LABEL_66;
  }
  -[VCObject setLogPrefix:](v12, "setLogPrefix:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("streamInputID=%@"), a3));
  if (!a4)
  {
    if ((VCStreamInput *)objc_opt_class() == v12)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCStreamInput initWithStreamInputID:format:delegate:delegateQueue:remoteQueue:].cold.2();
      }
      goto LABEL_66;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v20 = (const __CFString *)-[VCStreamInput performSelector:](v12, "performSelector:", sel_logPrefix);
    else
      v20 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_66;
    v25 = VRTraceErrorLogLevelToCSTR();
    v26 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_66;
    *(_DWORD *)buf = 136316162;
    v38 = v25;
    v39 = 2080;
    v40 = "-[VCStreamInput initWithStreamInputID:format:delegate:delegateQueue:remoteQueue:]";
    v41 = 1024;
    v42 = 56;
    v43 = 2112;
    v44 = v20;
    v45 = 2048;
    v46 = v12;
    v27 = " [%s] %s:%d %@(%p) Provided format is NULL";
    goto LABEL_64;
  }
  if (!a5)
  {
    if ((VCStreamInput *)objc_opt_class() == v12)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCStreamInput initWithStreamInputID:format:delegate:delegateQueue:remoteQueue:].cold.3();
      }
      goto LABEL_66;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v21 = (const __CFString *)-[VCStreamInput performSelector:](v12, "performSelector:", sel_logPrefix);
    else
      v21 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_66;
    v28 = VRTraceErrorLogLevelToCSTR();
    v26 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_66;
    *(_DWORD *)buf = 136316162;
    v38 = v28;
    v39 = 2080;
    v40 = "-[VCStreamInput initWithStreamInputID:format:delegate:delegateQueue:remoteQueue:]";
    v41 = 1024;
    v42 = 57;
    v43 = 2112;
    v44 = v21;
    v45 = 2048;
    v46 = v12;
    v27 = " [%s] %s:%d %@(%p) Provided delegate is NULL";
    goto LABEL_64;
  }
  if (!a6)
  {
    if ((VCStreamInput *)objc_opt_class() == v12)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCStreamInput initWithStreamInputID:format:delegate:delegateQueue:remoteQueue:].cold.4();
      }
      goto LABEL_66;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v22 = (const __CFString *)-[VCStreamInput performSelector:](v12, "performSelector:", sel_logPrefix);
    else
      v22 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_66;
    v29 = VRTraceErrorLogLevelToCSTR();
    v26 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_66;
    *(_DWORD *)buf = 136316162;
    v38 = v29;
    v39 = 2080;
    v40 = "-[VCStreamInput initWithStreamInputID:format:delegate:delegateQueue:remoteQueue:]";
    v41 = 1024;
    v42 = 58;
    v43 = 2112;
    v44 = v22;
    v45 = 2048;
    v46 = v12;
    v27 = " [%s] %s:%d %@(%p) Provided delegate queue is NULL";
LABEL_64:
    v32 = v26;
    v33 = 48;
    goto LABEL_65;
  }
  v13 = (void *)MEMORY[0x1E0CB3940];
  v14 = (objc_class *)objc_opt_class();
  v15 = (void *)objc_msgSend(v13, "stringWithFormat:", CFSTR("%@.%@.%p"), CFSTR("com.apple.VideoConference"), NSStringFromClass(v14), v12);
  v16 = (const char *)objc_msgSend(v15, "UTF8String");
  CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(56);
  v18 = dispatch_queue_create_with_target_V2(v16, 0, CustomRootQueue);
  v12->_streamInputQueue = (OS_dispatch_queue *)v18;
  if (!v18)
  {
    if ((VCStreamInput *)objc_opt_class() == v12)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCStreamInput initWithStreamInputID:format:delegate:delegateQueue:remoteQueue:].cold.5();
      }
      goto LABEL_66;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v23 = (const __CFString *)-[VCStreamInput performSelector:](v12, "performSelector:", sel_logPrefix);
    else
      v23 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v30 = VRTraceErrorLogLevelToCSTR();
      v31 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        v38 = v30;
        v39 = 2080;
        v40 = "-[VCStreamInput initWithStreamInputID:format:delegate:delegateQueue:remoteQueue:]";
        v41 = 1024;
        v42 = 62;
        v43 = 2112;
        v44 = v23;
        v45 = 2048;
        v46 = v12;
        v47 = 2112;
        v48 = v15;
        v27 = " [%s] %s:%d %@(%p) Failed to create the dispatch queue with queueName=%@";
        v32 = v31;
        v33 = 58;
LABEL_65:
        _os_log_error_impl(&dword_1D8A54000, v32, OS_LOG_TYPE_ERROR, v27, buf, v33);
        goto LABEL_66;
      }
    }
    goto LABEL_66;
  }
  if (a7)
    -[VCStreamInput createRemoteReceiveQueue:](v12, "createRemoteReceiveQueue:", a7);
  v19 = objc_msgSend(a3, "copy");
  v12->_streamInputID = (NSNumber *)v19;
  if (!v19)
  {
    if ((VCStreamInput *)objc_opt_class() == v12)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCStreamInput initWithStreamInputID:format:delegate:delegateQueue:remoteQueue:].cold.6();
      }
      goto LABEL_66;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v24 = (const __CFString *)-[VCStreamInput performSelector:](v12, "performSelector:", sel_logPrefix);
    else
      v24 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v34 = VRTraceErrorLogLevelToCSTR();
      v26 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v38 = v34;
        v39 = 2080;
        v40 = "-[VCStreamInput initWithStreamInputID:format:delegate:delegateQueue:remoteQueue:]";
        v41 = 1024;
        v42 = 70;
        v43 = 2112;
        v44 = v24;
        v45 = 2048;
        v46 = v12;
        v27 = " [%s] %s:%d %@(%p) Failed to copy the stream input ID";
        goto LABEL_64;
      }
    }
LABEL_66:
    -[VCStreamInput invalidate](v12, "invalidate");

    return 0;
  }
  HIDWORD(v12->_lastAveragedTime.epoch) = 0;
  v12->_format = (opaqueCMFormatDescription *)CFRetain(a4);
  v12->_strongDelegate = (VCStreamInputDelegate *)a5;
  v12->_delegateQueue = (OS_dispatch_queue *)a6;
  dispatch_retain((dispatch_object_t)a6);
  return v12;
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalidate was not called!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (BOOL)isStarted
{
  NSObject *streamInputQueue;
  char v3;
  _QWORD block[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  streamInputQueue = self->_streamInputQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__VCStreamInput_isStarted__block_invoke;
  block[3] = &unk_1E9E52938;
  block[4] = self;
  block[5] = &v6;
  dispatch_sync(streamInputQueue, block);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __26__VCStreamInput_isStarted__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 216);
  return result;
}

- (void)invalidate
{
  NSObject *streamInputQueue;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD v7[6];
  _QWORD block[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  VCRemoteImageQueue_Destroy((uint64_t *)&self->_lastTransitTime);
  streamInputQueue = self->_streamInputQueue;
  if (streamInputQueue)
  {
    v9 = 0;
    v10 = &v9;
    v11 = 0x3052000000;
    v12 = __Block_byref_object_copy__20;
    v13 = __Block_byref_object_dispose__20;
    v14 = 0;
    v4 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __27__VCStreamInput_invalidate__block_invoke;
    block[3] = &unk_1E9E522B0;
    block[4] = self;
    block[5] = &v9;
    dispatch_sync(streamInputQueue, block);
    v5 = v10[5];
    if (v5)
      dispatch_sync(v5, &__block_literal_global_56);
    v6 = self->_streamInputQueue;
    v7[0] = v4;
    v7[1] = 3221225472;
    v7[2] = __27__VCStreamInput_invalidate__block_invoke_3;
    v7[3] = &unk_1E9E522B0;
    v7[4] = self;
    v7[5] = &v9;
    dispatch_sync(v6, v7);
    _Block_object_dispose(&v9, 8);
  }
}

uint64_t __27__VCStreamInput_invalidate__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 216) = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 40) = *(_QWORD *)(*(_QWORD *)(result + 32) + 208);
  *(_QWORD *)(*(_QWORD *)(result + 32) + 208) = 0;
  return result;
}

void __27__VCStreamInput_invalidate__block_invoke_3(uint64_t a1)
{
  NSObject *v2;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 200) = 0;
  v2 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v2)
  {
    dispatch_release(v2);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = 0;
  }
}

- (opaqueCMFormatDescription)streamFormat
{
  return self->_format;
}

- (BOOL)isEqualFormat:(opaqueCMFormatDescription *)a3
{
  return CMFormatDescriptionEqual(self->_format, a3) == 1;
}

- (NSDictionary)reportingStats
{
  id v3;
  unsigned int v4;
  unint64_t v5;
  __int128 v6;
  CMTime v8;
  CMTime lhs;
  CMTime v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  memset(&v10, 170, sizeof(v10));
  *(_OWORD *)&lhs.value = *(_OWORD *)(&self->_isStarted + 4);
  lhs.epoch = *(_QWORD *)&self->_lastBufferTime.flags;
  *(_OWORD *)&v8.value = *(_OWORD *)((char *)&self->_lastBufferTime.epoch + 4);
  v8.epoch = *(_QWORD *)&self->_lastAveragedTime.flags;
  CMTimeSubtract(&v10, &lhs, &v8);
  lhs = v10;
  if (CMTimeGetSeconds(&lhs) <= 0.0)
  {
    v5 = 0;
  }
  else
  {
    v4 = atomic_load((unsigned int *)&self->_lastAveragedTime.epoch + 1);
    lhs = v10;
    v5 = vcvtad_u64_f64((double)(1000 * v4) / CMTimeGetSeconds(&lhs));
  }
  atomic_store(0, (unsigned int *)&self->_lastAveragedTime.epoch + 1);
  v6 = *(_OWORD *)(&self->_isStarted + 4);
  *(_QWORD *)&self->_lastAveragedTime.flags = *(_QWORD *)&self->_lastBufferTime.flags;
  *(_OWORD *)((char *)&self->_lastBufferTime.epoch + 4) = v6;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", round(*(double *)&self->_sampleBufferCount * 1000000.0)), CFSTR("MediaCaptureJitter"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v5), CFSTR("MediaCaptureBufferRate"));
  return (NSDictionary *)v3;
}

- (BOOL)createRemoteReceiveQueue:(id)a3
{
  double *p_lastTransitTime;
  _BOOL4 v4;
  _QWORD v6[6];

  v6[5] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __42__VCStreamInput_createRemoteReceiveQueue___block_invoke;
    v6[3] = &unk_1E9E53A60;
    v6[4] = self;
    p_lastTransitTime = &self->_lastTransitTime;
    VCRemoteImageQueue_CreateReceiverQueue((uint64_t)a3, (uint64_t)v6, (uint64_t)self->_streamInputQueue, &self->_lastTransitTime);
    if (*(_QWORD *)p_lastTransitTime)
    {
      LOBYTE(v4) = 1;
      return v4;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v4 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v4)
        return v4;
      -[VCStreamInput createRemoteReceiveQueue:].cold.2();
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    v4 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
    if (!v4)
      return v4;
    -[VCStreamInput createRemoteReceiveQueue:].cold.1();
  }
  LOBYTE(v4) = 0;
  return v4;
}

void __42__VCStreamInput_createRemoteReceiveQueue___block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v5;
  opaqueCMSampleBuffer *v6;
  uint64_t v7;
  NSObject *v8;
  CMTime v9;
  CMTime time;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(v5 + 184), "unsignedIntValue");
  if (a2)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __42__VCStreamInput_createRemoteReceiveQueue___block_invoke_cold_3();
    }
  }
  else if (*(_DWORD *)a3 == 3)
  {
    v6 = *(opaqueCMSampleBuffer **)(a3 + 24);
    if (v6)
    {
      memset(&v9, 170, sizeof(v9));
      CMSampleBufferGetPresentationTimeStamp(&v9, v6);
      time = v9;
      CMTimeGetSeconds(&time);
      kdebug_trace();
      (*(void (**)(uint64_t, opaqueCMSampleBuffer *))(v5 + 176))(v5, v6);
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __42__VCStreamInput_createRemoteReceiveQueue___block_invoke_cold_1();
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      __42__VCStreamInput_createRemoteReceiveQueue___block_invoke_cold_2(v7, a3, v8);
  }
}

- (void)didStartStreamInputCaptureSource
{
  NSObject *streamInputQueue;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  streamInputQueue = self->_streamInputQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __49__VCStreamInput_didStartStreamInputCaptureSource__block_invoke;
  v3[3] = &unk_1E9E521C0;
  v3[4] = self;
  dispatch_async(streamInputQueue, v3);
}

void __49__VCStreamInput_didStartStreamInputCaptureSource__block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 216) = 1;
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 208);
  if (v2)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __49__VCStreamInput_didStartStreamInputCaptureSource__block_invoke_2;
    v3[3] = &unk_1E9E521C0;
    v3[4] = v1;
    dispatch_async(v2, v3);
  }
}

uint64_t __49__VCStreamInput_didStartStreamInputCaptureSource__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "didStartStreamInput:");
}

- (void)didStopStreamInputCaptureSource
{
  NSObject *streamInputQueue;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  streamInputQueue = self->_streamInputQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __48__VCStreamInput_didStopStreamInputCaptureSource__block_invoke;
  v3[3] = &unk_1E9E521C0;
  v3[4] = self;
  dispatch_async(streamInputQueue, v3);
}

void __48__VCStreamInput_didStopStreamInputCaptureSource__block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 216) = 0;
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 208);
  if (v2)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __48__VCStreamInput_didStopStreamInputCaptureSource__block_invoke_2;
    v3[3] = &unk_1E9E521C0;
    v3[4] = v1;
    dispatch_async(v2, v3);
  }
}

uint64_t __48__VCStreamInput_didStopStreamInputCaptureSource__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "didStopStreamInput:");
}

- (void)didSuspendStreamInputCaptureSource
{
  NSObject *streamInputQueue;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  streamInputQueue = self->_streamInputQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __51__VCStreamInput_didSuspendStreamInputCaptureSource__block_invoke;
  v3[3] = &unk_1E9E521C0;
  v3[4] = self;
  dispatch_async(streamInputQueue, v3);
}

void __51__VCStreamInput_didSuspendStreamInputCaptureSource__block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 208);
  if (v2)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __51__VCStreamInput_didSuspendStreamInputCaptureSource__block_invoke_2;
    v3[3] = &unk_1E9E521C0;
    v3[4] = v1;
    dispatch_async(v2, v3);
  }
}

uint64_t __51__VCStreamInput_didSuspendStreamInputCaptureSource__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "didSuspendStreamInput:");
}

- (void)didResumeStreamInputCaptureSource
{
  NSObject *streamInputQueue;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  streamInputQueue = self->_streamInputQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __50__VCStreamInput_didResumeStreamInputCaptureSource__block_invoke;
  v3[3] = &unk_1E9E521C0;
  v3[4] = self;
  dispatch_async(streamInputQueue, v3);
}

void __50__VCStreamInput_didResumeStreamInputCaptureSource__block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 208);
  if (v2)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __50__VCStreamInput_didResumeStreamInputCaptureSource__block_invoke_2;
    v3[3] = &unk_1E9E521C0;
    v3[4] = v1;
    dispatch_async(v2, v3);
  }
}

uint64_t __50__VCStreamInput_didResumeStreamInputCaptureSource__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "didResumeStreamInput:");
}

- (NSNumber)streamInputID
{
  return self->_streamInputID;
}

- (void)initWithStreamInputID:format:delegate:delegateQueue:remoteQueue:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Stream input ID is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithStreamInputID:format:delegate:delegateQueue:remoteQueue:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Provided format is NULL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithStreamInputID:format:delegate:delegateQueue:remoteQueue:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Provided delegate is NULL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithStreamInputID:format:delegate:delegateQueue:remoteQueue:.cold.4()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Provided delegate queue is NULL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithStreamInputID:format:delegate:delegateQueue:remoteQueue:.cold.5()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[14];
  const char *v3;
  __int16 v4;
  int v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  v3 = "-[VCStreamInput initWithStreamInputID:format:delegate:delegateQueue:remoteQueue:]";
  v4 = 1024;
  v5 = 62;
  v6 = 2112;
  v7 = v0;
  _os_log_error_impl(&dword_1D8A54000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to create the dispatch queue with queueName=%@", v2, 0x26u);
  OUTLINED_FUNCTION_3();
}

- (void)initWithStreamInputID:format:delegate:delegateQueue:remoteQueue:.cold.6()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to copy the stream input ID", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)createRemoteReceiveQueue:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d xpcClientQueue was null, cannot make the remote queue", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)createRemoteReceiveQueue:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Error making the receiver queue", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __42__VCStreamInput_createRemoteReceiveQueue___block_invoke_cold_1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Received nil sampleBuffer", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __42__VCStreamInput_createRemoteReceiveQueue___block_invoke_cold_2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[22];

  *(_DWORD *)v3 = 136315906;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2080;
  *(_QWORD *)&v3[14] = "_VCStreamInput_RemoteQueueOperationHandler";
  OUTLINED_FUNCTION_5(&dword_1D8A54000, a2, a3, " [%s] %s:%d Received unexpected operation=%d", *(const char **)v3, *(const char **)&v3[8], (unint64_t)"_VCStreamInput_RemoteQueueOperationHandler" >> 16, 183);
  OUTLINED_FUNCTION_3();
}

void __42__VCStreamInput_createRemoteReceiveQueue___block_invoke_cold_3()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "_VCStreamInput_RemoteQueueOperationHandler";
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Error received from the remote Queue=%d", v2, *(const char **)v3, (unint64_t)"_VCStreamInput_RemoteQueueOperationHandler" >> 16, 182);
  OUTLINED_FUNCTION_3();
}

@end
