@implementation VCMovieWriter

- (VCMovieWriter)initWithOutputURL:(id)a3 transactionID:(id)a4 videoCodec:(unsigned int)a5 keyFrameIntervalDuration:(double)a6
{
  char *v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  const __CFAllocator *v14;
  const CMBufferCallbacks *CallbacksForSampleBuffersSortedByOutputPTS;
  const CMBufferCallbacks *v16;
  const CMBufferCallbacks *v17;
  NSObject *CustomRootQueue;
  __int128 v20;
  objc_super v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v21.receiver = self;
  v21.super_class = (Class)VCMovieWriter;
  v10 = -[VCObject init](&v21, sel_init);
  if (v10)
  {
    *((_QWORD *)v10 + 43) = objc_msgSend(a3, "copy");
    *((_QWORD *)v10 + 21) = objc_msgSend(a4, "copy");
    v11 = MEMORY[0x1E0CA2E18];
    v12 = *MEMORY[0x1E0CA2E18];
    *((_OWORD *)v10 + 11) = *MEMORY[0x1E0CA2E18];
    v13 = *(_QWORD *)(v11 + 16);
    *((_QWORD *)v10 + 24) = v13;
    *(_OWORD *)(v10 + 200) = v12;
    *((_QWORD *)v10 + 27) = v13;
    *((_OWORD *)v10 + 14) = v12;
    *((_QWORD *)v10 + 30) = v13;
    *((_OWORD *)v10 + 17) = v12;
    v20 = v12;
    *((_QWORD *)v10 + 36) = v13;
    v10[352] = 2;
    *((_DWORD *)v10 + 89) = 0;
    *((_DWORD *)v10 + 90) = 0;
    *((_DWORD *)v10 + 111) = 0;
    *(_OWORD *)(v10 + 248) = v12;
    *((_QWORD *)v10 + 33) = v13;
    v14 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    CallbacksForSampleBuffersSortedByOutputPTS = CMBufferQueueGetCallbacksForSampleBuffersSortedByOutputPTS();
    CMBufferQueueCreate(v14, 0, CallbacksForSampleBuffersSortedByOutputPTS, (CMBufferQueueRef *)v10 + 46);
    v16 = CMBufferQueueGetCallbacksForSampleBuffersSortedByOutputPTS();
    CMBufferQueueCreate(v14, 0, v16, (CMBufferQueueRef *)v10 + 47);
    v17 = CMBufferQueueGetCallbacksForSampleBuffersSortedByOutputPTS();
    CMBufferQueueCreate(v14, 0, v17, (CMBufferQueueRef *)v10 + 48);
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
    *((_QWORD *)v10 + 49) = dispatch_queue_create_with_target_V2("com.apple.AVConference.VCMovieWriter.serializationQueue", 0, CustomRootQueue);
    *((_DWORD *)v10 + 110) = a5;
    *((double *)v10 + 57) = a6;
    *((_QWORD *)v10 + 61) = v13;
    *(_OWORD *)(v10 + 472) = v20;
  }
  return (VCMovieWriter *)v10;
}

- (void)dealloc
{
  opaqueCMBufferQueue *videoQueue;
  opaqueCMBufferQueue *localAudioQueue;
  opaqueCMBufferQueue *remoteAudioQueue;
  OpaqueVTPixelTransferSession *transferSession;
  OpaqueVTPixelTransferSession *v7;
  __CVPixelBufferPool *bufferPool;
  NSObject *serializationQueue;
  objc_super v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];

  -[VCMovieWriter cleanupAssetWriter](self, "cleanupAssetWriter");
  videoQueue = self->_videoQueue;
  if (videoQueue)
    CFRelease(videoQueue);
  localAudioQueue = self->_localAudioQueue;
  if (localAudioQueue)
    CFRelease(localAudioQueue);
  remoteAudioQueue = self->_remoteAudioQueue;
  if (remoteAudioQueue)
    CFRelease(remoteAudioQueue);
  _Block_release(self->_completionHandler);
  transferSession = self->_transferSession;
  if (transferSession)
  {
    VTPixelTransferSessionInvalidate(transferSession);
    v7 = self->_transferSession;
    if (v7)
    {
      CFRelease(v7);
      self->_transferSession = 0;
    }
  }
  bufferPool = self->_bufferPool;
  if (bufferPool)
  {
    CVPixelBufferPoolRelease(bufferPool);
    self->_bufferPool = 0;
  }
  serializationQueue = self->_serializationQueue;
  if (serializationQueue)
  {
    dispatch_release(serializationQueue);
    self->_serializationQueue = 0;
  }
  v10.receiver = self;
  v10.super_class = (Class)VCMovieWriter;
  -[VCObject dealloc](&v10, sel_dealloc);
}

- (void)setupWriterWithMode:(unsigned __int8)a3
{
  self->_writerMode = a3;
}

- (void)setupVisibleRect:(CGRect)a3 withCaptureHeight:(int)a4
{
  __CVPixelBufferPool **p_bufferPool;

  if (self->_transferSession || (p_bufferPool = &self->_bufferPool, self->_bufferPool))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMovieWriter setupVisibleRect:withCaptureHeight:].cold.1();
    }
  }
  else
  {
    self->_visibleWidth = a3.size.width * (double)a4 / a3.size.height;
    self->_visibleHeight = (double)a4;
    self->_visibleWidth = (double)(int)((int)self->_visibleWidth & 0xFFFFFFFC);
    self->_visibleHeight = (double)(int)((int)self->_visibleHeight & 0xFFFFFFFC);
    self->_transferSession = (OpaqueVTPixelTransferSession *)VCMediaRecorderUtil_AllocTransferSession();
    VCMediaRecorderUtil_SetupBufferPool(CFSTR("AVConference:MovieWriter"), p_bufferPool, self->_visibleWidth, self->_visibleHeight);
  }
}

