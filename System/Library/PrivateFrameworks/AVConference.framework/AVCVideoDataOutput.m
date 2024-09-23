@implementation AVCVideoDataOutput

- (AVCVideoDataOutput)initWithStreamToken:(int64_t)a3 delegate:(id)a4 queue:(id)a5 error:(id *)a6
{
  uint64_t v11;
  NSObject *v12;
  const __CFString *v13;
  AVCVideoDataOutput *v14;
  AVCStreamOutput *v15;
  uint64_t v16;
  objc_super v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  int64_t v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  __int16 v31;
  const __CFString *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      if (a6)
        v13 = (const __CFString *)*a6;
      else
        v13 = CFSTR("nil");
      *(_DWORD *)buf = 136316674;
      v20 = v11;
      v21 = 2080;
      v22 = "-[AVCVideoDataOutput initWithStreamToken:delegate:queue:error:]";
      v23 = 1024;
      v24 = 76;
      v25 = 2048;
      v26 = a3;
      v27 = 2112;
      v28 = a4;
      v29 = 2112;
      v30 = a5;
      v31 = 2112;
      v32 = v13;
      _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d streamToken=%ld, delegate=%@, queue=%@, error=%@", buf, 0x44u);
    }
  }
  v18.receiver = self;
  v18.super_class = (Class)AVCVideoDataOutput;
  v14 = -[AVCVideoDataOutput init](&v18, sel_init);
  if (v14)
  {
    VRTraceReset();
    v15 = -[AVCStreamOutput initWithStreamToken:delegate:queue:error:]([AVCStreamOutput alloc], "initWithStreamToken:delegate:queue:error:", a3, v14, a5, a6);
    v14->_streamOutput = v15;
    if (v15)
    {
      objc_storeWeak(&v14->_delegate, a4);
      v14->_streamToken = a3;
      v14->_isValid = 1;
      return v14;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[AVCVideoDataOutput initWithStreamToken:delegate:queue:error:].cold.1();
    }
    v16 = -5;
  }
  else
  {
    v16 = -4;
  }

  if (!a6 || *a6)
    return 0;
  v14 = 0;
  *a6 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("AVCVideoDataOutput"), v16, 0);
  return v14;
}

- (void)dealloc
{
  NSObject *delegateQueue;
  NSObject *internalReceiverQueue;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_storeWeak(&self->_delegate, 0);
  delegateQueue = self->_delegateQueue;
  if (delegateQueue)
  {
    dispatch_release(delegateQueue);
    self->_delegateQueue = 0;
  }
  internalReceiverQueue = self->_internalReceiverQueue;
  if (internalReceiverQueue)
  {
    dispatch_release(internalReceiverQueue);
    self->_internalReceiverQueue = 0;
  }

  v5.receiver = self;
  v5.super_class = (Class)AVCVideoDataOutput;
  -[AVCVideoDataOutput dealloc](&v5, sel_dealloc);
}

