@implementation BWSmartStyleApplyNode

+ (void)initialize
{
  objc_opt_class();
}

- (BWSmartStyleApplyNode)initWithMetalCommandQueue:(id)a3 renderingMethod:(int)a4
{
  BWSmartStyleApplyNode *v6;
  BWSmartStyleApplyNode *v7;
  uint64_t v8;
  uint64_t v9;
  BWVideoFormatRequirements *v10;
  BWVideoFormatRequirements *v11;
  BWNodeInput *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  BWNodeInputMediaConfiguration *v19;
  BWVideoFormatRequirements *v20;
  BWVideoFormatRequirements *v21;
  BWNodeOutput *v22;
  uint64_t v24;
  BWSmartStyleApplyNode *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  objc_super v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v30.receiver = self;
  v30.super_class = (Class)BWSmartStyleApplyNode;
  v6 = -[BWNode init](&v30, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_renderingMethod = a4;
    v6->_maxLossyCompressionLevel = 0;
    v6->_metalCommandQueue = (MTLCommandQueue *)a3;
    v8 = -[BWSmartStyleApplyNode _updateSupportedPixelFormats](v7, "_updateSupportedPixelFormats");
    if (v8 && (v9 = v8, (v10 = objc_alloc_init(BWVideoFormatRequirements)) != 0))
    {
      v11 = v10;
      v24 = v9;
      -[BWVideoFormatRequirements setSupportedPixelFormats:](v10, "setSupportedPixelFormats:", v9);
      v25 = v7;
      v12 = -[BWNodeInput initWithMediaType:node:]([BWNodeInput alloc], "initWithMediaType:node:", 1986618469, v7);
      -[BWNodeInput setFormatRequirements:](v12, "setFormatRequirements:", v11);
      -[BWNodeInput setPassthroughMode:](v12, "setPassthroughMode:", 2);
      if (a4 == 1)
      {
        v28 = 0u;
        v29 = 0u;
        v26 = 0u;
        v27 = 0u;
        v13 = BWAttachedMediaKeysRequiredBySmartStyleRenderingPipelines(1, 0);
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v27;
          do
          {
            for (i = 0; i != v15; ++i)
            {
              if (*(_QWORD *)v27 != v16)
                objc_enumerationMutation(v13);
              v18 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
              v19 = objc_alloc_init(BWNodeInputMediaConfiguration);
              -[BWNodeInputMediaConfiguration setFormatRequirements:](v19, "setFormatRequirements:", objc_alloc_init(BWVideoFormatRequirements));
              -[BWNodeInputMediaConfiguration setPassthroughMode:](v19, "setPassthroughMode:", 0);
              if (objc_msgSend(v18, "isEqualToString:", 0x1E495B358))
                -[BWNodeInputMediaConfiguration setRetainedBufferCount:](v19, "setRetainedBufferCount:", 4);
              -[BWNodeInput setMediaConfiguration:forAttachedMediaKey:](v12, "setMediaConfiguration:forAttachedMediaKey:", v19, v18);
            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
          }
          while (v15);
        }
      }
      v7 = v25;
      -[BWNode addInput:](v25, "addInput:", v12);
      v20 = objc_alloc_init(BWVideoFormatRequirements);
      if (v20)
      {
        v21 = v20;
        -[BWVideoFormatRequirements setSupportedPixelFormats:](v20, "setSupportedPixelFormats:", v24);
        v22 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1986618469, v25);
        -[BWNodeOutput setFormatRequirements:](v22, "setFormatRequirements:", v21);
        -[BWNodeOutput setPassthroughMode:](v22, "setPassthroughMode:", 2);
        -[BWNodeOutput setProvidesPixelBufferPool:](v22, "setProvidesPixelBufferPool:", 1);
        -[BWNodeOutput setOwningNodeRetainedBufferCount:](v22, "setOwningNodeRetainedBufferCount:", 1);
        -[BWNode addOutput:](v25, "addOutput:", v22);
        if (!-[BWSmartStyleApplyNode _loadAndConfigureSmartStyleBundle](v25, "_loadAndConfigureSmartStyleBundle")
          && !-[BWSmartStyleApplyNode _loadAndConfigureSmartStyleProxyRenderer](v25, "_loadAndConfigureSmartStyleProxyRenderer"))
        {
          v25->_applyDither = 1;
          return v7;
        }
      }
      fig_log_get_emitter();
    }
    else
    {
      fig_log_get_emitter();
    }
    FigDebugAssert3();
    return 0;
  }
  return v7;
}

