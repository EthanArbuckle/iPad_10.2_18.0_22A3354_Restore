@implementation VCStreamInputVideo

- (VCStreamInputVideo)initWithStreamInputID:(id)a3 format:(opaqueCMFormatDescription *)a4 delegate:(id)a5 delegateQueue:(id)a6 remoteQueue:(id)a7
{
  VCStreamInputVideo *v7;
  VCStreamInputVideo *v8;
  VCVideoCapture *v9;
  const __CFString *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  objc_super v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  const __CFString *v23;
  __int16 v24;
  VCStreamInputVideo *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)VCStreamInputVideo;
  v7 = -[VCStreamInput initWithStreamInputID:format:delegate:delegateQueue:remoteQueue:](&v15, sel_initWithStreamInputID_format_delegate_delegateQueue_remoteQueue_, a3, a4, a5, a6, a7);
  v8 = v7;
  if (v7)
  {
    v7->super._sampleBufferHandler = _VCStreamInputVideo_SampleBufferHandler;
    v14 = 0;
    v9 = -[VCVideoCapture initWithCaptureServer:protocolFunctions:]([VCVideoCapture alloc], "initWithCaptureServer:protocolFunctions:", 0, &v14);
    v8->super._receiverQueue = (opaqueVCRemoteImageQueue *)v9;
    if (v9)
    {
      if ((objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "registerStreamInput:", v8) & 1) != 0)return v8;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCStreamInputVideo initWithStreamInputID:format:delegate:delegateQueue:remoteQueue:].cold.2();
      }
    }
    else if ((VCStreamInputVideo *)objc_opt_class() == v8)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCStreamInputVideo initWithStreamInputID:format:delegate:delegateQueue:remoteQueue:].cold.1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v11 = (const __CFString *)-[VCStreamInputVideo performSelector:](v8, "performSelector:", sel_logPrefix);
      else
        v11 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v12 = VRTraceErrorLogLevelToCSTR();
        v13 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          v17 = v12;
          v18 = 2080;
          v19 = "-[VCStreamInputVideo initWithStreamInputID:format:delegate:delegateQueue:remoteQueue:]";
          v20 = 1024;
          v21 = 56;
          v22 = 2112;
          v23 = v11;
          v24 = 2048;
          v25 = v8;
          _os_log_error_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to allocate the VCVideoCapture", buf, 0x30u);
        }
      }
    }
    -[VCStreamInputVideo invalidate](v8, "invalidate");

    return 0;
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)VCStreamInputVideo;
  -[VCStreamInput dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "unregisterStreamInput:", self);
  v3.receiver = self;
  v3.super_class = (Class)VCStreamInputVideo;
  -[VCStreamInput invalidate](&v3, sel_invalidate);
}

- (unsigned)addSink:(id)a3
{
  NSObject *streamInputQueue;
  unsigned int v4;
  _QWORD v6[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  streamInputQueue = self->super._streamInputQueue;
  if (streamInputQueue)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __30__VCStreamInputVideo_addSink___block_invoke;
    v6[3] = &unk_1E9E527A8;
    v6[5] = a3;
    v6[6] = &v7;
    v6[4] = self;
    dispatch_sync(streamInputQueue, v6);
    v4 = *((_DWORD *)v8 + 6);
  }
  else
  {
    v4 = 0;
  }
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __30__VCStreamInputVideo_addSink___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1[4] + 296), "addSink:", a1[5]);
  *(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = result;
  return result;
}

- (unsigned)removeSink:(id)a3
{
  NSObject *streamInputQueue;
  unsigned int v4;
  _QWORD v6[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  streamInputQueue = self->super._streamInputQueue;
  if (streamInputQueue)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __33__VCStreamInputVideo_removeSink___block_invoke;
    v6[3] = &unk_1E9E527A8;
    v6[5] = a3;
    v6[6] = &v7;
    v6[4] = self;
    dispatch_sync(streamInputQueue, v6);
    v4 = *((_DWORD *)v8 + 6);
  }
  else
  {
    v4 = 0;
  }
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __33__VCStreamInputVideo_removeSink___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1[4] + 296), "removeSink:", a1[5]);
  *(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = result;
  return result;
}

- (void)initWithStreamInputID:format:delegate:delegateQueue:remoteQueue:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate the VCVideoCapture", v2, v3, v4, v5, 2u);
}

- (void)initWithStreamInputID:format:delegate:delegateQueue:remoteQueue:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to register with capture server", v2, v3, v4, v5, 2u);
}

@end
