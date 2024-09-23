@implementation BWOverCaptureSmartStyleApplyNode

+ (void)initialize
{
  objc_opt_class();
}

- (BWOverCaptureSmartStyleApplyNode)initWithMetalCommandQueue:(id)a3
{
  BWOverCaptureSmartStyleApplyNode *v4;
  BWOverCaptureSmartStyleApplyNode *v5;
  uint64_t v6;
  uint64_t v7;
  BWVideoFormatRequirements *v8;
  BWVideoFormatRequirements *v9;
  BWNodeInput *v10;
  BWNodeInputMediaConfiguration *v11;
  BWVideoFormatRequirements *v12;
  BWVideoFormatRequirements *v13;
  BWNodeOutput *v14;
  uint64_t v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)BWOverCaptureSmartStyleApplyNode;
  v4 = -[BWNode init](&v17, sel_init);
  v5 = v4;
  if (v4)
  {
    v6 = -[BWOverCaptureSmartStyleApplyNode _updateSupportedPixelFormats](v4, "_updateSupportedPixelFormats");
    if (!v6)
      goto LABEL_9;
    v7 = v6;
    v5->_renderingMethod = 1;
    v5->_maxLossyCompressionLevel = 0;
    v5->_metalCommandQueue = (MTLCommandQueue *)a3;
    v8 = objc_alloc_init(BWVideoFormatRequirements);
    if (!v8)
      goto LABEL_9;
    v9 = v8;
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v8, "setSupportedPixelFormats:", v7);
    v10 = -[BWNodeInput initWithMediaType:node:]([BWNodeInput alloc], "initWithMediaType:node:", 1986618469, v5);
    -[BWNodeInput setFormatRequirements:](v10, "setFormatRequirements:", v9);
    -[BWNodeInput setPassthroughMode:](v10, "setPassthroughMode:", 1);
    v11 = objc_alloc_init(BWNodeInputMediaConfiguration);
    -[BWNodeInputMediaConfiguration setFormatRequirements:](v11, "setFormatRequirements:", objc_alloc_init(BWVideoFormatRequirements));
    -[BWNodeInputMediaConfiguration setPassthroughMode:](v11, "setPassthroughMode:", 0);
    -[BWNodeInputMediaConfiguration setRetainedBufferCount:](v11, "setRetainedBufferCount:", 6);
    -[BWNodeInput setMediaConfiguration:forAttachedMediaKey:](v10, "setMediaConfiguration:forAttachedMediaKey:", v11, 0x1E495B358);
    -[BWNode addInput:](v5, "addInput:", v10);
    v12 = objc_alloc_init(BWVideoFormatRequirements);
    if (!v12)
      goto LABEL_9;
    v13 = v12;
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v12, "setSupportedPixelFormats:", v7);
    v14 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1986618469, v5);
    -[BWNodeOutput setFormatRequirements:](v14, "setFormatRequirements:", v13);
    -[BWNodeOutput setPassthroughMode:](v14, "setPassthroughMode:", 1);
    -[BWNode addOutput:](v5, "addOutput:", v14);
    if (-[BWOverCaptureSmartStyleApplyNode _loadAndConfigureSmartStyleBundle](v5, "_loadAndConfigureSmartStyleBundle"))
      goto LABEL_9;
    v15 = FigDispatchQueueCreateWithPriority();
    v5->_stylesProxyRendererLoadQueue = (OS_dispatch_queue *)v15;
    if (v15)
    {
      v5->_applyDither = 1;
    }
    else
    {
LABEL_9:
      fig_log_get_emitter();
      FigDebugAssert3();
      return 0;
    }
  }
  return v5;
}