- (BOOL)parseVideoAttributes:(opaqueCMSampleBuffer *)a3
{
  const __CFNumber *v5;
  const __CFDictionary *v6;
  const __CFDictionary *v7;
  const __CFDictionary *v8;
  CGSize v9;
  _BOOL4 v10;
  BOOL v11;
  VideoAttributes *v13;
  CGRect v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = (const __CFNumber *)CMGetAttachment(a3, CFSTR("cameraStatusBits"), 0);
  v6 = (const __CFDictionary *)CMGetAttachment(a3, CFSTR("contentsRect"), 0);
  v7 = (const __CFDictionary *)CMGetAttachment(a3, CFSTR("aspectRatio"), 0);
  v8 = v7;
  if (!self->_videoAttributes.videoAttributes)
  {
    if (v5)
      v11 = v6 == 0;
    else
      v11 = 1;
    if (!v11 && v7 != 0)
    {
      v13 = objc_alloc_init(VideoAttributes);
      self->_videoAttributes.videoAttributes = v13;
      if (v13)
      {
LABEL_19:
        LOBYTE(v15.origin.x) = 0;
        CFNumberGetValue(v5, kCFNumberSInt8Type, &v15);
        -[VideoAttributes updateCameraStatusBits:](self->_videoAttributes.videoAttributes, "updateCameraStatusBits:", LOBYTE(v15.origin.x));
        if (!v6)
          goto LABEL_5;
        goto LABEL_4;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        v10 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
        if (!v10)
          return v10;
        -[AVCVideoDataOutput parseVideoAttributes:].cold.1();
      }
    }
    LOBYTE(v10) = 0;
    return v10;
  }
  if (v5)
    goto LABEL_19;
  if (v6)
  {
LABEL_4:
    v9.width = NAN;
    v9.height = NAN;
    v15.origin = (CGPoint)v9;
    v15.size = v9;
    CGRectMakeWithDictionaryRepresentation(v6, &v15);
    -[VideoAttributes setContentsRect:](self->_videoAttributes.videoAttributes, "setContentsRect:", *(_OWORD *)&v15.origin, *(_OWORD *)&v15.size);
  }
LABEL_5:
  if (v8)
  {
    v15.origin.x = NAN;
    v15.origin.y = NAN;
    CGSizeMakeWithDictionaryRepresentation(v8, (CGSize *)&v15);
    -[VideoAttributes setRatio:](self->_videoAttributes.videoAttributes, "setRatio:", *(_OWORD *)&v15.origin);
  }
  -[AVCVideoDataOutputDelegate videoDataOutput:didReceiveFrame:videoAttributes:](-[AVCVideoDataOutput delegate](self, "delegate"), "videoDataOutput:didReceiveFrame:videoAttributes:", self, a3, self->_videoAttributes.videoAttributes);
  LOBYTE(v10) = 1;
  return v10;
}

- (AVCVideoDataOutputDelegate)delegate
{
  return (AVCVideoDataOutputDelegate *)objc_loadWeak(&self->_delegate);
}

- (void)streamOutput:(id)a3 didReceiveSampleBuffer:(opaqueCMSampleBuffer *)a4
{
  if (-[AVCVideoDataOutput parseVideoAttributes:](self, "parseVideoAttributes:", a4))
    -[AVCVideoDataOutputDelegate videoDataOutput:didReceiveFrame:videoAttributes:](-[AVCVideoDataOutput delegate](self, "delegate"), "videoDataOutput:didReceiveFrame:videoAttributes:", self, a4, self->_videoAttributes.videoAttributes);
}

- (void)streamOutputServerDidDie:(id)a3
{
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[AVCVideoDataOutput streamOutputServerDidDie:].cold.1();
  }
  -[AVCVideoDataOutputDelegate videoDataOutputServerDidDie:](-[AVCVideoDataOutput delegate](self, "delegate"), "videoDataOutputServerDidDie:", self);
}

- (void)streamOutputDidBecomeInvalid:(id)a3
{
  self->_isValid = 0;
  -[AVCVideoDataOutputDelegate videoDataOutputDidBecomeInvalid:](-[AVCVideoDataOutput delegate](self, "delegate", a3), "videoDataOutputDidBecomeInvalid:", self);
}

- (void)streamOutput:(id)a3 didPause:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v6;
  NSObject *v7;
  int64_t streamToken;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  _BOOL4 v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v4 = a4;
  v19 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      streamToken = self->_streamToken;
      v9 = 136316162;
      v10 = v6;
      v11 = 2080;
      v12 = "-[AVCVideoDataOutput streamOutput:didPause:]";
      v13 = 1024;
      v14 = 184;
      v15 = 1024;
      v16 = v4;
      v17 = 1024;
      v18 = streamToken;
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCVideoDataOutput callback: didPause=%d for streamToken=%u", (uint8_t *)&v9, 0x28u);
    }
  }
  self->_isVideoPaused = v4;
  -[AVCVideoDataOutput delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[AVCVideoDataOutputDelegate videoDataOutput:videoDidPause:](-[AVCVideoDataOutput delegate](self, "delegate"), "videoDataOutput:videoDidPause:", self, v4);
}

