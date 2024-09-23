@implementation BWPhotoEncoderNode

- (void)didSelectFormat:(id)a3 forInput:(id)a4 forAttachedMediaKey:(id)a5
{
  id v9;
  objc_super v10;

  if (objc_msgSend(a5, "isEqualToString:", CFSTR("PrimaryFormat")))
  {
    -[BWNodeOutput setFormat:](self->super._output, "setFormat:", a3);
  }
  else
  {
    v9 = -[NSDictionary objectForKeyedSubscript:](self->_attachedMediaConfigurationByAttachedMediaKey, "objectForKeyedSubscript:", a5);
    if (!v9 || objc_msgSend(v9, "propagatesDownstream"))
    {
      v10.receiver = self;
      v10.super_class = (Class)BWPhotoEncoderNode;
      -[BWNode didSelectFormat:forInput:forAttachedMediaKey:](&v10, sel_didSelectFormat_forInput_forAttachedMediaKey_, a3, a4, a5);
    }
  }
}

- (void)setAttachedMediaConfigurationByAttachedMediaKey:(id)a3
{
  NSDictionary *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  float v12;
  BWNodeInputMediaConfiguration *v13;
  BWVideoFormatRequirements *v14;
  BWNodeOutputMediaConfiguration *v15;
  int *v16;
  NSDictionary *obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[BWPhotoEncoderControllerConfiguration setAttachedMediaConfigurationByAttachedMediaKey:](self->_photoEncoderControllerConfiguration, "setAttachedMediaConfigurationByAttachedMediaKey:");
  if ((-[NSDictionary isEqual:](self->_attachedMediaConfigurationByAttachedMediaKey, "isEqual:", a3) & 1) == 0)
  {

    v5 = (NSDictionary *)objc_msgSend(a3, "copy");
    self->_attachedMediaConfigurationByAttachedMediaKey = v5;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    obj = v5;
    v6 = -[NSDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v19 != v8)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          v11 = -[NSDictionary objectForKeyedSubscript:](self->_attachedMediaConfigurationByAttachedMediaKey, "objectForKeyedSubscript:", v10);
          objc_msgSend(v11, "mainImageDownscalingFactor");
          if (v12 == 0.0 && !FigCaptureVideoDimensionsAreValid(objc_msgSend(v11, "dimensions")))
          {
            v15 = 0;
            v16 = &OBJC_IVAR___BWNode__input;
            goto LABEL_14;
          }
          v13 = objc_alloc_init(BWNodeInputMediaConfiguration);
          v14 = objc_alloc_init(BWVideoFormatRequirements);
          if (objc_msgSend(v10, "isEqualToString:", 0x1E495AF38))
          {
            -[BWVideoFormatRequirements setSupportedPixelFormats:](v14, "setSupportedPixelFormats:", &unk_1E4A00920);
            -[BWVideoFormatRequirements setBytesPerRowAlignment:](v14, "setBytesPerRowAlignment:", 64);
            -[BWVideoFormatRequirements setWidthAlignment:](v14, "setWidthAlignment:", 16);
            -[BWVideoFormatRequirements setHeightAlignment:](v14, "setHeightAlignment:", 16);
            -[BWVideoFormatRequirements setPlaneAlignment:](v14, "setPlaneAlignment:", 64);
            -[BWVideoFormatRequirements setMemoryPoolUseAllowed:](v14, "setMemoryPoolUseAllowed:", 0);
          }
          -[BWNodeInputMediaConfiguration setFormatRequirements:](v13, "setFormatRequirements:", v14);
          -[BWNodeInputMediaConfiguration setPassthroughMode:](v13, "setPassthroughMode:", objc_msgSend(v11, "propagatesDownstream"));
          -[BWNodeInput setMediaConfiguration:forAttachedMediaKey:](self->super._input, "setMediaConfiguration:forAttachedMediaKey:", v13, v10);
          if (objc_msgSend(v11, "propagatesDownstream"))
          {
            v15 = objc_alloc_init(BWNodeOutputMediaConfiguration);
            -[BWNodeOutputMediaConfiguration setFormatRequirements:](v15, "setFormatRequirements:", objc_alloc_init(BWVideoFormatRequirements));
            -[BWNodeOutputMediaConfiguration setPassthroughMode:](v15, "setPassthroughMode:", 1);
            v16 = &OBJC_IVAR___BWNode__output;
LABEL_14:
            objc_msgSend(*(id *)((char *)&self->super.super.isa + *v16), "setMediaConfiguration:forAttachedMediaKey:", v15, v10);
          }
          -[BWNodeOutput setMediaConfiguration:forAttachedMediaKey:](self->super._output, "setMediaConfiguration:forAttachedMediaKey:", 0, v10);
        }
        v7 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v7);
    }
  }
}