- (void)setMaxLossyCompressionLevel:(int)a3
{
  BWFormatRequirements *v5;
  BWFormatRequirements *v6;
  id v7;
  id v8;

  if (self->_maxLossyCompressionLevel != a3)
  {
    v5 = -[BWNodeInput formatRequirements](self->super._input, "formatRequirements");
    v6 = -[BWNodeOutput formatRequirements](self->super._output, "formatRequirements");
    self->_maxLossyCompressionLevel = a3;
    v7 = -[BWOverCaptureSmartStyleApplyNode _updateSupportedPixelFormats](self, "_updateSupportedPixelFormats");
    if (v7)
    {
      v8 = v7;
      -[BWFormatRequirements setSupportedPixelFormats:](v5, "setSupportedPixelFormats:", v7);
      -[BWFormatRequirements setSupportedPixelFormats:](v6, "setSupportedPixelFormats:", v8);
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
  }
}

- (void)dealloc
{
  __CVBuffer *identityCoefficientsPixelBuffer;
  opaqueCMSampleBuffer *mostRecentCoefficients;
  __CVBuffer *previewThumbnailBuffer;
  NSObject *stylesProxyRendererLoadQueue;
  objc_super v7;

  dispatch_sync((dispatch_queue_t)self->_stylesProxyRendererLoadQueue, &__block_literal_global_38);
  objc_msgSend((id)-[CMISmartStyleProcessor utilities](self->_smartStyleProcessor, "utilities"), "resetCoefficientsFilter");

  identityCoefficientsPixelBuffer = self->_identityCoefficientsPixelBuffer;
  if (identityCoefficientsPixelBuffer)
    CFRelease(identityCoefficientsPixelBuffer);
  mostRecentCoefficients = self->_mostRecentCoefficients;
  if (mostRecentCoefficients)
    CFRelease(mostRecentCoefficients);

  previewThumbnailBuffer = self->_previewThumbnailBuffer;
  if (previewThumbnailBuffer)
    CFRelease(previewThumbnailBuffer);
  stylesProxyRendererLoadQueue = self->_stylesProxyRendererLoadQueue;
  if (stylesProxyRendererLoadQueue)
  {
    dispatch_release(stylesProxyRendererLoadQueue);
    self->_stylesProxyRendererLoadQueue = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)BWOverCaptureSmartStyleApplyNode;
  -[BWNode dealloc](&v7, sel_dealloc);
}

- (id)nodeType
{
  return CFSTR("Effect");
}

- (id)nodeSubType
{
  return CFSTR("SmartStylePostStitcherApply");
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4 forAttachedMediaKey:(id)a5
{
  BWFormatRequirements *v9;
  BWPixelBufferPool *v10;
  BWPixelBufferPool *v11;
  objc_super v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  if (!a3 || !a4)
    goto LABEL_11;
  if (objc_msgSend(a5, "isEqualToString:", CFSTR("PrimaryFormat")))
  {
    v9 = -[BWNodeOutput formatRequirements](self->super._output, "formatRequirements");
    -[BWFormatRequirements setWidth:](v9, "setWidth:", objc_msgSend(a3, "width"));
    -[BWFormatRequirements setHeight:](v9, "setHeight:", objc_msgSend(a3, "height"));
    v14[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(a3, "pixelFormat"));
    -[BWFormatRequirements setSupportedPixelFormats:](v9, "setSupportedPixelFormats:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1));
    v13 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(a3, "colorSpaceProperties"));
    -[BWFormatRequirements setSupportedColorSpaceProperties:](v9, "setSupportedColorSpaceProperties:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1));
    -[BWNodeOutput setFormat:](self->super._output, "setFormat:", a3);
    return;
  }
  if (objc_msgSend(a5, "isEqual:", 0x1E495B358))
  {
    v10 = [BWPixelBufferPool alloc];
    v11 = -[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:](v10, "initWithVideoFormat:capacity:name:memoryPool:", a3, self->_filteredCoefficientsPixelBufferPoolSize, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BWOverCaptureSmartStyleApplyNode filtered coefficients buffer pool")), -[BWNodeOutput memoryPool](self->super._output, "memoryPool"));
    self->_filteredCoefficientsPixelBufferPool = v11;
    if (!v11)
    {
LABEL_11:
      fig_log_get_emitter();
      FigDebugAssert3();
    }
  }
  else if ((objc_msgSend(BWAttachedMediaKeysRequiredBySmartStyleRenderingPipelines(1, 1), "containsObject:", a5) & 1) == 0)
  {
    v12.receiver = self;
    v12.super_class = (Class)BWOverCaptureSmartStyleApplyNode;
    -[BWNode didSelectFormat:forInput:forAttachedMediaKey:](&v12, sel_didSelectFormat_forInput_forAttachedMediaKey_, a3, a4, a5);
  }
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  NSObject *stylesProxyRendererLoadQueue;
  _QWORD block[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BWOverCaptureSmartStyleApplyNode;
  -[BWNode prepareForCurrentConfigurationToBecomeLive](&v5, sel_prepareForCurrentConfigurationToBecomeLive);
  stylesProxyRendererLoadQueue = self->_stylesProxyRendererLoadQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__BWOverCaptureSmartStyleApplyNode_prepareForCurrentConfigurationToBecomeLive__block_invoke;
  block[3] = &unk_1E491E720;
  block[4] = self;
  dispatch_async(stylesProxyRendererLoadQueue, block);
  self->_currentGlobalLocalMixFactor = 1.0;
}

uint64_t __78__BWOverCaptureSmartStyleApplyNode_prepareForCurrentConfigurationToBecomeLive__block_invoke(uint64_t a1)
{
  uint64_t result;

  if (objc_msgSend(*(id *)(a1 + 32), "_loadAndConfigureSmartStyleProxyRenderer")
    || objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "setup")
    || objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "prepareToProcess:", 4)
    || (result = objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "utilities"), "resetCoefficientsFilter"), (_DWORD)result))
  {
    fig_log_get_emitter();
    return FigDebugAssert3();
  }
  return result;
}

- (void)didReachEndOfDataForInput:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWOverCaptureSmartStyleApplyNode;
  -[BWNode didReachEndOfDataForInput:](&v3, sel_didReachEndOfDataForInput_, a3);
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  uint64_t v4;
  uint64_t renderingMethod;
  int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  if (!a3
    || !a4
    || (-[BWOverCaptureSmartStyleApplyNode _updateCurrentStyle:](self, "_updateCurrentStyle:", a3),
        renderingMethod = self->_renderingMethod,
        !CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0)))
  {
    fig_log_get_emitter();
    v11 = v4;
    LODWORD(v10) = 0;
LABEL_12:
    FigDebugAssert3();
    goto LABEL_9;
  }
  if ((_DWORD)renderingMethod == 1)
  {
    -[BWOverCaptureSmartStyleApplyNode _canRenderWithStyleEngineApplyForInput:](self, "_canRenderWithStyleEngineApplyForInput:", a3);
    v8 = -[BWOverCaptureSmartStyleApplyNode _applySmartStyleOnSampleBuffer:](self, "_applySmartStyleOnSampleBuffer:", a3);
    if (v8)
    {
LABEL_11:
      v9 = v8;
      fig_log_get_emitter();
      v11 = v4;
      LODWORD(v10) = v9;
      goto LABEL_12;
    }
  }
  else if ((_DWORD)renderingMethod)
  {
    v8 = -[BWOverCaptureSmartStyleApplyNode _applySmartStyleProxyRenderingWithMethod:onSampleBuffer:](self, "_applySmartStyleProxyRenderingWithMethod:onSampleBuffer:", renderingMethod, a3);
    if (v8)
      goto LABEL_11;
  }
LABEL_9:
  -[BWOverCaptureSmartStyleApplyNode _consumeSampleBufferAttachments:](self, "_consumeSampleBufferAttachments:", a3, v10, v11);
  -[BWNodeOutput emitSampleBuffer:](self->super._output, "emitSampleBuffer:", a3);
}

- (void)_updateCurrentStyle:(opaqueCMSampleBuffer *)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  CMISmartStyle *currentStyle;

  v4 = objc_msgSend((id)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0), "objectForKeyedSubscript:", *MEMORY[0x1E0D060B0]);
  if (v4)
  {
    v5 = +[FigCaptureSmartStyle createFromDictionary:](FigCaptureSmartStyle, "createFromDictionary:", v4);
    if (v5)
    {
      v6 = v5;
      currentStyle = self->_currentStyle;
      if (!currentStyle)
        currentStyle = (CMISmartStyle *)objc_alloc_init(self->_smartStyleClass);
      self->_currentStyle = currentStyle;
      -[CMISmartStyle setCastType:](self->_currentStyle, "setCastType:", objc_msgSend(v6, "cast"));
      objc_msgSend(v6, "intensity");
      -[CMISmartStyle setCastIntensity:](self->_currentStyle, "setCastIntensity:");
      objc_msgSend(v6, "toneBias");
      -[CMISmartStyle setToneBias:](self->_currentStyle, "setToneBias:");
      objc_msgSend(v6, "colorBias");
      -[CMISmartStyle setColorBias:](self->_currentStyle, "setColorBias:");
    }
  }
}

- (BOOL)_canRenderWithStyleEngineApplyForInput:(opaqueCMSampleBuffer *)a3
{
  return BWSampleBufferGetAttachedMedia(a3, 0x1E495B358) != 0;
}