- (void)setMaxLossyCompressionLevel:(int)a3
{
  BWFormatRequirements *v4;
  BWFormatRequirements *v5;
  id v6;
  id v7;

  if (self->_maxLossyCompressionLevel != a3)
  {
    v4 = -[BWNodeInput formatRequirements](self->super._input, "formatRequirements");
    v5 = -[BWNodeOutput formatRequirements](self->super._output, "formatRequirements");
    v6 = -[BWSmartStyleApplyNode _updateSupportedPixelFormats](self, "_updateSupportedPixelFormats");
    if (v6)
    {
      v7 = v6;
      -[BWFormatRequirements setSupportedPixelFormats:](v4, "setSupportedPixelFormats:", v6);
      -[BWFormatRequirements setSupportedPixelFormats:](v5, "setSupportedPixelFormats:", v7);
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
  opaqueCMSampleBuffer *mostRecentCoefficients;
  objc_super v4;

  objc_msgSend((id)-[CMISmartStyleProcessor utilities](self->_smartStyleProcessor, "utilities"), "resetCoefficientsFilter");
  mostRecentCoefficients = self->_mostRecentCoefficients;
  if (mostRecentCoefficients)
    CFRelease(mostRecentCoefficients);
  v4.receiver = self;
  v4.super_class = (Class)BWSmartStyleApplyNode;
  -[BWNode dealloc](&v4, sel_dealloc);
}

- (id)nodeType
{
  return CFSTR("Effect");
}

- (id)nodeSubType
{
  return CFSTR("SmartStyleApply");
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
    v11 = -[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:](v10, "initWithVideoFormat:capacity:name:memoryPool:", a3, self->_filteredCoefficientsPixelBufferPoolSize, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ApplyNode filtered coefficients buffer pool")), -[BWNodeOutput memoryPool](self->super._output, "memoryPool"));
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
    v12.super_class = (Class)BWSmartStyleApplyNode;
    -[BWNode didSelectFormat:forInput:forAttachedMediaKey:](&v12, sel_didSelectFormat_forInput_forAttachedMediaKey_, a3, a4, a5);
  }
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWSmartStyleApplyNode;
  -[BWNode prepareForCurrentConfigurationToBecomeLive](&v3, sel_prepareForCurrentConfigurationToBecomeLive);
  if (-[CMISmartStyleProcessor setup](self->_smartStyleProcessor, "setup")
    || -[CMISmartStyleProcessor prepareToProcess:](self->_smartStyleProcessor, "prepareToProcess:", 4)
    || objc_msgSend((id)-[CMISmartStyleProcessor utilities](self->_smartStyleProcessor, "utilities"), "resetCoefficientsFilter"))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
}

- (void)didReachEndOfDataForInput:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWSmartStyleApplyNode;
  -[BWNode didReachEndOfDataForInput:](&v3, sel_didReachEndOfDataForInput_, a3);
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  uint64_t v4;
  uint64_t renderingMethod;
  const __CFString *v8;
  void *v9;
  uint64_t v10;
  opaqueCMSampleBuffer *AttachedMedia;
  opaqueCMSampleBuffer *v12;
  void *v13;
  int v14;
  opaqueCMSampleBuffer *v15;
  int v16;
  BWNodeOutput *output;
  void *v18;
  id v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  CMTime v23;
  CMAttachmentBearerRef target;

  target = 0;
  if (!a3)
  {
    fig_log_get_emitter();
    LODWORD(v21) = 0;
    FigDebugAssert3();
    -[BWSmartStyleApplyNode _consumeSampleBufferAttachments:](self, "_consumeSampleBufferAttachments:", 0, v21, v4);
    CMSampleBufferGetPresentationTimeStamp(&v23, 0);
    v19 = +[BWDroppedSample newDroppedSampleWithReason:pts:](BWDroppedSample, "newDroppedSampleWithReason:pts:", 0x1E494F218, &v23);
    -[BWNodeOutput emitDroppedSample:](self->super._output, "emitDroppedSample:", v19);

    return;
  }
  if (a4)
  {
    if (BWSampleBufferIsMarkerBuffer(a3))
    {
      -[BWNodeOutput emitSampleBuffer:](self->super._output, "emitSampleBuffer:", a3);
      return;
    }
    if (!-[BWSmartStyleApplyNode _updateCurrentStyle:](self, "_updateCurrentStyle:", a3))
      goto LABEL_36;
    renderingMethod = self->_renderingMethod;
    if (!(_DWORD)renderingMethod)
      goto LABEL_36;
    v8 = (const __CFString *)*MEMORY[0x1E0D05CB0];
    v9 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
    if (v9)
    {
      v10 = *MEMORY[0x1E0D06EB8];
      if ((objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D06EB8]), "BOOLValue") & 1) != 0
        || (AttachedMedia = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a3, (uint64_t)CFSTR("SynchronizedSlaveFrame"))) == 0)
      {
        v14 = 0;
        v15 = a3;
        goto LABEL_15;
      }
      v12 = AttachedMedia;
      v13 = (void *)CMGetAttachment(AttachedMedia, v8, 0);
      if (v13)
      {
        v14 = objc_msgSend((id)objc_msgSend(v13, "objectForKeyedSubscript:", v10), "BOOLValue");
        if (v14)
          v15 = v12;
        else
          v15 = a3;
LABEL_15:
        if ((BWSmartStyleRenderingShouldBeBypassed(v15) & 1) != 0)
          goto LABEL_23;
        if ((_DWORD)renderingMethod == 1)
        {
          if (-[BWSmartStyleApplyNode _canRenderWithStyleEngineApplyForInput:](self, "_canRenderWithStyleEngineApplyForInput:", v15))
          {
            v16 = -[BWSmartStyleApplyNode _applySmartStyleFromSampleBuffer:to:](self, "_applySmartStyleFromSampleBuffer:to:", v15, &target);
            if (v16)
              goto LABEL_34;
            goto LABEL_22;
          }
          renderingMethod = 3;
        }
        v16 = -[BWSmartStyleApplyNode _applySmartStyleProxyRenderingWithMethod:fromSampleBuffer:to:](self, "_applySmartStyleProxyRenderingWithMethod:fromSampleBuffer:to:", renderingMethod, v15, &target);
        if (v16)
        {
LABEL_34:
          v20 = v16;
          fig_log_get_emitter();
          v22 = v4;
          LODWORD(v21) = v20;
          FigDebugAssert3();
          goto LABEL_23;
        }
LABEL_22:
        CMSetAttachment(target, CFSTR("FiltersApplied"), MEMORY[0x1E0C9AAB0], 1u);
        goto LABEL_23;
      }
    }
  }
  fig_log_get_emitter();
  v22 = v4;
  LODWORD(v21) = 0;
  FigDebugAssert3();