- (id)nodeType
{
  return CFSTR("Converter");
}

- (void)setUsesHighEncodingPriority:(BOOL)a3
{
  -[BWPhotoEncoderControllerConfiguration setUsesHighEncodingPriority:](self->_photoEncoderControllerConfiguration, "setUsesHighEncodingPriority:", a3);
}

- (void)setCameraSupportsFlash:(BOOL)a3
{
  -[BWPhotoEncoderControllerConfiguration setCameraSupportsFlash:](self->_photoEncoderControllerConfiguration, "setCameraSupportsFlash:", a3);
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

- (BWPhotoEncoderNode)initWithNodeConfiguration:(id)a3 sensorConfigurationsByPortType:(id)a4 semanticDevelopmentVersion:(int)a5 inferenceScheduler:(id)a6 alwaysAwaitInference:(BOOL)a7 portraitRenderQuality:(int)a8 deferredPhotoProcessorEnabled:(BOOL)a9
{
  uint64_t v9;
  _BOOL8 v10;
  uint64_t v12;
  BWPhotoEncoderNode *v15;
  BWPhotoEncoderController *v16;
  void *v17;
  BWNodeInput *v18;
  BWVideoFormatRequirements *v19;
  BWNodeOutput *v20;
  objc_super v22;

  v9 = *(_QWORD *)&a8;
  v10 = a7;
  v12 = *(_QWORD *)&a5;
  v22.receiver = self;
  v22.super_class = (Class)BWPhotoEncoderNode;
  v15 = -[BWNode init](&v22, sel_init);
  if (v15)
  {
    v15->_nodeConfiguration = (BWStillImageNodeConfiguration *)a3;
    v15->_sensorConfigurationsByPortType = (NSDictionary *)a4;
    v15->_photoEncoderControllerConfiguration = objc_alloc_init(BWPhotoEncoderControllerConfiguration);
    -[BWStillImageProcessorControllerConfiguration setStillImageProcessingMode:](v15->_photoEncoderControllerConfiguration, "setStillImageProcessingMode:", objc_msgSend(a3, "stillImageProcessingMode"));
    -[BWStillImageProcessorControllerConfiguration setSensorConfigurationsByPortType:](v15->_photoEncoderControllerConfiguration, "setSensorConfigurationsByPortType:", a4);
    -[BWPhotoEncoderControllerConfiguration setSemanticDevelopmentVersion:](v15->_photoEncoderControllerConfiguration, "setSemanticDevelopmentVersion:", v12);
    -[BWStillImageProcessorControllerConfiguration setDeferredCaptureSupportEnabled:](v15->_photoEncoderControllerConfiguration, "setDeferredCaptureSupportEnabled:", objc_msgSend(a3, "deferredCaptureSupportEnabled"));
    -[BWPhotoEncoderControllerConfiguration setDeferredPhotoProcessorEnabled:](v15->_photoEncoderControllerConfiguration, "setDeferredPhotoProcessorEnabled:", objc_msgSend(a3, "deferredPhotoProcessorEnabled"));
    -[BWPhotoEncoderControllerConfiguration setAlwaysAwaitInference:](v15->_photoEncoderControllerConfiguration, "setAlwaysAwaitInference:", v10);
    -[BWPhotoEncoderControllerConfiguration setPortraitRenderQuality:](v15->_photoEncoderControllerConfiguration, "setPortraitRenderQuality:", v9);
    -[BWStillImageProcessorControllerConfiguration setMetalCommandQueue:](v15->_photoEncoderControllerConfiguration, "setMetalCommandQueue:", objc_msgSend(a3, "metalCommandQueue"));
    -[BWStillImageProcessorControllerConfiguration setInferenceScheduler:](v15->_photoEncoderControllerConfiguration, "setInferenceScheduler:", a6);
    -[BWStillImageProcessorControllerConfiguration setFigThreadPriority:](v15->_photoEncoderControllerConfiguration, "setFigThreadPriority:", objc_msgSend(a3, "figThreadPriority"));
    -[BWPhotoEncoderControllerConfiguration setStereoPhotoOutputDimensions:](v15->_photoEncoderControllerConfiguration, "setStereoPhotoOutputDimensions:", objc_msgSend(a3, "stereoPhotoOutputDimensions"));
    v16 = -[BWPhotoEncoderController initWithConfiguration:]([BWPhotoEncoderController alloc], "initWithConfiguration:", v15->_photoEncoderControllerConfiguration);
    v15->_photoEncoderController = v16;
    -[BWPhotoEncoderController setPrimaryOwnerDelegate:](v16, "setPrimaryOwnerDelegate:", v15);
    if ((int)FigCapturePlatformIdentifier() < 8)
      v17 = &unk_1E4A00908;
    else
      v17 = FigCapturePixelFormatsByAddingCompressedVariants(&unk_1E4A00908, objc_msgSend(a3, "maxLossyCompressionLevel"));
    v18 = -[BWNodeInput initWithMediaType:node:]([BWNodeInput alloc], "initWithMediaType:node:", 1986618469, v15);
    v19 = objc_alloc_init(BWVideoFormatRequirements);
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v19, "setSupportedPixelFormats:", v17);
    -[BWNodeInput setFormatRequirements:](v18, "setFormatRequirements:", v19);
    -[BWNodeInput setPassthroughMode:](v18, "setPassthroughMode:", 1);
    -[BWNode addInput:](v15, "addInput:", v18);

    v20 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1986618469, v15);
    -[BWNodeOutput setFormatRequirements:](v20, "setFormatRequirements:", objc_alloc_init(BWVideoFormatRequirements));
    -[BWNodeOutput setPassthroughMode:](v20, "setPassthroughMode:", 1);
    -[BWNode addOutput:](v15, "addOutput:", v20);

  }
  return v15;
}

