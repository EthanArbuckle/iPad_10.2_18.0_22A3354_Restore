@implementation VCMediaRecorderHistory

- (BOOL)setUpDelegateQueue:(id)a3
{
  NSObject *CustomRootQueue;
  OS_dispatch_queue *v6;
  _BOOL4 v7;

  if (a3)
  {
    dispatch_retain((dispatch_object_t)a3);
    self->_delegateQueue = (OS_dispatch_queue *)a3;
LABEL_4:
    LOBYTE(v7) = 1;
    return v7;
  }
  CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
  v6 = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCMediaRecorderHistory.delegateQueue", 0, CustomRootQueue);
  self->_delegateQueue = v6;
  if (v6)
    goto LABEL_4;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    v7 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
    if (!v7)
      return v7;
    -[VCMediaRecorderHistory setUpDelegateQueue:].cold.1();
  }
  LOBYTE(v7) = 0;
  return v7;
}

- (BOOL)setUpAudioBuffers
{
  uint64_t v3;
  VCMediaRecorderHistoryBuffer *v4;
  VCMediaRecorderHistoryBuffer *v5;
  __CFAllocator *SampleBufferAllocator;
  _BOOL4 v7;

  if (VCDefaults_GetManagedBoolValueForKey(CFSTR("enableLocalVideoRecording"), 0))
    v3 = 45;
  else
    v3 = 75;
  v4 = -[VCMediaRecorderHistoryBuffer initWithDelegate:bufferLength:]([VCMediaRecorderHistoryBuffer alloc], "initWithDelegate:bufferLength:", self, v3);
  self->_localAudioBuffer = v4;
  if (v4)
  {
    v5 = -[VCMediaRecorderHistoryBuffer initWithDelegate:bufferLength:]([VCMediaRecorderHistoryBuffer alloc], "initWithDelegate:bufferLength:", self, v3);
    self->_remoteAudioBuffer = v5;
    if (v5)
    {
      SampleBufferAllocator = VCAudioBufferList_CreateSampleBufferAllocator();
      self->_audioSampleBufferAllocator = SampleBufferAllocator;
      if (SampleBufferAllocator)
      {
        LOBYTE(v7) = 1;
        return v7;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        v7 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
        if (!v7)
          return v7;
        -[VCMediaRecorderHistory setUpAudioBuffers].cold.3();
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v7 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v7)
        return v7;
      -[VCMediaRecorderHistory setUpAudioBuffers].cold.2();
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    v7 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
    if (!v7)
      return v7;
    -[VCMediaRecorderHistory setUpAudioBuffers].cold.1();
  }
  LOBYTE(v7) = 0;
  return v7;
}

- (BOOL)setUpVideoBuffers
{
  OpaqueVTPixelTransferSession *v3;
  _BOOL4 v4;
  _BOOL4 v5;
  OpaqueVTPixelTransferSession *v6;

  self->_frameBuffer = 0;
  v3 = (OpaqueVTPixelTransferSession *)VCMediaRecorderUtil_AllocTransferSession();
  self->_transferSession = v3;
  if (!v3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v5 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v5)
        return v5;
      -[VCMediaRecorderHistory setUpVideoBuffers].cold.1();
    }
    goto LABEL_16;
  }
  v4 = +[VCHardwareSettings retainPixelBufferForMediaRecordingEnabled](VCHardwareSettings, "retainPixelBufferForMediaRecordingEnabled");
  self->_retainPixelBufferEnabled = v4;
  if (!v4)
  {
    v6 = (OpaqueVTPixelTransferSession *)VCMediaRecorderUtil_AllocTransferSession();
    self->_copyTransferSession = v6;
    if (!v6)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        v5 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
        if (!v5)
          return v5;
        -[VCMediaRecorderHistory setUpVideoBuffers].cold.3();
      }
      goto LABEL_16;
    }
LABEL_8:
    LOBYTE(v5) = 1;
    return v5;
  }
  VCAllocatorFirstCome_Create((const __CFAllocator *)*MEMORY[0x1E0C9AE00], (uint64_t)"com.apple.AVConference.VCMediaRecorderHistory.frameAllocator", &self->_frameAllocator);
  if (self->_frameAllocator)
    goto LABEL_8;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    v5 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
    if (!v5)
      return v5;
    -[VCMediaRecorderHistory setUpVideoBuffers].cold.2();
  }
LABEL_16:
  LOBYTE(v5) = 0;
  return v5;
}

- (VCMediaRecorderHistory)initWithDelegateQueue:(id)a3
{
  char *v4;
  NSObject *CustomRootQueue;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)VCMediaRecorderHistory;
  v4 = -[VCMediaRecorderHistory init](&v7, sel_init);
  if (!v4)
    goto LABEL_10;
  if (!+[VCHardwareSettings isMediaRecordingSupported](VCHardwareSettings, "isMediaRecordingSupported"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaRecorderHistory initWithDelegateQueue:].cold.1();
    }
    goto LABEL_10;
  }
  CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
  *((_QWORD *)v4 + 1) = dispatch_queue_create_with_target_V2("com.apple.AVConference.VCMediaRecorderHistory.recordingQueue", 0, CustomRootQueue);
  if (!objc_msgSend(v4, "setUpDelegateQueue:", a3)
    || (*((_QWORD *)v4 + 3) = objc_alloc_init(MEMORY[0x1E0C99E08]),
        *((_QWORD *)v4 + 10) = objc_alloc_init(MEMORY[0x1E0C99E08]),
        *((_QWORD *)v4 + 11) = objc_alloc_init(MEMORY[0x1E0C99E08]),
        !objc_msgSend(v4, "setUpAudioBuffers"))
    || !objc_msgSend(v4, "setUpVideoBuffers"))
  {
LABEL_10:

    return 0;
  }
  *((_QWORD *)v4 + 6) = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  *((_WORD *)v4 + 80) = 257;
  *(_QWORD *)(v4 + 284) = 0x8000000000;
  return (VCMediaRecorderHistory *)v4;
}

- (void)dealloc
{
  NSObject *recordingQueue;
  NSObject *delegateQueue;
  VideoAttributes *targetScreenAttributes;
  __CFAllocator *audioSampleBufferAllocator;
  opaqueCMFormatDescription *figFormat;
  opaqueCMFormatDescription *v8;
  __CFAllocator *frameAllocator;
  objc_super v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  recordingQueue = self->_recordingQueue;
  if (recordingQueue)
    dispatch_release(recordingQueue);
  delegateQueue = self->_delegateQueue;
  if (delegateQueue)
    dispatch_release(delegateQueue);

  self->_pendingRequests = 0;
  self->_masterTransactionID = 0;
  -[VCMediaRecorderHistory cleanupTransferSession](self, "cleanupTransferSession");
  targetScreenAttributes = self->_targetScreenAttributes;
  if (targetScreenAttributes)
    CFRelease(targetScreenAttributes);
  audioSampleBufferAllocator = self->_audioSampleBufferAllocator;
  if (audioSampleBufferAllocator)
    CFRelease(audioSampleBufferAllocator);
  figFormat = self->_localFormat.figFormat;
  if (figFormat)
    CFRelease(figFormat);
  v8 = self->_remoteFormat.figFormat;
  if (v8)
    CFRelease(v8);
  frameAllocator = self->_frameAllocator;
  if (frameAllocator)
  {
    CFRelease(frameAllocator);
    self->_frameAllocator = 0;
  }
  v10.receiver = self;
  v10.super_class = (Class)VCMediaRecorderHistory;
  -[VCMediaRecorderHistory dealloc](&v10, sel_dealloc);
}

uint64_t __VCMediaRecorderHistory_AddAudioSampleBuffer_block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = 64;
  if (!*(_BYTE *)(a1 + 52))
    v1 = 72;
  VCMediaRecorderHistoryBuffer_UpdateBufferWithSample(*(_QWORD *)(*(_QWORD *)(a1 + 32) + v1), *(const void **)(a1 + 40), *(_DWORD *)(a1 + 48));
  return FigSampleBufferRelease();
}

uint64_t __VCMediaRecorderHistory_AddLocalVideoSampleBuffer_block_invoke(uint64_t a1)
{
  uint64_t v2;
  __CVBuffer *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  void *SampleBufferWithPixelBuffer;
  const __CFDictionary *Mutable;
  __int128 v11;
  __CVBuffer *ImageBuffer;
  const char *v13;
  char *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  __int128 v24;
  uint64_t v25;
  char *__lasts;
  __int128 v27;
  __int128 v28;
  _BYTE buf[24];
  int v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  char *v34;
  char *v35[2];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(__CVBuffer **)(a1 + 40);
  v4 = *(unsigned __int8 *)(a1 + 84);
  v5 = *(_DWORD *)(a1 + 80);
  v24 = *(_OWORD *)(a1 + 56);
  v25 = *(_QWORD *)(a1 + 72);
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
        *(_QWORD *)&buf[4] = v6;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "_VCMediaRecorderHistory_UpdateVideoBuffer";
        *(_WORD *)&buf[22] = 1024;
        v30 = 1155;
        v31 = 1024;
        LODWORD(v32) = v5;
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Updating video buffer for timestamp %d", buf, 0x22u);
      }
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      __VCMediaRecorderHistory_AddLocalVideoSampleBuffer_block_invoke_cold_3();
    }
  }
  if (*(_BYTE *)(v2 + 280))
  {
    SampleBufferWithPixelBuffer = (void *)FigSampleBufferRetain();
LABEL_10:
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 4, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    if (FigCFDictionarySetInt32())
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          __VCMediaRecorderHistory_AddLocalVideoSampleBuffer_block_invoke_cold_2();
      }
    }
    else
    {
      CMSetAttachments(SampleBufferWithPixelBuffer, Mutable, 0);
      VCMediaRecorderHistoryBuffer_UpdateBufferWithSample(*(_QWORD *)(v2 + 56), SampleBufferWithPixelBuffer, v5);
      if (*(_BYTE *)(v2 + 161))
      {
        dispatch_assert_queue_V2(*(dispatch_queue_t *)(v2 + 8));
        if (*(_BYTE *)(v2 + 160))
        {
          v11 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
          v27 = *MEMORY[0x1E0C9D648];
          v28 = v11;
          ImageBuffer = CMSampleBufferGetImageBuffer((CMSampleBufferRef)SampleBufferWithPixelBuffer);
          VideoUtil_GetVisibleRect(ImageBuffer, (double *)&v27);
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v35[0] = 0;
            v13 = objc_msgSend((id)v2, "_getActiveWriters")
                ? (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)v2, "_getActiveWriters"), "description"), "UTF8String"): "<nil>";
            asprintf(v35, "%s", v13);
            if (v35[0])
            {
              __lasts = 0;
              v14 = strtok_r(v35[0], "\n", &__lasts);
              do
              {
                if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
                {
                  v15 = VRTraceErrorLogLevelToCSTR();
                  v16 = *MEMORY[0x1E0CF2758];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136316162;
                    *(_QWORD *)&buf[4] = v15;
                    *(_WORD *)&buf[12] = 2080;
                    *(_QWORD *)&buf[14] = "_VCMediaRecorderHistory_SetUpWritersWithFirstFrame";
                    *(_WORD *)&buf[22] = 1024;
                    v30 = 1241;
                    v31 = 2080;
                    v32 = "_getActiveWriters";
                    v33 = 2080;
                    v34 = v14;
                    _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s %s", buf, 0x30u);
                  }
                }
                v14 = strtok_r(0, "\n", &__lasts);
              }
              while (v14);
              free(v35[0]);
            }
          }
          v37 = 0u;
          v38 = 0u;
          *(_OWORD *)v35 = 0u;
          v36 = 0u;
          v17 = (void *)objc_msgSend((id)v2, "_getActiveWriters");
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", v35, buf, 16);
          if (v18)
          {
            v19 = v18;
            v20 = *(_QWORD *)v36;
            do
            {
              for (i = 0; i != v19; ++i)
              {
                if (*(_QWORD *)v36 != v20)
                  objc_enumerationMutation(v17);
                v22 = *(void **)&v35[1][8 * i];
                if (v22 != *(void **)(v2 + 32))
                  VCMediaWriterUtil_SetUpWriterWithCaptureFormat(v22, v4, *(_DWORD *)(v2 + 156), *(_DWORD *)(v2 + 152), *(unsigned __int8 *)(v2 + 160), *(double *)&v27, *((double *)&v27 + 1), *(double *)&v28, *((double *)&v28 + 1));
              }
              v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", v35, buf, 16);
            }
            while (v19);
          }
        }
        *(_BYTE *)(v2 + 161) = 0;
      }
    }
    FigSampleBufferRelease();
    if (Mutable)
      CFRelease(Mutable);
    goto LABEL_36;
  }
  _VCMediaRecorderHistory_SetVisibleRect(v2, v3);
  *(_OWORD *)buf = v24;
  *(_QWORD *)&buf[16] = v25;
  SampleBufferWithPixelBuffer = createSampleBufferWithPixelBuffer(v3, (__int128 *)buf);
  if (SampleBufferWithPixelBuffer)
    goto LABEL_10;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      __VCMediaRecorderHistory_AddLocalVideoSampleBuffer_block_invoke_cold_1();
  }
  FigSampleBufferRelease();
LABEL_36:
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 40));
  return FigSampleBufferRelease();
}

- (void)setFrameRate:(float)a3
{
  NSObject *recordingQueue;
  _QWORD block[5];
  float v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  recordingQueue = self->_recordingQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__VCMediaRecorderHistory_setFrameRate___block_invoke;
  block[3] = &unk_1E9E52300;
  block[4] = self;
  v5 = a3;
  dispatch_async(recordingQueue, block);
}

VCMediaRecorderHistoryBuffer *__39__VCMediaRecorderHistory_setFrameRate___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  double v4;
  VCMediaRecorderHistoryBuffer *result;
  int v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  double v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) = 0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(float *)(a1 + 40);
      v6 = 136315906;
      v7 = v2;
      v8 = 2080;
      v9 = "-[VCMediaRecorderHistory setFrameRate:]_block_invoke";
      v10 = 1024;
      v11 = 356;
      v12 = 2048;
      v13 = v4;
      _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d frameRate=%f", (uint8_t *)&v6, 0x26u);
    }
  }
  result = -[VCMediaRecorderHistoryBuffer initWithDelegate:bufferLength:]([VCMediaRecorderHistoryBuffer alloc], "initWithDelegate:bufferLength:", *(_QWORD *)(a1 + 32), (int)(float)((float)(*(float *)(a1 + 40) * 3.0) * 0.5));
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) = result;
  return result;
}