LABEL_36:
  v14 = 0;
LABEL_23:
  -[BWSmartStyleApplyNode _consumeSampleBufferAttachments:](self, "_consumeSampleBufferAttachments:", a3, v21, v22);
  if (target)
  {
    -[BWSmartStyleApplyNode _consumeSampleBufferAttachments:](self, "_consumeSampleBufferAttachments:");
    if (v14)
    {
      BWSampleBufferSetAttachedMedia(a3, (uint64_t)CFSTR("SynchronizedSlaveFrame"), (uint64_t)target);
      output = self->super._output;
      v18 = a3;
    }
    else
    {
      v18 = (void *)target;
      output = self->super._output;
    }
    -[BWNodeOutput emitSampleBuffer:](output, "emitSampleBuffer:", v18);
    if (target)
      CFRelease(target);
  }
  else
  {
    -[BWNodeOutput emitSampleBuffer:](self->super._output, "emitSampleBuffer:", a3);
  }
}

- (BOOL)_updateCurrentStyle:(opaqueCMSampleBuffer *)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  CMISmartStyle *currentStyle;
  BOOL result;

  if (!a3)
    return 0;
  v4 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  if (!v4)
    goto LABEL_10;
  v5 = objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D060B0]);
  if (!v5)
  {

    result = 0;
    self->_currentStyle = 0;
    return result;
  }
  v6 = +[FigCaptureSmartStyle createFromDictionary:](FigCaptureSmartStyle, "createFromDictionary:", v5);
  if (v6)
  {
    v7 = v6;
    currentStyle = self->_currentStyle;
    if (!currentStyle)
      currentStyle = (CMISmartStyle *)objc_alloc_init(self->_smartStyleClass);
    self->_currentStyle = currentStyle;
    -[CMISmartStyle setCastType:](self->_currentStyle, "setCastType:", objc_msgSend(v7, "cast"));
    objc_msgSend(v7, "intensity");
    -[CMISmartStyle setCastIntensity:](self->_currentStyle, "setCastIntensity:");
    objc_msgSend(v7, "toneBias");
    -[CMISmartStyle setToneBias:](self->_currentStyle, "setToneBias:");
    objc_msgSend(v7, "colorBias");
    -[CMISmartStyle setColorBias:](self->_currentStyle, "setColorBias:");
    return self->_currentStyle != 0;
  }
  else
  {
LABEL_10:
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0;
  }
}