- (void)_releaseResources
{
  if (a1)
  {

    a1[12] = 0;
    a1[16] = 0;

    a1[15] = 0;
  }
}

- (void)dealloc
{
  objc_super v3;

  -[BWPhotoEncoderNode _releaseResources]((id *)&self->super.super.isa);

  v3.receiver = self;
  v3.super_class = (Class)BWPhotoEncoderNode;
  -[BWNode dealloc](&v3, sel_dealloc);
}

- (void)didReachEndOfDataForInput:(id)a3
{
  objc_super v5;

  -[BWPhotoEncoderController cancelProcessing](self->_photoEncoderController, "cancelProcessing");
  -[BWPhotoEncoderNode _releaseResources]((id *)&self->super.super.isa);
  v5.receiver = self;
  v5.super_class = (Class)BWPhotoEncoderNode;
  -[BWNode didReachEndOfDataForInput:](&v5, sel_didReachEndOfDataForInput_, a3);
}

- (id)nodeSubType
{
  return CFSTR("PhotoEncoder");
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  objc_super v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)BWPhotoEncoderNode;
  -[BWNode prepareForCurrentConfigurationToBecomeLive](&v13, sel_prepareForCurrentConfigurationToBecomeLive);
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", -[BWNodeInput videoFormat](self->super._input, "videoFormat"), CFSTR("PrimaryFormat"));
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = -[BWNodeInput mediaPropertiesByAttachedMediaKey](self->super._input, "mediaPropertiesByAttachedMediaKey", 0);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend(-[BWNodeInput mediaPropertiesByAttachedMediaKey](self->super._input, "mediaPropertiesByAttachedMediaKey"), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8)), "resolvedVideoFormat"), *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8));
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
    }
    while (v6);
  }
  -[BWPhotoEncoderController setResolvedVideoFormatsByAttachedMediaKey:](self->_photoEncoderController, "setResolvedVideoFormatsByAttachedMediaKey:", v3);
  -[BWPhotoEncoderController setClientExpectsCameraMountedInLandscapeOrientation:](self->_photoEncoderController, "setClientExpectsCameraMountedInLandscapeOrientation:", -[BWGraph clientExpectsCameraMountedInLandscapeOrientation](-[BWNode graph](self, "graph"), "clientExpectsCameraMountedInLandscapeOrientation"));
  -[BWPhotoEncoderController prepareForCurrentConfigurationToBecomeLive](self->_photoEncoderController, "prepareForCurrentConfigurationToBecomeLive");
}