- (void)appendVideoSampleBuffer:(opaqueCMSampleBuffer *)a3 cameraStatus:(unsigned __int8)a4 mediaType:(unsigned __int8)a5
{
  int v5;
  int v6;
  double visibleWidth;
  double Height;
  __CVBuffer *ImageBuffer;
  __CVBuffer *v12;
  __CVBuffer *v13;
  size_t Width;
  size_t v15;
  __CVBuffer *ResizeFrame;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  Float64 Seconds;
  size_t v21;
  size_t v22;
  CMSampleBufferRef SampleBufferWithPixelBuffer;
  OSStatus v24;
  Float64 v25;
  size_t v26;
  size_t v27;
  CMTime v28;
  CMTime v29;
  CMTime time;
  int v31;
  __int16 v32;
  int v33;
  __int16 v34;
  int v35;
  __int16 v36;
  size_t v37;
  __int16 v38;
  size_t v39;
  __int16 v40;
  Float64 v41;
  __int16 v42;
  size_t v43;
  __int16 v44;
  size_t v45;
  uint64_t v46;

  v5 = a5;
  v6 = a4;
  v46 = *MEMORY[0x1E0C80C00];
  if (CMBufferQueueContainsEndOfData(self->_videoQueue))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMovieWriter appendVideoSampleBuffer:cameraStatus:mediaType:].cold.4();
    }
  }
  else
  {
    if (self->_assetWriter || VCMediaWriterUtil_IsAudioOnly(self->_writerMode))
      goto LABEL_10;
    if (VCDefaults_GetManagedBoolValueForKey(CFSTR("enableLocalVideoRecording"), 0))
    {
      visibleWidth = self->_visibleWidth;
      if (visibleWidth == 0.0 || (Height = self->_visibleHeight, Height == 0.0))
      {
        ImageBuffer = CMSampleBufferGetImageBuffer(a3);
        self->_visibleWidth = (double)CVPixelBufferGetWidth(ImageBuffer);
        v12 = CMSampleBufferGetImageBuffer(a3);
        Height = (double)CVPixelBufferGetHeight(v12);
        self->_visibleHeight = Height;
        visibleWidth = self->_visibleWidth;
      }
      -[VCMovieWriter setupVisibleRect:withCaptureHeight:](self, "setupVisibleRect:withCaptureHeight:", (int)Height, 0.0, 0.0, visibleWidth);
      CMSampleBufferGetPresentationTimeStamp(&v29, a3);
      -[VCMovieWriter setStillImageTime:](self, "setStillImageTime:", &v29);
    }
    if (!-[VCMovieWriter setupAssetWriterWithWidth:height:transactionID:](self, "setupAssetWriterWithWidth:height:transactionID:", (int)self->_visibleWidth, (int)self->_visibleHeight, self->_transactionID))
    {
LABEL_10:
      v13 = CMSampleBufferGetImageBuffer(a3);
      memset(&v28, 170, sizeof(v28));
      CMSampleBufferGetPresentationTimeStamp(&v28, a3);
      Width = CVPixelBufferGetWidth(v13);
      v15 = CVPixelBufferGetHeight(v13);
      ResizeFrame = VCMediaRecorderUtil_CreateResizeFrame(v13, self->_transferSession, self->_bufferPool);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
      {
        v17 = VRTraceErrorLogLevelToCSTR();
        v18 = *MEMORY[0x1E0CF2758];
        v19 = *MEMORY[0x1E0CF2758];
        if (*MEMORY[0x1E0CF2748])
        {
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            time = v28;
            Seconds = CMTimeGetSeconds(&time);
            v21 = CVPixelBufferGetWidth(ResizeFrame);
            v22 = CVPixelBufferGetHeight(ResizeFrame);
            LODWORD(time.value) = 136317442;
            *(CMTimeValue *)((char *)&time.value + 4) = v17;
            LOWORD(time.flags) = 2080;
            *(_QWORD *)((char *)&time.flags + 2) = "-[VCMovieWriter appendVideoSampleBuffer:cameraStatus:mediaType:]";
            HIWORD(time.epoch) = 1024;
            v31 = 172;
            v32 = 1024;
            v33 = v6;
            v34 = 1024;
            v35 = v5;
            v36 = 2048;
            v37 = Width;
            v38 = 2048;
            v39 = v15;
            v40 = 2048;
            v41 = Seconds;
            v42 = 2048;
            v43 = v21;
            v44 = 2048;
            v45 = v22;
            _os_log_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d cameraStatus=0x%02x, type=%d, originalWidth=%lu, originalHeight=%lu, presentationTime=%f, width=%lu, height=%lu", (uint8_t *)&time, 0x5Au);
            if (!ResizeFrame)
            {
LABEL_24:
              if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
              {
                VRTraceErrorLogLevelToCSTR();
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                  -[VCMovieWriter appendVideoSampleBuffer:cameraStatus:mediaType:].cold.1();
              }
              return;
            }
            goto LABEL_17;
          }
        }
        else if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          time = v28;
          v25 = CMTimeGetSeconds(&time);
          v26 = CVPixelBufferGetWidth(ResizeFrame);
          v27 = CVPixelBufferGetHeight(ResizeFrame);
          LODWORD(time.value) = 136317442;
          *(CMTimeValue *)((char *)&time.value + 4) = v17;
          LOWORD(time.flags) = 2080;
          *(_QWORD *)((char *)&time.flags + 2) = "-[VCMovieWriter appendVideoSampleBuffer:cameraStatus:mediaType:]";
          HIWORD(time.epoch) = 1024;
          v31 = 172;
          v32 = 1024;
          v33 = v6;
          v34 = 1024;
          v35 = v5;
          v36 = 2048;
          v37 = Width;
          v38 = 2048;
          v39 = v15;
          v40 = 2048;
          v41 = v25;
          v42 = 2048;
          v43 = v26;
          v44 = 2048;
          v45 = v27;
          _os_log_debug_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_DEBUG, " [%s] %s:%d cameraStatus=0x%02x, type=%d, originalWidth=%lu, originalHeight=%lu, presentationTime=%f, width=%lu, height=%lu", (uint8_t *)&time, 0x5Au);
          if (!ResizeFrame)
            goto LABEL_24;
          goto LABEL_17;
        }
      }
      if (!ResizeFrame)
        goto LABEL_24;
LABEL_17:
      time = v28;
      SampleBufferWithPixelBuffer = createSampleBufferWithPixelBuffer(ResizeFrame, (__int128 *)&time.value);
      v24 = CMBufferQueueEnqueue(self->_videoQueue, SampleBufferWithPixelBuffer);
      FigSampleBufferRelease();
      if (v24)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCMovieWriter appendVideoSampleBuffer:cameraStatus:mediaType:].cold.2();
        }
      }
      CVPixelBufferRelease(ResizeFrame);
      return;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMovieWriter appendVideoSampleBuffer:cameraStatus:mediaType:].cold.3();
    }
  }
}

- (void)appendAudioSampleBuffer:(opaqueCMSampleBuffer *)a3 mediaType:(unsigned __int8)a4
{
  int *v6;
  uint64_t v7;
  opaqueCMBufferQueue *v8;

  if (a4 == 1)
  {
    v6 = &OBJC_IVAR___VCMovieWriter__localAudioQueue;
  }
  else
  {
    if (a4 != 2)
      goto LABEL_10;
    v6 = &OBJC_IVAR___VCMovieWriter__remoteAudioQueue;
  }
  v7 = *v6;
  v8 = *(Class *)((char *)&self->super.super.isa + v7);
  if (v8)
  {
    if (CMBufferQueueContainsEndOfData(*(CMBufferQueueRef *)((char *)&self->super.super.isa + v7)))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCMovieWriter appendAudioSampleBuffer:mediaType:].cold.3();
      }
    }
    else
    {
      if (!self->_assetWriter && VCMediaWriterUtil_IsAudioOnly(self->_writerMode))
        -[VCMovieWriter setupAudioAssetWriterWithTransactionID:](self, "setupAudioAssetWriterWithTransactionID:", self->_transactionID);
      if (CMBufferQueueEnqueue(v8, a3))
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCMovieWriter appendAudioSampleBuffer:mediaType:].cold.2();
        }
      }
    }
    return;
  }
LABEL_10:
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCMovieWriter appendAudioSampleBuffer:mediaType:].cold.1();
  }
}

- (void)setEndRTPTimestampWithTimestamp:(unsigned int)a3
{
  self->_endRTPTimeStamp = a3;
  self->_isEndRTPTimestampSet = 1;
}

- (BOOL)shouldAppendSampleBuffer:(opaqueCMSampleBuffer *)a3 RTPtimeStamp:(unsigned int)a4 mediaType:(unsigned __int8)a5
{
  _BOOL4 IsMediaExpected;
  unsigned int mediaState;
  double Seconds;
  double v11;
  unsigned int startRTPTimeStamp;
  _BOOL4 v13;
  CMTime v16;
  CMTime v17;
  CMTime time;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  IsMediaExpected = VCMediaWriterUtil_IsMediaExpected(a5, self->_writerMode);
  if (IsMediaExpected)
  {
    if (self->_writerMode - 2 > 2)
    {
      if ((self->_startTime.flags & 1) == 0)
      {
        time = (CMTime)self->_stillImageTime;
        Seconds = CMTimeGetSeconds(&time);
        CMSampleBufferGetPresentationTimeStamp(&v17, a3);
        if (Seconds - CMTimeGetSeconds(&v17) <= 1.0)
        {
LABEL_10:
          LOBYTE(IsMediaExpected) = 1;
          return IsMediaExpected;
        }
      }
      CMSampleBufferGetPresentationTimeStamp(&v16, a3);
      v11 = CMTimeGetSeconds(&v16);
      time = (CMTime)self->_startTime;
      LOBYTE(IsMediaExpected) = v11 - CMTimeGetSeconds(&time) < 3.0;
    }
    else
    {
      mediaState = self->_mediaState;
      if (mediaState - 1 < 2)
      {
        if (self->_isEndRTPTimestampSet && self->_endRTPTimeStamp < a4)
        {
LABEL_20:
          LOBYTE(IsMediaExpected) = 0;
          return IsMediaExpected;
        }
        goto LABEL_10;
      }
      if (mediaState)
        goto LABEL_20;
      startRTPTimeStamp = self->_startRTPTimeStamp;
      v13 = a4 - startRTPTimeStamp < 0x7FFFFFFF && a4 < startRTPTimeStamp;
      if (a4 <= startRTPTimeStamp && !v13)
        goto LABEL_20;
      LOBYTE(IsMediaExpected) = 1;
      self->_mediaState = 1;
    }
  }
  return IsMediaExpected;
}

