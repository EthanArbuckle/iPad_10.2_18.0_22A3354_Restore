@implementation BWDepthConverterNode

- (void)didSelectFormat:(id)a3 forInput:(id)a4 forAttachedMediaKey:(id)a5
{
  id v9;
  void *v10;
  BWNodeOutputMediaConfiguration *v11;
  objc_super v12;

  if (objc_msgSend(a5, "isEqualToString:", CFSTR("PrimaryFormat")))
  {
    -[BWNodeOutput setFormat:](self->super._output, "setFormat:", a3);
  }
  else if (objc_msgSend(a5, "isEqualToString:", CFSTR("Depth")))
  {
    self->_inputDepthDimensions.width = objc_msgSend(a3, "width");
    self->_inputDepthDimensions.height = objc_msgSend(a3, "height");
    if (self->_providesUnfilteredDepthAsAttachedMedia)
    {
      v9 = -[BWNodeOutput mediaConfigurationForAttachedMediaKey:](self->super._output, "mediaConfigurationForAttachedMediaKey:", CFSTR("Depth"));
      if (v9)
      {
        v10 = v9;
        v11 = objc_alloc_init(BWNodeOutputMediaConfiguration);
        -[BWNodeOutputMediaConfiguration setFormatRequirements:](v11, "setFormatRequirements:", objc_msgSend(v10, "formatRequirements"));
        -[BWNodeOutputMediaConfiguration setPassthroughMode:](v11, "setPassthroughMode:", 0);
        -[BWNodeOutputMediaConfiguration setProvidesPixelBufferPool:](v11, "setProvidesPixelBufferPool:", 1);
        -[BWNodeOutput setMediaConfiguration:forAttachedMediaKey:](self->super._output, "setMediaConfiguration:forAttachedMediaKey:", v11, 0x1E495AE98);
      }
    }
  }
  else if ((objc_msgSend(a5, "isEqualToString:", 0x1E495AFF8) & 1) == 0
         && (objc_msgSend(a5, "isEqualToString:", 0x1E495B018) & 1) == 0)
  {
    v12.receiver = self;
    v12.super_class = (Class)BWDepthConverterNode;
    -[BWNode didSelectFormat:forInput:forAttachedMediaKey:](&v12, sel_didSelectFormat_forInput_forAttachedMediaKey_, a3, a4, a5);
  }
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  uint64_t v4;
  _DWORD *v7;
  __objc2_meth_list **p_opt_class_meths;
  __CVBuffer *v9;
  __CVBuffer *v10;
  int v11;
  void *v12;
  _BOOL4 v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  __CVBuffer *filteringInputBuffer;
  __CVBuffer *filteringOutputBuffer;
  uint64_t v19;
  int v20;
  int v21;
  _DWORD *v22;
  int CopyWithNewPixelBuffer;
  int v24;
  const void *v25;
  opaqueCMSampleBuffer *v26;
  BOOL v27;
  int v28;
  NSObject *v30;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *target;
  CMAttachmentBearerRef cf[25];

  cf[23] = *(CMAttachmentBearerRef *)MEMORY[0x1E0C80C00];
  cf[0] = 0;
  v7 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  p_opt_class_meths = &OBJC_PROTOCOL___FTObservable.opt_class_meths;
  target = (void *)BWSampleBufferGetAttachedMedia(a3, (uint64_t)CFSTR("Depth"));
  if (!target)
    goto LABEL_10;
  if (self && self->_stillGDRFilteringSupportEnabled)
  {
    v9 = (__CVBuffer *)CMGetAttachment(a3, CFSTR("BWStillImageCaptureSettings"), 0);
    v10 = v9;
    if (!v9)
    {
      v11 = -12780;
      goto LABEL_42;
    }
    if ((-[__CVBuffer captureFlags](v9, "captureFlags") & 0x800) == 0
      || (BWStillImageProcessingFlagsForSampleBuffer(a3) & 0x200000) != 0 && self->_skipSmartStyleBuffer)
    {
LABEL_10:
      v10 = 0;
      v11 = 0;
      goto LABEL_42;
    }
    v12 = (void *)CMGetAttachment(a3, CFSTR("StillImageSettings"), 0);
    if (!v12)
    {
      v11 = FigSignalErrorAt();
      v10 = 0;
      goto LABEL_42;
    }
    v13 = (objc_msgSend(v12, "depthDataFiltered") & 1) != 0 || self->_depthOriginatesFromNeuralNetwork;
    if (objc_msgSend((id)objc_msgSend((id)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05CB0], 0), "objectForKeyedSubscript:", *MEMORY[0x1E0D06E98]), "BOOLValue"))
    {
      if (dword_1EE6BE6F8)
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        v10 = 0;
        v11 = -16809;
        p_opt_class_meths = &OBJC_PROTOCOL___FTObservable.opt_class_meths;
      }
      else
      {
        v10 = 0;
        v11 = -16809;
      }
      goto LABEL_42;
    }
    v34 = v4;
  }
  else
  {
    v34 = v4;
    v13 = 0;
  }
  v14 = -[BWDepthConverterNode _resolveFilteringTypeWithStillFilteringRequested:]((uint64_t)self, v13);
  v15 = objc_msgSend((id)objc_msgSend(-[BWNodeOutput mediaPropertiesForAttachedMediaKey:](self->super._output, "mediaPropertiesForAttachedMediaKey:", CFSTR("Depth")), "livePixelBufferPool"), "newPixelBuffer");
  v10 = (__CVBuffer *)v15;
  if (!v15)
  {
    v11 = -12786;
    goto LABEL_42;
  }
  if (v14)
  {
    filteringInputBuffer = self->_filteringInputBuffer;
    if (self->_conversionAfterFilteringRequired)
      filteringOutputBuffer = self->_filteringOutputBuffer;
    else
      filteringOutputBuffer = (__CVBuffer *)v15;
  }
  else
  {
    filteringOutputBuffer = 0;
    filteringInputBuffer = (__CVBuffer *)v15;
  }
  if (self->_depthOriginatesFromNeuralNetwork)
  {
    filteringInputBuffer = CMSampleBufferGetImageBuffer((CMSampleBufferRef)target);
  }
  else
  {
    v20 = -[BWDepthConverterNode convertToFloatAndRotate:inputSampleBuffer:outputPixelBuffer:]((uint64_t)self, (CMSampleBufferRef)target, v16, filteringInputBuffer);
    if (v20)
    {
      v11 = v20;
      v33 = v34;
      LODWORD(v32) = v20;
      goto LABEL_74;
    }
  }
  if (v14)
  {
    v21 = -[BWDepthConverterNode filterDepthPixelBuffer:outputDepthPixelBuffer:yuvImageSampleBuffer:depthSampleBuffer:filteringType:]((uint64_t)self, filteringInputBuffer, filteringOutputBuffer, a3, v19, v14);
    if (v21)
    {
      v11 = v21;
LABEL_75:
      v7 = (_DWORD *)MEMORY[0x1E0CA1FC0];
      p_opt_class_meths = (__objc2_meth_list **)(&OBJC_PROTOCOL___FTObservable + 48);
      goto LABEL_42;
    }
    if (self->_conversionAfterFilteringRequired)
    {
      v22 = (_DWORD *)MEMORY[0x1E0CA1FC0];
      if (*MEMORY[0x1E0CA1FC0] == 1)
        kdebug_trace();
      v11 = FigDepthConvertBuffer(filteringOutputBuffer, v10);
      if (*v22 == 1)
        kdebug_trace();
      if (v11)
      {
        v33 = v34;
        LODWORD(v32) = v11;
        goto LABEL_74;
      }
    }
  }
  CopyWithNewPixelBuffer = BWCMSampleBufferCreateCopyWithNewPixelBuffer((opaqueCMSampleBuffer *)target, v10, (CFTypeRef *)&self->_outputFormatDescription, (CMSampleBufferRef *)cf);
  if (CopyWithNewPixelBuffer)
  {
    v11 = CopyWithNewPixelBuffer;
    v33 = v34;
    LODWORD(v32) = CopyWithNewPixelBuffer;
LABEL_74:
    FigDebugAssert3();
    goto LABEL_75;
  }
  v24 = FigDepthConvertRotationAndMirroringToExifOrientation(self->_rotationDegrees, self->_mirroringEnabled);
  v25 = (const void *)-[BWDepthConverterNode _depthMetadataDictionaryFromSampleBuffer:orientation:stillFilteringRequested:]((uint64_t)self, a3, v24, v13);
  if (self->_stillGDRFilteringSupportEnabled)
    v26 = a3;
  else
    v26 = (opaqueCMSampleBuffer *)cf[0];
  CMSetAttachment(v26, (CFStringRef)*MEMORY[0x1E0D086F0], v25, 1u);
  CMRemoveAttachment(cf[0], CFSTR("OriginalCameraIntrinsicMatrix"));
  p_opt_class_meths = &OBJC_PROTOCOL___FTObservable.opt_class_meths;
  if (self->_providesUnfilteredDepthAsAttachedMedia)
    -[BWDepthConverterNode _generateAndAttachUnfilteredDepthToSampleBuffer:depthOutputPixelBuffer:depthOutputSampleBuffer:]((uint64_t)self, a3, v10, (opaqueCMSampleBuffer *)cf[0]);
  v11 = 0;
  v7 = (_DWORD *)MEMORY[0x1E0CA1FC0];