- (void)takePhotoWithContext:(id)a3 completionHandler:(id)a4
{
  NSObject *recordingQueue;
  _QWORD *v8;
  const __CFString *v9;
  uint64_t v10;
  NSObject *v11;
  _QWORD v12[6];
  int v13;
  _QWORD block[7];
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  VCMediaRecorderHistory *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  MEMORY[0x1DF087EC4](&dword_1D8A54000, "-[VCMediaRecorderHistory takePhotoWithContext:completionHandler:]");
  if (a3)
  {
    recordingQueue = self->_recordingQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __65__VCMediaRecorderHistory_takePhotoWithContext_completionHandler___block_invoke;
    block[3] = &unk_1E9E53358;
    block[4] = a3;
    block[5] = self;
    block[6] = a4;
    v8 = block;
LABEL_3:
    dispatch_async(recordingQueue, v8);
    return;
  }
  if ((VCMediaRecorderHistory *)objc_opt_class() != self)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v9 = (const __CFString *)-[VCMediaRecorderHistory performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v9 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v16 = v10;
        v17 = 2080;
        v18 = "-[VCMediaRecorderHistory takePhotoWithContext:completionHandler:]";
        v19 = 1024;
        v20 = 368;
        v21 = 2112;
        v22 = v9;
        v23 = 2048;
        v24 = self;
        _os_log_error_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Invalid request context passed", buf, 0x30u);
        if (!a4)
          return;
        goto LABEL_16;
      }
    }
LABEL_15:
    if (a4)
      goto LABEL_16;
    return;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() < 3)
    goto LABEL_15;
  VRTraceErrorLogLevelToCSTR();
  if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
    goto LABEL_15;
  -[VCMediaRecorderHistory takePhotoWithContext:completionHandler:].cold.1();
  if (a4)
  {
LABEL_16:
    recordingQueue = self->_recordingQueue;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __65__VCMediaRecorderHistory_takePhotoWithContext_completionHandler___block_invoke_2;
    v12[3] = &unk_1E9E533A8;
    v12[4] = self;
    v12[5] = a4;
    v13 = -7;
    v8 = v12;
    goto LABEL_3;
  }
}

void __65__VCMediaRecorderHistory_takePhotoWithContext_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  const __CFString *v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  _QWORD block[7];
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  const __CFString *v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 40), "writeToFileWithTimestamp:transactionID:directoryURL:imageType:", objc_msgSend(*(id *)(a1 + 32), "timestamp"), objc_msgSend(*(id *)(a1 + 32), "transactionID"), objc_msgSend(*(id *)(a1 + 32), "deserializeDirectoryURL"), *(unsigned int *)(*(_QWORD *)(a1 + 40) + 164));
  if (v2)
    v3 = 6;
  else
    v3 = 3;
  if (objc_opt_class() == *(_QWORD *)(a1 + 40))
  {
    if (v3 > (int)VRTraceGetErrorLogLevelForModule())
      goto LABEL_13;
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    v7 = *MEMORY[0x1E0CF2758];
    if (!v2)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        __65__VCMediaRecorderHistory_takePhotoWithContext_completionHandler___block_invoke_cold_1();
      goto LABEL_24;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v21 = v5;
      v22 = 2080;
      v23 = "-[VCMediaRecorderHistory takePhotoWithContext:completionHandler:]_block_invoke";
      v24 = 1024;
      v25 = 377;
      v26 = 1024;
      LODWORD(v27) = 1;
      v8 = " [%s] %s:%d photo writing to file success=%{BOOL}d";
      v9 = v6;
      v10 = 34;
LABEL_18:
      _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
    }
LABEL_19:
    v15 = 0;
    goto LABEL_25;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = (const __CFString *)objc_msgSend(*(id *)(a1 + 40), "performSelector:", sel_logPrefix);
  else
    v4 = &stru_1E9E58EE0;
  if (v3 <= (int)VRTraceGetErrorLogLevelForModule())
  {
    v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x1E0CF2758];
    v13 = *MEMORY[0x1E0CF2758];
    if (!v2)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v16 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 136316418;
        v21 = v11;
        v22 = 2080;
        v23 = "-[VCMediaRecorderHistory takePhotoWithContext:completionHandler:]_block_invoke";
        v24 = 1024;
        v25 = 377;
        v26 = 2112;
        v27 = v4;
        v28 = 2048;
        v29 = v16;
        v30 = 1024;
        v31 = 0;
        _os_log_error_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) photo writing to file success=%{BOOL}d", buf, 0x36u);
      }
      goto LABEL_24;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 136316418;
      v21 = v11;
      v22 = 2080;
      v23 = "-[VCMediaRecorderHistory takePhotoWithContext:completionHandler:]_block_invoke";
      v24 = 1024;
      v25 = 377;
      v26 = 2112;
      v27 = v4;
      v28 = 2048;
      v29 = v14;
      v30 = 1024;
      v31 = 1;
      v8 = " [%s] %s:%d %@(%p) photo writing to file success=%{BOOL}d";
      v9 = v12;
      v10 = 54;
      goto LABEL_18;
    }
    goto LABEL_19;
  }
LABEL_13:
  if (v2)
    goto LABEL_19;
LABEL_24:
  v15 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("VCMediaRecorderHistory"), -1, 0);
LABEL_25:
  v17 = *(_QWORD *)(a1 + 48);
  if (v17)
  {
    v18 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 16);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __65__VCMediaRecorderHistory_takePhotoWithContext_completionHandler___block_invoke_18;
    block[3] = &unk_1E9E53330;
    block[5] = v15;
    block[6] = v17;
    block[4] = v2;
    dispatch_async(v18, block);
  }
}

uint64_t __65__VCMediaRecorderHistory_takePhotoWithContext_completionHandler___block_invoke_18(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], 0, a1[5]);
}

void __65__VCMediaRecorderHistory_takePhotoWithContext_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD block[5];
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 40);
  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __65__VCMediaRecorderHistory_takePhotoWithContext_completionHandler___block_invoke_3;
  block[3] = &unk_1E9E53380;
  block[1] = 3221225472;
  block[4] = v1;
  v4 = *(_DWORD *)(a1 + 48);
  dispatch_async(v2, block);
}

uint64_t __65__VCMediaRecorderHistory_takePhotoWithContext_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 0, 0, objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("VCMediaRecorderHistory"), *(int *)(a1 + 40), 0));
}

- (void)takeLivePhotoWithContext:(id)a3 completionHandler:(id)a4
{
  NSObject *recordingQueue;
  _QWORD *v8;
  const __CFString *v9;
  uint64_t v10;
  NSObject *v11;
  _QWORD v12[6];
  int v13;
  _QWORD block[7];
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  VCMediaRecorderHistory *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  MEMORY[0x1DF087EC4](&dword_1D8A54000, "-[VCMediaRecorderHistory takeLivePhotoWithContext:completionHandler:]");
  if (a3)
  {
    recordingQueue = self->_recordingQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __69__VCMediaRecorderHistory_takeLivePhotoWithContext_completionHandler___block_invoke;
    block[3] = &unk_1E9E53358;
    block[4] = a3;
    block[5] = self;
    block[6] = a4;
    v8 = block;
LABEL_3:
    dispatch_async(recordingQueue, v8);
    return;
  }
  if ((VCMediaRecorderHistory *)objc_opt_class() != self)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v9 = (const __CFString *)-[VCMediaRecorderHistory performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v9 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v16 = v10;
        v17 = 2080;
        v18 = "-[VCMediaRecorderHistory takeLivePhotoWithContext:completionHandler:]";
        v19 = 1024;
        v20 = 404;
        v21 = 2112;
        v22 = v9;
        v23 = 2048;
        v24 = self;
        _os_log_error_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Invalid request context passed", buf, 0x30u);
        if (!a4)
          return;
        goto LABEL_16;
      }
    }
LABEL_15:
    if (a4)
      goto LABEL_16;
    return;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() < 3)
    goto LABEL_15;
  VRTraceErrorLogLevelToCSTR();
  if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
    goto LABEL_15;
  -[VCMediaRecorderHistory takeLivePhotoWithContext:completionHandler:].cold.1();
  if (a4)
  {
LABEL_16:
    recordingQueue = self->_recordingQueue;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __69__VCMediaRecorderHistory_takeLivePhotoWithContext_completionHandler___block_invoke_2;
    v12[3] = &unk_1E9E533A8;
    v12[4] = self;
    v12[5] = a4;
    v13 = -7;
    v8 = v12;
    goto LABEL_3;
  }
}

void __69__VCMediaRecorderHistory_takeLivePhotoWithContext_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  unsigned int *v5;
  uint64_t v6;
  uint64_t v7;
  const __CFString *v8;
  const __CFString *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  const __CFString *v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[6];
  _BYTE v26[24];
  unsigned __int8 v27;
  __int128 v28;
  __int128 v29;
  _BYTE buf[24];
  int v31;
  __int16 v32;
  const __CFString *v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "transactionID");
  v3 = objc_msgSend(*(id *)(a1 + 32), "deserializeDirectoryURL");
  v4 = objc_msgSend(*(id *)(a1 + 40), "fileURLWithDirectoryURL:transactionID:type:", v3, v2, 3);
  if (!v3)
    objc_msgSend(*(id *)(a1 + 40), "registerDirectoryWithURL:", v4);
  objc_msgSend(*(id *)(a1 + 40), "setCompletionHandler:forTransactionID:", *(_QWORD *)(a1 + 48), v2);
  v28 = 0u;
  v29 = 0u;
  v27 = 0;
  memset(v26, 170, sizeof(v26));
  v5 = *(unsigned int **)(a1 + 40);
  if (v5)
  {
    objc_msgSend(v5, "setUpStillImageWithContext:visibleRect:cameraStatusBit:imageType:", *(_QWORD *)(a1 + 32), &v28, &v27, v5[41]);
    if ((v26[12] & 1) != 0)
    {
      v6 = *(_QWORD *)(a1 + 40);
      v7 = *(_QWORD *)(v6 + 40);
      if (*(_QWORD *)(v6 + 32))
      {
        if (!v7)
        {
          if (objc_opt_class() == *(_QWORD *)(a1 + 40))
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              VRTraceErrorLogLevelToCSTR();
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                __69__VCMediaRecorderHistory_takeLivePhotoWithContext_completionHandler___block_invoke_cold_3();
            }
          }
          else
          {
            if ((objc_opt_respondsToSelector() & 1) != 0)
              v8 = (const __CFString *)objc_msgSend(*(id *)(a1 + 40), "performSelector:", sel_logPrefix);
            else
              v8 = &stru_1E9E58EE0;
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              v16 = VRTraceErrorLogLevelToCSTR();
              v17 = *MEMORY[0x1E0CF2758];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              {
                v23 = *(_QWORD *)(a1 + 40);
                *(_DWORD *)buf = 136316418;
                *(_QWORD *)&buf[4] = v16;
                *(_WORD *)&buf[12] = 2080;
                *(_QWORD *)&buf[14] = "-[VCMediaRecorderHistory takeLivePhotoWithContext:completionHandler:]_block_invoke";
                *(_WORD *)&buf[22] = 1024;
                v31 = 423;
                v32 = 2112;
                v33 = v8;
                v34 = 2048;
                v35 = v23;
                v36 = 2112;
                v37 = v2;
                _os_log_error_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) masterTransactionID is nil while writer is not nil, this shouldn't be happening, but setting %@ to be masterTransactionID", buf, 0x3Au);
              }
            }
          }
          *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40) = objc_msgSend(v2, "copy");
          v6 = *(_QWORD *)(a1 + 40);
        }
        objc_msgSend(*(id *)(v6 + 48), "addObject:", v2);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "setDirectoryURL:", v3);
      }
      else
      {
        if (v7)
        {
          if (objc_opt_class() == *(_QWORD *)(a1 + 40))
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              VRTraceErrorLogLevelToCSTR();
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                __69__VCMediaRecorderHistory_takeLivePhotoWithContext_completionHandler___block_invoke_cold_2();
            }
          }
          else
          {
            if ((objc_opt_respondsToSelector() & 1) != 0)
              v15 = (const __CFString *)objc_msgSend(*(id *)(a1 + 40), "performSelector:", sel_logPrefix);
            else
              v15 = &stru_1E9E58EE0;
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              v18 = VRTraceErrorLogLevelToCSTR();
              v19 = *MEMORY[0x1E0CF2758];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              {
                v24 = *(_QWORD *)(a1 + 40);
                *(_DWORD *)buf = 136316162;
                *(_QWORD *)&buf[4] = v18;
                *(_WORD *)&buf[12] = 2080;
                *(_QWORD *)&buf[14] = "-[VCMediaRecorderHistory takeLivePhotoWithContext:completionHandler:]_block_invoke";
                *(_WORD *)&buf[22] = 1024;
                v31 = 431;
                v32 = 2112;
                v33 = v15;
                v34 = 2048;
                v35 = v24;
                _os_log_error_impl(&dword_1D8A54000, v19, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) masterTransactionID is not nil, this shouldn't be happening", buf, 0x30u);
              }
            }
          }

        }
        *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40) = objc_msgSend(v2, "copy");
        v21 = *(_QWORD *)(a1 + 32);
        v20 = *(void **)(a1 + 40);
        *(_OWORD *)buf = *(_OWORD *)v26;
        *(_QWORD *)&buf[16] = *(_QWORD *)&v26[16];
        objc_msgSend(v20, "setUpWriterWithContext:fileURL:stillImageTime:visibleRect:cameraStatusBit:", v21, v4, buf, v27, v28, v29);
      }
      return;
    }
  }
  else
  {
    memset(v26, 0, sizeof(v26));
  }
  if (objc_opt_class() == *(_QWORD *)(a1 + 40))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __69__VCMediaRecorderHistory_takeLivePhotoWithContext_completionHandler___block_invoke_cold_1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v9 = (const __CFString *)objc_msgSend(*(id *)(a1 + 40), "performSelector:", sel_logPrefix);
    else
      v9 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v22 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 136316162;
        *(_QWORD *)&buf[4] = v10;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "-[VCMediaRecorderHistory takeLivePhotoWithContext:completionHandler:]_block_invoke";
        *(_WORD *)&buf[22] = 1024;
        v31 = 442;
        v32 = 2112;
        v33 = v9;
        v34 = 2048;
        v35 = v22;
        _os_log_error_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) still image time is not valid", buf, 0x30u);
      }
    }
  }
  v12 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("VCMediaRecorderHistory"), -2, 0);
  v13 = *(_QWORD *)(a1 + 48);
  if (v13)
  {
    v14 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 16);
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __69__VCMediaRecorderHistory_takeLivePhotoWithContext_completionHandler___block_invoke_19;
    v25[3] = &unk_1E9E533D0;
    v25[4] = v12;
    v25[5] = v13;
    dispatch_async(v14, v25);
  }
}

uint64_t __69__VCMediaRecorderHistory_takeLivePhotoWithContext_completionHandler___block_invoke_19(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, 0, *(_QWORD *)(a1 + 32));
}

void __69__VCMediaRecorderHistory_takeLivePhotoWithContext_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD block[5];
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 40);
  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __69__VCMediaRecorderHistory_takeLivePhotoWithContext_completionHandler___block_invoke_3;
  block[3] = &unk_1E9E53380;
  block[1] = 3221225472;
  block[4] = v1;
  v4 = *(_DWORD *)(a1 + 48);
  dispatch_async(v2, block);
}

uint64_t __69__VCMediaRecorderHistory_takeLivePhotoWithContext_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 0, 0, objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("VCMediaRecorderHistory"), *(int *)(a1 + 40), 0));
}

