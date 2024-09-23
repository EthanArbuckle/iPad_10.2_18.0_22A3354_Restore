@implementation BWFaceTrackingNode

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  int *v6;
  _BOOL4 processing;
  int32_t Count;
  int32_t Capacity;
  const void *v10;
  int v11;
  void *v13;
  CMTime v14;
  CMTime v15;
  CMTime time;

  if (self->_passthroughInputs
    || (v13 = (void *)CMGetAttachment(a3, CFSTR("DepthDisabled"), 0), !self->_skipProcessing)
    && (objc_msgSend(v13, "BOOLValue") & 1) == 0)
  {
    v6 = (int *)MEMORY[0x1E0CA1FC0];
    if (*MEMORY[0x1E0CA1FC0] == 1)
    {
      CMSampleBufferGetPresentationTimeStamp(&v15, a3);
      time = v15;
      CMTimeGetSeconds(&time);
      kdebug_trace();
    }
    if (self->_nextSbufQueue)
    {
      os_unfair_lock_lock(&self->_processingLock);
      processing = self->_processing;
      Count = CMSimpleQueueGetCount(self->_nextSbufQueue);
      Capacity = CMSimpleQueueGetCapacity(self->_nextSbufQueue);
      if (a3)
        CFRetain(a3);
      if (self->_processing)
      {
        if (Count == Capacity)
        {
          v10 = CMSimpleQueueDequeue(self->_nextSbufQueue);
          if (v10)
            CFRelease(v10);
        }
        CMSimpleQueueEnqueue(self->_nextSbufQueue, a3);
      }
      self->_processing = 1;
      os_unfair_lock_unlock(&self->_processingLock);
      if (!processing)
        -[BWFaceTrackingNode _startProcessingSampleSampleBuffer:]((uint64_t)self, (uint64_t)a3);
      v11 = *v6;
      if (!a3)
        goto LABEL_26;
      if (Count != Capacity || v11 != 1)
        goto LABEL_26;
      CMSampleBufferGetPresentationTimeStamp(&v14, a3);
      time = v14;
      CMTimeGetSeconds(&time);
      kdebug_trace();
    }
    else
    {
      -[BWFaceTrackingNode _processSampleBuffer:]((uint64_t)self, a3);
    }
    v11 = *v6;
LABEL_26:
    if (v11 == 1)
      kdebug_trace();
  }
}

- (id)nodeType
{
  return CFSTR("Effect");
}

- (void)setUsesFaceRecognition:(BOOL)a3
{
  self->_faceTrackingUsesFaceRecognition = a3;
}

- (void)setOrientation:(int)a3
{
  self->_orientation = a3;
}

- (void)setNetworkFailureThresholdMultiplier:(float)a3
{
  self->_faceTrackingNetworkFailureThresholdMultiplier = a3;
}

- (void)setMirrored:(BOOL)a3
{
  self->_mirrored = a3;
}

- (void)setMaxFaces:(int)a3
{
  self->_faceTrackingMaxFaces = a3;
}

- (void)setFrontCamera:(BOOL)a3
{
  self->_frontCamera = a3;
}

- (void)setFaceTrackingPlusEnabled:(BOOL)a3
{
  self->_faceTrackingPlusEnabled = a3;
}

- (uint64_t)_setupCVA
{
  uint64_t v1;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  _QWORD *v6;
  void *v7;
  uint64_t v8;
  _QWORD *v9;
  void *v10;
  uint64_t v11;
  _QWORD *v12;
  void *v13;
  uint64_t v14;
  _QWORD *v15;
  void *v16;
  uint64_t v17;
  _QWORD *v18;
  void *v19;
  uint64_t v20;
  _QWORD *v21;
  void *v22;
  int v23;
  _QWORD *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  _QWORD *v28;
  void *v29;
  const void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  const void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  void *v41;

  if (!a1)
    return 0;
  if (*(_QWORD *)(a1 + 136) && !_FigIsCurrentDispatchQueue())
  {
    fig_log_get_emitter();
    v37 = v1;
    LODWORD(v36) = 0;
    FigDebugAssert3();
  }
  if (*(_BYTE *)(a1 + 144))
    return 0;
  v3 = *(_QWORD *)(a1 + 152);
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 5);
  v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 172));
  v38 = 0;
  v39 = &v38;
  v40 = 0x2020000000;
  v6 = (_QWORD *)getkCVAFaceTracking_ThreadPrioritySymbolLoc_ptr;
  v41 = (void *)getkCVAFaceTracking_ThreadPrioritySymbolLoc_ptr;
  if (!getkCVAFaceTracking_ThreadPrioritySymbolLoc_ptr)
  {
    v7 = (void *)AppleCVALibrary();
    v6 = dlsym(v7, "kCVAFaceTracking_ThreadPriority");
    v39[3] = (uint64_t)v6;
    getkCVAFaceTracking_ThreadPrioritySymbolLoc_ptr = (uint64_t)v6;
  }
  _Block_object_dispose(&v38, 8);
  if (!v6)
    -[BWFaceTrackingNode _setupCVA].cold.1();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, *v6);
  v8 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 184));
  v38 = 0;
  v39 = &v38;
  v40 = 0x2020000000;
  v9 = (_QWORD *)getkCVAFaceTracking_UseRecognitionSymbolLoc_ptr;
  v41 = (void *)getkCVAFaceTracking_UseRecognitionSymbolLoc_ptr;
  if (!getkCVAFaceTracking_UseRecognitionSymbolLoc_ptr)
  {
    v10 = (void *)AppleCVALibrary();
    v9 = dlsym(v10, "kCVAFaceTracking_UseRecognition");
    v39[3] = (uint64_t)v9;
    getkCVAFaceTracking_UseRecognitionSymbolLoc_ptr = (uint64_t)v9;
  }
  _Block_object_dispose(&v38, 8);
  if (!v9)
    -[BWFaceTrackingNode _setupCVA].cold.2();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, *v9);
  if (*(float *)(a1 + 188) > 0.0)
  {
    v11 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
    v38 = 0;
    v39 = &v38;
    v40 = 0x2020000000;
    v12 = (_QWORD *)getkCVAFaceTracking_NetworkFailureThresholdMultiplierSymbolLoc_ptr;
    v41 = (void *)getkCVAFaceTracking_NetworkFailureThresholdMultiplierSymbolLoc_ptr;
    if (!getkCVAFaceTracking_NetworkFailureThresholdMultiplierSymbolLoc_ptr)
    {
      v13 = (void *)AppleCVALibrary();
      v12 = dlsym(v13, "kCVAFaceTracking_NetworkFailureThresholdMultiplier");
      v39[3] = (uint64_t)v12;
      getkCVAFaceTracking_NetworkFailureThresholdMultiplierSymbolLoc_ptr = (uint64_t)v12;
    }
    _Block_object_dispose(&v38, 8);
    if (!v12)
      -[BWFaceTrackingNode _setupCVA].cold.3();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, *v12);
  }
  if (*(float *)(a1 + 196) >= 0.0)
  {
    v14 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
    v38 = 0;
    v39 = &v38;
    v40 = 0x2020000000;
    v15 = (_QWORD *)getkCVAFaceTracking_TrackingFailureFieldOfViewModifierSymbolLoc_ptr;
    v41 = (void *)getkCVAFaceTracking_TrackingFailureFieldOfViewModifierSymbolLoc_ptr;
    if (!getkCVAFaceTracking_TrackingFailureFieldOfViewModifierSymbolLoc_ptr)
    {
      v16 = (void *)AppleCVALibrary();
      v15 = dlsym(v16, "kCVAFaceTracking_TrackingFailureFieldOfViewModifier");
      v39[3] = (uint64_t)v15;
      getkCVAFaceTracking_TrackingFailureFieldOfViewModifierSymbolLoc_ptr = (uint64_t)v15;
    }
    _Block_object_dispose(&v38, 8);
    if (!v15)
      -[BWFaceTrackingNode _setupCVA].cold.10();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, *v15);
  }
  v17 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 192), v36, v37, v38);
  v38 = 0;
  v39 = &v38;
  v40 = 0x2020000000;
  v18 = (_QWORD *)getkCVA_tmrLADzZUFnL94QtJ4Eb9fgiSymbolLoc_ptr;
  v41 = (void *)getkCVA_tmrLADzZUFnL94QtJ4Eb9fgiSymbolLoc_ptr;
  if (!getkCVA_tmrLADzZUFnL94QtJ4Eb9fgiSymbolLoc_ptr)
  {
    v19 = (void *)AppleCVALibrary();
    v18 = dlsym(v19, "kCVA_tmrLADzZUFnL94QtJ4Eb9fgi");
    v39[3] = (uint64_t)v18;
    getkCVA_tmrLADzZUFnL94QtJ4Eb9fgiSymbolLoc_ptr = (uint64_t)v18;
  }
  _Block_object_dispose(&v38, 8);
  if (!v18)
    -[BWFaceTrackingNode _setupCVA].cold.4();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v17, *v18);
  v20 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3 == 0);
  v38 = 0;
  v39 = &v38;
  v40 = 0x2020000000;
  v21 = (_QWORD *)getkCVAFaceTracking_ColorOnlySymbolLoc_ptr;
  v41 = (void *)getkCVAFaceTracking_ColorOnlySymbolLoc_ptr;
  if (!getkCVAFaceTracking_ColorOnlySymbolLoc_ptr)
  {
    v22 = (void *)AppleCVALibrary();
    v21 = dlsym(v22, "kCVAFaceTracking_ColorOnly");
    v39[3] = (uint64_t)v21;
    getkCVAFaceTracking_ColorOnlySymbolLoc_ptr = (uint64_t)v21;
  }
  _Block_object_dispose(&v38, 8);
  if (!v21)
    -[BWFaceTrackingNode _setupCVA].cold.5();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v20, *v21);
  v23 = *(_DWORD *)(a1 + 176);
  if (v23 == 1 || v23 == 3)
  {
    v38 = 0;
    v39 = &v38;
    v40 = 0x2020000000;
    v24 = (_QWORD *)getkCVAFaceTracking_DepthSource_PearlSymbolLoc_ptr;
    v41 = (void *)getkCVAFaceTracking_DepthSource_PearlSymbolLoc_ptr;
    if (!getkCVAFaceTracking_DepthSource_PearlSymbolLoc_ptr)
    {
      v26 = (void *)AppleCVALibrary();
      v24 = dlsym(v26, "kCVAFaceTracking_DepthSource_Pearl");
      v39[3] = (uint64_t)v24;
      getkCVAFaceTracking_DepthSource_PearlSymbolLoc_ptr = (uint64_t)v24;
    }
    _Block_object_dispose(&v38, 8);
    if (!v24)
      -[BWFaceTrackingNode _setupCVA].cold.9();
    goto LABEL_38;
  }
  if (v23 == 2)
  {
    v38 = 0;
    v39 = &v38;
    v40 = 0x2020000000;
    v24 = (_QWORD *)getkCVAFaceTracking_DepthSource_SMPRawSymbolLoc_ptr;
    v41 = (void *)getkCVAFaceTracking_DepthSource_SMPRawSymbolLoc_ptr;
    if (!getkCVAFaceTracking_DepthSource_SMPRawSymbolLoc_ptr)
    {
      v25 = (void *)AppleCVALibrary();
      v24 = dlsym(v25, "kCVAFaceTracking_DepthSource_SMPRaw");
      v39[3] = (uint64_t)v24;
      getkCVAFaceTracking_DepthSource_SMPRawSymbolLoc_ptr = (uint64_t)v24;
    }
    _Block_object_dispose(&v38, 8);
    if (!v24)
      -[BWFaceTrackingNode _setupCVA].cold.8();
LABEL_38:
    objc_msgSend(v4, "setObject:forKeyedSubscript:", *v24, getkCVAFaceTracking_DepthSource());
  }
  if (*(int *)(a1 + 180) >= 1)
  {
    v27 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:");
    v38 = 0;
    v39 = &v38;
    v40 = 0x2020000000;
    v28 = (_QWORD *)getkCVAFaceTracking_NumTrackedFacesSymbolLoc_ptr;
    v41 = (void *)getkCVAFaceTracking_NumTrackedFacesSymbolLoc_ptr;
    if (!getkCVAFaceTracking_NumTrackedFacesSymbolLoc_ptr)
    {
      v29 = (void *)AppleCVALibrary();
      v28 = dlsym(v29, "kCVAFaceTracking_NumTrackedFaces");
      v39[3] = (uint64_t)v28;
      getkCVAFaceTracking_NumTrackedFacesSymbolLoc_ptr = (uint64_t)v28;
    }
    _Block_object_dispose(&v38, 8);
    if (!v28)
      -[BWFaceTrackingNode _setupCVA].cold.6();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v27, *v28);
  }
  v30 = *(const void **)(a1 + 96);
  if (v30)
  {
    CFRelease(v30);
    *(_QWORD *)(a1 + 96) = 0;
  }
  v38 = 0;
  v39 = &v38;
  v40 = 0x2020000000;
  v31 = getCVAFaceTrackingCreateSymbolLoc_ptr;
  v41 = getCVAFaceTrackingCreateSymbolLoc_ptr;
  if (!getCVAFaceTrackingCreateSymbolLoc_ptr)
  {
    v32 = (void *)AppleCVALibrary();
    v31 = dlsym(v32, "CVAFaceTrackingCreate");
    v39[3] = (uint64_t)v31;
    getCVAFaceTrackingCreateSymbolLoc_ptr = v31;
  }
  _Block_object_dispose(&v38, 8);
  if (!v31)
    -[BWFaceTrackingNode _setupCVA].cold.7();
  v33 = ((uint64_t (*)(_QWORD, void *, uint64_t))v31)(*MEMORY[0x1E0C9AE00], v4, a1 + 96);
  if ((_DWORD)v33)
  {
    v35 = *(const void **)(a1 + 96);
    if (v35)
    {
      CFRelease(v35);
      *(_QWORD *)(a1 + 96) = 0;
    }
  }
  else
  {
    *(_BYTE *)(a1 + 144) = 1;
  }
  return v33;
}