- (id)photoEncoderController
{
  return self->_photoEncoderController;
}

- (void)setInputColorInfo:(id)a3
{
  -[BWPhotoEncoderControllerConfiguration setInputColorInfo:](self->_photoEncoderControllerConfiguration, "setInputColorInfo:", a3);
}

- (id)inputColorInfo
{
  return -[BWPhotoEncoderControllerConfiguration inputColorInfo](self->_photoEncoderControllerConfiguration, "inputColorInfo");
}

- (BOOL)cameraSupportsFlash
{
  return -[BWPhotoEncoderControllerConfiguration cameraSupportsFlash](self->_photoEncoderControllerConfiguration, "cameraSupportsFlash");
}

- (BOOL)usesHighEncodingPriority
{
  return -[BWPhotoEncoderControllerConfiguration usesHighEncodingPriority](self->_photoEncoderControllerConfiguration, "usesHighEncodingPriority");
}

- (void)setZeroShutterLagEnabled:(BOOL)a3
{
  -[BWPhotoEncoderControllerConfiguration setZeroShutterLagEnabled:](self->_photoEncoderControllerConfiguration, "setZeroShutterLagEnabled:", a3);
}

- (BOOL)zeroShutterLagEnabled
{
  return -[BWPhotoEncoderControllerConfiguration zeroShutterLagEnabled](self->_photoEncoderControllerConfiguration, "zeroShutterLagEnabled");
}

- (id)attachedMediaConfigurationByAttachedMediaKey
{
  return self->_attachedMediaConfigurationByAttachedMediaKey;
}

- (void)setSmartStyleRenderingVersion:(int)a3
{
  -[BWPhotoEncoderControllerConfiguration setSmartStyleRenderingVersion:](self->_photoEncoderControllerConfiguration, "setSmartStyleRenderingVersion:", *(_QWORD *)&a3);
}

- (int)smartStyleRenderingVersion
{
  return -[BWPhotoEncoderControllerConfiguration smartStyleRenderingVersion](self->_photoEncoderControllerConfiguration, "smartStyleRenderingVersion");
}

- (void)setSmartStyleReversibilityEnabled:(BOOL)a3
{
  -[BWPhotoEncoderControllerConfiguration setSmartStyleReversibilityEnabled:](self->_photoEncoderControllerConfiguration, "setSmartStyleReversibilityEnabled:", a3);
}