+ (unsigned)mediaTypeFromWriterMode:(unsigned __int8)a3
{
  unsigned int v3;
  int v4;

  v3 = (a3 - 1);
  if (v3 >= 4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        +[VCMediaRecorderHistory mediaTypeFromWriterMode:].cold.1();
    }
    LOBYTE(v4) = 0;
  }
  else
  {
    return 0x5040203u >> (8 * v3);
  }
  return v4;
}

+ (unsigned)writerModeFromMediaType:(unsigned __int8)a3
{
  unsigned int v3;
  int v4;
  uint64_t v6;
  NSObject *v7;

  v3 = (a3 - 2);
  if (v3 >= 4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        +[VCMediaRecorderHistory writerModeFromMediaType:].cold.1(v6, a3, v7);
    }
    LOBYTE(v4) = 0;
  }
  else
  {
    return 0x4030102u >> (8 * v3);
  }
  return v4;
}

+ (BOOL)isRecordingOnlyMediaType:(unsigned __int8)a3
{
  return (a3 < 6u) & (0x34u >> a3);
}

- (void)setUpCaptureFormatForWriter:(id)a3 atTimestamp:(unsigned int)a4
{
  uint64_t v4;
  opaqueCMSampleBuffer *v7;
  opaqueCMSampleBuffer *v8;
  const __CFNumber *v9;
  __int128 v10;
  __CVBuffer *ImageBuffer;
  __int128 v12;
  __int128 v13;
  unsigned __int8 valuePtr;
  uint64_t v15;

  v4 = *(_QWORD *)&a4;
  v15 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_recordingQueue);
  v7 = -[VCMediaRecorderHistoryBuffer getClosestSampleForTimestamp:](self->_frameBuffer, "getClosestSampleForTimestamp:", v4);
  if (v7)
  {
    v8 = v7;
    valuePtr = 0;
    v9 = (const __CFNumber *)CMGetAttachment(v7, CFSTR("bCameraStatusBits"), 0);
    CFNumberGetValue(v9, kCFNumberSInt8Type, &valuePtr);
    v10 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
    v12 = *MEMORY[0x1E0C9D648];
    v13 = v10;
    ImageBuffer = CMSampleBufferGetImageBuffer(v8);
    VideoUtil_GetVisibleRect(ImageBuffer, (double *)&v12);
    VCMediaWriterUtil_SetUpWriterWithCaptureFormat(a3, valuePtr, self->_captureWidth, self->_captureHeight, self->_resize, *(double *)&v12, *((double *)&v12 + 1), *(double *)&v13, *((double *)&v13 + 1));
  }
}

- (void)invokeStartCompletionHandler:(id)a3 withErrorCode:(int)a4 ontoRecordingQueue:(BOOL)a5
{
  NSObject *recordingQueue;
  _QWORD v7[6];
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __88__VCMediaRecorderHistory_invokeStartCompletionHandler_withErrorCode_ontoRecordingQueue___block_invoke;
    v7[3] = &unk_1E9E533A8;
    v8 = a4;
    v7[4] = self;
    v7[5] = a3;
    recordingQueue = self->_recordingQueue;
    if (a5)
    {
      dispatch_assert_queue_not_V2(recordingQueue);
      dispatch_async((dispatch_queue_t)self->_recordingQueue, v7);
    }
    else
    {
      dispatch_assert_queue_V2(recordingQueue);
      __88__VCMediaRecorderHistory_invokeStartCompletionHandler_withErrorCode_ontoRecordingQueue___block_invoke((uint64_t)v7);
    }
  }
}

void __88__VCMediaRecorderHistory_invokeStartCompletionHandler_withErrorCode_ontoRecordingQueue___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  v2 = *(int *)(a1 + 48);
  if ((_DWORD)v2)
    v3 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("VCMediaRecorderHistory"), v2, 0);
  else
    v3 = 0;
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __88__VCMediaRecorderHistory_invokeStartCompletionHandler_withErrorCode_ontoRecordingQueue___block_invoke_2;
  block[3] = &unk_1E9E533D0;
  block[4] = v3;
  block[5] = v4;
  dispatch_async(v5, block);
}

uint64_t __88__VCMediaRecorderHistory_invokeStartCompletionHandler_withErrorCode_ontoRecordingQueue___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)dispatchedStartRecordingWithContext:(id)a3 fileURL:(id)a4 completionHandler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  VCFigAssetWriter *v12;
  VCFigAssetWriter *v13;
  uint64_t v14;
  const __CFString *v15;
  uint64_t v16;
  NSObject *v17;
  __int128 v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  const __CFString *v29;
  __int16 v30;
  VCMediaRecorderHistory *v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_recordingQueue);
  v9 = objc_msgSend(a3, "timestamp");
  v10 = objc_msgSend(a3, "transactionID");
  v11 = +[VCMediaRecorderHistory writerModeFromMediaType:](VCMediaRecorderHistory, "writerModeFromMediaType:", objc_msgSend(a3, "mediaType"));
  if (-[NSMutableDictionary objectForKeyedSubscript:](self->_writers, "objectForKeyedSubscript:", v10))
  {
    if ((VCMediaRecorderHistory *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCMediaRecorderHistory dispatchedStartRecordingWithContext:fileURL:completionHandler:].cold.1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v15 = (const __CFString *)-[VCMediaRecorderHistory performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v15 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v16 = VRTraceErrorLogLevelToCSTR();
        v17 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316418;
          v23 = v16;
          v24 = 2080;
          v25 = "-[VCMediaRecorderHistory dispatchedStartRecordingWithContext:fileURL:completionHandler:]";
          v26 = 1024;
          v27 = 559;
          v28 = 2112;
          v29 = v15;
          v30 = 2048;
          v31 = self;
          v32 = 2112;
          v33 = v10;
          _os_log_error_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) writer for transactionID=%@ exists", buf, 0x3Au);
        }
      }
    }
    v14 = 4294967292;
  }
  else
  {
    v12 = VCMediaWriterUtil_NewWriter((uint64_t)a4, v10, +[VideoUtil videoCodecForPayload:](VideoUtil, "videoCodecForPayload:", self->_videoCodec), 1.0);
    if (v12)
    {
      v13 = v12;
      -[VCFigAssetWriter setDirectoryURL:](v12, "setDirectoryURL:", objc_msgSend(a3, "deserializeDirectoryURL"));
      if (a3)
      {
        objc_msgSend(a3, "movieFragmentInterval");
      }
      else
      {
        v20 = 0uLL;
        v21 = 0;
      }
      v18 = v20;
      v19 = v21;
      -[VCFigAssetWriter setMovieFragmentInterval:](v13, "setMovieFragmentInterval:", &v18);
      -[VCFigAssetWriter setupWriterWithMode:](v13, "setupWriterWithMode:", v11);
      -[VCFigAssetWriter setStartRTPTimeStamp:](v13, "setStartRTPTimeStamp:", v9);
      -[VCMediaRecorderHistory setUpCaptureFormatForWriter:atTimestamp:](self, "setUpCaptureFormatForWriter:atTimestamp:", v13, v9);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_writers, "setObject:forKeyedSubscript:", v13, v10);

      -[NSMutableArray addObject:](self->_pendingRequests, "addObject:", v10);
      v14 = 0;
    }
    else
    {
      v14 = 4294967293;
    }
  }
  -[VCMediaRecorderHistory invokeStartCompletionHandler:withErrorCode:ontoRecordingQueue:](self, "invokeStartCompletionHandler:withErrorCode:ontoRecordingQueue:", a5, v14, 0);
}

- (void)startRecordingWithContext:(id)a3 completionHandler:(id)a4
{
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *recordingQueue;
  const __CFString *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  _QWORD block[8];
  char v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  _BYTE v28[18];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    if ((VCMediaRecorderHistory *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCMediaRecorderHistory startRecordingWithContext:completionHandler:].cold.1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v13 = (const __CFString *)-[VCMediaRecorderHistory performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v13 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v17 = VRTraceErrorLogLevelToCSTR();
        v18 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          v22 = v17;
          v23 = 2080;
          v24 = "-[VCMediaRecorderHistory startRecordingWithContext:completionHandler:]";
          v25 = 1024;
          v26 = 584;
          v27 = 2112;
          *(_QWORD *)v28 = v13;
          *(_WORD *)&v28[8] = 2048;
          *(_QWORD *)&v28[10] = self;
          _os_log_error_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Invalid request context passed", buf, 0x30u);
        }
      }
    }
    v16 = 4294967289;
    goto LABEL_22;
  }
  v7 = objc_msgSend(a3, "mediaType");
  if (!+[VCMediaRecorderHistory isRecordingOnlyMediaType:](VCMediaRecorderHistory, "isRecordingOnlyMediaType:", v7))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaRecorderHistory startRecordingWithContext:completionHandler:].cold.2(v14, v7, v15);
    }
    v16 = 4294967290;
LABEL_22:
    -[VCMediaRecorderHistory invokeStartCompletionHandler:withErrorCode:ontoRecordingQueue:](self, "invokeStartCompletionHandler:withErrorCode:ontoRecordingQueue:", a4, v16, 1);
    return;
  }
  v8 = objc_msgSend(a3, "timestamp");
  v9 = objc_msgSend(a3, "transactionID");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v10 = VRTraceErrorLogLevelToCSTR();
    v11 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v22 = v10;
      v23 = 2080;
      v24 = "-[VCMediaRecorderHistory startRecordingWithContext:completionHandler:]";
      v25 = 1024;
      v26 = 590;
      v27 = 1024;
      *(_DWORD *)v28 = v8;
      *(_WORD *)&v28[4] = 2112;
      *(_QWORD *)&v28[6] = VCMediaRecorderUtil_DescriptionForMediaType(v7);
      _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d timestamp=%d, mediaType=%@", buf, 0x2Cu);
    }
  }
  recordingQueue = self->_recordingQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__VCMediaRecorderHistory_startRecordingWithContext_completionHandler___block_invoke;
  block[3] = &unk_1E9E533F8;
  block[4] = a3;
  block[5] = self;
  v20 = v7;
  block[6] = v9;
  block[7] = a4;
  dispatch_async(recordingQueue, block);
}

uint64_t __70__VCMediaRecorderHistory_startRecordingWithContext_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = objc_msgSend(*(id *)(a1 + 32), "deserializeDirectoryURL");
  v3 = objc_msgSend(*(id *)(a1 + 40), "fileURLWithDirectoryURL:transactionID:type:", v2, *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 64));
  if (!v2)
    objc_msgSend(*(id *)(a1 + 40), "registerDirectoryWithURL:", v3);
  return objc_msgSend(*(id *)(a1 + 40), "dispatchedStartRecordingWithContext:fileURL:completionHandler:", *(_QWORD *)(a1 + 32), v3, *(_QWORD *)(a1 + 56));
}

- (void)endRecording:(id)a3 timestamp:(unsigned int)a4 completionHandler:(id)a5
{
  uint64_t v9;
  NSObject *v10;
  NSObject *recordingQueue;
  _QWORD v12[7];
  unsigned int v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  unsigned int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v15 = v9;
      v16 = 2080;
      v17 = "-[VCMediaRecorderHistory endRecording:timestamp:completionHandler:]";
      v18 = 1024;
      v19 = 613;
      v20 = 1024;
      v21 = a4;
      _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d timestamp=%d", buf, 0x22u);
    }
  }
  recordingQueue = self->_recordingQueue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __67__VCMediaRecorderHistory_endRecording_timestamp_completionHandler___block_invoke;
  v12[3] = &unk_1E9E53420;
  v12[4] = self;
  v12[5] = a3;
  v12[6] = a5;
  v13 = a4;
  dispatch_async(recordingQueue, v12);
  VCMediaRecorderHistory_ClearHistoryBuffer((uint64_t)self);
}

void __67__VCMediaRecorderHistory_endRecording_timestamp_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  if (v2)
  {
    v3 = (void *)v2;
    objc_msgSend(*(id *)(a1 + 32), "setCompletionHandler:forTransactionID:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
    objc_msgSend(v3, "setEndRTPTimestampWithTimestamp:", *(unsigned int *)(a1 + 56));
  }
  else
  {
    v4 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("VCMediaRecorderHistory"), -5, 0);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __67__VCMediaRecorderHistory_endRecording_timestamp_completionHandler___block_invoke_cold_1();
    }
    v5 = *(_QWORD *)(a1 + 48);
    if (v5)
    {
      v6 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __67__VCMediaRecorderHistory_endRecording_timestamp_completionHandler___block_invoke_24;
      block[3] = &unk_1E9E533D0;
      block[4] = v4;
      block[5] = v5;
      dispatch_async(v6, block);
    }
  }
}

uint64_t __67__VCMediaRecorderHistory_endRecording_timestamp_completionHandler___block_invoke_24(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, 0, *(_QWORD *)(a1 + 32));
}

- (id)_getActiveWriters
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = v3;
  if (self->_writer)
    objc_msgSend(v3, "addObject:");
  objc_msgSend(v4, "addObjectsFromArray:", -[NSMutableDictionary allValues](self->_writers, "allValues"));
  return v4;
}