LABEL_42:
  if (*v7 == 1)
    kdebug_trace();
  if (v11)
    v27 = 1;
  else
    v27 = cf[0] == 0;
  v28 = !v27;
  if (self->_stillGDRFilteringSupportEnabled && *((_DWORD *)p_opt_class_meths + 446) != 0)
  {
    v30 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (v28)
  {
    BWSampleBufferSetAttachedMedia(a3, (uint64_t)CFSTR("Depth"), (uint64_t)cf[0]);
  }
  else if (target)
  {
    BWSampleBufferRemoveAttachedMedia(a3, (uint64_t)CFSTR("Depth"));
  }
  if (cf[0])
    CFRelease(cf[0]);
  if (v10)
    CFRelease(v10);
  -[BWNodeOutput emitSampleBuffer:](self->super._output, "emitSampleBuffer:", a3, v32, v33);
}

- (id)nodeType
{
  return CFSTR("Effect");
}

- (void)setVerticalSensorBinningFactor:(int)a3
{
  self->_verticalSensorBinningFactor = a3;
}

- (void)setHorizontalSensorBinningFactor:(int)a3
{
  self->_horizontalSensorBinningFactor = a3;
}

- (BWDepthConverterNode)initWithStillImageNodeConfiguration:(id)a3 cameraInfoByPortType:(id)a4 sensorIDDictionary:(id)a5 rgbPersonSegmentationEnabled:(BOOL)a6 depthIsAlwaysHighQuality:(BOOL)a7 depthOriginatesFromNeuralNetwork:(BOOL)a8 backPressureDrivenPipelining:(BOOL)a9
{
  _BOOL4 v11;
  BWDepthConverterNode *v15;
  BWNodeInput *v16;
  BWVideoFormatRequirements *v17;
  BWNodeInputMediaConfiguration *v18;
  BWVideoFormatRequirements *v19;
  BWVideoFormatRequirements *v20;
  void *v21;
  BWNodeInputMediaConfiguration *v22;
  BWVideoFormatRequirements *v23;
  BWNodeOutput *v24;
  BWVideoFormatRequirements *v25;
  BWNodeOutputMediaConfiguration *v26;
  BWVideoFormatRequirements *v27;
  objc_super v29;

  v11 = a6;
  v29.receiver = self;
  v29.super_class = (Class)BWDepthConverterNode;
  v15 = -[BWNode init](&v29, sel_init);
  if (v15)
  {
    v15->_stillImageNodeConfiguration = (BWStillImageNodeConfiguration *)a3;
    v15->_cameraInfoByPortType = (NSDictionary *)a4;
    v15->_sensorIDDictionary = (NSDictionary *)a5;
    v15->_depthIsAlwaysHighQuality = a7;
    v15->_depthOriginatesFromNeuralNetwork = a8;
    v15->_backPressureDrivenPipelining = a9;
    v16 = -[BWNodeInput initWithMediaType:node:]([BWNodeInput alloc], "initWithMediaType:node:", 1986618469, v15);
    v17 = objc_alloc_init(BWVideoFormatRequirements);
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v17, "setSupportedPixelFormats:", FigCapturePixelFormatsByAddingCompressedVariants(&unk_1E4A011D8, 3));
    -[BWNodeInput setFormatRequirements:](v16, "setFormatRequirements:", v17);

    -[BWNodeInput setPassthroughMode:](v16, "setPassthroughMode:", 1);
    v18 = objc_alloc_init(BWNodeInputMediaConfiguration);
    v19 = objc_alloc_init(BWVideoFormatRequirements);
    v20 = v19;
    if (v15->_depthOriginatesFromNeuralNetwork)
      v21 = &unk_1E4A011F0;
    else
      v21 = &unk_1E4A01208;
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v19, "setSupportedPixelFormats:", v21);
    -[BWNodeInputMediaConfiguration setFormatRequirements:](v18, "setFormatRequirements:", v20);
    -[BWNodeInputMediaConfiguration setPassthroughMode:](v18, "setPassthroughMode:", 0);
    -[BWNodeInput setMediaConfiguration:forAttachedMediaKey:](v16, "setMediaConfiguration:forAttachedMediaKey:", v18, CFSTR("Depth"));
    if (v11)
    {
      v22 = objc_alloc_init(BWNodeInputMediaConfiguration);
      v23 = objc_alloc_init(BWVideoFormatRequirements);
      -[BWVideoFormatRequirements setSupportedPixelFormats:](v23, "setSupportedPixelFormats:", &unk_1E4A01220);
      -[BWNodeInputMediaConfiguration setFormatRequirements:](v22, "setFormatRequirements:", v23);
      -[BWNodeInputMediaConfiguration setPassthroughMode:](v22, "setPassthroughMode:", 0);
      -[BWNodeInput setMediaConfiguration:forAttachedMediaKey:](v16, "setMediaConfiguration:forAttachedMediaKey:", v22, 0x1E495AFF8);
    }
    -[BWNode addInput:](v15, "addInput:", v16);

    v24 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1986618469, v15);
    v25 = objc_alloc_init(BWVideoFormatRequirements);
    -[BWNodeOutput setFormatRequirements:](v24, "setFormatRequirements:", v25);
    -[BWNodeOutput setPassthroughMode:](v24, "setPassthroughMode:", 1);

    v26 = objc_alloc_init(BWNodeOutputMediaConfiguration);
    v27 = objc_alloc_init(BWVideoFormatRequirements);
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v27, "setSupportedPixelFormats:", &unk_1E4A01238);
    -[BWNodeOutputMediaConfiguration setFormatRequirements:](v26, "setFormatRequirements:", v27);
    -[BWNodeOutputMediaConfiguration setPassthroughMode:](v26, "setPassthroughMode:", 0);
    -[BWNodeOutputMediaConfiguration setPixelBufferPoolProvidesBackPressure:](v26, "setPixelBufferPoolProvidesBackPressure:", v15->_backPressureDrivenPipelining);
    -[BWNodeOutputMediaConfiguration setPixelBufferPoolReportSlowBackPressureAllocations:](v26, "setPixelBufferPoolReportSlowBackPressureAllocations:", v15->_backPressureDrivenPipelining);
    -[BWNodeOutput setMediaConfiguration:forAttachedMediaKey:](v24, "setMediaConfiguration:forAttachedMediaKey:", v26, CFSTR("Depth"));
    -[BWNode addOutput:](v15, "addOutput:", v24);

    v15->_forceCPath = 0;
  }
  return v15;
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  _BOOL4 v3;
  __CVBuffer *streamingFilteringScaledDepthInputBuffer;
  __CVBuffer *streamingFilteringScaledDepthOutputBuffer;
  __CVBuffer *filteringInputBuffer;
  __CVBuffer *filteringOutputBuffer;
  __CVBuffer *filteringScaledYUVBuffer;
  uint64_t v9;
  uint64_t width;
  uint64_t height;
  int v12;
  float v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __CFString *v18;
  uint64_t v19;
  objc_super v20;

  if (self)
    v3 = self->_streamingGDRFilteringEnabled
      || self->_streamingSMPFilteringEnabled
      || self->_stillGDRFilteringSupportEnabled;
  else
    v3 = 0;
  if (-[BWDepthConverterNode _parseCameraInfo]((uint64_t)self))
    goto LABEL_62;
  streamingFilteringScaledDepthInputBuffer = self->_streamingFilteringScaledDepthInputBuffer;
  if (streamingFilteringScaledDepthInputBuffer)
  {
    CFRelease(streamingFilteringScaledDepthInputBuffer);
    self->_streamingFilteringScaledDepthInputBuffer = 0;
  }
  streamingFilteringScaledDepthOutputBuffer = self->_streamingFilteringScaledDepthOutputBuffer;
  if (streamingFilteringScaledDepthOutputBuffer)
  {
    CFRelease(streamingFilteringScaledDepthOutputBuffer);
    self->_streamingFilteringScaledDepthOutputBuffer = 0;
  }
  filteringInputBuffer = self->_filteringInputBuffer;
  if (filteringInputBuffer)
  {
    CFRelease(filteringInputBuffer);
    self->_filteringInputBuffer = 0;
  }
  filteringOutputBuffer = self->_filteringOutputBuffer;
  if (filteringOutputBuffer)
  {
    CFRelease(filteringOutputBuffer);
    self->_filteringOutputBuffer = 0;
  }
  filteringScaledYUVBuffer = self->_filteringScaledYUVBuffer;
  if (filteringScaledYUVBuffer)
  {
    CFRelease(filteringScaledYUVBuffer);
    self->_filteringScaledYUVBuffer = 0;
  }
  if (!v3)
    goto LABEL_66;
  if (self->_streamingGDRFilteringEnabled || self->_streamingSMPFilteringEnabled)
  {
    v9 = 1717856627;
    self->_depthProcessorClassName = (NSString *)CFSTR("FigStreamingDepthProcessorCPU");
    width = self->_outputDimensions.width;
    height = self->_outputDimensions.height;
    if (self->_streamingGDRFilteringEnabled)
    {
      v12 = (int)width <= (int)height ? self->_outputDimensions.height : self->_outputDimensions.width;
      v13 = 320.0 / (float)v12;
      if (v13 == 1.0)
      {
        v15 = 1717856627;
      }
      else
      {
        width = (int)(float)(v13 * (float)(int)width);
        height = (int)(float)(v13 * (float)(int)height);
        if (BWCreateIOSurfaceBackedCVPixelBuffer(width, height, 1717856627, &self->_streamingFilteringScaledDepthInputBuffer, CFSTR("DepthConverter: Scaled Depth Input"))|| (v14 = BWCreateIOSurfaceBackedCVPixelBuffer(width, height, 1717856627, &self->_streamingFilteringScaledDepthOutputBuffer, CFSTR("DepthConverter: Scaled Depth Output")), v15 = 1717856627, v9 = 1717856627, v14))
        {
LABEL_62:
          FigDebugAssert3();
          return;
        }
      }
    }
    else
    {
      v16 = FigDepthFormatIsDisparity(self->_outputFormat) ? 1717856627 : 1717855600;
      v15 = FigDepthFormatIsDisparity(self->_outputFormat) ? 1717856627 : 1717855600;
      v9 = v16;
      height = height;
    }
    if (self->_streamingSMPFilteringEnabled)
    {
      v17 = v9;
      if (-[BWNodeConnection pipelineStage](-[BWNodeInput connection](self->super._input, "connection"), "pipelineStage"))
      {
        -[BWPipelineStage priority](-[BWNodeConnection pipelineStage](-[BWNodeInput connection](self->super._input, "connection"), "pipelineStage"), "priority");
      }
      self->_depthProcessorWorkerQueue = (OS_dispatch_queue *)FigDispatchQueueCreateWithPriority();
      v9 = v17;
    }
  }
  else
  {
    v15 = 1751411059;
    v18 = self->_depthOriginatesFromNeuralNetwork
        ? CFSTR("FigStillDepthProcessorANE")
        : CFSTR("FigStillDepthProcessorGPU");
    v9 = self->_depthOriginatesFromNeuralNetwork ? 1717855600 : 1751411059;
    self->_depthProcessorClassName = &v18->isa;
    width = self->_outputDimensions.width;
    height = self->_outputDimensions.height;
  }
  self->_conversionAfterFilteringRequired = self->_outputFormat != (_DWORD)v15;
  if (BWCreateIOSurfaceBackedCVPixelBuffer(self->_outputDimensions.width, self->_outputDimensions.height, v9, &self->_filteringInputBuffer, CFSTR("DepthConverter: Filtering Input"))|| self->_conversionAfterFilteringRequired&& BWCreateIOSurfaceBackedCVPixelBuffer(self->_outputDimensions.width, self->_outputDimensions.height, v15, &self->_filteringOutputBuffer, CFSTR("DepthConverter: Filtering Output")))
  {
    goto LABEL_62;
  }
  if (!self->_scaler && CMPhotoScaleAndRotateSessionCreate())
    goto LABEL_62;
  v19 = FigCapturePixelFormatIsFullRange(-[BWVideoFormat pixelFormat](-[BWNodeInput videoFormat](self->super._input, "videoFormat"), "pixelFormat"))? 875704422: 875704438;
  if (BWCreateIOSurfaceBackedCVPixelBuffer(width, height, v19, &self->_filteringScaledYUVBuffer, CFSTR("DepthConverter: Scaled YUV")))goto LABEL_62;
  if (self->_depthProcessor
    || !-[BWDepthConverterNode _loadAndConfigureDepthProcessorClass:]((uint64_t)self, self->_depthProcessorClassName))
  {
LABEL_66:
    if (!self->_providesUnfilteredDepthAsAttachedMedia
      || !VTPixelTransferSessionCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], &self->_unfilteredDepthTransferSession))
    {
      v20.receiver = self;
      v20.super_class = (Class)BWDepthConverterNode;
      -[BWNode prepareForCurrentConfigurationToBecomeLive](&v20, sel_prepareForCurrentConfigurationToBecomeLive);
    }
  }
}