- (int)_applySmartStyleOnSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  uint64_t v3;
  CGSize v4;
  _DWORD *v5;
  CMTimeEpoch epoch;
  CMTimeFlags flags;
  float v10;
  __CVBuffer *ImageBuffer;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  CFTypeRef v15;
  void *v16;
  id v17;
  const __CFDictionary *v18;
  int v19;
  void *v20;
  int *v21;
  float v22;
  float v23;
  OSStatus SampleTimingInfoArray;
  __CVBuffer **p_identityCoefficientsPixelBuffer;
  __CVBuffer *identityCoefficientsPixelBuffer;
  CMSampleBufferRef AttachedMedia;
  opaqueCMSampleBuffer *v28;
  __CVBuffer *v29;
  __CVBuffer *v30;
  const __CFAllocator *v31;
  size_t Width;
  size_t Height;
  OSType PixelFormatType;
  CVReturn v35;
  int v36;
  uint64_t v37;
  int v38;
  int v39;
  opaqueCMSampleBuffer *mostRecentCoefficients;
  float v41;
  float v42;
  CVImageBufferRef v43;
  __CVBuffer *v44;
  const __CFDictionary *v45;
  const __CFDictionary *v46;
  const __CFDictionary *v47;
  const __CFDictionary *v48;
  int v49;
  void *v50;
  opaqueCMSampleBuffer *v51;
  __CVBuffer *v52;
  __CVBuffer *v53;
  __CVBuffer *PixelBuffer;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  void *v58;
  int v59;
  __CVBuffer *v60;
  void *v61;
  unint64_t filterType;
  double v63;
  float v64;
  uint64_t v65;
  int v66;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  CMTimeEpoch v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  CMTimeFlags v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  CMSampleTimingInfo sampleTiming;
  CMSampleTimingInfo time;
  float v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect rect;
  CFTypeRef v87;
  CMSampleBufferRef v88;
  CMTimeValue value;
  CMTimeScale timescale;
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  v87 = 0;
  v88 = 0;
  value = *MEMORY[0x1E0CA2E68];
  timescale = *(_DWORD *)(MEMORY[0x1E0CA2E68] + 8);
  v4 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
  rect.origin = (CGPoint)*MEMORY[0x1E0C9D628];
  rect.size = v4;
  v85.origin = rect.origin;
  v85.size = v4;
  v84.origin = rect.origin;
  v84.size = v4;
  v83.origin = rect.origin;
  v83.size = v4;
  v82 = 0.0;
  v5 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (!a3)
  {
    v75 = *(_DWORD *)(MEMORY[0x1E0CA2E68] + 12);
    epoch = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
    fig_log_get_emitter();
LABEL_89:
    FigDebugAssert3();
    goto LABEL_90;
  }
  if (!self)
  {
    v17 = 0;
    epoch = 0;
    v75 = 0;
    v18 = 0;
    ImageBuffer = 0;
    timescale = 0;
    value = 0;
LABEL_14:
    v19 = -12780;
    goto LABEL_75;
  }
  -[BWOverCaptureSmartStyleApplyNode _getSampleBufferPresentationTimeStamp:](self, "_getSampleBufferPresentationTimeStamp:");
  epoch = time.duration.epoch;
  value = time.duration.value;
  flags = time.duration.flags;
  timescale = time.duration.timescale;
  v75 = time.duration.flags;
  if ((time.duration.flags & 1) == 0)
  {
LABEL_90:
    v17 = 0;
    v18 = 0;
    ImageBuffer = 0;
    goto LABEL_14;
  }
  if (!self->_didSetTimeToStartStyleEngineBypass)
  {
    time.duration.value = value;
    time.duration.timescale = timescale;
    v10 = CMTimeGetSeconds(&time.duration) + 0.5;
    self->_timeToStartStyleEngineBypass = v10;
    self->_didSetTimeToStartStyleEngineBypass = 1;
  }
  if (*v5 == 1)
  {
    time.duration.value = value;
    time.duration.timescale = timescale;
    time.duration.flags = flags;
    time.duration.epoch = epoch;
    CMTimeGetSeconds(&time.duration);
    kdebug_trace();
  }
  ImageBuffer = CMSampleBufferGetImageBuffer(a3);
  if (!ImageBuffer)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v17 = 0;
    v18 = 0;
    goto LABEL_14;
  }
  -[BWOverCaptureSmartStyleApplyNode _computeAffineTransform:mirror:](self, "_computeAffineTransform:mirror:", -[BWOverCaptureSmartStyleApplyNode _getRotationConfigForPixelBuffer:](self, "_getRotationConfigForPixelBuffer:", ImageBuffer), -[BWOverCaptureSmartStyleApplyNode _getMirrorConfigForPixelBuffer:](self, "_getMirrorConfigForPixelBuffer:", ImageBuffer));
  v73 = v13;
  v74 = v12;
  v72 = v14;
  v15 = CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  if (!v15)
  {
    fig_log_get_emitter();
    goto LABEL_89;
  }
  v16 = (void *)v15;
  if (BWSmartStyleRenderingShouldBeBypassed(a3))
  {
    time.duration.value = value;
    time.duration.timescale = timescale;
    time.duration.flags = flags;
    time.duration.epoch = epoch;
    if (CMTimeGetSeconds(&time.duration) > self->_timeToStartStyleEngineBypass)
    {
      v17 = 0;
      v18 = 0;
      ImageBuffer = 0;
      v19 = 0;
      self->_currentGlobalLocalMixFactor = 1.0;
      goto LABEL_75;
    }
  }
  else
  {
    self->_didSetTimeToStartStyleEngineBypass = 0;
  }
  v20 = (void *)-[CMISmartStyle castType](self->_currentStyle, "castType");
  v21 = &OBJC_IVAR___BWQuickTimeMovieFileSinkNode__stereoVideoCaptureDuration;
  if (objc_msgSend(v20, "isEqual:", FigSmartStyleCastTypeStandard)
    && (-[CMISmartStyle toneBias](self->_currentStyle, "toneBias"), v22 == 0.0)
    && (-[CMISmartStyle colorBias](self->_currentStyle, "colorBias"), v23 == 0.0)
    || !objc_msgSend((id)CMGetAttachment(a3, CFSTR("SmartStyleApplyWithIdentityCoefficients"), 0), "BOOLValue"))
  {
    AttachedMedia = (CMSampleBufferRef)BWSampleBufferGetAttachedMedia(a3, 0x1E495B358);
    v18 = 0;
    goto LABEL_30;
  }
  memset(&time, 0, sizeof(time));
  SampleTimingInfoArray = CMSampleBufferGetSampleTimingInfoArray(a3, 1, &time, 0);
  if (SampleTimingInfoArray)
  {
    v19 = SampleTimingInfoArray;
    fig_log_get_emitter();
    FigDebugAssert3();
    v18 = 0;
LABEL_107:
    v17 = 0;
    ImageBuffer = 0;
    goto LABEL_75;
  }
  p_identityCoefficientsPixelBuffer = &self->_identityCoefficientsPixelBuffer;
  identityCoefficientsPixelBuffer = self->_identityCoefficientsPixelBuffer;
  if (identityCoefficientsPixelBuffer)
  {
    v18 = 0;
    goto LABEL_28;
  }
  v71 = epoch;
  v28 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a3, 0x1E495B358);
  v29 = CMSampleBufferGetImageBuffer(v28);
  if (!v29)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v18 = 0;
    v19 = -12780;