- (BOOL)shouldFinishWritingSampleBuffer:(opaqueCMSampleBuffer *)a3 RTPtimeStamp:(unsigned int)a4 mediaType:(unsigned __int8)a5
{
  _BOOL4 IsMediaExpected;
  unsigned int endRTPTimeStamp;
  BOOL v10;
  unsigned int v11;
  const __CFString *v13;
  double Seconds;
  $95D729B680665BEAEFA1D6FCA8238556 *p_startTime;
  const __CFString *v16;
  uint64_t v17;
  NSObject *v18;
  _BOOL4 v19;
  const char *v20;
  NSObject *v21;
  uint32_t v22;
  uint64_t v23;
  NSObject *v24;
  _BOOL4 v25;
  uint64_t v26;
  NSObject *v27;
  Float64 v28;
  Float64 v29;
  const char *v30;
  NSObject *v31;
  uint32_t v32;
  uint64_t v33;
  NSObject *v34;
  Float64 v35;
  Float64 v36;
  CMTime time;
  CMTime startTime;
  int v40;
  __int16 v41;
  Float64 v42;
  __int16 v43;
  Float64 v44;
  __int16 v45;
  Float64 v46;
  __int16 v47;
  Float64 v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  IsMediaExpected = VCMediaWriterUtil_IsMediaExpected(a5, self->_writerMode);
  if (IsMediaExpected)
  {
    if (self->_writerMode - 2 <= 2)
    {
      if (self->_mediaState == 1 && self->_isEndRTPTimestampSet)
      {
        endRTPTimeStamp = self->_endRTPTimeStamp;
        v10 = a4 >= endRTPTimeStamp;
        v11 = a4 - endRTPTimeStamp;
        if (v11 != 0 && v10)
          goto LABEL_38;
        if (!v10 && v11 < 0x7FFFFFFF)
          goto LABEL_38;
      }
      goto LABEL_28;
    }
    if (!a3)
      goto LABEL_28;
    if (CMBufferQueueContainsEndOfData(self->_videoQueue))
    {
      if ((VCMovieWriter *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 7)
          goto LABEL_28;
        v17 = VRTraceErrorLogLevelToCSTR();
        v18 = *MEMORY[0x1E0CF2758];
        v19 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT);
        LOBYTE(IsMediaExpected) = 0;
        if (!v19)
          return IsMediaExpected;
        LODWORD(startTime.value) = 136315650;
        *(CMTimeValue *)((char *)&startTime.value + 4) = v17;
        LOWORD(startTime.flags) = 2080;
        *(_QWORD *)((char *)&startTime.flags + 2) = "-[VCMovieWriter shouldFinishWritingSampleBuffer:RTPtimeStamp:mediaType:]";
        HIWORD(startTime.epoch) = 1024;
        v40 = 265;
        v20 = " [%s] %s:%d finishWritingWithHandler was executed, return NO";
        v21 = v18;
        v22 = 28;
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v13 = (const __CFString *)-[VCMovieWriter performSelector:](self, "performSelector:", sel_logPrefix);
        else
          v13 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 7)
          goto LABEL_28;
        v23 = VRTraceErrorLogLevelToCSTR();
        v24 = *MEMORY[0x1E0CF2758];
        v25 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT);
        LOBYTE(IsMediaExpected) = 0;
        if (!v25)
          return IsMediaExpected;
        LODWORD(startTime.value) = 136316162;
        *(CMTimeValue *)((char *)&startTime.value + 4) = v23;
        LOWORD(startTime.flags) = 2080;
        *(_QWORD *)((char *)&startTime.flags + 2) = "-[VCMovieWriter shouldFinishWritingSampleBuffer:RTPtimeStamp:mediaType:]";
        HIWORD(startTime.epoch) = 1024;
        v40 = 265;
        v41 = 2112;
        v42 = *(double *)&v13;
        v43 = 2048;
        v44 = *(double *)&self;
        v20 = " [%s] %s:%d %@(%p) finishWritingWithHandler was executed, return NO";
        v21 = v24;
        v22 = 48;
      }
      _os_log_impl(&dword_1D8A54000, v21, OS_LOG_TYPE_DEFAULT, v20, (uint8_t *)&startTime, v22);
      goto LABEL_28;
    }
    CMSampleBufferGetPresentationTimeStamp(&time, a3);
    Seconds = CMTimeGetSeconds(&time);
    p_startTime = &self->_startTime;
    startTime = (CMTime)self->_startTime;
    if (Seconds - CMTimeGetSeconds(&startTime) <= 3.0)
    {
LABEL_28:
      LOBYTE(IsMediaExpected) = 0;
      return IsMediaExpected;
    }
    if ((VCMovieWriter *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_38;
      v26 = VRTraceErrorLogLevelToCSTR();
      v27 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_38;
      startTime = (CMTime)self->_stillImageTime;
      v28 = CMTimeGetSeconds(&startTime);
      *(_OWORD *)&startTime.value = *(_OWORD *)&p_startTime->value;
      startTime.epoch = self->_startTime.epoch;
      v29 = CMTimeGetSeconds(&startTime);
      LODWORD(startTime.value) = 136316162;
      *(CMTimeValue *)((char *)&startTime.value + 4) = v26;
      LOWORD(startTime.flags) = 2080;
      *(_QWORD *)((char *)&startTime.flags + 2) = "-[VCMovieWriter shouldFinishWritingSampleBuffer:RTPtimeStamp:mediaType:]";
      HIWORD(startTime.epoch) = 1024;
      v40 = 269;
      v41 = 2048;
      v42 = v28;
      v43 = 2048;
      v44 = v29;
      v30 = " [%s] %s:%d PresentationTime=%f, startTime=%f";
      v31 = v27;
      v32 = 48;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v16 = (const __CFString *)-[VCMovieWriter performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v16 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_38;
      v33 = VRTraceErrorLogLevelToCSTR();
      v34 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_38;
      startTime = (CMTime)self->_stillImageTime;
      v35 = CMTimeGetSeconds(&startTime);
      *(_OWORD *)&startTime.value = *(_OWORD *)&p_startTime->value;
      startTime.epoch = self->_startTime.epoch;
      v36 = CMTimeGetSeconds(&startTime);
      LODWORD(startTime.value) = 136316674;
      *(CMTimeValue *)((char *)&startTime.value + 4) = v33;
      LOWORD(startTime.flags) = 2080;
      *(_QWORD *)((char *)&startTime.flags + 2) = "-[VCMovieWriter shouldFinishWritingSampleBuffer:RTPtimeStamp:mediaType:]";
      HIWORD(startTime.epoch) = 1024;
      v40 = 269;
      v41 = 2112;
      v42 = *(double *)&v16;
      v43 = 2048;
      v44 = *(double *)&self;
      v45 = 2048;
      v46 = v35;
      v47 = 2048;
      v48 = v36;
      v30 = " [%s] %s:%d %@(%p) PresentationTime=%f, startTime=%f";
      v31 = v34;
      v32 = 68;
    }
    _os_log_impl(&dword_1D8A54000, v31, OS_LOG_TYPE_DEFAULT, v30, (uint8_t *)&startTime, v32);
LABEL_38:
    LOBYTE(IsMediaExpected) = 1;
  }
  return IsMediaExpected;
}

- (void)setStillImageTime:(id *)a3
{
  $95D729B680665BEAEFA1D6FCA8238556 *p_stillImageTime;
  int64_t var3;
  uint64_t v5;
  NSObject *v6;
  Float64 Seconds;
  $95D729B680665BEAEFA1D6FCA8238556 v8;
  int v9;
  __int16 v10;
  Float64 v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  p_stillImageTime = &self->_stillImageTime;
  var3 = a3->var3;
  *(_OWORD *)&self->_stillImageTime.value = *(_OWORD *)&a3->var0;
  self->_stillImageTime.epoch = var3;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v8 = *p_stillImageTime;
      Seconds = CMTimeGetSeconds((CMTime *)&v8);
      LODWORD(v8.value) = 136315906;
      *(int64_t *)((char *)&v8.value + 4) = v5;
      LOWORD(v8.flags) = 2080;
      *(_QWORD *)((char *)&v8.flags + 2) = "-[VCMovieWriter setStillImageTime:]";
      HIWORD(v8.epoch) = 1024;
      v9 = 278;
      v10 = 2048;
      v11 = Seconds;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d _stillImageTime=%f", (uint8_t *)&v8, 0x26u);
    }
  }
}