- (BOOL)_canRenderWithStyleEngineApplyForInput:(opaqueCMSampleBuffer *)a3
{
  uint64_t AttachedMedia;
  uint64_t v5;
  BOOL v6;

  AttachedMedia = BWSampleBufferGetAttachedMedia(a3, 0x1E495B3B8);
  v5 = BWSampleBufferGetAttachedMedia(a3, 0x1E495B358);
  if (AttachedMedia)
    v6 = v5 == 0;
  else
    v6 = 1;
  return !v6;
}

- (int)_applySmartStyleFromSampleBuffer:(opaqueCMSampleBuffer *)a3 to:(opaqueCMSampleBuffer *)a4
{
  CMTimeFlags flags;
  CMTimeEpoch epoch;
  CGSize v6;
  _DWORD *v7;
  __CVBuffer *ImageBuffer;
  const __CFString *v12;
  CFTypeRef v13;
  void *v14;
  opaqueCMSampleBuffer *AttachedMedia;
  id v16;
  uint64_t v17;
  int v18;
  opaqueCMSampleBuffer *mostRecentCoefficients;
  float v20;
  float v21;
  int v22;
  const __CFDictionary *v23;
  CVImageBufferRef v24;
  CVImageBufferRef v25;
  CVImageBufferRef v26;
  CVImageBufferRef v27;
  double v28;
  void *v29;
  int v30;
  void *v31;
  unint64_t filterType;
  int v33;
  int v34;
  void *v35;
  opaqueCMSampleBuffer *v36;
  const __CFString *key;
  CMTimeEpoch v39;
  CMTimeFlags v40;
  CMTime time;
  CGRect rect;
  CFTypeRef v43;
  CFTypeRef cf;
  CMTimeValue value;
  CMTimeScale timescale;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v43 = 0;
  cf = 0;
  value = *MEMORY[0x1E0CA2E68];
  flags = *(_DWORD *)(MEMORY[0x1E0CA2E68] + 12);
  timescale = *(_DWORD *)(MEMORY[0x1E0CA2E68] + 8);
  epoch = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  v6 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
  rect.origin = (CGPoint)*MEMORY[0x1E0C9D628];
  rect.size = v6;
  v7 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (!a3 || !a4)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_51;
  }
  *a4 = 0;
  if (!self)
  {
    v16 = 0;
    epoch = 0;
    flags = 0;
    AttachedMedia = 0;
    ImageBuffer = 0;
    timescale = 0;
    value = 0;
LABEL_18:
    v22 = -12780;
    goto LABEL_39;
  }
  -[BWSmartStyleApplyNode _getSampleBufferPresentationTimeStamp:](self, "_getSampleBufferPresentationTimeStamp:");
  epoch = time.epoch;
  value = time.value;
  flags = time.flags;
  timescale = time.timescale;
  if ((time.flags & 1) == 0)
  {
LABEL_51:
    v16 = 0;
    AttachedMedia = 0;
    ImageBuffer = 0;
    goto LABEL_18;
  }
  if (*v7 == 1)
  {
    time.value = value;
    time.timescale = timescale;
    CMTimeGetSeconds(&time);
    kdebug_trace();
  }
  ImageBuffer = CMSampleBufferGetImageBuffer(a3);
  if (!ImageBuffer)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v16 = 0;
    AttachedMedia = 0;
    goto LABEL_18;
  }
  v40 = flags;
  v12 = (const __CFString *)*MEMORY[0x1E0D05CB0];
  v13 = CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  if (!v13)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v16 = 0;
    AttachedMedia = 0;
    ImageBuffer = 0;
    v22 = -12780;