- (void)historyBuffer:(id)a3 didDequeueSample:(opaqueCMSampleBuffer *)a4 timestamp:(unsigned int)a5
{
  uint64_t v6;
  uint64_t v9;
  __CFString *v10;
  const char *v11;
  const char *v12;
  const char *v13;
  char *v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  char *v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  const __CFString *v28;
  uint64_t v29;
  NSObject *v30;
  _QWORD v31[5];
  char *__lasts;
  char *__str;
  _BYTE v34[128];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  uint64_t v40;
  __int16 v41;
  const char *v42;
  __int16 v43;
  int v44;
  __int16 v45;
  const char *v46;
  __int16 v47;
  VCMediaRecorderHistory *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    v6 = *(_QWORD *)&a5;
    v9 = -[VCMediaRecorderHistory _mediaTypeForBuffer:](self, "_mediaTypeForBuffer:");
    if ((VCMediaRecorderHistory *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
      {
        __str = 0;
        v11 = -[VCMediaRecorderHistory _getActiveWriters](self, "_getActiveWriters")
            ? (const char *)objc_msgSend((id)objc_msgSend(-[VCMediaRecorderHistory _getActiveWriters](self, "_getActiveWriters"), "description"), "UTF8String"): "<nil>";
        asprintf(&__str, "%s", v11);
        if (__str)
        {
          __lasts = 0;
          v18 = strtok_r(__str, "\n", &__lasts);
          do
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
            {
              v19 = VRTraceErrorLogLevelToCSTR();
              v20 = *MEMORY[0x1E0CF2758];
              v21 = *MEMORY[0x1E0CF2758];
              if (*MEMORY[0x1E0CF2748])
              {
                if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136316162;
                  v40 = v19;
                  v41 = 2080;
                  v42 = "-[VCMediaRecorderHistory historyBuffer:didDequeueSample:timestamp:]";
                  v43 = 1024;
                  v44 = 651;
                  v45 = 2080;
                  v46 = "_getActiveWriters";
                  v47 = 2080;
                  v48 = (VCMediaRecorderHistory *)v18;
                  _os_log_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s %s", buf, 0x30u);
                }
              }
              else if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 136316162;
                v40 = v19;
                v41 = 2080;
                v42 = "-[VCMediaRecorderHistory historyBuffer:didDequeueSample:timestamp:]";
                v43 = 1024;
                v44 = 651;
                v45 = 2080;
                v46 = "_getActiveWriters";
                v47 = 2080;
                v48 = (VCMediaRecorderHistory *)v18;
                _os_log_debug_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_DEBUG, " [%s] %s:%d %s %s", buf, 0x30u);
              }
            }
            v18 = strtok_r(0, "\n", &__lasts);
          }
          while (v18);
          goto LABEL_33;
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v10 = (__CFString *)-[VCMediaRecorderHistory performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v10 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
      {
        __str = 0;
        v12 = (const char *)-[__CFString UTF8String](v10, "UTF8String");
        v13 = -[VCMediaRecorderHistory _getActiveWriters](self, "_getActiveWriters")
            ? (const char *)objc_msgSend((id)objc_msgSend(-[VCMediaRecorderHistory _getActiveWriters](self, "_getActiveWriters"), "description"), "UTF8String"): "<nil>";
        asprintf(&__str, "%s(%p) %s", v12, self, v13);
        if (__str)
        {
          __lasts = 0;
          v14 = strtok_r(__str, "\n", &__lasts);
          do
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
            {
              v15 = VRTraceErrorLogLevelToCSTR();
              v16 = *MEMORY[0x1E0CF2758];
              v17 = *MEMORY[0x1E0CF2758];
              if (*MEMORY[0x1E0CF2748])
              {
                if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136316162;
                  v40 = v15;
                  v41 = 2080;
                  v42 = "-[VCMediaRecorderHistory historyBuffer:didDequeueSample:timestamp:]";
                  v43 = 1024;
                  v44 = 651;
                  v45 = 2080;
                  v46 = "_getActiveWriters";
                  v47 = 2080;
                  v48 = (VCMediaRecorderHistory *)v14;
                  _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s %s", buf, 0x30u);
                }
              }
              else if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 136316162;
                v40 = v15;
                v41 = 2080;
                v42 = "-[VCMediaRecorderHistory historyBuffer:didDequeueSample:timestamp:]";
                v43 = 1024;
                v44 = 651;
                v45 = 2080;
                v46 = "_getActiveWriters";
                v47 = 2080;
                v48 = (VCMediaRecorderHistory *)v14;
                _os_log_debug_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEBUG, " [%s] %s:%d %s %s", buf, 0x30u);
              }
            }
            v14 = strtok_r(0, "\n", &__lasts);
          }
          while (v14);
LABEL_33:
          free(__str);
        }
      }
    }
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v22 = -[VCMediaRecorderHistory _getActiveWriters](self, "_getActiveWriters");
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v35, v34, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v36 != v25)
            objc_enumerationMutation(v22);
          v27 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
          if (self->_localAudioBuffer == a3
            && objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * i), "shouldFinishWritingSampleBuffer:RTPtimeStamp:mediaType:", a4, v6, v9))
          {
            v31[0] = MEMORY[0x1E0C809B0];
            v31[1] = 3221225472;
            v31[2] = __67__VCMediaRecorderHistory_historyBuffer_didDequeueSample_timestamp___block_invoke;
            v31[3] = &unk_1E9E53448;
            v31[4] = self;
            objc_msgSend(v27, "finishWritingWithHandler:", v31);
          }
          else if (objc_msgSend(v27, "shouldAppendSampleBuffer:RTPtimeStamp:mediaType:", a4, v6, v9))
          {
            -[VCMediaRecorderHistory appendSampleWithWriter:buffer:sample:mediaType:](self, "appendSampleWithWriter:buffer:sample:mediaType:", v27, a3, a4, v9);
          }
        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v35, v34, 16);
      }
      while (v24);
    }
    return;
  }
  if ((VCMediaRecorderHistory *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaRecorderHistory historyBuffer:didDequeueSample:timestamp:].cold.1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v28 = (const __CFString *)-[VCMediaRecorderHistory performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v28 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v29 = VRTraceErrorLogLevelToCSTR();
      v30 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v40 = v29;
        v41 = 2080;
        v42 = "-[VCMediaRecorderHistory historyBuffer:didDequeueSample:timestamp:]";
        v43 = 1024;
        v44 = 647;
        v45 = 2112;
        v46 = (const char *)v28;
        v47 = 2048;
        v48 = self;
        _os_log_error_impl(&dword_1D8A54000, v30, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) sample is NULL", buf, 0x30u);
      }
    }
  }
}

uint64_t __67__VCMediaRecorderHistory_historyBuffer_didDequeueSample_timestamp___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "handlePendingRequestsWithSourceURL:error:", a2, a3);
}

- (void)dispatchedFinishWritingAllRequests
{
  id v3;
  __CFString *v4;
  const char *v5;
  const char *v6;
  const char *v7;
  char *v8;
  os_log_t *v9;
  uint64_t v10;
  NSObject *v11;
  char *v12;
  os_log_t *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  _QWORD v22[5];
  char *__lasts;
  char *__str;
  _BYTE v25[128];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  char *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_recordingQueue);
  v3 = -[VCMediaRecorderHistory _getActiveWriters](self, "_getActiveWriters");
  if ((VCMediaRecorderHistory *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      __str = 0;
      v5 = v3 ? (const char *)objc_msgSend((id)objc_msgSend(v3, "description"), "UTF8String") : "<nil>";
      asprintf(&__str, "%s", v5);
      if (__str)
      {
        __lasts = 0;
        v12 = strtok_r(__str, "\n", &__lasts);
        v13 = (os_log_t *)MEMORY[0x1E0CF2758];
        do
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v14 = VRTraceErrorLogLevelToCSTR();
            v15 = *v13;
            if (os_log_type_enabled(*v13, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136316162;
              v31 = v14;
              v32 = 2080;
              v33 = "-[VCMediaRecorderHistory dispatchedFinishWritingAllRequests]";
              v34 = 1024;
              v35 = 669;
              v36 = 2080;
              v37 = "_getActiveWriters";
              v38 = 2080;
              v39 = v12;
              _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s %s", buf, 0x30u);
            }
          }
          v12 = strtok_r(0, "\n", &__lasts);
        }
        while (v12);
        goto LABEL_26;
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v4 = (__CFString *)-[VCMediaRecorderHistory performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v4 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      __str = 0;
      v6 = (const char *)-[__CFString UTF8String](v4, "UTF8String");
      v7 = v3 ? (const char *)objc_msgSend((id)objc_msgSend(v3, "description"), "UTF8String") : "<nil>";
      asprintf(&__str, "%s(%p) %s", v6, self, v7);
      if (__str)
      {
        __lasts = 0;
        v8 = strtok_r(__str, "\n", &__lasts);
        v9 = (os_log_t *)MEMORY[0x1E0CF2758];
        do
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v10 = VRTraceErrorLogLevelToCSTR();
            v11 = *v9;
            if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136316162;
              v31 = v10;
              v32 = 2080;
              v33 = "-[VCMediaRecorderHistory dispatchedFinishWritingAllRequests]";
              v34 = 1024;
              v35 = 669;
              v36 = 2080;
              v37 = "_getActiveWriters";
              v38 = 2080;
              v39 = v8;
              _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s %s", buf, 0x30u);
            }
          }
          v8 = strtok_r(0, "\n", &__lasts);
        }
        while (v8);
LABEL_26:
        free(__str);
      }
    }
  }
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v16 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v26, v25, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v27;
    v19 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v27 != v18)
          objc_enumerationMutation(v3);
        v21 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        v22[0] = v19;
        v22[1] = 3221225472;
        v22[2] = __60__VCMediaRecorderHistory_dispatchedFinishWritingAllRequests__block_invoke;
        v22[3] = &unk_1E9E53448;
        v22[4] = self;
        objc_msgSend(v21, "finishWritingWithHandler:", v22);
      }
      v17 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v26, v25, 16);
    }
    while (v17);
  }
}

uint64_t __60__VCMediaRecorderHistory_dispatchedFinishWritingAllRequests__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "handlePendingRequestsWithSourceURL:error:", a2, a3);
}

void __VCMediaRecorderHistory_StopProcessingAllRequests_block_invoke(uint64_t a1)
{
  const __CFString *v2;
  uint64_t v3;
  NSObject *v4;
  const char *v5;
  NSObject *v6;
  uint32_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "dispatchedFinishWritingAllRequests");
  if (objc_opt_class() == *(_QWORD *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v11 = 136315650;
        v12 = v3;
        v13 = 2080;
        v14 = "VCMediaRecorderHistory_StopProcessingAllRequests_block_invoke";
        v15 = 1024;
        v16 = 685;
        v5 = " [%s] %s:%d Flushing all requests.";
        v6 = v4;
        v7 = 28;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v11, v7);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v2 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
    else
      v2 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v10 = *(_QWORD *)(a1 + 32);
        v11 = 136316162;
        v12 = v8;
        v13 = 2080;
        v14 = "VCMediaRecorderHistory_StopProcessingAllRequests_block_invoke";
        v15 = 1024;
        v16 = 685;
        v17 = 2112;
        v18 = v2;
        v19 = 2048;
        v20 = v10;
        v5 = " [%s] %s:%d %@(%p) Flushing all requests.";
        v6 = v9;
        v7 = 48;
        goto LABEL_11;
      }
    }
  }
}

void __VCMediaRecorderHistory_ClearHistoryBuffer_block_invoke(uint64_t a1)
{
  const __CFString *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "flushHistoryBuffers");
  if (objc_opt_class() == *(_QWORD *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v5 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "count");
        v13 = 136315906;
        v14 = v3;
        v15 = 2080;
        v16 = "VCMediaRecorderHistory_ClearHistoryBuffer_block_invoke";
        v17 = 1024;
        v18 = 696;
        v19 = 2048;
        v20 = v5;
        v6 = " [%s] %s:%d completionHandlerCount=%lu";
        v7 = v4;
        v8 = 38;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v13, v8);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v2 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
    else
      v2 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v11 = *(_QWORD *)(a1 + 32);
        v12 = objc_msgSend(*(id *)(v11 + 80), "count");
        v13 = 136316418;
        v14 = v9;
        v15 = 2080;
        v16 = "VCMediaRecorderHistory_ClearHistoryBuffer_block_invoke";
        v17 = 1024;
        v18 = 696;
        v19 = 2112;
        v20 = (uint64_t)v2;
        v21 = 2048;
        v22 = v11;
        v23 = 2048;
        v24 = v12;
        v6 = " [%s] %s:%d %@(%p) completionHandlerCount=%lu";
        v7 = v10;
        v8 = 58;
        goto LABEL_11;
      }
    }
  }
}

- (void)cancelRequestWithTransactionID:(id)a3
{
  NSObject *recordingQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  recordingQueue = self->_recordingQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__VCMediaRecorderHistory_cancelRequestWithTransactionID___block_invoke;
  block[3] = &unk_1E9E52238;
  block[4] = self;
  block[5] = a3;
  dispatch_sync(recordingQueue, block);
}

uint64_t __57__VCMediaRecorderHistory_cancelRequestWithTransactionID___block_invoke(uint64_t a1)
{
  __CFString *v2;
  const __CFString *v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  _QWORD v13[5];
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  __CFString *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v2 = (__CFString *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  if (objc_opt_class() == *(_QWORD *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v15 = v4;
        v16 = 2080;
        v17 = "-[VCMediaRecorderHistory cancelRequestWithTransactionID:]_block_invoke";
        v18 = 1024;
        v19 = 703;
        v20 = 2112;
        v21 = v2;
        v6 = " [%s] %s:%d currentWriter=%@";
        v7 = v5;
        v8 = 38;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v3 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
    else
      v3 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v11 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 136316418;
        v15 = v9;
        v16 = 2080;
        v17 = "-[VCMediaRecorderHistory cancelRequestWithTransactionID:]_block_invoke";
        v18 = 1024;
        v19 = 703;
        v20 = 2112;
        v21 = v3;
        v22 = 2048;
        v23 = v11;
        v24 = 2112;
        v25 = v2;
        v6 = " [%s] %s:%d %@(%p) currentWriter=%@";
        v7 = v10;
        v8 = 58;
        goto LABEL_11;
      }
    }
  }
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __57__VCMediaRecorderHistory_cancelRequestWithTransactionID___block_invoke_32;
  v13[3] = &unk_1E9E53448;
  v13[4] = *(_QWORD *)(a1 + 40);
  return -[__CFString finishWritingWithHandler:](v2, "finishWritingWithHandler:", v13);
}

void __57__VCMediaRecorderHistory_cancelRequestWithTransactionID___block_invoke_32(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v5 = 136315906;
      v6 = v2;
      v7 = 2080;
      v8 = "-[VCMediaRecorderHistory cancelRequestWithTransactionID:]_block_invoke";
      v9 = 1024;
      v10 = 705;
      v11 = 2112;
      v12 = v4;
      _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d , %@", (uint8_t *)&v5, 0x26u);
    }
  }
}

- (int)imageType
{
  NSObject *recordingQueue;
  int v3;
  _QWORD block[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  recordingQueue = self->_recordingQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__VCMediaRecorderHistory_imageType__block_invoke;
  block[3] = &unk_1E9E52938;
  block[4] = self;
  block[5] = &v6;
  dispatch_sync(recordingQueue, block);
  v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __35__VCMediaRecorderHistory_imageType__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_DWORD *)(*(_QWORD *)(result + 32) + 164);
  return result;
}

- (void)setImageType:(int)a3
{
  NSObject *recordingQueue;
  _QWORD block[5];
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  recordingQueue = self->_recordingQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__VCMediaRecorderHistory_setImageType___block_invoke;
  block[3] = &unk_1E9E52300;
  block[4] = self;
  v5 = a3;
  dispatch_sync(recordingQueue, block);
}

void __39__VCMediaRecorderHistory_setImageType___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  int v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 164);
      v5 = *(_DWORD *)(a1 + 40);
      v6 = 136316162;
      v7 = v2;
      v8 = 2080;
      v9 = "-[VCMediaRecorderHistory setImageType:]_block_invoke";
      v10 = 1024;
      v11 = 720;
      v12 = 1024;
      v13 = v4;
      v14 = 1024;
      v15 = v5;
      _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Setting image type from %d to %d", (uint8_t *)&v6, 0x28u);
    }
  }
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 164) = *(_DWORD *)(a1 + 40);
}

- (int)videoCodec
{
  NSObject *recordingQueue;
  int v3;
  _QWORD block[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 128;
  recordingQueue = self->_recordingQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__VCMediaRecorderHistory_videoCodec__block_invoke;
  block[3] = &unk_1E9E52938;
  block[4] = self;
  block[5] = &v6;
  dispatch_sync(recordingQueue, block);
  v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __36__VCMediaRecorderHistory_videoCodec__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_DWORD *)(*(_QWORD *)(result + 32) + 288);
  return result;
}