- (void)finishWritingWithHandler:(id)a3
{
  AVAssetWriterStatus v5;
  const __CFString *v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  NSObject *v13;
  id completionHandler;
  NSError *v15;
  const __CFString *v16;
  uint64_t v17;
  NSObject *v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  uint64_t v22;
  NSObject *v23;
  _BYTE v24[24];
  __int128 v25;
  VCMovieWriter *v26;
  _BYTE v27[24];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = -[AVAssetWriter status](self->_assetWriter, "status");
  if ((VCMovieWriter *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v24 = 136315906;
        *(_QWORD *)&v24[4] = v7;
        *(_WORD *)&v24[12] = 2080;
        *(_QWORD *)&v24[14] = "-[VCMovieWriter finishWritingWithHandler:]";
        *(_WORD *)&v24[22] = 1024;
        LODWORD(v25) = 283;
        WORD2(v25) = 2048;
        *(_QWORD *)((char *)&v25 + 6) = v5;
        v9 = " [%s] %s:%d _assetWriter.status=%ld";
        v10 = v8;
        v11 = 38;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, v9, v24, v11);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = (const __CFString *)-[VCMovieWriter performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v6 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v24 = 136316418;
        *(_QWORD *)&v24[4] = v12;
        *(_WORD *)&v24[12] = 2080;
        *(_QWORD *)&v24[14] = "-[VCMovieWriter finishWritingWithHandler:]";
        *(_WORD *)&v24[22] = 1024;
        LODWORD(v25) = 283;
        WORD2(v25) = 2112;
        *(_QWORD *)((char *)&v25 + 6) = v6;
        HIWORD(v25) = 2048;
        v26 = self;
        *(_WORD *)v27 = 2048;
        *(_QWORD *)&v27[2] = v5;
        v9 = " [%s] %s:%d %@(%p) _assetWriter.status=%ld";
        v10 = v13;
        v11 = 58;
        goto LABEL_11;
      }
    }
  }
  if (v5 != AVAssetWriterStatusWriting)
  {
    if (!a3)
      return;
    v15 = -[AVAssetWriter error](self->_assetWriter, "error");
    if ((VCMovieWriter *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_26;
      v17 = VRTraceErrorLogLevelToCSTR();
      v18 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        goto LABEL_26;
      *(_DWORD *)v24 = 136316162;
      *(_QWORD *)&v24[4] = v17;
      *(_WORD *)&v24[12] = 2080;
      *(_QWORD *)&v24[14] = "-[VCMovieWriter finishWritingWithHandler:]";
      *(_WORD *)&v24[22] = 1024;
      LODWORD(v25) = 296;
      WORD2(v25) = 2048;
      *(_QWORD *)((char *)&v25 + 6) = v5;
      HIWORD(v25) = 2112;
      v26 = (VCMovieWriter *)v15;
      v19 = " [%s] %s:%d Invalid assetWriter status=%ld, error=%@";
      v20 = v18;
      v21 = 48;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v16 = (const __CFString *)-[VCMovieWriter performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v16 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3
        || (v22 = VRTraceErrorLogLevelToCSTR(),
            v23 = *MEMORY[0x1E0CF2758],
            !os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR)))
      {
LABEL_26:
        if (v15)
        {
LABEL_28:
          (*((void (**)(id, _QWORD, NSError *))a3 + 2))(a3, 0, v15);
          return;
        }
LABEL_27:
        v15 = (NSError *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("VCMovieWriter"), -1, 0, *(_OWORD *)v24, *(_QWORD *)&v24[16], v25, v26, *(_OWORD *)v27, *(_QWORD *)&v27[16]);
        goto LABEL_28;
      }
      *(_DWORD *)v24 = 136316674;
      *(_QWORD *)&v24[4] = v22;
      *(_WORD *)&v24[12] = 2080;
      *(_QWORD *)&v24[14] = "-[VCMovieWriter finishWritingWithHandler:]";
      *(_WORD *)&v24[22] = 1024;
      LODWORD(v25) = 296;
      WORD2(v25) = 2112;
      *(_QWORD *)((char *)&v25 + 6) = v16;
      HIWORD(v25) = 2048;
      v26 = self;
      *(_WORD *)v27 = 2048;
      *(_QWORD *)&v27[2] = v5;
      *(_WORD *)&v27[10] = 2112;
      *(_QWORD *)&v27[12] = v15;
      v19 = " [%s] %s:%d %@(%p) Invalid assetWriter status=%ld, error=%@";
      v20 = v23;
      v21 = 68;
    }
    _os_log_error_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_ERROR, v19, v24, v21);
    if (v15)
      goto LABEL_28;
    goto LABEL_27;
  }
  self->_mediaState = 2;
  completionHandler = self->_completionHandler;
  self->_completionHandler = _Block_copy(a3);
  if (completionHandler)
    _Block_release(completionHandler);
  CMBufferQueueMarkEndOfData(self->_videoQueue);
  CMBufferQueueMarkEndOfData(self->_localAudioQueue);
  CMBufferQueueMarkEndOfData(self->_remoteAudioQueue);
}

- (id)setupLivePhotoAssetWithTransactionID:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0C8B278]);
  v6 = v5;
  if (!v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMovieWriter setupLivePhotoAssetWithTransactionID:].cold.1();
    }
    goto LABEL_11;
  }
  objc_msgSend(v5, "setKey:", CFSTR("com.apple.quicktime.content.identifier"));
  objc_msgSend(v6, "setKeySpace:", CFSTR("mdta"));
  objc_msgSend(v6, "setValue:", a3);
  v7 = *MEMORY[0x1E0CA2498];
  objc_msgSend(v6, "setDataType:", *MEMORY[0x1E0CA2498]);
  v8 = objc_alloc_init(MEMORY[0x1E0C8B278]);
  if (!v8)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMovieWriter setupLivePhotoAssetWithTransactionID:].cold.2();
    }
LABEL_11:
    v10 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("VCMovieWriter"), -2, 0);
    v9 = 0;
    goto LABEL_4;
  }
  v9 = v8;
  objc_msgSend(v8, "setKey:", *MEMORY[0x1E0C8AAB8]);
  objc_msgSend(v9, "setKeySpace:", *MEMORY[0x1E0C8A9E8]);
  objc_msgSend(v9, "setValue:", CFSTR("FaceTime"));
  objc_msgSend(v9, "setDataType:", v7);
  v12[0] = v6;
  v12[1] = v9;
  -[AVAssetWriter setMetadata:](self->_assetWriter, "setMetadata:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2));
  v10 = 0;
LABEL_4:

  return v10;
}

- (id)addAudioTrackForLocalAudio:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  objc_class *v10;
  objc_class *v11;
  void *v12;
  uint64_t v13;
  _QWORD v15[5];
  _QWORD v16[5];
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;

  v3 = a3;
  v22 = *MEMORY[0x1E0C80C00];
  v19 = 0;
  v18 = 0;
  v21 = 0;
  v20 = 0;
  v17 = 6619138;
  v5 = *MEMORY[0x1E0C89930];
  v15[0] = *MEMORY[0x1E0C898E0];
  v15[1] = v5;
  v16[0] = &unk_1E9EF69B0;
  v16[1] = &unk_1E9EF69C8;
  v16[2] = &unk_1E9EFB1E8;
  v6 = *MEMORY[0x1E0C898A0];
  v15[2] = *MEMORY[0x1E0C89970];
  v15[3] = v6;
  v7 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v17, 32);
  v15[4] = *MEMORY[0x1E0C898C8];
  v16[3] = v7;
  v16[4] = &unk_1E9EF69E0;
  v8 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 5);
  v9 = objc_alloc(MEMORY[0x1E0C8B020]);
  v10 = (objc_class *)objc_msgSend(v9, "initWithMediaType:outputSettings:", *MEMORY[0x1E0C8A7A0], v8);
  if (v10)
  {
    v11 = v10;
    -[objc_class setExpectsMediaDataInRealTime:](v10, "setExpectsMediaDataInRealTime:", 1);
    -[AVAssetWriter addInput:](self->_assetWriter, "addInput:", v11);
    if (v3)
    {
      v12 = 0;
      v13 = 312;
    }
    else
    {
      v12 = 0;
      v13 = 320;
    }
    *(Class *)((char *)&self->super.super.isa + v13) = v11;
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMovieWriter addAudioTrackForLocalAudio:].cold.1();
    }
    return (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("VCMovieWriter"), -2, 0);
  }
  return v12;
}