- (void)streamOutput:(id)a3 didStall:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v6;
  NSObject *v7;
  int64_t streamToken;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  _BOOL4 v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v4 = a4;
  v19 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      streamToken = self->_streamToken;
      v9 = 136316162;
      v10 = v6;
      v11 = 2080;
      v12 = "-[AVCVideoDataOutput streamOutput:didStall:]";
      v13 = 1024;
      v14 = 193;
      v15 = 1024;
      v16 = v4;
      v17 = 1024;
      v18 = streamToken;
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCVideoDataOutput callback: mediaDidStall=%d for streamToken=%u", (uint8_t *)&v9, 0x28u);
    }
  }
  self->_isMediaStalled = v4;
  -[AVCVideoDataOutput delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[AVCVideoDataOutputDelegate videoDataOutput:mediaDidStall:](-[AVCVideoDataOutput delegate](self, "delegate"), "videoDataOutput:mediaDidStall:", self, v4);
}

- (void)streamOutput:(id)a3 didDegrade:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v6;
  NSObject *v7;
  int64_t streamToken;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  _BOOL4 v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v4 = a4;
  v19 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      streamToken = self->_streamToken;
      v9 = 136316162;
      v10 = v6;
      v11 = 2080;
      v12 = "-[AVCVideoDataOutput streamOutput:didDegrade:]";
      v13 = 1024;
      v14 = 202;
      v15 = 1024;
      v16 = v4;
      v17 = 1024;
      v18 = streamToken;
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCVideoDataOutput callback: videoDidDegrade=%d for streamToken=%u", (uint8_t *)&v9, 0x28u);
    }
  }
  self->_isVideoDegraded = v4;
  -[AVCVideoDataOutput delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[AVCVideoDataOutputDelegate videoDataOutput:videoDidDegrade:](-[AVCVideoDataOutput delegate](self, "delegate"), "videoDataOutput:videoDidDegrade:", self, v4);
}

- (void)streamOutput:(id)a3 didSuspend:(BOOL)a4
{
  _BOOL8 v4;

  v4 = a4;
  self->_isVideoSuspended = a4;
  -[AVCVideoDataOutput delegate](self, "delegate", a3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[AVCVideoDataOutputDelegate videoDataOutput:videoDidSuspend:](-[AVCVideoDataOutput delegate](self, "delegate"), "videoDataOutput:videoDidSuspend:", self, v4);
}

- (void)setDelegate:(id)a3
{
  self->_delegate = a3;
}

- (int64_t)streamToken
{
  return self->_streamToken;
}

- (BOOL)isValid
{
  return self->_isValid;
}

- (void)setIsValid:(BOOL)a3
{
  self->_isValid = a3;
}

- (BOOL)isVideoDegraded
{
  return self->_isVideoDegraded;
}

- (void)setIsVideoDegraded:(BOOL)a3
{
  self->_isVideoDegraded = a3;
}

- (BOOL)isVideoSuspended
{
  return self->_isVideoSuspended;
}

- (void)setIsVideoSuspended:(BOOL)a3
{
  self->_isVideoSuspended = a3;
}

- (BOOL)isMediaStalled
{
  return self->_isMediaStalled;
}

- (void)setIsMediaStalled:(BOOL)a3
{
  self->_isMediaStalled = a3;
}

- (BOOL)isVideoPaused
{
  return self->_isVideoPaused;
}

- (void)setIsVideoPaused:(BOOL)a3
{
  self->_isVideoPaused = a3;
}

- ($47CAAF96BE7E845C10CADA1F045B7D66)videoAttributes
{
  return ($47CAAF96BE7E845C10CADA1F045B7D66)self->_videoAttributes.videoAttributes;
}

- (void)setVideoAttributes:(id)a3
{
  self->_videoAttributes.videoAttributes = (VideoAttributes *)a3.var0;
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (OS_dispatch_queue)internalReceiverQueue
{
  return self->_internalReceiverQueue;
}

- (void)setInternalReceiverQueue:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (void)initWithStreamToken:delegate:queue:error:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate stream output", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)parseVideoAttributes:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate video attributes", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)streamOutputServerDidDie:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d AVCVideoDataOutput: serverd died, notifying client", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