LABEL_70:
    v7 = (_DWORD *)MEMORY[0x1E0CA1FC0];
    flags = v40;
    goto LABEL_39;
  }
  v14 = (void *)v13;
  AttachedMedia = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a3, 0x1E495B3B8);
  if (!AttachedMedia)
  {
    v16 = 0;
LABEL_56:
    ImageBuffer = 0;
    v22 = -12783;
    goto LABEL_70;
  }
  v16 = (id)BWSampleBufferGetAttachedMedia(a3, 0x1E495B358);
  if (!v16)
  {
    AttachedMedia = 0;
    goto LABEL_56;
  }
  key = v12;
  v39 = epoch;
  v17 = *MEMORY[0x1E0D06D20];
  v18 = objc_msgSend((id)objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D20]), "intValue");
  mostRecentCoefficients = self->_mostRecentCoefficients;
  if (v18 == self->_mostRecentQuadraBinningFactor)
  {
    if (mostRecentCoefficients)
    {
      CFRelease(mostRecentCoefficients);
      self->_mostRecentCoefficients = 0;
    }
    self->_mostRecentCoefficients = (opaqueCMSampleBuffer *)CFRetain(v16);
    self->_applyGlobalMostRecentCoefficients = 0;
    v20 = self->_currentGlobalLocalMixFactor - self->_globalLocalSystemMixFactorDecayRate;
    objc_msgSend((id)objc_msgSend((id)-[CMISmartStyleProcessor configuration](self->_smartStyleProcessor, "configuration"), "styleEngineConfiguration"), "globalLinearSystemMixFactor");
    if (v20 >= v21)
      v21 = v20;
    self->_currentGlobalLocalMixFactor = v21;
  }
  else if (mostRecentCoefficients)
  {
    self->_applyGlobalMostRecentCoefficients = 1;
    self->_currentGlobalLocalMixFactor = 1.0;
    v16 = mostRecentCoefficients;
  }
  self->_mostRecentQuadraBinningFactor = objc_msgSend((id)objc_msgSend(v14, "objectForKeyedSubscript:", v17), "intValue");
  v23 = (const __CFDictionary *)objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E0D060D8]);
  if (v23 && !CGRectMakeWithDictionaryRepresentation(v23, &rect)
    || (v24 = CMSampleBufferGetImageBuffer(AttachedMedia)) == 0
    || (v25 = v24, (v26 = CMSampleBufferGetImageBuffer((CMSampleBufferRef)v16)) == 0))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v16 = 0;
    AttachedMedia = 0;
    ImageBuffer = 0;
    v22 = -12780;
LABEL_69:
    epoch = v39;
    goto LABEL_70;
  }
  v27 = v26;
  AttachedMedia = -[BWPixelBufferPool newPixelBuffer](-[BWNodeOutput livePixelBufferPool](self->super._output, "livePixelBufferPool"), "newPixelBuffer");
  if (!AttachedMedia)
  {
    v16 = 0;
LABEL_61:
    ImageBuffer = 0;
LABEL_68:
    v22 = -12786;
    goto LABEL_69;
  }
  CVBufferPropagateAttachments(ImageBuffer, AttachedMedia);
  v16 = objc_alloc_init(self->_smartStyleProcessorInputOutputClass);
  if (!v16)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_61;
  }
  objc_msgSend(v16, "setMetalSharedEvent:", CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05D88], 0));
  objc_msgSend(v16, "setInputUnstyledPixelBuffer:", ImageBuffer);
  objc_msgSend(v16, "setInputMetadataDict:", v14);
  objc_msgSend(v16, "setInputUnstyledThumbnailPixelBuffer:", v25);
  objc_msgSend(v16, "setOutputStyledPixelBuffer:", AttachedMedia);
  objc_msgSend(v16, "setPrimaryCaptureRect:", rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
  *(float *)&v28 = self->_currentGlobalLocalMixFactor;
  objc_msgSend(v16, "setGlobalLinearSystemMixFactor:", v28);
  objc_msgSend(v16, "setApplyDither:", self->_applyDither);
  if (!self->_filterType)
  {
    objc_msgSend(v16, "setInputStyleCoefficientsPixelBuffer:", v27);
    ImageBuffer = 0;
    goto LABEL_32;
  }
  v29 = (void *)-[CMISmartStyleProcessor utilities](self->_smartStyleProcessor, "utilities");
  time.value = value;
  time.timescale = timescale;
  time.flags = v40;
  time.epoch = v39;
  v30 = objc_msgSend(v29, "enqueueCoefficientsForFiltering:withMetadata:pts:", v27, v14, &time);
  if (v30)
  {
    v22 = v30;
    fig_log_get_emitter();
    FigDebugAssert3();
    ImageBuffer = 0;
    goto LABEL_69;
  }
  ImageBuffer = -[BWPixelBufferPool newPixelBuffer](self->_filteredCoefficientsPixelBufferPool, "newPixelBuffer");
  if (!ImageBuffer)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_68;
  }
  v31 = (void *)-[CMISmartStyleProcessor utilities](self->_smartStyleProcessor, "utilities");
  filterType = self->_filterType;
  time.value = value;
  time.timescale = timescale;
  time.flags = v40;
  time.epoch = v39;
  objc_msgSend(v31, "filterCoefficientsForFrameWithMetadata:pts:filterType:toPixelBuffer:", v14, &time, filterType, ImageBuffer);
  objc_msgSend(v16, "setInputStyleCoefficientsPixelBuffer:", ImageBuffer);