- (id)addVideoTrackWithWidth:(int)a3 height:(int)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v7;
  void *v8;
  uint64_t v9;
  unsigned int codec;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  AVAssetWriterInput *v28;
  _QWORD v30[5];
  _QWORD v31[5];
  _QWORD v32[3];
  _QWORD v33[3];
  _QWORD v34[5];
  _QWORD v35[7];

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  v35[5] = *MEMORY[0x1E0C80C00];
  if (VCDefaults_GetManagedBoolValueForKey(CFSTR("enableLocalVideoRecording"), 0))
    v7 = &unk_1E9EF6A10;
  else
    v7 = &unk_1E9EF69F8;
  v8 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v9 = *MEMORY[0x1E0C8AF20];
  codec = self->_codec;
  v34[0] = *MEMORY[0x1E0C8AEC8];
  v34[1] = v9;
  v11 = (uint64_t *)MEMORY[0x1E0C8AF18];
  if (codec != 1635148593)
    v11 = (uint64_t *)MEMORY[0x1E0CED9B0];
  v12 = *v11;
  v35[0] = &unk_1E9EF6A28;
  v35[1] = v12;
  v13 = *MEMORY[0x1E0C8AE20];
  v35[2] = v7;
  v14 = *MEMORY[0x1E0C8AEF8];
  v34[2] = v13;
  v34[3] = v14;
  v15 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (int)(self->_keyFrameIntervalDuration * 30.0));
  v34[4] = *MEMORY[0x1E0C8AE08];
  v35[3] = v15;
  v35[4] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(v8, "addEntriesFromDictionary:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 5));
  v16 = *MEMORY[0x1E0C8AE98];
  v17 = *MEMORY[0x1E0C8AF40];
  v32[0] = *MEMORY[0x1E0C8AE90];
  v32[1] = v17;
  v18 = *MEMORY[0x1E0C8AF50];
  v33[0] = v16;
  v33[1] = v18;
  v32[2] = *MEMORY[0x1E0C8AF68];
  v33[2] = *MEMORY[0x1E0C8AF70];
  v19 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 3);
  v20 = (void *)MEMORY[0x1E0C99E08];
  v21 = *MEMORY[0x1E0C8AE68];
  v22 = (_QWORD *)MEMORY[0x1E0C8AE78];
  if (self->_codec == 1635148593)
    v22 = (_QWORD *)MEMORY[0x1E0C8AE58];
  v31[0] = *v22;
  v31[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v5, v21, *MEMORY[0x1E0C8AF60]);
  v30[2] = *MEMORY[0x1E0C8AEF0];
  v23 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4);
  v24 = *MEMORY[0x1E0C8AEB8];
  v31[2] = v23;
  v31[3] = v8;
  v25 = *MEMORY[0x1E0C8AEA8];
  v30[3] = v24;
  v30[4] = v25;
  v31[4] = v19;
  v26 = objc_msgSend(v20, "dictionaryWithDictionary:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 5));
  v27 = objc_alloc(MEMORY[0x1E0C8B020]);
  v28 = (AVAssetWriterInput *)objc_msgSend(v27, "initWithMediaType:outputSettings:", *MEMORY[0x1E0C8A808], v26);
  self->_videoInput = v28;
  if (v28)
  {
    -[AVAssetWriterInput setExpectsMediaDataInRealTime:](v28, "setExpectsMediaDataInRealTime:", 1);
    -[AVAssetWriter addInput:](self->_assetWriter, "addInput:", self->_videoInput);
    return 0;
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMovieWriter addVideoTrackWithWidth:height:].cold.1();
    }
    return (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("VCMovieWriter"), -2, 0);
  }
}

- (id)addStillImageMetadataTrackWithTransactionID:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  const __CFArray *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  CMMetadataFormatDescriptionRef formatDescriptionOut;
  _QWORD v15[2];
  _QWORD v16[2];
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  formatDescriptionOut = 0;
  v4 = *MEMORY[0x1E0CA2518];
  v15[0] = *MEMORY[0x1E0CA2528];
  v15[1] = v4;
  v5 = *MEMORY[0x1E0CA2468];
  v16[0] = *MEMORY[0x1E0CA4CC0];
  v16[1] = v5;
  v17[0] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v6 = (const __CFArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  CMMetadataFormatDescriptionCreateWithMetadataSpecifications((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0x6D656278u, v6, &formatDescriptionOut);
  if (!formatDescriptionOut)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMovieWriter addStillImageMetadataTrackWithTransactionID:].cold.1();
    }
    goto LABEL_14;
  }
  v7 = objc_alloc(MEMORY[0x1E0C8B020]);
  v8 = (void *)objc_msgSend(v7, "initWithMediaType:outputSettings:sourceFormatHint:", *MEMORY[0x1E0C8A7D0], 0, formatDescriptionOut);
  if (!v8)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMovieWriter addStillImageMetadataTrackWithTransactionID:].cold.2();
    }
LABEL_14:
    v9 = 0;
    goto LABEL_15;
  }
  v9 = v8;
  self->_metadataInput = (AVAssetWriterInput *)v8;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8B030]), "initWithAssetWriterInput:", self->_metadataInput);
  if (v10)
  {
    v11 = v10;
    self->_adapter = (AVAssetWriterInputMetadataAdaptor *)v10;
    -[AVAssetWriter addInput:](self->_assetWriter, "addInput:", objc_msgSend(v11, "assetWriterInput"));
    v12 = 0;
    self->_hasStillImageMetadataTrack = 1;
    goto LABEL_5;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCMovieWriter addStillImageMetadataTrackWithTransactionID:].cold.3();
  }
LABEL_15:
  v12 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("VCMovieWriter"), -2, 0);
  v11 = 0;
LABEL_5:

  if (formatDescriptionOut)
    CFRelease(formatDescriptionOut);
  return v12;
}

- (id)setupAssetWriterWithWidth:(int)a3 height:(int)a4 transactionID:(id)a5
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  __int128 v12;
  int64_t v13;
  id v14;
  uint64_t v15;
  NSObject *v16;
  AVAssetWriterStatus v18;
  NSError *v19;
  __int128 v20;
  int64_t epoch;
  id v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  _BYTE v30[10];
  _BYTE v31[10];
  NSError *v32;
  uint64_t v33;

  v6 = *(_QWORD *)&a4;
  v7 = *(_QWORD *)&a3;
  v33 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v24 = v9;
      v25 = 2080;
      v26 = "-[VCMovieWriter setupAssetWriterWithWidth:height:transactionID:]";
      v27 = 1024;
      v28 = 452;
      v29 = 1024;
      *(_DWORD *)v30 = v7;
      *(_WORD *)&v30[4] = 1024;
      *(_DWORD *)&v30[6] = v6;
      *(_WORD *)v31 = 2112;
      *(_QWORD *)&v31[2] = a5;
      _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d width=%d, height=%d, transactionID=%@", buf, 0x32u);
    }
  }
  v22 = 0;
  if ((_DWORD)v7 && (_DWORD)v6)
  {
    v11 = MEMORY[0x1E0CA2E18];
    v12 = *MEMORY[0x1E0CA2E18];
    *(_OWORD *)&self->_lastVideoPresentationTime.value = *MEMORY[0x1E0CA2E18];
    v13 = *(_QWORD *)(v11 + 16);
    self->_lastVideoPresentationTime.epoch = v13;
    *(_OWORD *)&self->_lastLocalAudioPresentationTime.value = v12;
    self->_lastLocalAudioPresentationTime.epoch = v13;
    *(_OWORD *)&self->_lastRemoteAudioPresentationTime.value = v12;
    self->_lastRemoteAudioPresentationTime.epoch = v13;
    v14 = objc_alloc(MEMORY[0x1E0C8B018]);
    self->_assetWriter = (AVAssetWriter *)objc_msgSend(v14, "initWithURL:fileType:error:", self->_outputURL, *MEMORY[0x1E0C8A2E8], &v22);
    if (v22)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCMovieWriter setupAssetWriterWithWidth:height:transactionID:].cold.7();
      }
    }
    else
    {
      v22 = -[VCMovieWriter setupLivePhotoAssetWithTransactionID:](self, "setupLivePhotoAssetWithTransactionID:", a5);
      if (v22)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCMovieWriter setupAssetWriterWithWidth:height:transactionID:].cold.6();
        }
      }
      else
      {
        v22 = -[VCMovieWriter addVideoTrackWithWidth:height:](self, "addVideoTrackWithWidth:height:", v7, v6);
        if (v22)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              -[VCMovieWriter setupAssetWriterWithWidth:height:transactionID:].cold.5();
          }
        }
        else if (VCMediaWriterUtil_IsMediaExpected(1, self->_writerMode)
               && (v22 = -[VCMovieWriter addAudioTrackForLocalAudio:](self, "addAudioTrackForLocalAudio:", 1)) != 0)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              -[VCMovieWriter setupAssetWriterWithWidth:height:transactionID:].cold.4();
          }
        }
        else if (VCMediaWriterUtil_IsMediaExpected(2, self->_writerMode)
               && (v22 = -[VCMovieWriter addAudioTrackForLocalAudio:](self, "addAudioTrackForLocalAudio:", 0)) != 0)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              -[VCMovieWriter setupAssetWriterWithWidth:height:transactionID:].cold.3();
          }
        }
        else
        {
          v22 = -[VCMovieWriter addStillImageMetadataTrackWithTransactionID:](self, "addStillImageMetadataTrackWithTransactionID:", a5);
          if (v22)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              VRTraceErrorLogLevelToCSTR();
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                -[VCMovieWriter setupAssetWriterWithWidth:height:transactionID:].cold.2();
            }
          }
          else
          {
            if ((self->_movieFragmentInterval.flags & 1) != 0)
            {
              v20 = *(_OWORD *)&self->_movieFragmentInterval.value;
              epoch = self->_movieFragmentInterval.epoch;
              -[AVAssetWriter setMovieFragmentInterval:](self->_assetWriter, "setMovieFragmentInterval:", &v20);
            }
            if (!-[AVAssetWriter startWriting](self->_assetWriter, "startWriting")
              && (int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              v15 = VRTraceErrorLogLevelToCSTR();
              v16 = *MEMORY[0x1E0CF2758];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              {
                v18 = -[AVAssetWriter status](self->_assetWriter, "status");
                v19 = -[AVAssetWriter error](self->_assetWriter, "error");
                *(_DWORD *)buf = 136316418;
                v24 = v15;
                v25 = 2080;
                v26 = "-[VCMovieWriter setupAssetWriterWithWidth:height:transactionID:]";
                v27 = 1024;
                v28 = 487;
                v29 = 2112;
                *(_QWORD *)v30 = a5;
                *(_WORD *)&v30[8] = 2048;
                *(_QWORD *)v31 = v18;
                *(_WORD *)&v31[8] = 2112;
                v32 = v19;
                _os_log_error_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_ERROR, " [%s] %s:%d assetWriter startWriting failed, transactionID=%@, status=%ld, error=%@", buf, 0x3Au);
              }
            }
            -[VCMovieWriter setupInputs](self, "setupInputs");
          }
        }
      }
    }
    if (v22)
    {
      -[VCMovieWriter cleanupAssetWriter](self, "cleanupAssetWriter");
      return v22;
    }
    else
    {
      return 0;
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMovieWriter setupAssetWriterWithWidth:height:transactionID:].cold.1();
    }
    return (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("VCMovieWriter"), -3, 0);
  }
}