+ (void)initialize
{
  objc_opt_class();
}

- (BWFaceTrackingNode)initWithFigThreadPriority:(unsigned int)a3 pearlModuleType:(int)a4 useUnfilteredDepth:(BOOL)a5 queueDepth:(unsigned int)a6 passthroughInputs:(BOOL)a7 allowPixelTransfer:(BOOL)a8
{
  uint64_t v10;
  _BOOL4 v11;
  BWFaceTrackingNode *v13;
  BWNodeInput *v14;
  BWVideoFormatRequirements *v15;
  BWNodeInputMediaConfiguration *v16;
  BWVideoFormatRequirements *v17;
  _BOOL4 passthroughInputs;
  BWNodeOutput *v19;
  BWNodeOutput *v20;
  BWNodeOutputMediaConfiguration *v21;
  objc_super v23;
  _QWORD v24[2];

  v10 = *(_QWORD *)&a6;
  v11 = a5;
  v24[1] = *MEMORY[0x1E0C80C00];
  v23.receiver = self;
  v23.super_class = (Class)BWFaceTrackingNode;
  v13 = -[BWNode init](&v23, sel_init);
  if (v13)
  {
    v13->_processingSemaphore = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
    v13->_faceTrackingMachThreadPriority = FigThreadGetMachThreadPriorityValue();
    v13->_pearlModuleType = a4;
    v13->_faceTrackingFailureFieldOfViewModifier = -1.0;
    v13->_passthroughInputs = a7;
    if (v13->_pearlModuleType)
    {
      v13->_depthAttachedMediaKey = (NSString *)CFSTR("Depth");
      if (v11 && v13->_pearlModuleType == 2)
        v13->_depthAttachedMediaKey = (NSString *)CFSTR("UnfilteredDepth");
    }
    if ((_DWORD)v10
      && (v13->_processingLock._os_unfair_lock_opaque = 0,
          v13->_processingQueue = (OS_dispatch_queue *)FigDispatchQueueCreateWithPriority(),
          CMSimpleQueueCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v10, &v13->_nextSbufQueue)))
    {
      fig_log_get_emitter();
      FigDebugAssert3();

      return 0;
    }
    else
    {
      v14 = -[BWNodeInput initWithMediaType:node:]([BWNodeInput alloc], "initWithMediaType:node:", 1986618469, v13);
      -[BWNodeInput setRetainedBufferCount:](v14, "setRetainedBufferCount:", v10);
      -[BWNodeInput setPassthroughMode:](v14, "setPassthroughMode:", v13->_passthroughInputs);
      if (!a8)
      {
        v15 = objc_alloc_init(BWVideoFormatRequirements);
        -[BWVideoFormatRequirements setSupportedPixelFormats:](v15, "setSupportedPixelFormats:", &unk_1E4A00440);
        -[BWNodeInput setFormatRequirements:](v14, "setFormatRequirements:", v15);
      }
      if (v13->_depthAttachedMediaKey)
      {
        v16 = objc_alloc_init(BWNodeInputMediaConfiguration);
        v17 = objc_alloc_init(BWVideoFormatRequirements);
        -[BWVideoFormatRequirements setSupportedPixelFormats:](v17, "setSupportedPixelFormats:", &unk_1E4A00458);
        if (v13->_nextSbufQueue)
          -[BWNodeInputMediaConfiguration setRetainedBufferCount:](v16, "setRetainedBufferCount:", 1);
        -[BWNodeInputMediaConfiguration setFormatRequirements:](v16, "setFormatRequirements:", v17);
        -[BWNodeInput setMediaConfiguration:forAttachedMediaKey:](v14, "setMediaConfiguration:forAttachedMediaKey:", v16, v13->_depthAttachedMediaKey);
      }
      -[BWNode addInput:](v13, "addInput:", v14);
      passthroughInputs = v13->_passthroughInputs;
      v19 = [BWNodeOutput alloc];
      if (passthroughInputs)
      {
        v20 = -[BWNodeOutput initWithMediaType:node:](v19, "initWithMediaType:node:", 1986618469, v13);
        v21 = -[BWNodeOutput primaryMediaConfiguration](v20, "primaryMediaConfiguration");
        -[BWNodeOutputMediaConfiguration setFormatRequirements:](v21, "setFormatRequirements:", -[BWNodeInputMediaConfiguration formatRequirements](-[BWNodeInput primaryMediaConfiguration](v14, "primaryMediaConfiguration"), "formatRequirements"));
        -[BWNodeOutputMediaConfiguration setPassthroughMode:](v21, "setPassthroughMode:", 1);
      }
      else
      {
        v20 = -[BWNodeOutput initWithMediaType:node:](v19, "initWithMediaType:node:", 1836016234, v13);
        v24[0] = *MEMORY[0x1E0CA4CC8];
        -[BWNodeOutput setFormat:](v20, "setFormat:", +[BWMetadataObjectFormat formatWithMetadataIdentifiers:](BWMetadataObjectFormat, "formatWithMetadataIdentifiers:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1)));
      }
      -[BWNode addOutput:](v13, "addOutput:", v20);
      v13->_addMesh = 1;
      v13->_addDebugInfo = 0;
      v13->_decompressionLock._os_unfair_lock_opaque = 0;
    }
  }
  return v13;
}

- (void)dealloc
{
  CVAFaceTracking *faceTrackingRef;
  opaqueCMSimpleQueue *nextSbufQueue;
  objc_super v5;

  faceTrackingRef = self->_faceTrackingRef;
  if (faceTrackingRef)
    CFRelease(faceTrackingRef);
  nextSbufQueue = self->_nextSbufQueue;
  if (nextSbufQueue)
    CFRelease(nextSbufQueue);

  -[BWFaceTrackingNode _releaseDecompressionResources]((uint64_t)self);
  v5.receiver = self;
  v5.super_class = (Class)BWFaceTrackingNode;
  -[BWNode dealloc](&v5, sel_dealloc);
}

- (void)_releaseDecompressionResources
{
  const void *v2;

  if (a1)
  {
    os_unfair_lock_assert_not_owner((const os_unfair_lock *)(a1 + 232));
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 232));

    *(_QWORD *)(a1 + 216) = 0;
    v2 = *(const void **)(a1 + 224);
    if (v2)
    {
      CFRelease(v2);
      *(_QWORD *)(a1 + 224) = 0;
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 232));
  }
}