- (BOOL)smartStyleReversibilityEnabled
{
  return -[BWPhotoEncoderControllerConfiguration smartStyleReversibilityEnabled](self->_photoEncoderControllerConfiguration, "smartStyleReversibilityEnabled");
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  void *v6;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSString *v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v6 = 0;
LABEL_13:
    v11 = +[BWNodeError newError:sourceNode:stillImageSettings:metadata:](BWNodeError, "newError:sourceNode:stillImageSettings:metadata:", 4294954516, self, v6, CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0));
    -[BWNodeOutput emitNodeError:](self->super._output, "emitNodeError:", v11);

    return;
  }
  v6 = (void *)CMGetAttachment(a3, CFSTR("StillSettings"), 0);
  if (!v6)
    goto LABEL_13;
  if (dword_1ECFE9850)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }

  self->_lastProcessedCaptureIdentifier = (NSString *)(id)objc_msgSend((id)objc_msgSend(v6, "requestedSettings"), "captureRequestIdentifier");
  v8 = -[BWPhotoEncoderController currentInputsCaptureRequestIdentifier](self->_photoEncoderController, "currentInputsCaptureRequestIdentifier");
  if (v8
    && !-[NSString isEqualToString:](v8, "isEqualToString:", objc_msgSend((id)objc_msgSend(v6, "requestedSettings"), "captureRequestIdentifier")))
  {
    if (dword_1ECFE9850)
    {
      v9 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    -[BWPhotoEncoderController cancelProcessing](self->_photoEncoderController, "cancelProcessing", v12, v13);
  }
  v10 = (BWStillImageProcessingFlagsForSampleBuffer(a3) >> 3) & 1;
  if (!-[BWPhotoEncoderController inputForStillImageSettings:portType:portraitAdjustedImage:optionalSampleBuffer:forEarlyEncoding:](self->_photoEncoderController, "inputForStillImageSettings:portType:portraitAdjustedImage:optionalSampleBuffer:forEarlyEncoding:", v6, BWSampleBufferGetPortType(a3), v10, a3, 0))goto LABEL_13;
}

- (void)handleNodeError:(id)a3 forInput:(id)a4
{
  if (-[NSString isEqualToString:](-[BWPhotoEncoderController currentInputsCaptureRequestIdentifier](self->_photoEncoderController, "currentInputsCaptureRequestIdentifier", a3, a4), "isEqualToString:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "stillImageSettings"), "requestedSettings"), "captureRequestIdentifier")))
  {
    -[BWPhotoEncoderController cancelProcessing](self->_photoEncoderController, "cancelProcessing");
  }
  -[BWNodeOutput emitNodeError:](self->super._output, "emitNodeError:", a3);
}

- (uint64_t)_mainImageDownscalingFactorForAttachedMediaKey:(void *)a3 attachedMediaMetadata:
{
  void *v4;
  float v5;

  if (result)
  {
    v4 = (void *)objc_msgSend(*(id *)(result + 112), "objectForKeyedSubscript:", a2);
    result = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D05FB8]), "floatValue");
    if (v5 == 0.0)
      return objc_msgSend(v4, "mainImageDownscalingFactor");
  }
  return result;
}

- (uint64_t)_removeNonPropagatedAttachedMediaFromSampleBuffer:(uint64_t)result
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  const __CFString *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const void *AttachedMedia;
  void *v12;
  float v13;
  float v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = result;
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v4 = *(void **)(result + 112);
    result = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (result)
    {
      v5 = result;
      v6 = *(_QWORD *)v16;
      v7 = (const __CFString *)*MEMORY[0x1E0D05CB0];
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v16 != v6)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v8);
          v10 = (void *)objc_msgSend(*(id *)(v3 + 112), "objectForKeyedSubscript:", v9);
          AttachedMedia = (const void *)BWSampleBufferGetAttachedMedia(a2, v9);
          v12 = (void *)CMGetAttachment(AttachedMedia, v7, 0);
          -[BWPhotoEncoderNode _mainImageDownscalingFactorForAttachedMediaKey:attachedMediaMetadata:](v3, v9, v12);
          v14 = v13;
          if ((objc_msgSend(v10, "propagatesDownstream") & 1) == 0
            && (v14 != 0.0 || FigCaptureVideoDimensionsAreValid(objc_msgSend(v10, "dimensions"))))
          {
            BWSampleBufferRemoveAttachedMedia(a2, v9);
          }
          ++v8;
        }
        while (v5 != v8);
        result = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        v5 = result;
      }
      while (result);
    }
  }
  return result;
}