- (id)setupAudioAssetWriterWithTransactionID:(id)a3
{
  uint64_t v5;
  __int128 v6;
  int64_t v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  AVAssetWriterStatus v12;
  NSError *v13;
  __int128 v14;
  int64_t epoch;
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  id v24;
  __int16 v25;
  AVAssetWriterStatus v26;
  __int16 v27;
  NSError *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v16 = 0;
  v5 = MEMORY[0x1E0CA2E18];
  v6 = *MEMORY[0x1E0CA2E18];
  *(_OWORD *)&self->_lastVideoPresentationTime.value = *MEMORY[0x1E0CA2E18];
  v7 = *(_QWORD *)(v5 + 16);
  self->_lastVideoPresentationTime.epoch = v7;
  *(_OWORD *)&self->_lastLocalAudioPresentationTime.value = v6;
  self->_lastLocalAudioPresentationTime.epoch = v7;
  *(_OWORD *)&self->_lastRemoteAudioPresentationTime.value = v6;
  self->_lastRemoteAudioPresentationTime.epoch = v7;
  v8 = objc_alloc(MEMORY[0x1E0C8B018]);
  self->_assetWriter = (AVAssetWriter *)objc_msgSend(v8, "initWithURL:fileType:error:", self->_outputURL, *MEMORY[0x1E0C8A2E8], &v16);
  if (v16)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMovieWriter setupAudioAssetWriterWithTransactionID:].cold.3();
    }
  }
  else if (VCMediaWriterUtil_IsMediaExpected(1, self->_writerMode)
         && (v16 = -[VCMovieWriter addAudioTrackForLocalAudio:](self, "addAudioTrackForLocalAudio:", 1)) != 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMovieWriter setupAudioAssetWriterWithTransactionID:].cold.2();
    }
  }
  else if (VCMediaWriterUtil_IsMediaExpected(2, self->_writerMode)
         && (v16 = -[VCMovieWriter addAudioTrackForLocalAudio:](self, "addAudioTrackForLocalAudio:", 0)) != 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMovieWriter setupAudioAssetWriterWithTransactionID:].cold.1();
    }
  }
  else
  {
    if ((self->_movieFragmentInterval.flags & 1) != 0)
    {
      v14 = *(_OWORD *)&self->_movieFragmentInterval.value;
      epoch = self->_movieFragmentInterval.epoch;
      -[AVAssetWriter setMovieFragmentInterval:](self->_assetWriter, "setMovieFragmentInterval:", &v14);
    }
    if (!-[AVAssetWriter startWriting](self->_assetWriter, "startWriting")
      && (int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v12 = -[AVAssetWriter status](self->_assetWriter, "status");
        v13 = -[AVAssetWriter error](self->_assetWriter, "error");
        *(_DWORD *)buf = 136316418;
        v18 = v9;
        v19 = 2080;
        v20 = "-[VCMovieWriter setupAudioAssetWriterWithTransactionID:]";
        v21 = 1024;
        v22 = 520;
        v23 = 2112;
        v24 = a3;
        v25 = 2048;
        v26 = v12;
        v27 = 2112;
        v28 = v13;
        _os_log_error_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_ERROR, " [%s] %s:%d assetWriter startWriting failed, transactionID=%@, status=%ld, error=%@", buf, 0x3Au);
      }
    }
    -[VCMovieWriter setupInputs](self, "setupInputs");
  }
  if (!v16)
    return 0;
  -[VCMovieWriter cleanupAssetWriter](self, "cleanupAssetWriter");
  return v16;
}

- (void)cleanupAssetWriter
{
  AVAssetWriterInputMetadataAdaptor *adapter;
  AVAssetWriterInput *metadataInput;
  AVAssetWriterInput *localAudioInput;
  AVAssetWriterInput *remoteAudioInput;
  AVAssetWriterInput *videoInput;
  AVAssetWriter *assetWriter;

  adapter = self->_adapter;
  if (adapter)
  {
    CFRelease(adapter);
    self->_adapter = 0;
  }
  metadataInput = self->_metadataInput;
  if (metadataInput)
  {
    CFRelease(metadataInput);
    self->_metadataInput = 0;
  }
  localAudioInput = self->_localAudioInput;
  if (localAudioInput)
  {
    CFRelease(localAudioInput);
    self->_localAudioInput = 0;
  }
  remoteAudioInput = self->_remoteAudioInput;
  if (remoteAudioInput)
  {
    CFRelease(remoteAudioInput);
    self->_remoteAudioInput = 0;
  }
  videoInput = self->_videoInput;
  if (videoInput)
  {
    CFRelease(videoInput);
    self->_videoInput = 0;
  }
  assetWriter = self->_assetWriter;
  if (assetWriter)
  {
    CFRelease(assetWriter);
    self->_assetWriter = 0;
  }
}

- (void)setupInput:(id)a3 queue:(opaqueCMBufferQueue *)a4 dispatchGroup:(id)a5 lastPresentationTime:(id *)a6
{
  OS_dispatch_queue *serializationQueue;
  _QWORD v12[10];

  v12[9] = *MEMORY[0x1E0C80C00];
  dispatch_group_enter((dispatch_group_t)a5);
  serializationQueue = self->_serializationQueue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __69__VCMovieWriter_setupInput_queue_dispatchGroup_lastPresentationTime___block_invoke;
  v12[3] = &unk_1E9E55B48;
  v12[4] = self;
  v12[5] = a3;
  v12[7] = a4;
  v12[8] = a6;
  v12[6] = a5;
  objc_msgSend(a3, "requestMediaDataWhenReadyOnQueue:usingBlock:", serializationQueue, v12);
}

void __69__VCMovieWriter_setupInput_queue_dispatchGroup_lastPresentationTime___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (CMBufferQueueIsAtEndOfData(*(CMBufferQueueRef *)(a1 + 56)))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v2 = VRTraceErrorLogLevelToCSTR();
      v3 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v4 = 136315650;
        v5 = v2;
        v6 = 2080;
        v7 = "-[VCMovieWriter setupInput:queue:dispatchGroup:lastPresentationTime:]_block_invoke";
        v8 = 1024;
        v9 = 546;
        _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCMovieWriter, finished writing", (uint8_t *)&v4, 0x1Cu);
      }
    }
    objc_msgSend(*(id *)(a1 + 40), "markAsFinished");
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "processSampleQueue:input:lastPresentationTime:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64));
  }
}