- (void)setVideoCodec:(int)a3
{
  NSObject *recordingQueue;
  _QWORD block[5];
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  recordingQueue = self->_recordingQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__VCMediaRecorderHistory_setVideoCodec___block_invoke;
  block[3] = &unk_1E9E52300;
  block[4] = self;
  v5 = a3;
  dispatch_sync(recordingQueue, block);
}

void __40__VCMediaRecorderHistory_setVideoCodec___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  int v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 288);
      v5 = *(_DWORD *)(a1 + 40);
      v6 = 136316162;
      v7 = v2;
      v8 = 2080;
      v9 = "-[VCMediaRecorderHistory setVideoCodec:]_block_invoke";
      v10 = 1024;
      v11 = 735;
      v12 = 1024;
      v13 = v4;
      v14 = 1024;
      v15 = v5;
      _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Setting video codec from %d to %d", (uint8_t *)&v6, 0x28u);
    }
  }
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 288) = *(_DWORD *)(a1 + 40);
}

- (id)writeToFileWithTimestamp:(unsigned int)a3 transactionID:(id)a4 directoryURL:(id)a5 imageType:(int)a6
{
  uint64_t v6;
  uint64_t v9;
  opaqueCMSampleBuffer *v11;
  __CVBuffer *ImageBuffer;
  __CVBuffer *v13;
  const __CFNumber *v14;
  id v15;
  id v16;
  uint64_t v17;
  NSObject *v18;
  const char *v19;
  unsigned __int8 valuePtr;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v6 = *(_QWORD *)&a6;
  v9 = *(_QWORD *)&a3;
  v32 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_recordingQueue);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCMediaRecorderHistory writeToFileWithTimestamp:transactionID:directoryURL:imageType:].cold.2();
  }
  v11 = -[VCMediaRecorderHistoryBuffer getClosestSampleForTimestamp:](self->_frameBuffer, "getClosestSampleForTimestamp:", v9);
  ImageBuffer = CMSampleBufferGetImageBuffer(v11);
  v13 = CVPixelBufferRetain(ImageBuffer);
  valuePtr = 0;
  v14 = (const __CFNumber *)CMGetAttachment(v11, CFSTR("bCameraStatusBits"), 0);
  CFNumberGetValue(v14, kCFNumberSInt8Type, &valuePtr);
  v15 = +[VideoUtil convertPixelBuffer:toImageType:withAssetIdentifier:cameraStatusBits:allowTimeMetaData:](VideoUtil, "convertPixelBuffer:toImageType:withAssetIdentifier:cameraStatusBits:allowTimeMetaData:", v13, v6, 0, valuePtr, 0);
  CVPixelBufferRelease(v13);
  if (!v15)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaRecorderHistory writeToFileWithTimestamp:transactionID:directoryURL:imageType:].cold.1();
    }
    return 0;
  }
  v16 = -[VCMediaRecorderHistory fileURLWithDirectoryURL:transactionID:type:](self, "fileURLWithDirectoryURL:transactionID:type:", a5, a4, 1);
  if ((objc_msgSend(v15, "writeToURL:atomically:", v16, 1) & 1) == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v17 = VRTraceErrorLogLevelToCSTR();
      v18 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        if (a4)
          v19 = (const char *)objc_msgSend((id)objc_msgSend(a4, "description"), "UTF8String");
        else
          v19 = "<nil>";
        *(_DWORD *)buf = 136316162;
        v23 = v17;
        v24 = 2080;
        v25 = "-[VCMediaRecorderHistory writeToFileWithTimestamp:transactionID:directoryURL:imageType:]";
        v26 = 1024;
        v27 = 766;
        v28 = 2080;
        v29 = v19;
        v30 = 1024;
        v31 = v9;
        _os_log_error_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_ERROR, " [%s] %s:%d write to file failed url is nil for transationID %s, timestamp %d", buf, 0x2Cu);
      }
    }
    return 0;
  }
  return v16;
}

- (id)writeToLivePhotoToFileWithFrame:(__CVBuffer *)a3 transactionID:(id)a4 directoryURL:(id)a5 imageType:(int)a6 cameraStatusBits:(unsigned __int8)a7
{
  uint64_t v7;
  uint64_t v8;
  double Width;
  double Height;
  _BOOL4 v15;
  uint64_t v16;
  NSObject *v17;
  _BOOL4 resize;
  char v19;
  int ErrorLogLevelForModule;
  uint64_t v21;
  NSObject *v22;
  __CVBuffer *ResizeFrame;
  uint64_t v24;
  NSObject *v25;
  CGFloat v26;
  CGFloat v27;
  id v28;
  id v29;
  char v30;
  int v32;
  uint64_t v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  _BYTE v39[10];
  double v40;
  __int16 v41;
  CGFloat v42;
  __int16 v43;
  CGFloat v44;
  uint64_t v45;

  v7 = a7;
  v8 = *(_QWORD *)&a6;
  v45 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_recordingQueue);
  Width = (double)CVPixelBufferGetWidth(a3);
  Height = (double)CVPixelBufferGetHeight(a3);
  v15 = self->_bufferPoolResolution.width == Width && self->_bufferPoolResolution.height == Height;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v16 = VRTraceErrorLogLevelToCSTR();
    v17 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      resize = self->_resize;
      v32 = 136316162;
      v33 = v16;
      v34 = 2080;
      v35 = "-[VCMediaRecorderHistory writeToLivePhotoToFileWithFrame:transactionID:directoryURL:imageType:cameraStatusBits:]";
      v36 = 1024;
      v37 = 786;
      v38 = 1024;
      *(_DWORD *)v39 = resize;
      *(_WORD *)&v39[4] = 1024;
      *(_DWORD *)&v39[6] = v15;
      _os_log_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d _resize=%d framesMatchLivePhotoResolution=%d", (uint8_t *)&v32, 0x28u);
    }
  }
  v19 = !self->_resize || v15;
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if ((v19 & 1) != 0)
  {
    if (ErrorLogLevelForModule >= 7)
    {
      v21 = VRTraceErrorLogLevelToCSTR();
      v22 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v32 = 136316162;
        v33 = v21;
        v34 = 2080;
        v35 = "-[VCMediaRecorderHistory writeToLivePhotoToFileWithFrame:transactionID:directoryURL:imageType:cameraStatusBits:]";
        v36 = 1024;
        v37 = 792;
        v38 = 2048;
        *(double *)v39 = Width;
        *(_WORD *)&v39[8] = 2048;
        v40 = Height;
        _os_log_impl(&dword_1D8A54000, v22, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Skipping Live Photo crop for input frame (%fx%f)", (uint8_t *)&v32, 0x30u);
      }
    }
    ResizeFrame = CVBufferRetain(a3);
  }
  else
  {
    if (ErrorLogLevelForModule >= 7)
    {
      v24 = VRTraceErrorLogLevelToCSTR();
      v25 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v26 = self->_bufferPoolResolution.width;
        v27 = self->_bufferPoolResolution.height;
        v32 = 136316674;
        v33 = v24;
        v34 = 2080;
        v35 = "-[VCMediaRecorderHistory writeToLivePhotoToFileWithFrame:transactionID:directoryURL:imageType:cameraStatusBits:]";
        v36 = 1024;
        v37 = 788;
        v38 = 2048;
        *(double *)v39 = Width;
        *(_WORD *)&v39[8] = 2048;
        v40 = Height;
        v41 = 2048;
        v42 = v26;
        v43 = 2048;
        v44 = v27;
        _os_log_impl(&dword_1D8A54000, v25, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Cropping input frame (%fx%f) to Live Photo resolution (%fx%f)", (uint8_t *)&v32, 0x44u);
      }
    }
    ResizeFrame = VCMediaRecorderUtil_CreateResizeFrame(a3, self->_transferSession, self->_bufferPool);
    if (!ResizeFrame)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCMediaRecorderHistory writeToLivePhotoToFileWithFrame:transactionID:directoryURL:imageType:cameraStatusBits:].cold.2();
      }
      return 0;
    }
  }
  v28 = +[VideoUtil convertPixelBuffer:toImageType:withAssetIdentifier:cameraStatusBits:allowTimeMetaData:](VideoUtil, "convertPixelBuffer:toImageType:withAssetIdentifier:cameraStatusBits:allowTimeMetaData:", ResizeFrame, v8, a4, v7, 0);
  v29 = -[VCMediaRecorderHistory fileURLWithDirectoryURL:transactionID:type:](self, "fileURLWithDirectoryURL:transactionID:type:", a5, a4, 1);
  v30 = objc_msgSend(v28, "writeToURL:atomically:", v29, 1);
  CVPixelBufferRelease(ResizeFrame);
  if ((v30 & 1) == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaRecorderHistory writeToLivePhotoToFileWithFrame:transactionID:directoryURL:imageType:cameraStatusBits:].cold.1();
    }
    return 0;
  }
  return v29;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)setUpStillImageWithContext:(SEL)a3 visibleRect:(id)a4 cameraStatusBit:(CGRect *)a5 imageType:(char *)a6
{
  uint64_t v7;
  uint64_t v13;
  uint64_t v14;
  opaqueCMSampleBuffer *v15;
  uint64_t v16;
  void *v17;
  const __CFNumber *v18;
  __CVBuffer *ImageBuffer;
  id v20;
  uint64_t v21;
  NSObject *v22;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  NSObject *delegateQueue;
  _QWORD v28[6];
  _QWORD block[6];
  CMTime buf;
  int v31;
  __int16 v32;
  _BOOL4 v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v7 = *(_QWORD *)&a7;
  v36 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_recordingQueue);
  v13 = objc_msgSend(a4, "timestamp");
  v14 = objc_msgSend(a4, "transactionID");
  v15 = -[VCMediaRecorderHistoryBuffer getClosestSampleForTimestamp:](self->_frameBuffer, "getClosestSampleForTimestamp:", v13);
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
  v16 = -[NSMutableDictionary objectForKeyedSubscript:](self->_completionHandlers, "objectForKeyedSubscript:", v14);
  if (v15)
  {
    v17 = (void *)FigSampleBufferRetain();
    v18 = (const __CFNumber *)CMGetAttachment(v17, CFSTR("bCameraStatusBits"), 0);
    CFNumberGetValue(v18, kCFNumberSInt8Type, a6);
    ImageBuffer = CMSampleBufferGetImageBuffer((CMSampleBufferRef)v17);
    CVBufferRetain(ImageBuffer);
    VideoUtil_GetVisibleRect(ImageBuffer, &a5->origin.x);
    if (self->_resize)
      -[VCMediaRecorderHistory setupResizingSessionsWithVisibleRect:cameraStatusBit:](self, "setupResizingSessionsWithVisibleRect:cameraStatusBit:", *a6, a5->origin.x, a5->origin.y, a5->size.width, a5->size.height);
    v20 = -[VCMediaRecorderHistory writeToLivePhotoToFileWithFrame:transactionID:directoryURL:imageType:cameraStatusBits:](self, "writeToLivePhotoToFileWithFrame:transactionID:directoryURL:imageType:cameraStatusBits:", ImageBuffer, v14, objc_msgSend(a4, "deserializeDirectoryURL"), v7, *a6);
    CVBufferRelease(ImageBuffer);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v21 = VRTraceErrorLogLevelToCSTR();
      v22 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf.value) = 136316162;
        *(CMTimeValue *)((char *)&buf.value + 4) = v21;
        LOWORD(buf.flags) = 2080;
        *(_QWORD *)((char *)&buf.flags + 2) = "-[VCMediaRecorderHistory setUpStillImageWithContext:visibleRect:cameraStat"
                                              "usBit:imageType:]";
        HIWORD(buf.epoch) = 1024;
        v31 = 840;
        v32 = 1024;
        v33 = v20 != 0;
        v34 = 2112;
        v35 = v20;
        _os_log_impl(&dword_1D8A54000, v22, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d write to file %d stillImageURL:%@", (uint8_t *)&buf, 0x2Cu);
      }
    }
    if (v20)
    {
      CMSampleBufferGetPresentationTimeStamp(&buf, (CMSampleBufferRef)v17);
      *(CMTime *)retstr = buf;
      FigSampleBufferRelease();
      return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)-[NSMutableDictionary setObject:forKeyedSubscript:](self->_stillImageURLs, "setObject:forKeyedSubscript:", v20, v14);
    }
    else
    {
      v26 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("VCMediaRecorderHistory"), -1, 0);
      delegateQueue = self->_delegateQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __91__VCMediaRecorderHistory_setUpStillImageWithContext_visibleRect_cameraStatusBit_imageType___block_invoke;
      block[3] = &unk_1E9E533D0;
      block[4] = v26;
      block[5] = v16;
      dispatch_async(delegateQueue, block);
      return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)FigSampleBufferRelease();
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaRecorderHistory setUpStillImageWithContext:visibleRect:cameraStatusBit:imageType:].cold.1();
    }
    v24 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("VCMediaRecorderHistory"), -2, 0);
    v25 = self->_delegateQueue;
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __91__VCMediaRecorderHistory_setUpStillImageWithContext_visibleRect_cameraStatusBit_imageType___block_invoke_33;
    v28[3] = &unk_1E9E533D0;
    v28[4] = v24;
    v28[5] = v16;
    dispatch_async(v25, v28);
  }
  return result;
}

uint64_t __91__VCMediaRecorderHistory_setUpStillImageWithContext_visibleRect_cameraStatusBit_imageType___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, 0, *(_QWORD *)(a1 + 32));
}

uint64_t __91__VCMediaRecorderHistory_setUpStillImageWithContext_visibleRect_cameraStatusBit_imageType___block_invoke_33(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, 0, *(_QWORD *)(a1 + 32));
}

- (void)setupResizingSessionsWithVisibleRect:(CGRect)a3 cameraStatusBit:(unsigned __int8)a4
{
  double height;
  double width;
  double y;
  double x;
  __CVPixelBufferPool *bufferPool;
  __CVPixelBufferPool **p_bufferPool;
  double v12;
  double v13;
  CGFloat v14;
  uint64_t v15;
  NSObject *v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  double v24;
  __int16 v25;
  CGFloat v26;
  __int16 v27;
  double v28;
  __int16 v29;
  double v30;
  __int16 v31;
  double v32;
  __int16 v33;
  double v34;
  uint64_t v35;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v35 = *MEMORY[0x1E0C80C00];
  p_bufferPool = &self->_bufferPool;
  bufferPool = self->_bufferPool;
  if (bufferPool)
  {
    CVPixelBufferPoolRelease(bufferPool);
    self->_bufferPool = 0;
    self->_bufferPoolResolution = (CGSize)*MEMORY[0x1E0C9D820];
  }
  v12 = VCMediaWriterUtil_CalculateImageSizeWithVisibleRect(a4, self->_captureWidth, self->_captureHeight, x, y, width, height);
  v14 = v13;
  if (VCMediaRecorderUtil_SetupBufferPool(CFSTR("AVConference:MediaRecorderResize"), p_bufferPool, v12, v13))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaRecorderHistory setupResizingSessionsWithVisibleRect:cameraStatusBit:].cold.1();
    }
  }
  self->_bufferPoolResolution.width = v12;
  self->_bufferPoolResolution.height = v14;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v15 = VRTraceErrorLogLevelToCSTR();
    v16 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v17 = 136317186;
      v18 = v15;
      v19 = 2080;
      v20 = "-[VCMediaRecorderHistory setupResizingSessionsWithVisibleRect:cameraStatusBit:]";
      v21 = 1024;
      v22 = 875;
      v23 = 2048;
      v24 = v12;
      v25 = 2048;
      v26 = v14;
      v27 = 2048;
      v28 = x;
      v29 = 2048;
      v30 = y;
      v31 = 2048;
      v32 = width;
      v33 = 2048;
      v34 = height;
      _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCMediaRecorderHistory visible Width is %f, height %f rect (%f,%f) (%fx%f)", (uint8_t *)&v17, 0x58u);
    }
  }
}