LABEL_106:
    epoch = v71;
    goto LABEL_107;
  }
  v30 = v29;
  v18 = CVPixelBufferCopyCreationAttributes(v29);
  v31 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  Width = CVPixelBufferGetWidth(v30);
  Height = CVPixelBufferGetHeight(v30);
  PixelFormatType = CVPixelBufferGetPixelFormatType(v30);
  v35 = CVPixelBufferCreate(v31, Width, Height, PixelFormatType, v18, &self->_identityCoefficientsPixelBuffer);
  if (v35)
  {
    v19 = v35;
    v5 = (_DWORD *)MEMORY[0x1E0CA1FC0];
    goto LABEL_106;
  }
  v21 = &OBJC_IVAR___BWQuickTimeMovieFileSinkNode__stereoVideoCaptureDuration;
  v19 = objc_msgSend((id)-[CMISmartStyleProcessor utilities](self->_smartStyleProcessor, "utilities"), "createIdentityTransformCoefficients:", *p_identityCoefficientsPixelBuffer);
  identityCoefficientsPixelBuffer = *p_identityCoefficientsPixelBuffer;
  v5 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (!*p_identityCoefficientsPixelBuffer)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_106;
  }
  epoch = v71;
LABEL_28:
  sampleTiming = time;
  v36 = BWSampleBufferCreateFromPixelBufferWithTimingInfo(identityCoefficientsPixelBuffer, &sampleTiming, &v87, &v88);
  if (v36)
  {
    v19 = v36;
    goto LABEL_107;
  }
  AttachedMedia = v88;
LABEL_30:
  v37 = *MEMORY[0x1E0D06D20];
  v38 = objc_msgSend((id)objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D20]), "intValue");
  if (!AttachedMedia)
  {
    mostRecentCoefficients = self->_mostRecentCoefficients;
    if (!mostRecentCoefficients)
    {
      v17 = 0;
      ImageBuffer = 0;
      v19 = -12783;
LABEL_39:
      v5 = (_DWORD *)MEMORY[0x1E0CA1FC0];
      goto LABEL_75;
    }
LABEL_41:
    self->_applyGlobalMostRecentCoefficients = 1;
    self->_currentGlobalLocalMixFactor = 1.0;
    AttachedMedia = mostRecentCoefficients;
    goto LABEL_42;
  }
  v39 = v38;
  mostRecentCoefficients = self->_mostRecentCoefficients;
  if (v39 != self->_mostRecentQuadraBinningFactor)
  {
    if (!mostRecentCoefficients)
      goto LABEL_42;
    goto LABEL_41;
  }
  if (mostRecentCoefficients)
  {
    CFRelease(mostRecentCoefficients);
    self->_mostRecentCoefficients = 0;
  }
  self->_mostRecentCoefficients = (opaqueCMSampleBuffer *)CFRetain(AttachedMedia);
  self->_applyGlobalMostRecentCoefficients = 0;
  v41 = self->_currentGlobalLocalMixFactor - self->_globalLocalSystemMixFactorDecayRate;
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)((char *)&self->super.super.isa + v21[992]), "configuration"), "styleEngineConfiguration"), "globalLinearSystemMixFactor");
  if (v41 >= v42)
    v42 = v41;
  self->_currentGlobalLocalMixFactor = v42;
LABEL_42:
  self->_mostRecentQuadraBinningFactor = objc_msgSend((id)objc_msgSend(v16, "objectForKeyedSubscript:", v37), "intValue");
  v43 = CMSampleBufferGetImageBuffer(AttachedMedia);
  if (!v43
    || (v44 = v43,
        (v45 = (const __CFDictionary *)objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0D060D8])) != 0)
    && !CGRectMakeWithDictionaryRepresentation(v45, &rect)
    || (v46 = (const __CFDictionary *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05D10], 0)) != 0
    && !CGRectMakeWithDictionaryRepresentation(v46, &v85)
    || (v47 = (const __CFDictionary *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05C80], 0)) != 0
    && !CGRectMakeWithDictionaryRepresentation(v47, &v84)
    || (v78 = 0u,
        v79 = 0u,
        (v48 = (const __CFDictionary *)CMGetAttachment(a3, CFSTR("OverCaptureStitchedValidBufferRect"), 0)) != 0)
    && !CGRectMakeWithDictionaryRepresentation(v48, &v83))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v17 = 0;
    ImageBuffer = 0;
    v19 = -12780;
    goto LABEL_39;
  }
  v76 = 0u;
  v77 = 0u;
  v49 = -[BWOverCaptureSmartStyleApplyNode _calculateExtrapolationAndSpotlightZoom:inputCropRectWithinPrimaryCaptureRect:learningROIRect:adjustedPrimaryCaptureRect:adjustedSpotlightZoomRect:](self, "_calculateExtrapolationAndSpotlightZoom:inputCropRectWithinPrimaryCaptureRect:learningROIRect:adjustedPrimaryCaptureRect:adjustedSpotlightZoomRect:", &v78, &v76, v85.origin.x, v85.origin.y, v85.size.width, v85.size.height, v84.origin.x, v84.origin.y, v84.size.width, v84.size.height, *(_QWORD *)&rect.origin.x, *(_QWORD *)&rect.origin.y, *(_QWORD *)&rect.size.width, *(_QWORD *)&rect.size.height);
  if (v49)
  {
    v19 = v49;
    fig_log_get_emitter();
    FigDebugAssert3();
    v17 = 0;
LABEL_99:
    ImageBuffer = 0;
    goto LABEL_39;
  }
  v17 = objc_alloc_init(self->_smartStyleProcessorInputOutputClass);
  if (!v17)
    goto LABEL_100;
  v50 = (void *)CMGetAttachment(a3, CFSTR("PreviewStitcherPrimaryCameraTransitionInProgress"), 0);
  if (self->_useOptimizedThumbnailGeneration
    && (objc_msgSend(v50, "BOOLValue") & 1) == 0
    && !self->_applyGlobalMostRecentCoefficients)
  {
    v51 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a3, 0x1E495B3B8);
    if (v51)
    {
      v52 = CMSampleBufferGetImageBuffer(v51);
      if (v52)
      {
        v53 = v52;
        if (self->_previewThumbnailBuffer)
        {
LABEL_61:
          v55 = -[MTLCommandQueue commandBuffer](self->_metalCommandQueue, "commandBuffer");
          if (!v55)
          {
            fig_log_get_emitter();
            FigDebugAssert3();
            v19 = FigSignalErrorAt();
            ImageBuffer = 0;
            v5 = (_DWORD *)MEMORY[0x1E0CA1FC0];
            goto LABEL_75;
          }
          v56 = (void *)v55;
          if (!-[CMISmartStyleOvercaptureThumbnailGenerator generateOvercaptureIntegrationThumbnailFromPreviewThumbnailPixelBuffer:stitcherOutputPixelBuffer:outputOvercaptureIntegrationThumbnailPixelBuffer:primaryCaptureRect:inputCropRectWithinPrimaryCaptureRect:affineTransformForPreviewThumbnailPixelBuffer:optionalCommandBuffer:](self->_overcaptureThumbnailGenerator, "generateOvercaptureIntegrationThumbnailFromPreviewThumbnailPixelBuffer:stitcherOutputPixelBuffer:outputOvercaptureIntegrationThumbnailPixelBuffer:primaryCaptureRect:inputCropRectWithinPrimaryCaptureRect:affineTransformForPreviewThumbnailPixelBuffer:optionalCommandBuffer:", v53, ImageBuffer, self->_previewThumbnailBuffer, v55, v85.origin.x, v85.origin.y, v85.size.width, v85.size.height, v84.origin.x, v84.origin.y, v84.size.width, v84.size.height, v74, v73, v72))
            objc_msgSend(v17, "setInputUnstyledThumbnailPixelBuffer:", self->_previewThumbnailBuffer);
          objc_msgSend(v56, "commit", v69, v70);
          goto LABEL_65;
        }
        CVPixelBufferGetPixelFormatType(v52);
        PixelBuffer = (__CVBuffer *)CreatePixelBuffer();
        self->_previewThumbnailBuffer = PixelBuffer;
        if (PixelBuffer)
        {
          CVBufferPropagateAttachments(ImageBuffer, PixelBuffer);
          goto LABEL_61;
        }
      }
    }
    fig_log_get_emitter();
    LODWORD(v68) = 0;
    FigDebugAssert3();
    objc_msgSend(0, "commit", v68, v3);
  }