- (void)handleStillImagePrewarmWithSettings:(id)a3 forInput:(id)a4
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  objc_super v8;
  os_log_type_t type;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (-[NSString isEqualToString:](self->_lastProcessedCaptureIdentifier, "isEqualToString:", objc_msgSend((id)objc_msgSend(a3, "requestedSettings"), "captureRequestIdentifier")))
  {
    goto LABEL_6;
  }
  if (!-[NSString isEqualToString:](-[BWPhotoEncoderController currentInputsCaptureRequestIdentifier](self->_photoEncoderController, "currentInputsCaptureRequestIdentifier"), "isEqualToString:", objc_msgSend((id)objc_msgSend(a3, "requestedSettings"), "captureRequestIdentifier")))
  {
    if (!-[BWPhotoEncoderController currentInputsCaptureRequestIdentifier](self->_photoEncoderController, "currentInputsCaptureRequestIdentifier"))
    {
      -[BWPhotoEncoderController inputForStillImageSettings:portType:portraitAdjustedImage:optionalSampleBuffer:forEarlyEncoding:](self->_photoEncoderController, "inputForStillImageSettings:portType:portraitAdjustedImage:optionalSampleBuffer:forEarlyEncoding:", a3, objc_msgSend((id)objc_msgSend(a3, "captureSettings"), "masterPortType"), 0, 0, 0);
      goto LABEL_5;
    }
LABEL_6:
    v10 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
LABEL_5:
  v8.receiver = self;
  v8.super_class = (Class)BWPhotoEncoderNode;
  -[BWNode handleStillImagePrewarmWithSettings:forInput:](&v8, sel_handleStillImagePrewarmWithSettings_forInput_, a3, a4);
}

- (uint64_t)_isOriginalPhotoAndExpectingAdjustedPhoto:(void *)a3 stillImageSettings:
{
  uint64_t result;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  result = 0;
  v14 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if ((a2 & 8) == 0)
    {
      v11 = 0u;
      v12 = 0u;
      v9 = 0u;
      v10 = 0u;
      v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "processingSettings", 0), "photoManifest"), "photoDescriptors");
      result = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (result)
      {
        v6 = result;
        v7 = *(_QWORD *)v10;
        while (2)
        {
          for (i = 0; i != v6; ++i)
          {
            if (*(_QWORD *)v10 != v7)
              objc_enumerationMutation(v5);
            if ((objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "processingFlags") & 8) != 0)
              return 1;
          }
          v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
          result = 0;
          if (v6)
            continue;
          break;
        }
      }
    }
  }
  return result;
}

- (uint64_t)_addEligibleAuxImagesforExpectedAdjustedPhotoWithSbuf:(int)a3 processingFlags:(uint64_t)a4 stillImageSettings:(void *)a5 encoderControllerInput:
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const __CFString *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t AttachedMedia;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  _QWORD v21[8];

  v21[6] = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v21[0] = 0x1E495AF38;
    v21[1] = CFSTR("PersonSemanticsHair");
    v21[2] = CFSTR("PersonSemanticsSkin");
    v21[3] = CFSTR("PersonSemanticsTeeth");
    v21[4] = CFSTR("PersonSemanticsGlasses");
    v21[5] = 0x1E495B0B8;
    v8 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 6);
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    result = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (result)
    {
      v9 = result;
      v10 = a3 | 8u;
      v11 = *(_QWORD *)v17;
      v12 = (const __CFString *)*MEMORY[0x1E0D05CB0];
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          v14 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v13);
          AttachedMedia = BWSampleBufferGetAttachedMedia(a2, v14);
          objc_msgSend(a5, "addAuxSbuf:attachedMediakey:primaryImageMetadata:processingFlags:", AttachedMedia, v14, CMGetAttachment(a2, v12, 0), v10);
          ++v13;
        }
        while (v9 != v13);
        result = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        v9 = result;
      }
      while (result);
    }
  }
  return result;
}

