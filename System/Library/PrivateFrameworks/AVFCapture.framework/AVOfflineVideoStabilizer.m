@implementation AVOfflineVideoStabilizer

+ (void)initialize
{
  objc_opt_class();
}

+ (id)offlineVideoStabilizerWithTargetFrameDuration:(id *)a3 dataProvider:(id)a4 destinationBufferPool:(__CVPixelBufferPool *)a5 stabilizationEnabled:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v12;

  v6 = a6;
  v10 = objc_alloc((Class)objc_opt_class());
  v12 = *a3;
  return (id)objc_msgSend(v10, "initWithTargetFrameDuration:dataProvider:destinationBufferPool:stabilizationEnabled:", &v12, a4, a5, v6);
}

- (AVOfflineVideoStabilizer)initWithTargetFrameDuration:(id *)a3 dataProvider:(id)a4 destinationBufferPool:(__CVPixelBufferPool *)a5 stabilizationEnabled:(BOOL)a6
{
  char *v11;
  AVOfflineVideoStabilizer *v12;
  __int128 v13;
  void *v14;
  uint64_t v15;
  void *v16;
  objc_super v18;
  CMTime time2;
  CMTime time1;

  if ((AVCaptureClientHasEntitlement((void *)AVCaptureEntitlementOfflineVideoStabilizer) & 1) != 0)
  {
    if ((a3->var2 & 1) != 0
      && (time1 = (CMTime)*a3, time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68], CMTimeCompare(&time1, &time2) > 0))
    {
      if (a4)
      {
        if (a5)
        {
          v18.receiver = self;
          v18.super_class = (Class)AVOfflineVideoStabilizer;
          v11 = -[AVOfflineVideoStabilizer init](&v18, sel_init);
          v12 = (AVOfflineVideoStabilizer *)v11;
          if (v11)
          {
            v13 = *(_OWORD *)&a3->var0;
            *((_QWORD *)v11 + 3) = a3->var3;
            *(_OWORD *)(v11 + 8) = v13;
            *((_DWORD *)v11 + 9) = 1056964608;
            *((_DWORD *)v11 + 8) = vcvtps_s32_f32((float)a3->var1 / (float)a3->var0);
            *((_QWORD *)v11 + 5) = objc_msgSend(objc_alloc(MEMORY[0x1E0CF2D50]), "initWithReferencedObject:", a4);
            v12->_pixelBufferPool = (__CVPixelBufferPool *)CFRetain(a5);
            v12->_stabilizationEnabled = a6;
            v12->_outputSampleBuffers = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
            v12->_futureFrameMetadataDicts = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
            v12->_isFirstFrame = 1;
          }
          return v12;
        }
        v14 = (void *)MEMORY[0x1E0C99DA0];
        v15 = *MEMORY[0x1E0C99778];
      }
      else
      {
        v14 = (void *)MEMORY[0x1E0C99DA0];
        v15 = *MEMORY[0x1E0C99778];
      }
    }
    else
    {
      v14 = (void *)MEMORY[0x1E0C99DA0];
      v15 = *MEMORY[0x1E0C99778];
    }
  }
  else
  {
    v14 = (void *)MEMORY[0x1E0C99DA0];
    v15 = *MEMORY[0x1E0C99778];
  }
  v16 = (void *)objc_msgSend(v14, "exceptionWithName:reason:userInfo:", v15, AVMethodExceptionReasonWithObjectAndSelector(), 0);

  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v16);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v16);
  return 0;
}

- (void)dealloc
{
  __CVPixelBufferPool *pixelBufferPool;
  opaqueCMFormatDescription *cachedVideoFormatDescription;
  objc_super v5;

  -[AVOfflineVideoStabilizer _teardownVISProcessor](self, "_teardownVISProcessor");

  pixelBufferPool = self->_pixelBufferPool;
  if (pixelBufferPool)
    CFRelease(pixelBufferPool);

  cachedVideoFormatDescription = self->_cachedVideoFormatDescription;
  if (cachedVideoFormatDescription)
    CFRelease(cachedVideoFormatDescription);
  v5.receiver = self;
  v5.super_class = (Class)AVOfflineVideoStabilizer;
  -[AVOfflineVideoStabilizer dealloc](&v5, sel_dealloc);
}