- (uint64_t)_parseCameraInfo
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  int v17;
  void *v18;
  __int128 *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  void *v23;
  __int128 *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  void *v29;

  if (!result)
    return result;
  v1 = result;
  v2 = objc_msgSend(*(id *)(result + 120), "objectForKeyedSubscript:", *MEMORY[0x1E0D05A40]);
  v3 = *(void **)(v1 + 120);
  if (v2)
  {
    v4 = *MEMORY[0x1E0D05A38];
    if (objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D05A38]))
      v5 = v4;
    else
      v5 = *MEMORY[0x1E0D05A50];
    v6 = (void *)objc_msgSend(*(id *)(v1 + 120), "objectForKeyedSubscript:", v5);
    v7 = (void *)objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D05928]);
    *(_DWORD *)(v1 + 240) = 1;
    *(_BYTE *)(v1 + 489) = 1;
    objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D05968]), "floatValue");
    *(_DWORD *)(v1 + 376) = v8;
    goto LABEL_15;
  }
  v9 = *MEMORY[0x1E0D05A18];
  if (objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D05A18])
    && (v10 = *MEMORY[0x1E0D05A30], objc_msgSend(*(id *)(v1 + 120), "objectForKeyedSubscript:", *MEMORY[0x1E0D05A30])))
  {
    v11 = (void *)objc_msgSend(*(id *)(v1 + 120), "objectForKeyedSubscript:", v10);
    v7 = (void *)objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0D05928]);
    v12 = *(void **)(v1 + 120);
    v13 = v10;
  }
  else
  {
    if (!objc_msgSend(*(id *)(v1 + 120), "objectForKeyedSubscript:", v9)
      || !objc_msgSend(*(id *)(v1 + 120), "objectForKeyedSubscript:", *MEMORY[0x1E0D05A28]))
    {
      v28 = *MEMORY[0x1E0D05A38];
      if (!objc_msgSend(*(id *)(v1 + 120), "objectForKeyedSubscript:", *MEMORY[0x1E0D05A38])
        || objc_msgSend(*(id *)(v1 + 120), "count") != 1)
      {
        return 4294954514;
      }
      v29 = (void *)objc_msgSend(*(id *)(v1 + 120), "objectForKeyedSubscript:", v28);
      v7 = (void *)objc_msgSend(v29, "objectForKeyedSubscript:", *MEMORY[0x1E0D05928]);
      v16 = *MEMORY[0x1E0D05968];
      v15 = v29;
      goto LABEL_14;
    }
    v14 = (void *)objc_msgSend(*(id *)(v1 + 120), "objectForKeyedSubscript:", v9);
    v7 = (void *)objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E0D05928]);
    v12 = *(void **)(v1 + 120);
    v13 = v9;
  }
  v15 = (void *)objc_msgSend(v12, "objectForKeyedSubscript:", v13);
  v16 = *MEMORY[0x1E0D05968];
LABEL_14:
  objc_msgSend((id)objc_msgSend(v15, "objectForKeyedSubscript:", v16), "floatValue");
  *(_DWORD *)(v1 + 376) = v17;
  *(_DWORD *)(v1 + 240) = 0;
LABEL_15:
  *(_DWORD *)(v1 + 176) = 1065353216;
  *(_DWORD *)(v1 + 196) = 1065353216;
  *(_DWORD *)(v1 + 216) = 1065353216;
  if (*(_BYTE *)(v1 + 425))
    return 0;
  if (!v7)
    return FigSignalErrorAt();
  v18 = (void *)objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D065A8]);
  if (objc_msgSend(v18, "length") != 64)
    goto LABEL_27;
  v19 = (__int128 *)objc_msgSend(v18, "bytes");
  v20 = v19[3];
  v22 = *v19;
  v21 = v19[1];
  *(_OWORD *)(v1 + 280) = v19[2];
  *(_OWORD *)(v1 + 296) = v20;
  *(_OWORD *)(v1 + 248) = v22;
  *(_OWORD *)(v1 + 264) = v21;
  v23 = (void *)objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D065B0]);
  if (objc_msgSend(v23, "length") != 64)
  {
LABEL_27:
    FigDebugAssert3();
    return 0;
  }
  v24 = (__int128 *)objc_msgSend(v23, "bytes");
  result = 0;
  v25 = v24[3];
  v27 = *v24;
  v26 = v24[1];
  *(_OWORD *)(v1 + 344) = v24[2];
  *(_OWORD *)(v1 + 360) = v25;
  *(_OWORD *)(v1 + 312) = v27;
  *(_OWORD *)(v1 + 328) = v26;
  *(_BYTE *)(v1 + 244) = 1;
  return result;
}

- (uint64_t)_updateOutputRequirements
{
  uint64_t v1;
  BWNodeOutputMediaConfiguration *v2;
  BWVideoFormatRequirements *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    v2 = objc_alloc_init(BWNodeOutputMediaConfiguration);
    v3 = objc_alloc_init(BWVideoFormatRequirements);
    v4[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(v1 + 152));
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v3, "setSupportedPixelFormats:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1));
    -[BWVideoFormatRequirements setWidth:](v3, "setWidth:", *(int *)(v1 + 156));
    -[BWVideoFormatRequirements setHeight:](v3, "setHeight:", *(int *)(v1 + 160));
    -[BWNodeOutputMediaConfiguration setFormatRequirements:](v2, "setFormatRequirements:", v3);
    -[BWNodeOutputMediaConfiguration setPassthroughMode:](v2, "setPassthroughMode:", 0);
    -[BWNodeOutputMediaConfiguration setProvidesPixelBufferPool:](v2, "setProvidesPixelBufferPool:", 1);
    -[BWNodeOutputMediaConfiguration setPixelBufferPoolProvidesBackPressure:](v2, "setPixelBufferPoolProvidesBackPressure:", *(unsigned __int8 *)(v1 + 164));
    -[BWNodeOutputMediaConfiguration setPixelBufferPoolReportSlowBackPressureAllocations:](v2, "setPixelBufferPoolReportSlowBackPressureAllocations:", *(unsigned __int8 *)(v1 + 164));
    return objc_msgSend(*(id *)(v1 + 16), "setMediaConfiguration:forAttachedMediaKey:", v2, CFSTR("Depth"));
  }
  return result;
}