LABEL_32:
  -[CMISmartStyleProcessor setInputOutput:](self->_smartStyleProcessor, "setInputOutput:", v16);
  v33 = -[CMISmartStyleProcessor process](self->_smartStyleProcessor, "process");
  v7 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  flags = v40;
  if (v33 || (v33 = -[CMISmartStyleProcessor finishProcessing](self->_smartStyleProcessor, "finishProcessing")) != 0)
  {
    v22 = v33;
    fig_log_get_emitter();
    FigDebugAssert3();
    epoch = v39;
    goto LABEL_39;
  }
  v34 = BWCMSampleBufferCreateCopyWithNewPixelBuffer(a3, AttachedMedia, &v43, (CMSampleBufferRef *)&cf);
  epoch = v39;
  if (v34)
  {
    v22 = v34;
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_39;
  }
  v35 = (void *)CMGetAttachment(a3, key, 0);
  if (!v35)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_18;
  }
  objc_msgSend(v35, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D060A8]);
  v36 = (opaqueCMSampleBuffer *)cf;
  if (cf)
    v36 = (opaqueCMSampleBuffer *)CFRetain(cf);
  v22 = 0;
  *a4 = v36;
LABEL_39:
  if (*v7 == 1)
  {
    time.value = value;
    time.timescale = timescale;
    time.flags = flags;
    time.epoch = epoch;
    CMTimeGetSeconds(&time);
    kdebug_trace();
  }

  if (cf)
    CFRelease(cf);
  if (AttachedMedia)
    CFRelease(AttachedMedia);
  if (v43)
    CFRelease(v43);
  if (ImageBuffer)
    CFRelease(ImageBuffer);
  return v22;
}