- (__CVBuffer)processorController:(id)a3 newOutputPixelBufferForProcessorInput:(id)a4 type:(unint64_t)a5 dimensions:(id)a6
{
  int v10;
  OSType v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const __CFDictionary *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  CVPixelBufferRef pixelBufferOut;
  _QWORD v30[3];
  _QWORD v31[3];
  _QWORD v32[3];
  _QWORD v33[3];
  _QWORD v34[7];
  _QWORD v35[10];

  v35[7] = *MEMORY[0x1E0C80C00];
  pixelBufferOut = 0;
  mach_absolute_time();
  if (a5 == 49)
  {
    v22 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", objc_msgSend(a4, "decompressStyledBufferAttributes"));
    v30[0] = *MEMORY[0x1E0CBBEE8];
    v23 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[BWMemoryPool poolIdentifier](-[BWNodeOutput memoryPool](self->super._output, "memoryPool"), "poolIdentifier"));
    v24 = *MEMORY[0x1E0CBBF10];
    v31[0] = v23;
    v31[1] = &unk_1E49F9AE0;
    v25 = *MEMORY[0x1E0CBC050];
    v30[1] = v24;
    v30[2] = v25;
    v31[2] = MEMORY[0x1E0C9AAB0];
    v26 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 3);
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v26, *MEMORY[0x1E0CA8FF0]);
    if (CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a6.var0, *(uint64_t *)&a6 >> 32, 0x34323066u, (CFDictionaryRef)v22, &pixelBufferOut))
    {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (a5 != 48)
  {
LABEL_6:
    mach_absolute_time();
    FigHostTimeToNanoseconds();
    goto LABEL_7;
  }
  v10 = BWPhotoEncoderResolveEncodingSchemeForRequestedSettings((void *)objc_msgSend((id)objc_msgSend(a4, "stillImageSettings"), "requestedSettings"));
  v11 = BWPhotoEncoderDeltaMapPixelFormat((void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "stillImageSettings"), "requestedSettings"), "smartStyle"), v10);
  v34[0] = *MEMORY[0x1E0CA90E0];
  v35[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a6);
  v34[1] = *MEMORY[0x1E0CA8FD8];
  v12 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", HIDWORD(*(unint64_t *)&a6));
  v13 = *MEMORY[0x1E0CA8F68];
  v35[1] = v12;
  v35[2] = &unk_1E49F9AC8;
  v14 = *MEMORY[0x1E0CA9048];
  v34[2] = v13;
  v34[3] = v14;
  v15 = *MEMORY[0x1E0CA9010];
  v16 = MEMORY[0x1E0C9AAB0];
  v35[3] = &unk_1E49F9AC8;
  v35[4] = MEMORY[0x1E0C9AAB0];
  v17 = *MEMORY[0x1E0CA8FE8];
  v34[4] = v15;
  v34[5] = v17;
  v35[5] = MEMORY[0x1E0C9AAB0];
  v34[6] = *MEMORY[0x1E0CA8FF0];
  v32[0] = *MEMORY[0x1E0CBBEE8];
  v18 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[BWMemoryPool poolIdentifier](-[BWNodeOutput memoryPool](self->super._output, "memoryPool"), "poolIdentifier"));
  v19 = *MEMORY[0x1E0CBBF10];
  v33[0] = v18;
  v33[1] = &unk_1E49F9AE0;
  v20 = *MEMORY[0x1E0CBC050];
  v32[1] = v19;
  v32[2] = v20;
  v33[2] = v16;
  v35[6] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 3);
  v21 = (const __CFDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 7);
  if (!CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a6.var0, *(uint64_t *)&a6 >> 32, v11, v21, &pixelBufferOut))
  {
    CVBufferSetAttachment(pixelBufferOut, (CFStringRef)*MEMORY[0x1E0CA8EE8], (CFTypeRef)*MEMORY[0x1E0CA8F10], kCVAttachmentMode_ShouldPropagate);
    CVBufferSetAttachment(pixelBufferOut, (CFStringRef)*MEMORY[0x1E0CA8D68], (CFTypeRef)*MEMORY[0x1E0CA8D98], kCVAttachmentMode_ShouldPropagate);
    CVBufferSetAttachment(pixelBufferOut, (CFStringRef)*MEMORY[0x1E0CA8E98], (CFTypeRef)*MEMORY[0x1E0CA8EB8], kCVAttachmentMode_ShouldPropagate);
    goto LABEL_6;
  }