- (void)setStreamingSMPFilteringEnabled:(BOOL)a3
{
  self->_streamingSMPFilteringEnabled = a3;
}

- (void)setStreamingGDRFilteringEnabled:(BOOL)a3
{
  self->_streamingGDRFilteringEnabled = a3;
}

- (void)setRotationDegrees:(int)a3
{
  self->_rotationDegrees = a3;
}

- (void)setProvidesUnfilteredDepthAsAttachedMedia:(BOOL)a3
{
  self->_providesUnfilteredDepthAsAttachedMedia = a3;
}

- (void)setOutputFormat:(unsigned int)a3
{
  if (self->_outputFormat != a3)
  {
    self->_outputFormat = a3;
    -[BWDepthConverterNode _updateOutputRequirements]((uint64_t)self);
  }
}

- (void)setOutputDimensions:(id)a3
{
  if (self->_outputDimensions.width != a3.var0 || self->_outputDimensions.height != a3.var1)
  {
    self->_outputDimensions = ($470D365275581EF16070F5A11344F73E)a3;
    -[BWDepthConverterNode _updateOutputRequirements]((uint64_t)self);
  }
}

- (void)setMirroringEnabled:(BOOL)a3
{
  self->_mirroringEnabled = a3;
}

- (void)setBaseRotationDegrees:(int)a3
{
  self->_baseRotationDegrees = a3;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (void)dealloc
{
  opaqueCMFormatDescription *outputFormatDescription;
  __CVBuffer *fixedPointScaledIntermediateBuffer;
  __CVBuffer *fixedPointRotatedIntermediateBuffer;
  __CVBuffer *filteringInputBuffer;
  __CVBuffer *filteringOutputBuffer;
  __CVBuffer *streamingFilteringScaledDepthInputBuffer;
  __CVBuffer *streamingFilteringScaledDepthOutputBuffer;
  __CVBuffer *filteringScaledYUVBuffer;
  opaqueCMFormatDescription *unfilteredDepthFormatDescription;
  OpaqueVTPixelTransferSession *unfilteredDepthTransferSession;
  CMPhotoScaleAndRotateSession *scaler;
  objc_super v14;

  outputFormatDescription = self->_outputFormatDescription;
  if (outputFormatDescription)
    CFRelease(outputFormatDescription);
  fixedPointScaledIntermediateBuffer = self->_fixedPointScaledIntermediateBuffer;
  if (fixedPointScaledIntermediateBuffer)
    CFRelease(fixedPointScaledIntermediateBuffer);
  fixedPointRotatedIntermediateBuffer = self->_fixedPointRotatedIntermediateBuffer;
  if (fixedPointRotatedIntermediateBuffer)
    CFRelease(fixedPointRotatedIntermediateBuffer);
  filteringInputBuffer = self->_filteringInputBuffer;
  if (filteringInputBuffer)
    CFRelease(filteringInputBuffer);
  filteringOutputBuffer = self->_filteringOutputBuffer;
  if (filteringOutputBuffer)
    CFRelease(filteringOutputBuffer);
  streamingFilteringScaledDepthInputBuffer = self->_streamingFilteringScaledDepthInputBuffer;
  if (streamingFilteringScaledDepthInputBuffer)
    CFRelease(streamingFilteringScaledDepthInputBuffer);
  streamingFilteringScaledDepthOutputBuffer = self->_streamingFilteringScaledDepthOutputBuffer;
  if (streamingFilteringScaledDepthOutputBuffer)
    CFRelease(streamingFilteringScaledDepthOutputBuffer);
  filteringScaledYUVBuffer = self->_filteringScaledYUVBuffer;
  if (filteringScaledYUVBuffer)
    CFRelease(filteringScaledYUVBuffer);
  unfilteredDepthFormatDescription = self->_unfilteredDepthFormatDescription;
  if (unfilteredDepthFormatDescription)
    CFRelease(unfilteredDepthFormatDescription);
  unfilteredDepthTransferSession = self->_unfilteredDepthTransferSession;
  if (unfilteredDepthTransferSession)
    CFRelease(unfilteredDepthTransferSession);
  scaler = self->_scaler;
  if (scaler)
  {
    CFRelease(scaler);
    self->_scaler = 0;
  }
  v14.receiver = self;
  v14.super_class = (Class)BWDepthConverterNode;
  -[BWNode dealloc](&v14, sel_dealloc);
}

- (id)nodeSubType
{
  return CFSTR("DepthConverter");
}

- (uint64_t)_loadAndConfigureDepthProcessorClass:(uint64_t)result
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  void *v7;
  void *v8;
  __CVBuffer *v9;
  size_t Width;
  int *v11;
  uint64_t v12;
  size_t v13;
  size_t Height;
  size_t BytesPerRow;

  if (result)
  {
    v3 = result;
    v13 = 0;
    Height = 0;
    BytesPerRow = 0;
    *(_DWORD *)(result + 520) = -[FigCaptureCameraParameters depthProcessorVersion](+[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance"), "depthProcessorVersion");
    if (*(_DWORD *)(v3 + 520))
    {
      v4 = objc_msgSend(*(id *)(v3 + 544), "pearlModuleType");
      v5 = *(unsigned int *)(v3 + 520);
      if (v4 == 2 && (int)v5 < 2)
        return 4294954516;
      v7 = BWLoadProcessorBundle((uint64_t)CFSTR("DepthProcessor"), v5);
      if (!v7)
        return 4294954510;
      v8 = v7;
      v9 = *(__CVBuffer **)(v3 + 456);
      if (v9 && *(_QWORD *)(v3 + 464))
      {
        Width = CVPixelBufferGetWidth(v9);
        v11 = &OBJC_IVAR___BWDepthConverterNode__streamingFilteringScaledDepthInputBuffer;
      }
      else
      {
        v11 = &OBJC_IVAR___BWDepthConverterNode__filteringInputBuffer;
        Width = CVPixelBufferGetWidth(*(CVPixelBufferRef *)(v3 + 448));
      }
      v13 = Width;
      Height = CVPixelBufferGetHeight(*(CVPixelBufferRef *)(v3 + *v11));
      BytesPerRow = CVPixelBufferGetBytesPerRow(*(CVPixelBufferRef *)(v3 + *v11));
      v12 = objc_msgSend(objc_alloc((Class)objc_msgSend(v8, "classNamed:", a2)), "initWithParameters:commandQueue:", &v13, objc_msgSend(*(id *)(v3 + 544), "metalCommandQueue"));
      *(_QWORD *)(v3 + 512) = v12;
      if (!v12)
        return 4294954510;
      if (objc_msgSend(a2, "isEqualToString:", CFSTR("FigStillDepthProcessorGPU"))
        || objc_msgSend(a2, "isEqualToString:", CFSTR("FigStillDepthProcessorANE")))
      {
        result = objc_msgSend(*(id *)(v3 + 512), "setTuningParameters:", objc_msgSend(*(id *)(v3 + 112), "objectForKeyedSubscript:", CFSTR("DepthProcessingParameters")));
        if ((_DWORD)result)
          return result;
      }
      else if (objc_msgSend(a2, "isEqualToString:", CFSTR("FigStreamingDepthProcessorCPU")))
      {
        objc_msgSend(*(id *)(v3 + 512), "setCameraInfoByPortType:", *(_QWORD *)(v3 + 120));
        if (*(int *)(v3 + 520) >= 2)
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(*(id *)(v3 + 512), "setStreamingGDRFilterEnabled:", *(unsigned __int8 *)(v3 + 104));
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(*(id *)(v3 + 512), "setStreamingSMPFilterEnabled:", *(unsigned __int8 *)(v3 + 106));
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(*(id *)(v3 + 512), "setWorkerQueue:", *(_QWORD *)(v3 + 536));
        }
      }
      if ((objc_msgSend(*(id *)(v3 + 512), "allocateResources") & 1) == 0)
        return 4294954510;
    }
    return 0;
  }
  return result;
}

- (unsigned)outputFormat
{
  return self->_outputFormat;
}

- ($2825F4736939C4A6D3AD43837233062D)outputDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_outputDimensions;
}