- (void)processSampleQueue:(opaqueCMBufferQueue *)a3 input:(id)a4 lastPresentationTime:(id *)a5
{
  opaqueCMSampleBuffer *v9;
  opaqueCMSampleBuffer *v10;
  char flags;
  uint64_t v13;
  NSObject *v14;
  int v15;
  NSObject *v16;
  NSObject *v17;
  Float64 Seconds;
  Float64 v19;
  NSError *v20;
  NSError *v21;
  uint64_t v22;
  CMTime time2;
  CMTime v24;
  CMTime time1;
  int v26;
  __int16 v27;
  int v28;
  __int16 v29;
  NSError *v30;
  __int16 v31;
  Float64 v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a4, "isReadyForMoreMediaData"))
  {
    do
    {
      v9 = (opaqueCMSampleBuffer *)CMBufferQueueDequeueAndRetain(a3);
      if (!v9)
        break;
      v10 = v9;
      memset(&v24, 170, sizeof(v24));
      CMSampleBufferGetPresentationTimeStamp(&v24, v9);
      flags = v24.flags;
      if (!self->_writingStarted && (v24.flags & 1) != 0)
      {
        time1 = v24;
        -[VCMovieWriter startWritingAtTime:](self, "startWritingAtTime:", &time1);
        *(CMTime *)a5 = v24;
        flags = v24.flags;
      }
      if ((flags & 1) != 0 && (time1 = (CMTime)*a5, time2 = v24, CMTimeCompare(&time1, &time2) < 0))
      {
        v15 = objc_msgSend(a4, "appendSampleBuffer:", v10);
        if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
        {
          v22 = VRTraceErrorLogLevelToCSTR();
          v16 = *MEMORY[0x1E0CF2758];
          v17 = *MEMORY[0x1E0CF2758];
          if (*MEMORY[0x1E0CF2748])
          {
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              v20 = -[AVAssetWriter error](self->_assetWriter, "error");
              time1 = v24;
              Seconds = CMTimeGetSeconds(&time1);
              LODWORD(time1.value) = 136316418;
              *(CMTimeValue *)((char *)&time1.value + 4) = v22;
              LOWORD(time1.flags) = 2080;
              *(_QWORD *)((char *)&time1.flags + 2) = "-[VCMovieWriter processSampleQueue:input:lastPresentationTime:]";
              HIWORD(time1.epoch) = 1024;
              v26 = 564;
              v27 = 1024;
              v28 = v15;
              v29 = 2112;
              v30 = v20;
              v31 = 2048;
              v32 = Seconds;
              _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCMovieWriter, append success(%d) error(%@) for sampleTime(%f)", (uint8_t *)&time1, 0x36u);
            }
          }
          else if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            v21 = -[AVAssetWriter error](self->_assetWriter, "error");
            time1 = v24;
            v19 = CMTimeGetSeconds(&time1);
            LODWORD(time1.value) = 136316418;
            *(CMTimeValue *)((char *)&time1.value + 4) = v22;
            LOWORD(time1.flags) = 2080;
            *(_QWORD *)((char *)&time1.flags + 2) = "-[VCMovieWriter processSampleQueue:input:lastPresentationTime:]";
            HIWORD(time1.epoch) = 1024;
            v26 = 564;
            v27 = 1024;
            v28 = v15;
            v29 = 2112;
            v30 = v21;
            v31 = 2048;
            v32 = v19;
            _os_log_debug_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEBUG, " [%s] %s:%d VCMovieWriter, append success(%d) error(%@) for sampleTime(%f)", (uint8_t *)&time1, 0x36u);
          }
        }
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v13 = VRTraceErrorLogLevelToCSTR();
        v14 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          LODWORD(time1.value) = 136315650;
          *(CMTimeValue *)((char *)&time1.value + 4) = v13;
          LOWORD(time1.flags) = 2080;
          *(_QWORD *)((char *)&time1.flags + 2) = "-[VCMovieWriter processSampleQueue:input:lastPresentationTime:]";
          HIWORD(time1.epoch) = 1024;
          v26 = 566;
          _os_log_error_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_ERROR, " [%s] %s:%d current time older than last frame", (uint8_t *)&time1, 0x1Cu);
        }
      }
      CFRelease(v10);
      *(CMTime *)a5 = v24;
    }
    while ((objc_msgSend(a4, "isReadyForMoreMediaData") & 1) != 0);
  }
}

- (void)appendMetaData
{
  __int16 v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  int v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a2 + 296), "error"))
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a2 + 296), "error"), "description"), "UTF8String");
  v8 = 136315906;
  v9 = a1;
  v10 = 2080;
  OUTLINED_FUNCTION_9();
  v11 = 604;
  v12 = v6;
  v13 = v7;
  _os_log_error_impl(&dword_1D8A54000, a3, OS_LOG_TYPE_ERROR, " [%s] %s:%d appendTimeMetadataGroup failed %s", (uint8_t *)&v8, 0x26u);
}

- (void)startWritingAtTime:(id *)a3
{
  int64_t var3;
  AVAssetWriter *assetWriter;
  uint64_t v7;
  NSObject *v8;
  Float64 Seconds;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10;
  int v11;
  __int16 v12;
  Float64 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  self->_writingStarted = 1;
  var3 = a3->var3;
  *(_OWORD *)&self->_startTime.value = *(_OWORD *)&a3->var0;
  self->_startTime.epoch = var3;
  assetWriter = self->_assetWriter;
  v10 = *a3;
  -[AVAssetWriter startSessionAtSourceTime:](assetWriter, "startSessionAtSourceTime:", &v10);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v10 = *a3;
      Seconds = CMTimeGetSeconds((CMTime *)&v10);
      LODWORD(v10.var0) = 136315906;
      *(int64_t *)((char *)&v10.var0 + 4) = v7;
      LOWORD(v10.var2) = 2080;
      *(_QWORD *)((char *)&v10.var2 + 2) = "-[VCMovieWriter startWritingAtTime:]";
      HIWORD(v10.var3) = 1024;
      v11 = 613;
      v12 = 2048;
      v13 = Seconds;
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCMovieWriter, started writing at %f", (uint8_t *)&v10, 0x26u);
    }
  }
  if (self->_hasStillImageMetadataTrack)
    -[VCMovieWriter appendMetaData](self, "appendMetaData");
}

- (void)completeWriting
{
  AVAssetWriterStatus v3;
  int v4;
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  AVAssetWriter *assetWriter;
  NSURL *outputURL;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  AVAssetWriter *v14;
  NSURL *v15;
  void (**completionHandler)(id, NSURL *, _QWORD);
  AVAssetWriter *v17;
  NSURL *v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  NSError *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  AVAssetWriter *v28;
  NSURL *v29;
  _BYTE v30[22];
  __int16 v31;
  int v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  VCMovieWriter *v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  NSURL *v40;
  __int16 v41;
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v3 = -[AVAssetWriter status](self->_assetWriter, "status");
  if (v3 == AVAssetWriterStatusCompleted)
    v4 = 7;
  else
    v4 = 3;
  if ((VCMovieWriter *)objc_opt_class() == self)
  {
    if (v4 > (int)VRTraceGetErrorLogLevelForModule())
      goto LABEL_13;
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    v8 = *MEMORY[0x1E0CF2758];
    if (v3 == AVAssetWriterStatusCompleted)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        assetWriter = self->_assetWriter;
        outputURL = self->_outputURL;
        *(_DWORD *)v30 = 136316418;
        *(_QWORD *)&v30[4] = v6;
        *(_WORD *)&v30[12] = 2080;
        *(_QWORD *)&v30[14] = "-[VCMovieWriter completeWriting]";
        v31 = 1024;
        v32 = 623;
        v33 = 2112;
        v34 = assetWriter;
        v35 = 2112;
        v36 = (VCMovieWriter *)outputURL;
        v37 = 2048;
        v38 = 2;
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d assetWriter=%@ completed url=%@ with status=%ld", v30, 0x3Au);
      }
      goto LABEL_18;
    }
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      goto LABEL_24;
    v28 = self->_assetWriter;
    v29 = self->_outputURL;
    *(_DWORD *)v30 = 136316418;
    *(_QWORD *)&v30[4] = v6;
    *(_WORD *)&v30[12] = 2080;
    *(_QWORD *)&v30[14] = "-[VCMovieWriter completeWriting]";
    v31 = 1024;
    v32 = 623;
    v33 = 2112;
    v34 = v28;
    v35 = 2112;
    v36 = (VCMovieWriter *)v29;
    v37 = 2048;
    v38 = v3;
    v19 = " [%s] %s:%d assetWriter=%@ completed url=%@ with status=%ld";
    v20 = v7;
    v21 = 58;