- (void)setSkipProcessing:(BOOL)a3
{
  self->_skipProcessing = a3;
  if (a3 && !self->_nextSbufQueue)
    -[BWFaceTrackingNode _releaseDecompressionResources]((uint64_t)self);
}

- (BOOL)skipProcessing
{
  return self->_skipProcessing;
}

- (uint64_t)_prepareDecompressionResources
{
  const os_unfair_lock *v1;
  BWPixelBufferPool *v2;

  v1 = a1;
  if (a1)
  {
    os_unfair_lock_assert_owner(a1 + 58);
    if (*(_QWORD *)&v1[52]._os_unfair_lock_opaque && !*(_QWORD *)&v1[54]._os_unfair_lock_opaque)
    {
      v2 = -[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:]([BWPixelBufferPool alloc], "initWithVideoFormat:capacity:name:memoryPool:", *(_QWORD *)&v1[52]._os_unfair_lock_opaque, 1, CFSTR("FaceTrackingNode uncompressed image pool"), objc_msgSend(*(id *)&v1[4]._os_unfair_lock_opaque, "memoryPool"));
      *(_QWORD *)&v1[54]._os_unfair_lock_opaque = v2;
      if (v2)
      {
        v1 = (const os_unfair_lock *)VTPixelTransferSessionCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (VTPixelTransferSessionRef *)&v1[56]);
        if ((_DWORD)v1)
        {
          fig_log_get_emitter();
          FigDebugAssert3();
        }
      }
      else
      {
        fig_log_get_emitter();
        FigDebugAssert3();
        return 4294954510;
      }
    }
    else
    {
      return 0;
    }
  }
  return (uint64_t)v1;
}

- (id)nodeSubType
{
  return CFSTR("FaceTracking");
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4
{
  uint64_t v7;
  BWVideoFormatRequirements *v8;
  objc_super v9;
  BWVideoFormatRequirements *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  if (self->_passthroughInputs)
    -[BWNodeOutput setFormat:](self->super._output, "setFormat:", a3);
  v7 = FigCaptureUncompressedPixelFormatForPixelFormat(objc_msgSend(a3, "pixelFormat"));
  if ((_DWORD)v7 != objc_msgSend(a3, "pixelFormat"))
  {
    v8 = objc_alloc_init(BWVideoFormatRequirements);
    -[BWVideoFormatRequirements setWidth:](v8, "setWidth:", objc_msgSend(a3, "width"));
    -[BWVideoFormatRequirements setHeight:](v8, "setHeight:", objc_msgSend(a3, "height"));
    v11[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v7);
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v8, "setSupportedPixelFormats:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1));
    v10 = v8;
    self->_uncompressedVideoFormat = (BWVideoFormat *)+[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v10, 1));
  }
  v9.receiver = self;
  v9.super_class = (Class)BWFaceTrackingNode;
  -[BWNode didSelectFormat:forInput:](&v9, sel_didSelectFormat_forInput_, a3, a4);
}

- (void)didReachEndOfDataForInput:(id)a3
{
  NSObject *processingQueue;
  _QWORD block[5];

  if (self->_nextSbufQueue)
  {
    processingQueue = self->_processingQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __48__BWFaceTrackingNode_didReachEndOfDataForInput___block_invoke;
    block[3] = &unk_1E491E720;
    block[4] = self;
    dispatch_async(processingQueue, block);
  }
  else
  {
    -[BWNodeOutput markEndOfLiveOutput](self->super._output, "markEndOfLiveOutput", a3);
  }
}

uint64_t __48__BWFaceTrackingNode_didReachEndOfDataForInput___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "markEndOfLiveOutput");
}