- (uint64_t)_computeConversionParametersFromSampleBuffer:(uint64_t)a3 convertOptionsOut:
{
  __CVBuffer *ImageBuffer;
  size_t Width;
  size_t Height;
  size_t BytesPerRow;
  void *v11;
  void *Attributes;
  char FixedPointFractionalBits;
  char v14;
  float v15;
  void *v16;
  int v17;
  int v18;
  int v19;

  if (!a1)
    return 0;
  ImageBuffer = CMSampleBufferGetImageBuffer(sbuf);
  Width = CVPixelBufferGetWidth(ImageBuffer);
  Height = CVPixelBufferGetHeight(ImageBuffer);
  BytesPerRow = CVPixelBufferGetBytesPerRow(ImageBuffer);
  if (Width && Height && BytesPerRow && *(_DWORD *)(a1 + 156) && *(_DWORD *)(a1 + 160) != 0)
  {
    v11 = (void *)CMGetAttachment(sbuf, CFSTR("DepthPixelBufferType"), 0);
    Attributes = (void *)CVPixelBufferGetAttributes();
    *(_DWORD *)(a3 + 12) = objc_msgSend((id)objc_msgSend(Attributes, "objectForKeyedSubscript:", *MEMORY[0x1E0CA8FC8]), "shortValue");
    if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0D063A0]))
    {
      FixedPointFractionalBits = CVPixelBufferGetFixedPointFractionalBits();
      v14 = 1;
      v15 = (float)(1.0 / (float)(1 << FixedPointFractionalBits)) * 0.001;
      *(_DWORD *)(a3 + 4) = 0;
    }
    else
    {
      v16 = (void *)CMGetAttachment(sbuf, (CFStringRef)*MEMORY[0x1E0D05C28], 0);
      objc_msgSend((id)objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0D063B0]), "floatValue");
      *(_DWORD *)(a3 + 4) = v17;
      objc_msgSend((id)objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0D063A8]), "floatValue");
      v14 = 0;
    }
    *(float *)(a3 + 8) = v15;
    *(_BYTE *)(a3 + 16) = v14;
    v18 = FigCaptureNormalizeAngle(*(_DWORD *)(a1 + 380)+ objc_msgSend((id)objc_msgSend(Attributes, "objectForKeyedSubscript:", *MEMORY[0x1E0CA90D0]), "intValue")- *(_DWORD *)(a1 + 384));
    if (v18)
      v19 = 360 - v18;
    else
      v19 = 0;
    *(_DWORD *)a3 = FigDepthConvertRotationAndMirroringToExifOrientation(v19, *(unsigned __int8 *)(a1 + 388));
    return 0;
  }
  return FigSignalErrorAt();
}

- (uint64_t)_depthMetadataDictionaryFromSampleBuffer:(int)a3 orientation:(unsigned int)a4 stillFilteringRequested:
{
  uint64_t v7;
  const __CFString *v8;
  const __CFDictionary *v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  char v14;
  const __CFDictionary *v15;
  const __CFDictionary *v16;
  void *v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  float32x4_t v22;
  CFTypeRef v23;
  CFTypeRef v24;
  const void *AttachedMedia;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  int v42;
  __int128 v43;
  __int128 v44;
  CGPoint v45;
  CGSize size;
  CMTime time;
  _BYTE v48[32];
  _BYTE v49[32];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  if (!result)
    return result;
  v7 = result;
  v8 = (const __CFString *)*MEMORY[0x1E0D05CB0];
  v9 = (const __CFDictionary *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  CMSampleBufferGetPresentationTimeStamp(&time, (CMSampleBufferRef)target);
  CMTimeGetSeconds(&time);
  if (*(_BYTE *)(v7 + 105))
    v10 = a4;
  else
    v10 = 0;
  if (*(_BYTE *)(v7 + 489))
  {
    v11 = (FigDepthDataGetCurrentMajorVersion() << 16) | 0x4E22;
    v12 = 1;
  }
  else
  {
    if (*(_BYTE *)(v7 + 425))
      v13 = 40001;
    else
      v13 = 10001;
    v11 = v13 | (FigDepthDataGetCurrentMajorVersion() << 16);
    v12 = *(unsigned __int8 *)(v7 + 425);
  }
  v14 = v10 ^ 1;
  if (*(_BYTE *)(v7 + 424))
    v14 = 1;
  if ((v14 & 1) == 0)
    v12 = objc_msgSend(*(id *)(v7 + 512), "figDepthQuality");
  size = (CGSize)*MEMORY[0x1E0C9D820];
  v15 = (const __CFDictionary *)CMGetAttachment(target, CFSTR("OriginalCameraIntrinsicMatrixReferenceDimensions"), 0);
  if (!v15)
    goto LABEL_42;
  v16 = v15;
  if (!CGSizeMakeWithDictionaryRepresentation(v15, &size))
    goto LABEL_42;
  v45 = (CGPoint)*MEMORY[0x1E0C9D538];
  if (*(_BYTE *)(v7 + 244))
  {
    if (FigMotionComputeDistortionCenter(v9, (int)size.width, (int)size.height, *(_DWORD *)(v7 + 392), *(_DWORD *)(v7 + 396), (float64x2_t *)&v45, 1.0 / *(float *)(v7 + 376), 1.0))
    {
LABEL_42:
      FigDebugAssert3();
      return 0;
    }
    v17 = (void *)-[__CFDictionary objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D069D8]);
    LODWORD(v18) = 1.0;
    if (v17)
      objc_msgSend(v17, "floatValue", v18);
    v19 = 0;
    v20 = v7 + 248;
    v21 = v7 + 312;
    v22 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&v18, 0);
    do
    {
      *(float32x4_t *)&v49[v19] = vmlaq_f32(*(float32x4_t *)(v20 + v19 + 32), v22, *(float32x4_t *)(v21 + v19 + 32));
      *(float32x4_t *)&v48[v19] = vmlaq_f32(*(float32x4_t *)(v20 + v19), v22, *(float32x4_t *)(v21 + v19));
      v19 += 16;
    }
    while (v19 != 32);
  }
  v23 = CMGetAttachment(target, CFSTR("OriginalCameraIntrinsicMatrix"), 0);
  if (!v23)
    goto LABEL_42;
  v24 = v23;
  v42 = a3;
  AttachedMedia = (const void *)BWSampleBufferGetAttachedMedia(target, (uint64_t)CFSTR("Depth"));
  v26 = (void *)CMGetAttachment(AttachedMedia, v8, 0);
  v27 = *MEMORY[0x1E0D08438];
  if (objc_msgSend(v26, "objectForKeyedSubscript:", *MEMORY[0x1E0D08438]))
  {
    v28 = 1;
  }
  else if (*(_BYTE *)(v7 + 104))
  {
    v28 = 1;
  }
  else
  {
    v28 = v10;
  }
  v29 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v30 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v12);
  objc_msgSend(v29, "setObject:forKeyedSubscript:", v30, *MEMORY[0x1E0D08470]);
  objc_msgSend(v29, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v28), v27);
  v31 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(v7 + 240));
  objc_msgSend(v29, "setObject:forKeyedSubscript:", v31, *MEMORY[0x1E0D08428]);
  *(float *)&v32 = *(float *)(v7 + 376) * 0.001;
  v33 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v32);
  objc_msgSend(v29, "setObject:forKeyedSubscript:", v33, *MEMORY[0x1E0D08468]);
  objc_msgSend(v29, "setObject:forKeyedSubscript:", v24, *MEMORY[0x1E0D08440]);
  objc_msgSend(v29, "setObject:forKeyedSubscript:", v16, *MEMORY[0x1E0D08448]);
  v34 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v7 + 176, 64);
  objc_msgSend(v29, "setObject:forKeyedSubscript:", v34, *MEMORY[0x1E0D08430]);
  if (*(_BYTE *)(v7 + 244))
  {
    objc_msgSend(v29, "setObject:forKeyedSubscript:", CGPointCreateDictionaryRepresentation(v45), *MEMORY[0x1E0D08458]);
    v35 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v49, 32);
    objc_msgSend(v29, "setObject:forKeyedSubscript:", v35, *MEMORY[0x1E0D08460]);
    v36 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v48, 32);
    objc_msgSend(v29, "setObject:forKeyedSubscript:", v36, *MEMORY[0x1E0D08450]);
  }
  v37 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v11);
  objc_msgSend(v29, "setObject:forKeyedSubscript:", v37, *MEMORY[0x1E0D08478]);
  if (FigDepthRotateMetadataDictionary(v29, v42))
  {
    FigDebugAssert3();
    FigSignalErrorAt();
    return 0;
  }
  if (v10)
  {
    v38 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(v7 + 512), "disparityQualityIsHigh"));
    objc_msgSend(v29, "setObject:forKeyedSubscript:", v38, *MEMORY[0x1E0D08488]);
    v39 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(*(id *)(v7 + 512), "disparityQualityScore");
    v40 = objc_msgSend(v39, "numberWithFloat:");
    objc_msgSend(v29, "setObject:forKeyedSubscript:", v40, *MEMORY[0x1E0D08480]);
  }
  v43 = *MEMORY[0x1E0C9D628];
  v44 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
  v41 = *MEMORY[0x1E0D05E48];
  if (FigCFDictionaryGetCGRectIfPresent())
  {
    FigCaptureMetadataUtilitiesUpdateDepthDataMetadataForStillImageCropAndScale(v29, *(double *)&v43, *((double *)&v43 + 1), *(double *)&v44, *((double *)&v44 + 1), 1.0);
    objc_msgSend(v26, "removeObjectForKey:", v41);
  }
  return objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v29);
}