- (opaqueCMSampleBuffer)copyStabilizedSampleBuffer:(id *)a3
{
  opaqueCMSampleBuffer *result;
  unint64_t v6;

  v6 = 0;
  result = -[AVOfflineVideoStabilizer _copyStabilizedSampleBuffer:](self, "_copyStabilizedSampleBuffer:", &v6);
  if ((unint64_t)result | v6)
  {
LABEL_4:
    if (!a3)
      return result;
    goto LABEL_5;
  }
  if (self->_videoOutputFrameNumber == 1)
  {
    result = -[AVOfflineVideoStabilizer _copyStabilizedSampleBuffer:](self, "_copyStabilizedSampleBuffer:", &v6);
    goto LABEL_4;
  }
  result = 0;
  if (!a3)
    return result;
LABEL_5:
  *a3 = (id)v6;
  return result;
}

- (int)preferredSourcePixelBufferPrimingFrameCount
{
  return 2;
}

- (int)preferredSourceStabilizationMetadataPrimingCount
{
  return self->_metadataPrimingCount;
}

- (opaqueCMSampleBuffer)_copyStabilizedSampleBuffer:(id *)a3
{
  void *v4;
  BOOL *p_clientMarkedEndOfMetadata;
  void *v6;
  uint64_t v7;
  int64_t metadataOutputFrameNumber;
  CMTimeEpoch v9;
  id v10;
  int v11;
  int64_t metadataPrimingCount;
  const void *v13;
  opaqueCMSampleBuffer *v14;
  id *v15;
  uint64_t v16;
  int v17;
  void *v18;
  CFTypeID v19;
  VISProcessor *visProcessor;
  __int128 v23;
  CMTime time;
  CMTime v25;
  int v26;

  v26 = 0;
  v4 = (void *)-[AVWeakReference referencedObject](self->_dataProviderWeakReference, "referencedObject");
  p_clientMarkedEndOfMetadata = &self->_clientMarkedEndOfMetadata;
  if (self->_clientMarkedEndOfMetadata)
  {
    v6 = 0;
LABEL_11:
    if (self->_clientMarkedEndOfVideoData)
    {
      v13 = 0;
      v14 = 0;
LABEL_13:
      v15 = a3;
LABEL_17:
      v18 = (void *)-[NSMutableArray firstObject](self->_outputSampleBuffers, "firstObject");
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v18)
        {
          v19 = CFGetTypeID(v18);
          if (v19 != CMSampleBufferGetTypeID())
            goto LABEL_32;
          CMRemoveAttachment(v18, (CFStringRef)*MEMORY[0x1E0D04138]);
          CFRetain(v18);
          -[NSMutableArray removeObjectAtIndex:](self->_outputSampleBuffers, "removeObjectAtIndex:", 0);
        }
LABEL_33:
        v11 = v26;
        goto LABEL_34;
      }
      v26 = objc_msgSend(v18, "intValue");
      -[NSMutableArray removeObjectAtIndex:](self->_outputSampleBuffers, "removeObjectAtIndex:", 0);
LABEL_32:
      v18 = 0;
      goto LABEL_33;
    }
    v16 = -[NSMutableArray firstObject](self->_futureFrameMetadataDicts, "firstObject");
    v25 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
    v13 = (const void *)objc_msgSend(v4, "copySourcePixelBufferForFrameNumber:outputSampleTime:stabilizer:", self->_videoOutputFrameNumber, &v25, self);
    time = v25;
    v26 = -[AVOfflineVideoStabilizer _validateSourcePixelBuffer:withSampleTime:metadata:isEndOfData:](self, "_validateSourcePixelBuffer:withSampleTime:metadata:isEndOfData:", v13, &time, v16, &self->_clientMarkedEndOfVideoData);
    if (v26)
    {
      v14 = 0;
      goto LABEL_31;
    }
    if (self->_clientMarkedEndOfVideoData)
    {
      v17 = -[VISProcessor finishProcessing](self->_visProcessor, "finishProcessing");
      v14 = 0;
      v26 = v17;
      self->_isFirstFrame = 1;
      v15 = a3;
      if (v17)
        goto LABEL_32;
      goto LABEL_17;
    }
    time = v25;
    v14 = -[AVOfflineVideoStabilizer _createSampleBufferWithPixelBuffer:sampleTime:futureMetadata:status:](self, "_createSampleBufferWithPixelBuffer:sampleTime:futureMetadata:status:", v13, &time, v6, &v26);
    if (!v26)
    {
      visProcessor = self->_visProcessor;
      if (!visProcessor)
      {
        v26 = -[AVOfflineVideoStabilizer _setupVISProcessor](self, "_setupVISProcessor");
        if (v26)
          goto LABEL_31;
        visProcessor = self->_visProcessor;
      }
      v26 = -[VISProcessor enqueueBufferForProcessing:](visProcessor, "enqueueBufferForProcessing:", v14);
      if (!v26)
      {
        self->_isFirstFrame = 0;
        -[NSMutableArray removeObject:](self->_futureFrameMetadataDicts, "removeObject:", v16);
        ++self->_videoOutputFrameNumber;
        goto LABEL_13;
      }
      fig_log_get_emitter();
      FigDebugAssert3();
    }