- (int)_applySmartStyleProxyRenderingWithMethod:(int)a3 fromSampleBuffer:(opaqueCMSampleBuffer *)a4 to:(opaqueCMSampleBuffer *)a5
{
  CMTimeFlags flags;
  CMTimeEpoch epoch;
  _DWORD *v10;
  uint64_t v11;
  CVImageBufferRef ImageBuffer;
  __CVBuffer *v13;
  CFTypeRef v14;
  void *v15;
  __CVBuffer *v16;
  uint64_t v17;
  opaqueCMSampleBuffer *AttachedMedia;
  CVImageBufferRef v19;
  int v20;
  int v21;
  int v22;
  opaqueCMSampleBuffer *v23;
  CMTime time;
  CFTypeRef v26;
  CFTypeRef cf;
  CMISmartStyle *currentStyle;
  CMTimeValue value;
  CMTimeScale timescale;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v26 = 0;
  cf = 0;
  value = *MEMORY[0x1E0CA2E68];
  flags = *(_DWORD *)(MEMORY[0x1E0CA2E68] + 12);
  timescale = *(_DWORD *)(MEMORY[0x1E0CA2E68] + 8);
  epoch = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  v10 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (a3 == 2)
  {
    v11 = 1;
  }
  else
  {
    if (a3 != 3)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      v20 = 0;
      v16 = 0;
      goto LABEL_26;
    }
    v11 = 2;
  }
  if (!a4 || !a5)
  {
    fig_log_get_emitter();
LABEL_38:
    FigDebugAssert3();
    goto LABEL_39;
  }
  *a5 = 0;
  if (!self)
  {
    v16 = 0;
    flags = 0;
    epoch = 0;
    timescale = 0;
    value = 0;
LABEL_18:
    v20 = -12780;
    goto LABEL_26;
  }
  -[BWSmartStyleApplyNode _getSampleBufferPresentationTimeStamp:](self, "_getSampleBufferPresentationTimeStamp:", a4);
  epoch = time.epoch;
  value = time.value;
  flags = time.flags;
  timescale = time.timescale;
  if ((time.flags & 1) == 0)
  {
LABEL_39:
    v16 = 0;
    goto LABEL_18;
  }
  if (*v10 == 1)
  {
    time.value = value;
    time.timescale = timescale;
    CMTimeGetSeconds(&time);
    kdebug_trace();
  }
  ImageBuffer = CMSampleBufferGetImageBuffer(a4);
  if (!ImageBuffer || (v13 = ImageBuffer, (v14 = CMGetAttachment(a4, (CFStringRef)*MEMORY[0x1E0D05CB0], 0)) == 0))
  {
    fig_log_get_emitter();
    goto LABEL_38;
  }
  v15 = (void *)v14;
  v16 = -[BWPixelBufferPool newPixelBuffer](-[BWNodeOutput livePixelBufferPool](self->super._output, "livePixelBufferPool"), "newPixelBuffer");
  if (v16)
  {
    CVBufferPropagateAttachments(v13, v16);
    v17 = objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0D060C0]);
    AttachedMedia = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a4, (uint64_t)CFSTR("HumanFullBodiesMask"));
    if (AttachedMedia)
      v19 = CMSampleBufferGetImageBuffer(AttachedMedia);
    else
      v19 = 0;
    currentStyle = self->_currentStyle;
    -[CMISmartStyleProxyRenderer setInputStyles:](self->_smartStyleProxyRenderer, "setInputStyles:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &currentStyle, 1));
    -[CMISmartStyleProxyRenderer setInputPixelBuffer:](self->_smartStyleProxyRenderer, "setInputPixelBuffer:", v13);
    -[CMISmartStyleProxyRenderer setInputMaskPixelBuffer:](self->_smartStyleProxyRenderer, "setInputMaskPixelBuffer:", v19);
    -[CMISmartStyleProxyRenderer setInputImageStatistics:](self->_smartStyleProxyRenderer, "setInputImageStatistics:", v17);
    -[CMISmartStyleProxyRenderer setOutputPixelBuffer:](self->_smartStyleProxyRenderer, "setOutputPixelBuffer:", v16);
    v21 = -[CMISmartStyleProxyRenderer prepareToProcess:](self->_smartStyleProxyRenderer, "prepareToProcess:", v11);
    if (v21)
    {
      v20 = v21;
      fig_log_get_emitter();
      FigDebugAssert3();
      v10 = (_DWORD *)MEMORY[0x1E0CA1FC0];
    }
    else
    {
      v22 = -[CMISmartStyleProxyRenderer process](self->_smartStyleProxyRenderer, "process");
      v10 = (_DWORD *)MEMORY[0x1E0CA1FC0];
      if (v22 || (v22 = BWCMSampleBufferCreateCopyWithNewPixelBuffer(a4, v16, &v26, (CMSampleBufferRef *)&cf)) != 0)
      {
        v20 = v22;
        fig_log_get_emitter();
        FigDebugAssert3();
      }
      else
      {
        v23 = (opaqueCMSampleBuffer *)cf;
        if (cf)
          v23 = (opaqueCMSampleBuffer *)CFRetain(cf);
        v20 = 0;
        *a5 = v23;
      }
    }
  }
  else
  {
    v20 = -12786;
  }
LABEL_26:
  if (*v10 == 1)
  {
    time.value = value;
    time.timescale = timescale;
    time.flags = flags;
    time.epoch = epoch;
    CMTimeGetSeconds(&time);
    kdebug_trace();
  }
  if (cf)
    CFRelease(cf);
  if (v16)
    CFRelease(v16);
  if (v26)
    CFRelease(v26);
  return v20;
}