LABEL_65:
  objc_msgSend(v17, "setInputUnstyledPixelBuffer:", ImageBuffer);
  objc_msgSend(v17, "setInputMetadataDict:", v16);
  objc_msgSend(v17, "setOutputStyledPixelBuffer:", ImageBuffer);
  objc_msgSend(v17, "setPrimaryCaptureRect:", v78, v79);
  objc_msgSend(v17, "setInputCropRectWithinPrimaryCaptureRect:", v76, v77);
  objc_msgSend(v17, "setSpotlightAffineTransform:", *(double *)&v74, *(double *)&v73, *(double *)&v72);
  objc_msgSend(v17, "setOutputRenderRect:", v83.origin.x, v83.origin.y, v83.size.width, v83.size.height);
  objc_msgSend(v17, "setApplyDither:", self->_applyDither);
  if (!self->_filterType)
  {
    ImageBuffer = 0;
    goto LABEL_70;
  }
  v57 = v21[992];
  v58 = (void *)objc_msgSend(*(id *)((char *)&self->super.super.isa + v57), "utilities");
  time.duration.value = value;
  time.duration.timescale = timescale;
  time.duration.flags = v75;
  time.duration.epoch = epoch;
  v59 = objc_msgSend(v58, "enqueueCoefficientsForFiltering:withMetadata:pts:", v44, v16, &time);
  if (v59)
  {
    v19 = v59;
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_99;
  }
  v60 = -[BWPixelBufferPool newPixelBuffer](self->_filteredCoefficientsPixelBufferPool, "newPixelBuffer");
  if (!v60)
  {
LABEL_100:
    fig_log_get_emitter();
    FigDebugAssert3();
    ImageBuffer = 0;
    v19 = -12786;
    goto LABEL_39;
  }
  v44 = v60;
  v61 = (void *)objc_msgSend(*(id *)((char *)&self->super.super.isa + v57), "utilities");
  filterType = self->_filterType;
  time.duration.value = value;
  time.duration.timescale = timescale;
  time.duration.flags = v75;
  time.duration.epoch = epoch;
  objc_msgSend(v61, "filterCoefficientsForFrameWithMetadata:pts:filterType:toPixelBuffer:toGlobalRemixFactor:", v16, &time, filterType, v44, &v82);
  ImageBuffer = v44;
LABEL_70:
  objc_msgSend(v17, "setInputStyleCoefficientsPixelBuffer:", v44);
  *(float *)&v63 = self->_currentGlobalLocalMixFactor;
  v64 = *(float *)&v63 + (float)(v82 * (float)(1.0 - *(float *)&v63));
  if (v64 > *(float *)&v63)
  {
    self->_currentGlobalLocalMixFactor = v64;
    *(float *)&v63 = v64;
  }
  objc_msgSend(v17, "setGlobalLinearSystemMixFactor:", v63);
  v65 = v21[992];
  objc_msgSend(*(id *)((char *)&self->super.super.isa + v65), "setInputOutput:", v17);
  v66 = objc_msgSend(*(id *)((char *)&self->super.super.isa + v65), "process");
  v5 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (v66)
  {
    v19 = v66;
    fig_log_get_emitter();
  }
  else
  {
    v19 = objc_msgSend(*(id *)((char *)&self->super.super.isa + v65), "finishProcessing");
    if (!v19)
    {
      objc_msgSend(v16, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D060A8]);
      goto LABEL_75;
    }
    fig_log_get_emitter();
  }
  FigDebugAssert3();
LABEL_75:
  if (*v5 == 1)
  {
    time.duration.value = value;
    time.duration.timescale = timescale;
    time.duration.flags = v75;
    time.duration.epoch = epoch;
    CMTimeGetSeconds(&time.duration);
    kdebug_trace();
  }

  if (v18)
    CFRelease(v18);
  if (v88)
    CFRelease(v88);
  if (v87)
    CFRelease(v87);
  if (ImageBuffer)
    CFRelease(ImageBuffer);
  return v19;
}