LABEL_30:
    _os_log_error_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_ERROR, v19, v30, v21);
    goto LABEL_24;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = (const __CFString *)-[VCMovieWriter performSelector:](self, "performSelector:", sel_logPrefix);
  else
    v5 = &stru_1E9E58EE0;
  if (v4 > (int)VRTraceGetErrorLogLevelForModule())
  {
LABEL_13:
    if (v3 == AVAssetWriterStatusCompleted)
    {
LABEL_18:
      completionHandler = (void (**)(id, NSURL *, _QWORD))self->_completionHandler;
      if (completionHandler)
        completionHandler[2](completionHandler, self->_outputURL, 0);
      VCMediaRecorderUtil_PrintMediaURL((uint64_t)self->_outputURL, 7);
      return;
    }
    goto LABEL_24;
  }
  v11 = VRTraceErrorLogLevelToCSTR();
  v12 = *MEMORY[0x1E0CF2758];
  v13 = *MEMORY[0x1E0CF2758];
  if (v3 == AVAssetWriterStatusCompleted)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = self->_assetWriter;
      v15 = self->_outputURL;
      *(_DWORD *)v30 = 136316930;
      *(_QWORD *)&v30[4] = v11;
      *(_WORD *)&v30[12] = 2080;
      *(_QWORD *)&v30[14] = "-[VCMovieWriter completeWriting]";
      v31 = 1024;
      v32 = 623;
      v33 = 2112;
      v34 = (void *)v5;
      v35 = 2048;
      v36 = self;
      v37 = 2112;
      v38 = (uint64_t)v14;
      v39 = 2112;
      v40 = v15;
      v41 = 2048;
      v42 = 2;
      _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %@(%p) assetWriter=%@ completed url=%@ with status=%ld", v30, 0x4Eu);
    }
    goto LABEL_18;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    v17 = self->_assetWriter;
    v18 = self->_outputURL;
    *(_DWORD *)v30 = 136316930;
    *(_QWORD *)&v30[4] = v11;
    *(_WORD *)&v30[12] = 2080;
    *(_QWORD *)&v30[14] = "-[VCMovieWriter completeWriting]";
    v31 = 1024;
    v32 = 623;
    v33 = 2112;
    v34 = (void *)v5;
    v35 = 2048;
    v36 = self;
    v37 = 2112;
    v38 = (uint64_t)v17;
    v39 = 2112;
    v40 = v18;
    v41 = 2048;
    v42 = v3;
    v19 = " [%s] %s:%d %@(%p) assetWriter=%@ completed url=%@ with status=%ld";
    v20 = v12;
    v21 = 78;
    goto LABEL_30;
  }
LABEL_24:
  if (self->_completionHandler)
  {
    v22 = -[AVAssetWriter error](self->_assetWriter, "error");
    if (!v22)
      v22 = (NSError *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("VCMovieWriter"), -1, 0);
    (*((void (**)(id, _QWORD, NSError *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD))self->_completionHandler
     + 2))(self->_completionHandler, 0, v22, v23, v24, v25, v26, v27, *(_QWORD *)v30, *(_QWORD *)&v30[8]);
  }
}

- (void)setupInputs
{
  NSObject *v3;
  NSObject *serializationQueue;
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  v3 = dispatch_group_create();
  if (!VCMediaWriterUtil_IsAudioOnly(self->_writerMode))
    -[VCMovieWriter setupInput:queue:dispatchGroup:lastPresentationTime:](self, "setupInput:queue:dispatchGroup:lastPresentationTime:", self->_videoInput, self->_videoQueue, v3, &self->_lastVideoPresentationTime);
  if (VCMediaWriterUtil_IsMediaExpected(1, self->_writerMode))
    -[VCMovieWriter setupInput:queue:dispatchGroup:lastPresentationTime:](self, "setupInput:queue:dispatchGroup:lastPresentationTime:", self->_localAudioInput, self->_localAudioQueue, v3, &self->_lastLocalAudioPresentationTime);
  if (VCMediaWriterUtil_IsMediaExpected(2, self->_writerMode))
    -[VCMovieWriter setupInput:queue:dispatchGroup:lastPresentationTime:](self, "setupInput:queue:dispatchGroup:lastPresentationTime:", self->_remoteAudioInput, self->_remoteAudioQueue, v3, &self->_lastRemoteAudioPresentationTime);
  serializationQueue = self->_serializationQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __28__VCMovieWriter_setupInputs__block_invoke;
  v5[3] = &unk_1E9E521C0;
  v5[4] = self;
  dispatch_group_notify(v3, serializationQueue, v5);
  dispatch_release(v3);
}

uint64_t __28__VCMovieWriter_setupInputs__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v4[6];

  v4[5] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 296);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __28__VCMovieWriter_setupInputs__block_invoke_2;
  v4[3] = &unk_1E9E521C0;
  v4[4] = v1;
  return objc_msgSend(v2, "finishWritingWithCompletionHandler:", v4);
}

uint64_t __28__VCMovieWriter_setupInputs__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeWriting");
}

- (unsigned)startRTPTimeStamp
{
  return self->_startRTPTimeStamp;
}

- (void)setStartRTPTimeStamp:(unsigned int)a3
{
  self->_startRTPTimeStamp = a3;
}

- (unsigned)endRTPTimeStamp
{
  return self->_endRTPTimeStamp;
}

- (void)setEndRTPTimeStamp:(unsigned int)a3
{
  self->_endRTPTimeStamp = a3;
}

- (unsigned)writerMode
{
  return self->_writerMode;
}

- (NSURL)outputURL
{
  return self->_outputURL;
}

- (void)setOutputURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 344);
}

- (NSString)transactionID
{
  return self->_transactionID;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)movieFragmentInterval
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 472);
  return self;
}

- (void)setMovieFragmentInterval:(id *)a3
{
  int64_t var3;

  var3 = a3->var3;
  *(_OWORD *)&self->_movieFragmentInterval.value = *(_OWORD *)&a3->var0;
  self->_movieFragmentInterval.epoch = var3;
}

- (VCSandboxedURL)directoryURL
{
  return self->_directoryURL;
}

- (void)setDirectoryURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 464);
}

- (void)setupVisibleRect:withCaptureHeight:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d transferSession or Bufferpool is not NULL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)appendVideoSampleBuffer:cameraStatus:mediaType:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d pixelBuf is NULL after resizing", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)appendVideoSampleBuffer:cameraStatus:mediaType:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCMovieWriter appendVideoSampleBuffer:cameraStatus:mediaType:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d appending video error is %d", v2, *(const char **)v3, (unint64_t)"-[VCMovieWriter appendVideoSampleBuffer:cameraStatus:mediaType:]" >> 16, 179);
  OUTLINED_FUNCTION_3();
}

- (void)appendVideoSampleBuffer:cameraStatus:mediaType:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d setupAssetWriterWithWidth:height:transactionID: returned error=%@");
  OUTLINED_FUNCTION_3();
}

- (void)appendVideoSampleBuffer:cameraStatus:mediaType:.cold.4()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d CMBufferQueueContainsEndOfData(_videoQueue) returned true", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)appendAudioSampleBuffer:mediaType:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d audioQueue is NULL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)appendAudioSampleBuffer:mediaType:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCMovieWriter appendAudioSampleBuffer:mediaType:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d appending audio error is %d", v2, *(const char **)v3, (unint64_t)"-[VCMovieWriter appendAudioSampleBuffer:mediaType:]" >> 16, 210);
  OUTLINED_FUNCTION_3();
}

- (void)appendAudioSampleBuffer:mediaType:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d CMBufferQueueContainsEndOfData(audioQueue) returned true", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupLivePhotoAssetWithTransactionID:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate live photo metadata", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupLivePhotoAssetWithTransactionID:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate live photo metadata keyword", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)addAudioTrackForLocalAudio:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  const char *v3;
  int v4;

  v2 = 136315906;
  OUTLINED_FUNCTION_8_6();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate the audio track. isLocalAudio=%d", v2, v3, v4, 348);
  OUTLINED_FUNCTION_3();
}

- (void)addVideoTrackWithWidth:height:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate the video writer input", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)addStillImageMetadataTrackWithTransactionID:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate the metadata description, transactionID=%@");
  OUTLINED_FUNCTION_3();
}

- (void)addStillImageMetadataTrackWithTransactionID:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate the metadata input, transactionID=%@");
  OUTLINED_FUNCTION_3();
}

- (void)addStillImageMetadataTrackWithTransactionID:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate the adapter, transactionID=%@");
  OUTLINED_FUNCTION_3();
}

- (void)setupAssetWriterWithWidth:height:transactionID:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Cannot set up asset writer with zero dimensions", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupAssetWriterWithWidth:height:transactionID:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate the still image metadata track", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupAssetWriterWithWidth:height:transactionID:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate the remote audio track", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupAssetWriterWithWidth:height:transactionID:.cold.4()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate the local audio track", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupAssetWriterWithWidth:height:transactionID:.cold.5()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate the local video track", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupAssetWriterWithWidth:height:transactionID:.cold.6()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to add live photo asset", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupAssetWriterWithWidth:height:transactionID:.cold.7()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315906;
  OUTLINED_FUNCTION_8_6();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d _assetWriter init failed. error=%@", v2);
  OUTLINED_FUNCTION_3();
}

- (void)setupAudioAssetWriterWithTransactionID:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate the remote audio track", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupAudioAssetWriterWithTransactionID:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate the local audio track", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupAudioAssetWriterWithTransactionID:.cold.3()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315906;
  OUTLINED_FUNCTION_8_6();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d _assetWriter init failed. error=%@", v2);
  OUTLINED_FUNCTION_3();
}

@end