- (void)setUpWriterWithContext:(id)a3 fileURL:(id)a4 stillImageTime:(id *)a5 visibleRect:(CGRect)a6 cameraStatusBit:(unsigned __int8)a7
{
  uint64_t v7;
  double height;
  double width;
  double y;
  double x;
  uint64_t v16;
  uint64_t v17;
  VCMovieWriterProtocol *v18;
  uint64_t v19;
  NSObject *delegateQueue;
  VCMovieWriterProtocol *writer;
  VCMovieWriterProtocol *v22;
  __int128 v23;
  int64_t var3;
  __int128 v25;
  uint64_t v26;
  __int128 v27;
  uint64_t v28;
  _QWORD block[7];

  v7 = a7;
  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  block[6] = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_recordingQueue);
  v16 = objc_msgSend(a3, "transactionID");
  v17 = -[NSMutableDictionary objectForKeyedSubscript:](self->_completionHandlers, "objectForKeyedSubscript:", v16);
  v18 = (VCMovieWriterProtocol *)VCMediaWriterUtil_NewWriter((uint64_t)a4, v16, +[VideoUtil videoCodecForPayload:](VideoUtil, "videoCodecForPayload:", self->_videoCodec), 30.0);
  self->_writer = v18;
  if (v18)
  {
    -[VCMovieWriterProtocol setDirectoryURL:](self->_writer, "setDirectoryURL:", objc_msgSend(a3, "deserializeDirectoryURL"));
    if (a3)
    {
      objc_msgSend(a3, "movieFragmentInterval");
    }
    else
    {
      v27 = 0uLL;
      v28 = 0;
    }
    writer = self->_writer;
    v25 = v27;
    v26 = v28;
    -[VCMovieWriterProtocol setMovieFragmentInterval:](writer, "setMovieFragmentInterval:", &v25);
    VCMediaWriterUtil_SetUpWriterWithCaptureFormat(self->_writer, v7, self->_captureWidth, self->_captureHeight, self->_resize, x, y, width, height);
    -[VCMovieWriterProtocol setupWriterWithMode:](self->_writer, "setupWriterWithMode:", 1);
    v22 = self->_writer;
    v23 = *(_OWORD *)&a5->var0;
    var3 = a5->var3;
    -[VCMovieWriterProtocol setStillImageTime:](v22, "setStillImageTime:", &v23);
  }
  else
  {
    v19 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("VCMediaRecorderHistory"), -3, 0);
    delegateQueue = self->_delegateQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __100__VCMediaRecorderHistory_setUpWriterWithContext_fileURL_stillImageTime_visibleRect_cameraStatusBit___block_invoke;
    block[3] = &unk_1E9E533D0;
    block[4] = v19;
    block[5] = v17;
    dispatch_async(delegateQueue, block);
  }
}

uint64_t __100__VCMediaRecorderHistory_setUpWriterWithContext_fileURL_stillImageTime_visibleRect_cameraStatusBit___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, 0, *(_QWORD *)(a1 + 32));
}

- (id)fileExtensionForMediaType:(unsigned __int8)a3
{
  int v3;

  v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_recordingQueue);
  if ((v3 - 2) < 4)
    return CFSTR("MOV");
  if (v3 != 1)
    return 0;
  if (self->_imageType)
    return CFSTR("heic");
  return CFSTR("JPG");
}

+ (id)fileNameForMediaType:(unsigned __int8)a3 dateString:(id)a4
{
  uint64_t v5;

  if (a3 == 5)
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("moments_%@-audio"), a4, v5);
  else
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s_recording_%@"), VCMediaRecorderUtil_FilePrefixForMediaType(a3), a4);
}

- (id)fileURLWithDirectoryURL:(id)a3 transactionID:(id)a4 type:(unsigned __int8)a5
{
  uint64_t v5;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  id v14;
  const __CFString *v15;
  const __CFString *v16;
  uint64_t v17;
  NSObject *v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  uint64_t v22;
  NSObject *v23;
  int v25;
  uint64_t v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  const __CFString *v32;
  __int16 v33;
  VCMediaRecorderHistory *v34;
  __int16 v35;
  const __CFString *v36;
  _QWORD v37[3];

  v5 = a5;
  v37[2] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  if (!a3)
  {
    v10 = (void *)MEMORY[0x1E0C99E98];
    v37[0] = NSTemporaryDirectory();
    v37[1] = CFSTR("avconference");
    v9 = (id)objc_msgSend(v10, "fileURLWithPathComponents:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 2));
  }
  v11 = objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v12 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v12, "setDateFormat:", CFSTR("MM_dd_HH_mm_ss"));
  objc_msgSend(v12, "setLocale:", objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX")));
  v13 = objc_msgSend(v12, "stringFromDate:", v11);

  v14 = -[VCMediaRecorderHistory fileExtensionForMediaType:](self, "fileExtensionForMediaType:", v5);
  if (!a3)
  {
    v9 = (id)objc_msgSend(v9, "URLByAppendingPathComponent:", a4);
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "URLByStandardizingPath"), "path"), "UTF8String");
    VCDiskUtils_CreateDirectory();
  }
  v15 = (const __CFString *)objc_msgSend((id)objc_msgSend(v9, "URLByAppendingPathComponent:", +[VCMediaRecorderHistory fileNameForMediaType:dateString:](VCMediaRecorderHistory, "fileNameForMediaType:dateString:", v5, v13)), "URLByAppendingPathExtension:", v14);
  if ((VCMediaRecorderHistory *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v17 = VRTraceErrorLogLevelToCSTR();
      v18 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v25 = 136315906;
        v26 = v17;
        v27 = 2080;
        v28 = "-[VCMediaRecorderHistory fileURLWithDirectoryURL:transactionID:type:]";
        v29 = 1024;
        v30 = 960;
        v31 = 2112;
        v32 = v15;
        v19 = " [%s] %s:%d filePath=%@";
        v20 = v18;
        v21 = 38;
LABEL_15:
        _os_log_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_DEFAULT, v19, (uint8_t *)&v25, v21);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v16 = (const __CFString *)-[VCMediaRecorderHistory performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v16 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v22 = VRTraceErrorLogLevelToCSTR();
      v23 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v25 = 136316418;
        v26 = v22;
        v27 = 2080;
        v28 = "-[VCMediaRecorderHistory fileURLWithDirectoryURL:transactionID:type:]";
        v29 = 1024;
        v30 = 960;
        v31 = 2112;
        v32 = v16;
        v33 = 2048;
        v34 = self;
        v35 = 2112;
        v36 = v15;
        v19 = " [%s] %s:%d %@(%p) filePath=%@";
        v20 = v23;
        v21 = 58;
        goto LABEL_15;
      }
    }
  }
  return (id)v15;
}

+ (int)rewriteMovieMetadataWithURL:(id)a3 transactionID:(id)a4
{
  uint64_t v6;
  NSObject *v7;
  const void *MetaDataArrayWithIndentifier;
  const __CFArray *DeepCopy;
  const __CFDictionary *ValueAtIndex;
  const __CFArray *Value;
  void *v12;
  int v13;
  uint64_t v14;
  NSObject *v15;
  int v17;
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v17 = 136315906;
      v18 = v6;
      v19 = 2080;
      v20 = "+[VCMediaRecorderHistory rewriteMovieMetadataWithURL:transactionID:]";
      v21 = 1024;
      v22 = 968;
      v23 = 2112;
      v24 = a4;
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d for %@", (uint8_t *)&v17, 0x26u);
    }
  }
  MetaDataArrayWithIndentifier = (const void *)VCMediaWriterUtil_GetMetaDataArrayWithIndentifier((uint64_t)a4);
  DeepCopy = (const __CFArray *)CFPropertyListCreateDeepCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], MetaDataArrayWithIndentifier, 1uLL);
  ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(DeepCopy, 0);
  Value = (const __CFArray *)CFDictionaryGetValue(ValueAtIndex, (const void *)*MEMORY[0x1E0CC47F8]);
  CFArrayGetValueAtIndex(Value, 0);
  FigCFDictionarySetValue();
  v12 = (void *)FigMetadataRewriterDictionaryCreateFromFigMetadataPropertyArray();
  v13 = FigRewriteMetadata();
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v14 = VRTraceErrorLogLevelToCSTR();
    v15 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v17 = 136316418;
      v18 = v14;
      v19 = 2080;
      v20 = "+[VCMediaRecorderHistory rewriteMovieMetadataWithURL:transactionID:]";
      v21 = 1024;
      v22 = 976;
      v23 = 2112;
      v24 = v12;
      v25 = 2112;
      v26 = a4;
      v27 = 2112;
      v28 = a3;
      _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d rewriteMovieMetadata %@ for transactionID %@ with URL %@", (uint8_t *)&v17, 0x3Au);
    }
  }
  if (DeepCopy)
    CFRelease(DeepCopy);
  if (v12)
    CFRelease(v12);
  if (v13)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        +[VCMediaRecorderHistory rewriteMovieMetadataWithURL:transactionID:].cold.1();
    }
  }
  return v13;
}

- (id)handleCopyRequestWithTransactionID:(id)a3 sourceURL:(id)a4 errorCode:(int *)a5
{
  uint64_t v9;
  id v10;
  const __CFString *v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  uint64_t v17;
  NSObject *v18;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  const char *v27;
  NSObject *v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  uint32_t v36;
  uint64_t v37;
  NSObject *v38;
  uint64_t v39;
  NSObject *v40;
  uint64_t v41;
  void *v42;
  uint8_t buf[4];
  uint64_t v44;
  __int16 v45;
  const char *v46;
  __int16 v47;
  int v48;
  __int16 v49;
  id v50;
  __int16 v51;
  uint64_t v52;
  __int16 v53;
  id v54;
  __int16 v55;
  uint64_t v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_recordingQueue);
  v42 = 0;
  if (objc_msgSend((id)-[VCMovieWriterProtocol transactionID](self->_writer, "transactionID"), "isEqualToString:", a3))
  {
    *a5 = -7;
    if ((VCMediaRecorderHistory *)objc_opt_class() != self)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v20 = (const __CFString *)-[VCMediaRecorderHistory performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v20 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        return 0;
      v31 = VRTraceErrorLogLevelToCSTR();
      v32 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        return 0;
      v33 = -[VCMovieWriterProtocol transactionID](self->_writer, "transactionID");
      *(_DWORD *)buf = 136316674;
      v44 = v31;
      v45 = 2080;
      v46 = "-[VCMediaRecorderHistory handleCopyRequestWithTransactionID:sourceURL:errorCode:]";
      v47 = 1024;
      v48 = 1003;
      v49 = 2112;
      v50 = (id)v20;
      v51 = 2048;
      v52 = (uint64_t)self;
      v53 = 2112;
      v54 = a3;
      v55 = 2112;
      v56 = v33;
      v27 = " [%s] %s:%d %@(%p) Redundant copy - proposed transactionID=%@ matches main writer transactionID=%@";
LABEL_61:
      v28 = v32;
      v36 = 68;
      goto LABEL_62;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      return 0;
    v24 = VRTraceErrorLogLevelToCSTR();
    v25 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      return 0;
    v26 = -[VCMovieWriterProtocol transactionID](self->_writer, "transactionID");
    *(_DWORD *)buf = 136316162;
    v44 = v24;
    v45 = 2080;
    v46 = "-[VCMediaRecorderHistory handleCopyRequestWithTransactionID:sourceURL:errorCode:]";
    v47 = 1024;
    v48 = 1003;
    v49 = 2112;
    v50 = a3;
    v51 = 2112;
    v52 = v26;
    v27 = " [%s] %s:%d Redundant copy - proposed transactionID=%@ matches main writer transactionID=%@";
    v28 = v25;
    goto LABEL_49;
  }
  v9 = +[VCMediaRecorderHistory mediaTypeFromWriterMode:](VCMediaRecorderHistory, "mediaTypeFromWriterMode:", -[VCMovieWriterProtocol writerMode](self->_writer, "writerMode"));
  if (!(_DWORD)v9)
  {
    *a5 = -10;
    if ((VCMediaRecorderHistory *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCMediaRecorderHistory handleCopyRequestWithTransactionID:sourceURL:errorCode:].cold.1();
      }
      return 0;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v21 = (const __CFString *)-[VCMediaRecorderHistory performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v21 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v34 = VRTraceErrorLogLevelToCSTR();
      v35 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v44 = v34;
        v45 = 2080;
        v46 = "-[VCMediaRecorderHistory handleCopyRequestWithTransactionID:sourceURL:errorCode:]";
        v47 = 1024;
        v48 = 1006;
        v49 = 2112;
        v50 = (id)v21;
        v51 = 2048;
        v52 = (uint64_t)self;
        v27 = " [%s] %s:%d %@(%p) Failed to retrieve valid mediaType from writerMode";
        v28 = v35;
LABEL_49:
        v36 = 48;
LABEL_62:
        _os_log_error_impl(&dword_1D8A54000, v28, OS_LOG_TYPE_ERROR, v27, buf, v36);
      }
    }
    return 0;
  }
  v10 = -[VCMediaRecorderHistory fileURLWithDirectoryURL:transactionID:type:](self, "fileURLWithDirectoryURL:transactionID:type:", -[VCMovieWriterProtocol directoryURL](self->_writer, "directoryURL"), a3, v9);
  if ((VCMediaRecorderHistory *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        v44 = v12;
        v45 = 2080;
        v46 = "-[VCMediaRecorderHistory handleCopyRequestWithTransactionID:sourceURL:errorCode:]";
        v47 = 1024;
        v48 = 1010;
        v49 = 2112;
        v50 = a3;
        v51 = 2112;
        v52 = (uint64_t)a4;
        v14 = " [%s] %s:%d copying live photo for transactionID=%@, sourceURL=%@";
        v15 = v13;
        v16 = 48;
LABEL_13:
        _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v11 = (const __CFString *)-[VCMediaRecorderHistory performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v11 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v17 = VRTraceErrorLogLevelToCSTR();
      v18 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316674;
        v44 = v17;
        v45 = 2080;
        v46 = "-[VCMediaRecorderHistory handleCopyRequestWithTransactionID:sourceURL:errorCode:]";
        v47 = 1024;
        v48 = 1010;
        v49 = 2112;
        v50 = (id)v11;
        v51 = 2048;
        v52 = (uint64_t)self;
        v53 = 2112;
        v54 = a3;
        v55 = 2112;
        v56 = (uint64_t)a4;
        v14 = " [%s] %s:%d %@(%p) copying live photo for transactionID=%@, sourceURL=%@";
        v15 = v18;
        v16 = 68;
        goto LABEL_13;
      }
    }
  }
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "copyItemAtURL:toURL:error:", a4, v10, &v42) & 1) == 0)
  {
    *a5 = -8;
    if ((VCMediaRecorderHistory *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v29 = VRTraceErrorLogLevelToCSTR();
        v30 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCMediaRecorderHistory handleCopyRequestWithTransactionID:sourceURL:errorCode:].cold.2(v29, &v42, v30);
      }
      return 0;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v22 = (const __CFString *)-[VCMediaRecorderHistory performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v22 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v37 = VRTraceErrorLogLevelToCSTR();
      v38 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        v44 = v37;
        v45 = 2080;
        v46 = "-[VCMediaRecorderHistory handleCopyRequestWithTransactionID:sourceURL:errorCode:]";
        v47 = 1024;
        v48 = 1012;
        v49 = 2112;
        v50 = (id)v22;
        v51 = 2048;
        v52 = (uint64_t)self;
        v53 = 2112;
        v54 = v42;
        v27 = " [%s] %s:%d %@(%p) copying file failed with error=%@";
        v28 = v38;
        v36 = 58;
        goto LABEL_62;
      }
    }
    return 0;
  }
  if (+[VCMediaRecorderHistory rewriteMovieMetadataWithURL:transactionID:](VCMediaRecorderHistory, "rewriteMovieMetadataWithURL:transactionID:", v10, a3))
  {
    *a5 = -9;
    if (v10)
    {
      if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "removeItemAtURL:error:", v10, &v42)&& !v42)
      {
        return 0;
      }
      if ((VCMediaRecorderHistory *)objc_opt_class() != self)
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v23 = (const __CFString *)-[VCMediaRecorderHistory performSelector:](self, "performSelector:", sel_logPrefix);
        else
          v23 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 3)
          return 0;
        v41 = VRTraceErrorLogLevelToCSTR();
        v32 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          return 0;
        *(_DWORD *)buf = 136316674;
        v44 = v41;
        v45 = 2080;
        v46 = "-[VCMediaRecorderHistory handleCopyRequestWithTransactionID:sourceURL:errorCode:]";
        v47 = 1024;
        v48 = 1022;
        v49 = 2112;
        v50 = (id)v23;
        v51 = 2048;
        v52 = (uint64_t)self;
        v53 = 2112;
        v54 = v10;
        v55 = 2112;
        v56 = (uint64_t)v42;
        v27 = " [%s] %s:%d %@(%p) Failed to remove destinationURL=%@ error=%@";
        goto LABEL_61;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        return 0;
      v39 = VRTraceErrorLogLevelToCSTR();
      v40 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        return 0;
      *(_DWORD *)buf = 136316162;
      v44 = v39;
      v45 = 2080;
      v46 = "-[VCMediaRecorderHistory handleCopyRequestWithTransactionID:sourceURL:errorCode:]";
      v47 = 1024;
      v48 = 1022;
      v49 = 2112;
      v50 = v10;
      v51 = 2112;
      v52 = (uint64_t)v42;
      v27 = " [%s] %s:%d Failed to remove destinationURL=%@ error=%@";
      v28 = v40;
      goto LABEL_49;
    }
  }
  return v10;
}