- (void)_processSampleBuffer:(uint64_t)a1
{
  void *v2;
  void *v3;
  uint64_t v5;
  void *v6;
  id v7;
  CVImageBufferRef ImageBuffer;
  __CVBuffer *v9;
  _QWORD *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL4 IsExtensionDeviceType;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  _QWORD *v35;
  void *v36;
  _QWORD *v37;
  void *v38;
  id v39;
  _QWORD *v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  int v45;
  double v46;
  uint64_t v47;
  double v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD *v52;
  void *v53;
  const __CFDictionary *v54;
  const __CFAllocator *v55;
  uint64_t v56;
  double v57;
  double v58;
  _QWORD *v59;
  void *v60;
  _QWORD *v61;
  void *v62;
  _QWORD *v63;
  void *v64;
  double v65;
  uint64_t v66;
  _QWORD *v67;
  void *v68;
  uint64_t v69;
  _QWORD *v70;
  void *v71;
  uint64_t v72;
  _QWORD *v73;
  void *v74;
  uint64_t v75;
  opaqueCMSampleBuffer *AttachedMedia;
  opaqueCMSampleBuffer *v77;
  __CVBuffer *v78;
  void *v79;
  _QWORD *v80;
  void *v81;
  _QWORD *v82;
  void *v83;
  uint64_t v84;
  _QWORD *v85;
  void *v86;
  void *v87;
  uint64_t v88;
  _QWORD *v89;
  void *v90;
  uint64_t v91;
  _QWORD *v92;
  void *v93;
  _QWORD *v94;
  void *v95;
  _QWORD *v96;
  void *v97;
  size_t Width;
  size_t Height;
  size_t v100;
  size_t v101;
  uint64_t v102;
  _QWORD *v103;
  void *v104;
  void *v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  void *v109;
  void *v110;
  _QWORD *v111;
  void *v112;
  void *v113;
  OSStatus v114;
  CMSampleTimingInfo *sampleTimingArray;
  void *v116;
  id v117;
  uint64_t v118;
  _QWORD *v119;
  void *v120;
  CVImageBufferRef cf;
  id obj;
  uint64_t v123;
  void *v124;
  double v125;
  CMSampleTimingInfo time;
  int v127;
  CMTime v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  _QWORD v132[6];
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  CMAttachmentBearerRef targeta[2];
  __int128 v138;
  __int128 v139;
  uint64_t v140;
  uint64_t *v141;
  uint64_t v142;
  void (*v143)(uint64_t, uint64_t);
  void (*v144)(uint64_t);
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  _QWORD v148[3];
  _QWORD v149[3];
  _QWORD v150[2];
  _QWORD v151[2];
  _QWORD v152[2];
  _QWORD v153[2];
  _QWORD v154[3];
  _QWORD v155[3];
  _QWORD v156[3];
  _BYTE v157[128];
  uint64_t v158;

  v158 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return;
  v3 = v2;
  v5 = a1;
  if (*(_QWORD *)(a1 + 136) && !_FigIsCurrentDispatchQueue())
    goto LABEL_145;
  while (1)
  {
    if (*(_BYTE *)(v5 + 146))
    {
      v6 = (void *)CMGetAttachment(target, CFSTR("DepthDisabled"), 0);
      if (*(_BYTE *)(v5 + 200) || objc_msgSend(v6, "BOOLValue"))
      {
        objc_msgSend(*(id *)(v5 + 16), "emitSampleBuffer:", target);
        return;
      }
    }
    v140 = 0;
    v141 = &v140;
    v142 = 0x3052000000;
    v143 = __Block_byref_object_copy__12;
    v144 = __Block_byref_object_dispose__12;
    v145 = 0;
    if (-[BWFaceTrackingNode _setupCVA](v5))
    {
      v7 = 0;
      goto LABEL_137;
    }
    v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    ImageBuffer = CMSampleBufferGetImageBuffer((CMSampleBufferRef)target);
    cf = ImageBuffer;
    if (!ImageBuffer)
      break;
    CFRetain(ImageBuffer);
    if (*(_QWORD *)(v5 + 208))
    {
      os_unfair_lock_lock((os_unfair_lock_t)(v5 + 232));
      if (-[BWFaceTrackingNode _prepareDecompressionResources]((const os_unfair_lock *)v5)
        || (v9 = (__CVBuffer *)objc_msgSend(*(id *)(v5 + 216), "newPixelBuffer")) == 0)
      {
LABEL_161:
        fig_log_get_emitter();
        FigDebugAssert3();
LABEL_136:
        CFRelease(cf);
        goto LABEL_137;
      }
      if (VTPixelTransferSessionTransferImage(*(VTPixelTransferSessionRef *)(v5 + 224), cf, v9))
        goto LABEL_136;
      CFRelease(cf);
      os_unfair_lock_unlock((os_unfair_lock_t)(v5 + 232));
      cf = v9;
    }
    time.duration.value = 0;
    *(_QWORD *)&time.duration.timescale = &time;
    time.duration.epoch = 0x2020000000;
    v10 = (_QWORD *)getkCVAFaceTracking_ColorSymbolLoc_ptr;
    time.presentationTimeStamp.value = getkCVAFaceTracking_ColorSymbolLoc_ptr;
    if (!getkCVAFaceTracking_ColorSymbolLoc_ptr)
    {
      v11 = (void *)AppleCVALibrary();
      v10 = dlsym(v11, "kCVAFaceTracking_Color");
      *(_QWORD *)(*(_QWORD *)&time.duration.timescale + 24) = v10;
      getkCVAFaceTracking_ColorSymbolLoc_ptr = (uint64_t)v10;
    }
    _Block_object_dispose(&time, 8);
    if (v10)
    {
      objc_msgSend(v7, "setObject:forKeyedSubscript:", cf, *v10);
      v12 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
      v13 = v12;
      if (!v12)
        goto LABEL_161;
      v14 = (void *)objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0D06998]);
      v124 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      IsExtensionDeviceType = BWDeviceTypeIsExtensionDeviceType(objc_msgSend((id)objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0D069B8]), "integerValue"));
      if (objc_msgSend(v14, "count"))
      {
        v120 = v13;
        v16 = *(_DWORD *)(v5 + 164);
        v17 = *(unsigned __int8 *)(v5 + 160);
        v18 = *(unsigned __int8 *)(v5 + 168);
        objc_msgSend((id)objc_msgSend((id)v5, "graph"), "clientExpectsCameraMountedInLandscapeOrientation");
        v19 = FigCaptureRotationDegreesFromOrientation(v16, v17 != 0, IsExtensionDeviceType, v18 != 0);
        memset(&time, 0, 48);
        FigCaptureMakeMirrorAndRotateVideoTransform(1, 1, *(unsigned __int8 *)(v5 + 168), v19, (uint64_t)&time);
        v20 = *(unsigned __int8 *)(v5 + 168);
        *(_OWORD *)targeta = *(_OWORD *)&time.duration.value;
        v138 = *(_OWORD *)&time.duration.epoch;
        v139 = *(_OWORD *)&time.presentationTimeStamp.timescale;
        v21 = BWCreateTransformedFacesArray(v14, targeta, v19, v20);
        v117 = v7;
        v118 = v5;
        v119 = target;
        v133 = 0u;
        v134 = 0u;
        v135 = 0u;
        v136 = 0u;
        obj = v21;
        v5 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v133, v157, 16);
        if (v5)
        {
          v123 = *(_QWORD *)v134;
          v22 = *MEMORY[0x1E0D06A48];
          v23 = *MEMORY[0x1E0D06F20];
          v24 = *MEMORY[0x1E0D06D58];
          v25 = *MEMORY[0x1E0D06888];
          while (2)
          {
            for (i = 0; i != v5; ++i)
            {
              if (*(_QWORD *)v134 != v123)
                objc_enumerationMutation(obj);
              v27 = *(void **)(*((_QWORD *)&v133 + 1) + 8 * i);
              v28 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", sampleTimingArray, v116);
              v29 = objc_msgSend(v27, "objectForKeyedSubscript:", v22);
              if (v29)
              {
                targeta[0] = 0;
                targeta[1] = targeta;
                *(_QWORD *)&v138 = 0x2020000000;
                target = (_QWORD *)getkCVAFaceTracking_DetectedFaceFaceIDSymbolLoc_ptr;
                *((_QWORD *)&v138 + 1) = getkCVAFaceTracking_DetectedFaceFaceIDSymbolLoc_ptr;
                if (!getkCVAFaceTracking_DetectedFaceFaceIDSymbolLoc_ptr)
                {
                  v30 = (void *)AppleCVALibrary();
                  target = dlsym(v30, "kCVAFaceTracking_DetectedFaceFaceID");
                  *((_QWORD *)targeta[1] + 3) = target;
                  getkCVAFaceTracking_DetectedFaceFaceIDSymbolLoc_ptr = (uint64_t)target;
                }
                _Block_object_dispose(targeta, 8);
                if (!target)
                {
                  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CFStringRef getkCVAFaceTracking_DetectedFaceFaceID(void)"), CFSTR("BWFaceTrackingNode.m"), 126, CFSTR("%s"), dlerror());
                  goto LABEL_144;
                }
                objc_msgSend(v28, "setObject:forKeyedSubscript:", v29, *target);
              }
              v31 = objc_msgSend(v27, "objectForKeyedSubscript:", v23);
              if (v31)
                objc_msgSend(v28, "setObject:forKeyedSubscript:", v31, getkCVAFaceTracking_Timestamp());
              v32 = objc_msgSend(v27, "objectForKeyedSubscript:", v24);
              if (v32)
              {
                targeta[0] = 0;
                targeta[1] = targeta;
                *(_QWORD *)&v138 = 0x2020000000;
                target = (_QWORD *)getkCVAFaceTracking_DetectedFaceRectSymbolLoc_ptr;
                *((_QWORD *)&v138 + 1) = getkCVAFaceTracking_DetectedFaceRectSymbolLoc_ptr;
                if (!getkCVAFaceTracking_DetectedFaceRectSymbolLoc_ptr)
                {
                  v33 = (void *)AppleCVALibrary();
                  target = dlsym(v33, "kCVAFaceTracking_DetectedFaceRect");
                  *((_QWORD *)targeta[1] + 3) = target;
                  getkCVAFaceTracking_DetectedFaceRectSymbolLoc_ptr = (uint64_t)target;
                }
                _Block_object_dispose(targeta, 8);
                if (!target)
                {
                  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CFStringRef getkCVAFaceTracking_DetectedFaceRect(void)"), CFSTR("BWFaceTrackingNode.m"), 128, CFSTR("%s"), dlerror());
                  goto LABEL_144;
                }
                objc_msgSend(v28, "setObject:forKeyedSubscript:", v32, *target);
              }
              v34 = objc_msgSend(v27, "objectForKeyedSubscript:", v25);
              if (v34)
              {
                targeta[0] = 0;
                targeta[1] = targeta;
                *(_QWORD *)&v138 = 0x2020000000;
                v35 = (_QWORD *)getkCVAFaceTracking_DetectedFaceAngleInfoRollSymbolLoc_ptr;
                *((_QWORD *)&v138 + 1) = getkCVAFaceTracking_DetectedFaceAngleInfoRollSymbolLoc_ptr;
                if (!getkCVAFaceTracking_DetectedFaceAngleInfoRollSymbolLoc_ptr)
                {
                  v36 = (void *)AppleCVALibrary();
                  v35 = dlsym(v36, "kCVAFaceTracking_DetectedFaceAngleInfoRoll");
                  *((_QWORD *)targeta[1] + 3) = v35;
                  getkCVAFaceTracking_DetectedFaceAngleInfoRollSymbolLoc_ptr = (uint64_t)v35;
                }
                _Block_object_dispose(targeta, 8);
                if (!v35)
                {
                  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CFStringRef getkCVAFaceTracking_DetectedFaceAngleInfoRoll(void)"), CFSTR("BWFaceTrackingNode.m"), 130, CFSTR("%s"), dlerror());
                  goto LABEL_144;
                }
                objc_msgSend(v28, "setObject:forKeyedSubscript:", v34, *v35);
              }
              objc_msgSend(v124, "addObject:", v28);
            }
            v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v133, v157, 16);
            if (v5)
              continue;
            break;
          }
        }

        v5 = v118;
        target = v119;
        v7 = v117;
        v13 = v120;
      }
      time.duration.value = 0;
      *(_QWORD *)&time.duration.timescale = &time;
      time.duration.epoch = 0x2020000000;
      v37 = (_QWORD *)getkCVAFaceTracking_DetectedFacesArraySymbolLoc_ptr;
      time.presentationTimeStamp.value = getkCVAFaceTracking_DetectedFacesArraySymbolLoc_ptr;
      if (!getkCVAFaceTracking_DetectedFacesArraySymbolLoc_ptr)
      {
        v38 = (void *)AppleCVALibrary();
        v37 = dlsym(v38, "kCVAFaceTracking_DetectedFacesArray");
        *(_QWORD *)(*(_QWORD *)&time.duration.timescale + 24) = v37;
        getkCVAFaceTracking_DetectedFacesArraySymbolLoc_ptr = (uint64_t)v37;
      }
      _Block_object_dispose(&time, 8);
      if (v37)
      {
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v124, *v37);
        v132[0] = MEMORY[0x1E0C809B0];
        v132[1] = 3221225472;
        v132[2] = __43__BWFaceTrackingNode__processSampleBuffer___block_invoke;
        v132[3] = &unk_1E491FDB0;
        v132[4] = v5;
        v132[5] = &v140;
        v39 = (id)objc_msgSend(v132, "copy");
        time.duration.value = 0;
        *(_QWORD *)&time.duration.timescale = &time;
        time.duration.epoch = 0x2020000000;
        v40 = (_QWORD *)getkCVAFaceTracking_CallbackSymbolLoc_ptr;
        time.presentationTimeStamp.value = getkCVAFaceTracking_CallbackSymbolLoc_ptr;
        if (!getkCVAFaceTracking_CallbackSymbolLoc_ptr)
        {
          v41 = (void *)AppleCVALibrary();
          v40 = dlsym(v41, "kCVAFaceTracking_Callback");
          *(_QWORD *)(*(_QWORD *)&time.duration.timescale + 24) = v40;
          getkCVAFaceTracking_CallbackSymbolLoc_ptr = (uint64_t)v40;
        }
        _Block_object_dispose(&time, 8);
        if (v40)
        {
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v39, *v40);
          v130 = 0u;
          v131 = 0u;
          v129 = 0u;
          v42 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0CA2638], 0);
          v43 = v42;
          if (!v42 || objc_msgSend(v42, "length") != 48)
            goto LABEL_136;
          objc_msgSend(v43, "getBytes:length:", &v129, objc_msgSend(v43, "length"));
          LODWORD(v44) = v129;
          v45 = DWORD1(v130);
          v125 = *(double *)&v131;
          v155[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v44);
          v155[1] = &unk_1E49F8CB8;
          v155[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v125);
          v156[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v155, 3);
          v154[0] = &unk_1E49F8CB8;
          LODWORD(v46) = v45;
          v47 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v46);
          HIDWORD(v48) = HIDWORD(v125);
          LODWORD(v48) = HIDWORD(v125);
          v154[1] = v47;
          v154[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v48);
          v156[1] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v154, 3);
          v156[2] = &unk_1E4A00470;
          v49 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v156, 3);
          v152[0] = getkCVAFaceTracking_Rotation();
          v153[0] = &unk_1E4A004E8;
          v152[1] = getkCVAFaceTracking_Translation();
          v153[1] = &unk_1E4A00488;
          v50 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v153, v152, 2);
          v150[0] = getkCVAFaceTracking_Intrinsics();
          v151[0] = v49;
          v150[1] = getkCVAFaceTracking_Extrinsics();
          v151[1] = v50;
          v51 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v151, v150, 2);
          time.duration.value = 0;
          *(_QWORD *)&time.duration.timescale = &time;
          time.duration.epoch = 0x2020000000;
          v52 = (_QWORD *)getkCVAFaceTracking_CameraColorSymbolLoc_ptr;
          time.presentationTimeStamp.value = getkCVAFaceTracking_CameraColorSymbolLoc_ptr;
          if (!getkCVAFaceTracking_CameraColorSymbolLoc_ptr)
          {
            v53 = (void *)AppleCVALibrary();
            v52 = dlsym(v53, "kCVAFaceTracking_CameraColor");
            *(_QWORD *)(*(_QWORD *)&time.duration.timescale + 24) = v52;
            getkCVAFaceTracking_CameraColorSymbolLoc_ptr = (uint64_t)v52;
          }
          _Block_object_dispose(&time, 8);
          if (v52)
          {
            objc_msgSend(v7, "setObject:forKeyedSubscript:", v51, *v52);
            memset(&v128, 0, sizeof(v128));
            CMSampleBufferGetPresentationTimeStamp(&v128, (CMSampleBufferRef)target);
            v54 = (const __CFDictionary *)objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0D05D00]);
            if (!v54)
            {
              v55 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
              time.duration = v128;
              v54 = CMTimeCopyAsDictionary(&time.duration, v55);
            }
            objc_msgSend(v7, "setObject:forKeyedSubscript:", v54, getkCVAFaceTracking_Timestamp());
            v56 = objc_msgSend((id)objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0D06C40]), "intValue");
            objc_msgSend((id)objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0D06A20]), "doubleValue");
            v58 = v57;
            v127 = 0;
            FigCaptureComputeImageGainFromMetadata();
            time.duration.value = 0;
            *(_QWORD *)&time.duration.timescale = &time;
            time.duration.epoch = 0x2020000000;
            v59 = (_QWORD *)getkCVAFaceTracking_LuxLevelSymbolLoc_ptr;
            time.presentationTimeStamp.value = getkCVAFaceTracking_LuxLevelSymbolLoc_ptr;
            if (!getkCVAFaceTracking_LuxLevelSymbolLoc_ptr)
            {
              v60 = (void *)AppleCVALibrary();
              v59 = dlsym(v60, "kCVAFaceTracking_LuxLevel");
              *(_QWORD *)(*(_QWORD *)&time.duration.timescale + 24) = v59;
              getkCVAFaceTracking_LuxLevelSymbolLoc_ptr = (uint64_t)v59;
            }
            _Block_object_dispose(&time, 8);
            if (v59)
            {
              v148[0] = *v59;
              v149[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v56);
              time.duration.value = 0;
              *(_QWORD *)&time.duration.timescale = &time;
              time.duration.epoch = 0x2020000000;
              v61 = (_QWORD *)getkCVAFaceTracking_ExposureTimeSymbolLoc_ptr;
              time.presentationTimeStamp.value = getkCVAFaceTracking_ExposureTimeSymbolLoc_ptr;
              if (!getkCVAFaceTracking_ExposureTimeSymbolLoc_ptr)
              {
                v62 = (void *)AppleCVALibrary();
                v61 = dlsym(v62, "kCVAFaceTracking_ExposureTime");
                *(_QWORD *)(*(_QWORD *)&time.duration.timescale + 24) = v61;
                getkCVAFaceTracking_ExposureTimeSymbolLoc_ptr = (uint64_t)v61;
              }
              _Block_object_dispose(&time, 8);
              if (v61)
              {
                v148[1] = *v61;
                v149[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v58);
                time.duration.value = 0;
                *(_QWORD *)&time.duration.timescale = &time;
                time.duration.epoch = 0x2020000000;
                v63 = (_QWORD *)getkCVAFaceTracking_TotalGainSymbolLoc_ptr;
                time.presentationTimeStamp.value = getkCVAFaceTracking_TotalGainSymbolLoc_ptr;
                if (!getkCVAFaceTracking_TotalGainSymbolLoc_ptr)
                {
                  v64 = (void *)AppleCVALibrary();
                  v63 = dlsym(v64, "kCVAFaceTracking_TotalGain");
                  *(_QWORD *)(*(_QWORD *)&time.duration.timescale + 24) = v63;
                  getkCVAFaceTracking_TotalGainSymbolLoc_ptr = (uint64_t)v63;
                }
                _Block_object_dispose(&time, 8);
                if (v63)
                {
                  v148[2] = *v63;
                  LODWORD(v65) = v127;
                  v149[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v65);
                  v66 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v149, v148, 3);
                  time.duration.value = 0;
                  *(_QWORD *)&time.duration.timescale = &time;
                  time.duration.epoch = 0x2020000000;
                  v67 = (_QWORD *)getkCVAFaceTracking_ColorMetaDataSymbolLoc_ptr;
                  time.presentationTimeStamp.value = getkCVAFaceTracking_ColorMetaDataSymbolLoc_ptr;
                  if (!getkCVAFaceTracking_ColorMetaDataSymbolLoc_ptr)
                  {
                    v68 = (void *)AppleCVALibrary();
                    v67 = dlsym(v68, "kCVAFaceTracking_ColorMetaData");
                    *(_QWORD *)(*(_QWORD *)&time.duration.timescale + 24) = v67;
                    getkCVAFaceTracking_ColorMetaDataSymbolLoc_ptr = (uint64_t)v67;
                  }
                  _Block_object_dispose(&time, 8);
                  if (v67)
                  {
                    objc_msgSend(v7, "setObject:forKeyedSubscript:", v66, *v67);
                    v69 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(v5 + 236));
                    time.duration.value = 0;
                    *(_QWORD *)&time.duration.timescale = &time;
                    time.duration.epoch = 0x2020000000;
                    v70 = (_QWORD *)getkCVAFaceTracking_AddMeshSymbolLoc_ptr;
                    time.presentationTimeStamp.value = getkCVAFaceTracking_AddMeshSymbolLoc_ptr;
                    if (!getkCVAFaceTracking_AddMeshSymbolLoc_ptr)
                    {
                      v71 = (void *)AppleCVALibrary();
                      v70 = dlsym(v71, "kCVAFaceTracking_AddMesh");
                      *(_QWORD *)(*(_QWORD *)&time.duration.timescale + 24) = v70;
                      getkCVAFaceTracking_AddMeshSymbolLoc_ptr = (uint64_t)v70;
                    }
                    _Block_object_dispose(&time, 8);
                    if (v70)
                    {
                      objc_msgSend(v7, "setObject:forKeyedSubscript:", v69, *v70);
                      v72 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(v5 + 237));
                      time.duration.value = 0;
                      *(_QWORD *)&time.duration.timescale = &time;
                      time.duration.epoch = 0x2020000000;
                      v73 = (_QWORD *)getkCVAFaceTracking_AddDebugInfoSymbolLoc_ptr;
                      time.presentationTimeStamp.value = getkCVAFaceTracking_AddDebugInfoSymbolLoc_ptr;
                      if (!getkCVAFaceTracking_AddDebugInfoSymbolLoc_ptr)
                      {
                        v74 = (void *)AppleCVALibrary();
                        v73 = dlsym(v74, "kCVAFaceTracking_AddDebugInfo");
                        *(_QWORD *)(*(_QWORD *)&time.duration.timescale + 24) = v73;
                        getkCVAFaceTracking_AddDebugInfoSymbolLoc_ptr = (uint64_t)v73;
                      }
                      _Block_object_dispose(&time, 8);
                      if (v73)
                      {
                        objc_msgSend(v7, "setObject:forKeyedSubscript:", v72, *v73);
                        v75 = *(_QWORD *)(v5 + 152);
                        if (v75
                          && (AttachedMedia = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(target, v75),
                              (v77 = AttachedMedia) != 0))
                        {
                          v78 = CMSampleBufferGetImageBuffer(AttachedMedia);
                          if (!v78)
                            goto LABEL_161;
                          v79 = (void *)CMGetAttachment(v77, CFSTR("DepthPixelBufferType"), 0);
                          if (objc_msgSend(v79, "isEqualToString:", *MEMORY[0x1E0D063A0]))
                          {
                            time.duration.value = 0;
                            *(_QWORD *)&time.duration.timescale = &time;
                            time.duration.epoch = 0x2020000000;
                            v80 = (_QWORD *)getkCVAFaceTracking_DepthSymbolLoc_ptr;
                            time.presentationTimeStamp.value = getkCVAFaceTracking_DepthSymbolLoc_ptr;
                            if (!getkCVAFaceTracking_DepthSymbolLoc_ptr)
                            {
                              v81 = (void *)AppleCVALibrary();
                              v80 = dlsym(v81, "kCVAFaceTracking_Depth");
                              *(_QWORD *)(*(_QWORD *)&time.duration.timescale + 24) = v80;
                              getkCVAFaceTracking_DepthSymbolLoc_ptr = (uint64_t)v80;
                            }
                            _Block_object_dispose(&time, 8);
                            if (!v80)
                            {
                              v3 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                              objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CFStringRef getkCVAFaceTracking_Depth(void)"), CFSTR("BWFaceTrackingNode.m"), 88, CFSTR("%s"), dlerror());
                              goto LABEL_144;
                            }
                            objc_msgSend(v7, "setObject:forKeyedSubscript:", v78, *v80);
                            time.duration.value = 0;
                            *(_QWORD *)&time.duration.timescale = &time;
                            time.duration.epoch = 0x2020000000;
                            v82 = (_QWORD *)getkCVAFaceTracking_DepthUnitSymbolLoc_ptr;
                            time.presentationTimeStamp.value = getkCVAFaceTracking_DepthUnitSymbolLoc_ptr;
                            if (!getkCVAFaceTracking_DepthUnitSymbolLoc_ptr)
                            {
                              v83 = (void *)AppleCVALibrary();
                              v82 = dlsym(v83, "kCVAFaceTracking_DepthUnit");
                              *(_QWORD *)(*(_QWORD *)&time.duration.timescale + 24) = v82;
                              getkCVAFaceTracking_DepthUnitSymbolLoc_ptr = (uint64_t)v82;
                            }
                            _Block_object_dispose(&time, 8);
                            if (!v82)
                            {
                              v3 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                              objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CFStringRef getkCVAFaceTracking_DepthUnit(void)"), CFSTR("BWFaceTrackingNode.m"), 90, CFSTR("%s"), dlerror());
                              goto LABEL_144;
                            }
                            objc_msgSend(v7, "setObject:forKeyedSubscript:", &unk_1E49F8CE8, *v82);
                          }
                          else
                          {
                            if (!objc_msgSend(v79, "isEqualToString:", *MEMORY[0x1E0D063B8]))
                              goto LABEL_136;
                            v84 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", objc_msgSend((id)objc_msgSend((id)CVPixelBufferGetAttributes(), "objectForKeyedSubscript:", *MEMORY[0x1E0CA8FC8]), "shortValue"));
                            time.duration.value = 0;
                            *(_QWORD *)&time.duration.timescale = &time;
                            time.duration.epoch = 0x2020000000;
                            v85 = (_QWORD *)getkCVAFaceTracking_DisparityInvalidValueSymbolLoc_ptr;
                            time.presentationTimeStamp.value = getkCVAFaceTracking_DisparityInvalidValueSymbolLoc_ptr;
                            if (!getkCVAFaceTracking_DisparityInvalidValueSymbolLoc_ptr)
                            {
                              v86 = (void *)AppleCVALibrary();
                              v85 = dlsym(v86, "kCVAFaceTracking_DisparityInvalidValue");
                              *(_QWORD *)(*(_QWORD *)&time.duration.timescale + 24) = v85;
                              getkCVAFaceTracking_DisparityInvalidValueSymbolLoc_ptr = (uint64_t)v85;
                            }
                            _Block_object_dispose(&time, 8);
                            if (!v85)
                            {
                              v3 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                              objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CFStringRef getkCVAFaceTracking_DisparityInvalidValue(void)"), CFSTR("BWFaceTrackingNode.m"), 96, CFSTR("%s"), dlerror());
                              goto LABEL_144;
                            }
                            objc_msgSend(v7, "setObject:forKeyedSubscript:", v84, *v85);
                            v87 = (void *)CMGetAttachment(v77, (CFStringRef)*MEMORY[0x1E0D05C28], 0);
                            objc_msgSend((id)objc_msgSend(v87, "objectForKeyedSubscript:", *MEMORY[0x1E0D063B0]), "floatValue");
                            v88 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
                            time.duration.value = 0;
                            *(_QWORD *)&time.duration.timescale = &time;
                            time.duration.epoch = 0x2020000000;
                            v89 = (_QWORD *)getkCVAFaceTracking_DisparityNormalizationOffsetSymbolLoc_ptr;
                            time.presentationTimeStamp.value = getkCVAFaceTracking_DisparityNormalizationOffsetSymbolLoc_ptr;
                            if (!getkCVAFaceTracking_DisparityNormalizationOffsetSymbolLoc_ptr)
                            {
                              v90 = (void *)AppleCVALibrary();
                              v89 = dlsym(v90, "kCVAFaceTracking_DisparityNormalizationOffset");
                              *(_QWORD *)(*(_QWORD *)&time.duration.timescale + 24) = v89;
                              getkCVAFaceTracking_DisparityNormalizationOffsetSymbolLoc_ptr = (uint64_t)v89;
                            }
                            _Block_object_dispose(&time, 8);
                            if (!v89)
                            {
                              v3 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                              objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CFStringRef getkCVAFaceTracking_DisparityNormalizationOffset(void)"), CFSTR("BWFaceTrackingNode.m"), 94, CFSTR("%s"), dlerror());
                              goto LABEL_144;
                            }
                            objc_msgSend(v7, "setObject:forKeyedSubscript:", v88, *v89);
                            objc_msgSend((id)objc_msgSend(v87, "objectForKeyedSubscript:", *MEMORY[0x1E0D063A8]), "floatValue");
                            v91 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
                            time.duration.value = 0;
                            *(_QWORD *)&time.duration.timescale = &time;
                            time.duration.epoch = 0x2020000000;
                            v92 = (_QWORD *)getkCVAFaceTracking_DisparityNormalizationMultiplierSymbolLoc_ptr;
                            time.presentationTimeStamp.value = getkCVAFaceTracking_DisparityNormalizationMultiplierSymbolLoc_ptr;
                            if (!getkCVAFaceTracking_DisparityNormalizationMultiplierSymbolLoc_ptr)
                            {
                              v93 = (void *)AppleCVALibrary();
                              v92 = dlsym(v93, "kCVAFaceTracking_DisparityNormalizationMultiplier");
                              *(_QWORD *)(*(_QWORD *)&time.duration.timescale + 24) = v92;
                              getkCVAFaceTracking_DisparityNormalizationMultiplierSymbolLoc_ptr = (uint64_t)v92;
                            }
                            _Block_object_dispose(&time, 8);
                            if (!v92)
                            {
                              v3 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                              objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CFStringRef getkCVAFaceTracking_DisparityNormalizationMultiplier(void)"), CFSTR("BWFaceTrackingNode.m"), 98, CFSTR("%s"), dlerror());
                              goto LABEL_144;
                            }
                            objc_msgSend(v7, "setObject:forKeyedSubscript:", v91, *v92);
                            time.duration.value = 0;
                            *(_QWORD *)&time.duration.timescale = &time;
                            time.duration.epoch = 0x2020000000;
                            v94 = (_QWORD *)getkCVAFaceTracking_NormalizedDisparitySymbolLoc_ptr;
                            time.presentationTimeStamp.value = getkCVAFaceTracking_NormalizedDisparitySymbolLoc_ptr;
                            if (!getkCVAFaceTracking_NormalizedDisparitySymbolLoc_ptr)
                            {
                              v95 = (void *)AppleCVALibrary();
                              v94 = dlsym(v95, "kCVAFaceTracking_NormalizedDisparity");
                              *(_QWORD *)(*(_QWORD *)&time.duration.timescale + 24) = v94;
                              getkCVAFaceTracking_NormalizedDisparitySymbolLoc_ptr = (uint64_t)v94;
                            }
                            _Block_object_dispose(&time, 8);
                            if (!v94)
                            {
                              v3 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                              objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CFStringRef getkCVAFaceTracking_NormalizedDisparity(void)"), CFSTR("BWFaceTrackingNode.m"), 92, CFSTR("%s"), dlerror());
                              goto LABEL_144;
                            }
                            objc_msgSend(v7, "setObject:forKeyedSubscript:", v78, *v94);
                          }
                          time.duration.value = 0;
                          *(_QWORD *)&time.duration.timescale = &time;
                          time.duration.epoch = 0x2020000000;
                          v96 = (_QWORD *)getkCVAFaceTracking_SetCameraDepthFromColorSymbolLoc_ptr;
                          time.presentationTimeStamp.value = getkCVAFaceTracking_SetCameraDepthFromColorSymbolLoc_ptr;
                          if (!getkCVAFaceTracking_SetCameraDepthFromColorSymbolLoc_ptr)
                          {
                            v97 = (void *)AppleCVALibrary();
                            v96 = dlsym(v97, "kCVAFaceTracking_SetCameraDepthFromColor");
                            *(_QWORD *)(*(_QWORD *)&time.duration.timescale + 24) = v96;
                            getkCVAFaceTracking_SetCameraDepthFromColorSymbolLoc_ptr = (uint64_t)v96;
                          }
                          _Block_object_dispose(&time, 8);
                          if (!v96)
                          {
                            v3 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                            objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CFStringRef getkCVAFaceTracking_SetCameraDepthFromColor(void)"), CFSTR("BWFaceTrackingNode.m"), 104, CFSTR("%s"), dlerror());
                            goto LABEL_144;
                          }
                          objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], *v96);
                          Width = CVPixelBufferGetWidth(cf);
                          Height = CVPixelBufferGetHeight(cf);
                          v100 = CVPixelBufferGetWidth(v78);
                          v101 = CVPixelBufferGetHeight(v78);
                          v102 = -[BWFaceTrackingNode _depthIntrinsicsExtrinsicsFromRGBIntrisics:colorWidth:colorHeight:depthWidth:depthHeight:](v5, Width, Height, v100, v101, *(double *)&v129, *(double *)&v130, *(double *)&v131);
                          time.duration.value = 0;
                          *(_QWORD *)&time.duration.timescale = &time;
                          time.duration.epoch = 0x2020000000;
                          v103 = (_QWORD *)getkCVAFaceTracking_CameraDepthSymbolLoc_ptr;
                          time.presentationTimeStamp.value = getkCVAFaceTracking_CameraDepthSymbolLoc_ptr;
                          if (!getkCVAFaceTracking_CameraDepthSymbolLoc_ptr)
                          {
                            v104 = (void *)AppleCVALibrary();
                            v103 = dlsym(v104, "kCVAFaceTracking_CameraDepth");
                            *(_QWORD *)(*(_QWORD *)&time.duration.timescale + 24) = v103;
                            getkCVAFaceTracking_CameraDepthSymbolLoc_ptr = (uint64_t)v103;
                          }
                          _Block_object_dispose(&time, 8);
                          if (!v103)
                          {
                            v3 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                            objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CFStringRef getkCVAFaceTracking_CameraDepth(void)"), CFSTR("BWFaceTrackingNode.m"), 102, CFSTR("%s"), dlerror());
                            goto LABEL_144;
                          }
                          objc_msgSend(v7, "setObject:forKeyedSubscript:", v102, *v103);
                        }
                        else
                        {
                          v78 = 0;
                        }
                        if (getkCVAFaceTracking_DepthMetaData() && getkCVAFaceTracking_StructuredLightOccluded())
                        {
                          v105 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D086E0], 0);
                          if (v105 && objc_msgSend(v105, "intValue") == 1)
                            *(_BYTE *)(v5 + 145) = 1;
                          if (v78)
                            *(_BYTE *)(v5 + 145) = 0;
                          if (*(_BYTE *)(v5 + 145))
                          {
                            v146 = getkCVAFaceTracking_StructuredLightOccluded();
                            v147 = MEMORY[0x1E0C9AAB0];
                            v106 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v147, &v146, 1);
                          }
                          else
                          {
                            v106 = 0;
                          }
                          objc_msgSend(v7, "setObject:forKeyedSubscript:", v106, getkCVAFaceTracking_DepthMetaData());
                        }
                        if (*MEMORY[0x1E0CA1FC0] == 1)
                          kdebug_trace();
                        v107 = *(_QWORD *)(v5 + 96);
                        time.duration.value = 0;
                        *(_QWORD *)&time.duration.timescale = &time;
                        time.duration.epoch = 0x2020000000;
                        v108 = getCVAFaceTrackingProcessSymbolLoc_ptr;
                        time.presentationTimeStamp.value = (CMTimeValue)getCVAFaceTrackingProcessSymbolLoc_ptr;
                        if (!getCVAFaceTrackingProcessSymbolLoc_ptr)
                        {
                          v109 = (void *)AppleCVALibrary();
                          v108 = dlsym(v109, "CVAFaceTrackingProcess");
                          *(_QWORD *)(*(_QWORD *)&time.duration.timescale + 24) = v108;
                          getCVAFaceTrackingProcessSymbolLoc_ptr = v108;
                        }
                        _Block_object_dispose(&time, 8);
                        if (v108)
                        {
                          if (((unsigned int (*)(uint64_t, id))v108)(v107, v7))
                            goto LABEL_136;
                          dispatch_semaphore_wait(*(dispatch_semaphore_t *)(v5 + 120), 0xFFFFFFFFFFFFFFFFLL);
                          v110 = (void *)v141[5];
                          time.duration.value = 0;
                          *(_QWORD *)&time.duration.timescale = &time;
                          time.duration.epoch = 0x2020000000;
                          v111 = (_QWORD *)getkCVAFaceTracking_FailureTypeSymbolLoc_ptr;
                          time.presentationTimeStamp.value = getkCVAFaceTracking_FailureTypeSymbolLoc_ptr;
                          if (!getkCVAFaceTracking_FailureTypeSymbolLoc_ptr)
                          {
                            v112 = (void *)AppleCVALibrary();
                            v111 = dlsym(v112, "kCVAFaceTracking_FailureType");
                            *(_QWORD *)(*(_QWORD *)&time.duration.timescale + 24) = v111;
                            getkCVAFaceTracking_FailureTypeSymbolLoc_ptr = (uint64_t)v111;
                          }
                          _Block_object_dispose(&time, 8);
                          if (v111)
                          {
                            v113 = (void *)objc_msgSend(v110, "objectForKeyedSubscript:", *v111);
                            if (!v113 || (int)objc_msgSend(v113, "intValue") <= 0)
                            {
                              if (*(_BYTE *)(v5 + 146))
                              {
                                CMSetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05DD0], (CFTypeRef)v141[5], 1u);
                              }
                              else
                              {
                                *(_OWORD *)&time.duration.value = *MEMORY[0x1E0CA2E18];
                                time.duration.epoch = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
                                time.presentationTimeStamp = v128;
                                time.decodeTimeStamp = time.duration;
                                targeta[0] = 0;
                                v114 = CMSampleBufferCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 1u, 0, 0, 0, 0, 1, &time, 0, 0, (CMSampleBufferRef *)targeta);
                                if (targeta[0] && !v114)
                                {
                                  CMSetAttachment(targeta[0], (CFStringRef)*MEMORY[0x1E0D05DD0], (CFTypeRef)v141[5], 1u);
                                  objc_msgSend(*(id *)(v5 + 16), "emitSampleBuffer:", targeta[0]);
                                  CFRelease(targeta[0]);
                                }
                              }
                            }
                            goto LABEL_136;
                          }
                          v3 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                          objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CFStringRef getkCVAFaceTracking_FailureType(void)"), CFSTR("BWFaceTrackingNode.m"), 134, CFSTR("%s"), dlerror());
                        }
                        else
                        {
                          v3 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                          objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "int soft_CVAFaceTrackingProcess(CVAFaceTrackingRef, CFDictionaryRef)"), CFSTR("BWFaceTrackingNode.m"), 136, CFSTR("%s"), dlerror());
                        }
                      }
                      else
                      {
                        v3 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                        objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CFStringRef getkCVAFaceTracking_AddDebugInfo(void)"), CFSTR("BWFaceTrackingNode.m"), 122, CFSTR("%s"), dlerror());
                      }
                    }
                    else
                    {
                      v3 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                      objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CFStringRef getkCVAFaceTracking_AddMesh(void)"), CFSTR("BWFaceTrackingNode.m"), 120, CFSTR("%s"), dlerror());
                    }
                  }
                  else
                  {
                    v3 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CFStringRef getkCVAFaceTracking_ColorMetaData(void)"), CFSTR("BWFaceTrackingNode.m"), 108, CFSTR("%s"), dlerror());
                  }
                }
                else
                {
                  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CFStringRef getkCVAFaceTracking_TotalGain(void)"), CFSTR("BWFaceTrackingNode.m"), 114, CFSTR("%s"), dlerror());
                }
              }
              else
              {
                v3 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CFStringRef getkCVAFaceTracking_ExposureTime(void)"), CFSTR("BWFaceTrackingNode.m"), 112, CFSTR("%s"), dlerror());
              }
            }
            else
            {
              v3 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CFStringRef getkCVAFaceTracking_LuxLevel(void)"), CFSTR("BWFaceTrackingNode.m"), 110, CFSTR("%s"), dlerror());
            }
          }
          else
          {
            v3 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CFStringRef getkCVAFaceTracking_CameraColor(void)"), CFSTR("BWFaceTrackingNode.m"), 100, CFSTR("%s"), dlerror());
          }
        }
        else
        {
          v3 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CFStringRef getkCVAFaceTracking_Callback(void)"), CFSTR("BWFaceTrackingNode.m"), 132, CFSTR("%s"), dlerror());
        }
      }
      else
      {
        v3 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CFStringRef getkCVAFaceTracking_DetectedFacesArray(void)"), CFSTR("BWFaceTrackingNode.m"), 124, CFSTR("%s"), dlerror());
      }
    }
    else
    {
      v3 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CFStringRef getkCVAFaceTracking_Color(void)"), CFSTR("BWFaceTrackingNode.m"), 86, CFSTR("%s"), dlerror());
    }