LABEL_31:
    v15 = a3;
    goto LABEL_32;
  }
  v6 = 0;
  v7 = *MEMORY[0x1E0D05490];
  metadataOutputFrameNumber = self->_metadataOutputFrameNumber;
  v23 = *MEMORY[0x1E0CA2E18];
  v9 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  while (1)
  {
    *(_OWORD *)&v25.value = v23;
    v25.epoch = v9;
    v10 = (id)objc_msgSend(v4, "copySourceStabilizationMetadataForFrameNumber:outputSampleTime:stabilizer:", metadataOutputFrameNumber, &v25, self);
    time = v25;
    v11 = -[AVOfflineVideoStabilizer _validateStabilizationMetadata:withSampleTime:isEndOfData:](self, "_validateStabilizationMetadata:withSampleTime:isEndOfData:", v10, &time, &self->_clientMarkedEndOfMetadata);
    v26 = v11;
    if (v11)
      break;
    if (*p_clientMarkedEndOfMetadata)
    {
      metadataOutputFrameNumber = self->_metadataOutputFrameNumber;
      metadataPrimingCount = self->_metadataPrimingCount;
      if (metadataOutputFrameNumber < metadataPrimingCount)
      {
        self->_metadataPrimingCount = metadataOutputFrameNumber;
        LODWORD(metadataPrimingCount) = metadataOutputFrameNumber;
      }
    }
    else
    {
      v6 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v10);
      time = v25;
      objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", CMTimeGetSeconds(&time)), v7);
      time = v25;
      objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCMTime:", &time), CFSTR("CinematicFutureOutputFramePTSValue"));
      -[NSMutableArray addObject:](self->_futureFrameMetadataDicts, "addObject:", v6);
      metadataOutputFrameNumber = self->_metadataOutputFrameNumber + 1;
      self->_metadataOutputFrameNumber = metadataOutputFrameNumber;
      LODWORD(metadataPrimingCount) = self->_metadataPrimingCount;
    }
    if (metadataOutputFrameNumber > (int)metadataPrimingCount || *p_clientMarkedEndOfMetadata)
      goto LABEL_11;
  }
  v18 = 0;
  v13 = 0;
  v14 = 0;
  v15 = a3;
LABEL_34:
  if (v11 != -11822)
  {
    if (!v11)
      goto LABEL_39;
    -[AVOfflineVideoStabilizer _teardownVISProcessor](self, "_teardownVISProcessor");
  }
  if (v15)
    *v15 = (id)AVLocalizedErrorWithUnderlyingOSStatus();