LABEL_7:
  if (dword_1ECFE9850)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return pixelBufferOut;
}

- (__CVBuffer)processorController:(id)a3 newOutputPixelBufferForProcessorInput:(id)a4 type:(unint64_t)a5
{
  return 0;
}

- (void)processorController:(id)a3 didFinishProcessingSampleBuffer:(opaqueCMSampleBuffer *)a4 type:(unint64_t)a5 processorInput:(id)a6 err:(int)a7
{
  uint64_t v7;
  int v11;
  int v12;
  _BOOL4 IsPrimaryFrame;
  id v14;
  uint64_t v15;
  id v16;

  v7 = *(_QWORD *)&a7;
  v11 = BWStillImageProcessingFlagsForSampleBuffer(a4);
  v12 = objc_msgSend(a6, "receivedAllFramesInSingleContainer");
  IsPrimaryFrame = BWPhotoEncoderIsPrimaryFrame(v11);
  if (v12 && IsPrimaryFrame)
  {
    if ((_DWORD)v7)
    {
      v16 = +[BWNodeError newError:sourceNode:stillImageSettings:metadata:](BWNodeError, "newError:sourceNode:stillImageSettings:metadata:", v7, self, objc_msgSend(a6, "stillImageSettings"), CMGetAttachment(a4, (CFStringRef)*MEMORY[0x1E0D05CB0], 0));
      -[BWNodeOutput emitNodeError:](self->super._output, "emitNodeError:", v16);

    }
    else
    {
      if (-[BWStillImageNodeConfiguration deferredPhotoProcessorEnabled](self->_nodeConfiguration, "deferredPhotoProcessorEnabled"))
      {
        if (-[BWPhotoEncoderNode _isOriginalPhotoAndExpectingAdjustedPhoto:stillImageSettings:]((uint64_t)self, v11, (void *)objc_msgSend(a6, "stillImageSettings")))
        {
          v14 = -[BWPhotoEncoderController inputForStillImageSettings:portType:portraitAdjustedImage:optionalSampleBuffer:forEarlyEncoding:](self->_photoEncoderController, "inputForStillImageSettings:portType:portraitAdjustedImage:optionalSampleBuffer:forEarlyEncoding:", objc_msgSend(a6, "stillImageSettings"), objc_msgSend(a6, "portType"), 1, 0, 0);
          objc_msgSend(a6, "stillImageSettings");
          -[BWPhotoEncoderNode _addEligibleAuxImagesforExpectedAdjustedPhotoWithSbuf:processingFlags:stillImageSettings:encoderControllerInput:]((uint64_t)self, a4, v11, v15, v14);
        }
      }
      -[BWPhotoEncoderNode _removeNonPropagatedAttachedMediaFromSampleBuffer:]((uint64_t)self, a4);
      -[BWNodeOutput emitSampleBuffer:](self->super._output, "emitSampleBuffer:", a4);
    }
  }
}

@end