- (int)_applySmartStyleProxyRenderingWithMethod:(int)a3 onSampleBuffer:(opaqueCMSampleBuffer *)a4
{
  CMTimeFlags flags;
  CMTimeEpoch epoch;
  _DWORD *v8;
  uint64_t v9;
  CVImageBufferRef ImageBuffer;
  CVImageBufferRef v11;
  CFTypeRef v12;
  void *v13;
  uint64_t v14;
  int v15;
  int v16;
  CMTime time;
  CMISmartStyle *currentStyle;
  CMTimeValue value;
  CMTimeScale timescale;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  value = *MEMORY[0x1E0CA2E68];
  flags = *(_DWORD *)(MEMORY[0x1E0CA2E68] + 12);
  timescale = *(_DWORD *)(MEMORY[0x1E0CA2E68] + 8);
  epoch = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  v8 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (a3 == 2)
  {
    v9 = 1;
  }
  else
  {
    if (a3 != 3)
    {
LABEL_16:
      fig_log_get_emitter();
LABEL_17:
      FigDebugAssert3();
      goto LABEL_19;
    }
    v9 = 2;
  }
  if (!a4)
    goto LABEL_16;
  if (!self)
  {
    flags = 0;
    epoch = 0;
    timescale = 0;
    value = 0;
    goto LABEL_19;
  }
  -[BWOverCaptureSmartStyleApplyNode _getSampleBufferPresentationTimeStamp:](self, "_getSampleBufferPresentationTimeStamp:", a4);
  epoch = time.epoch;
  value = time.value;
  flags = time.flags;
  timescale = time.timescale;
  if ((time.flags & 1) == 0)
  {
LABEL_19:
    v16 = -12780;
    goto LABEL_20;
  }
  if (*v8 == 1)
  {
    time.value = value;
    time.timescale = timescale;
    CMTimeGetSeconds(&time);
    kdebug_trace();
  }
  ImageBuffer = CMSampleBufferGetImageBuffer(a4);
  if (!ImageBuffer || (v11 = ImageBuffer, (v12 = CMGetAttachment(a4, (CFStringRef)*MEMORY[0x1E0D05CB0], 0)) == 0))
  {
    fig_log_get_emitter();
    goto LABEL_17;
  }
  v13 = (void *)v12;
  if ((BWSmartStyleRenderingShouldBeBypassed(a4) & 1) != 0)
  {
    v16 = 0;
  }
  else
  {
    v14 = objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0D060C0]);
    currentStyle = self->_currentStyle;
    -[CMISmartStyleProxyRenderer setInputStyles:](self->_smartStyleProxyRenderer, "setInputStyles:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &currentStyle, 1));
    -[CMISmartStyleProxyRenderer setInputPixelBuffer:](self->_smartStyleProxyRenderer, "setInputPixelBuffer:", v11);
    -[CMISmartStyleProxyRenderer setInputImageStatistics:](self->_smartStyleProxyRenderer, "setInputImageStatistics:", v14);
    v15 = -[CMISmartStyleProxyRenderer prepareToProcess:](self->_smartStyleProxyRenderer, "prepareToProcess:", v9);
    if (v15)
    {
      v16 = v15;
      fig_log_get_emitter();
    }
    else
    {
      v16 = -[CMISmartStyleProxyRenderer process](self->_smartStyleProxyRenderer, "process");
      if (!v16)
        goto LABEL_20;
      fig_log_get_emitter();
    }
    FigDebugAssert3();
  }
LABEL_20:
  if (*v8 == 1)
  {
    time.value = value;
    time.timescale = timescale;
    time.flags = flags;
    time.epoch = epoch;
    CMTimeGetSeconds(&time);
    kdebug_trace();
  }
  return v16;
}

- (int)_loadAndConfigureSmartStyleBundle
{
  void *v3;
  objc_class *v4;
  CMISmartStyleProcessor *v5;
  unint64_t v6;
  void *v7;
  float v8;
  objc_class *v9;
  int result;

  v3 = BWLoadProcessorBundle((uint64_t)CFSTR("SmartStyle"), 1);
  if (!v3)
    goto LABEL_6;
  v4 = (objc_class *)objc_msgSend(v3, "classNamed:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CMISmartStyleProcessorV%d"), 1));
  v5 = (CMISmartStyleProcessor *)objc_msgSend([v4 alloc], "initWithOptionalMetalCommandQueue:", self->_metalCommandQueue);
  self->_smartStyleProcessor = v5;
  if (!v5)
    goto LABEL_6;
  -[CMISmartStyleProcessor setInstanceLabel:](v5, "setInstanceLabel:", CFSTR("OverCaptureApplyNode"));
  -[CMISmartStyleProcessor setUseLiveMetalAllocations:](self->_smartStyleProcessor, "setUseLiveMetalAllocations:", 1);
  v6 = -[objc_class getSmartStyleCoefficientsFilterType:](v4, "getSmartStyleCoefficientsFilterType:", CFSTR("iir"));
  self->_filterType = v6;
  v7 = (void *)-[objc_class getDefaultProcessorConfigurationForStreamingWithFilterType:](v4, "getDefaultProcessorConfigurationForStreamingWithFilterType:", v6);
  objc_msgSend(v7, "setTemporalFilterInputBufferSize:", 5);
  -[CMISmartStyleProcessor setConfiguration:](self->_smartStyleProcessor, "setConfiguration:", v7);
  if (!-[CMISmartStyleProcessor configuration](self->_smartStyleProcessor, "configuration"))
    goto LABEL_6;
  objc_msgSend((id)objc_msgSend((id)-[CMISmartStyleProcessor configuration](self->_smartStyleProcessor, "configuration"), "styleEngineConfiguration"), "setThumbnailSize:", 128.0, 282.0);
  objc_msgSend((id)objc_msgSend((id)-[CMISmartStyleProcessor configuration](self->_smartStyleProcessor, "configuration"), "styleEngineConfiguration"), "globalLinearSystemMixFactor");
  self->_globalLocalSystemMixFactorDecayRate = (float)(1.0 - v8) / 10.0;
  self->_filteredCoefficientsPixelBufferPoolSize = 6;
  v9 = (objc_class *)objc_msgSend(v3, "classNamed:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CMISmartStyleProcessorInputOutputV%d"), 1));
  self->_smartStyleProcessorInputOutputClass = v9;
  if (v9)
  {
    result = 0;
    self->_useOptimizedThumbnailGeneration = 0;
  }
  else
  {
LABEL_6:

    self->_smartStyleProcessor = 0;
    return -12786;
  }
  return result;
}