LABEL_39:
  if (v13)
    CFRelease(v13);
  if (v14)
    CFRelease(v14);
  return (opaqueCMSampleBuffer *)v18;
}

- (unint64_t)_extendedRowsOfOutputBuffer
{
  int v2;

  v2 = objc_msgSend((id)-[__CFDictionary objectForKeyedSubscript:](CVPixelBufferPoolGetPixelBufferAttributes(self->_pixelBufferPool), "objectForKeyedSubscript:", *MEMORY[0x1E0CA8FD8]), "intValue");
  return ((v2 + 15) & 0xFFFFFFFFFFFFFFF0) - v2;
}

- (int)_setupVISProcessor
{
  NSMutableArray *futureFrameMetadataDicts;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  VISProcessor *v14;
  double v15;
  int v16;
  int v17;
  int v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  void *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  futureFrameMetadataDicts = self->_futureFrameMetadataDicts;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](futureFrameMetadataDicts, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v21;
    v7 = *MEMORY[0x1E0D05408];
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v21 != v6)
          objc_enumerationMutation(futureFrameMetadataDicts);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "objectForKeyedSubscript:", v7))
        {
          v9 = 1;
          goto LABEL_11;
        }
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](futureFrameMetadataDicts, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
      if (v5)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:
  v10 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D03BA8], "sharedInstance"), "videoStabilizationProcessorVersion");
  if (!(_DWORD)v10)
    return FigSignalErrorAt();
  v11 = v10;
  v12 = objc_msgSend(MEMORY[0x1E0D08B40], "VISConfigurationForVersion:", v10);
  if (!v12)
    return FigSignalErrorAt();
  v13 = (void *)v12;
  v14 = (VISProcessor *)(id)objc_msgSend(MEMORY[0x1E0D08B40], "VISProcessorForVersion:", v11);
  self->_visProcessor = v14;
  if (!v14)
    return FigSignalErrorAt();
  -[VISProcessor setDelegate:](v14, "setDelegate:", self);
  objc_msgSend(v13, "setExtendedOutputRowsToFill:", -[AVOfflineVideoStabilizer _extendedRowsOfOutputBuffer](self, "_extendedRowsOfOutputBuffer"));
  objc_msgSend(v13, "setInputPixelBufferAttributes:", self->_cachedInputBufferAttributes);
  objc_msgSend(v13, "setOutputPixelBufferAttributes:", CVPixelBufferPoolGetPixelBufferAttributes(self->_pixelBufferPool));
  objc_msgSend(v13, "setTransformPlatform:", 0);
  v24 = *MEMORY[0x1E0D04170];
  v25 = &unk_1E424CFA8;
  objc_msgSend(v13, "setSensorIDDict:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1));
  objc_msgSend(v13, "setSmoothingMethod:", 2);
  objc_msgSend(v13, "setSphereCorrectionEnabled:", v9);
  objc_msgSend(v13, "setUseISPMotionData:", 1);
  objc_msgSend(v13, "setCinematicLookAheadFrameCount:", self->_metadataPrimingCount);
  *(float *)&v15 = self->_lookAheadTime;
  objc_msgSend(v13, "setCinematicLookAheadTime:", v15);
  objc_msgSend(v13, "setOutputPixelBufferPool:", self->_pixelBufferPool);
  objc_msgSend(v13, "setGpuPriority:", 0);
  objc_msgSend(v13, "setMetalSubmissionAndCompletionQueuePriority:", 0);
  objc_msgSend(v13, "setVideoStabilizationDisabled:", !self->_stabilizationEnabled);
  -[VISProcessor setConfiguration:](self->_visProcessor, "setConfiguration:", v13);
  v16 = -[VISProcessor prepareToProcess:](self->_visProcessor, "prepareToProcess:", 0);
  v17 = 0;
  if (v16)
  {
    v19 = v16;
    fig_log_get_emitter();
    FigDebugAssert3();
    return v19;
  }
  return v17;
}