- (uint64_t)convertToFloatAndRotate:(uint64_t)a3 inputSampleBuffer:(__CVBuffer *)a4 outputPixelBuffer:
{
  _DWORD *v7;
  __CVBuffer *ImageBuffer;
  uint64_t v9;
  unsigned __int8 Width;
  unsigned __int8 Height;
  char BytesPerRow;
  char v13;
  char v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v19[2];
  int v20;

  if (!a1)
    return 0;
  v7 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  v19[0] = 0;
  v19[1] = 0;
  v20 = 0;
  ImageBuffer = CMSampleBufferGetImageBuffer(sbuf);
  v9 = -[BWDepthConverterNode _computeConversionParametersFromSampleBuffer:convertOptionsOut:](a1, sbuf, (uint64_t)v19);
  if ((_DWORD)v9)
  {
    v17 = v9;
  }
  else
  {
    if (*(_BYTE *)(a1 + 128)
      || (Width = CVPixelBufferGetWidth(ImageBuffer),
          Height = CVPixelBufferGetHeight(ImageBuffer),
          BytesPerRow = CVPixelBufferGetBytesPerRow(ImageBuffer),
          v13 = CVPixelBufferGetWidth(a4),
          v14 = CVPixelBufferGetHeight(a4),
          v15 = CVPixelBufferGetBytesPerRow(a4),
          ((Width | Height) & 7) != 0)
      || (v13 & 7) != 0
      || (v14 & 7) != 0
      || (BytesPerRow & 0xF) != 0
      || (v15 & 0xF) != 0)
    {
      v16 = -[BWDepthConverterNode _convertDepthDisparityToFloat_C:dst:options:](a1, ImageBuffer, a4, (uint64_t)v19);
    }
    else
    {
      v16 = -[BWDepthConverterNode _convertDepthDisparityToFloat_NEON:dst:options:](a1, ImageBuffer, a4, (int *)v19);
    }
    v17 = v16;
    if (!(_DWORD)v16)
      goto LABEL_14;
  }
  FigDebugAssert3();
LABEL_14:
  if (*v7 == 1)
    kdebug_trace();
  return v17;
}

- (uint64_t)_convertDepthDisparityToFloat_NEON:(__CVBuffer *)a3 dst:(int *)a4 options:
{
  __CVBuffer *v6;
  OSType v8;
  size_t Width;
  size_t Height;
  size_t v11;
  size_t v12;
  int32x2_t v13;
  size_t v14;
  int v15;
  BOOL v16;
  int v17;
  size_t v18;
  size_t v19;
  __CVBuffer *v20;
  uint64_t v21;
  __CVBuffer *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  OSType pixelFormatType;

  if (!a1)
    return 0;
  v6 = pixelBuffer;
  v8 = CVPixelBufferGetPixelFormatType(pixelBuffer);
  Width = CVPixelBufferGetWidth(v6);
  Height = CVPixelBufferGetHeight(v6);
  v11 = CVPixelBufferGetWidth(a3);
  v12 = CVPixelBufferGetHeight(a3);
  v14 = v12;
  v15 = *a4;
  v16 = Width == v11 && Height == v12;
  v17 = !v16;
  if (v15 != 1 || v17)
  {
    pixelFormatType = v8;
    if ((v15 - 5) > 3)
    {
      v19 = v12;
      v18 = v11;
      if (!v17)
      {
LABEL_22:
        if (v15 == 1)
          goto LABEL_30;
LABEL_23:
        v22 = *(__CVBuffer **)(a1 + 440);
        if (v22
          && CVPixelBufferGetWidth(v22) == v11
          && CVPixelBufferGetHeight(*(CVPixelBufferRef *)(a1 + 440)) == v14
          && CVPixelBufferGetPixelFormatType(*(CVPixelBufferRef *)(a1 + 440)) == pixelFormatType
          || (CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 440)),
              *(_QWORD *)(a1 + 440) = 0,
              v23 = CVPixelBufferCreate(0, v11, v14, pixelFormatType, 0, (CVPixelBufferRef *)(a1 + 440)),
              !(_DWORD)v23))
        {
          v24 = FigDepthRotateBuffer(v6, *(__CVBuffer **)(a1 + 440), v15);
          if (!(_DWORD)v24)
          {
            v6 = *(__CVBuffer **)(a1 + 440);
            goto LABEL_30;
          }
          v25 = v24;
        }
        else
        {
          v25 = v23;
        }
LABEL_36:
        FigDebugAssert3();
        return v25;
      }
    }
    else
    {
      v18 = v12;
      v16 = Width == v12;
      v19 = v11;
      if (v16)
      {
        v19 = v11;
        v18 = v12;
        if (Height == v11)
          goto LABEL_23;
      }
    }
    v20 = *(__CVBuffer **)(a1 + 432);
    if (!v20
      || CVPixelBufferGetWidth(v20) != v18
      || CVPixelBufferGetHeight(*(CVPixelBufferRef *)(a1 + 432)) != v19
      || CVPixelBufferGetPixelFormatType(*(CVPixelBufferRef *)(a1 + 432)) != pixelFormatType)
    {
      CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 432));
      *(_QWORD *)(a1 + 432) = 0;
      v21 = CVPixelBufferCreate(0, v18, v19, pixelFormatType, 0, (CVPixelBufferRef *)(a1 + 432));
      if ((_DWORD)v21)
      {
        v25 = v21;
        goto LABEL_36;
      }
    }
    FigDepthScaleBuffer(v6, *(__CVBuffer **)(a1 + 432));
    v6 = *(__CVBuffer **)(a1 + 432);
    goto LABEL_22;
  }
LABEL_30:
  v25 = dcn_convertU16toFloatForImage_NEON(v6, a3, (uint64_t)a4, v13);
  if ((_DWORD)v25)
    goto LABEL_36;
  return v25;
}

- (uint64_t)_convertDepthDisparityToFloat_C:(__CVBuffer *)a3 dst:(uint64_t)a4 options:
{
  __CVBuffer *v6;
  size_t Width;
  size_t Height;
  size_t v10;
  size_t v11;
  unsigned int v12;
  size_t v13;
  size_t v14;
  BOOL v15;
  OSType PixelFormatType;
  __CVBuffer *v17;
  const void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *BaseAddress;
  char *v23;
  char *v24;
  char *v25;
  size_t v26;
  size_t BytesPerRow;
  OSType v28;
  uint64_t v29;
  int v30;
  _BOOL8 v31;
  uint64_t v32;
  float v33;
  float v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  size_t v45;
  unsigned int v46;
  float v47;
  _BOOL8 v48;
  __int16 v49;
  uint64_t v50;
  __CVBuffer *v51;
  CVPixelBufferLockFlags v52;
  __CVBuffer *v54;
  __CVBuffer *v55;
  uint64_t v56;
  size_t v57;
  uint64_t v58;
  size_t v59;
  size_t v60;
  int v61;
  uint64_t v62;

  if (!a1)
    return 0;
  v6 = pixelBuffer;
  Width = CVPixelBufferGetWidth(pixelBuffer);
  Height = CVPixelBufferGetHeight(v6);
  v10 = CVPixelBufferGetWidth(a3);
  v11 = CVPixelBufferGetHeight(a3);
  v12 = *(_DWORD *)a4 - 5;
  if (v12 >= 4)
    v13 = v10;
  else
    v13 = v11;
  v59 = v11;
  v60 = v10;
  if (v12 >= 4)
    v14 = v11;
  else
    v14 = v10;
  v15 = Width == v13 && Height == v14;
  if (!v15)
  {
    PixelFormatType = CVPixelBufferGetPixelFormatType(v6);
    v17 = *(__CVBuffer **)(a1 + 432);
    if (!v17
      || CVPixelBufferGetWidth(v17) != v13
      || CVPixelBufferGetHeight(*(CVPixelBufferRef *)(a1 + 432)) != v14
      || CVPixelBufferGetPixelFormatType(*(CVPixelBufferRef *)(a1 + 432)) != PixelFormatType)
    {
      v18 = *(const void **)(a1 + 432);
      if (v18)
      {
        CFRelease(v18);
        *(_QWORD *)(a1 + 432) = 0;
      }
      v19 = CVPixelBufferCreate(0, v13, v14, PixelFormatType, 0, (CVPixelBufferRef *)(a1 + 432));
      if ((_DWORD)v19)
      {
        v50 = v19;
        goto LABEL_63;
      }
    }
    FigDepthScaleBuffer(v6, *(__CVBuffer **)(a1 + 432));
    v6 = *(__CVBuffer **)(a1 + 432);
  }
  v20 = CVPixelBufferLockBaseAddress(v6, 1uLL);
  if ((_DWORD)v20)
  {
    v50 = v20;
LABEL_63:
    FigDebugAssert3();
    return v50;
  }
  v21 = CVPixelBufferLockBaseAddress(a3, 0);
  if ((_DWORD)v21)
  {
    v50 = v21;
    FigDebugAssert3();
    v51 = v6;
    v52 = 1;
  }
  else
  {
    BaseAddress = (char *)CVPixelBufferGetBaseAddress(v6);
    if (BaseAddress && (v23 = BaseAddress, (v24 = (char *)CVPixelBufferGetBaseAddress(a3)) != 0))
    {
      v25 = v24;
      v57 = CVPixelBufferGetWidth(v6);
      v26 = CVPixelBufferGetHeight(v6);
      BytesPerRow = CVPixelBufferGetBytesPerRow(v6);
      v61 = CVPixelBufferGetBytesPerRow(a3);
      v28 = CVPixelBufferGetPixelFormatType(a3);
      v29 = FigDepthBytesPerPixelForDepthFormat(v28);
      v30 = *(_DWORD *)(a4 + 12);
      v31 = FigDepthFormatIsDepth(v28) && *(_BYTE *)(a4 + 16) == 0;
      v32 = 0;
      v34 = *(float *)(a4 + 4);
      v33 = *(float *)(a4 + 8);
      v35 = *(_DWORD *)a4;
      LODWORD(v36) = BytesPerRow;
      switch(*(_DWORD *)a4)
      {
        case 1:
          v32 = 0;
          v37 = 0;
          LODWORD(v36) = BytesPerRow;
          LODWORD(BytesPerRow) = 2;
          goto LABEL_38;
        case 2:
          goto LABEL_34;
        case 3:
        case 4:
          v37 = 0;
          v36 = -(uint64_t)BytesPerRow;
          v32 = (v26 - 1) * BytesPerRow + 2 * v57 - 2;
          LODWORD(BytesPerRow) = -2;
          LODWORD(v38) = v29;
          v15 = v35 == 4;
          v35 = -2;
          if (!v15)
            goto LABEL_39;
          goto LABEL_34;
        case 5:
        case 6:
          v37 = 0;
          v32 = (v26 - 1) * BytesPerRow;
          LODWORD(v36) = 2;
          BytesPerRow = -(uint64_t)BytesPerRow;
          LODWORD(v38) = v29;
          v15 = v35 == 5;
          v35 = BytesPerRow;
          if (!v15)
            goto LABEL_39;
          goto LABEL_34;
        case 7:
        case 8:
          v32 = 2 * v57 - 2;
          LODWORD(v36) = -2;
          if (v35 == 7)
          {
            v35 = BytesPerRow;
LABEL_34:
            v38 = -v29;
            v37 = (int)v29 * (v60 - 1);
            LODWORD(BytesPerRow) = v35;
          }
          else
          {
            v37 = 0;
LABEL_38:
            LODWORD(v38) = v29;
          }
LABEL_39:
          if (v59)
          {
            v54 = a3;
            v55 = v6;
            v39 = 0;
            v40 = &v25[v37];
            v41 = &v23[v32];
            v42 = (int)v38;
            v56 = v61;
            v58 = (int)v36;
            do
            {
              v62 = v39;
              if (v60)
              {
                v43 = 0;
                v44 = 0;
                v45 = v60;
                do
                {
                  v46 = *(unsigned __int16 *)&v41[v43];
                  if (v46 == (unsigned __int16)v30)
                  {
                    if (v29 == 2)
                      *(_WORD *)&v40[v44] = 0x7FFF;
                    else
                      *(_DWORD *)&v40[v44] = 2143289344;
                  }
                  else
                  {
                    v47 = fmaxf(v34 + (float)((float)v46 * v33), 0.0);
                    if (v31 && v47 != 0.0)
                      v47 = 1.0 / v47;
                    if (v29 == 2)
                    {
                      v48 = v31;
                      v49 = FigFloat32ConvertToFloat16();
                      v31 = v48;
                      *(_WORD *)&v40[v44] = v49;
                    }
                    else
                    {
                      *(float *)&v40[v44] = v47;
                    }
                  }
                  v44 += v42;
                  v43 += (int)BytesPerRow;
                  --v45;
                }
                while (v45);
              }
              v41 += v58;
              v40 += v56;
              v39 = v62 + 1;
            }
            while (v62 + 1 != v59);
            v50 = 0;
            a3 = v54;
            v6 = v55;
          }
          else
          {
            v50 = 0;
          }
          break;
        default:
          LODWORD(v36) = 0;
          LODWORD(BytesPerRow) = 0;
          LODWORD(v38) = v29;
          v37 = 0;
          goto LABEL_39;
      }
    }
    else
    {
      v50 = FigSignalErrorAt();
    }
    CVPixelBufferUnlockBaseAddress(v6, 1uLL);
    v51 = a3;
    v52 = 0;
  }
  CVPixelBufferUnlockBaseAddress(v51, v52);
  return v50;
}