LABEL_144:
    __break(1u);
LABEL_145:
    fig_log_get_emitter();
    v116 = v3;
    LODWORD(sampleTimingArray) = 0;
    FigDebugAssert3();
  }
  fig_log_get_emitter();
  FigDebugAssert3();
LABEL_137:

  if (*(_BYTE *)(v5 + 146))
    objc_msgSend(*(id *)(v5 + 16), "emitSampleBuffer:", target);
  _Block_object_dispose(&v140, 8);
}

- (void)_startProcessingSampleSampleBuffer:(uint64_t)a1
{
  NSObject *v2;
  _QWORD v3[6];

  if (a1)
  {
    v2 = *(NSObject **)(a1 + 112);
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __57__BWFaceTrackingNode__startProcessingSampleSampleBuffer___block_invoke;
    v3[3] = &unk_1E491F158;
    v3[4] = a1;
    v3[5] = a2;
    dispatch_async(v2, v3);
  }
}

void __57__BWFaceTrackingNode__startProcessingSampleSampleBuffer___block_invoke(uint64_t a1)
{
  _QWORD *v1;
  _DWORD *v3;
  void *v4;

  v1 = *(_QWORD **)(a1 + 40);
  if (v1)
  {
    v3 = (_DWORD *)MEMORY[0x1E0CA1FC0];
    do
    {
      v4 = (void *)MEMORY[0x1A858DD40]();
      if (*v3 == 1)
        kdebug_trace();
      -[BWFaceTrackingNode _processSampleBuffer:](*(_QWORD *)(a1 + 32), v1);
      CFRelease(v1);
      os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 104));
      v1 = CMSimpleQueueDequeue(*(CMSimpleQueueRef *)(*(_QWORD *)(a1 + 32) + 136));
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 128) = v1 != 0;
      os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 104));
      if (*v3 == 1)
        kdebug_trace();
      objc_autoreleasePoolPop(v4);
    }
    while (v1);
  }
}