- (int)_loadAndConfigureSmartStyleBundle
{
  void *v3;
  objc_class *v4;
  CMISmartStyleProcessor *v5;
  unint64_t v6;
  float v7;
  objc_class *v8;

  v3 = BWLoadProcessorBundle((uint64_t)CFSTR("SmartStyle"), 1);
  if (v3)
  {
    v4 = (objc_class *)objc_msgSend(v3, "classNamed:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CMISmartStyleProcessorV%d"), 1));
    v5 = (CMISmartStyleProcessor *)objc_msgSend([v4 alloc], "initWithOptionalMetalCommandQueue:", self->_metalCommandQueue);
    self->_smartStyleProcessor = v5;
    if (v5)
    {
      -[CMISmartStyleProcessor setInstanceLabel:](v5, "setInstanceLabel:", CFSTR("ApplyNode"));
      -[CMISmartStyleProcessor setUseLiveMetalAllocations:](self->_smartStyleProcessor, "setUseLiveMetalAllocations:", 1);
      v6 = -[objc_class getSmartStyleCoefficientsFilterType:](v4, "getSmartStyleCoefficientsFilterType:", CFSTR("iir"));
      self->_filterType = v6;
      -[CMISmartStyleProcessor setConfiguration:](self->_smartStyleProcessor, "setConfiguration:", -[objc_class getDefaultProcessorConfigurationForStreamingWithFilterType:](v4, "getDefaultProcessorConfigurationForStreamingWithFilterType:", v6));
      if (-[CMISmartStyleProcessor configuration](self->_smartStyleProcessor, "configuration"))
      {
        objc_msgSend((id)objc_msgSend((id)-[CMISmartStyleProcessor configuration](self->_smartStyleProcessor, "configuration"), "styleEngineConfiguration"), "globalLinearSystemMixFactor");
        self->_globalLocalSystemMixFactorDecayRate = v7 / 10.0;
        self->_filteredCoefficientsPixelBufferPoolSize = -[objc_class getRequiredFilteredCoefficientsPixelBufferPoolSizeForFilterType:](v4, "getRequiredFilteredCoefficientsPixelBufferPoolSizeForFilterType:", self->_filterType)+ 1;
        v8 = (objc_class *)objc_msgSend(v3, "classNamed:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CMISmartStyleProcessorInputOutputV%d"), 1));
        self->_smartStyleProcessorInputOutputClass = v8;
        if (v8)
          return 0;
      }
    }
  }

  self->_smartStyleProcessor = 0;
  return -12786;
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
    || (v4 = NSClassFromString((NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CMISmartStyleProxyRendererV%d"), 1)), !self->_smartStyleClass)|| (v5 = (CMISmartStyleProxyRenderer *)objc_msgSend([v4 alloc], "initWithOptionalMetalCommandQueue:", self->_metalCommandQueue), (self->_smartStyleProxyRenderer = v5) == 0))
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
  objc_msgSend(v10, "setLabel:", CFSTR("BWSmartStyleApplyNode-SmartStyleProxyRenderer-FigMetalAllocatorBackend"));
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

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", &unk_1E4A01A48);
  objc_msgSend(v3, "addObjectsFromArray:", FigCaptureSupportedPixelFormatsForCompressionType(4, 1, 0, 0));
  maxLossyCompressionLevel = self->_maxLossyCompressionLevel;
  if (maxLossyCompressionLevel)
    objc_msgSend(v3, "addObjectsFromArray:", FigCaptureSupportedPixelFormatsForCompressionType(4, 1, 0, maxLossyCompressionLevel));
  return v3;
}

- (void)_consumeSampleBufferAttachments:(opaqueCMSampleBuffer *)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = BWAttachedMediaKeysRequiredBySmartStyleRenderingPipelines(1, 1);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        BWSampleBufferRemoveAttachedMedia(a3, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }
  CMRemoveAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05D88]);
  v9 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  objc_msgSend(v9, "setObject:forKeyedSubscript:", 0, *MEMORY[0x1E0D060E0], (_QWORD)v10);
  objc_msgSend(v9, "setObject:forKeyedSubscript:", 0, *MEMORY[0x1E0D060F8]);
  objc_msgSend(v9, "setObject:forKeyedSubscript:", 0, *MEMORY[0x1E0D06100]);
  objc_msgSend(v9, "setObject:forKeyedSubscript:", 0, *MEMORY[0x1E0D060D0]);
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

- (int)maxLossyCompressionLevel
{
  return self->_maxLossyCompressionLevel;
}

@end