- (uint64_t)_resolveFilteringTypeWithStillFilteringRequested:(uint64_t)a1
{
  uint64_t v2;
  BOOL v3;

  if (!a1)
    return 0;
  if (*(_BYTE *)(a1 + 105))
  {
    if (*(_BYTE *)(a1 + 425))
      v2 = 6;
    else
      v2 = 0;
    if (*(_BYTE *)(a1 + 425))
      v3 = 1;
    else
      v3 = a2 == 0;
    if (!v3)
    {
      if (*(int *)(a1 + 520) <= 1)
        return 4;
      else
        return 5;
    }
  }
  else if (*(_BYTE *)(a1 + 104))
  {
    if (*(_BYTE *)(a1 + 106))
      return 3;
    else
      return 1;
  }
  else
  {
    return 2 * (*(_BYTE *)(a1 + 106) != 0);
  }
  return v2;
}

- (uint64_t)filterDepthPixelBuffer:(__CVBuffer *)a3 outputDepthPixelBuffer:(CMSampleBufferRef)sbuf yuvImageSampleBuffer:(uint64_t)a5 depthSampleBuffer:(unsigned int)a6 filteringType:
{
  uint64_t v6;
  CMSampleBufferRef v8;
  CVImageBufferRef ImageBuffer;
  CFTypeRef v12;
  int *v13;
  void *v14;
  void *AttachedInference;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t AttachedMedia;
  uint64_t v21;
  __CVBuffer *v22;
  uint64_t v23;
  int v24;
  int v25;
  int v26;
  __CVBuffer *v27;
  opaqueCMSampleBuffer *v28;
  uint64_t v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  uint64_t v36;
  _DWORD *v37;
  __CVBuffer *v38;
  int v39;
  int v40;
  unsigned int v41;
  void *v43;
  uint64_t v44;
  CVImageBufferRef v45;
  uint64_t v46;
  uint64_t v47;
  CVImageBufferRef v48;
  CVImageBufferRef v49;
  uint64_t v50;
  id LowResPersonInstanceMasksFromSampleBuffer;
  unsigned int v52;
  __CVBuffer *v54;

  if (!a1)
    return 0;
  v8 = sbuf;
  ImageBuffer = CMSampleBufferGetImageBuffer(sbuf);
  v12 = CMGetAttachment(v8, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  if (!a6)
    return 4294954516;
  v13 = &OBJC_IVAR___BWLivePhotoMovieAnalyticsPayload__maxVideoFrameDurationInMilliseconds;
  v52 = a6 - 4;
  if (a6 - 4 > 2)
  {
    v19 = 0;
  }
  else
  {
    v14 = (void *)v12;
    AttachedInference = (void *)BWInferenceGetAttachedInference(v8, 801, 0x1E4951058);
    if (objc_msgSend(AttachedInference, "count"))
      v16 = AttachedInference;
    else
      v16 = 0;
    objc_msgSend(*(id *)(a1 + 512), "setFaceLandmarksArray:", v16);
    v17 = *MEMORY[0x1E0D05E50];
    v18 = objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E0D05E50]);
    v19 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v18, v17, CMGetAttachment(v8, (CFStringRef)*MEMORY[0x1E0D08798], 0), *MEMORY[0x1E0D08798], 0);
    if ((a6 & 0xFFFFFFFE) == 4)
    {
      AttachedMedia = BWSampleBufferGetAttachedMedia(v8, 0x1E495AFF8);
      if (a6 == 5)
      {
        v21 = BWSampleBufferGetAttachedMedia(v8, 0x1E49511B8);
        LowResPersonInstanceMasksFromSampleBuffer = BWInferenceGetLowResPersonInstanceMasksFromSampleBuffer(v8);
        v50 = BWInferenceGetAttachedInference(v8, 104, 0x1E4951338);
      }
      else
      {
        v50 = 0;
        LowResPersonInstanceMasksFromSampleBuffer = 0;
        v21 = 0;
      }
      if (AttachedMedia | v21)
      {
        if (AttachedMedia)
          v45 = CMSampleBufferGetImageBuffer((CMSampleBufferRef)AttachedMedia);
        else
          v45 = 0;
        v49 = v45;
        if (v21)
        {
          v48 = CMSampleBufferGetImageBuffer((CMSampleBufferRef)v21);
          goto LABEL_12;
        }
      }
      else
      {
        if (!objc_msgSend(LowResPersonInstanceMasksFromSampleBuffer, "count"))
        {
          v47 = v6;
          LODWORD(v46) = 0;
          FigDebugAssert3();
          v23 = 4294954516;
          goto LABEL_50;
        }
        v49 = 0;
      }
      v48 = 0;
      goto LABEL_12;
    }
  }
  v48 = 0;
  v49 = 0;
  v50 = 0;
  LowResPersonInstanceMasksFromSampleBuffer = 0;