- (int)_loadAndConfigureSmartStyleProxyRenderer
{
  objc_class *v3;
  objc_class *v4;
  CMISmartStyleProxyRenderer *v5;
  double v6;
  CMISmartStyleProxyRenderer *smartStyleProxyRenderer;
  id v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  int v15;

  v3 = NSClassFromString((NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CMISmartStyleV%d"), 1));
  self->_smartStyleClass = v3;
  if (!v3
    || (v4 = NSClassFromString((NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CMISmartStyleProxyRendererV%d"), 1))) == 0|| (v5 = (CMISmartStyleProxyRenderer *)objc_msgSend([v4 alloc], "initWithOptionalMetalCommandQueue:", self->_metalCommandQueue), (self->_smartStyleProxyRenderer = v5) == 0))
  {
    v14 = -12786;
LABEL_24:

    self->_smartStyleProxyRenderer = 0;
    return v14;
  }
  -[CMISmartStyleProxyRenderer setMaxInputStylesCount:](v5, "setMaxInputStylesCount:", 1);
  LODWORD(v6) = 0;
  -[CMISmartStyleProxyRenderer setForegroundRatio:](self->_smartStyleProxyRenderer, "setForegroundRatio:", v6);
  smartStyleProxyRenderer = self->_smartStyleProxyRenderer;
  v8 = (id)-[CMISmartStyleProxyRenderer externalMemoryDescriptorForConfiguration:](smartStyleProxyRenderer, "externalMemoryDescriptorForConfiguration:", 0);
  if (!v8)
  {
    v9 = 0;
    goto LABEL_16;
  }
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D08B10]), "initWithDevice:allocatorType:", objc_msgSend((id)-[CMISmartStyleProxyRenderer metalCommandQueue](smartStyleProxyRenderer, "metalCommandQueue"), "device"), objc_msgSend(v8, "allocatorType"));
  if (!v9)
  {
LABEL_16:
    v10 = 0;
    goto LABEL_17;
  }
  v10 = (void *)objc_opt_new();
  if (!v10)
  {
LABEL_17:
    v13 = 0;
LABEL_18:
    v14 = -12786;
    goto LABEL_10;
  }
  objc_msgSend(v10, "setMemSize:", objc_msgSend(v8, "memSize"));
  objc_msgSend(v10, "setWireMemory:", 1);
  objc_msgSend(v10, "setLabel:", CFSTR("BWOverCaptureSmartStyleApplyNode-SmartStyleProxyRenderer-FigMetalAllocatorBackend"));
  objc_msgSend(v10, "setMemoryPoolId:", -[BWMemoryPool poolIdentifier](+[BWMemoryPool sharedMemoryPool](BWMemoryPool, "sharedMemoryPool"), "poolIdentifier"));
  v11 = objc_msgSend(v9, "setupWithDescriptor:", v10);
  if (v11)
  {
    v14 = v11;
    v13 = 0;
    goto LABEL_10;
  }
  v12 = (void *)objc_opt_new();
  v13 = v12;
  if (!v12)
    goto LABEL_18;
  objc_msgSend(v12, "setAllocatorBackend:", v9);
  -[CMISmartStyleProxyRenderer setExternalMemoryResource:](smartStyleProxyRenderer, "setExternalMemoryResource:", v13);
  v14 = 0;
LABEL_10:

  if (v14)
    goto LABEL_22;
  v15 = -[CMISmartStyleProxyRenderer setup](self->_smartStyleProxyRenderer, "setup");
  if (v15)
  {
    v14 = v15;
    fig_log_get_emitter();
LABEL_23:
    FigDebugAssert3();
    goto LABEL_24;
  }
  v14 = -[CMISmartStyleProxyRenderer prewarm](self->_smartStyleProxyRenderer, "prewarm");
  if (v14)
  {
LABEL_22:
    fig_log_get_emitter();
    goto LABEL_23;
  }
  return v14;
}

- (id)_updateSupportedPixelFormats
{
  void *v3;
  int maxLossyCompressionLevel;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", &unk_1E4A00740);
  objc_msgSend(v3, "addObjectsFromArray:", FigCaptureSupportedPixelFormatsForCompressionType(4, 1, 0, 0));
  maxLossyCompressionLevel = self->_maxLossyCompressionLevel;
  if (maxLossyCompressionLevel)
    objc_msgSend(v3, "addObjectsFromArray:", FigCaptureSupportedPixelFormatsForCompressionType(4, 1, 0, maxLossyCompressionLevel));
  return v3;
}

- (void)_consumeSampleBufferAttachments:(opaqueCMSampleBuffer *)a3
{
  void *v4;

  BWSampleBufferRemoveAttachedMedia(a3, 0x1E495B3B8);
  BWSampleBufferRemoveAttachedMedia(a3, 0x1E495B3F8);
  BWSampleBufferRemoveAttachedMedia(a3, 0x1E495B358);
  BWSampleBufferRemoveAttachedMedia(a3, (uint64_t)CFSTR("HumanFullBodiesMask"));
  BWSampleBufferRemoveAttachedMedia(a3, (uint64_t)CFSTR("HumanSkinsMask"));
  BWSampleBufferRemoveAttachedMedia(a3, 0x1E495B218);
  BWSampleBufferRemoveAttachedMedia(a3, 0x1E494FBD8);
  CMRemoveAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05D88]);
  v4 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", 0, *MEMORY[0x1E0D060E0]);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", 0, *MEMORY[0x1E0D060F8]);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", 0, *MEMORY[0x1E0D06100]);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", 0, *MEMORY[0x1E0D060D0]);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_getSampleBufferPresentationTimeStamp:(SEL)a3
{
  void *v6;
  void *v7;
  uint64_t v8;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  CMTime v10;

  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
  if (a4)
  {
    v6 = (void *)CMGetAttachment(a4, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
    if (v6 && (v7 = v6, v8 = *MEMORY[0x1E0D05D00], objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D05D00])))
      result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeMakeFromDictionary(&v10, (CFDictionaryRef)objc_msgSend(v7, "objectForKeyedSubscript:", v8));
    else
      result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMSampleBufferGetPresentationTimeStamp(&v10, a4);
    *(CMTime *)retstr = v10;
  }
  else
  {
    fig_log_get_emitter();
    return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)FigDebugAssert3();
  }
  return result;
}

- (int)_getRotationConfigForPixelBuffer:(__CVBuffer *)a3
{
  void *v3;

  v3 = (void *)CMGetAttachment(a3, CFSTR("RotationDegrees"), 0);
  if (v3)
  {
    LODWORD(v3) = objc_msgSend(v3, "intValue");
    if ((int)v3 > 179)
    {
      if ((_DWORD)v3 == 180)
      {
        LODWORD(v3) = 2;
        return (int)v3;
      }
      if ((_DWORD)v3 == 270)
      {
        LODWORD(v3) = 3;
        return (int)v3;
      }
      goto LABEL_9;
    }
    if ((_DWORD)v3)
    {
      if ((_DWORD)v3 == 90)
      {
        LODWORD(v3) = 1;
        return (int)v3;
      }
LABEL_9:
      LODWORD(v3) = -1;
    }
  }
  return (int)v3;
}