- (void)handleSinglePendingRequestWithTransactionID:(id)a3 sourceURL:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  id v9;
  VCMediaRecorderHistory *v10;
  const __CFString *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *delegateQueue;
  _QWORD *v23;
  const __CFString *v24;
  const __CFString *v25;
  uint64_t v26;
  NSObject *v27;
  const char *v28;
  NSObject *v29;
  uint32_t v30;
  uint64_t v31;
  NSObject *v32;
  const char *v33;
  NSObject *v34;
  uint32_t v35;
  uint64_t v36;
  NSObject *v37;
  uint64_t v38;
  NSObject *v39;
  int v40;
  uint64_t v41;
  _QWORD v42[6];
  _QWORD block[7];
  int v44;
  uint8_t buf[4];
  uint64_t v46;
  __int16 v47;
  const char *v48;
  __int16 v49;
  int v50;
  __int16 v51;
  id v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  uint64_t v56;
  __int16 v57;
  id v58;
  __int16 v59;
  uint64_t v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_recordingQueue);
  v44 = 0;
  v7 = -[NSMutableDictionary objectForKeyedSubscript:](self->_completionHandlers, "objectForKeyedSubscript:", a3);
  if (v7)
  {
    v8 = v7;
    v9 = a4;
    if (!-[NSMutableDictionary objectForKeyedSubscript:](self->_writers, "objectForKeyedSubscript:", a3))
      v9 = -[VCMediaRecorderHistory handleCopyRequestWithTransactionID:sourceURL:errorCode:](self, "handleCopyRequestWithTransactionID:sourceURL:errorCode:", a3, a4, &v44);
    v10 = (VCMediaRecorderHistory *)objc_opt_class();
    if (v9)
    {
      if (v10 == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 7)
          goto LABEL_16;
        v12 = VRTraceErrorLogLevelToCSTR();
        v13 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_16;
        v14 = -[NSMutableDictionary objectForKeyedSubscript:](self->_writers, "objectForKeyedSubscript:", a3);
        *(_DWORD *)buf = 136316418;
        v46 = v12;
        v47 = 2080;
        v48 = "-[VCMediaRecorderHistory handleSinglePendingRequestWithTransactionID:sourceURL:]";
        v49 = 1024;
        v50 = 1044;
        v51 = 2112;
        v52 = v9;
        v53 = 2112;
        v54 = a3;
        v55 = 2112;
        v56 = v14;
        v15 = " [%s] %s:%d destinationURL=%@ transactionID=%@ writer=%@";
        v16 = v13;
        v17 = 58;
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v11 = (const __CFString *)-[VCMediaRecorderHistory performSelector:](self, "performSelector:", sel_logPrefix);
        else
          v11 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 7)
          goto LABEL_16;
        v18 = VRTraceErrorLogLevelToCSTR();
        v19 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_16;
        v20 = -[NSMutableDictionary objectForKeyedSubscript:](self->_writers, "objectForKeyedSubscript:", a3);
        *(_DWORD *)buf = 136316930;
        v46 = v18;
        v47 = 2080;
        v48 = "-[VCMediaRecorderHistory handleSinglePendingRequestWithTransactionID:sourceURL:]";
        v49 = 1024;
        v50 = 1044;
        v51 = 2112;
        v52 = (id)v11;
        v53 = 2048;
        v54 = self;
        v55 = 2112;
        v56 = (uint64_t)v9;
        v57 = 2112;
        v58 = a3;
        v59 = 2112;
        v60 = v20;
        v15 = " [%s] %s:%d %@(%p) destinationURL=%@ transactionID=%@ writer=%@";
        v16 = v19;
        v17 = 78;
      }
      _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, v15, buf, v17);
LABEL_16:
      v21 = -[NSMutableDictionary objectForKeyedSubscript:](self->_stillImageURLs, "objectForKeyedSubscript:", a3);
      delegateQueue = self->_delegateQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __80__VCMediaRecorderHistory_handleSinglePendingRequestWithTransactionID_sourceURL___block_invoke;
      block[3] = &unk_1E9E53330;
      block[5] = v9;
      block[6] = v8;
      block[4] = v21;
      v23 = block;
LABEL_17:
      dispatch_async(delegateQueue, v23);
      goto LABEL_18;
    }
    if (v10 == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 3
        || (v31 = VRTraceErrorLogLevelToCSTR(),
            v32 = *MEMORY[0x1E0CF2758],
            !os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR)))
      {
LABEL_41:
        if (v44)
          v40 = v44;
        else
          v40 = -7;
        v44 = v40;
        v41 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("VCMediaRecorderHistory"), v40, 0);
        delegateQueue = self->_delegateQueue;
        v42[0] = MEMORY[0x1E0C809B0];
        v42[1] = 3221225472;
        v42[2] = __80__VCMediaRecorderHistory_handleSinglePendingRequestWithTransactionID_sourceURL___block_invoke_2;
        v42[3] = &unk_1E9E533D0;
        v42[4] = v41;
        v42[5] = v8;
        v23 = v42;
        goto LABEL_17;
      }
      *(_DWORD *)buf = 136316162;
      v46 = v31;
      v47 = 2080;
      v48 = "-[VCMediaRecorderHistory handleSinglePendingRequestWithTransactionID:sourceURL:]";
      v49 = 1024;
      v50 = 1043;
      v51 = 2112;
      v52 = a4;
      v53 = 2112;
      v54 = a3;
      v33 = " [%s] %s:%d Failed to obtain a valid destinationURL for sourceURL=%@ transactionID=%@";
      v34 = v32;
      v35 = 48;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v25 = (const __CFString *)-[VCMediaRecorderHistory performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v25 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_41;
      v38 = VRTraceErrorLogLevelToCSTR();
      v39 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        goto LABEL_41;
      *(_DWORD *)buf = 136316674;
      v46 = v38;
      v47 = 2080;
      v48 = "-[VCMediaRecorderHistory handleSinglePendingRequestWithTransactionID:sourceURL:]";
      v49 = 1024;
      v50 = 1043;
      v51 = 2112;
      v52 = (id)v25;
      v53 = 2048;
      v54 = self;
      v55 = 2112;
      v56 = (uint64_t)a4;
      v57 = 2112;
      v58 = a3;
      v33 = " [%s] %s:%d %@(%p) Failed to obtain a valid destinationURL for sourceURL=%@ transactionID=%@";
      v34 = v39;
      v35 = 68;
    }
    _os_log_error_impl(&dword_1D8A54000, v34, OS_LOG_TYPE_ERROR, v33, buf, v35);
    goto LABEL_41;
  }
  if ((VCMediaRecorderHistory *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_18;
    v26 = VRTraceErrorLogLevelToCSTR();
    v27 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_18;
    *(_DWORD *)buf = 136315906;
    v46 = v26;
    v47 = 2080;
    v48 = "-[VCMediaRecorderHistory handleSinglePendingRequestWithTransactionID:sourceURL:]";
    v49 = 1024;
    v50 = 1034;
    v51 = 2112;
    v52 = a3;
    v28 = " [%s] %s:%d handler for transactionID=%@ not found";
    v29 = v27;
    v30 = 38;
    goto LABEL_37;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v24 = (const __CFString *)-[VCMediaRecorderHistory performSelector:](self, "performSelector:", sel_logPrefix);
  else
    v24 = &stru_1E9E58EE0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v36 = VRTraceErrorLogLevelToCSTR();
    v37 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v46 = v36;
      v47 = 2080;
      v48 = "-[VCMediaRecorderHistory handleSinglePendingRequestWithTransactionID:sourceURL:]";
      v49 = 1024;
      v50 = 1034;
      v51 = 2112;
      v52 = (id)v24;
      v53 = 2048;
      v54 = self;
      v55 = 2112;
      v56 = (uint64_t)a3;
      v28 = " [%s] %s:%d %@(%p) handler for transactionID=%@ not found";
      v29 = v37;
      v30 = 58;
LABEL_37:
      _os_log_impl(&dword_1D8A54000, v29, OS_LOG_TYPE_DEFAULT, v28, buf, v30);
    }
  }
LABEL_18:
  if (a3)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_completionHandlers, "setObject:forKeyedSubscript:", 0, a3);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_stillImageURLs, "setObject:forKeyedSubscript:", 0, a3);
  }
}

uint64_t __80__VCMediaRecorderHistory_handleSinglePendingRequestWithTransactionID_sourceURL___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5], 0);
}

uint64_t __80__VCMediaRecorderHistory_handleSinglePendingRequestWithTransactionID_sourceURL___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, 0, *(_QWORD *)(a1 + 32));
}

- (void)handlePendingRequestWithError:(id)a3
{
  NSMutableArray *pendingRequests;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  uint64_t v12;
  NSObject *delegateQueue;
  _QWORD v14[6];
  _BYTE v15[128];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_recordingQueue);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  pendingRequests = self->_pendingRequests;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](pendingRequests, "countByEnumeratingWithState:objects:count:", &v16, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    v9 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(pendingRequests);
        v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        v12 = -[NSMutableDictionary objectForKeyedSubscript:](self->_completionHandlers, "objectForKeyedSubscript:", v11);
        if (v12)
        {
          delegateQueue = self->_delegateQueue;
          v14[0] = v9;
          v14[1] = 3221225472;
          v14[2] = __56__VCMediaRecorderHistory_handlePendingRequestWithError___block_invoke;
          v14[3] = &unk_1E9E533D0;
          v14[4] = a3;
          v14[5] = v12;
          dispatch_async(delegateQueue, v14);
        }
        if (v11)
        {
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_completionHandlers, "setObject:forKeyedSubscript:", 0, v11);
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_stillImageURLs, "setObject:forKeyedSubscript:", 0, v11);
        }
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](pendingRequests, "countByEnumeratingWithState:objects:count:", &v16, v15, 16);
    }
    while (v7);
  }
}

uint64_t __56__VCMediaRecorderHistory_handlePendingRequestWithError___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, 0, *(_QWORD *)(a1 + 32));
}

- (void)handlePendingRequestSuccessWithSourceURL:(id)a3
{
  NSMutableArray *pendingRequests;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  _BYTE v10[128];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  pendingRequests = self->_pendingRequests;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](pendingRequests, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(pendingRequests);
        -[VCMediaRecorderHistory handleSinglePendingRequestWithTransactionID:sourceURL:](self, "handleSinglePendingRequestWithTransactionID:sourceURL:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), a3);
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](pendingRequests, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
    }
    while (v7);
  }
}

- (void)handlePendingRequestsWithSourceURL:(id)a3 error:(id)a4
{
  NSObject *recordingQueue;
  _QWORD v5[8];

  v5[7] = *MEMORY[0x1E0C80C00];
  recordingQueue = self->_recordingQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __67__VCMediaRecorderHistory_handlePendingRequestsWithSourceURL_error___block_invoke;
  v5[3] = &unk_1E9E527D0;
  v5[4] = a4;
  v5[5] = self;
  v5[6] = a3;
  dispatch_async(recordingQueue, v5);
}