- (void)_teardownVISProcessor
{
  VISProcessor *visProcessor;

  visProcessor = self->_visProcessor;
  if (visProcessor)
  {
    -[VISProcessor finishProcessing](visProcessor, "finishProcessing");

  }
}

- (int)_validateStabilizationMetadata:(id)a3 withSampleTime:(id *)a4 isEndOfData:(BOOL *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;

  if (a3)
  {
    if ((a4->var2 & 1) != 0)
    {
      if (!self->_requiredMetadataKeys)
      {
        v8 = objc_alloc(MEMORY[0x1E0C99E60]);
        self->_requiredMetadataKeys = (NSSet *)objc_msgSend(v8, "initWithObjects:", *MEMORY[0x1E0D05080], *MEMORY[0x1E0D05028], *MEMORY[0x1E0D05400], *MEMORY[0x1E0D05038], *MEMORY[0x1E0D05058], *MEMORY[0x1E0D053F8], *MEMORY[0x1E0D05418], *MEMORY[0x1E0D05410], 0);
      }
      if (!self->_optionalMetadataKeys)
      {
        v9 = objc_alloc(MEMORY[0x1E0C99E60]);
        self->_optionalMetadataKeys = (NSSet *)objc_msgSend(v9, "initWithObjects:", *MEMORY[0x1E0D05420], *MEMORY[0x1E0D05408], *MEMORY[0x1E0D05068], *MEMORY[0x1E0D050A8], *MEMORY[0x1E0D050D0], 0);
      }
      v10 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", objc_msgSend(a3, "allKeys"));
      objc_msgSend(v10, "minusSet:", self->_requiredMetadataKeys);
      objc_msgSend(v10, "minusSet:", self->_optionalMetadataKeys);
      objc_msgSend(v10, "count");
      if (objc_msgSend(v10, "count")
        || (v11 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", self->_requiredMetadataKeys),
            objc_msgSend(v11, "minusSet:", objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", objc_msgSend(a3, "allKeys"))), objc_msgSend(v11, "count"), (v12 = objc_msgSend(v11, "count")) != 0))
      {
        fig_log_get_emitter();
        FigDebugAssert3();
        LODWORD(v12) = -11822;
      }
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      LODWORD(v12) = FigSignalErrorAt();
    }
  }
  else
  {
    LODWORD(v12) = 0;
  }
  if (a5)
    *a5 = a3 == 0;
  return v12;
}

- (int)_validateSourcePixelBuffer:(__CVBuffer *)a3 withSampleTime:(id *)a4 metadata:(id)a5 isEndOfData:(BOOL *)a6
{
  void *v9;
  int result;
  CMTime time2;
  CMTime time1;
  CMTime v13;

  if (!a3)
  {
    result = 0;
    goto LABEL_7;
  }
  if ((a4->var2 & 1) == 0)
  {
    fig_log_get_emitter();
LABEL_13:
    FigDebugAssert3();
    result = -11822;
    goto LABEL_7;
  }
  memset(&v13, 0, sizeof(v13));
  v9 = (void *)objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("CinematicFutureOutputFramePTSValue"));
  if (v9)
    objc_msgSend(v9, "CMTimeValue");
  else
    memset(&v13, 0, sizeof(v13));
  time1 = v13;
  time2 = (CMTime)*a4;
  result = CMTimeCompare(&time1, &time2);
  if (result)
  {
    fig_log_get_emitter();
    goto LABEL_13;
  }
LABEL_7:
  if (a6)
    *a6 = a3 == 0;
  return result;
}

- (opaqueCMSampleBuffer)_createSampleBufferWithPixelBuffer:(__CVBuffer *)a3 sampleTime:(id *)a4 futureMetadata:(id)a5 status:(int *)a6
{
  id v10;
  opaqueCMFormatDescription *cachedVideoFormatDescription;
  CFTypeRef *p_cachedVideoFormatDescription;
  const __CFAllocator *v13;
  char v14;
  char v15;
  OSStatus v16;
  OSStatus v17;
  int v18;
  NSMutableArray *futureFrameMetadataDicts;
  CMSampleBufferRef sampleBufferOut;
  CMSampleTimingInfo sampleTiming;

  sampleBufferOut = 0;
  sampleTiming.presentationTimeStamp = (CMTime)*a4;
  sampleTiming.decodeTimeStamp = sampleTiming.presentationTimeStamp;
  sampleTiming.duration = (CMTime)self->_targetFrameDuration;
  v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (!self->_cachedInputBufferAttributes)
  {
    self->_cachedInputBufferAttributes = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cachedInputBufferAttributes, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", CVPixelBufferGetWidth(a3)), *MEMORY[0x1E0CA90E0]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cachedInputBufferAttributes, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", CVPixelBufferGetHeight(a3)), *MEMORY[0x1E0CA8FD8]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cachedInputBufferAttributes, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", CVPixelBufferGetPixelFormatType(a3)), *MEMORY[0x1E0CA9040]);
  }
  p_cachedVideoFormatDescription = (CFTypeRef *)&self->_cachedVideoFormatDescription;
  cachedVideoFormatDescription = self->_cachedVideoFormatDescription;
  v13 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v14 = 1;
  while (1)
  {
    v15 = v14;
    if (cachedVideoFormatDescription)
      goto LABEL_7;
    v16 = CMVideoFormatDescriptionCreateForImageBuffer(v13, a3, &self->_cachedVideoFormatDescription);
    if (v16)
      break;
    cachedVideoFormatDescription = (opaqueCMFormatDescription *)*p_cachedVideoFormatDescription;
LABEL_7:
    v17 = CMSampleBufferCreateForImageBuffer(v13, a3, 1u, 0, 0, cachedVideoFormatDescription, &sampleTiming, &sampleBufferOut);
    v18 = v17;
    if (v17 != -12743)
    {
      if (!v17)
      {
LABEL_13:
        if (self->_isFirstFrame)
        {
          futureFrameMetadataDicts = self->_futureFrameMetadataDicts;
          if (-[NSMutableArray count](futureFrameMetadataDicts, "count") > (unint64_t)self->_metadataPrimingCount)
            futureFrameMetadataDicts = (NSMutableArray *)-[NSMutableArray subarrayWithRange:](self->_futureFrameMetadataDicts, "subarrayWithRange:", 0);
          objc_msgSend(v10, "setObject:forKeyedSubscript:", futureFrameMetadataDicts, *MEMORY[0x1E0D051C0]);
        }
        if (a5)
          objc_msgSend(v10, "setObject:forKeyedSubscript:", a5, *MEMORY[0x1E0D051B8]);
        CMSetAttachment(sampleBufferOut, (CFStringRef)*MEMORY[0x1E0D04138], v10, 1u);
      }
      if (!a6)
        goto LABEL_22;
LABEL_21:
      *a6 = v18;
      goto LABEL_22;
    }
    if (*p_cachedVideoFormatDescription)
    {
      CFRelease(*p_cachedVideoFormatDescription);
      *p_cachedVideoFormatDescription = 0;
    }
    cachedVideoFormatDescription = 0;
    v14 = 0;
    if ((v15 & 1) == 0)
      goto LABEL_13;
  }
  v18 = v16;
  if (a6)
    goto LABEL_21;
LABEL_22:

  return sampleBufferOut;
}

- (void)didCompleteProcessingOfBuffer:(opaqueCMSampleBuffer *)a3 withStatus:(int)a4
{
  NSMutableArray *outputSampleBuffers;
  NSMutableArray *v5;

  if (a3)
  {
    outputSampleBuffers = self->_outputSampleBuffers;
  }
  else
  {
    if (!a4)
      return;
    v5 = self->_outputSampleBuffers;
    a3 = (opaqueCMSampleBuffer *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(_QWORD *)&a4);
    outputSampleBuffers = v5;
  }
  -[NSMutableArray addObject:](outputSampleBuffers, "addObject:", a3, *(_QWORD *)&a4);
}

- (NSMutableArray)outputSampleBuffers
{
  return self->_outputSampleBuffers;
}

@end