- (int)_getMirrorConfigForPixelBuffer:(__CVBuffer *)a3
{
  unint64_t v4;
  unint64_t v5;
  void *v6;
  int v7;
  int v8;
  char v9;
  int v10;
  int result;

  v4 = (unint64_t)CMGetAttachment(a3, CFSTR("MirroredVertical"), 0);
  v5 = (unint64_t)CMGetAttachment(a3, CFSTR("MirroredHorizontal"), 0);
  if (!(v4 | v5))
    return 0;
  v6 = (void *)v5;
  v7 = objc_msgSend((id)v4, "BOOLValue");
  v8 = objc_msgSend(v6, "BOOLValue");
  v9 = v8;
  v10 = (v7 & v8) != 0 ? 3 : 2;
  result = v7 ? v10 : 1;
  if ((v7 & 1) == 0 && (v9 & 1) == 0)
    return 0;
  return result;
}

- (double)_computeAffineTransform:(int)a3 mirror:(int)a4
{
  float32x4_t v4;
  float32x4_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  _OWORD v17[3];
  _OWORD v18[3];

  v4 = (float32x4_t)xmmword_1A32A2AF0;
  v5 = (float32x4_t)xmmword_1A32A2B00;
  if (a3 == 3)
  {
    *(_QWORD *)&v6 = 1065353216;
    v8 = xmmword_1A32A2B00;
    v7 = xmmword_1A32B0D80;
  }
  else if (a3 == 2)
  {
    *(_QWORD *)&v6 = 0x3F8000003F800000;
    v8 = xmmword_1A32B0D80;
    v7 = xmmword_1A32B0D90;
  }
  else
  {
    *(_QWORD *)&v6 = 0;
    v7 = xmmword_1A32A2B00;
    v8 = xmmword_1A32A2AF0;
    if (a3 == 1)
    {
      *(_QWORD *)&v6 = 0x3F80000000000000;
      v8 = xmmword_1A32B0D90;
      v7 = xmmword_1A32A2AF0;
    }
  }
  HIDWORD(v8) = 0;
  HIDWORD(v7) = 0;
  *((_QWORD *)&v6 + 1) = COERCE_UNSIGNED_INT(1.0);
  if (a4 == 3)
  {
    v9 = 0x3F8000003F800000;
    v4 = (float32x4_t)xmmword_1A32B0D90;
    v5 = (float32x4_t)xmmword_1A32B0D80;
  }
  else if (a4 == 2)
  {
    v9 = 1065353216;
    v4 = (float32x4_t)xmmword_1A32B0D80;
  }
  else
  {
    v9 = 0;
    if (a4 == 1)
    {
      v9 = 0x3F80000000000000;
      v5 = (float32x4_t)xmmword_1A32B0D90;
    }
  }
  v10 = 0;
  __asm { FMOV            V6.4S, #1.0 }
  _Q6.i64[0] = v9;
  v17[0] = v8;
  v17[1] = v7;
  v17[2] = v6;
  memset(v18, 0, sizeof(v18));
  do
  {
    v18[v10] = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v4, COERCE_FLOAT(v17[v10])), v5, *(float32x2_t *)&v17[v10], 1), _Q6, (float32x4_t)v17[v10], 2);
    ++v10;
  }
  while (v10 != 3);
  return *(double *)v18;
}

- (uint64_t)_calculateExtrapolationAndSpotlightZoom:(double)a3 inputCropRectWithinPrimaryCaptureRect:(double)a4 learningROIRect:(CGFloat)a5 adjustedPrimaryCaptureRect:(CGFloat)a6 adjustedSpotlightZoomRect:(CGFloat)a7
{
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  float64_t v36;
  double v37;
  double v38;
  double v39;
  double v40;
  float64x2_t v41;
  float64x2_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  float64x2_t v46;
  float64x2_t v47;
  double v48;
  double v49;
  double v50;
  uint64_t result;
  double v52;
  double v53;
  float64_t v54;
  float64_t v55;
  _BYTE v56[32];
  CGRect v57;
  CGRect v58;

  *(double *)&v56[16] = a3;
  *(double *)&v56[24] = a4;
  *(double *)v56 = a1;
  *(double *)&v56[8] = a2;
  if (a11 && a12)
  {
    v57.origin.x = a13;
    v57.origin.y = a14;
    v57.size.width = a15;
    v57.size.height = a16;
    if (!CGRectIsEmpty(v57) && !CGRectIsEmpty(*(CGRect *)v56))
    {
      v58.origin.x = a5;
      v58.origin.y = a6;
      v58.size.width = a7;
      v58.size.height = a8;
      if (!CGRectIsEmpty(v58))
      {
        v26 = FigCaptureMetadataUtilitiesRectNormalizedToRect(a13, a14, a15, a16, a5, a6, a7);
        v30 = FigCaptureMetadataUtilitiesRectDenormalizedToRect(v26, v27, v28, v29, *(double *)v56, *(double *)&v56[8], *(double *)&v56[16]);
        v54 = v31;
        v55 = v30;
        v52 = v33;
        v53 = v32;
        v34 = FigCaptureMetadataUtilitiesRectNormalizedToRect(a5, a6, a7, a8, a13, a14, a15);
        v36 = v35;
        v38 = v37;
        v40 = v39;
        v41.f64[0] = v55;
        v42.f64[0] = *(float64_t *)v56;
        *(_QWORD *)v56 = FigCaptureMetadataUtilitiesClampRectToBoundingRect(v41, v54, v53, v52, v42, *(float64_t *)&v56[8], *(double *)&v56[16], *(double *)&v56[24]);
        *(_QWORD *)&v56[8] = v43;
        *(_QWORD *)&v56[16] = v44;
        *(_QWORD *)&v56[24] = v45;
        v46.f64[0] = 0.0;
        v47.f64[0] = v34;
        a5 = FigCaptureMetadataUtilitiesClampRectToBoundingRect(v47, v36, v38, v40, v46, 0.0, 1.0, 1.0);
        a6 = v48;
        a7 = v49;
        a8 = v50;
      }
    }
    result = 0;
    *a11 = *(_QWORD *)v56;
    a11[1] = *(_QWORD *)&v56[8];
    a11[2] = *(_QWORD *)&v56[16];
    a11[3] = *(_QWORD *)&v56[24];
    *a12 = a5;
    a12[1] = a6;
    a12[2] = a7;
    a12[3] = a8;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 4294954516;
  }
  return result;
}

- (int)maxLossyCompressionLevel
{
  return self->_maxLossyCompressionLevel;
}

@end