LABEL_12:
  v22 = *(__CVBuffer **)(a1 + 456);
  if (v22 && (v54 = *(__CVBuffer **)(a1 + 464)) != 0)
  {
    if (*MEMORY[0x1E0CA1FC0] == 1)
    {
      kdebug_trace();
      v22 = *(__CVBuffer **)(a1 + 456);
      v54 = *(__CVBuffer **)(a1 + 464);
    }
    v23 = FigDepthScaleBuffer(a2, v22);
    if (*MEMORY[0x1E0CA1FC0] == 1)
      kdebug_trace();
    if ((_DWORD)v23)
    {
      v47 = v6;
      LODWORD(v46) = v23;
      FigDebugAssert3();
LABEL_69:
      v41 = a6 - 4;
      goto LABEL_49;
    }
  }
  else
  {
    v22 = a2;
    v54 = a3;
  }
  if (a6 - 3 < 4 || a6 == 1)
  {
    v24 = objc_msgSend((id)CMGetAttachment(ImageBuffer, CFSTR("RotationDegrees"), 0), "intValue");
    v25 = objc_msgSend((id)CMGetAttachment(ImageBuffer, CFSTR("MirroredVertical"), 0), "BOOLValue");
    v26 = objc_msgSend((id)CMGetAttachment(ImageBuffer, CFSTR("MirroredHorizontal"), 0), "BOOLValue");
    v27 = ImageBuffer;
    v28 = v8;
    v29 = v19;
    v30 = v26;
    v31 = (int)FigCaptureNormalizeAngle(v24 - *(_DWORD *)(a1 + 384)) % 180;
    v32 = v31 ? 0 : v25;
    v33 = v31 == 90 ? v30 : 0;
    v19 = v29;
    v8 = v28;
    v34 = v32 | v33 ? v24 + 180 : v24;
    v35 = FigCaptureNormalizeAngle(*(_DWORD *)(a1 + 384) - v34);
    v36 = -[BWDepthConverterNode rotateAndScaleImagePixelBuffer:depthPixelBuffer:to:rotationAngle:flip:](a1, v27, v22, *(_QWORD *)(a1 + 472), v35);
    if ((_DWORD)v36)
    {
      v23 = v36;
      v47 = v6;
      LODWORD(v46) = v36;
      FigDebugAssert3();
      v13 = &OBJC_IVAR___BWLivePhotoMovieAnalyticsPayload__maxVideoFrameDurationInMilliseconds;
      goto LABEL_69;
    }
  }
  v37 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  v13 = &OBJC_IVAR___BWLivePhotoMovieAnalyticsPayload__maxVideoFrameDurationInMilliseconds;
  if (a6 < 4 || a6 == 6)
  {
    v38 = v54;
    v39 = objc_msgSend(*(id *)(a1 + 512), "processDepthBuffer:yuvBuffer:parametersDictionary:outputDisparityBuffer:", v22, *(_QWORD *)(a1 + 472), v19, v54);
  }
  else
  {
    v43 = *(void **)(a1 + 512);
    v44 = *(_QWORD *)(a1 + 472);
    if (a6 == 5)
    {
      v38 = v54;
      v39 = objc_msgSend(v43, "processDepthBuffer:yuvBuffer:personSegmentationMaskBuffer:instanceSegmentationMaskBufferArray:instanceSegmentationConfidences:parametersDictionary:outputDisparityBuffer:", v22, v44, v48, LowResPersonInstanceMasksFromSampleBuffer, v50, v19, v54);
    }
    else
    {
      v38 = v54;
      v39 = objc_msgSend(v43, "processDepthBuffer:yuvBuffer:rgbSegmentationMaskBuffer:parametersDictionary:outputDisparityBuffer:", v22, v44, v49, v19, v54);
    }
  }
  v40 = v39;
  v41 = v52;
  if (*v37 == 1)
    kdebug_trace();
  if (v40)
  {
    v23 = 4294954516;
  }
  else if (*(_QWORD *)(a1 + 456) && *(_QWORD *)(a1 + 464))
  {
    if (*v37 == 1)
      kdebug_trace();
    v23 = FigDepthScaleBuffer(v38, a3);
    if (*v37 == 1)
      kdebug_trace();
    if ((_DWORD)v23)
    {
      v47 = v6;
      LODWORD(v46) = v23;
      FigDebugAssert3();
    }
  }
  else
  {
    v23 = 0;
  }
LABEL_49:
  if (v41 <= 2)
  {
LABEL_50:
    objc_msgSend(*(id *)(a1 + v13[633]), "setFaceLandmarksArray:", 0, v46, v47);
    BWSampleBufferRemoveAttachedMedia(v8, 0x1E495AFF8);
    BWSampleBufferRemoveAttachedMedia(v8, 0x1E495B018);
    BWSampleBufferRemoveAttachedMedia(v8, 0x1E49511B8);
    BWSampleBufferRemoveAttachedMedia(v8, 0x1E4951298);
    BWSampleBufferRemoveAttachedMedia(v8, 0x1E49512B8);
    BWSampleBufferRemoveAttachedMedia(v8, 0x1E49512D8);
    BWSampleBufferRemoveAttachedMedia(v8, 0x1E49512F8);
  }
  return v23;
}

- (uint64_t)_generateAndAttachUnfilteredDepthToSampleBuffer:(__CVBuffer *)a3 depthOutputPixelBuffer:(opaqueCMSampleBuffer *)a4 depthOutputSampleBuffer:
{
  __CVBuffer *v8;
  __CVBuffer *v9;
  uint64_t v10;
  uint64_t CopyWithNewPixelBuffer;
  OpaqueVTPixelTransferSession *v12;
  CFTypeRef cf;

  if (!a1)
    return 0;
  cf = 0;
  v8 = (__CVBuffer *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "mediaPropertiesForAttachedMediaKey:", 0x1E495AE98), "livePixelBufferPool"), "newPixelBuffer");
  if (!v8)
    return 0;
  v9 = v8;
  if (*(_BYTE *)(a1 + 105) || *(_BYTE *)(a1 + 104) || *(_BYTE *)(a1 + 106))
  {
    if (*(_BYTE *)(a1 + 488))
    {
      v10 = FigDepthConvertBuffer(*(__CVBuffer **)(a1 + 448), v8);
      if ((_DWORD)v10)
      {
        CopyWithNewPixelBuffer = v10;
        goto LABEL_14;
      }
LABEL_12:
      CopyWithNewPixelBuffer = BWCMSampleBufferCreateCopyWithNewPixelBuffer(a4, v9, (CFTypeRef *)(a1 + 408), (CMSampleBufferRef *)&cf);
      if (!(_DWORD)CopyWithNewPixelBuffer)
        BWSampleBufferSetAttachedMedia(a2, 0x1E495AE98, (uint64_t)cf);
      goto LABEL_14;
    }
    v12 = *(OpaqueVTPixelTransferSession **)(a1 + 416);
    if (v12)
    {
      a3 = *(__CVBuffer **)(a1 + 448);
      goto LABEL_11;
    }
LABEL_18:
    CopyWithNewPixelBuffer = 4294954510;
    goto LABEL_14;
  }
  v12 = *(OpaqueVTPixelTransferSession **)(a1 + 416);
  if (!v12)
    goto LABEL_18;
LABEL_11:
  CopyWithNewPixelBuffer = VTPixelTransferSessionTransferImage(v12, a3, v9);
  if (!(_DWORD)CopyWithNewPixelBuffer)
    goto LABEL_12;
LABEL_14:
  CFRelease(v9);
  if (cf)
    CFRelease(cf);
  return CopyWithNewPixelBuffer;
}

- (uint64_t)rotateAndScaleImagePixelBuffer:(uint64_t)a1 depthPixelBuffer:(__CVBuffer *)a2 to:(CVPixelBufferRef)pixelBuffer rotationAngle:(uint64_t)a4 flip:(int)a5
{
  _DWORD *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  if (!a1)
    return 0;
  v9 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  if (!a2 || !pixelBuffer || !a4)
  {
    FigDebugAssert3();
    v11 = FigSignalErrorAt();
    goto LABEL_9;
  }
  CVPixelBufferGetWidth(pixelBuffer);
  CVPixelBufferGetHeight(pixelBuffer);
  HIDWORD(v10) = -1527099483 * FigCaptureNormalizeAngle(-a5) + 47721858;
  LODWORD(v10) = HIDWORD(v10);
  if ((v10 >> 1) <= 0x2D82D82 || (FigDebugAssert3(), v14 = FigSignalErrorAt(), !(_DWORD)v14))
  {
    CVPixelBufferGetPixelFormatType(a2);
    v11 = CMPhotoScaleAndRotateSessionTransformForMaxSideLength();
LABEL_9:
    v12 = v11;
    goto LABEL_10;
  }
  v12 = v14;
  FigDebugAssert3();
LABEL_10:
  if (*v9 == 1)
    kdebug_trace();
  return v12;
}

- (BOOL)streamingGDRFilteringEnabled
{
  return self->_streamingGDRFilteringEnabled;
}

- (BOOL)stillGDRFilteringSupportEnabled
{
  return self->_stillGDRFilteringSupportEnabled;
}

- (void)setStillGDRFilteringSupportEnabled:(BOOL)a3
{
  self->_stillGDRFilteringSupportEnabled = a3;
}

- (BOOL)streamingSMPFilteringEnabled
{
  return self->_streamingSMPFilteringEnabled;
}

- (int)baseRotationDegrees
{
  return self->_baseRotationDegrees;
}

- (int)rotationDegrees
{
  return self->_rotationDegrees;
}

- (BOOL)mirroringEnabled
{
  return self->_mirroringEnabled;
}

- (int)horizontalSensorBinningFactor
{
  return self->_horizontalSensorBinningFactor;
}

- (int)verticalSensorBinningFactor
{
  return self->_verticalSensorBinningFactor;
}

- (BOOL)providesUnfilteredDepthAsAttachedMedia
{
  return self->_providesUnfilteredDepthAsAttachedMedia;
}

- (BOOL)skipSmartStyleBuffer
{
  return self->_skipSmartStyleBuffer;
}

- (void)setSkipSmartStyleBuffer:(BOOL)a3
{
  self->_skipSmartStyleBuffer = a3;
}

@end