intptr_t __43__BWFaceTrackingNode__processSampleBuffer___block_invoke(uint64_t a1, void *a2)
{
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 120));
}

- (uint64_t)_depthIntrinsicsExtrinsicsFromRGBIntrisics:(unint64_t)a3 colorWidth:(unint64_t)a4 colorHeight:(unint64_t)a5 depthWidth:(double)a6 depthHeight:(double)a7
{
  double v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  double v20;
  void *v21;
  void *v22;
  uint64_t *v23;
  _QWORD *v24;
  float v25;
  float v26;
  float v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  float v32;
  float v33;
  _QWORD v34[2];
  _QWORD v35[2];
  _QWORD v36[2];
  _QWORD v37[2];
  _QWORD v38[3];
  _QWORD v39[3];
  uint64_t v40;
  _QWORD v41[3];
  _QWORD v42[3];
  _QWORD v43[4];

  v43[3] = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v9 = a6;
    *(float *)&a6 = (float)a4;
    v10 = (float)a5;
    v11 = (float)a4 / (float)a5;
    v12 = (float)a2;
    v13 = (float)a3;
    v14 = (float)a2 / (float)a3;
    v15 = *((float *)&a7 + 1);
    v16 = *((float *)&a8 + 1);
    v17 = v11 - v14;
    if (v11 < v14)
      v17 = v14 - v11;
    if (v17 < 0.01)
    {
      v18 = *(float *)&a6 / v12;
      v19 = v10 / v13;
      *(float *)&a6 = *(float *)&v9 * (float)(*(float *)&a6 / v12);
      v32 = *(float *)&a8;
      v42[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", a6);
      v42[1] = &unk_1E49F8CB8;
      v42[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (v32 + 0.5) * v18 + -0.5);
      v43[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 3);
      v41[0] = &unk_1E49F8CB8;
      *(float *)&v20 = v15 * v19;
      v41[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v20);
      v21 = &unk_1E4A00560;
      v22 = &unk_1E4A00500;
      v23 = v43;
      v24 = v41;
LABEL_11:
      v24[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (v16 + 0.5) * v19 + -0.5);
      v23[1] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 3);
      v23[2] = (uint64_t)v22;
      v29 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 3);
      v36[0] = getkCVAFaceTracking_Rotation();
      v37[0] = v21;
      v36[1] = getkCVAFaceTracking_Translation();
      v37[1] = &unk_1E4A005F0;
      v30 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 2);
      v34[0] = getkCVAFaceTracking_Intrinsics();
      v35[0] = v29;
      v34[1] = getkCVAFaceTracking_Extrinsics();
      v35[1] = v30;
      return objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
    }
    v25 = 1.0 / v14;
    if (v11 >= v25)
      v26 = v11 - v25;
    else
      v26 = v25 - v11;
    if (v26 < 0.01)
    {
      v19 = v10 / v12;
      v27 = *(float *)&a6 / v13;
      *(float *)&a6 = *((float *)&a7 + 1) * (float)(*(float *)&a6 / v13);
      v31 = v9;
      v33 = *(float *)&a8;
      v39[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", a6);
      v39[1] = &unk_1E49F8CB8;
      v39[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)a4 - (v16 + 0.5) * v27 + -0.5);
      v40 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 3);
      v38[0] = &unk_1E49F8CB8;
      HIDWORD(v28) = HIDWORD(v31);
      *(float *)&v28 = *(float *)&v31 * v19;
      v21 = &unk_1E4A005D8;
      v38[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v28);
      v22 = &unk_1E4A00578;
      v23 = &v40;
      v24 = v38;
      v16 = v33;
      goto LABEL_11;
    }
    return 0;
  }
  return result;
}

- (BOOL)frontCamera
{
  return self->_frontCamera;
}

- (BOOL)mirrored
{
  return self->_mirrored;
}

- (int)orientation
{
  return self->_orientation;
}

- (int)maxFaces
{
  return self->_faceTrackingMaxFaces;
}

- (BOOL)usesFaceRecognition
{
  return self->_faceTrackingUsesFaceRecognition;
}

- (BOOL)faceTrackingPlusEnabled
{
  return self->_faceTrackingPlusEnabled;
}

- (float)networkFailureThresholdMultiplier
{
  return self->_faceTrackingNetworkFailureThresholdMultiplier;
}

- (float)trackingFailureFieldOfViewModifier
{
  return self->_faceTrackingFailureFieldOfViewModifier;
}

- (void)setTrackingFailureFieldOfViewModifier:(float)a3
{
  self->_faceTrackingFailureFieldOfViewModifier = a3;
}

- (void)_setupCVA
{
  uint64_t v0;
  void *v1;

  v1 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CFStringRef getkCVAFaceTracking_TrackingFailureFieldOfViewModifier(void)");
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("BWFaceTrackingNode.m"), 78, CFSTR("%s"), OUTLINED_FUNCTION_0());
  __break(1u);
}

@end