void __67__VCMediaRecorderHistory_handlePendingRequestsWithSourceURL_error___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  char *v17;
  os_log_t *v18;
  uint64_t v19;
  NSObject *v20;
  char *__lasts;
  char *__str;
  _QWORD block[8];
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  char *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = a1[4];
  v2 = (void *)a1[5];
  if (v3)
    objc_msgSend(v2, "handlePendingRequestWithError:");
  else
    objc_msgSend(v2, "handlePendingRequestSuccessWithSourceURL:", a1[6]);
  v4 = objc_msgSend(*(id *)(a1[5] + 80), "objectForKeyedSubscript:", *(_QWORD *)(a1[5] + 40));
  v5 = objc_msgSend(*(id *)(a1[5] + 88), "objectForKeyedSubscript:", *(_QWORD *)(a1[5] + 40));
  if (v4)
  {
    v6 = a1[4];
    v7 = *(NSObject **)(a1[5] + 16);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __67__VCMediaRecorderHistory_handlePendingRequestsWithSourceURL_error___block_invoke_2;
    block[3] = &unk_1E9E53470;
    v8 = a1[6];
    block[4] = v5;
    block[5] = v8;
    block[6] = v6;
    block[7] = v4;
    dispatch_async(v7, block);
  }
  v9 = a1[5];
  if (*(_QWORD *)(v9 + 40))
  {
    objc_msgSend(*(id *)(v9 + 80), "setObject:forKeyedSubscript:", 0);
    objc_msgSend(*(id *)(a1[5] + 88), "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1[5] + 40));
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    __str = 0;
    v10 = (_QWORD *)a1[5];
    v11 = (void *)v10[4];
    if (v11)
    {
      v12 = (const char *)objc_msgSend((id)objc_msgSend(v11, "description"), "UTF8String");
      v10 = (_QWORD *)a1[5];
    }
    else
    {
      v12 = "<nil>";
    }
    v13 = (void *)v10[3];
    if (v13)
    {
      v14 = (const char *)objc_msgSend((id)objc_msgSend(v13, "description"), "UTF8String");
      v10 = (_QWORD *)a1[5];
    }
    else
    {
      v14 = "<nil>";
    }
    v15 = (void *)v10[6];
    v16 = v15 ? (const char *)objc_msgSend((id)objc_msgSend(v15, "description"), "UTF8String") : "<nil>";
    asprintf(&__str, "writer=%s writers=%s pendingRequests=%s", v12, v14, v16);
    if (__str)
    {
      __lasts = 0;
      v17 = strtok_r(__str, "\n", &__lasts);
      v18 = (os_log_t *)MEMORY[0x1E0CF2758];
      do
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v19 = VRTraceErrorLogLevelToCSTR();
          v20 = *v18;
          if (os_log_type_enabled(*v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316162;
            v25 = v19;
            v26 = 2080;
            v27 = "-[VCMediaRecorderHistory handlePendingRequestsWithSourceURL:error:]_block_invoke";
            v28 = 1024;
            v29 = 1108;
            v30 = 2080;
            v31 = "";
            v32 = 2080;
            v33 = v17;
            _os_log_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s %s", buf, 0x30u);
          }
        }
        v17 = strtok_r(0, "\n", &__lasts);
      }
      while (v17);
      free(__str);
    }
  }
  objc_msgSend(*(id *)(a1[5] + 24), "removeAllObjects");
  objc_msgSend(*(id *)(a1[5] + 48), "removeAllObjects");

  *(_QWORD *)(a1[5] + 32) = 0;
  *(_QWORD *)(a1[5] + 40) = 0;
}

uint64_t __67__VCMediaRecorderHistory_handlePendingRequestsWithSourceURL_error___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

- (void)flushHistoryBuffers
{
  -[VCMediaRecorderHistoryBuffer flushBuffer](self->_frameBuffer, "flushBuffer");
  -[VCMediaRecorderHistoryBuffer flushBuffer](self->_localAudioBuffer, "flushBuffer");
  -[VCMediaRecorderHistoryBuffer flushBuffer](self->_remoteAudioBuffer, "flushBuffer");
}

- (unsigned)_mediaTypeForBuffer:(id)a3
{
  if (self->_frameBuffer == a3)
    return 3;
  if (self->_localAudioBuffer == a3)
    return 1;
  return 2 * (self->_remoteAudioBuffer == a3);
}

- (void)appendSampleWithWriter:(id)a3 buffer:(id)a4 sample:(opaqueCMSampleBuffer *)a5 mediaType:(unsigned __int8)a6
{
  uint64_t v6;
  const __CFNumber *v9;
  uint64_t v10;
  unsigned __int8 valuePtr;
  uint64_t v12;

  v6 = a6;
  v12 = *MEMORY[0x1E0C80C00];
  if (self->_frameBuffer == a4)
  {
    valuePtr = 0;
    if (a5)
    {
      v9 = (const __CFNumber *)CMGetAttachment(a5, CFSTR("bCameraStatusBits"), 0);
      CFNumberGetValue(v9, kCFNumberSInt8Type, &valuePtr);
      v10 = valuePtr;
    }
    else
    {
      v10 = 0;
    }
    objc_msgSend(a3, "appendVideoSampleBuffer:cameraStatus:mediaType:", a5, v10, v6);
  }
  else
  {
    objc_msgSend(a3, "appendAudioSampleBuffer:mediaType:", a5, a6);
  }
}

- (void)registerDirectoryWithURL:(id)a3
{
  void *v3;
  void *v4;
  int v5;
  int ErrorLogLevelForModule;
  os_log_t *v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  int v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  __int16 v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(a3, "URLByDeletingLastPathComponent");
  v4 = (void *)objc_msgSend(v3, "URLByDeletingLastPathComponent");
  v5 = FigSandboxRegisterDirectoryURL();
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  v7 = (os_log_t *)MEMORY[0x1E0CF2758];
  if (ErrorLogLevelForModule >= 7)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
    {
      if (v3)
        v10 = (const char *)objc_msgSend((id)objc_msgSend(v3, "description"), "UTF8String");
      else
        v10 = "<nil>";
      v15 = 136316162;
      v16 = v8;
      v17 = 2080;
      v18 = "-[VCMediaRecorderHistory registerDirectoryWithURL:]";
      v19 = 1024;
      v20 = 1270;
      v21 = 1024;
      v22 = v5;
      v23 = 2080;
      v24 = v10;
      _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d FigSandboxRegisterDirectoryURL returned %d for %s", (uint8_t *)&v15, 0x2Cu);
    }
  }
  v11 = FigSandboxRegisterDirectoryURL();
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v12 = VRTraceErrorLogLevelToCSTR();
    v13 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
    {
      if (v4)
        v14 = (const char *)objc_msgSend((id)objc_msgSend(v4, "description"), "UTF8String");
      else
        v14 = "<nil>";
      v15 = 136316162;
      v16 = v12;
      v17 = 2080;
      v18 = "-[VCMediaRecorderHistory registerDirectoryWithURL:]";
      v19 = 1024;
      v20 = 1272;
      v21 = 1024;
      v22 = v11;
      v23 = 2080;
      v24 = v14;
      _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d FigSandboxRegisterDirectoryURL returned %d for %s", (uint8_t *)&v15, 0x2Cu);
    }
  }
}

- (void)setCompletionHandler:(id)a3 forTransactionID:(id)a4
{
  void *v6;

  v6 = _Block_copy(a3);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_completionHandlers, "setObject:forKeyedSubscript:", v6, a4);
  _Block_release(v6);
}

- (void)cleanupTransferSession
{
  OpaqueVTPixelTransferSession *transferSession;
  OpaqueVTPixelTransferSession *v4;
  OpaqueVTPixelTransferSession *copyTransferSession;
  OpaqueVTPixelTransferSession *v6;

  transferSession = self->_transferSession;
  if (transferSession)
  {
    VTPixelTransferSessionInvalidate(transferSession);
    v4 = self->_transferSession;
    if (v4)
    {
      CFRelease(v4);
      self->_transferSession = 0;
    }
  }
  copyTransferSession = self->_copyTransferSession;
  if (copyTransferSession)
  {
    VTPixelTransferSessionInvalidate(copyTransferSession);
    v6 = self->_copyTransferSession;
    if (v6)
    {
      CFRelease(v6);
      self->_copyTransferSession = 0;
    }
  }
  CVPixelBufferPoolRelease(self->_bufferPool);
  self->_bufferPool = 0;
  self->_bufferPoolResolution = (CGSize)*MEMORY[0x1E0C9D820];
  CVPixelBufferPoolRelease(self->_copyPool);
  self->_copyPool = 0;
}

- (void)setUpDelegateQueue:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate delegateQueue=%@.");
  OUTLINED_FUNCTION_3();
}

- (void)setUpAudioBuffers
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create audio sample buffer allocator.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setUpVideoBuffers
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate copy transfer session for copy pixel buffer path.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithDelegateQueue:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Attempting to initialize media recorder history on an unsupported device.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __VCMediaRecorderHistory_AddLocalVideoSampleBuffer_block_invoke_cold_1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d , createSampleBufferWithPixelBuffer failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __VCMediaRecorderHistory_AddLocalVideoSampleBuffer_block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "_VCMediaRecorderHistory_UpdateVideoBuffer";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d , set camerabit for attachments failed for sampleBuffer with timestamp %d", v2, *(const char **)v3, (unint64_t)"_VCMediaRecorderHistory_UpdateVideoBuffer" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

void __VCMediaRecorderHistory_AddLocalVideoSampleBuffer_block_invoke_cold_3()
{
  os_log_t v0;
  uint8_t v1[14];
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  v2 = "_VCMediaRecorderHistory_UpdateVideoBuffer";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  _os_log_debug_impl(&dword_1D8A54000, v0, OS_LOG_TYPE_DEBUG, " [%s] %s:%d Updating video buffer for timestamp %d", v1, 0x22u);
  OUTLINED_FUNCTION_3();
}

- (void)takePhotoWithContext:completionHandler:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid request context passed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __65__VCMediaRecorderHistory_takePhotoWithContext_completionHandler___block_invoke_cold_1()
{
  __int16 v0;
  os_log_t v1;
  uint8_t v2[14];
  const char *v3;
  int v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  v3 = "-[VCMediaRecorderHistory takePhotoWithContext:completionHandler:]_block_invoke";
  OUTLINED_FUNCTION_4();
  v4 = 377;
  v5 = v0;
  v6 = 0;
  _os_log_error_impl(&dword_1D8A54000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d photo writing to file success=%{BOOL}d", v2, 0x22u);
  OUTLINED_FUNCTION_3();
}

- (void)takeLivePhotoWithContext:completionHandler:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid request context passed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __69__VCMediaRecorderHistory_takeLivePhotoWithContext_completionHandler___block_invoke_cold_1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d still image time is not valid", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __69__VCMediaRecorderHistory_takeLivePhotoWithContext_completionHandler___block_invoke_cold_2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d masterTransactionID is not nil, this shouldn't be happening", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __69__VCMediaRecorderHistory_takeLivePhotoWithContext_completionHandler___block_invoke_cold_3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d masterTransactionID is nil while writer is not nil, this shouldn't be happening, but setting %@ to be masterTransactionID");
  OUTLINED_FUNCTION_3();
}

+ (void)mediaTypeFromWriterMode:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "+[VCMediaRecorderHistory mediaTypeFromWriterMode:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Passed unexpected writerMode=%hhu", v2, *(const char **)v3, (unint64_t)"+[VCMediaRecorderHistory mediaTypeFromWriterMode:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

+ (void)writerModeFromMediaType:(NSObject *)a3 .cold.1(uint64_t a1, unsigned __int8 a2, NSObject *a3)
{
  uint64_t v4;
  uint8_t v5[14];
  const char *v6;

  OUTLINED_FUNCTION_13(a2, *MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_12_0();
  v6 = "+[VCMediaRecorderHistory writerModeFromMediaType:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_11(&dword_1D8A54000, a3, v4, " [%s] %s:%d Passed unexpected mediaType=%@", v5);
  OUTLINED_FUNCTION_3_0();
}

- (void)dispatchedStartRecordingWithContext:fileURL:completionHandler:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d writer for transactionID=%@ exists");
  OUTLINED_FUNCTION_3();
}

- (void)startRecordingWithContext:completionHandler:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid request context passed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)startRecordingWithContext:(NSObject *)a3 completionHandler:.cold.2(uint64_t a1, unsigned __int8 a2, NSObject *a3)
{
  uint64_t v4;
  uint8_t v5[14];
  const char *v6;

  OUTLINED_FUNCTION_13(a2, *MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_12_0();
  v6 = "-[VCMediaRecorderHistory startRecordingWithContext:completionHandler:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_11(&dword_1D8A54000, a3, v4, " [%s] %s:%d Invalid mediaType=%@ passed in! Only Audio / Video mode is supported!", v5);
  OUTLINED_FUNCTION_3_0();
}

void __67__VCMediaRecorderHistory_endRecording_timestamp_completionHandler___block_invoke_cold_1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d current writer doesn't exist", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)historyBuffer:didDequeueSample:timestamp:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d sample is NULL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)writeToFileWithTimestamp:transactionID:directoryURL:imageType:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCMediaRecorderHistory writeToFileWithTimestamp:transactionID:directoryURL:imageType:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to retrieve the data for timestamp %d", v2, *(const char **)v3, (unint64_t)"-[VCMediaRecorderHistory writeToFileWithTimestamp:transactionID:directoryURL:imageType:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)writeToFileWithTimestamp:transactionID:directoryURL:imageType:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCMediaRecorderHistory writeToFileWithTimestamp:transactionID:directoryURL:imageType:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Write to file timestamp %d", v2, *(const char **)v3, (unint64_t)"-[VCMediaRecorderHistory writeToFileWithTimestamp:transactionID:directoryURL:imageType:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)writeToLivePhotoToFileWithFrame:transactionID:directoryURL:imageType:cameraStatusBits:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to write fileURL=%@");
  OUTLINED_FUNCTION_3();
}

- (void)writeToLivePhotoToFileWithFrame:transactionID:directoryURL:imageType:cameraStatusBits:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d resizedFrame is NULL after resizing", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setUpStillImageWithContext:visibleRect:cameraStatusBit:imageType:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCMediaRecorderHistory setUpStillImageWithContext:visibleRect:cameraStatusBit:imageType:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d can not find such frame for timestamp %d in buffer", v2, *(const char **)v3, (unint64_t)"-[VCMediaRecorderHistory setUpStillImageWithContext:visibleRect:cameraStatusBit:imageType:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)setupResizingSessionsWithVisibleRect:cameraStatusBit:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d , VCMediaRecorderUtil_SetupBufferPool for resizing failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)rewriteMovieMetadataWithURL:transactionID:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "+[VCMediaRecorderHistory rewriteMovieMetadataWithURL:transactionID:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d FigRewriteMetadata failed with err=%d", v2, *(const char **)v3, (unint64_t)"+[VCMediaRecorderHistory rewriteMovieMetadataWithURL:transactionID:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)handleCopyRequestWithTransactionID:sourceURL:errorCode:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to retrieve valid mediaType from writerMode", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)handleCopyRequestWithTransactionID:(uint64_t)a1 sourceURL:(_QWORD *)a2 errorCode:(NSObject *)a3 .cold.2(uint64_t a1, _QWORD *a2, NSObject *a3)
{
  _BYTE v3[24];
  __int128 v4;

  *(_DWORD *)v3 = 136315906;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2080;
  *(_QWORD *)&v3[14] = "-[VCMediaRecorderHistory handleCopyRequestWithTransactionID:sourceURL:errorCode:]";
  *(_WORD *)&v3[22] = 1024;
  LODWORD(v4) = 1012;
  WORD2(v4) = 2112;
  *(_QWORD *)((char *)&v4 + 6) = *a2;
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, (uint64_t)a2, a3, " [%s] %s:%d copying file failed with error=%@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16], v4);
  OUTLINED_FUNCTION_3();
}

@end
