@implementation BWPhotoEncoderController

+ (BOOL)usesCustomProcessingFlow
{
  return 0;
}

- (BWPhotoEncoderController)initWithConfiguration:(id)a3
{
  BWPhotoEncoderController *v4;
  BWPhotoEncoderControllerConfiguration *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t maxThreads;
  uint64_t v10;
  size_t v12;
  int v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)BWPhotoEncoderController;
  v4 = -[BWStillImageProcessorController initWithName:type:configuration:](&v14, sel_initWithName_type_configuration_, CFSTR("PhotoEncoder"), 19, a3);
  if (v4)
  {
    v5 = (BWPhotoEncoderControllerConfiguration *)a3;
    v4->_configuration = v5;
    -[BWStillImageProcessorControllerConfiguration figThreadPriority](v5, "figThreadPriority");
    v4->_previewGenerationQueue = (OS_dispatch_queue *)FigDispatchQueueCreateWithPriority();
    v4->_previewGenerationGroup = (OS_dispatch_group *)dispatch_group_create();
    v6 = FigCapturePlatformIdentifier();
    v7 = 12;
    if (v6 > 8)
      v7 = 10;
    v4->_dngBitDepth = v7;
    v13 = 1;
    v12 = 4;
    if (sysctlbyname("hw.logicalcpu", &v13, &v12, 0, 0))
    {
      v8 = 6;
      v13 = 6;
    }
    else
    {
      v8 = v13;
    }
    v4->_maxThreads = v8;
    if (-[BWPhotoEncoderControllerConfiguration deferredPhotoProcessorEnabled](v4->_configuration, "deferredPhotoProcessorEnabled"))
    {
      maxThreads = v4->_maxThreads;
      if ((unint64_t)maxThreads <= 1)
        v10 = 1;
      else
        v10 = (int)(maxThreads >> 1);
      v4->_maxThreads = v10;
    }
    v4->_heifForceEmbedThumb = 0;
    v4->_heifQualityOverride = NAN;
    v4->_heifUseTiling = 1;
    v4->_heifTileWidth = 0;
    v4->_heifTileHeight = 0;
    v4->_allowHEIFPrewarming = 1;
    v4->_addUnstyledImageToHEIF = 0;
    if (v4->_allowHEIFPrewarming)
      v4->_prewarmQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.coremedia.photoencoder.prewarm", 0);
    v4->_adaptiveQualityValueForHEIF = (NSDictionary *)(id)objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[FigCaptureCameraParameters photoEncoderParameters](+[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance"), "photoEncoderParameters"), "objectForKeyedSubscript:", CFSTR("HEIFParameters")), "objectForKeyedSubscript:", CFSTR("AdaptiveQualityValue"));
    v4->_inputsByCaptureIdentifier = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v4->_inputsByCaptureIdentifierQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.coremedia.photoencodercontroller.inputsbycaptureidentifierqueue", 0);
    -[BWStillImageProcessorControllerConfiguration figThreadPriority](v4->_configuration, "figThreadPriority");
    v4->_encodingQueue = (OS_dispatch_queue *)FigDispatchQueueCreateWithPriority();
    v4->_encodingGroup = (OS_dispatch_group *)dispatch_group_create();
  }
  return v4;
}

- (int)prepareForCurrentConfigurationToBecomeLive
{
  BWPhotosCurationInferenceConfiguration *v3;
  BWFaceprintInferenceConfiguration *v4;
  BWCMPhotoEncoderManager *v5;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  float v7;
  BWDNGEncoderManager *v8;
  NSObject *v9;
  NSObject *previewGenerationQueue;
  int result;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD block[5];
  os_log_type_t type;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (-[BWStillImageProcessorControllerConfiguration inferenceScheduler](self->_configuration, "inferenceScheduler"))
  {
    self->_inferenceEngine = -[BWInferenceEngine initWithScheduler:priority:]([BWInferenceEngine alloc], "initWithScheduler:priority:", -[BWStillImageProcessorControllerConfiguration inferenceScheduler](self->_configuration, "inferenceScheduler"), 14);
    self->_inferenceGroup = (OS_dispatch_group *)dispatch_group_create();
    v3 = -[BWPhotosCurationInferenceConfiguration initWithInferenceType:]([BWPhotosCurationInferenceConfiguration alloc], "initWithInferenceType:", 803);
    -[BWPhotosCurationInferenceConfiguration setSemanticDevelopmentVersion:](v3, "setSemanticDevelopmentVersion:", -[BWPhotoEncoderControllerConfiguration semanticDevelopmentVersion](self->_configuration, "semanticDevelopmentVersion"));
    -[BWVisionInferenceConfiguration setShouldPreventRequestForSampleBuffer:](v3, "setShouldPreventRequestForSampleBuffer:", &__block_literal_global_97);
    -[BWInferenceEngine addInferenceOfType:version:configuration:](self->_inferenceEngine, "addInferenceOfType:version:configuration:", 803, BWInferenceVersionMake(2u, 0, 0) & 0xFFFFFFFFFFFFLL, v3);
    if ((int)FigCapturePlatformIdentifier() >= 7)
    {
      v4 = -[BWInferenceConfiguration initWithInferenceType:]([BWFaceprintInferenceConfiguration alloc], "initWithInferenceType:", 161);
      -[BWFaceprintInferenceConfiguration setMaximumNumberOfFaces:](v4, "setMaximumNumberOfFaces:", 4);
      -[BWInferenceEngine addInferenceOfType:version:configuration:](self->_inferenceEngine, "addInferenceOfType:version:configuration:", 161, BWPhotoEncoderFacePrintInferenceVersion() & 0xFFFFFFFFFFFFLL, v4);
    }
  }
  if (!self->_cmPhotoEncoderManager)
  {
    v5 = -[BWCMPhotoEncoderManager initWithDeferredPhotoProcessorEnabled:]([BWCMPhotoEncoderManager alloc], "initWithDeferredPhotoProcessorEnabled:", -[BWPhotoEncoderControllerConfiguration deferredPhotoProcessorEnabled](self->_configuration, "deferredPhotoProcessorEnabled"));
    self->_cmPhotoEncoderManager = v5;
    if (!v5)
    {
      v18 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[BWPhotoEncoderControllerConfiguration attachedMediaConfigurationByAttachedMediaKey](self->_configuration, "attachedMediaConfigurationByAttachedMediaKey", v12, v14), "objectForKeyedSubscript:", 0x1E495B0F8), "mainImageDownscalingFactor");
  if (v7 != 0.0 && !self->_dngEncoderManager)
  {
    v8 = objc_alloc_init(BWDNGEncoderManager);
    self->_dngEncoderManager = v8;
    if (!v8)
    {
      v18 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      v9 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  if (!self->_jpegPixelConverter)
    self->_jpegPixelConverter = objc_alloc_init(FigCapturePixelConverter);
  if (objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_resolvedVideoFormatsByAttachedMediaKey, "objectForKeyedSubscript:", CFSTR("PrimaryFormat"), v13, v15), "pixelFormat") == 875704438)-[FigCapturePixelConverter updateOutputPixelFormat:dimensions:poolCapacity:colorSpaceProperties:alwaysUseHardwareForConversion:](self->_jpegPixelConverter, "updateOutputPixelFormat:dimensions:poolCapacity:colorSpaceProperties:alwaysUseHardwareForConversion:", 875704422, objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_resolvedVideoFormatsByAttachedMediaKey, "objectForKeyedSubscript:", CFSTR("PrimaryFormat")), "width") | ((unint64_t)objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_resolvedVideoFormatsByAttachedMediaKey,
                                                                      "objectForKeyedSubscript:",
                                                                      CFSTR("PrimaryFormat")),
                                                                    "height") << 32),
      1,
      1,
      1);
  if (!self->_thumbnailPixelConverter)
    self->_thumbnailPixelConverter = objc_alloc_init(FigCapturePixelConverter);
  if (!self->_clientThumbnailPixelConverter)
    self->_clientThumbnailPixelConverter = objc_alloc_init(FigCapturePixelConverter);
  if (!self->_previewPixelConverter)
    self->_previewPixelConverter = objc_alloc_init(FigCapturePixelConverter);
  if (self->_inferenceEngine)
  {
    previewGenerationQueue = self->_previewGenerationQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __70__BWPhotoEncoderController_prepareForCurrentConfigurationToBecomeLive__block_invoke_218;
    block[3] = &unk_1E491E720;
    block[4] = self;
    dispatch_async(previewGenerationQueue, block);
  }
  result = -[BWPhotoEncoderControllerConfiguration smartStyleReversibilityEnabled](self->_configuration, "smartStyleReversibilityEnabled");
  if (result)
  {
    if (-[BWPhotoEncoderController _postponeSelectResourceAllocations](self, "_postponeSelectResourceAllocations"))
      return 0;
    else
      return -[BWPhotoEncoderController _loadCreateAndSetupSmartStyleRenderingProcessor](self, "_loadCreateAndSetupSmartStyleRenderingProcessor");
  }
  return result;
}

BOOL __70__BWPhotoEncoderController_prepareForCurrentConfigurationToBecomeLive__block_invoke(uint64_t a1, uint64_t a2, const void *a3)
{
  void *v4;
  void *v5;
  _BOOL4 v6;

  getVN5kJNH3eYuyaLxNpZr5Z7ziClass();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v4 = (void *)CMGetAttachment(a3, CFSTR("BWStillImageCaptureSettings"), 0);
  v5 = (void *)CMGetAttachment(a3, CFSTR("StillImageSettings"), 0);
  objc_opt_class();
  v6 = (objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(v5, "semanticStyle") == 0;
  if (objc_msgSend(v4, "captureType") != 10
    && objc_msgSend(v4, "captureType") != 11
    && objc_msgSend(v4, "captureType") != 12)
  {
    v6 = 0;
  }
  return !v6;
}

uint64_t __70__BWPhotoEncoderController_prepareForCurrentConfigurationToBecomeLive__block_invoke_218(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "prewarmInferencesUsingLimitedMemory:", 0);
}

- (void)dealloc
{
  objc_super v3;

  -[BWPhotoEncoderController _releaseResources](self, "_releaseResources");

  self->_configuration = 0;
  self->_adaptiveQualityValueForHEIF = 0;

  self->_resolvedVideoFormatsByAttachedMediaKey = 0;
  v3.receiver = self;
  v3.super_class = (Class)BWPhotoEncoderController;
  -[BWStillImageProcessorController dealloc](&v3, sel_dealloc);
}

- (unint64_t)type
{
  return 19;
}

- (id)inputForStillImageSettings:(id)a3 portType:(id)a4 portraitAdjustedImage:(BOOL)a5 optionalSampleBuffer:(opaqueCMSampleBuffer *)a6 forEarlyEncoding:(BOOL)a7
{
  NSObject *inputsByCaptureIdentifierQueue;
  uint64_t v13;
  void *v14;
  _QWORD block[10];
  BOOL v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  void (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  void (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  uint64_t v33;

  v28 = 0;
  v29 = &v28;
  v30 = 0x3052000000;
  v31 = __Block_byref_object_copy__34;
  v32 = __Block_byref_object_dispose__34;
  v33 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3052000000;
  v25 = __Block_byref_object_copy__34;
  v26 = __Block_byref_object_dispose__34;
  v27 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  if (!a3)
    goto LABEL_11;
  if (!a7
    || !objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "requestedSettings"), "bravoConstituentImageDeliveryDeviceTypes"), "count")&& !FigCapturePixelFormatIsDemosaicedRaw(objc_msgSend((id)objc_msgSend(a3, "requestedSettings"), "rawOutputFormat")))
  {
    inputsByCaptureIdentifierQueue = self->_inputsByCaptureIdentifierQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __124__BWPhotoEncoderController_inputForStillImageSettings_portType_portraitAdjustedImage_optionalSampleBuffer_forEarlyEncoding___block_invoke;
    block[3] = &unk_1E4925A10;
    v17 = a5;
    block[4] = a3;
    block[5] = self;
    block[6] = a4;
    block[7] = &v28;
    block[8] = &v18;
    block[9] = &v22;
    dispatch_sync(inputsByCaptureIdentifierQueue, block);
    if (a6)
      objc_msgSend((id)v29[5], "addSampleBuffer:", a6);
    if (*((_BYTE *)v19 + 24))
    {
      if (-[BWStillImageProcessorController enqueueInputForProcessing:delegate:](self, "enqueueInputForProcessing:delegate:", v29[5], objc_loadWeak((id *)&self->_primaryOwnerDelegate))|| (v13 = v23[5]) != 0&& -[BWStillImageProcessorController enqueueInputForProcessing:delegate:](self, "enqueueInputForProcessing:delegate:", v13, objc_loadWeak((id *)&self->_primaryOwnerDelegate)))
      {
LABEL_11:
        v29[5] = 0;
      }
    }
  }
  v14 = (void *)v29[5];
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);
  return v14;
}

uint64_t __124__BWPhotoEncoderController_inputForStillImageSettings_portType_portraitAdjustedImage_optionalSampleBuffer_forEarlyEncoding___block_invoke(uint64_t a1)
{
  void *v2;
  const __CFString *v3;
  uint64_t v4;
  void *v5;
  uint64_t result;
  char v7;
  uint64_t v8;

  v2 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "requestedSettings"), "captureRequestIdentifier");
  if (*(_BYTE *)(a1 + 80))
    v3 = CFSTR("-PortraitAdjusted");
  else
    v3 = CFSTR("-Original");
  v4 = objc_msgSend(v2, "stringByAppendingString:", v3);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 272), "objectForKeyedSubscript:", v4);
  v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  if (v5)
    return (uint64_t)v5;
  if (*(_BYTE *)(a1 + 80))
    v7 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "deferredPhotoProcessorEnabled");
  else
    v7 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = -[BWPhotoEncoderControllerInput initWithStillImageSettings:portType:requiresPhotosAdjustment:]([BWPhotoEncoderControllerInput alloc], *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), v7);
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 272), "setObject:forKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v4);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
  if (!*(_BYTE *)(a1 + 80))
  {
    result = BWCIFilterArrayContainsPortraitFilters((void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "requestedSettings"), "processedImageFilters"));
    if ((_DWORD)result)
    {
      result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "captureSettings"), "captureFlags");
      if ((result & 0x800) != 0)
      {
        v8 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "requestedSettings"), "captureRequestIdentifier"), "stringByAppendingString:", CFSTR("-PortraitAdjusted"));
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40) = -[BWPhotoEncoderControllerInput initWithStillImageSettings:portType:requiresPhotosAdjustment:]([BWPhotoEncoderControllerInput alloc], *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "deferredPhotoProcessorEnabled"));
        return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 272), "setObject:forKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), v8);
      }
    }
  }
  return result;
}

- (NSString)currentInputsCaptureRequestIdentifier
{
  return -[FigCaptureStillImageSettings captureRequestIdentifier](-[BWStillImageSettings requestedSettings](-[BWStillImageProcessorControllerInput stillImageSettings](-[BWStillImageProcessorControllerRequest input](-[BWStillImageProcessorController currentRequest](self, "currentRequest"), "input"), "stillImageSettings"), "requestedSettings"), "captureRequestIdentifier");
}

- (void)inputReceivedNewInputData:(id)a3
{
  if (-[BWStillImageProcessorControllerRequest input](-[BWStillImageProcessorController currentRequest](self, "currentRequest"), "input") == a3&& (objc_msgSend(a3, "receivedAllFramesInSingleContainer") & 1) == 0)
  {
    -[BWPhotoEncoderController _processSbuf](self, "_processSbuf");
  }
  -[BWStillImageProcessorController currentRequestChanged](self, "currentRequestChanged");
}

- (void)inputReceivedNewAuxMedia:(id)a3 auxSbuf:(opaqueCMSampleBuffer *)a4 attachedMediaKey:(id)a5 primaryImageMetadata:(id)a6 processingFlags:(unsigned int)a7
{
  NSObject *encodingGroup;
  NSObject *encodingQueue;
  _QWORD block[9];
  _QWORD v14[4];

  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v14[3] = a4;
  if (a4)
    CFRetain(a4);
  encodingGroup = self->_encodingGroup;
  encodingQueue = self->_encodingQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __115__BWPhotoEncoderController_inputReceivedNewAuxMedia_auxSbuf_attachedMediaKey_primaryImageMetadata_processingFlags___block_invoke;
  block[3] = &unk_1E4920590;
  block[4] = a5;
  block[5] = a3;
  block[6] = self;
  block[7] = a6;
  block[8] = v14;
  dispatch_group_async(encodingGroup, encodingQueue, block);
  _Block_object_dispose(v14, 8);
}

void __115__BWPhotoEncoderController_inputReceivedNewAuxMedia_auxSbuf_attachedMediaKey_primaryImageMetadata_processingFlags___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  void *v4;
  uint64_t v5;
  const void *v6;
  const void *v7;
  const void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Receiving aux media {%@}"), *(_QWORD *)(a1 + 32));
  v2 = *(_QWORD *)(a1 + 40);
  if (v2 == objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "currentRequest"), "input"))
  {
    if (dword_1ECFE9A10)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    objc_msgSend(*(id *)(a1 + 48), "_waitForPrewarmingToComplete", v9, v10);
    v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "currentRequest"), "input"), "stillImageSettings");
    v5 = BWPhotoEncoderResolveEncodingSchemeForRequestedSettings((void *)objc_msgSend(v4, "requestedSettings"));
    if (objc_msgSend(*(id *)(a1 + 40), "reservedPrimaryImageHandle") == -1)
      objc_msgSend(*(id *)(a1 + 48), "_prewarmAndReserveMainImageHandleForEncodingScheme:prewarmingMetadata:stillImageSettings:", v5, *(_QWORD *)(a1 + 56), v4);
    v6 = (const void *)objc_msgSend(*(id *)(a1 + 48), "_newAuxImageEncodingTriggerSbufForSettings:metadata:", v4, *(_QWORD *)(a1 + 56));
    if (v6)
    {
      v7 = v6;
      BWSampleBufferSetAttachedMedia(v6, *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24));
      objc_msgSend(*(id *)(a1 + 48), "_addOrPrewarmForAttachedMediaKey:encodingScheme:sampleBuffer:metadata:stillImageSettings:parentImageHandle:", *(_QWORD *)(a1 + 32), v5, v7, *(_QWORD *)(a1 + 56), v4, objc_msgSend(*(id *)(a1 + 40), "reservedPrimaryImageHandle"));
      CFRelease(v7);
    }
  }
  v8 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
  if (v8)
  {
    CFRelease(v8);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
  }
}

- (void)cancelProcessing
{
  objc_super v3;

  if (-[BWStillImageProcessorController currentRequest](self, "currentRequest"))
    -[BWPhotoEncoderController _flushCurrentRequest](self, "_flushCurrentRequest");
  -[BWPhotoEncoderController _flushInputsByCaptureIdentifier](self, "_flushInputsByCaptureIdentifier");
  v3.receiver = self;
  v3.super_class = (Class)BWPhotoEncoderController;
  -[BWStillImageProcessorController cancelProcessing](&v3, sel_cancelProcessing);
}

- (id)requestForInput:(id)a3 delegate:(id)a4 errOut:(int *)a5
{
  BWPhotoEncoderControllerRequest *v6;
  int v7;

  v6 = -[BWStillImageProcessorControllerRequest initWithInput:delegate:]([BWPhotoEncoderControllerRequest alloc], "initWithInput:delegate:", a3, a4);
  if (v6)
    v7 = 0;
  else
    v7 = -12786;
  if (a5)
    *a5 = v7;
  return v6;
}

- (int)prepare
{
  BWStillImageSettings *v3;
  FigCaptureStillImageSettings *v4;
  NSObject *prewarmQueue;
  _QWORD block[6];
  int v8;

  v3 = -[BWStillImageProcessorControllerInput stillImageSettings](-[BWStillImageProcessorControllerRequest input](-[BWStillImageProcessorController currentRequest](self, "currentRequest"), "input"), "stillImageSettings");
  v4 = -[BWStillImageSettings requestedSettings](v3, "requestedSettings");
  if (!-[BWStillImageProcessorControllerInput sbufToProcess](-[BWStillImageProcessorControllerRequest input](-[BWStillImageProcessorController currentRequest](self, "currentRequest"), "input"), "sbufToProcess")&& self->_allowHEIFPrewarming&& (BWPhotoEncoderResolveEncodingSchemeForRequestedSettings(v4) == 2|| BWPhotoEncoderResolveEncodingSchemeForCompressedPhotoWithLinDNG(v4) == 2)&& -[BWStillImageProcessorControllerInput reservedPrimaryImageHandle](-[BWStillImageProcessorControllerRequest input](-[BWStillImageProcessorController currentRequest](self, "currentRequest"), "input"), "reservedPrimaryImageHandle") == -1)
  {
    prewarmQueue = self->_prewarmQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __35__BWPhotoEncoderController_prepare__block_invoke;
    block[3] = &unk_1E491EEF8;
    v8 = 2;
    block[4] = self;
    block[5] = v3;
    dispatch_async(prewarmQueue, block);
  }
  return 0;
}

uint64_t __35__BWPhotoEncoderController_prepare__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  const void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "_encoderManagerForEncodingScheme:", *(unsigned int *)(a1 + 48));
  if (objc_msgSend(*(id *)(a1 + 32), "_postponeSelectResourceAllocations")
    && objc_msgSend(*(id *)(a1 + 32), "_ensureSetupForPostponedResources"))
  {
    result = objc_msgSend(v2, "isContainerOpen");
    if ((_DWORD)result)
      return objc_msgSend(v2, "closeContainer");
  }
  else
  {
    v3 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "currentRequest"), "input"), "primaryImageMetadataForPrewarming");
    objc_msgSend(*(id *)(a1 + 32), "_prewarmAndReserveMainImageHandleForEncodingScheme:prewarmingMetadata:stillImageSettings:", *(unsigned int *)(a1 + 48), v3, *(_QWORD *)(a1 + 40));
    v4 = objc_msgSend(*(id *)(a1 + 32), "_newAuxImageEncodingTriggerSbufForSettings:metadata:", *(_QWORD *)(a1 + 40), v3);
    if (v4)
    {
      v5 = (const void *)v4;
      v14 = 0u;
      v15 = 0u;
      v12 = 0u;
      v13 = 0u;
      v6 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "currentRequest", 0), "input"), "stashedAttacheMediaSampleBuffersByAttachedMediaKey");
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v13;
        do
        {
          v10 = 0;
          do
          {
            if (*(_QWORD *)v13 != v9)
              objc_enumerationMutation(v6);
            BWSampleBufferSetAttachedMedia(v5, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10), objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "currentRequest"), "input"), "stashedAttacheMediaSampleBuffersByAttachedMediaKey"), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10)));
            ++v10;
          }
          while (v8 != v10);
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        }
        while (v8);
      }
      objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "currentRequest"), "input"), "stashedAttacheMediaSampleBuffersByAttachedMediaKey"), "removeAllObjects");
      objc_msgSend(*(id *)(a1 + 32), "_addOrPrewarmAuxImagesIfNeededForEncodingScheme:sampleBuffer:metadata:stillImageSettings:processingFlags:parentImageHandle:", *(unsigned int *)(a1 + 48), v5, v3, *(_QWORD *)(a1 + 40), objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "currentRequest"), "input"), "processingFlagsForPrewarming"), objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "currentRequest"), "input"), "reservedPrimaryImageHandle"));
      CFRelease(v5);
    }
    result = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "currentRequest"), "input"), "reservedPrimaryImageHandle");
    if (result == -1)
      return objc_msgSend(v2, "closeContainer");
  }
  return result;
}

- (int)_processSbuf
{
  uint64_t v2;
  void *v3;
  void *v5;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v7;
  NSObject *v8;
  int v9;
  unint64_t v10;
  unsigned int v11;
  int v12;
  __CVBuffer *ImageBuffer;
  unint64_t v14;
  double x;
  double y;
  double width;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  _BOOL4 v23;
  int v24;
  uint64_t v25;
  CFTypeRef v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  BOOL v32;
  int v33;
  int v34;
  _BOOL4 v36;
  _BOOL4 v38;
  int v39;
  NSObject *v40;
  unsigned int v41;
  unsigned int v42;
  _BOOL4 v43;
  int v44;
  uint64_t v45;
  const void *v46;
  void *v47;
  uint64_t v48;
  _BOOL4 v50;
  NSObject *previewGenerationGroup;
  NSObject *previewGenerationQueue;
  NSObject *v53;
  NSObject *v54;
  void *v55;
  void *v56;
  NSObject *v57;
  int v58;
  unsigned int v59;
  unsigned int v60;
  __IOSurface *IOSurface;
  const __CFString *v62;
  uint64_t v63;
  const __CFString *v64;
  int v65;
  uint64_t v66;
  int v67;
  int v68;
  NSObject *v69;
  NSObject *v70;
  uint64_t v71;
  int v72;
  id v73;
  int v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  double v78;
  double v79;
  double v80;
  double v81;
  uint64_t v82;
  BWStillImageProcessorControllerInput *v83;
  __CVBuffer *v84;
  BWStillImageProcessorControllerInput *v85;
  void *v86;
  void *v87;
  char v88;
  uint64_t v89;
  BWStillImageProcessorControllerInput *v90;
  void *AttachedMedia;
  int v92;
  uint64_t v93;
  int v94;
  __IOSurface *v95;
  __IOSurface *v96;
  NSObject *v97;
  NSObject *v98;
  CFTypeRef v99;
  CGFloat v100;
  double v101;
  CGFloat v102;
  double v103;
  CGFloat v104;
  double v105;
  CGFloat v106;
  double v107;
  uint64_t v108;
  int v109;
  const void *v110;
  int v111;
  uint64_t v112;
  const void *v113;
  int v114;
  NSObject *v115;
  unsigned int v116;
  unsigned int v117;
  const void *v118;
  NSObject *inferenceGroup;
  dispatch_time_t v120;
  unsigned __int8 v121;
  unint64_t UpTimeNanoseconds;
  int v123;
  uint64_t v124;
  NSObject *v125;
  IOSurfaceRef v126;
  NSObject *v127;
  const void *v128;
  const __CFString *v129;
  CFTypeRef v130;
  void *v131;
  void *v132;
  const __CFString *v133;
  const __CFString *v134;
  void *v135;
  const __CFString *v136;
  const __CFString *v137;
  void *v138;
  const __CFString *v139;
  const __CFString *v140;
  __CVBuffer *v141;
  void *v142;
  const __CFString *v143;
  const __CFString *v144;
  const __CFString *v145;
  __CVBuffer *v146;
  IOSurfaceRef v147;
  void *v148;
  const __CFString *v149;
  void *v150;
  const __CFString *v151;
  const __CFString *v152;
  NSObject *v153;
  unsigned int v154;
  unsigned int v155;
  const char *v156;
  const void *v157;
  const void *v158;
  const void *v159;
  int v160;
  _BOOL4 v161;
  int v162;
  _BYTE *v164;
  uint64_t v165;
  uint64_t v166;
  const __CFString *v167;
  unsigned int v168;
  int v169;
  unsigned int v170;
  const __CFString *key;
  const __CFDictionary *value;
  unsigned int v173;
  uint64_t v174;
  _BOOL4 IsLinDNGEncodingScheme;
  int v176;
  unsigned int v177;
  _BOOL4 v178;
  uint64_t v179;
  unsigned int v180;
  _BOOL4 v181;
  _BOOL4 v182;
  int v183;
  _BOOL4 v184;
  uint64_t v185;
  unsigned int v186;
  unsigned int v187;
  _BOOL4 v188;
  _BOOL4 v189;
  unsigned int Height;
  CFTypeRef v191;
  void *v192;
  void *v193;
  void *v194;
  uint64_t v195;
  unsigned int cf;
  __IOSurface *cfa;
  id v198;
  __IOSurface *v199;
  _BOOL4 IsPrimaryFrame;
  unsigned int v201;
  __CVBuffer *pixelBuffer;
  CVPixelBufferRef pixelBuffera;
  unsigned int v204;
  BWStillImageProcessorControllerRequest *v205;
  void *target;
  _QWORD v207[8];
  int v208;
  _QWORD v209[7];
  _QWORD v210[13];
  _QWORD v211[5];
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  _QWORD v216[13];
  _QWORD v217[13];
  _QWORD block[16];
  unsigned int v219;
  unsigned int v220;
  BOOL v221;
  uint64_t v222;
  uint64_t v223;
  int v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  os_log_type_t type;
  unsigned int v230;
  _QWORD v231[4];
  _QWORD v232[4];
  uint64_t v233;
  uint64_t *v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t *v238;
  uint64_t v239;
  int v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t *v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t *v247;
  uint64_t v248;
  int v249;
  uint64_t v250;
  uint64_t *v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t *v255;
  uint64_t v256;
  int v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t v260;
  uint64_t v261;
  CFTypeRef v262;
  _QWORD v263[3];
  _QWORD v264[3];
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  _BYTE v269[12];
  __int16 v270;
  _BYTE v271[10];
  uint64_t v272;
  __int128 v273;
  __int16 v274;
  _BYTE v275[10];
  const __CFString *v276;
  _BYTE v277[10];
  _BYTE v278[10];
  __int16 v279;
  _BYTE v280[14];
  _QWORD v281[19];
  CGSize v282;
  CGRect v283;
  CGRect v284;
  CGRect v285;
  CGRect v286;
  CGRect v287;

  v281[16] = *MEMORY[0x1E0C80C00];
  v262 = 0;
  v261 = 0;
  v260 = 0;
  v259 = 0;
  v258 = 0;
  v254 = 0;
  v255 = &v254;
  v256 = 0x2020000000;
  v257 = 0;
  v250 = 0;
  v251 = &v250;
  v252 = 0x2020000000;
  v253 = 0;
  v246 = 0;
  v247 = &v246;
  v248 = 0x2020000000;
  v249 = 0;
  v242 = 0;
  v243 = &v242;
  v244 = 0x2020000000;
  v245 = 0;
  v241 = 0;
  v237 = 0;
  v238 = &v237;
  v239 = 0x2020000000;
  v240 = 0;
  v233 = 0;
  v234 = &v233;
  v235 = 0x2020000000;
  v236 = 0;
  v232[0] = 0;
  v232[1] = v232;
  v232[2] = 0x2020000000;
  v232[3] = 0;
  v231[0] = 0;
  v231[1] = v231;
  v231[2] = 0x2020000000;
  v231[3] = 0;
  target = (void *)-[BWStillImageProcessorControllerInput sbufToProcess](-[BWStillImageProcessorControllerRequest input](-[BWStillImageProcessorController currentRequest](self, "currentRequest"), "input"), "sbufToProcess");
  v205 = -[BWStillImageProcessorController currentRequest](self, "currentRequest");
  if (!target)
  {
    target = 0;
    goto LABEL_310;
  }
  v5 = (void *)CMGetAttachment(target, CFSTR("StillSettings"), 0);
  if (!v5)
  {
LABEL_310:
    IsPrimaryFrame = 0;
    v182 = 0;
    v195 = 0;
    cfa = 0;
    v12 = 0;
    v199 = 0;
    pixelBuffera = 0;
    v179 = 0;
LABEL_324:
    v45 = 4294954516;
    goto LABEL_225;
  }
  -[NSString isEqualToString:](-[FigCaptureStillImageSettings captureRequestIdentifier](-[BWStillImageSettings requestedSettings](-[BWStillImageProcessorControllerInput stillImageSettings](-[BWStillImageProcessorControllerRequest input](v205, "input"), "stillImageSettings"), "requestedSettings"), "captureRequestIdentifier"), "isEqualToString:", objc_msgSend((id)objc_msgSend(v5, "requestedSettings"), "captureRequestIdentifier"));
  if (dword_1ECFE9A10)
  {
    v230 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v3 = (void *)objc_msgSend(v5, "requestedSettings", v164, v165);
  v192 = (void *)objc_msgSend(v5, "captureSettings");
  v179 = objc_msgSend(v3, "settingsID");
  v204 = BWStillImageProcessingFlagsForSampleBuffer(target);
  IsPrimaryFrame = BWPhotoEncoderIsPrimaryFrame(v204);
  v7 = BWIsDeferredPhotoProxyImage(v204);
  v183 = BWPhotoEncoderDecompressStyledImageForDeltaMap((void *)objc_msgSend(v3, "smartStyle"), v7);
  if (-[BWStillImageProcessorControllerInput fatalErrorOccurred](-[BWStillImageProcessorControllerRequest input](v205, "input"), "fatalErrorOccurred"))
  {
    v230 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    LODWORD(v45) = 0;
    goto LABEL_303;
  }
  key = (const __CFString *)*MEMORY[0x1E0D05CB0];
  v198 = (id)objc_msgSend((id)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05CB0], 0), "copy");
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  v9 = objc_msgSend(v3, "outputWidth");
  LODWORD(v10) = objc_msgSend(v3, "outputHeight");
  if (((-[BWStillImageProcessorControllerInput isStereoPhotoCapture](-[BWStillImageProcessorControllerRequest input](v205, "input"), "isStereoPhotoCapture") ^ 1 | IsPrimaryFrame) & 1) == 0)
  {
    v9 = (int)-[BWPhotoEncoderControllerConfiguration stereoPhotoOutputDimensions](self->_configuration, "stereoPhotoOutputDimensions");
    v10 = (unint64_t)-[BWPhotoEncoderControllerConfiguration stereoPhotoOutputDimensions](self->_configuration, "stereoPhotoOutputDimensions") >> 32;
  }
  v282.width = (double)v9;
  v282.height = (double)(int)v10;
  value = CGSizeCreateDictionaryRepresentation(v282);
  v2 = BWPhotoEncoderResolveEncodingSchemeForRequestedSettings(v3);
  v11 = BWPhotoEncoderResolveEncodingSchemeForCompressedPhotoWithLinDNG(v3);
  IsLinDNGEncodingScheme = BWPhotoEncoderIsLinDNGEncodingScheme(v2);
  v228 = 0;
  v12 = objc_msgSend(v3, "previewEnabled") & IsPrimaryFrame;
  HIDWORD(v195) = BWPhotoEncoderShouldGenerateClientThumbnail(v3, v2, &v228) && IsPrimaryFrame;
  if (((v12 | HIDWORD(v195)) & 1) == 0 && !(_DWORD)v2)
  {
    v182 = 0;
    v195 = 0;
    v12 = 0;
LABEL_314:
    cfa = 0;
    v199 = 0;
    pixelBuffera = 0;
LABEL_224:
    v45 = 0;
    goto LABEL_225;
  }
  v227 = -1;
  v226 = 0;
  v225 = 0;
  v224 = 0;
  v223 = 0;
  v222 = 0;
  LODWORD(v195) = BWPhotoEncoderThumbnailEnabled(v2, v3, &v224, &v223, &v222);
  ImageBuffer = CMSampleBufferGetImageBuffer((CMSampleBufferRef)target);
  pixelBuffer = ImageBuffer;
  if (!ImageBuffer)
  {
    v165 = v174;
    LODWORD(v164) = 0;
    FigDebugAssert3();
    v182 = 0;
LABEL_323:
    cfa = 0;
    v199 = 0;
    pixelBuffera = 0;
    goto LABEL_324;
  }
  cf = CVPixelBufferGetWidth(ImageBuffer);
  Height = CVPixelBufferGetHeight(pixelBuffer);
  v14 = cf | ((unint64_t)Height << 32);
  -[BWPhotoEncoderController _cropRectForRequestedSettings:inputDimensions:metadata:processingFlags:](self, "_cropRectForRequestedSettings:inputDimensions:metadata:processingFlags:", v3, v14, v198, v204);
  x = v283.origin.x;
  y = v283.origin.y;
  width = v283.size.width;
  v18 = v283.size.height;
  v19 = *MEMORY[0x1E0C9D648];
  v20 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v21 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v22 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v286.origin.x = *(CGFloat *)MEMORY[0x1E0C9D648];
  v286.origin.y = v20;
  v286.size.width = v21;
  v286.size.height = v22;
  v23 = CGRectEqualToRect(v283, v286);
  v24 = (int)width;
  if (v23)
    v24 = cf;
  v187 = v24;
  if (v23)
    v25 = Height;
  else
    v25 = (int)v18;
  v185 = v25;
  v284.origin.x = x;
  v284.origin.y = y;
  v284.size.width = width;
  v284.size.height = v18;
  v287.origin.x = v19;
  v287.origin.y = v20;
  v287.size.width = v21;
  v287.size.height = v22;
  if (CGRectEqualToRect(v284, v287))
  {
    v26 = CVBufferCopyAttachment(pixelBuffer, (CFStringRef)*MEMORY[0x1E0CA8D50], 0);
    if (v26)
    {
      v27 = (void *)CFAutorelease(v26);
      v28 = v27;
      if (v27)
      {
        v29 = (void *)objc_msgSend(v27, "objectForKeyedSubscript:", *MEMORY[0x1E0CA8D60]);
        v30 = objc_msgSend(v28, "objectForKeyedSubscript:", *MEMORY[0x1E0CA8D40]);
        if (v29)
        {
          v31 = (void *)v30;
          if (v30)
          {
            v187 = objc_msgSend(v29, "intValue");
            v185 = objc_msgSend(v31, "intValue");
          }
        }
      }
    }
  }
  v32 = (_DWORD)v223 == v187 && HIDWORD(v223) == (_DWORD)v185;
  v33 = v32;
  v169 = v33;
  v34 = v195;
  if (!v32)
    v34 = 0;
  v176 = v34;
  v36 = (_DWORD)v2 == 1 || v11 == 1;
  v189 = v36;
  v38 = (_DWORD)v2 == 2 || v11 == 2;
  v178 = v38;
  v184 = BWPhotoEncoderIsLinDNGEncodingScheme(v2);
  v181 = -[BWPhotoEncoderController _smartStyleReversibilityDataNeededForSettings:adjustedPhoto:deferredPhotoProxy:](self, "_smartStyleReversibilityDataNeededForSettings:adjustedPhoto:deferredPhotoProxy:", v5, (v204 >> 3) & 1, v7);
  v173 = v204 & 8;
  v201 = v2;
  if (dword_1ECFE9A10)
  {
    v193 = v3;
    v39 = v12;
    v230 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    v40 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v41 = v230;
    if (os_log_type_enabled(v40, type))
      v42 = v41;
    else
      v42 = v41 & 0xFFFFFFFE;
    if (v42)
    {
      v43 = -[BWPhotoEncoderControllerConfiguration smartStyleReversibilityEnabled](self->_configuration, "smartStyleReversibilityEnabled");
      v44 = objc_msgSend((id)objc_msgSend(v5, "requestedSettings"), "smartStyleReversibilitySupported");
      *(_DWORD *)v269 = 136316418;
      *(_QWORD *)&v269[4] = "-[BWPhotoEncoderController _processSbuf]";
      v270 = 1026;
      *(_DWORD *)v271 = v43;
      *(_WORD *)&v271[4] = 1026;
      *(_DWORD *)&v271[6] = v44;
      LOWORD(v272) = 1026;
      *(_DWORD *)((char *)&v272 + 2) = v173 >> 3;
      HIWORD(v272) = 1026;
      LODWORD(v273) = v7;
      WORD2(v273) = 1026;
      *(_DWORD *)((char *)&v273 + 6) = v181;
      LODWORD(v165) = 42;
      v164 = v269;
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    v2 = v201;
    v12 = v39;
    v3 = v193;
  }
  if ((_DWORD)v2
    && -[BWPhotoEncoderControllerConfiguration inputColorInfo](self->_configuration, "inputColorInfo")
    && !objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_resolvedVideoFormatsByAttachedMediaKey, "objectForKeyedSubscript:", CFSTR("PrimaryFormat")), "colorSpaceProperties"))
  {
    CVBufferSetAttachments(pixelBuffer, (CFDictionaryRef)-[BWPhotoEncoderControllerConfiguration inputColorInfo](self->_configuration, "inputColorInfo"), kCVAttachmentMode_ShouldPropagate);
  }
  if ((v189 | (v184 && IsLinDNGEncodingScheme) & v176) == 1
    && CVPixelBufferGetPixelFormatType(pixelBuffer) == 875704438)
  {
    v46 = CVBufferCopyAttachments(pixelBuffer, kCVAttachmentMode_ShouldPropagate);
    v47 = target;
    if (v46)
      v46 = CFAutorelease(v46);
    if (objc_msgSend((id)CFDictionaryGetValue((CFDictionaryRef)v46, (const void *)*MEMORY[0x1E0CA8D68]), "isEqualToString:", *MEMORY[0x1E0CA8D98]))v48 = 3;
    else
      v48 = 1;
    if (-[FigCapturePixelConverter updateOutputPixelFormat:dimensions:poolCapacity:colorSpaceProperties:alwaysUseHardwareForConversion:](self->_jpegPixelConverter, "updateOutputPixelFormat:dimensions:poolCapacity:colorSpaceProperties:alwaysUseHardwareForConversion:", 875704422, v14, 1, v48, 1, v164, v165))
    {
      if (v12)
        goto LABEL_65;
    }
    else
    {
      -[FigCapturePixelConverter convertPixelBuffer:cropRect:allocateOutputFromBufferPool:outputPixelBuffer:](self->_jpegPixelConverter, "convertPixelBuffer:cropRect:allocateOutputFromBufferPool:outputPixelBuffer:", pixelBuffer, 1, &v262, v19, v20, v21, v22);
      v84 = pixelBuffer;
      if (v262)
        v84 = (__CVBuffer *)v262;
      pixelBuffer = v84;
      if (v12)
        goto LABEL_65;
    }
LABEL_76:
    v182 = 0;
    goto LABEL_77;
  }
  v47 = target;
  if (!v12)
    goto LABEL_76;
LABEL_65:
  v182 = 0;
  if (self->_inferenceEngine && (v204 & 0x201) == 0)
  {
    v50 = (v204 & 8) == 0 && (_DWORD)v2 != 1;
    v182 = v50;
  }
  previewGenerationGroup = self->_previewGenerationGroup;
  previewGenerationQueue = self->_previewGenerationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__BWPhotoEncoderController__processSbuf__block_invoke;
  block[3] = &unk_1E4925A38;
  block[8] = &v250;
  block[9] = v232;
  block[4] = self;
  block[5] = v3;
  *(double *)&block[12] = x;
  *(double *)&block[13] = y;
  *(double *)&block[14] = width;
  *(double *)&block[15] = v18;
  v221 = v182;
  block[7] = &v254;
  block[6] = v198;
  v219 = cf;
  v220 = Height;
  block[11] = v47;
  block[10] = v231;
  dispatch_group_async(previewGenerationGroup, previewGenerationQueue, block);
LABEL_77:
  if (HIDWORD(v195))
  {
    v53 = self->_previewGenerationGroup;
    v54 = self->_previewGenerationQueue;
    v217[0] = MEMORY[0x1E0C809B0];
    v217[1] = 3221225472;
    v217[2] = __40__BWPhotoEncoderController__processSbuf__block_invoke_2;
    v217[3] = &unk_1E491EFA8;
    v217[12] = v228;
    *(double *)&v217[8] = x;
    *(double *)&v217[9] = y;
    *(double *)&v217[10] = width;
    *(double *)&v217[11] = v18;
    v217[5] = &v237;
    v217[4] = self;
    v217[7] = pixelBuffer;
    v217[6] = &v233;
    dispatch_group_async(v53, v54, v217);
  }
  if (!(_DWORD)v2)
    goto LABEL_314;
  if (!-[BWPhotoEncoderController _encoderManagerForEncodingScheme:](self, "_encoderManagerForEncodingScheme:", v2))
  {
    v165 = v174;
    LODWORD(v164) = 0;
    FigDebugAssert3();
    cfa = 0;
    v199 = 0;
    pixelBuffera = 0;
    v45 = 4294954510;
    goto LABEL_225;
  }
  v177 = BWPhotoEncoderCodecTypeForEncodingScheme(v2);
  v180 = BWPhotoEncoderFileTypeForEncodingScheme(v2);
  if (BWPhotoEncoderIsLinDNGEncodingScheme(v2))
  {
    if (objc_msgSend(v3, "rawOutputFileType") != v180)
    {
LABEL_322:
      v165 = v174;
      LODWORD(v164) = 0;
      FigDebugAssert3();
      goto LABEL_323;
    }
    if (v11)
    {
      v177 = BWPhotoEncoderCodecTypeForEncodingScheme(v11);
      v170 = BWPhotoEncoderFileTypeForEncodingScheme(v11);
      if (objc_msgSend(v3, "outputFormat") != v177
        || objc_msgSend(v3, "outputFileType") != v170)
      {
        goto LABEL_322;
      }
    }
    else
    {
      v170 = v180;
    }
  }
  else
  {
    if (objc_msgSend(v3, "outputFormat") != v177
      || objc_msgSend(v3, "outputFileType") != v180)
    {
      goto LABEL_322;
    }
    v170 = v180;
    v180 = 0;
  }
  -[BWPhotoEncoderController _waitForPrewarmingToComplete](self, "_waitForPrewarmingToComplete", v164);
  dispatch_group_wait((dispatch_group_t)self->_encodingGroup, 0xFFFFFFFFFFFFFFFFLL);
  if (-[BWPhotoEncoderController _postponeSelectResourceAllocations](self, "_postponeSelectResourceAllocations"))
  {
    v45 = -[BWPhotoEncoderController _ensureSetupForPostponedResources](self, "_ensureSetupForPostponedResources");
    if ((_DWORD)v45)
    {
      cfa = 0;
      v199 = 0;
      pixelBuffera = 0;
      goto LABEL_225;
    }
  }
  if (-[BWStillImageProcessorControllerInput isStereoPhotoCapture](-[BWStillImageProcessorControllerRequest input](v205, "input"), "isStereoPhotoCapture")&& -[BWStillImageProcessorControllerInput reservedPrimaryImageHandle](-[BWStillImageProcessorControllerRequest input](v205, "input"), "reservedPrimaryImageHandle") == -1)
  {
    -[BWPhotoEncoderController _prewarmAndReserveMainImageHandleForEncodingScheme:prewarmingMetadata:stillImageSettings:](self, "_prewarmAndReserveMainImageHandleForEncodingScheme:prewarmingMetadata:stillImageSettings:", v2, v198, v5);
  }
  if (IsPrimaryFrame)
    v227 = -[BWStillImageProcessorControllerInput reservedPrimaryImageHandle](-[BWStillImageProcessorControllerRequest input](v205, "input"), "reservedPrimaryImageHandle");
  v194 = v5;
  v55 = target;
  if (dword_1ECFE9A10)
  {
    v168 = v7;
    v56 = v3;
    v230 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    v57 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v58 = v12;
    v59 = v230;
    if (os_log_type_enabled(v57, type))
      v60 = v59;
    else
      v60 = v59 & 0xFFFFFFFE;
    if (v60)
    {
      v167 = BWStringFromPixelBuffer(pixelBuffer);
      IOSurface = CVPixelBufferGetIOSurface(pixelBuffer);
      v62 = BWStringFromSurface(IOSurface);
      v63 = BWPhotoEncoderStringFromEncodingScheme(v201);
      v285.origin.x = x;
      v285.origin.y = y;
      v285.size.width = width;
      v285.size.height = v18;
      if (CGRectIsEmpty(v285))
        v64 = &stru_1E4928818;
      else
        v64 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" cropRect:%@"), BWStringFromCGRect(x, y, width, v18));
      v65 = v227;
      v66 = objc_msgSend(v56, "settingsID");
      *(_DWORD *)v269 = 136318211;
      *(_QWORD *)&v269[4] = "-[BWPhotoEncoderController _processSbuf]";
      v270 = 2114;
      *(_QWORD *)v271 = v167;
      *(_WORD *)&v271[8] = 2112;
      v272 = (uint64_t)v62;
      LOWORD(v273) = 2114;
      *(_QWORD *)((char *)&v273 + 2) = v63;
      WORD5(v273) = 1026;
      HIDWORD(v273) = v58;
      v274 = 1026;
      *(_DWORD *)v275 = v195;
      *(_WORD *)&v275[4] = 1026;
      *(_DWORD *)&v275[6] = HIDWORD(v195);
      LOWORD(v276) = 1026;
      *(_DWORD *)((char *)&v276 + 2) = v182;
      HIWORD(v276) = 2114;
      *(_QWORD *)v277 = v64;
      *(_WORD *)&v277[8] = 1026;
      *(_DWORD *)v278 = v187;
      *(_WORD *)&v278[4] = 1026;
      *(_DWORD *)&v278[6] = v185;
      v279 = 1025;
      *(_DWORD *)v280 = v65;
      *(_WORD *)&v280[4] = 2050;
      *(_QWORD *)&v280[6] = v66;
      LODWORD(v165) = 104;
      v164 = v269;
      _os_log_send_and_compose_impl();
      v55 = target;
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    v12 = v58;
    v3 = v56;
    v7 = v168;
  }
  if (((v183 | !v181) & 1) == 0)
  {
    v67 = -[BWPhotoEncoderController _updateSmartStyleDeltaMapForSampleBufferIfNeeded:decompressedStyledPixelBuffer:stillImageSettings:encodingScheme:processingFlags:](self, "_updateSmartStyleDeltaMapForSampleBufferIfNeeded:decompressedStyledPixelBuffer:stillImageSettings:encodingScheme:processingFlags:", v55, 0, v194, v201, v204);
    if (v67)
    {
      v165 = v174;
      LODWORD(v164) = v67;
      FigDebugAssert3();
    }
  }
  if (v189)
  {
    v230 = 0;
    v281[0] = 0;
    *(_QWORD *)v269 = 0;
    v68 = BWPhotoEncoderThumbnailEnabled(1, v3, &v230, v281, v269);
    if (v68)
    {
      v69 = self->_previewGenerationGroup;
      v70 = self->_previewGenerationQueue;
      v216[0] = MEMORY[0x1E0C809B0];
      v216[1] = 3221225472;
      v216[2] = __40__BWPhotoEncoderController__processSbuf__block_invoke_241;
      v216[3] = &unk_1E491EFA8;
      v216[12] = v281[0];
      *(double *)&v216[8] = x;
      *(double *)&v216[9] = y;
      *(double *)&v216[10] = width;
      *(double *)&v216[11] = v18;
      v216[5] = &v246;
      v216[4] = self;
      v216[7] = pixelBuffer;
      v216[6] = &v242;
      dispatch_group_async(v69, v70, v216);
    }
    LOBYTE(v166) = 0;
    v71 = -[BWPhotoEncoderController _encodePhotoForEncodingScheme:pixelBuffer:imageDimensions:processingFlags:metadata:thumbnailOptions:requestedStillImageCaptureSettings:resolvedStillImageCaptureSettings:cropRect:usePixelsOutsideCrop:usedContainerOptionsOut:usedEncodingOptionsOut:mainImageHandleInOut:](self, "_encodePhotoForEncodingScheme:pixelBuffer:imageDimensions:processingFlags:metadata:thumbnailOptions:requestedStillImageCaptureSettings:resolvedStillImageCaptureSettings:cropRect:usePixelsOutsideCrop:usedContainerOptionsOut:usedEncodingOptionsOut:mainImageHandleInOut:", 1, pixelBuffer, v187 | (unint64_t)(v185 << 32), v204, v198, 0, x, y, width, v18, v3, v192, v166, &v226, &v225,
            &v227);
    v45 = v71;
    if ((_DWORD)v71)
      v72 = 0;
    else
      v72 = v68;
    if (v72 == 1)
    {
      dispatch_group_wait((dispatch_group_t)self->_previewGenerationGroup, 0xFFFFFFFFFFFFFFFFLL);
      if (!*((_DWORD *)v247 + 6))
      {
        LODWORD(v164) = v230;
        v74 = -[BWPhotoEncoderController _addThumbnailForEncodingScheme:thumbnailPixelBuffer:metadata:requestedStillImageCaptureSettings:resolvedStillImageCaptureSettings:processingFlags:cropRect:codecType:maxPixelSize:parentImageHandle:](self, "_addThumbnailForEncodingScheme:thumbnailPixelBuffer:metadata:requestedStillImageCaptureSettings:resolvedStillImageCaptureSettings:processingFlags:cropRect:codecType:maxPixelSize:parentImageHandle:", 1, v243[3], v198, v3, v192, v204, 0.0, 0.0, (double)SLODWORD(v281[0]), (double)SHIDWORD(v281[0]), v164, *(_QWORD *)v269, v227);
        *((_DWORD *)v247 + 6) = v74;
      }
    }
    else if ((_DWORD)v71)
    {
      goto LABEL_128;
    }
  }
  else
  {
    if (!v178)
      goto LABEL_170;
    v230 = 0;
    v281[0] = 0;
    *(_QWORD *)v269 = 0;
    if (BWPhotoEncoderThumbnailEnabled(2, v3, &v230, v281, v269))
      v73 = -[BWPhotoEncoderController _thumbnailOptionsForImageWithMetadata:requestedStillImageCaptureSettings:resolvedStillImageCaptureSettings:processingFlags:cropRect:codecType:maxPixelSize:](self, "_thumbnailOptionsForImageWithMetadata:requestedStillImageCaptureSettings:resolvedStillImageCaptureSettings:processingFlags:cropRect:codecType:maxPixelSize:", v198, v3, v192, v204, v230, *(_QWORD *)v269, x, y, width, v18);
    else
      v73 = 0;
    LOBYTE(v166) = 0;
    v45 = -[BWPhotoEncoderController _encodePhotoForEncodingScheme:pixelBuffer:imageDimensions:processingFlags:metadata:thumbnailOptions:requestedStillImageCaptureSettings:resolvedStillImageCaptureSettings:cropRect:usePixelsOutsideCrop:usedContainerOptionsOut:usedEncodingOptionsOut:mainImageHandleInOut:](self, "_encodePhotoForEncodingScheme:pixelBuffer:imageDimensions:processingFlags:metadata:thumbnailOptions:requestedStillImageCaptureSettings:resolvedStillImageCaptureSettings:cropRect:usePixelsOutsideCrop:usedContainerOptionsOut:usedEncodingOptionsOut:mainImageHandleInOut:", 2, pixelBuffer, v187 | (unint64_t)(v185 << 32), v204, v198, v73, x, y, width, v18, v3, v192, v166, &v226, &v225,
            &v227);
    if ((_DWORD)v45)
      goto LABEL_128;
  }
  if (v178)
    v75 = 2;
  else
    v75 = 1;
  -[BWPhotoEncoderController _addOrPrewarmAuxImagesIfNeededForEncodingScheme:sampleBuffer:metadata:stillImageSettings:processingFlags:parentImageHandle:](self, "_addOrPrewarmAuxImagesIfNeededForEncodingScheme:sampleBuffer:metadata:stillImageSettings:processingFlags:parentImageHandle:", v75, v55, v198, v194, v204, v227);
  if (BWPhotoEncoderSupportsAddingAuxiliaryMetadataSeparately(v75))
    -[BWPhotoEncoderController _addGainMapMetadataForEncodingScheme:sampleBuffer:parentImageHandle:](self, "_addGainMapMetadataForEncodingScheme:sampleBuffer:parentImageHandle:", v75, v55, v227);
  -[BWPhotoEncoderController _updateStillImageProcessingFlagsWithDepthMetadataForSbuf:stillImageSettings:](self, "_updateStillImageProcessingFlagsWithDepthMetadataForSbuf:stillImageSettings:", v55, v194);
  v76 = (void *)CMGetAttachment(v55, key, 0);
  if (v181)
  {
    if (self->_addUnstyledImageToHEIF
      && (LOBYTE(v165) = 0,
          v77 = -[BWPhotoEncoderController _addUnstyledImageForEncodingScheme:sbuf:imageDimensions:processingFlags:metadata:requestedStillImageCaptureSettings:resolvedStillImageCaptureSettings:cropRect:usePixelsOutsideCrop:](self, "_addUnstyledImageForEncodingScheme:sbuf:imageDimensions:processingFlags:metadata:requestedStillImageCaptureSettings:resolvedStillImageCaptureSettings:cropRect:usePixelsOutsideCrop:", v75, v55, v187 | (unint64_t)(v185 << 32), v204, v198, v3, x, y, width, v18, v192, v165), v45 = v77, (_DWORD)v77)|| (objc_msgSend(v76, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D060F0]), v77 = -[BWPhotoEncoderController _addSmartStyleMetadataForEncodingScheme:sampleBuffer:requestedStillImageCaptureSettings:](
                  self,
                  "_addSmartStyleMetadataForEncodingScheme:sampleBuffer:requestedStillImageCaptureSettings:",
                  v75,
                  v55,
                  v3),
          v45 = v77,
          (_DWORD)v77))
    {
      v165 = v174;
      LODWORD(v164) = v77;
      FigDebugAssert3();
      cfa = 0;
      v199 = 0;
      pixelBuffera = 0;
      v2 = v201;
      goto LABEL_225;
    }
  }
  else if (-[BWPhotoEncoderController _finalImageExpectingSmartStyleReversibilityDataForDeferredPhotoProxy:settings:adjustedPhoto:](self, "_finalImageExpectingSmartStyleReversibilityDataForDeferredPhotoProxy:settings:adjustedPhoto:", v7, v194, v173 != 0))
  {
    objc_msgSend(v76, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D060B8]);
  }
  BWPhotoEncoderApplyCropRectOnSampleBufferMetadata(v55, x, y, width, v18);
  FigCaptureMetadataUtilitiesNormalizeCropRect(x, y, width, v18);
  BWUpdateLandmarksForStillImageCrop(v55, 801, v78, v79, v80, v81);
  CMSetAttachment(v55, CFSTR("EncodedImageSurfaceCGSize"), value, 1u);
  if (objc_msgSend(v3, "payloadType") != 1
    || (v82 = objc_msgSend(v192, "captureType"),
        v45 = -[BWPhotoEncoderController _addMetadataAttachmentsForEncodingScheme:sampleBuffer:requestedSettings:captureType:parentImageHandle:](self, "_addMetadataAttachmentsForEncodingScheme:sampleBuffer:requestedSettings:captureType:parentImageHandle:", v75, v55, v3, v82, v227), !(_DWORD)v45))
  {
    if (-[BWStillImageProcessorControllerInput isStereoPhotoCapture](-[BWStillImageProcessorControllerRequest input](v205, "input"), "isStereoPhotoCapture")&& -[BWStillImageProcessorControllerInput receivedAllFramesInSingleContainer](-[BWStillImageProcessorControllerRequest input](v205, "input"), "receivedAllFramesInSingleContainer"))
    {
      v83 = -[BWStillImageProcessorControllerRequest input](v205, "input");
      if (v83)
      {
        -[BWStillImageProcessorControllerInput stereoPhotoImageHandles](v83, "stereoPhotoImageHandles");
        if (v214 == -1)
          goto LABEL_167;
      }
      else
      {
        v214 = 0;
        v213 = 0;
        v215 = 0;
      }
      v85 = -[BWStillImageProcessorControllerRequest input](v205, "input");
      if (v85)
      {
        -[BWStillImageProcessorControllerInput stereoPhotoImageHandles](v85, "stereoPhotoImageHandles");
        if (v212 == -1)
          goto LABEL_167;
      }
      else
      {
        v211[4] = 0;
        v211[3] = 0;
        v212 = 0;
      }
      v86 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      objc_msgSend(v86, "setObject:forKeyedSubscript:", &unk_1E49FB3A0, *MEMORY[0x1E0D095E8]);
      v87 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v88 = objc_msgSend((id)objc_msgSend(v198, "objectForKeyedSubscript:", 0x1E495A198), "intValue");
      if ((v88 & 4) != 0)
      {
        v267 = *MEMORY[0x1E0CC60A0];
        v268 = *MEMORY[0x1E0CC6098];
        objc_msgSend(v87, "addObject:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v268, &v267, 1));
      }
      if ((v88 & 2) != 0)
      {
        v265 = *MEMORY[0x1E0CC60A0];
        v266 = *MEMORY[0x1E0CC6090];
        objc_msgSend(v87, "addObject:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v266, &v265, 1));
      }
      objc_msgSend(v86, "setObject:forKeyedSubscript:", v87, *MEMORY[0x1E0D095F0]);
      v89 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[BWStillImageProcessorControllerInput monoImageLocationType](-[BWStillImageProcessorControllerRequest input](-[BWStillImageProcessorController currentRequest](self, "currentRequest"), "input"), "monoImageLocationType"));
      objc_msgSend(v86, "setObject:forKeyedSubscript:", v89, *MEMORY[0x1E0CC60D8]);
      v90 = -[BWStillImageProcessorControllerRequest input](v205, "input");
      if (v90)
        -[BWStillImageProcessorControllerInput stereoPhotoImageHandles](v90, "stereoPhotoImageHandles");
      else
        memset(v211, 0, 24);
      -[BWPhotoEncoderController _tagStereoPairGroupForEncodingScheme:stereoPhotoImageHandles:groupMetadata:](self, "_tagStereoPairGroupForEncodingScheme:stereoPhotoImageHandles:groupMetadata:", v75, v211, v86);
    }
LABEL_167:
    if (-[BWStillImageProcessorControllerInput receivedAllFramesInSingleContainer](-[BWStillImageProcessorControllerRequest input](v205, "input"), "receivedAllFramesInSingleContainer"))
    {
      cfa = -[BWPhotoEncoderController _closeContainerAndCopySurfaceForEncodingScheme:](self, "_closeContainerAndCopySurfaceForEncodingScheme:", v75);
      if (cfa)
      {
        -[BWPhotoEncoderController _getAssetsSizeForEncodingScheme:containerSizeOut:thumbnailSizeOut:auxiliaryImagesSizeOut:](self, "_getAssetsSizeForEncodingScheme:containerSizeOut:thumbnailSizeOut:auxiliaryImagesSizeOut:", v75, &v261, 0, 0);
        goto LABEL_171;
      }
    }
LABEL_170:
    cfa = 0;
LABEL_171:
    if (!v184)
    {
      v95 = 0;
      v191 = 0;
      v96 = 0;
      v188 = 0;
      v186 = 0;
      goto LABEL_200;
    }
    AttachedMedia = (void *)BWSampleBufferGetAttachedMedia(v55, 0x1E495B0F8);
    if (!AttachedMedia)
    {
      v199 = 0;
      pixelBuffera = 0;
      v45 = 4294954516;
      goto LABEL_130;
    }
    if ((v195 ^ 1 | v169) == 1)
    {
      if (v176)
      {
        LOBYTE(v166) = 0;
        v92 = -[BWPhotoEncoderController _encodePhotoForEncodingScheme:pixelBuffer:imageDimensions:processingFlags:metadata:thumbnailOptions:requestedStillImageCaptureSettings:resolvedStillImageCaptureSettings:cropRect:usePixelsOutsideCrop:usedContainerOptionsOut:usedEncodingOptionsOut:mainImageHandleInOut:](self, "_encodePhotoForEncodingScheme:pixelBuffer:imageDimensions:processingFlags:metadata:thumbnailOptions:requestedStillImageCaptureSettings:resolvedStillImageCaptureSettings:cropRect:usePixelsOutsideCrop:usedContainerOptionsOut:usedEncodingOptionsOut:mainImageHandleInOut:", IsLinDNGEncodingScheme, pixelBuffer, v223, v204, v198, 0, x, y, width, v18, v3, v192, v166, 0, 0,
                &v227);
        *((_DWORD *)v247 + 6) = v92;
        if (v92
          || (BWPhotoEncoderApplyCropRectOnSampleBufferMetadata(v55, x, y, width, v18),
              CMSetAttachment(v55, CFSTR("EncodedImageSurfaceCGSize"), value, 1u),
              v93 = objc_msgSend(v192, "captureType"),
              v94 = -[BWPhotoEncoderController _addMetadataAttachmentsForEncodingScheme:sampleBuffer:requestedSettings:captureType:parentImageHandle:](self, "_addMetadataAttachmentsForEncodingScheme:sampleBuffer:requestedSettings:captureType:parentImageHandle:", IsLinDNGEncodingScheme, v55, v3, v93, v227), (*((_DWORD *)v247 + 6) = v94) != 0))
        {
          v95 = 0;
        }
        else
        {
          v95 = -[BWPhotoEncoderController _closeContainerAndCopySurfaceForEncodingScheme:](self, "_closeContainerAndCopySurfaceForEncodingScheme:", IsLinDNGEncodingScheme);
          if (v95)
            -[BWPhotoEncoderController _getAssetsSizeForEncodingScheme:containerSizeOut:thumbnailSizeOut:auxiliaryImagesSizeOut:](self, "_getAssetsSizeForEncodingScheme:containerSizeOut:thumbnailSizeOut:auxiliaryImagesSizeOut:", IsLinDNGEncodingScheme, &v241, 0, 0);
        }
        if (*((_DWORD *)v247 + 6))
          -[BWPhotoEncoderController _closeContainerForEncodingScheme:](self, "_closeContainerForEncodingScheme:", IsLinDNGEncodingScheme);
        goto LABEL_184;
      }
    }
    else
    {
      v97 = self->_previewGenerationGroup;
      v98 = self->_previewGenerationQueue;
      v210[0] = MEMORY[0x1E0C809B0];
      v210[1] = 3221225472;
      v210[2] = __40__BWPhotoEncoderController__processSbuf__block_invoke_247;
      v210[3] = &unk_1E491EFA8;
      v210[12] = v223;
      *(double *)&v210[8] = x;
      *(double *)&v210[9] = y;
      *(double *)&v210[10] = width;
      *(double *)&v210[11] = v18;
      v210[4] = self;
      v210[5] = &v246;
      v210[6] = &v242;
      v210[7] = pixelBuffer;
      dispatch_group_async(v97, v98, v210);
      if ((v176 & 1) != 0)
      {
LABEL_183:
        v95 = 0;
LABEL_184:
        -[BWPhotoEncoderController _propagateSampleBufferGainMapMetadata:toSampleBufferMetadata:](self, "_propagateSampleBufferGainMapMetadata:toSampleBufferMetadata:", v55, AttachedMedia, v164, v165);
        v99 = CMGetAttachment(AttachedMedia, key, 0);
        -[BWPhotoEncoderController _cropRectForRequestedSettings:inputDimensions:metadata:processingFlags:](self, "_cropRectForRequestedSettings:inputDimensions:metadata:processingFlags:", v3, BWPixelBufferDimensionsFromSampleBuffer((opaqueCMSampleBuffer *)AttachedMedia), v99, v204);
        v101 = v100;
        v103 = v102;
        v105 = v104;
        v107 = v106;
        BWPhotoEncoderApplyCropRectOnSampleBufferMetadata(AttachedMedia, v100, v102, v104, v106);
        CMSetAttachment(AttachedMedia, CFSTR("EncodedImageSurfaceCGSize"), value, 1u);
        v191 = CMGetAttachment(AttachedMedia, CFSTR("RawDNGDictionary"), 0);
        if (!v191)
        {
          v199 = v95;
          pixelBuffera = 0;
          v45 = 0;
          goto LABEL_130;
        }
        v188 = BWSampleBufferContainsDepthAttachedMedia(v55);
        v186 = BWSampleBufferContainsSemanticSegmentationMatteAttachedMediaSupportedByDemosaicedRaw(v55);
        HIDWORD(v164) = v204;
        LOBYTE(v164) = v186;
        v45 = -[BWPhotoEncoderController _encodeDNGForEncodingScheme:rawSampleBuffer:dngDictionary:requestedSettings:captureType:cropRect:dngContainsDepthData:dngContainsSemanticSegmentationMattes:processingFlags:](self, "_encodeDNGForEncodingScheme:rawSampleBuffer:dngDictionary:requestedSettings:captureType:cropRect:dngContainsDepthData:dngContainsSemanticSegmentationMattes:processingFlags:", v201, AttachedMedia, v191, v3, objc_msgSend(v192, "captureType"), v188, v101, v103, v105, v107, v164);
        if (!(_DWORD)v45)
        {
          objc_msgSend((id)-[BWStillImageProcessorControllerInput encodedAttachedMediaKeys](-[BWStillImageProcessorControllerRequest input](-[BWStillImageProcessorController currentRequest](self, "currentRequest"), "input"), "encodedAttachedMediaKeys"), "removeAllObjects");
          -[BWPhotoEncoderController _addOrPrewarmAuxImagesIfNeededForEncodingScheme:sampleBuffer:metadata:stillImageSettings:processingFlags:parentImageHandle:](self, "_addOrPrewarmAuxImagesIfNeededForEncodingScheme:sampleBuffer:metadata:stillImageSettings:processingFlags:parentImageHandle:", v201, v55, v198, v194, v204, v227);
          if (BWPhotoEncoderSupportsAddingAuxiliaryMetadataSeparately(v201))
            -[BWPhotoEncoderController _addGainMapMetadataForEncodingScheme:sampleBuffer:parentImageHandle:](self, "_addGainMapMetadataForEncodingScheme:sampleBuffer:parentImageHandle:", v201, v55, v227);
          -[BWPhotoEncoderController _updateStillImageProcessingFlagsWithDepthMetadataForSbuf:stillImageSettings:](self, "_updateStillImageProcessingFlagsWithDepthMetadataForSbuf:stillImageSettings:", v55, v194);
          v108 = v201;
          if (!(_DWORD)v195)
            goto LABEL_198;
          if (v169)
          {
            if (!*((_DWORD *)v247 + 6))
            {
              v109 = -[BWPhotoEncoderController _addCompressedThumbnailForEncodingScheme:thumbnailSurface:thumbnailSurfaceSize:](self, "_addCompressedThumbnailForEncodingScheme:thumbnailSurface:thumbnailSurfaceSize:", v201, v95, v241);
              *((_DWORD *)v247 + 6) = v109;
              v108 = v201;
              if (!v109)
              {
LABEL_198:
                v96 = -[BWPhotoEncoderController _closeContainerAndCopySurfaceForEncodingScheme:](self, "_closeContainerAndCopySurfaceForEncodingScheme:", v108);
                if (v96)
                  -[BWPhotoEncoderController _getAssetsSizeForEncodingScheme:containerSizeOut:thumbnailSizeOut:auxiliaryImagesSizeOut:](self, "_getAssetsSizeForEncodingScheme:containerSizeOut:thumbnailSizeOut:auxiliaryImagesSizeOut:", v201, &v260, &v259, &v258);
LABEL_200:
                pixelBuffera = v96;
                v199 = v95;
                v2 = v201;
                target = (void *)-[BWStillImageProcessorControllerInput primarySampleBuffer](-[BWStillImageProcessorControllerRequest input](v205, "input", v164), "primarySampleBuffer");
                if (!v178 && !v189)
                  goto LABEL_220;
                if (!cfa)
                {
                  cfa = 0;
LABEL_219:
                  CMSetAttachment(target, CFSTR("EncodedImageCodecType"), (CFTypeRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v177, v164, v165), 1u);
                  CMSetAttachment(target, CFSTR("EncodedImageFileType"), (CFTypeRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v170), 1u);
LABEL_220:
                  if (v184)
                  {
                    if (pixelBuffera)
                    {
                      CMSetAttachment(target, CFSTR("RawImageSurface"), pixelBuffera, 1u);
                      v263[0] = 0x1E495AC98;
                      v264[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v260);
                      v263[1] = 0x1E495ACB8;
                      v264[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v259);
                      v263[2] = 0x1E495ACD8;
                      v264[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v258);
                      CMSetAttachment(target, CFSTR("RawImageAssetSizes"), (CFTypeRef)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v264, v263, 3), 1u);
                    }
                    CMSetAttachment(target, CFSTR("RawImageFileType"), (CFTypeRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v180), 1u);
                    CMSetAttachment(target, CFSTR("RawDNGDictionary"), v191, 1u);
                    CMSetAttachment(target, CFSTR("RawImageBitDepth"), (CFTypeRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", self->_dngBitDepth), 1u);
                    CMSetAttachment(target, CFSTR("RawImageContainsDepthData"), (CFTypeRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v188), 1u);
                    CMSetAttachment(target, CFSTR("RawImageContainsSemanticSegmentationMattes"), (CFTypeRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v186), 1u);
                  }
                  goto LABEL_224;
                }
                if ((v183 & v181) == 1)
                {
                  if (v178)
                    v112 = 2;
                  else
                    v112 = 1;
                  v113 = target;
                  v114 = -[BWPhotoEncoderController _computeAndAddSmartStyleDeltaMapToClosedSurfaceContainer:sampleBuffer:encodingScheme:stillImageSettings:processingFlags:](self, "_computeAndAddSmartStyleDeltaMapToClosedSurfaceContainer:sampleBuffer:encodingScheme:stillImageSettings:processingFlags:", cfa, target, v112, v194, v204);
                  if (v114)
                  {
                    v230 = 0;
                    type = OS_LOG_TYPE_DEFAULT;
                    v115 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                    v116 = v230;
                    if (os_log_type_enabled(v115, type))
                      v117 = v116;
                    else
                      v117 = v116 & 0xFFFFFFFE;
                    if (v117)
                    {
                      *(_DWORD *)v269 = 136315394;
                      *(_QWORD *)&v269[4] = "-[BWPhotoEncoderController _processSbuf]";
                      v270 = 1026;
                      *(_DWORD *)v271 = v114;
                      LODWORD(v165) = 18;
                      v164 = v269;
                      _os_log_send_and_compose_impl();
                    }
                    fig_log_call_emit_and_clean_up_after_send_and_compose();
                  }
                  else
                  {
                    CFRelease(cfa);
                    cfa = -[BWPhotoEncoderController _closeContainerAndCopySurfaceForEncodingScheme:](self, "_closeContainerAndCopySurfaceForEncodingScheme:", v112);
                    if (!cfa)
                    {
                      cfa = 0;
                      CMSetAttachment(target, CFSTR("EncodedImageSurface"), 0, 1u);
                      goto LABEL_218;
                    }
                    -[BWPhotoEncoderController _getAssetsSizeForEncodingScheme:containerSizeOut:thumbnailSizeOut:auxiliaryImagesSizeOut:](self, "_getAssetsSizeForEncodingScheme:containerSizeOut:thumbnailSizeOut:auxiliaryImagesSizeOut:", v112, &v261, 0, 0);
                  }
                }
                else
                {
                  v113 = target;
                }
                CMSetAttachment(v113, CFSTR("EncodedImageSurface"), cfa, 1u);
LABEL_218:
                CMSetAttachment(target, CFSTR("EncodedImageSurfaceSize"), (CFTypeRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v261), 1u);
                goto LABEL_219;
              }
            }
          }
          else
          {
            dispatch_group_wait((dispatch_group_t)self->_previewGenerationGroup, 0xFFFFFFFFFFFFFFFFLL);
            if (!*((_DWORD *)v247 + 6))
            {
              v18 = (double)SHIDWORD(v223);
              width = (double)(int)v223;
              x = 0.0;
              y = 0.0;
LABEL_197:
              LODWORD(v164) = v224;
              v111 = -[BWPhotoEncoderController _addThumbnailForEncodingScheme:thumbnailPixelBuffer:metadata:requestedStillImageCaptureSettings:resolvedStillImageCaptureSettings:processingFlags:cropRect:codecType:maxPixelSize:parentImageHandle:](self, "_addThumbnailForEncodingScheme:thumbnailPixelBuffer:metadata:requestedStillImageCaptureSettings:resolvedStillImageCaptureSettings:processingFlags:cropRect:codecType:maxPixelSize:parentImageHandle:", v108, v243[3], v198, v3, v192, v204, x, y, width, v18, v164, v222, v227);
              *((_DWORD *)v247 + 6) = v111;
              goto LABEL_198;
            }
          }
          v110 = (const void *)v243[3];
          v243[3] = (uint64_t)pixelBuffer;
          CFRetain(pixelBuffer);
          if (v110)
            CFRelease(v110);
          goto LABEL_197;
        }
        v199 = v95;
        goto LABEL_129;
      }
    }
    BWPhotoEncoderApplyCropRectOnSampleBufferMetadata(v55, x, y, width, v18);
    goto LABEL_183;
  }
LABEL_128:
  cfa = 0;
  v199 = 0;
LABEL_129:
  pixelBuffera = 0;
LABEL_130:
  v2 = v201;
LABEL_225:
  dispatch_group_wait((dispatch_group_t)self->_previewGenerationGroup, 0xFFFFFFFFFFFFFFFFLL);
  if (!*((_DWORD *)v255 + 6) && v251[3])
  {
    if (objc_msgSend(v3, "payloadType") == 1)
    {
      v126 = CVPixelBufferGetIOSurface((CVPixelBufferRef)v251[3]);
      if (v126)
        CMSetAttachment(target, CFSTR("PreviewSurface"), v126, 1u);
    }
    else if (!objc_msgSend(v3, "payloadType"))
    {
      CMSetAttachment(target, CFSTR("PreviewPixelBuffer"), (CFTypeRef)v251[3], 1u);
    }
  }
  v118 = target;
  if (HIDWORD(v195))
  {
    if (!*((_DWORD *)v238 + 6))
    {
      v146 = (__CVBuffer *)v234[3];
      if (v146)
      {
        v147 = CVPixelBufferGetIOSurface(v146);
        if (v147)
          CMSetAttachment(target, CFSTR("ThumbnailSurface"), v147, 1u);
      }
    }
  }
  if (v182)
  {
    if (-[BWPhotoEncoderControllerConfiguration alwaysAwaitInference](self->_configuration, "alwaysAwaitInference"))
    {
      inferenceGroup = self->_inferenceGroup;
      v120 = dispatch_time(0, 1000000000);
      dispatch_group_wait(inferenceGroup, v120);
    }
    v121 = atomic_load((unsigned __int8 *)&self->_opportunisticInferenceCompleted);
    v118 = target;
    if ((v121 & 1) != 0)
    {
      v127 = self->_previewGenerationQueue;
      v209[0] = MEMORY[0x1E0C809B0];
      v209[1] = 3221225472;
      v209[2] = __40__BWPhotoEncoderController__processSbuf__block_invoke_248;
      v209[3] = &unk_1E4921410;
      v209[4] = self;
      v209[5] = v232;
      v209[6] = target;
      dispatch_sync(v127, v209);
    }
    else
    {
      UpTimeNanoseconds = FigGetUpTimeNanoseconds();
      v123 = objc_msgSend((id)BWInferenceGetAttachedInference(target, 802, 0x1E4951058), "count");
      if (*MEMORY[0x1E0CA1FC0] == 1)
        kdebug_trace();
      v124 = objc_msgSend((id)BWInferenceGetAttachedInference(target, 802, 0x1E4951078), "count");
      if (v123 > 0 || v124)
        BWPhotoEncoderApplyFinalCropToFaceObservationsForSampleBuffer(target);
      v125 = self->_previewGenerationQueue;
      v207[0] = MEMORY[0x1E0C809B0];
      v207[1] = 3221225472;
      v207[2] = __40__BWPhotoEncoderController__processSbuf__block_invoke_2_249;
      v207[3] = &unk_1E4925A60;
      v208 = v123;
      v207[4] = self;
      v207[5] = v231;
      v207[6] = v232;
      v207[7] = UpTimeNanoseconds / 0xF4240;
      dispatch_async(v125, v207);
    }
  }
  v128 = (const void *)BWSampleBufferGetAttachedMedia(v118, 0x1E4936818);
  if (v128)
  {
    v129 = (const __CFString *)*MEMORY[0x1E0D05CB0];
    v130 = CMGetAttachment(v128, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
    if (v130)
    {
      v131 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", CMGetAttachment(target, v129, 0));
      objc_msgSend(v131, "setObject:forKeyedSubscript:", v130, *MEMORY[0x1E0D05F00]);
      CMSetAttachment(target, v129, v131, 1u);
    }
  }
  if (cfa)
  {
    v132 = (void *)MEMORY[0x1E0CB3940];
    v133 = BWStringFromSurface(cfa);
    v134 = (const __CFString *)objc_msgSend(v132, "stringWithFormat:", CFSTR("[enabled:1 %@ size:%lu]"), v133, v261);
  }
  else
  {
    v134 = CFSTR("[enabled:0]");
  }
  if (pixelBuffera)
  {
    v135 = (void *)MEMORY[0x1E0CB3940];
    v136 = BWStringFromSurface(pixelBuffera);
    v137 = (const __CFString *)objc_msgSend(v135, "stringWithFormat:", CFSTR("linDNG:[enabled:1 %@ size:%lu]"), v136, v260);
    if (v12)
    {
LABEL_251:
      v138 = (void *)MEMORY[0x1E0CB3940];
      v139 = BWStringFromPixelBufferSurface((__CVBuffer *)v251[3]);
      v140 = (const __CFString *)objc_msgSend(v138, "stringWithFormat:", CFSTR("[enabled:1 %@ err:%d]"), v139, *((unsigned int *)v255 + 6));
      goto LABEL_254;
    }
  }
  else
  {
    v137 = CFSTR("linDNG:[enabled:0]");
    if (v12)
      goto LABEL_251;
  }
  v140 = CFSTR("[enabled:0]");
LABEL_254:
  if ((_DWORD)v195)
  {
    v141 = (__CVBuffer *)v243[3];
    if (v141)
    {
      v142 = (void *)MEMORY[0x1E0CB3940];
      v143 = BWStringFromPixelBufferSurface(v141);
      v144 = (const __CFString *)objc_msgSend(v142, "stringWithFormat:", CFSTR("[enabled:1 %@ err:%d]"), v143, *((unsigned int *)v247 + 6));
    }
    else
    {
      v144 = CFSTR("[enabled:0]");
    }
    if (v199)
    {
      v148 = (void *)MEMORY[0x1E0CB3940];
      v149 = BWStringFromSurface(v199);
      v145 = (const __CFString *)objc_msgSend(v148, "stringWithFormat:", CFSTR("[enabled:1 %@ size:%lu err:%d]"), v149, v241, *((unsigned int *)v247 + 6));
    }
    else
    {
      v145 = CFSTR("[enabled:0]");
    }
  }
  else
  {
    v144 = CFSTR("[enabled:0]");
    v145 = CFSTR("[enabled:0]");
  }
  if (HIDWORD(v195))
  {
    v150 = (void *)MEMORY[0x1E0CB3940];
    v151 = BWStringFromPixelBufferSurface((__CVBuffer *)v234[3]);
    v152 = (const __CFString *)objc_msgSend(v150, "stringWithFormat:", CFSTR("[enabled:1 %@ err:%d]"), v151, *((unsigned int *)v238 + 6));
  }
  else
  {
    v152 = CFSTR("[enabled:0]");
  }
  if (dword_1ECFE9A10)
  {
    v230 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    v153 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v154 = v230;
    if (os_log_type_enabled(v153, type))
      v155 = v154;
    else
      v155 = v154 & 0xFFFFFFFE;
    if (v155)
    {
      v156 = "failed";
      *(_DWORD *)v269 = 136317443;
      *(_QWORD *)&v269[4] = "-[BWPhotoEncoderController _processSbuf]";
      v270 = 2082;
      if (!(_DWORD)v45)
        v156 = "succeeded";
      *(_QWORD *)v271 = v156;
      *(_WORD *)&v271[8] = 2050;
      v272 = v179;
      LOWORD(v273) = 1026;
      *(_DWORD *)((char *)&v273 + 2) = v45;
      WORD3(v273) = 2113;
      *((_QWORD *)&v273 + 1) = v134;
      v274 = 2113;
      *(_QWORD *)v275 = v137;
      *(_WORD *)&v275[8] = 2113;
      v276 = v140;
      *(_WORD *)v277 = 2113;
      *(_QWORD *)&v277[2] = v144;
      *(_WORD *)v278 = 2113;
      *(_QWORD *)&v278[2] = v145;
      v279 = 2113;
      *(_QWORD *)v280 = v152;
      LODWORD(v165) = 98;
      v164 = v269;
      _os_log_send_and_compose_impl();
    }
    v2 = v2;
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (v262)
    CFRelease(v262);
  if (cfa)
    CFRelease(cfa);
  if (pixelBuffera)
    CFRelease(pixelBuffera);
  v157 = (const void *)v251[3];
  if (v157)
    CFRelease(v157);
  v158 = (const void *)v243[3];
  if (v158)
    CFRelease(v158);
  if (v199)
    CFRelease(v199);
  v159 = (const void *)v234[3];
  if (v159)
    CFRelease(v159);
  v160 = -[BWStillImageProcessorControllerInput receivedAllFramesInSingleContainer](-[BWStillImageProcessorControllerRequest input](v205, "input", v164, v165), "receivedAllFramesInSingleContainer");
  if ((_DWORD)v45)
    v161 = IsPrimaryFrame;
  else
    v161 = 0;
  if (v161)
  {
    -[BWStillImageProcessorControllerInput setFatalErrorOccurred:](-[BWStillImageProcessorControllerRequest input](v205, "input"), "setFatalErrorOccurred:", 1);
  }
  else if (!v160)
  {
    v162 = 0;
    goto LABEL_299;
  }
  -[BWPhotoEncoderController _closeContainerForEncodingScheme:](self, "_closeContainerForEncodingScheme:", v2);
  -[BWStillImageProcessorControllerDelegate processorController:didFinishProcessingSampleBuffer:type:processorInput:err:](-[BWStillImageProcessorControllerRequest delegate](v205, "delegate"), "processorController:didFinishProcessingSampleBuffer:type:processorInput:err:", self, target, objc_msgSend((id)CMGetAttachment(target, CFSTR("StillImageBufferFrameType"), 0), "unsignedLongLongValue"), -[BWStillImageProcessorControllerRequest input](v205, "input"), v45);
  v162 = 1;
LABEL_299:
  -[BWStillImageProcessorControllerInput finishedProcessingSbuf](-[BWStillImageProcessorControllerRequest input](v205, "input"), "finishedProcessingSbuf");
  if (v162)
    -[BWPhotoEncoderController _removeCurrentRequestFromInputsByCaptureIdentifier](self, "_removeCurrentRequestFromInputsByCaptureIdentifier");
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
LABEL_303:
  _Block_object_dispose(v231, 8);
  _Block_object_dispose(v232, 8);
  _Block_object_dispose(&v233, 8);
  _Block_object_dispose(&v237, 8);
  _Block_object_dispose(&v242, 8);
  _Block_object_dispose(&v246, 8);
  _Block_object_dispose(&v250, 8);
  _Block_object_dispose(&v254, 8);
  return v45;
}

unint64_t __40__BWPhotoEncoderController__processSbuf__block_invoke(uint64_t a1)
{
  unint64_t result;
  id v3;
  unsigned int v4;
  unint64_t v5;

  result = objc_msgSend(*(id *)(a1 + 32), "_generatePreviewForSampleBuffer:requestedStillImageCaptureSettings:cropRect:previewPixelBuffer:", *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24, *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112), *(double *)(a1 + 120));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = result;
  if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) && *(_BYTE *)(a1 + 136))
  {
    BWCMSampleBufferCreateCopyWithNewPixelBuffer(*(opaqueCMSampleBuffer **)(a1 + 88), *(__CVBuffer **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24), (CFTypeRef *)(*(_QWORD *)(a1 + 32) + 216), (CMSampleBufferRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24));
    v3 = (id)objc_msgSend(*(id *)(a1 + 48), "mutableCopy");
    CMSetAttachment(*(CMAttachmentBearerRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24), (CFStringRef)*MEMORY[0x1E0D05CB0], v3, 1u);
    if (!CGRectIsEmpty(*(CGRect *)(a1 + 96)))
    {
      v4 = objc_msgSend(*(id *)(a1 + 40), "previewWidth");
      v5 = v4 | (unint64_t)(objc_msgSend(*(id *)(a1 + 40), "previewHeight") << 32);
      FigCaptureMetadataUtilitiesUpdateMetadataForStillImageCrop(v3, *(_QWORD *)(a1 + 128), v5, *(CGFloat *)(a1 + 96), *(CGFloat *)(a1 + 104), *(CGFloat *)(a1 + 112), *(CGFloat *)(a1 + 120), *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
      FigCaptureMetadataUtilitiesUpdateMetadataForNewFinalDimensions((uint64_t)v3, *(_QWORD *)(a1 + 128), v5);
    }
    BWPhotoEncoderApplyFinalCropToFaceObservationsForSampleBuffer(*(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8)
                                                                                 + 24));
    objc_msgSend(*(id *)(a1 + 32), "_performInferenceWithBuffer:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24));
    result = FigGetUpTimeNanoseconds();
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = result / 0xF4240;
  }
  return result;
}

uint64_t __40__BWPhotoEncoderController__processSbuf__block_invoke_2(uint64_t a1)
{
  CFDictionaryRef v2;
  CFTypeRef v3;
  uint64_t result;

  v2 = CVBufferCopyAttachments(*(CVBufferRef *)(a1 + 56), kCVAttachmentMode_ShouldPropagate);
  if (v2)
    v3 = CFAutorelease(v2);
  else
    v3 = 0;
  result = BWPhotoEncoderScalePixelBuffer(*(__CVBuffer **)(a1 + 56), *(_QWORD *)(a1 + 96), +[BWVideoFormat colorSpacePropertiesForPixelBufferAttachments:](BWVideoFormat, "colorSpacePropertiesForPixelBufferAttachments:", v3), *(void **)(*(_QWORD *)(a1 + 32) + 104), 0, *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24, *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __40__BWPhotoEncoderController__processSbuf__block_invoke_241(uint64_t a1)
{
  CFDictionaryRef v2;
  CFTypeRef v3;
  uint64_t result;

  v2 = CVBufferCopyAttachments(*(CVBufferRef *)(a1 + 56), kCVAttachmentMode_ShouldPropagate);
  if (v2)
    v3 = CFAutorelease(v2);
  else
    v3 = 0;
  result = BWPhotoEncoderScalePixelBuffer(*(__CVBuffer **)(a1 + 56), *(_QWORD *)(a1 + 96), +[BWVideoFormat colorSpacePropertiesForPixelBufferAttachments:](BWVideoFormat, "colorSpacePropertiesForPixelBufferAttachments:", v3), *(void **)(*(_QWORD *)(a1 + 32) + 96), 1, *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24, *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __40__BWPhotoEncoderController__processSbuf__block_invoke_247(uint64_t a1)
{
  CFDictionaryRef v2;
  CFTypeRef v3;
  uint64_t result;

  v2 = CVBufferCopyAttachments(*(CVBufferRef *)(a1 + 56), kCVAttachmentMode_ShouldPropagate);
  if (v2)
    v3 = CFAutorelease(v2);
  else
    v3 = 0;
  result = BWPhotoEncoderScalePixelBuffer(*(__CVBuffer **)(a1 + 56), *(_QWORD *)(a1 + 96), +[BWVideoFormat colorSpacePropertiesForPixelBufferAttachments:](BWVideoFormat, "colorSpacePropertiesForPixelBufferAttachments:", v3), *(void **)(*(_QWORD *)(a1 + 32) + 96), 1, *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24, *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __40__BWPhotoEncoderController__processSbuf__block_invoke_248(uint64_t a1)
{
  const void *v2;
  CFTypeRef v3;
  const void *v4;
  const void *v5;

  atomic_store(0, (unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 193));
  v2 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v2)
  {
    v3 = CMGetAttachment(v2, CFSTR("Inferences"), 0);
    if (v3)
      v4 = v3;
    else
      v4 = (const void *)MEMORY[0x1E0C9AA70];
    CMSetAttachment(*(CMAttachmentBearerRef *)(a1 + 48), CFSTR("Inferences"), v4, 1u);
    v5 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    if (v5)
      CFRelease(v5);
  }
}

void __40__BWPhotoEncoderController__processSbuf__block_invoke_2_249(uint64_t a1)
{
  unint64_t UpTimeNanoseconds;
  unint64_t v3;
  unint64_t v4;
  BWOpportunisticInferenceAnalyticsPayload *v5;
  const void *v6;

  atomic_store(0, (unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 193));
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  UpTimeNanoseconds = FigGetUpTimeNanoseconds();
  v3 = UpTimeNanoseconds / 0xF4240 - *(_QWORD *)(a1 + 56);
  v4 = UpTimeNanoseconds / 0xF4240 - *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v5 = objc_alloc_init(BWOpportunisticInferenceAnalyticsPayload);
  -[BWOpportunisticInferenceAnalyticsPayload setInferenceDeadlineOverdue:](v5, "setInferenceDeadlineOverdue:", v3);
  -[BWOpportunisticInferenceAnalyticsPayload setTotalInferenceExecutionTime:](v5, "setTotalInferenceExecutionTime:", v4);
  -[BWOpportunisticInferenceAnalyticsPayload setFacesProcessedCount:](v5, "setFacesProcessedCount:", *(unsigned int *)(a1 + 64));
  -[BWCoreAnalyticsReporter sendEvent:](+[BWCoreAnalyticsReporter sharedInstance](BWCoreAnalyticsReporter, "sharedInstance"), "sendEvent:", v5);
  v6 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  if (v6)
    CFRelease(v6);
}

- (void)_removeCurrentRequestFromInputsByCaptureIdentifier
{
  NSObject *inputsByCaptureIdentifierQueue;
  _QWORD block[5];

  inputsByCaptureIdentifierQueue = self->_inputsByCaptureIdentifierQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__BWPhotoEncoderController__removeCurrentRequestFromInputsByCaptureIdentifier__block_invoke;
  block[3] = &unk_1E491E720;
  block[4] = self;
  dispatch_sync(inputsByCaptureIdentifierQueue, block);
}

uint64_t __78__BWPhotoEncoderController__removeCurrentRequestFromInputsByCaptureIdentifier__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 272);
  result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (result)
  {
    v4 = result;
    v5 = *(_QWORD *)v10;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v6);
        v8 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "currentRequest"), "input");
        result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 272), "objectForKeyedSubscript:", v7);
        if (v8 == result)
        {
          if (v7)
            return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 272), "removeObjectForKey:", v7);
          return result;
        }
        ++v6;
      }
      while (v4 != v6);
      result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      v4 = result;
      if (result)
        continue;
      break;
    }
  }
  return result;
}

- (void)_flushInputsByCaptureIdentifier
{
  NSObject *inputsByCaptureIdentifierQueue;
  _QWORD block[5];

  inputsByCaptureIdentifierQueue = self->_inputsByCaptureIdentifierQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__BWPhotoEncoderController__flushInputsByCaptureIdentifier__block_invoke;
  block[3] = &unk_1E491E720;
  block[4] = self;
  dispatch_sync(inputsByCaptureIdentifierQueue, block);
}

uint64_t __59__BWPhotoEncoderController__flushInputsByCaptureIdentifier__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 272), "removeAllObjects");
}

- (void)_flushCurrentRequest
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  BWStillImageProcessorControllerInput *v4;
  _BOOL4 v5;
  _BOOL4 v6;
  uint64_t v7;
  uint64_t v9;
  __IOSurface *v10;
  __IOSurface *v11;
  const void *v12;
  __IOSurface *v13;
  __IOSurface *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  os_log_type_t type;
  _QWORD v19[3];
  _QWORD v20[3];
  uint64_t v21;
  _QWORD v22[17];

  v22[16] = *MEMORY[0x1E0C80C00];
  if (dword_1ECFE9A10)
  {
    LODWORD(v17) = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v4 = -[BWStillImageProcessorControllerRequest input](-[BWStillImageProcessorController currentRequest](self, "currentRequest", v15, v16), "input");
  v5 = -[BWCMPhotoEncoderManager isContainerOpen](self->_cmPhotoEncoderManager, "isContainerOpen");
  v6 = -[BWDNGEncoderManager isContainerOpen](self->_dngEncoderManager, "isContainerOpen");
  v7 = BWPhotoEncoderResolveEncodingSchemeForRequestedSettings(-[BWStillImageSettings requestedSettings](-[BWStillImageProcessorControllerInput stillImageSettings](v4, "stillImageSettings"), "requestedSettings"));
  if (BWPhotoEncoderResolveEncodingSchemeForCompressedPhotoWithLinDNG(-[BWStillImageSettings requestedSettings](-[BWStillImageProcessorControllerInput stillImageSettings](v4, "stillImageSettings"), "requestedSettings")) == 2|| (_DWORD)v7 == 2)
  {
    v9 = 2;
  }
  else
  {
    v9 = 1;
  }
  if ((-[BWStillImageProcessorControllerInput fatalErrorOccurred](v4, "fatalErrorOccurred") & 1) != 0
    || !-[BWStillImageProcessorControllerInput primarySampleBuffer](v4, "primarySampleBuffer"))
  {
    if (v5)
      -[BWPhotoEncoderController _closeContainerForEncodingScheme:](self, "_closeContainerForEncodingScheme:", v9);
    if (v6)
      -[BWPhotoEncoderController _closeContainerForEncodingScheme:](self, "_closeContainerForEncodingScheme:", v7);
  }
  else
  {
    if (v5)
    {
      v22[0] = 0;
      v10 = -[BWPhotoEncoderController _closeContainerAndCopySurfaceForEncodingScheme:](self, "_closeContainerAndCopySurfaceForEncodingScheme:", v9);
      if (v10)
      {
        v11 = v10;
        -[BWPhotoEncoderController _getAssetsSizeForEncodingScheme:containerSizeOut:thumbnailSizeOut:auxiliaryImagesSizeOut:](self, "_getAssetsSizeForEncodingScheme:containerSizeOut:thumbnailSizeOut:auxiliaryImagesSizeOut:", v9, v22, 0, 0);
        CMSetAttachment((CMAttachmentBearerRef)-[BWStillImageProcessorControllerInput primarySampleBuffer](v4, "primarySampleBuffer"), CFSTR("EncodedImageSurface"), v11, 1u);
        v12 = (const void *)-[BWStillImageProcessorControllerInput primarySampleBuffer](v4, "primarySampleBuffer");
        CMSetAttachment(v12, CFSTR("EncodedImageSurfaceSize"), (CFTypeRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v22[0]), 1u);
      }
    }
    if (v6)
    {
      v22[0] = 0;
      v21 = 0;
      v17 = 0;
      v13 = -[BWPhotoEncoderController _closeContainerAndCopySurfaceForEncodingScheme:](self, "_closeContainerAndCopySurfaceForEncodingScheme:", v7);
      if (v13)
      {
        v14 = v13;
        -[BWPhotoEncoderController _getAssetsSizeForEncodingScheme:containerSizeOut:thumbnailSizeOut:auxiliaryImagesSizeOut:](self, "_getAssetsSizeForEncodingScheme:containerSizeOut:thumbnailSizeOut:auxiliaryImagesSizeOut:", v7, v22, &v21, &v17);
        CMSetAttachment((CMAttachmentBearerRef)-[BWStillImageProcessorControllerInput primarySampleBuffer](-[BWStillImageProcessorControllerRequest input](-[BWStillImageProcessorController currentRequest](self, "currentRequest"), "input"), "primarySampleBuffer"), CFSTR("RawImageSurface"), v14, 1u);
        v19[0] = 0x1E495AC98;
        v20[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v22[0]);
        v19[1] = 0x1E495ACB8;
        v20[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v21);
        v19[2] = 0x1E495ACD8;
        v20[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v17);
        CMSetAttachment((CMAttachmentBearerRef)-[BWStillImageProcessorControllerInput primarySampleBuffer](v4, "primarySampleBuffer"), CFSTR("RawImageAssetSizes"), (CFTypeRef)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 3), 1u);
      }
    }
    -[BWStillImageProcessorControllerDelegate processorController:didFinishProcessingSampleBuffer:type:processorInput:err:](-[BWStillImageProcessorControllerRequest delegate](-[BWStillImageProcessorController currentRequest](self, "currentRequest"), "delegate"), "processorController:didFinishProcessingSampleBuffer:type:processorInput:err:", self, -[BWStillImageProcessorControllerInput primarySampleBuffer](v4, "primarySampleBuffer"), objc_msgSend((id)CMGetAttachment((CMAttachmentBearerRef)-[BWStillImageProcessorControllerInput primarySampleBuffer](v4, "primarySampleBuffer"), CFSTR("StillImageBufferFrameType"), 0), "unsignedLongLongValue"), -[BWStillImageProcessorControllerRequest input](-[BWStillImageProcessorController currentRequest](self, "currentRequest"), "input"), 4294950496);
  }
  -[BWPhotoEncoderController _removeCurrentRequestFromInputsByCaptureIdentifier](self, "_removeCurrentRequestFromInputsByCaptureIdentifier");
  -[BWPhotoEncoderController reset](self, "reset");
}

- (void)_propagateSampleBufferGainMapMetadata:(opaqueCMSampleBuffer *)a3 toSampleBufferMetadata:(opaqueCMSampleBuffer *)a4
{
  const void *AttachedMedia;
  const __CFString *v6;
  CFTypeRef v7;
  void *value;

  AttachedMedia = (const void *)BWSampleBufferGetAttachedMedia(a3, 0x1E4936818);
  v6 = (const __CFString *)*MEMORY[0x1E0D05CB0];
  v7 = CMGetAttachment(AttachedMedia, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  value = (void *)objc_msgSend((id)CMGetAttachment(a4, v6, 0), "mutableCopy");
  objc_msgSend(value, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0D05F00]);
  CMSetAttachment(a4, v6, value, 1u);

}

- (double)_primaryOutputAspectRatioForSettings:(id)a3
{
  unsigned int v5;
  unsigned int v6;
  double v7;

  v5 = objc_msgSend((id)objc_msgSend(a3, "requestedSettings"), "outputWidth");
  v6 = objc_msgSend((id)objc_msgSend(a3, "requestedSettings"), "outputHeight");
  -[BWPhotoEncoderController _aspectRatioAdjustmentFactorForSettings:](self, "_aspectRatioAdjustmentFactorForSettings:", objc_msgSend(a3, "requestedSettings"));
  return (double)v5 / (double)v6 * v7;
}

- (int)_addOrPrewarmForAttachedMediaKey:(id)a3 encodingScheme:(int)a4 sampleBuffer:(opaqueCMSampleBuffer *)a5 metadata:(id)a6 stillImageSettings:(id)a7 parentImageHandle:(int64_t)a8
{
  uint64_t v12;
  uint64_t AttachedMedia;
  const __CFString *v16;
  double v17;
  double v18;
  uint64_t v19;
  const void *v20;
  float v21;
  _BOOL4 v22;
  int v23;
  int v24;
  int v25;
  int v27;

  v12 = *(_QWORD *)&a4;
  AttachedMedia = BWSampleBufferGetAttachedMedia(a5, (uint64_t)a3);
  v16 = CFSTR("Adding");
  if (!AttachedMedia)
    v16 = CFSTR("Prewarming");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ aux image {%@}"), v16, a3);
  -[BWPhotoEncoderController _primaryOutputAspectRatioForSettings:](self, "_primaryOutputAspectRatioForSettings:", a7);
  v18 = v17;
  v19 = objc_msgSend((id)objc_msgSend(a6, "objectForKeyedSubscript:", *MEMORY[0x1E0D05E50]), "intValue");
  if (objc_msgSend(a3, "isEqualToString:", 0x1E4936818))
  {
    if (AttachedMedia)
    {
      v20 = (const void *)BWSampleBufferGetAttachedMedia(a5, (uint64_t)a3);
      -[BWPhotoEncoderController mainImageDownscalingFactorForAttachedMediaKey:attachedMediaMetadata:](self, "mainImageDownscalingFactorForAttachedMediaKey:attachedMediaMetadata:", a3, CMGetAttachment(v20, (CFStringRef)*MEMORY[0x1E0D05CB0], 0));
      v22 = -[BWPhotoEncoderController _addGainMapForEncodingScheme:sampleBuffer:outputDimensions:primaryOutputAspectRatio:parentImageHandle:](self, "_addGainMapForEncodingScheme:sampleBuffer:outputDimensions:primaryOutputAspectRatio:parentImageHandle:", v12, a5, (float)((float)objc_msgSend((id)objc_msgSend(a7, "requestedSettings"), "outputWidth")/ v21) | ((unint64_t)(float)((float)objc_msgSend((id)objc_msgSend(a7, "requestedSettings"), "outputHeight")/ v21) << 32), a8, v18);
      if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Depth")) & 1) == 0)
        goto LABEL_10;
      goto LABEL_9;
    }
    -[BWPhotoEncoderController _handlePrewarmForGainMapForEncodingScheme:requestedStillImageCaptureSettings:prewarmingMetadata:](self, "_handlePrewarmForGainMapForEncodingScheme:requestedStillImageCaptureSettings:prewarmingMetadata:", v12, objc_msgSend(a7, "requestedSettings"), a6);
    if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Depth")) & 1) == 0)
      goto LABEL_14;
  }
  else
  {
    if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Depth")) & 1) == 0)
    {
      v23 = 0;
      v22 = 0;
      goto LABEL_15;
    }
    if (AttachedMedia)
    {
LABEL_9:
      v22 = -[BWPhotoEncoderController _addDepthForEncodingScheme:sampleBuffer:primaryOutputAspectRatio:parentImageHandle:](self, "_addDepthForEncodingScheme:sampleBuffer:primaryOutputAspectRatio:parentImageHandle:", v12, a5, a8, v18);
LABEL_10:
      v23 = 0;
      goto LABEL_15;
    }
  }
  -[BWPhotoEncoderController _handlePrewarmForDepthForEncodingScheme:requestedStillImageCaptureSettings:prewarmingMetadata:](self, "_handlePrewarmForDepthForEncodingScheme:requestedStillImageCaptureSettings:prewarmingMetadata:", v12, objc_msgSend(a7, "requestedSettings"), a6);
LABEL_14:
  v22 = 0;
  v23 = 1;
LABEL_15:
  if (objc_msgSend(a3, "isEqualToString:", 0x1E495AF38))
  {
    if (AttachedMedia)
    {
      v22 = -[BWPhotoEncoderController _addPortraitEffectsMatteForEncodingScheme:sampleBuffer:primaryOutputAspectRatio:parentImageHandle:](self, "_addPortraitEffectsMatteForEncodingScheme:sampleBuffer:primaryOutputAspectRatio:parentImageHandle:", v12, a5, a8, v18);
    }
    else
    {
      -[BWPhotoEncoderController _handlePrewarmForPortraitEffectsMatteForEncodingScheme:requestedStillImageCaptureSettings:](self, "_handlePrewarmForPortraitEffectsMatteForEncodingScheme:requestedStillImageCaptureSettings:", v12, objc_msgSend(a7, "requestedSettings"));
      v23 = 1;
    }
  }
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("PersonSemanticsHair")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("PersonSemanticsSkin")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("PersonSemanticsTeeth")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("PersonSemanticsGlasses")) & 1) != 0)
  {
    if (AttachedMedia)
LABEL_24:
      v22 = -[BWPhotoEncoderController _addSemanticMattesForEncodingScheme:attachedMediaKey:sampleBuffer:primaryOutputAspectRatio:settingsID:orientation:parentImageHandle:](self, "_addSemanticMattesForEncodingScheme:attachedMediaKey:sampleBuffer:primaryOutputAspectRatio:settingsID:orientation:parentImageHandle:", v12, a3, a5, objc_msgSend((id)objc_msgSend(a7, "requestedSettings"), "settingsID"), v19, a8, v18);
  }
  else
  {
    v27 = objc_msgSend(a3, "isEqualToString:", 0x1E495B0B8);
    if (AttachedMedia && v27)
      goto LABEL_24;
  }
  v24 = objc_msgSend(a3, "isEqualToString:", 0x1E495B258);
  if (AttachedMedia && v24)
    v22 = -[BWPhotoEncoderController _addSmartStyleLinearThumbnailForEncodingScheme:sampleBuffer:primaryOutputAspectRatio:](self, "_addSmartStyleLinearThumbnailForEncodingScheme:sampleBuffer:primaryOutputAspectRatio:", v12, a5, v18);
  if (objc_msgSend(a3, "isEqualToString:", 0x1E495B438))
  {
    if (AttachedMedia)
    {
      v22 = -[BWPhotoEncoderController _addConstantColorConfidenceMapForEncodingScheme:sampleBuffer:](self, "_addConstantColorConfidenceMapForEncodingScheme:sampleBuffer:", v12, a5);
      if ((v23 & 1) != 0)
        goto LABEL_35;
LABEL_33:
      v25 = 0;
      goto LABEL_36;
    }
    -[BWPhotoEncoderController _handlePrewarmForConstantColorConfidenceMapForEncodingScheme:requestedStillImageCaptureSettings:confidenceMapDimensions:](self, "_handlePrewarmForConstantColorConfidenceMapForEncodingScheme:requestedStillImageCaptureSettings:confidenceMapDimensions:", v12, objc_msgSend(a7, "requestedSettings"), -[BWPhotoEncoderControllerConfiguration constantColorConfidenceMapDimensions](self->_configuration, "constantColorConfidenceMapDimensions"));
  }
  else if (!v23)
  {
    goto LABEL_33;
  }
LABEL_35:
  v25 = 1;
LABEL_36:
  if (v22)
    return 2;
  else
    return v25;
}

- (void)_addOrPrewarmAuxImagesIfNeededForEncodingScheme:(int)a3 sampleBuffer:(opaqueCMSampleBuffer *)a4 metadata:(id)a5 stillImageSettings:(id)a6 processingFlags:(unsigned int)a7 parentImageHandle:(int64_t)a8
{
  uint64_t v12;
  void *v13;
  int v14;
  const void *AttachedMedia;
  float v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  uint64_t v25;
  char v26;
  void *v27;
  int v28;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v30;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;
  uint64_t v39;
  int v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  if ((a7 & 0x40) == 0
    || !-[BWPhotoEncoderControllerConfiguration portraitRenderQuality](self->_configuration, "portraitRenderQuality"))
  {
    v12 = BWIsDeferredPhotoProxyImage(a7);
    v13 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v40 = 0;
    v38 = 0;
    v39 = 0;
    v14 = BWPhotoEncoderThumbnailEnabled(a3, (void *)objc_msgSend(a6, "requestedSettings"), &v40, &v39, &v38);
    AttachedMedia = (const void *)BWSampleBufferGetAttachedMedia(a4, 0x1E4936818);
    -[BWPhotoEncoderController mainImageDownscalingFactorForAttachedMediaKey:attachedMediaMetadata:](self, "mainImageDownscalingFactorForAttachedMediaKey:attachedMediaMetadata:", 0x1E4936818, CMGetAttachment(AttachedMedia, (CFStringRef)*MEMORY[0x1E0D05CB0], 0));
    if (v16 != 0.0 && (!BWPhotoEncoderIsLinDNGEncodingScheme(a3) | v14) == 1)
      objc_msgSend(v13, "addObject:", 0x1E4936818);
    if (-[BWPhotoEncoderController _depthEncodingNeededForSettings:deferredPhotoProxy:](self, "_depthEncodingNeededForSettings:deferredPhotoProxy:", a6, v12))
    {
      objc_msgSend(v13, "addObject:", CFSTR("Depth"));
    }
    v17 = (a7 >> 3) & 1;
    if (-[BWPhotoEncoderController _personMaskEncodingNeededForSettings:encodingScheme:deferredPhotoProxy:adjustedPhoto:](self, "_personMaskEncodingNeededForSettings:encodingScheme:deferredPhotoProxy:adjustedPhoto:", a6, a3, v12, v17))
    {
      objc_msgSend(v13, "addObject:", 0x1E495AF38);
    }
    v18 = -[BWPhotoEncoderController _semanticSegmentationMatteMediaKeysEncodingNeededForSettings:encodingScheme:deferredPhotoProxy:adjustedPhoto:](self, "_semanticSegmentationMatteMediaKeysEncodingNeededForSettings:encodingScheme:deferredPhotoProxy:adjustedPhoto:", a6, a3, v12, (a7 >> 3) & 1);
    if (objc_msgSend(v18, "count"))
      objc_msgSend(v13, "addObjectsFromArray:", v18);
    if (-[BWPhotoEncoderController _smartStyleReversibilityDataNeededForSettings:adjustedPhoto:deferredPhotoProxy:](self, "_smartStyleReversibilityDataNeededForSettings:adjustedPhoto:deferredPhotoProxy:", a6, v17, v12))
    {
      objc_msgSend(v13, "addObject:", 0x1E495B258);
    }
    if (-[BWStillImageProcessorControllerInput deltaMapIsValid](-[BWStillImageProcessorControllerRequest input](-[BWStillImageProcessorController currentRequest](self, "currentRequest"), "input"), "deltaMapIsValid"))
    {
      -[BWPhotoEncoderController _primaryOutputAspectRatioForSettings:](self, "_primaryOutputAspectRatioForSettings:", a6);
      -[BWPhotoEncoderController _addSmartStyleDeltaMapForEncodingScheme:sampleBuffer:stillImageSettings:primaryOutputAspectRatio:](self, "_addSmartStyleDeltaMapForEncodingScheme:sampleBuffer:stillImageSettings:primaryOutputAspectRatio:", a3, a4, a6);
    }
    if (objc_msgSend((id)objc_msgSend(a6, "requestedSettings"), "constantColorEnabled")
      && BWIsConstantColorPrimaryFrame(a4))
    {
      objc_msgSend(v13, "addObject:", 0x1E495B438);
    }
    v19 = objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v20 = objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v30 = objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v21 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v35 != v23)
            objc_enumerationMutation(v13);
          v25 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
          v26 = objc_msgSend((id)-[BWStillImageProcessorControllerInput encodedAttachedMediaKeys](-[BWStillImageProcessorControllerRequest input](-[BWStillImageProcessorController currentRequest](self, "currentRequest"), "input"), "encodedAttachedMediaKeys"), "containsObject:", v25);
          v27 = (void *)v19;
          if ((v26 & 1) == 0)
          {
            v28 = -[BWPhotoEncoderController _addOrPrewarmForAttachedMediaKey:encodingScheme:sampleBuffer:metadata:stillImageSettings:parentImageHandle:](self, "_addOrPrewarmForAttachedMediaKey:encodingScheme:sampleBuffer:metadata:stillImageSettings:parentImageHandle:", v25, a3, a4, a5, a6, a8);
            v27 = (void *)v20;
            if (v28 != 2)
            {
              if (v28 != 1)
                continue;
              v27 = (void *)v30;
            }
          }
          objc_msgSend(v27, "addObject:", v25);
        }
        v22 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
      }
      while (v22);
    }
    if (dword_1ECFE9A10)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
}

- (float)mainImageDownscalingFactorForAttachedMediaKey:(id)a3 attachedMediaMetadata:(id)a4
{
  float result;

  objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D05FB8]), "floatValue");
  if (result == 0.0)
    objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[BWPhotoEncoderControllerConfiguration attachedMediaConfigurationByAttachedMediaKey](self->_configuration, "attachedMediaConfigurationByAttachedMediaKey"), "objectForKeyedSubscript:", a3), "mainImageDownscalingFactor");
  return result;
}

- (BOOL)_postponeSelectResourceAllocations
{
  BOOL v3;

  v3 = BWDeviceSupportsDeferredPhotoProcessorPrewarming();
  return -[BWPhotoEncoderControllerConfiguration deferredPhotoProcessorEnabled](self->_configuration, "deferredPhotoProcessorEnabled")&& v3;
}

- (int)_ensureSetupForPostponedResources
{
  int v3;

  if (self->_smartStyleProcessor
    || !-[BWPhotoEncoderControllerConfiguration smartStyleReversibilityEnabled](self->_configuration, "smartStyleReversibilityEnabled")|| -[BWPhotoEncoderControllerConfiguration smartStyleRenderingVersion](self->_configuration, "smartStyleRenderingVersion") < 1)
  {
    return 0;
  }
  v3 = -[BWPhotoEncoderController _loadCreateAndSetupSmartStyleRenderingProcessor](self, "_loadCreateAndSetupSmartStyleRenderingProcessor");
  if (v3)
    FigDebugAssert3();
  return v3;
}

- (void)_handlePrewarmForMainImageForEncodingScheme:(int)a3 prewarmingMetadata:(id)a4 stillImageSettings:(id)a5
{
  uint64_t v6;
  void *v8;
  void *v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  const __CFDictionary *v13;
  unint64_t v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  double v22;
  const __CFAllocator *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  CMVideoCodecType v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  float v36;
  float v37;
  unsigned int v38;
  unsigned int v39;
  unsigned int v40;
  uint64_t v41;
  const __CFDictionary *extensions;
  uint64_t v43;
  id v44;
  CMVideoCodecType codecType;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unsigned int v51;
  CMVideoFormatDescriptionRef formatDescriptionOut;
  CMVideoFormatDescriptionRef v53;
  CGRect v54;

  v6 = *(_QWORD *)&a3;
  formatDescriptionOut = 0;
  v53 = 0;
  v8 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v44 = -[BWPhotoEncoderController _encoderManagerForEncodingScheme:](self, "_encoderManagerForEncodingScheme:", v6);
  if (v44)
  {
    v9 = (void *)objc_msgSend(a5, "requestedSettings");
    v10 = objc_msgSend(v9, "outputWidth");
    v11 = objc_msgSend(v9, "outputHeight");
    codecType = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_resolvedVideoFormatsByAttachedMediaKey, "objectForKeyedSubscript:", CFSTR("PrimaryFormat")), "pixelFormat");
    v12 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_resolvedVideoFormatsByAttachedMediaKey, "objectForKeyedSubscript:", CFSTR("PrimaryFormat")), "colorSpaceProperties");
    if (!(_DWORD)v12)
      v12 = -[BWPhotoEncoderController _getColorSpacePropertiesForSourcePixelFormat:sourceWidth:sourceHeight:destinationPixelFormat:](self, "_getColorSpacePropertiesForSourcePixelFormat:sourceWidth:sourceHeight:destinationPixelFormat:", codecType, objc_msgSend(v9, "outputWidth", v12), objc_msgSend(v9, "outputHeight"), codecType);
    v13 = +[BWVideoFormat pixelBufferAttachmentsForColorSpaceProperties:](BWVideoFormat, "pixelBufferAttachmentsForColorSpaceProperties:", v12);
    v14 = v10 | (unint64_t)(v11 << 32);
    -[BWPhotoEncoderController _cropRectForRequestedSettings:inputDimensions:metadata:processingFlags:](self, "_cropRectForRequestedSettings:inputDimensions:metadata:processingFlags:", v9, v14, a4, -[BWStillImageProcessorControllerInput processingFlagsForPrewarming](-[BWStillImageProcessorControllerRequest input](-[BWStillImageProcessorController currentRequest](self, "currentRequest"), "input"), "processingFlagsForPrewarming"));
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;
    if (-[BWStillImageProcessorControllerInput requiresPhotosAdjustment](-[BWStillImageProcessorControllerRequest input](-[BWStillImageProcessorController currentRequest](self, "currentRequest"), "input"), "requiresPhotosAdjustment"))
    {
      v54.origin.x = v16;
      v54.origin.y = v18;
      v54.size.width = v20;
      v54.size.height = v22;
      if (!CGRectIsEmpty(v54))
      {
        v10 = (int)v20;
        LODWORD(v11) = (int)v22;
      }
    }
    v23 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    extensions = v13;
    if (!CMVideoFormatDescriptionCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], codecType, v10, v11, v13, &formatDescriptionOut))
    {
      v41 = *MEMORY[0x1E0D09390];
      objc_msgSend(v8, "setObject:forKeyedSubscript:", formatDescriptionOut);
      v24 = BWPhotoEncoderCodecTypeForEncodingScheme(v6);
      v25 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v24);
      v26 = *MEMORY[0x1E0D09378];
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v25, *MEMORY[0x1E0D09378]);
      if (-[BWPhotoEncoderControllerConfiguration usesHighEncodingPriority](self->_configuration, "usesHighEncodingPriority"))
      {
        objc_msgSend(v8, "setObject:forKeyedSubscript:", &unk_1E49FB3B8, *MEMORY[0x1E0D09400]);
      }
      v27 = objc_msgSend((id)objc_msgSend(a5, "captureSettings"), "learnedNRStereoPhotoFrameFlag");
      v43 = v27;
      if (a4 || v27)
      {
        if (v27)
          objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D093F8]);
        objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D09428]);
      }
      if (-[BWStillImageProcessorControllerInput requiresPhotosAdjustment](-[BWStillImageProcessorControllerRequest input](-[BWStillImageProcessorController currentRequest](self, "currentRequest"), "input"), "requiresPhotosAdjustment"))
      {
        objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D09350]);
        v28 = objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D05E50]);
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v28, *MEMORY[0x1E0D093B8]);
      }
      v29 = objc_msgSend(a5, "captureSettings");
      BYTE1(v39) = 1;
      LOBYTE(v39) = self->_heifUseTiling;
      -[BWPhotoEncoderController _addQualityOptionsToDictionary:codecType:pixelBuffer:imageDimensions:metadata:requestedStillImageCaptureSettings:resolvedStillImageCaptureSettings:enableHEIFTiling:enableHEIFOrientation:auxImageType:](self, "_addQualityOptionsToDictionary:codecType:pixelBuffer:imageDimensions:metadata:requestedStillImageCaptureSettings:resolvedStillImageCaptureSettings:enableHEIFTiling:enableHEIFOrientation:auxImageType:", v8, v24, 0, v14, a4, v9, v29, v39);
      v51 = 0;
      v49 = 0;
      v50 = 0;
      if (BWPhotoEncoderThumbnailEnabled(v6, v9, &v51, &v50, &v49))
      {
        if ((-[BWStillImageProcessorControllerInput requiresPhotosAdjustment](-[BWStillImageProcessorControllerRequest input](-[BWStillImageProcessorController currentRequest](self, "currentRequest"), "input"), "requiresPhotosAdjustment") & 1) == 0)
        {
          v30 = FigCaptureUncompressedPixelFormatForPixelFormat(codecType);
          if (!CMVideoFormatDescriptionCreate(v23, v30, v50, SHIDWORD(v50), extensions, &v53))
          {
            v31 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
            objc_msgSend(v31, "setObject:forKeyedSubscript:", v53, v41);
            objc_msgSend(v31, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v51), v26);
            if (-[BWPhotoEncoderControllerConfiguration usesHighEncodingPriority](self->_configuration, "usesHighEncodingPriority"))
            {
              objc_msgSend(v31, "setObject:forKeyedSubscript:", &unk_1E49FB3B8, *MEMORY[0x1E0D09400]);
            }
            v32 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BWStillImageProcessorControllerConfiguration figThreadPriority](self->_configuration, "figThreadPriority"));
            objc_msgSend(v31, "setObject:forKeyedSubscript:", v32, *MEMORY[0x1E0D09438]);
            v33 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v49);
            objc_msgSend(v31, "setObject:forKeyedSubscript:", v33, *MEMORY[0x1E0D093E0]);
            v34 = v51;
            v35 = objc_msgSend(a5, "captureSettings");
            LOWORD(v40) = 0;
            -[BWPhotoEncoderController _addQualityOptionsToDictionary:codecType:pixelBuffer:imageDimensions:metadata:requestedStillImageCaptureSettings:resolvedStillImageCaptureSettings:enableHEIFTiling:enableHEIFOrientation:auxImageType:](self, "_addQualityOptionsToDictionary:codecType:pixelBuffer:imageDimensions:metadata:requestedStillImageCaptureSettings:resolvedStillImageCaptureSettings:enableHEIFTiling:enableHEIFOrientation:auxImageType:", v31, v34, 0, v50, 0, v9, v35, v40);
            objc_msgSend(v8, "setObject:forKeyedSubscript:", v31, *MEMORY[0x1E0D093C8]);
          }
        }
      }
      v48 = -[BWStillImageProcessorControllerInput reservedPrimaryImageHandle](-[BWStillImageProcessorControllerRequest input](-[BWStillImageProcessorController currentRequest](self, "currentRequest"), "input"), "reservedPrimaryImageHandle");
      if (!objc_msgSend(v44, "addMainImage:metadata:options:imageHandleOut:", 0, 0, v8, &v48))
      {
        -[BWStillImageProcessorControllerInput setReservedPrimaryImageHandle:](-[BWStillImageProcessorControllerRequest input](-[BWStillImageProcessorController currentRequest](self, "currentRequest"), "input"), "setReservedPrimaryImageHandle:", v48);
        objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[BWPhotoEncoderControllerConfiguration attachedMediaConfigurationByAttachedMediaKey](self->_configuration, "attachedMediaConfigurationByAttachedMediaKey"), "objectForKeyedSubscript:", 0x1E4936818), "mainImageDownscalingFactor");
        v37 = v36;
        v38 = -[FigCaptureCameraParameters gainMapVersion](+[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance"), "gainMapVersion");
        if (v37 != 0.0 && v43 && v38 >= 2)
        {
          v47 = -[BWStillImageProcessorControllerInput toneMapAlternateGroupHandle](-[BWStillImageProcessorControllerRequest input](-[BWStillImageProcessorController currentRequest](self, "currentRequest"), "input"), "toneMapAlternateGroupHandle");
          objc_msgSend(v44, "addAlternateImageWithDerivedImageHandles:options:parentImageHandle:alternateGroupHandleInOut:", 0, 0, 0, &v47);
          -[BWStillImageProcessorControllerInput setToneMapAlternateGroupHandle:](-[BWStillImageProcessorControllerRequest input](-[BWStillImageProcessorController currentRequest](self, "currentRequest"), "input"), "setToneMapAlternateGroupHandle:", v47);
        }
      }
    }
  }
  if (v53)
    CFRelease(v53);
  if (formatDescriptionOut)
    CFRelease(formatDescriptionOut);
}

- (void)_handlePrewarmForDepthForEncodingScheme:(int)a3 requestedStillImageCaptureSettings:(id)a4 prewarmingMetadata:(id)a5
{
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  int32_t v15;
  int32_t v16;
  OSStatus v17;
  CMVideoFormatDescriptionRef v18;
  uint64_t v19;
  uint64_t v20;
  CMVideoFormatDescriptionRef formatDescriptionOut;

  formatDescriptionOut = 0;
  v8 = -[BWPhotoEncoderController _encoderManagerForEncodingScheme:](self, "_encoderManagerForEncodingScheme:", *(_QWORD *)&a3);
  if (v8)
  {
    v9 = v8;
    if (objc_msgSend(a4, "depthDataDeliveryEnabled"))
    {
      if (objc_msgSend(a4, "embedsDepthDataInImage"))
      {
        v10 = -[NSDictionary objectForKeyedSubscript:](self->_resolvedVideoFormatsByAttachedMediaKey, "objectForKeyedSubscript:", CFSTR("Depth"));
        v11 = BWPhotoEncoderAuxImageTypeForDepthPixelFormat(objc_msgSend(v10, "pixelFormat"));
        if ((_DWORD)v11)
        {
          v12 = v11;
          v13 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          if ((objc_msgSend(a4, "depthDataFiltered") & 1) == 0)
          {
            if (FigDepthFormatIs16Bit(objc_msgSend(v10, "pixelFormat")))
              v14 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", 0x7FFFLL);
            else
              v14 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2143289344);
            objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0D09360]);
          }
          v15 = objc_msgSend(v10, "width");
          v16 = objc_msgSend(v10, "height");
          v17 = CMVideoFormatDescriptionCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], objc_msgSend(v10, "pixelFormat"), v15, v16, 0, &formatDescriptionOut);
          v18 = formatDescriptionOut;
          if (!v17)
          {
            objc_msgSend(v13, "setObject:forKeyedSubscript:", formatDescriptionOut, *MEMORY[0x1E0D09390]);
            if (-[BWStillImageProcessorControllerInput requiresPhotosAdjustment](-[BWStillImageProcessorControllerRequest input](-[BWStillImageProcessorController currentRequest](self, "currentRequest"), "input"), "requiresPhotosAdjustment"))
            {
              objc_msgSend(v13, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D09350]);
              v19 = objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0D05E50]);
              objc_msgSend(v13, "setObject:forKeyedSubscript:", v19, *MEMORY[0x1E0D093B8]);
            }
            if (-[BWPhotoEncoderControllerConfiguration usesHighEncodingPriority](self->_configuration, "usesHighEncodingPriority"))
            {
              objc_msgSend(v13, "setObject:forKeyedSubscript:", &unk_1E49FB3B8, *MEMORY[0x1E0D09400]);
            }
            v20 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BWStillImageProcessorControllerConfiguration figThreadPriority](self->_configuration, "figThreadPriority"));
            objc_msgSend(v13, "setObject:forKeyedSubscript:", v20, *MEMORY[0x1E0D09438]);
            objc_msgSend(v9, "addAuxImage:type:auxImageMetadata:options:parentImageHandle:auxImageHandleOut:", 0, v12, 0, v13, 0, 0);
            v18 = formatDescriptionOut;
          }
          if (v18)
            CFRelease(v18);
        }
      }
    }
  }
}

- (void)_handlePrewarmForGainMapForEncodingScheme:(int)a3 requestedStillImageCaptureSettings:(id)a4 prewarmingMetadata:(id)a5
{
  id v8;
  id v9;
  float v10;
  float v11;
  int32_t v12;
  int32_t v13;
  void *v14;
  uint64_t v15;
  const __CFDictionary *v16;
  OSStatus v17;
  CMVideoFormatDescriptionRef v18;
  void *v19;
  CMVideoFormatDescriptionRef formatDescriptionOut;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  formatDescriptionOut = 0;
  v8 = -[BWPhotoEncoderController _encoderManagerForEncodingScheme:](self, "_encoderManagerForEncodingScheme:", *(_QWORD *)&a3);
  if (v8)
  {
    v19 = v8;
    v9 = -[NSDictionary objectForKeyedSubscript:](self->_resolvedVideoFormatsByAttachedMediaKey, "objectForKeyedSubscript:", 0x1E4936818);
    objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[BWPhotoEncoderControllerConfiguration attachedMediaConfigurationByAttachedMediaKey](self->_configuration, "attachedMediaConfigurationByAttachedMediaKey"), "objectForKeyedSubscript:", 0x1E4936818), "mainImageDownscalingFactor");
    v11 = v10;
    v12 = (int)(float)((float)objc_msgSend(a4, "outputWidth") / v10);
    v13 = (int)(float)((float)objc_msgSend(a4, "outputHeight") / v11);
    v14 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", BWPhotoEncoderEncodingOptionsForAuxiliaryImage(v12, v13, (void *)objc_msgSend(v9, "pixelBufferAttributes"), -[BWPhotoEncoderControllerConfiguration usesHighEncodingPriority](self->_configuration, "usesHighEncodingPriority"), -[BWStillImageProcessorControllerConfiguration figThreadPriority](self->_configuration, "figThreadPriority")));
    if (-[BWStillImageProcessorControllerInput requiresPhotosAdjustment](-[BWStillImageProcessorControllerRequest input](-[BWStillImageProcessorController currentRequest](self, "currentRequest"), "input"), "requiresPhotosAdjustment"))
    {
      objc_msgSend(v14, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D09350]);
      v15 = objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0D05E50]);
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0D093B8]);
      v21 = *MEMORY[0x1E0CA8E98];
      v22[0] = *MEMORY[0x1E0CA8EE0];
      v16 = (const __CFDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
    }
    else
    {
      v16 = 0;
    }
    v17 = CMVideoFormatDescriptionCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], objc_msgSend(v9, "pixelFormat"), v12, v13, v16, &formatDescriptionOut);
    v18 = formatDescriptionOut;
    if (!v17)
    {
      objc_msgSend(v14, "setObject:forKeyedSubscript:", formatDescriptionOut, *MEMORY[0x1E0D09390]);
      BWPhotoEncoderAddGainMapQualityControllerParametersToEncodingOptions(v14);
      objc_msgSend(v19, "addAuxImage:type:auxImageMetadata:options:parentImageHandle:auxImageHandleOut:", 0, 1, 0, v14, 0, 0);
      v18 = formatDescriptionOut;
    }
    if (v18)
      CFRelease(v18);
  }
}

- (void)_handlePrewarmForPortraitEffectsMatteForEncodingScheme:(int)a3 requestedStillImageCaptureSettings:(id)a4
{
  id v6;
  id v7;
  float v8;
  float v9;
  int32_t v10;
  int32_t v11;
  void *v12;
  const __CFDictionary *v13;
  OSStatus v14;
  CMVideoFormatDescriptionRef v15;
  void *v16;
  CMVideoFormatDescriptionRef formatDescriptionOut;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  formatDescriptionOut = 0;
  v6 = -[BWPhotoEncoderController _encoderManagerForEncodingScheme:](self, "_encoderManagerForEncodingScheme:", *(_QWORD *)&a3);
  if (v6)
  {
    v16 = v6;
    v7 = -[NSDictionary objectForKeyedSubscript:](self->_resolvedVideoFormatsByAttachedMediaKey, "objectForKeyedSubscript:", 0x1E495AF38);
    objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[BWPhotoEncoderControllerConfiguration attachedMediaConfigurationByAttachedMediaKey](self->_configuration, "attachedMediaConfigurationByAttachedMediaKey"), "objectForKeyedSubscript:", 0x1E495AF38), "mainImageDownscalingFactor");
    if (v8 == 0.0)
      v9 = 1.0;
    else
      v9 = v8;
    v10 = (int)(float)((float)objc_msgSend(a4, "outputWidth") / v9);
    v11 = (int)(float)((float)objc_msgSend(a4, "outputHeight") / v9);
    v12 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", BWPhotoEncoderEncodingOptionsForAuxiliaryImage(v10, v11, (void *)objc_msgSend(v7, "pixelBufferAttributes"), -[BWPhotoEncoderControllerConfiguration usesHighEncodingPriority](self->_configuration, "usesHighEncodingPriority"), -[BWStillImageProcessorControllerConfiguration figThreadPriority](self->_configuration, "figThreadPriority")));
    v18 = *MEMORY[0x1E0CA8E98];
    v19[0] = *MEMORY[0x1E0CA8EB8];
    v13 = (const __CFDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v14 = CMVideoFormatDescriptionCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], objc_msgSend(v7, "pixelFormat"), v10, v11, v13, &formatDescriptionOut);
    v15 = formatDescriptionOut;
    if (!v14)
    {
      objc_msgSend(v12, "setObject:forKeyedSubscript:", formatDescriptionOut, *MEMORY[0x1E0D09390]);
      objc_msgSend(v16, "addAuxImage:type:auxImageMetadata:options:parentImageHandle:auxImageHandleOut:", 0, 4, 0, v12, 0, 0);
      v15 = formatDescriptionOut;
    }
    if (v15)
      CFRelease(v15);
  }
}

- (void)_handlePrewarmForConstantColorConfidenceMapForEncodingScheme:(int)a3 requestedStillImageCaptureSettings:(id)a4 confidenceMapDimensions:(id)a5
{
  id v7;
  void *v8;
  id v9;
  CMVideoFormatDescriptionRef formatDescriptionOut;

  formatDescriptionOut = 0;
  v9 = -[BWPhotoEncoderController _encoderManagerForEncodingScheme:](self, "_encoderManagerForEncodingScheme:", *(_QWORD *)&a3, a4);
  if (v9)
  {
    v7 = -[NSDictionary objectForKeyedSubscript:](self->_resolvedVideoFormatsByAttachedMediaKey, "objectForKeyedSubscript:", 0x1E495B438);
    v8 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", BWPhotoEncoderEncodingOptionsForAuxiliaryImage(a5.var0, *(uint64_t *)&a5 >> 32, (void *)objc_msgSend(v7, "pixelBufferAttributes"), -[BWPhotoEncoderControllerConfiguration usesHighEncodingPriority](self->_configuration, "usesHighEncodingPriority"), -[BWStillImageProcessorControllerConfiguration figThreadPriority](self->_configuration, "figThreadPriority")));
    if (!CMVideoFormatDescriptionCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], objc_msgSend(v7, "pixelFormat"), a5.var0, a5.var1, 0, &formatDescriptionOut))
    {
      objc_msgSend(v8, "setObject:forKeyedSubscript:", formatDescriptionOut, *MEMORY[0x1E0D09390]);
      objc_msgSend(v9, "addAuxImage:type:auxImageMetadata:options:parentImageHandle:auxImageHandleOut:", 0, 11, 0, v8, 0, 0);
    }
  }
}

- (void)_prewarmAndReserveMainImageHandleForEncodingScheme:(int)a3 prewarmingMetadata:(id)a4 stillImageSettings:(id)a5
{
  void *v5;
  id v9;
  uint64_t v10;
  int v11;
  int v12;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  _QWORD v14[2];
  _QWORD v15[5];

  v15[2] = *MEMORY[0x1E0C80C00];
  if (a3 == 2)
  {
    v9 = -[BWPhotoEncoderController _encoderManagerForEncodingScheme:](self, "_encoderManagerForEncodingScheme:");
    v5 = v9;
    if (v9)
    {
      if ((objc_msgSend(v9, "isContainerOpen") & 1) == 0)
      {
        v10 = *MEMORY[0x1E0D09308];
        v14[0] = *MEMORY[0x1E0D09318];
        v14[1] = v10;
        v15[0] = &unk_1E49FB3D0;
        v15[1] = &unk_1E49FB3E8;
        v11 = objc_msgSend(v5, "openContainerWithOptions:settingsID:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2), objc_msgSend((id)objc_msgSend(a5, "requestedSettings"), "settingsID"));
        if (v11)
        {
          v12 = v11;
          goto LABEL_8;
        }
      }
      -[BWPhotoEncoderController _handlePrewarmForMainImageForEncodingScheme:prewarmingMetadata:stillImageSettings:](self, "_handlePrewarmForMainImageForEncodingScheme:prewarmingMetadata:stillImageSettings:", 2, a4, a5);
    }
    v12 = 0;
  }
  else
  {
    v12 = 0;
  }
LABEL_8:
  if (dword_1ECFE9A10)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (v12)
  {
    if (objc_msgSend(v5, "isContainerOpen"))
      objc_msgSend(v5, "closeContainer");
  }
}

- (void)_releaseResources
{
  opaqueCMFormatDescription *inferenceInputFormatDescription;
  __CVBuffer *smartStyleDeltaMapPixelBuffer;
  __CVBuffer *smartStyleDecompressedStyledPixelBuffer;

  self->_prewarmQueue = 0;
  self->_previewGenerationQueue = 0;

  self->_cmPhotoEncoderManager = 0;
  self->_dngEncoderManager = 0;

  self->_jpegPixelConverter = 0;
  self->_previewGenerationGroup = 0;

  self->_previewPixelConverter = 0;
  self->_inferenceGroup = 0;

  self->_thumbnailPixelConverter = 0;
  self->_clientThumbnailPixelConverter = 0;

  self->_inferenceEngine = 0;
  self->_inferenceInputVideoFormat = 0;
  inferenceInputFormatDescription = self->_inferenceInputFormatDescription;
  if (inferenceInputFormatDescription)
  {
    CFRelease(inferenceInputFormatDescription);
    self->_inferenceInputFormatDescription = 0;
  }

  self->_smartStyleProcessor = 0;
  smartStyleDeltaMapPixelBuffer = self->_smartStyleDeltaMapPixelBuffer;
  if (smartStyleDeltaMapPixelBuffer)
  {
    CFRelease(smartStyleDeltaMapPixelBuffer);
    self->_smartStyleDeltaMapPixelBuffer = 0;
  }
  smartStyleDecompressedStyledPixelBuffer = self->_smartStyleDecompressedStyledPixelBuffer;
  if (smartStyleDecompressedStyledPixelBuffer)
  {
    CFRelease(smartStyleDecompressedStyledPixelBuffer);
    self->_smartStyleDecompressedStyledPixelBuffer = 0;
  }

  self->_encodingQueue = 0;
  self->_encodingGroup = 0;
}

- (id)_encoderManagerForEncodingScheme:(int)a3
{
  if ((a3 - 1) > 3)
    return 0;
  else
    return *(Class *)((char *)&self->super.super.isa + *off_1E4925A80[a3 - 1]);
}

- (int)_loadCreateAndSetupSmartStyleRenderingProcessor
{
  CMISmartStyleProcessor **p_smartStyleProcessor;
  int v3;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __75__BWPhotoEncoderController__loadCreateAndSetupSmartStyleRenderingProcessor__block_invoke;
  v5[3] = &unk_1E49204F0;
  v5[4] = self;
  p_smartStyleProcessor = &self->_smartStyleProcessor;
  v3 = BWLoadCreateAndSetupMetalImageBufferProcessor((uint64_t)CFSTR("SmartStyle"), -[BWPhotoEncoderControllerConfiguration smartStyleRenderingVersion](self->_configuration, "smartStyleRenderingVersion"), (uint64_t)CFSTR("CMI"), (uint64_t)CFSTR("SmartStyle"), -[BWPhotoEncoderControllerConfiguration smartStyleRenderingVersion](self->_configuration, "smartStyleRenderingVersion"), (uint64_t)&unk_1EE727A98, 0, 0, 0, (uint64_t)v5, &self->_smartStyleProcessor);
  if (!v3)
    -[CMISmartStyleProcessor setUseLiveMetalAllocations:](*p_smartStyleProcessor, "setUseLiveMetalAllocations:", 1);
  return v3;
}

uint64_t __75__BWPhotoEncoderController__loadCreateAndSetupSmartStyleRenderingProcessor__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  const __CFString *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "deferredPhotoProcessorEnabled");
  v5 = CFSTR("EncoderNode");
  if (v4)
    v5 = CFSTR("EncoderNode-Deferred");
  objc_msgSend(a2, "setInstanceLabel:", objc_msgSend(v3, "stringWithFormat:", CFSTR("%@"), v5));
  return 0;
}

- (BOOL)_depthEncodingNeededForSettings:(id)a3 deferredPhotoProxy:(BOOL)a4
{
  _BOOL4 v4;
  char v6;
  int v7;
  int v8;
  unint64_t v9;
  _BOOL4 v10;

  v4 = a4;
  v6 = objc_msgSend((id)-[BWStillImageProcessorControllerInput encodedAttachedMediaKeys](-[BWStillImageProcessorControllerRequest input](-[BWStillImageProcessorController currentRequest](self, "currentRequest"), "input"), "encodedAttachedMediaKeys"), "containsObject:", CFSTR("Depth"));
  if (objc_msgSend((id)objc_msgSend(a3, "requestedSettings"), "depthDataDeliveryEnabled"))
    v7 = objc_msgSend((id)objc_msgSend(a3, "requestedSettings"), "embedsDepthDataInImage");
  else
    v7 = 0;
  v8 = BWCIFilterArrayContainsPortraitFilters((void *)objc_msgSend((id)objc_msgSend(a3, "requestedSettings"), "processedImageFilters"));
  v9 = objc_msgSend((id)objc_msgSend(a3, "captureSettings"), "captureFlags");
  if ((v6 & 1) != 0)
    LOBYTE(v10) = 0;
  else
    return v7 & (!v4 | v8) | (v9 >> 38) & 1;
  return v10;
}

- (BOOL)_personMaskEncodingNeededForSettings:(id)a3 encodingScheme:(int)a4 deferredPhotoProxy:(BOOL)a5 adjustedPhoto:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  char v11;
  char v12;
  char v13;
  BOOL IsLinDNGEncodingScheme;
  BOOL v15;
  char v16;

  v6 = a6;
  v7 = a5;
  v11 = objc_msgSend((id)-[BWStillImageProcessorControllerInput encodedAttachedMediaKeys](-[BWStillImageProcessorControllerRequest input](-[BWStillImageProcessorController currentRequest](self, "currentRequest"), "input"), "encodedAttachedMediaKeys"), "containsObject:", 0x1E495AF38);
  if (objc_msgSend((id)objc_msgSend(a3, "requestedSettings"), "portraitEffectsMatteDeliveryEnabled"))
    v12 = objc_msgSend((id)objc_msgSend(a3, "requestedSettings"), "embedsPortraitEffectsMatteInImage");
  else
    v12 = 0;
  v13 = BWCIFilterArrayContainsPortraitFilters((void *)objc_msgSend((id)objc_msgSend(a3, "requestedSettings"), "processedImageFilters"));
  IsLinDNGEncodingScheme = BWPhotoEncoderIsLinDNGEncodingScheme(a4);
  if (-[BWPhotoEncoderController _smartStyleReversibilityDataNeededForSettings:adjustedPhoto:deferredPhotoProxy:](self, "_smartStyleReversibilityDataNeededForSettings:adjustedPhoto:deferredPhotoProxy:", a3, v6, v7))
  {
    v15 = -[NSDictionary objectForKeyedSubscript:](-[BWPhotoEncoderControllerConfiguration attachedMediaConfigurationByAttachedMediaKey](self->_configuration, "attachedMediaConfigurationByAttachedMediaKey"), "objectForKeyedSubscript:", 0x1E495AF38) != 0;
  }
  else
  {
    v15 = 0;
  }
  v16 = v12 & (!v7 | v13) | (IsLinDNGEncodingScheme || v15);
  if ((v11 & 1) != 0)
    return 0;
  else
    return v16;
}

- (id)_semanticSegmentationMatteMediaKeysEncodingNeededForSettings:(id)a3 encodingScheme:(int)a4 deferredPhotoProxy:(BOOL)a5 adjustedPhoto:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  void *v11;
  int v12;
  int v13;
  _BOOL4 IsLinDNGEncodingScheme;
  _BOOL4 v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const __CFString *v21;
  NSDictionary *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v6 = a6;
  v7 = a5;
  v39 = *MEMORY[0x1E0C80C00];
  v11 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "requestedSettings"), "enabledSemanticSegmentationMatteURNs"), "count"))
  {
    v12 = objc_msgSend((id)objc_msgSend(a3, "requestedSettings"), "embedsSemanticSegmentationMattesInImage");
  }
  else
  {
    v12 = 0;
  }
  v13 = BWCIFilterArrayContainsPortraitFilters((void *)objc_msgSend((id)objc_msgSend(a3, "requestedSettings"), "processedImageFilters"));
  IsLinDNGEncodingScheme = BWPhotoEncoderIsLinDNGEncodingScheme(a4);
  v15 = -[BWPhotoEncoderController _smartStyleReversibilityDataNeededForSettings:adjustedPhoto:deferredPhotoProxy:](self, "_smartStyleReversibilityDataNeededForSettings:adjustedPhoto:deferredPhotoProxy:", a3, v6, v7);
  if (v12)
  {
    if (!v7 | v13)
    {
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      v16 = (void *)objc_msgSend((id)objc_msgSend(a3, "requestedSettings"), "enabledSemanticSegmentationMatteURNs");
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v34;
        do
        {
          v20 = 0;
          do
          {
            if (*(_QWORD *)v34 != v19)
              objc_enumerationMutation(v16);
            v21 = BWPhotoEncoderAttachedMediaKeyForSemanticSegmentationMatteURN(*(void **)(*((_QWORD *)&v33 + 1)
                                                                                         + 8 * v20));
            if ((objc_msgSend((id)-[BWStillImageProcessorControllerInput encodedAttachedMediaKeys](-[BWStillImageProcessorControllerRequest input](-[BWStillImageProcessorController currentRequest](self, "currentRequest"), "input"), "encodedAttachedMediaKeys"), "containsObject:", v21) & 1) == 0)objc_msgSend(v11, "addObject:", v21);
            ++v20;
          }
          while (v18 != v20);
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
        }
        while (v18);
      }
    }
  }
  if (IsLinDNGEncodingScheme || v15)
  {
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v22 = -[BWPhotoEncoderControllerConfiguration attachedMediaConfigurationByAttachedMediaKey](self->_configuration, "attachedMediaConfigurationByAttachedMediaKey", 0);
    v23 = -[NSDictionary countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v30;
      do
      {
        v26 = 0;
        do
        {
          if (*(_QWORD *)v30 != v25)
            objc_enumerationMutation(v22);
          v27 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v26);
          if ((objc_msgSend((id)-[BWStillImageProcessorControllerInput encodedAttachedMediaKeys](-[BWStillImageProcessorControllerRequest input](-[BWStillImageProcessorController currentRequest](self, "currentRequest"), "input"), "encodedAttachedMediaKeys"), "containsObject:", v27) & 1) == 0&& objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[BWPhotoEncoderControllerConfiguration attachedMediaConfigurationByAttachedMediaKey](self->_configuration, "attachedMediaConfigurationByAttachedMediaKey"), "objectForKeyedSubscript:", v27), "requiresEncoding")&& BWPhotoEncoderSemanticSegmentationMatteURNForAttachedMediaKey(v27))
          {
            objc_msgSend(v11, "addObject:", v27);
          }
          ++v26;
        }
        while (v24 != v26);
        v24 = -[NSDictionary countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      }
      while (v24);
    }
  }
  return v11;
}

- (BOOL)_smartStyleReversibilityDataNeededForSettings:(id)a3 adjustedPhoto:(BOOL)a4 deferredPhotoProxy:(BOOL)a5
{
  _BOOL4 v8;

  v8 = -[BWPhotoEncoderControllerConfiguration smartStyleReversibilityEnabled](self->_configuration, "smartStyleReversibilityEnabled");
  if (v8)
  {
    if (objc_msgSend((id)objc_msgSend(a3, "requestedSettings"), "smartStyleReversibilitySupported"))
      LOBYTE(v8) = !a4 && !a5;
    else
      LOBYTE(v8) = 0;
  }
  return v8;
}

- (BOOL)_finalImageExpectingSmartStyleReversibilityDataForDeferredPhotoProxy:(BOOL)a3 settings:(id)a4 adjustedPhoto:(BOOL)a5
{
  _BOOL4 v7;

  if (a3)
  {
    v7 = -[BWPhotoEncoderControllerConfiguration smartStyleReversibilityEnabled](self->_configuration, "smartStyleReversibilityEnabled");
    if (v7)
      LOBYTE(v7) = objc_msgSend((id)objc_msgSend(a4, "requestedSettings"), "smartStyleReversibilitySupported") & !a5;
  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (void)_performInferenceWithBuffer:(opaqueCMSampleBuffer *)a3
{
  NSObject *inferenceGroup;
  NSObject *previewGenerationQueue;
  _QWORD v5[6];

  inferenceGroup = self->_inferenceGroup;
  previewGenerationQueue = self->_previewGenerationQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__BWPhotoEncoderController__performInferenceWithBuffer___block_invoke;
  v5[3] = &unk_1E491F158;
  v5[4] = self;
  v5[5] = a3;
  dispatch_group_async(inferenceGroup, previewGenerationQueue, v5);
}

uint64_t __56__BWPhotoEncoderController__performInferenceWithBuffer___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 192))
    goto LABEL_5;
  result = objc_msgSend(*(id *)(v2 + 184), "prepareForInputVideoFormat:attachedMediaKey:", objc_msgSend(*(id *)(v2 + 88), "outputFormat"), CFSTR("PrimaryFormat"));
  if (!(_DWORD)result)
  {
    result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "prepareForInferenceWithFormatProvider:");
    if (!(_DWORD)result)
    {
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 192) = 1;
      v2 = *(_QWORD *)(a1 + 32);
LABEL_5:
      result = objc_msgSend(*(id *)(v2 + 184), "performInferencesOnSampleBuffer:attachingResultsToSampleBuffer:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 40));
    }
  }
  atomic_store(1u, (unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 193));
  return result;
}

- (CGRect)_cropRectForRequestedSettings:(id)a3 inputDimensions:(id)a4 metadata:(id)a5 processingFlags:(unsigned int)a6
{
  __int128 *v10;
  CGFloat v11;
  CGFloat v12;
  double v13;
  double v14;
  int v15;
  unint64_t v16;
  double v17;
  double v18;
  CGFloat x;
  CGFloat y;
  double width;
  double height;
  BOOL v23;
  _BOOL4 v24;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  __int128 v31;
  __int128 v32;
  CGRect v33;
  CGRect result;

  v10 = (__int128 *)MEMORY[0x1E0C9D648];
  v11 = *MEMORY[0x1E0C9D648];
  v12 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v14 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v13 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  if (!objc_msgSend((id)objc_msgSend(a3, "bravoConstituentImageDeliveryDeviceTypes"), "count"))
  {
    v30 = v12;
    if (FigCaptureVideoDimensionsAreValid(-[BWPhotoEncoderControllerConfiguration stereoPhotoOutputDimensions](self->_configuration, "stereoPhotoOutputDimensions"))&& -[BWStillImageProcessorControllerInput isStereoPhotoCapture](-[BWStillImageProcessorControllerRequest input](-[BWStillImageProcessorController currentRequest](self, "currentRequest"), "input"), "isStereoPhotoCapture")&& !BWPhotoEncoderIsPrimaryFrame(a6))
    {
      v15 = (int)-[BWPhotoEncoderControllerConfiguration stereoPhotoOutputDimensions](self->_configuration, "stereoPhotoOutputDimensions");
      v16 = (unint64_t)-[BWPhotoEncoderControllerConfiguration stereoPhotoOutputDimensions](self->_configuration, "stereoPhotoOutputDimensions") >> 32;
    }
    else
    {
      v15 = objc_msgSend(a3, "outputWidth");
      LODWORD(v16) = objc_msgSend(a3, "outputHeight");
    }
    v31 = *v10;
    v32 = v10[1];
    FigCFDictionaryGetCGRectIfPresent();
    -[BWPhotoEncoderController _aspectRatioAdjustmentFactorForSettings:](self, "_aspectRatioAdjustmentFactorForSettings:", a3);
    v18 = v17;
    FigCaptureMetadataUtilitiesComputeDenormalizedStillImageCropRect(a4.var0, *(uint64_t *)&a4 >> 32, *(CGFloat *)&v31, *((CGFloat *)&v31 + 1), *(CGFloat *)&v32, *((CGFloat *)&v32 + 1), (double)v15 / (double)(int)v16 * v17);
    x = v33.origin.x;
    y = v33.origin.y;
    width = v33.size.width;
    height = v33.size.height;
    if (CGRectIsNull(v33))
    {
      FigDebugAssert3();
      v12 = v30;
    }
    else
    {
      v23 = width == (double)v15 && height == (double)(int)v16;
      v24 = v23 && (v15 != a4.var0 || (_DWORD)v16 != a4.var1);
      v23 = v18 == 1.0;
      v12 = v30;
      if (!v23 || v24)
      {
        v13 = height;
        v14 = width;
        v12 = y;
        v11 = x;
      }
    }
  }
  v26 = v11;
  v27 = v12;
  v28 = v14;
  v29 = v13;
  result.size.height = v29;
  result.size.width = v28;
  result.origin.y = v27;
  result.origin.x = v26;
  return result;
}

- (void)_addQualityOptionsToDictionary:(id)a3 codecType:(unsigned int)a4 pixelBuffer:(__CVBuffer *)a5 imageDimensions:(id)a6 metadata:(id)a7 requestedStillImageCaptureSettings:(id)a8 resolvedStillImageCaptureSettings:(id)a9 enableHEIFTiling:(BOOL)a10 enableHEIFOrientation:(BOOL)a11 auxImageType:(int)a12
{
  BWPhotoEncoderController *v18;
  void *v19;
  void *v20;
  void *v21;
  float v22;
  float v23;
  uint64_t v24;
  void *v25;
  double v26;
  BWPhotoEncoderController *v27;
  NSDictionary *adaptiveQualityValueForHEIF;
  const __CFString *v29;
  float v30;
  float v31;
  uint64_t v32;
  int v33;
  BOOL v34;
  BOOL v35;
  id v36;
  uint64_t v37;
  float v38;
  float v39;
  double v40;
  void *v41;
  char v42;
  id v43;
  float v44;
  int var1;
  uint64_t v46;
  int v47;
  BOOL v48;
  _BOOL4 IsHighGainImage;
  void *v50;
  _QWORD *v51;
  float v52;
  uint64_t v53;
  _BOOL4 v54;
  void *v55;
  double v56;
  void *v57;
  int v58;
  void *v59;
  _BOOL4 IsExtensionDeviceType;
  uint64_t v61;
  void *v62;
  unsigned int v63;
  uint64_t v64;
  unsigned int v66;
  char v67;
  uint64_t v68;
  _QWORD v69[2];

  v69[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D093D8]);
  if (a4 == 1752589105)
  {
    v24 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a10);
    objc_msgSend(a3, "setObject:forKeyedSubscript:", v24, *MEMORY[0x1E0D09440]);
    v25 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v27 = self;
    adaptiveQualityValueForHEIF = self->_adaptiveQualityValueForHEIF;
    if (adaptiveQualityValueForHEIF)
    {
      if (a6.var1 * a6.var0 <= 11999999)
        v29 = CFSTR("Default");
      else
        v29 = CFSTR("12MPAndLarger");
      objc_msgSend(-[NSDictionary objectForKeyedSubscript:](adaptiveQualityValueForHEIF, "objectForKeyedSubscript:", v29), "floatValue");
      v31 = v30;
      v32 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
      objc_msgSend(v25, "setObject:forKeyedSubscript:", v32, *MEMORY[0x1E0D09618]);
    }
    else
    {
      v31 = 0.85;
    }
    v41 = v25;
    *(float *)&v26 = self->_heifQualityOverride;
    v42 = 0;
    v43 = a8;
    if (a12 == 12)
    {
      objc_msgSend(a8, "smartStyle", v26);
      v44 = BWPhotoEncoderHEIFDeltaMapDownscalingFactor();
      if (v44 > 1.0)
      {
        if (a6.var0 <= a6.var1)
          var1 = a6.var1;
        else
          var1 = a6.var0;
        v46 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", vcvts_n_u32_f32(floorf((float)((float)((float)(unint64_t)var1 / v44) + 63.0) * 0.015625), 6uLL));
        objc_msgSend(a3, "setObject:forKeyedSubscript:", v46, *MEMORY[0x1E0D093E0]);
      }
      v31 = BWPhotoEncoderHEIFDeltaMapQuality((void *)objc_msgSend(a8, "smartStyle"));
      v42 = 1;
    }
    if (v31 < 0.0)
      v31 = 0.0;
    v47 = objc_msgSend((id)objc_msgSend(a7, "objectForKeyedSubscript:", *MEMORY[0x1E0D05E60]), "intValue");
    if (a7)
      v48 = 1;
    else
      v48 = a5 == 0;
    if (!v48 || (v42 & 1) != 0 || v47 == 4)
    {
      v52 = fminf(v31, 1.0);
      v53 = *MEMORY[0x1E0D09418];
      if (v52 == 1.0)
      {
        objc_msgSend(a3, "setObject:forKeyedSubscript:", &unk_1E49FB418, v53);
        v54 = a11;
        v55 = v41;
LABEL_51:
        if (objc_msgSend(v55, "count"))
          objc_msgSend(a3, "setObject:forKeyedSubscript:", v55, *MEMORY[0x1E0D09410]);
        if (v54)
        {
          v57 = (void *)objc_msgSend(a9, "masterPortType");
          if ((objc_msgSend(v57, "isEqualToString:", *MEMORY[0x1E0D05A38]) & 1) != 0)
          {
            v58 = 1;
          }
          else
          {
            v59 = (void *)objc_msgSend(a9, "masterPortType");
            v58 = objc_msgSend(v59, "isEqualToString:", *MEMORY[0x1E0D05A50]);
          }
          IsExtensionDeviceType = BWDeviceTypeIsExtensionDeviceType(objc_msgSend((id)objc_msgSend(a7, "objectForKeyedSubscript:", *MEMORY[0x1E0D069B8]), "integerValue"));
          v61 = FigCaptureMetadataUtilitiesExifOrientationFromOrientationAndCameraPosition(objc_msgSend(v43, "outputOrientation"), objc_msgSend(v43, "outputMirroring"), v58, IsExtensionDeviceType, 0);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v62 = (void *)objc_msgSend(v43, "metadata");
            v63 = objc_msgSend((id)objc_msgSend(v62, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCFF0]), "intValue");
            if (v63)
              v61 = v63;
            else
              v61 = v61;
          }
          v64 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v61);
          objc_msgSend(a3, "setObject:forKeyedSubscript:", v64, *MEMORY[0x1E0D093B8]);
        }
        return;
      }
      objc_msgSend(a3, "setObject:forKeyedSubscript:", &unk_1E49FB400, v53);
      *(float *)&v56 = v52;
      v50 = (void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v56);
      v51 = (_QWORD *)MEMORY[0x1E0D09618];
    }
    else
    {
      IsHighGainImage = BWPhotoEncoderIsHighGainImage((_BOOL8)a7, objc_msgSend(a9, "captureType"), -[BWPhotoEncoderControllerConfiguration zeroShutterLagEnabled](v27->_configuration, "zeroShutterLagEnabled"));
      objc_msgSend(a3, "setObject:forKeyedSubscript:", &unk_1E49FB430, *MEMORY[0x1E0D09418]);
      if (IsHighGainImage)
        v50 = &unk_1E49FB3E8;
      else
        v50 = &unk_1E49FB400;
      v51 = (_QWORD *)MEMORY[0x1E0D09610];
    }
    v55 = v41;
    objc_msgSend(v41, "setObject:forKeyedSubscript:", v50, *v51);
    v54 = a11;
    goto LABEL_51;
  }
  if (a4 != 1785750887)
    return;
  v18 = self;
  v19 = (void *)objc_msgSend(a8, "vtCompressionProperties");
  v20 = (void *)objc_msgSend(v19, "objectForKeyedSubscript:", *MEMORY[0x1E0CED190]);
  v21 = v20;
  if (v20)
  {
    objc_msgSend(v20, "floatValue");
    v23 = v22;
  }
  else
  {
    v23 = 0.85;
  }
  v33 = objc_msgSend((id)objc_msgSend(a7, "objectForKeyedSubscript:", *MEMORY[0x1E0D05E60]), "intValue");
  if (a7)
    v34 = 1;
  else
    v34 = a5 == 0;
  if (!v34 || (!v21 ? (v35 = v33 == 4) : (v35 = 1), v35))
  {
    v38 = 0.0;
    if (v23 >= 0.0)
      v38 = v23;
    v39 = fminf(v38, 1.0);
    v36 = a3;
    objc_msgSend(a3, "setObject:forKeyedSubscript:", &unk_1E49FB400, *MEMORY[0x1E0D09418]);
    v68 = *MEMORY[0x1E0D09618];
    *(float *)&v40 = v39;
    v69[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v40);
    v37 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v69, &v68, 1);
    goto LABEL_25;
  }
  v67 = 0;
  v66 = 0;
  if (!BWPhotoEncoderDefaultJPEGIndexedQTable(a5, (_BOOL8)a7, objc_msgSend(a9, "captureType"), (int *)&v66, &v67, -[BWPhotoEncoderControllerConfiguration zeroShutterLagEnabled](v18->_configuration, "zeroShutterLagEnabled")))
  {
    v36 = a3;
    objc_msgSend(a3, "setObject:forKeyedSubscript:", &unk_1E49FB3E8, *MEMORY[0x1E0D09418]);
    v37 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v66);
LABEL_25:
    objc_msgSend(v36, "setObject:forKeyedSubscript:", v37, *MEMORY[0x1E0D09410]);
    return;
  }
  FigDebugAssert3();
}

- (int)_optionsForEncodingScheme:(int)a3 pixelBuffer:(__CVBuffer *)a4 imageDimensions:(id)a5 processingFlags:(unsigned int)a6 metadata:(id)a7 thumbnailOptions:(id)a8 requestedStillImageCaptureSettings:(id)a9 resolvedStillImageCaptureSettings:(id)a10 cropRect:(CGRect)a11 usePixelsOutsideCrop:(BOOL)a12 containerOptionsOut:(id *)a13 encodingOptionsOut:(id *)a14
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  uint64_t v21;
  void *v23;
  void *v24;
  CFDictionaryRef DictionaryRepresentation;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unsigned int v32;
  CGRect v34;
  CGRect v35;

  height = a11.size.height;
  width = a11.size.width;
  y = a11.origin.y;
  x = a11.origin.x;
  v21 = *(_QWORD *)&a3;
  v23 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", *(_QWORD *)&a3, a4, a5, *(_QWORD *)&a6);
  v24 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  if (-[BWPhotoEncoderController _encoderManagerForEncodingScheme:](self, "_encoderManagerForEncodingScheme:", v21))
  {
    v34.origin.x = x;
    v34.origin.y = y;
    v34.size.width = width;
    v34.size.height = height;
    if (!CGRectIsEmpty(v34))
    {
      v35.origin.x = x;
      v35.origin.y = y;
      v35.size.width = width;
      v35.size.height = height;
      DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v35);
      objc_msgSend(v24, "setObject:forKeyedSubscript:", DictionaryRepresentation, *MEMORY[0x1E0D09430]);
      if (DictionaryRepresentation)
        CFRelease(DictionaryRepresentation);
    }
    if (a12)
      objc_msgSend(v24, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D09458]);
    v26 = BWPhotoEncoderCodecTypeForEncodingScheme(v21);
    v27 = (_DWORD)v21 == 2 && self->_heifUseTiling;
    LOBYTE(v32) = v27;
    BYTE1(v32) = (_DWORD)v21 == 2;
    -[BWPhotoEncoderController _addQualityOptionsToDictionary:codecType:pixelBuffer:imageDimensions:metadata:requestedStillImageCaptureSettings:resolvedStillImageCaptureSettings:enableHEIFTiling:enableHEIFOrientation:auxImageType:](self, "_addQualityOptionsToDictionary:codecType:pixelBuffer:imageDimensions:metadata:requestedStillImageCaptureSettings:resolvedStillImageCaptureSettings:enableHEIFTiling:enableHEIFOrientation:auxImageType:", v24, v26, a4, a5, a7, a9, a10, v32);
    v28 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v26);
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v28, *MEMORY[0x1E0D09378]);
    if (-[BWPhotoEncoderControllerConfiguration usesHighEncodingPriority](self->_configuration, "usesHighEncodingPriority"))
    {
      objc_msgSend(v24, "setObject:forKeyedSubscript:", &unk_1E49FB3B8, *MEMORY[0x1E0D09400]);
    }
    v29 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BWStillImageProcessorControllerConfiguration figThreadPriority](self->_configuration, "figThreadPriority"));
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v29, *MEMORY[0x1E0D09438]);
    objc_msgSend(v23, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BWPhotoEncoderContainerFormatForEncodingScheme(v21)), *MEMORY[0x1E0D09318]);
    objc_msgSend(v23, "setObject:forKeyedSubscript:", &unk_1E49FB3E8, *MEMORY[0x1E0D09308]);
    if ((_DWORD)v21 == 1)
    {
      objc_msgSend(v24, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D093D8]);
      if (!objc_msgSend(a9, "payloadType"))
        objc_msgSend(v24, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D093B0]);
    }
    if (-[BWStillImageProcessorControllerInput requiresPhotosAdjustment](-[BWStillImageProcessorControllerRequest input](-[BWStillImageProcessorController currentRequest](self, "currentRequest"), "input"), "requiresPhotosAdjustment"))
    {
      objc_msgSend(v24, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D09350]);
      v30 = objc_msgSend(a7, "objectForKeyedSubscript:", *MEMORY[0x1E0D05E50]);
      objc_msgSend(v24, "setObject:forKeyedSubscript:", v30, *MEMORY[0x1E0D093B8]);
    }
    objc_msgSend(v24, "setObject:forKeyedSubscript:", a8, *MEMORY[0x1E0D093C8]);
  }
  if (a13)
    *a13 = v23;
  if (a14)
    *a14 = v24;
  return 0;
}

- (int)_encodePhotoForEncodingScheme:(int)a3 pixelBuffer:(__CVBuffer *)a4 imageDimensions:(id)a5 processingFlags:(unsigned int)a6 metadata:(id)a7 thumbnailOptions:(id)a8 requestedStillImageCaptureSettings:(id)a9 resolvedStillImageCaptureSettings:(id)a10 cropRect:(CGRect)a11 usePixelsOutsideCrop:(BOOL)a12 usedContainerOptionsOut:(id *)a13 usedEncodingOptionsOut:(id *)a14 mainImageHandleInOut:(int64_t *)a15
{
  uint64_t v17;
  double height;
  double width;
  double y;
  double x;
  uint64_t v23;
  int64_t *v25;
  id *v26;
  int64_t v27;
  id *v28;
  int v29;
  void *v30;
  int v31;
  uint64_t v32;
  int v33;
  int v34;
  __CVBuffer *v35;
  int v36;
  int v37;
  int IsLeftEyeFrameForCurrentRequest;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  BWStillImageProcessorControllerInput *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  int v47;
  double v48;
  void *v49;
  NSDictionary *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t i;
  int v55;
  float v56;
  uint64_t v57;
  void *v58;
  void *v59;
  double v60;
  double v61;
  double v62;
  id *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  int64_t *v67;
  int v68;
  int v69;
  BWStillImageProcessorControllerInput *v70;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  int v77;
  id v79;
  __int128 v80;
  int64_t v81;
  __int128 v82;
  int64_t v83;
  __int128 v84;
  int64_t v85;
  float v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  int64_t v91;
  id v92;
  void *v93;
  _QWORD v94[9];
  _QWORD v95[3];
  _BYTE v96[128];
  uint64_t v97;

  v17 = *(_QWORD *)&a6;
  height = a11.size.height;
  width = a11.size.width;
  y = a11.origin.y;
  x = a11.origin.x;
  v23 = *(_QWORD *)&a3;
  v25 = a15;
  v26 = a13;
  v97 = *MEMORY[0x1E0C80C00];
  v92 = 0;
  v93 = 0;
  if (a15)
    v27 = *a15;
  else
    v27 = -1;
  v28 = a14;
  v91 = v27;
  v79 = -[BWPhotoEncoderController _encoderManagerForEncodingScheme:](self, "_encoderManagerForEncodingScheme:", *(_QWORD *)&a3);
  if (!v79)
    goto LABEL_56;
  LOBYTE(v74) = a12;
  v29 = -[BWPhotoEncoderController _optionsForEncodingScheme:pixelBuffer:imageDimensions:processingFlags:metadata:thumbnailOptions:requestedStillImageCaptureSettings:resolvedStillImageCaptureSettings:cropRect:usePixelsOutsideCrop:containerOptionsOut:encodingOptionsOut:](self, "_optionsForEncodingScheme:pixelBuffer:imageDimensions:processingFlags:metadata:thumbnailOptions:requestedStillImageCaptureSettings:resolvedStillImageCaptureSettings:cropRect:usePixelsOutsideCrop:containerOptionsOut:encodingOptionsOut:", v23, a4, a5, v17, a7, a8, x, y, width, height, a9, a10, v74, &v93, &v92);
  if (v29)
  {
    v69 = v29;
    v73 = v76;
    LODWORD(v72) = v29;
    FigDebugAssert3();
    goto LABEL_70;
  }
  v30 = v79;
  v31 = objc_msgSend(v79, "isContainerOpen");
  if (!v31 || v27 == -1)
  {
    if (!v31)
      goto LABEL_13;
    if (-[BWStillImageProcessorControllerInput receivedFramesCount](-[BWStillImageProcessorControllerRequest input](-[BWStillImageProcessorController currentRequest](self, "currentRequest"), "input"), "receivedFramesCount") > 1|| (-[BWStillImageProcessorControllerInput isStereoPhotoCapture](-[BWStillImageProcessorControllerRequest input](-[BWStillImageProcessorController currentRequest](self, "currentRequest"), "input"), "isStereoPhotoCapture") & 1) != 0)
    {
      goto LABEL_14;
    }
    v33 = objc_msgSend(v79, "closeContainer");
    if (v33)
    {
      v69 = v33;
      v73 = v76;
      LODWORD(v72) = v33;
    }
    else
    {
LABEL_13:
      v34 = objc_msgSend(v79, "openContainerWithOptions:settingsID:", v93, objc_msgSend(a9, "settingsID"));
      if (!v34)
        goto LABEL_14;
      v69 = v34;
      v73 = v76;
      LODWORD(v72) = v34;
    }
LABEL_47:
    FigDebugAssert3();
    v28 = a14;
    goto LABEL_48;
  }
  v32 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", v27);
  objc_msgSend(v92, "setObject:forKeyedSubscript:", v32, *MEMORY[0x1E0D09408]);
LABEL_14:
  if (!-[BWStillImageProcessorControllerInput isStereoPhotoCapture](-[BWStillImageProcessorControllerRequest input](-[BWStillImageProcessorController currentRequest](self, "currentRequest"), "input"), "isStereoPhotoCapture"))
  {
    v35 = a4;
    v37 = 0;
    v77 = 0;
    v36 = 0;
    goto LABEL_38;
  }
  if (BWPhotoEncoderIsPrimaryFrame(v17))
  {
    v35 = a4;
    objc_msgSend(v92, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D093F8]);
    v77 = 0;
    v36 = 0;
    v37 = 1;
LABEL_38:
    v66 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BWStillImageProcessorControllerConfiguration figThreadPriority](self->_configuration, "figThreadPriority"));
    objc_msgSend(v92, "setObject:forKeyedSubscript:", v66, *MEMORY[0x1E0D09438]);
    if (v27 == -1)
      v67 = &v91;
    else
      v67 = 0;
    v68 = objc_msgSend(v30, "addMainImage:metadata:options:imageHandleOut:", v35, 0, v92, v67);
    if (v68 == -17109 || (v69 = v68) == 0)
    {
      v84 = 0uLL;
      v85 = 0;
      v70 = -[BWStillImageProcessorControllerRequest input](-[BWStillImageProcessorController currentRequest](self, "currentRequest"), "input");
      v28 = a14;
      if (v70)
      {
        -[BWStillImageProcessorControllerInput stereoPhotoImageHandles](v70, "stereoPhotoImageHandles");
        if (v37)
        {
LABEL_45:
          *(_QWORD *)&v84 = v91;
LABEL_55:
          v82 = v84;
          v83 = v85;
          v80 = v84;
          v81 = v85;
          -[BWStillImageProcessorControllerInput setStereoPhotoImageHandles:](-[BWStillImageProcessorControllerRequest input](-[BWStillImageProcessorController currentRequest](self, "currentRequest"), "input"), "setStereoPhotoImageHandles:", &v80);
LABEL_56:
          v69 = 0;
          goto LABEL_57;
        }
      }
      else
      {
        v84 = 0uLL;
        v85 = 0;
        if (v37)
          goto LABEL_45;
      }
      if (v77)
      {
        *((_QWORD *)&v84 + 1) = v91;
      }
      else if (v36)
      {
        v85 = v91;
      }
      goto LABEL_55;
    }
    v73 = v76;
    LODWORD(v72) = v68;
    goto LABEL_47;
  }
  IsLeftEyeFrameForCurrentRequest = BWPhotoEncoderIsLeftEyeFrameForCurrentRequest(a7);
  v39 = *MEMORY[0x1E0D06D00];
  v40 = (void *)objc_msgSend(a7, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00]);
  v41 = *MEMORY[0x1E0D05A18];
  v77 = IsLeftEyeFrameForCurrentRequest;
  if (objc_msgSend(v40, "isEqual:", *MEMORY[0x1E0D05A18]))
  {
    if (IsLeftEyeFrameForCurrentRequest)
      v42 = 1;
    else
      v42 = 2;
    v43 = -[BWStillImageProcessorControllerRequest input](-[BWStillImageProcessorController currentRequest](self, "currentRequest"), "input");
    v44 = v42;
    IsLeftEyeFrameForCurrentRequest = v77;
    -[BWStillImageProcessorControllerInput setMonoImageLocationType:](v43, "setMonoImageLocationType:", v44);
  }
  v45 = (void *)objc_msgSend(a7, "objectForKeyedSubscript:", v39);
  v46 = *MEMORY[0x1E0D05A28];
  v47 = objc_msgSend(v45, "isEqual:", *MEMORY[0x1E0D05A28]);
  LODWORD(v48) = 0;
  if (v47)
  {
    v75 = v46;
    v49 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", v48);
    v87 = 0u;
    v88 = 0u;
    v89 = 0u;
    v90 = 0u;
    v50 = -[BWStillImageProcessorControllerConfiguration sensorConfigurationsByPortType](self->_configuration, "sensorConfigurationsByPortType");
    v51 = -[NSDictionary countByEnumeratingWithState:objects:count:](v50, "countByEnumeratingWithState:objects:count:", &v87, v96, 16);
    if (v51)
    {
      v52 = v51;
      v53 = *(_QWORD *)v88;
      do
      {
        for (i = 0; i != v52; ++i)
        {
          if (*(_QWORD *)v88 != v53)
            objc_enumerationMutation(v50);
          objc_msgSend(v49, "setObject:forKeyedSubscript:", objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[BWStillImageProcessorControllerConfiguration sensorConfigurationsByPortType](self->_configuration, "sensorConfigurationsByPortType"), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v87 + 1) + 8 * i)), "cameraInfo"), *(_QWORD *)(*((_QWORD *)&v87 + 1) + 8 * i));
        }
        v52 = -[NSDictionary countByEnumeratingWithState:objects:count:](v50, "countByEnumeratingWithState:objects:count:", &v87, v96, 16);
      }
      while (v52);
    }
    v86 = 0.0;
    v55 = BWStereoUtilitiesComputeStereoBaseline(v41, v75, v49, &v86);
    if (v55)
    {
      v69 = v55;
      v73 = v76;
      LODWORD(v72) = v55;
      FigDebugAssert3();
      v26 = a13;
      v25 = a15;
      goto LABEL_70;
    }
    v56 = v86;
    IsLeftEyeFrameForCurrentRequest = v77;
    if (v77)
      v56 = -v86;
    *(float *)&v48 = v56 / 1000.0;
    v26 = a13;
    v25 = a15;
  }
  v95[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v48);
  v95[1] = &unk_1E4A02F10;
  v95[2] = &unk_1E4A02F10;
  v57 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v95, 3);
  v58 = (void *)objc_msgSend(a7, "objectForKeyedSubscript:", *MEMORY[0x1E0D06118]);
  if (v58)
  {
    v59 = (void *)objc_msgSend(v58, "objectForKeyedSubscript:", *MEMORY[0x1E0D061E8]);
    if (v59)
    {
      v35 = a4;
      v36 = IsLeftEyeFrameForCurrentRequest ^ 1;
      objc_msgSend(v59, "doubleValue");
      v61 = __tanpi(v60 / 360.0);
      v62 = (double)a5.var0 / (v61 + v61);
      v94[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v62);
      v94[1] = &unk_1E4A02F10;
      v94[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)a5.var0 * 0.5);
      v94[3] = &unk_1E4A02F10;
      v94[4] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v62);
      v94[5] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)a5.var1 * 0.5);
      v94[6] = &unk_1E4A02F10;
      v94[7] = &unk_1E4A02F10;
      v94[8] = &unk_1E4A02F20;
      v63 = v26;
      v64 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v94, 9);
      objc_msgSend(v92, "setObject:forKeyedSubscript:", v57, *MEMORY[0x1E0D09398]);
      objc_msgSend(v92, "setObject:forKeyedSubscript:", &unk_1E4A017C0, *MEMORY[0x1E0D093A0]);
      v65 = v64;
      v26 = v63;
      objc_msgSend(v92, "setObject:forKeyedSubscript:", v65, *MEMORY[0x1E0D093D0]);
      v37 = 0;
      v30 = v79;
      goto LABEL_38;
    }
    v73 = v76;
    LODWORD(v72) = 0;
  }
  else
  {
    v73 = v76;
    LODWORD(v72) = 0;
  }
  FigDebugAssert3();
  v69 = -12783;
LABEL_70:
  v28 = a14;
  v30 = v79;
LABEL_48:
  if (objc_msgSend(v30, "isContainerOpen", v72, v73))
    objc_msgSend(v30, "closeContainer");
LABEL_57:
  if (v26)
    *v26 = v93;
  if (v28)
    *v28 = v92;
  if (v25)
    *v25 = v91;
  return v69;
}

- (int)_encodeDNGForEncodingScheme:(int)a3 rawSampleBuffer:(opaqueCMSampleBuffer *)a4 dngDictionary:(id)a5 requestedSettings:(id)a6 captureType:(int)a7 cropRect:(CGRect)a8 dngContainsDepthData:(BOOL)a9 dngContainsSemanticSegmentationMattes:(BOOL)a10 processingFlags:(unsigned int)a11
{
  uint64_t v11;
  _BOOL8 v12;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  uint64_t v21;
  id v23;
  void *v24;
  void *v25;
  unsigned int v26;
  unint64_t dngBitDepth;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  float v35;
  void *v36;
  CVImageBufferRef ImageBuffer;
  CVImageBufferRef v38;
  id v39;
  int v40;
  int v41;
  int v42;
  uint64_t v44;
  uint64_t v45;
  unsigned int v46;
  CGRect v47;
  CGRect v48;

  v12 = a9;
  height = a8.size.height;
  width = a8.size.width;
  y = a8.origin.y;
  x = a8.origin.x;
  v21 = *(_QWORD *)&a3;
  v23 = -[BWPhotoEncoderController _encoderManagerForEncodingScheme:](self, "_encoderManagerForEncodingScheme:");
  if (!v23)
  {
    v42 = 0;
    v39 = 0;
    goto LABEL_21;
  }
  v24 = v23;
  v46 = a7;
  v25 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v26 = objc_msgSend(a6, "rawOutputFileBitDepth");
  if (v26)
    dngBitDepth = v26;
  else
    dngBitDepth = self->_dngBitDepth;
  v28 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", dngBitDepth);
  objc_msgSend(v25, "setObject:forKeyedSubscript:", v28, *MEMORY[0x1E0D094C0]);
  v29 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", self->_maxThreads);
  objc_msgSend(v25, "setObject:forKeyedSubscript:", v29, *MEMORY[0x1E0D094E8]);
  objc_msgSend(v25, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D094F8]);
  v30 = objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0D05F88]);
  if (v30)
    objc_msgSend(v25, "setObject:forKeyedSubscript:", v30, *MEMORY[0x1E0D094B8]);
  if ((_DWORD)v21 == 4)
  {
    objc_msgSend(v25, "setObject:forKeyedSubscript:", &unk_1E49FB448, *MEMORY[0x1E0D094D0]);
    v31 = BWIsDeferredPhotoProxyImage(a11);
    v32 = *MEMORY[0x1E0D094D8];
    if (v31)
    {
      objc_msgSend(v25, "setObject:forKeyedSubscript:", &unk_1E49FB430, v32);
      v33 = *MEMORY[0x1E0D094E0];
      v34 = &unk_1E4A02D90;
LABEL_14:
      objc_msgSend(v25, "setObject:forKeyedSubscript:", v34, v33);
      goto LABEL_15;
    }
    objc_msgSend(v25, "setObject:forKeyedSubscript:", &unk_1E49FB400, v32);
LABEL_13:
    v36 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(a6, "rawOutputFileCodecQuality");
    v34 = (void *)objc_msgSend(v36, "numberWithFloat:");
    v33 = *MEMORY[0x1E0D094E0];
    goto LABEL_14;
  }
  objc_msgSend(a6, "rawOutputFileCodecQuality");
  if (v35 != 0.0)
    goto LABEL_13;
LABEL_15:
  v47.origin.x = x;
  v47.origin.y = y;
  v47.size.width = width;
  v47.size.height = height;
  if (!CGRectIsEmpty(v47))
  {
    v48.origin.x = x;
    v48.origin.y = y;
    v48.size.width = width;
    v48.size.height = height;
    objc_msgSend(v25, "setObject:forKeyedSubscript:", CGRectCreateDictionaryRepresentation(v48), *MEMORY[0x1E0D09500]);
  }
  ImageBuffer = CMSampleBufferGetImageBuffer(a4);
  if (!ImageBuffer)
  {
    v39 = 0;
    goto LABEL_24;
  }
  v38 = ImageBuffer;
  LOBYTE(v44) = a10;
  v39 = -[BWPhotoEncoderController _newRawMetadataAttachmentsForEncodingScheme:sampleBuffer:dngDictionary:requestedSettings:captureType:dngContainsDepthData:dngContainsSemanticSegmentationMattes:](self, "_newRawMetadataAttachmentsForEncodingScheme:sampleBuffer:dngDictionary:requestedSettings:captureType:dngContainsDepthData:dngContainsSemanticSegmentationMattes:", v21, a4, a5, a6, v46, v12, v44);
  if (!v39)
  {
LABEL_24:
    v42 = -12780;
    goto LABEL_28;
  }
  v40 = objc_msgSend(v24, "openContainerWithOptions:settingsID:", 0, objc_msgSend(a6, "settingsID"));
  if (v40)
  {
    v42 = v40;
    v45 = v11;
    LODWORD(v44) = v40;
  }
  else
  {
    v41 = objc_msgSend(v24, "addMainImage:metadata:options:imageHandleOut:", v38, v39, v25, 0);
    v42 = v41;
    if (!v41)
      goto LABEL_21;
    v45 = v11;
    LODWORD(v44) = v41;
  }
  FigDebugAssert3();
LABEL_28:
  if (objc_msgSend(v24, "isContainerOpen", v44, v45))
    objc_msgSend(v24, "closeContainer");
LABEL_21:

  return v42;
}

- (id)_thumbnailOptionsForImageWithMetadata:(id)a3 requestedStillImageCaptureSettings:(id)a4 resolvedStillImageCaptureSettings:(id)a5 processingFlags:(unsigned int)a6 cropRect:(CGRect)a7 codecType:(unsigned int)a8 maxPixelSize:(unint64_t)a9
{
  uint64_t v10;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v19;
  CFDictionaryRef DictionaryRepresentation;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unsigned int v26;
  CGRect v27;
  CGRect v28;

  v10 = *(_QWORD *)&a8;
  height = a7.size.height;
  width = a7.size.width;
  y = a7.origin.y;
  x = a7.origin.x;
  v19 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", a3, a4, a5, *(_QWORD *)&a6);
  v27.origin.x = x;
  v27.origin.y = y;
  v27.size.width = width;
  v27.size.height = height;
  if (!CGRectIsEmpty(v27))
  {
    v28.origin.x = x;
    v28.origin.y = y;
    v28.size.width = width;
    v28.size.height = height;
    DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v28);
    objc_msgSend(v19, "setObject:forKeyedSubscript:", DictionaryRepresentation, *MEMORY[0x1E0D09430]);
    if (DictionaryRepresentation)
      CFRelease(DictionaryRepresentation);
  }
  LOWORD(v26) = 0;
  -[BWPhotoEncoderController _addQualityOptionsToDictionary:codecType:pixelBuffer:imageDimensions:metadata:requestedStillImageCaptureSettings:resolvedStillImageCaptureSettings:enableHEIFTiling:enableHEIFOrientation:auxImageType:](self, "_addQualityOptionsToDictionary:codecType:pixelBuffer:imageDimensions:metadata:requestedStillImageCaptureSettings:resolvedStillImageCaptureSettings:enableHEIFTiling:enableHEIFOrientation:auxImageType:", v19, v10, 0, objc_msgSend(a4, "thumbnailWidth") | (unint64_t)(objc_msgSend(a4, "thumbnailHeight") << 32), a3, a4, a5, v26);
  v21 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v10);
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v21, *MEMORY[0x1E0D09378]);
  v22 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a9);
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v22, *MEMORY[0x1E0D093E0]);
  if (-[BWPhotoEncoderControllerConfiguration usesHighEncodingPriority](self->_configuration, "usesHighEncodingPriority"))
  {
    objc_msgSend(v19, "setObject:forKeyedSubscript:", &unk_1E49FB3B8, *MEMORY[0x1E0D09400]);
  }
  v23 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BWStillImageProcessorControllerConfiguration figThreadPriority](self->_configuration, "figThreadPriority"));
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v23, *MEMORY[0x1E0D09438]);
  if (-[BWStillImageProcessorControllerInput requiresPhotosAdjustment](-[BWStillImageProcessorControllerRequest input](-[BWStillImageProcessorController currentRequest](self, "currentRequest"), "input"), "requiresPhotosAdjustment"))
  {
    objc_msgSend(v19, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D09350]);
    v24 = objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D05E50]);
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v24, *MEMORY[0x1E0D093B8]);
  }
  if (objc_msgSend(a4, "outputFormat") == 1785750887)
  {
    objc_msgSend(v19, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D093D8]);
    if (!objc_msgSend(a4, "payloadType"))
      objc_msgSend(v19, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D093B0]);
  }
  return v19;
}

- (int)_addThumbnailForEncodingScheme:(int)a3 thumbnailPixelBuffer:(__CVBuffer *)a4 metadata:(id)a5 requestedStillImageCaptureSettings:(id)a6 resolvedStillImageCaptureSettings:(id)a7 processingFlags:(unsigned int)a8 cropRect:(CGRect)a9 codecType:(unsigned int)a10 maxPixelSize:(unint64_t)a11 parentImageHandle:(int64_t)a12
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v16;
  id v23;
  void *v24;
  const __CFDictionary *v25;
  id v26;
  id v27;
  int v28;
  uint64_t v30;
  _QWORD v31[2];
  CGRect v32;
  CGRect v33;

  height = a9.size.height;
  width = a9.size.width;
  y = a9.origin.y;
  x = a9.origin.x;
  v16 = *(_QWORD *)&a8;
  v31[1] = *MEMORY[0x1E0C80C00];
  v23 = -[BWPhotoEncoderController _encoderManagerForEncodingScheme:](self, "_encoderManagerForEncodingScheme:");
  if (!v23)
    return 0;
  v24 = v23;
  if ((objc_msgSend(v23, "isContainerOpen") & 1) == 0)
  {
    FigDebugAssert3();
    return 0;
  }
  if ((a3 - 3) >= 2)
  {
    if (a3 == 1)
    {
      v26 = -[BWPhotoEncoderController _thumbnailOptionsForImageWithMetadata:requestedStillImageCaptureSettings:resolvedStillImageCaptureSettings:processingFlags:cropRect:codecType:maxPixelSize:](self, "_thumbnailOptionsForImageWithMetadata:requestedStillImageCaptureSettings:resolvedStillImageCaptureSettings:processingFlags:cropRect:codecType:maxPixelSize:", a5, a6, a7, v16, a10, a11, x, y, width, height);
      goto LABEL_9;
    }
  }
  else
  {
    v32.origin.x = x;
    v32.origin.y = y;
    v32.size.width = width;
    v32.size.height = height;
    if (!CGRectIsEmpty(v32))
    {
      v33.origin.x = x;
      v33.origin.y = y;
      v33.size.width = width;
      v33.size.height = height;
      v25 = CGRectCreateDictionaryRepresentation(v33);
      if (v25)
      {
        v30 = *MEMORY[0x1E0D09500];
        v31[0] = v25;
        v26 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
LABEL_9:
        v27 = v26;
        goto LABEL_11;
      }
    }
  }
  v27 = 0;
LABEL_11:
  v28 = objc_msgSend(v24, "addThumbnailImage:options:parentImageHandle:", a4, v27, a12);
  if (v28)
    FigDebugAssert3();
  return v28;
}

- (int)_addCompressedThumbnailForEncodingScheme:(int)a3 thumbnailSurface:(__IOSurface *)a4 thumbnailSurfaceSize:(unint64_t)a5
{
  id v7;
  void *v8;
  int v9;

  v7 = -[BWPhotoEncoderController _encoderManagerForEncodingScheme:](self, "_encoderManagerForEncodingScheme:", *(_QWORD *)&a3);
  if (!v7)
    return 0;
  v8 = v7;
  if ((objc_msgSend(v7, "isContainerOpen") & 1) == 0)
  {
    FigDebugAssert3();
    return 0;
  }
  v9 = objc_msgSend(v8, "addCompressedThumbnailImage:thumbnailImageSize:options:", a4, a5, 0);
  if (v9)
    FigDebugAssert3();
  return v9;
}

- (BOOL)_addDepthForEncodingScheme:(int)a3 sampleBuffer:(opaqueCMSampleBuffer *)a4 primaryOutputAspectRatio:(double)a5 parentImageHandle:(int64_t)a6
{
  id v11;
  void *v12;
  opaqueCMSampleBuffer *AttachedMedia;
  opaqueCMSampleBuffer *v14;
  __CVBuffer *ImageBuffer;
  __CVBuffer *v16;
  OSType PixelFormatType;
  unsigned int v18;
  CFTypeRef v19;
  void *v20;
  CFTypeRef v21;
  const void *AuxiliaryImagePropertiesFromDepthMetadata;
  void *v23;
  uint64_t v24;
  char v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  uint64_t v34;
  uint64_t v35;
  BOOL v36;
  int64_t v38;
  __CVBuffer *v39;
  unsigned int v40;
  CGRect v41;

  v11 = -[BWPhotoEncoderController _encoderManagerForEncodingScheme:](self, "_encoderManagerForEncodingScheme:");
  if (!v11)
    return 0;
  v12 = v11;
  if (!objc_msgSend(v11, "isContainerOpen"))
    return 0;
  if (!CMGetAttachment(a4, CFSTR("StillSettings"), 0))
    return 0;
  AttachedMedia = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a4, (uint64_t)CFSTR("Depth"));
  if (!AttachedMedia)
    return 0;
  v14 = AttachedMedia;
  ImageBuffer = CMSampleBufferGetImageBuffer(AttachedMedia);
  if (!ImageBuffer)
    return 0;
  v16 = ImageBuffer;
  PixelFormatType = CVPixelBufferGetPixelFormatType(ImageBuffer);
  v18 = BWPhotoEncoderAuxImageTypeForDepthPixelFormat(PixelFormatType);
  if (!v18)
    return 0;
  v40 = v18;
  v19 = CMGetAttachment(a4, (CFStringRef)*MEMORY[0x1E0D086F0], 0);
  if (!v19
    || ((v20 = (void *)v19,
         v39 = v16,
         (v21 = CMGetAttachment(a4, CFSTR("PortraitStillImageAuxDepthMetadata"), 0)) == 0)
     || (AuxiliaryImagePropertiesFromDepthMetadata = CFRetain(v21)) == 0)
    && (AuxiliaryImagePropertiesFromDepthMetadata = FigCaptureMetadataUtilitiesCreateAuxiliaryImagePropertiesFromDepthMetadata(v20)) == 0)
  {
    FigSignalErrorAt();
    return 0;
  }
  v38 = a6;
  v23 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  if ((objc_msgSend((id)objc_msgSend(v20, "objectForKeyedSubscript:", *MEMORY[0x1E0D08438]), "BOOLValue") & 1) == 0)
  {
    if (FigDepthFormatIs16Bit(PixelFormatType))
      v24 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", 0x7FFFLL);
    else
      v24 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2143289344);
    objc_msgSend(v23, "setObject:forKeyedSubscript:", v24, *MEMORY[0x1E0D09360]);
  }
  v25 = objc_msgSend((id)CMGetAttachment(a4, (CFStringRef)*MEMORY[0x1E0D05E78], 0), "BOOLValue");
  v26 = BWPhotoEncoderDenormalizedZoomRectForAttachedMedia(v14, a5, 1.0);
  if ((v25 & 1) == 0)
  {
    v30 = v26;
    v31 = v27;
    v32 = v28;
    v33 = v29;
    if (!CGRectIsNull(*(CGRect *)&v26))
    {
      v41.origin.x = v30;
      v41.origin.y = v31;
      v41.size.width = v32;
      v41.size.height = v33;
      objc_msgSend(v23, "setObject:forKeyedSubscript:", CGRectCreateDictionaryRepresentation(v41), *MEMORY[0x1E0D09430]);
      objc_msgSend(v23, "setObject:forKeyedSubscript:", 0, *MEMORY[0x1E0D09458]);
    }
  }
  if (-[BWStillImageProcessorControllerInput requiresPhotosAdjustment](-[BWStillImageProcessorControllerRequest input](-[BWStillImageProcessorController currentRequest](self, "currentRequest", v26), "input"), "requiresPhotosAdjustment"))
  {
    objc_msgSend(v23, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D09350]);
    objc_msgSend(v23, "setObject:forKeyedSubscript:", objc_msgSend((id)CMGetAttachment(a4, (CFStringRef)*MEMORY[0x1E0D05CB0], 0), "objectForKeyedSubscript:", *MEMORY[0x1E0D05E50]), *MEMORY[0x1E0D093B8]);
  }
  if (a3 == 4)
  {
    v34 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
    objc_msgSend(v23, "setObject:forKeyedSubscript:", v34, *MEMORY[0x1E0D094D0]);
  }
  if (!v23)
  {
    FigSignalErrorAt();
LABEL_33:
    v36 = 0;
    goto LABEL_28;
  }
  if (-[BWPhotoEncoderControllerConfiguration usesHighEncodingPriority](self->_configuration, "usesHighEncodingPriority"))
  {
    objc_msgSend(v23, "setObject:forKeyedSubscript:", &unk_1E49FB3B8, *MEMORY[0x1E0D09400]);
  }
  v35 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BWStillImageProcessorControllerConfiguration figThreadPriority](self->_configuration, "figThreadPriority"));
  objc_msgSend(v23, "setObject:forKeyedSubscript:", v35, *MEMORY[0x1E0D09438]);
  if (objc_msgSend(v12, "addAuxImage:type:auxImageMetadata:options:parentImageHandle:auxImageHandleOut:", v39, v40, AuxiliaryImagePropertiesFromDepthMetadata, v23, v38, 0))goto LABEL_33;
  objc_msgSend((id)-[BWStillImageProcessorControllerInput encodedAttachedMediaKeys](-[BWStillImageProcessorControllerRequest input](-[BWStillImageProcessorController currentRequest](self, "currentRequest"), "input"), "encodedAttachedMediaKeys"), "addObject:", CFSTR("Depth"));
  v36 = 1;
LABEL_28:
  CFRelease(AuxiliaryImagePropertiesFromDepthMetadata);
  return v36;
}

- (id)_depthEncodingOptionsFromDepthMetadata:(id)a3 pixelFormat:(unsigned int)a4
{
  uint64_t v5;
  char v6;
  id result;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D08438]), "BOOLValue") & 1) != 0)
  {
    result = 0;
    v6 = 1;
  }
  else
  {
    if (FigDepthFormatIs16Bit(a4))
    {
      v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", 0x7FFFLL);
      if (v5)
      {
LABEL_4:
        v8 = *MEMORY[0x1E0D09360];
        v9[0] = v5;
        v6 = 1;
        result = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
        goto LABEL_5;
      }
    }
    else
    {
      v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2143289344);
      if (v5)
        goto LABEL_4;
    }
    FigDebugAssert3();
    v6 = 0;
    result = 0;
  }
LABEL_5:
  if ((v6 & (result == 0)) != 0)
    return (id)MEMORY[0x1E0C9AA70];
  return result;
}

- (BOOL)_addPortraitEffectsMatteForEncodingScheme:(int)a3 sampleBuffer:(opaqueCMSampleBuffer *)a4 primaryOutputAspectRatio:(double)a5 parentImageHandle:(int64_t)a6
{
  id v11;
  void *v12;
  opaqueCMSampleBuffer *AttachedMedia;
  opaqueCMSampleBuffer *v14;
  __CVBuffer *ImageBuffer;
  __CVBuffer *v16;
  size_t Width;
  size_t Height;
  char v19;
  CFTypeRef v20;
  CGImageMetadata *v21;
  void *Attributes;
  void *v23;
  const __CFString *v24;
  float v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  const __CFDictionary *v34;
  _BOOL4 IsLinDNGEncodingScheme;
  _QWORD *v36;
  uint64_t v37;
  int v38;
  int v40;
  CGImageMetadata *v41;
  int64_t v42;
  unint64_t v43;
  CGRect v44;

  v11 = -[BWPhotoEncoderController _encoderManagerForEncodingScheme:](self, "_encoderManagerForEncodingScheme:");
  if (!v11)
    goto LABEL_23;
  v12 = v11;
  if ((objc_msgSend(v11, "isContainerOpen") & 1) == 0)
  {
    FigDebugAssert3();
    goto LABEL_23;
  }
  AttachedMedia = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a4, 0x1E495AF38);
  v14 = AttachedMedia;
  if (!AttachedMedia)
    return (char)v14;
  ImageBuffer = CMSampleBufferGetImageBuffer(AttachedMedia);
  if (!ImageBuffer
    || (v16 = ImageBuffer,
        Width = CVPixelBufferGetWidth(ImageBuffer),
        Height = CVPixelBufferGetHeight(v16),
        CVPixelBufferGetPixelFormatType(v16) != 1278226488))
  {
LABEL_23:
    LOBYTE(v14) = 0;
    return (char)v14;
  }
  v43 = Height;
  v19 = objc_msgSend((id)CMGetAttachment(a4, (CFStringRef)*MEMORY[0x1E0D05E78], 0), "BOOLValue");
  v20 = CMGetAttachment(v14, (CFStringRef)*MEMORY[0x1E0D08730], 0);
  if (!v20
    || (v21 = -[BWPhotoEncoderController _newAuxiliaryImagePropertiesFromPortraitEffectsMatteMetadata:](self, "_newAuxiliaryImagePropertiesFromPortraitEffectsMatteMetadata:", v20)) == 0)
  {
    FigSignalErrorAt();
    goto LABEL_23;
  }
  v40 = a3;
  v41 = v21;
  v42 = a6;
  Attributes = (void *)CVPixelBufferGetAttributes();
  v23 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", BWPhotoEncoderEncodingOptionsForAuxiliaryImage(Width, v43, Attributes, -[BWPhotoEncoderControllerConfiguration usesHighEncodingPriority](self->_configuration, "usesHighEncodingPriority"), -[BWStillImageProcessorControllerConfiguration figThreadPriority](self->_configuration, "figThreadPriority")));
  v24 = (const __CFString *)*MEMORY[0x1E0D05CB0];
  -[BWPhotoEncoderController mainImageDownscalingFactorForAttachedMediaKey:attachedMediaMetadata:](self, "mainImageDownscalingFactorForAttachedMediaKey:attachedMediaMetadata:", 0x1E495AF38, CMGetAttachment(v14, (CFStringRef)*MEMORY[0x1E0D05CB0], 0));
  v26 = BWPhotoEncoderDenormalizedZoomRectForAttachedMedia(v14, a5, v25);
  if ((v19 & 1) == 0)
  {
    v30 = v26;
    v31 = v27;
    v32 = v28;
    v33 = v29;
    if (!CGRectIsNull(*(CGRect *)&v26))
    {
      v44.origin.x = v30;
      v44.origin.y = v31;
      v44.size.width = v32;
      v44.size.height = v33;
      v34 = CGRectCreateDictionaryRepresentation(v44);
      IsLinDNGEncodingScheme = BWPhotoEncoderIsLinDNGEncodingScheme(v40);
      v36 = (_QWORD *)MEMORY[0x1E0D09500];
      if (!IsLinDNGEncodingScheme)
        v36 = (_QWORD *)MEMORY[0x1E0D09430];
      objc_msgSend(v23, "setObject:forKeyedSubscript:", v34, *v36);
      objc_msgSend(v23, "setObject:forKeyedSubscript:", 0, *MEMORY[0x1E0D09458]);
    }
  }
  if (-[BWStillImageProcessorControllerInput requiresPhotosAdjustment](-[BWStillImageProcessorControllerRequest input](-[BWStillImageProcessorController currentRequest](self, "currentRequest", v26), "input"), "requiresPhotosAdjustment"))
  {
    objc_msgSend(v23, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D09350]);
    objc_msgSend(v23, "setObject:forKeyedSubscript:", objc_msgSend((id)CMGetAttachment(a4, v24, 0), "objectForKeyedSubscript:", *MEMORY[0x1E0D05E50]), *MEMORY[0x1E0D093B8]);
  }
  if (v12 == -[BWPhotoEncoderController _encoderManagerForEncodingScheme:](self, "_encoderManagerForEncodingScheme:", 4))
  {
    v37 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
    objc_msgSend(v23, "setObject:forKeyedSubscript:", v37, *MEMORY[0x1E0D094D0]);
  }
  v38 = objc_msgSend(v12, "addAuxImage:type:auxImageMetadata:options:parentImageHandle:auxImageHandleOut:", v16, 4, v41, v23, v42, 0);
  LOBYTE(v14) = v38 == 0;
  if (v38)
    FigDebugAssert3();
  else
    objc_msgSend((id)-[BWStillImageProcessorControllerInput encodedAttachedMediaKeys](-[BWStillImageProcessorControllerRequest input](-[BWStillImageProcessorController currentRequest](self, "currentRequest"), "input"), "encodedAttachedMediaKeys"), "addObject:", 0x1E495AF38);
  CFRelease(v41);
  return (char)v14;
}

- (CGImageMetadata)_newAuxiliaryImagePropertiesFromPortraitEffectsMatteMetadata:(id)a3
{
  CGImageMetadata *Mutable;
  CGImageMetadata *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  Mutable = CGImageMetadataCreateMutable();
  v6 = Mutable;
  if (!Mutable)
  {
    FigSignalErrorAt();
    return v6;
  }
  v7 = *MEMORY[0x1E0D08648];
  v8 = *MEMORY[0x1E0D08650];
  if (!CGImageMetadataRegisterNamespaceForPrefix(Mutable, (CFStringRef)*MEMORY[0x1E0D08648], (CFStringRef)*MEMORY[0x1E0D08650], 0))
  {
    if (!FigSignalErrorAt())
      return v6;
    goto LABEL_9;
  }
  v9 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D08660]), "intValue");
  v10 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v9);
  if (-[BWPhotoEncoderController _addValue:toAuxiliaryImageProperties:namespace:prefix:key:](self, "_addValue:toAuxiliaryImageProperties:namespace:prefix:key:", v10, v6, v7, v8, *MEMORY[0x1E0D08658]))
  {
    FigDebugAssert3();
LABEL_9:
    CFRelease(v6);
    return 0;
  }
  return v6;
}

- (BOOL)_addGainMapForEncodingScheme:(int)a3 sampleBuffer:(opaqueCMSampleBuffer *)a4 outputDimensions:(id)a5 primaryOutputAspectRatio:(double)a6 parentImageHandle:(int64_t)a7
{
  uint64_t v11;
  id v13;
  void *v14;
  opaqueCMSampleBuffer *AttachedMedia;
  opaqueCMSampleBuffer *v16;
  __CVBuffer *ImageBuffer;
  __CVBuffer *v18;
  OSType PixelFormatType;
  _BOOL8 v20;
  unint64_t v21;
  double v22;
  double v23;
  double v24;
  double v25;
  float v26;
  double v27;
  double v28;
  double v29;
  CGImageMetadata *v30;
  CGImageMetadata *v31;
  int v32;
  BOOL v33;
  int64_t v35;
  uint64_t v36;
  id v37;

  v11 = *(_QWORD *)&a3;
  v13 = -[BWPhotoEncoderController _encoderManagerForEncodingScheme:](self, "_encoderManagerForEncodingScheme:");
  if (!v13)
    return 0;
  v14 = v13;
  if ((objc_msgSend(v13, "isContainerOpen") & 1) == 0)
  {
    FigDebugAssert3();
    return 0;
  }
  AttachedMedia = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a4, 0x1E4936818);
  if (!AttachedMedia)
    return 0;
  v16 = AttachedMedia;
  ImageBuffer = CMSampleBufferGetImageBuffer(AttachedMedia);
  if (!ImageBuffer)
    return 0;
  v18 = ImageBuffer;
  v35 = a7;
  PixelFormatType = CVPixelBufferGetPixelFormatType(ImageBuffer);
  v20 = PixelFormatType == 1278226488;
  if (PixelFormatType != 1278226488)
    return 0;
  v21 = psn_pixelBufferDimensions(v18);
  if (objc_msgSend((id)CMGetAttachment(a4, (CFStringRef)*MEMORY[0x1E0D05E78], 0), "BOOLValue"))
  {
    if (FigCaptureVideoDimensionsAreEqual(v21, *(_QWORD *)&a5))
    {
      v23 = *(double *)(MEMORY[0x1E0C9D628] + 16);
      v22 = *(double *)(MEMORY[0x1E0C9D628] + 24);
      v25 = *MEMORY[0x1E0C9D628];
      v24 = *(double *)(MEMORY[0x1E0C9D628] + 8);
      goto LABEL_11;
    }
    return 0;
  }
  -[BWPhotoEncoderController mainImageDownscalingFactorForAttachedMediaKey:attachedMediaMetadata:](self, "mainImageDownscalingFactorForAttachedMediaKey:attachedMediaMetadata:", 0x1E4936818, CMGetAttachment(v16, (CFStringRef)*MEMORY[0x1E0D05CB0], 0));
  if (v26 <= 0.0)
    return 0;
  v25 = BWPhotoEncoderDenormalizedZoomRectForAttachedMedia(v16, a6, v26);
  v24 = v27;
  v23 = v28;
  v22 = v29;
LABEL_11:
  v37 = 0;
  v30 = -[BWPhotoEncoderController _newGainMapAuxiliaryImagePropertiesForEncodingScheme:sampleBuffer:denormalizedCropRect:requiresPhotosAdjustment:encodingOptionsOut:flexGTCColorSpaceOut:tonemapItemMetadataOut:isP3PrimariesOut:](self, "_newGainMapAuxiliaryImagePropertiesForEncodingScheme:sampleBuffer:denormalizedCropRect:requiresPhotosAdjustment:encodingOptionsOut:flexGTCColorSpaceOut:tonemapItemMetadataOut:isP3PrimariesOut:", v11, a4, -[BWStillImageProcessorControllerInput requiresPhotosAdjustment](-[BWStillImageProcessorControllerRequest input](-[BWStillImageProcessorController currentRequest](self, "currentRequest"), "input"), "requiresPhotosAdjustment"), &v37, 0, 0, v25, v24, v23, v22, 0);
  if (!v30)
    return 0;
  v31 = v30;
  if (!objc_msgSend(v37, "count"))
  {
    v33 = 0;
LABEL_18:
    CFRelease(v31);
    return v33;
  }
  v36 = -1;
  if (BWPhotoEncoderSupportsAddingAuxiliaryMetadataSeparately(v11))
  {
    CFRelease(v31);
    v31 = 0;
  }
  v32 = objc_msgSend(v14, "addAuxImage:type:auxImageMetadata:options:parentImageHandle:auxImageHandleOut:", v18, v20, v31, v37, v35, &v36);
  v33 = v32 == 0;
  if (!v32)
  {
    -[BWStillImageProcessorControllerInput setGainMapHandle:](-[BWStillImageProcessorControllerRequest input](-[BWStillImageProcessorController currentRequest](self, "currentRequest"), "input"), "setGainMapHandle:", v36);
    objc_msgSend((id)-[BWStillImageProcessorControllerInput encodedAttachedMediaKeys](-[BWStillImageProcessorControllerRequest input](-[BWStillImageProcessorController currentRequest](self, "currentRequest"), "input"), "encodedAttachedMediaKeys"), "addObject:", 0x1E4936818);
  }
  if (v31)
    goto LABEL_18;
  return v33;
}

- (CGImageMetadata)_newGainMapAuxiliaryImagePropertiesForEncodingScheme:(int)a3 sampleBuffer:(opaqueCMSampleBuffer *)a4 denormalizedCropRect:(CGRect)a5 requiresPhotosAdjustment:(BOOL)a6 encodingOptionsOut:(id *)a7 flexGTCColorSpaceOut:(CGColorSpace *)a8 tonemapItemMetadataOut:(id *)a9 isP3PrimariesOut:(BOOL *)a10
{
  _BOOL4 v13;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CFTypeRef v20;
  void *v21;
  opaqueCMSampleBuffer *AttachedMedia;
  opaqueCMSampleBuffer *v23;
  __CVBuffer *ImageBuffer;
  BOOL v25;
  int64_t v26;
  void *Attributes;
  void *v28;
  const __CFString *v29;
  void *v30;
  CGImageMetadata *AuxiliaryImagePropertiesFromGainMapSampleBuffer;
  int v32;
  unsigned int v33;
  void *v34;
  void *v35;
  uint64_t v36;
  __CVBuffer *v37;
  CFTypeRef v38;
  int v39;
  BOOL v40;
  _BOOL4 v41;
  CFDictionaryRef DictionaryRepresentation;
  _BOOL4 v44;
  id *v45;
  CGColorSpace **v46;
  opaqueCMSampleBuffer *sbuf;
  CFTypeRef cf;
  void *v50;
  CGRect v51;
  CGRect v52;

  v13 = a6;
  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  cf = 0;
  v50 = 0;
  v20 = CMGetAttachment(a4, CFSTR("StillSettings"), 0);
  if (v20
    && (v21 = (void *)v20,
        (AttachedMedia = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a4, 0x1E4936818)) != 0))
  {
    v23 = AttachedMedia;
    ImageBuffer = CMSampleBufferGetImageBuffer(AttachedMedia);
    v25 = (char)ImageBuffer;
    if (ImageBuffer)
    {
      v44 = v13;
      v46 = a8;
      sbuf = a4;
      v45 = a7;
      v26 = psn_pixelBufferDimensions(ImageBuffer);
      Attributes = (void *)CVPixelBufferGetAttributes();
      v28 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", BWPhotoEncoderEncodingOptionsForAuxiliaryImage((int)v26, v26 >> 32, Attributes, -[BWPhotoEncoderControllerConfiguration usesHighEncodingPriority](self->_configuration, "usesHighEncodingPriority"), -[BWStillImageProcessorControllerConfiguration figThreadPriority](self->_configuration, "figThreadPriority")));
      objc_msgSend((id)objc_msgSend(v21, "captureSettings"), "captureFlags");
      v29 = (const __CFString *)*MEMORY[0x1E0D05CB0];
      v30 = (void *)CMGetAttachment(v23, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
      AuxiliaryImagePropertiesFromGainMapSampleBuffer = FigCaptureMetadataUtilitiesCreateAuxiliaryImagePropertiesFromGainMapSampleBuffer(v30);
      if (!AuxiliaryImagePropertiesFromGainMapSampleBuffer)
      {
        FigSignalErrorAt();
        v25 = 0;
        goto LABEL_30;
      }
      v32 = a3;
      v33 = a3 - 3;
      v34 = (void *)objc_msgSend(v30, "objectForKeyedSubscript:", *MEMORY[0x1E0D05ED8]);
      v35 = v34;
      if (((a3 - 1) < 2 || v33 <= 1) && v34)
      {
        if (BWPhotoEncoderTonemapItemMetadataFromGainMapMetadata(v34, &v50))
        {
          FigDebugAssert3();
          goto LABEL_47;
        }
        if ((a3 == 1 || v33 <= 1) && v50)
          objc_msgSend(v28, "setObject:forKeyedSubscript:", v50, *MEMORY[0x1E0D09368]);
      }
      v36 = *MEMORY[0x1E0D05F60];
      if (!objc_msgSend(v30, "objectForKeyedSubscript:", *MEMORY[0x1E0D05F60]))
      {
        v25 = 0;
        v41 = v44;
LABEL_23:
        v51.origin.x = x;
        v51.origin.y = y;
        v51.size.width = width;
        v51.size.height = height;
        if (!CGRectIsNull(v51))
        {
          v52.origin.x = x;
          v52.origin.y = y;
          v52.size.width = width;
          v52.size.height = height;
          DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v52);
          objc_msgSend(v28, "setObject:forKeyedSubscript:", DictionaryRepresentation, *MEMORY[0x1E0D09430]);
          objc_msgSend(v28, "setObject:forKeyedSubscript:", 0, *MEMORY[0x1E0D09458]);
          if (DictionaryRepresentation)
            CFRelease(DictionaryRepresentation);
        }
        BWPhotoEncoderAddGainMapQualityControllerParametersToEncodingOptions(v28);
        if (BWPhotoEncoderIsLinDNGEncodingScheme(v32))
          objc_msgSend(v28, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D094B0]);
        if (v41)
        {
          objc_msgSend(v28, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D09350]);
          objc_msgSend(v28, "setObject:forKeyedSubscript:", objc_msgSend((id)CMGetAttachment(sbuf, v29, 0), "objectForKeyedSubscript:", *MEMORY[0x1E0D05E50]), *MEMORY[0x1E0D093B8]);
        }
LABEL_30:
        a7 = v45;
        a8 = v46;
        if (!v45)
          goto LABEL_32;
        goto LABEL_31;
      }
      v37 = CMSampleBufferGetImageBuffer(sbuf);
      if (v37)
      {
        v38 = CVBufferCopyAttachment(v37, (CFStringRef)*MEMORY[0x1E0CA8D68], 0);
        v39 = FigCFEqual();
        v40 = v39 != 0;
        if (v38)
          CFRelease(v38);
        if (BWPhotoEncoderCreateGTCColorSpaceFromGainMapMetadata(v35, objc_msgSend(v30, "objectForKeyedSubscript:", v36), v39 != 0, &cf))
        {
          v41 = v44;
          v32 = a3;
          v25 = v40;
        }
        else
        {
          v32 = a3;
          v41 = v44;
          v25 = v40;
          if (a3 <= 4 && ((1 << a3) & 0x1A) != 0)
            objc_msgSend(v28, "setObject:forKeyedSubscript:", cf, *MEMORY[0x1E0D09380]);
        }
        goto LABEL_23;
      }
      FigSignalErrorAt();
LABEL_47:
      v25 = 0;
      goto LABEL_30;
    }
  }
  else
  {
    v25 = 0;
  }
  AuxiliaryImagePropertiesFromGainMapSampleBuffer = 0;
  v28 = 0;
  if (a7)
LABEL_31:
    *a7 = v28;
LABEL_32:
  if (a8)
  {
    *a8 = (CGColorSpace *)cf;
  }
  else if (cf)
  {
    CFRelease(cf);
  }
  if (a9)
    *a9 = v50;
  if (a10)
    *a10 = v25;
  return AuxiliaryImagePropertiesFromGainMapSampleBuffer;
}

- (BOOL)_addAlternateImageForEncodingScheme:(int)a3 flexGTCColorSpace:(CGColorSpace *)a4 isP3primaries:(BOOL)a5 tonemapItemMetadata:(id)a6 parentImageHandle:(int64_t)a7 gainMapHandle:(int64_t)a8
{
  _BOOL4 v11;
  id v14;
  void *v15;
  void *v16;
  CFStringRef *v17;
  const void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  uint64_t v26;
  _QWORD v27[2];
  _QWORD v28[2];
  _QWORD v29[2];
  _QWORD v30[4];
  _QWORD v31[5];

  v31[4] = *MEMORY[0x1E0C80C00];
  if (a8 == -1)
    goto LABEL_15;
  v11 = a5;
  v14 = -[BWPhotoEncoderController _encoderManagerForEncodingScheme:](self, "_encoderManagerForEncodingScheme:", *(_QWORD *)&a3);
  if (!v14)
    return (char)v14;
  v15 = v14;
  if ((objc_msgSend(v14, "isContainerOpen") & 1) == 0)
  {
    FigDebugAssert3();
LABEL_15:
    LOBYTE(v14) = 0;
    return (char)v14;
  }
  if (a4)
  {
    v16 = (void *)CFRetain(a4);
  }
  else
  {
    v17 = (CFStringRef *)MEMORY[0x1E0C9D918];
    if (!v11)
      v17 = (CFStringRef *)MEMORY[0x1E0C9D9E0];
    v16 = CGColorSpaceCreateWithName(*v17);
  }
  v18 = v16;
  if (v16)
  {
    v30[0] = *MEMORY[0x1E0D09388];
    v19 = *MEMORY[0x1E0D095B8];
    v28[0] = *MEMORY[0x1E0D095C0];
    v28[1] = v19;
    v29[0] = &unk_1E49FB430;
    v29[1] = a6;
    v20 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
    v21 = *MEMORY[0x1E0D09380];
    v31[0] = v20;
    v31[1] = v18;
    v22 = *MEMORY[0x1E0D09370];
    v30[1] = v21;
    v30[2] = v22;
    v30[3] = *MEMORY[0x1E0D093B8];
    v31[2] = &unk_1E49FB460;
    v31[3] = &unk_1E49FB430;
    v23 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 4);
    v26 = -[BWStillImageProcessorControllerInput toneMapAlternateGroupHandle](-[BWStillImageProcessorControllerRequest input](-[BWStillImageProcessorController currentRequest](self, "currentRequest"), "input"), "toneMapAlternateGroupHandle");
    v27[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", a7);
    v27[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", a8);
    v24 = objc_msgSend(v15, "addAlternateImageWithDerivedImageHandles:options:parentImageHandle:alternateGroupHandleInOut:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2), v23, a7, &v26);
    if (!v24)
      -[BWStillImageProcessorControllerInput setToneMapAlternateGroupHandle:](-[BWStillImageProcessorControllerRequest input](-[BWStillImageProcessorController currentRequest](self, "currentRequest"), "input"), "setToneMapAlternateGroupHandle:", v26);
    CFRelease(v18);
    LOBYTE(v14) = v24 != 0;
  }
  else
  {
    FigDebugAssert3();
    LOBYTE(v14) = 1;
  }
  return (char)v14;
}

- (BOOL)_addGainMapMetadataForEncodingScheme:(int)a3 sampleBuffer:(opaqueCMSampleBuffer *)a4 parentImageHandle:(int64_t)a5
{
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  const void *AttachedMedia;
  uint64_t v14;
  CGImageMetadata *v15;
  CGImageMetadata *v16;
  unsigned __int8 v18;
  uint64_t v19;
  id v20;
  CFTypeRef cf;

  v7 = *(_QWORD *)&a3;
  cf = 0;
  v9 = -[BWStillImageProcessorControllerInput gainMapHandle](-[BWStillImageProcessorControllerRequest input](-[BWStillImageProcessorController currentRequest](self, "currentRequest"), "input"), "gainMapHandle");
  if (v9 == -1)
  {
    LOBYTE(v12) = 0;
    return (char)v12;
  }
  v10 = v9;
  v11 = -[BWPhotoEncoderController _encoderManagerForEncodingScheme:](self, "_encoderManagerForEncodingScheme:", v7);
  v12 = v11;
  if (v11)
  {
    if ((objc_msgSend(v11, "isContainerOpen") & 1) != 0)
    {
      if (CMGetAttachment(a4, CFSTR("StillSettings"), 0))
      {
        AttachedMedia = (const void *)BWSampleBufferGetAttachedMedia(a4, 0x1E4936818);
        if (AttachedMedia)
        {
          if (CMGetAttachment(AttachedMedia, (CFStringRef)*MEMORY[0x1E0D05CB0], 0))
          {
            v19 = 0;
            v20 = 0;
            v18 = 0;
            v14 = -[BWStillImageProcessorControllerInput requiresPhotosAdjustment](-[BWStillImageProcessorControllerRequest input](-[BWStillImageProcessorController currentRequest](self, "currentRequest"), "input"), "requiresPhotosAdjustment");
            v15 = -[BWPhotoEncoderController _newGainMapAuxiliaryImagePropertiesForEncodingScheme:sampleBuffer:denormalizedCropRect:requiresPhotosAdjustment:encodingOptionsOut:flexGTCColorSpaceOut:tonemapItemMetadataOut:isP3PrimariesOut:](self, "_newGainMapAuxiliaryImagePropertiesForEncodingScheme:sampleBuffer:denormalizedCropRect:requiresPhotosAdjustment:encodingOptionsOut:flexGTCColorSpaceOut:tonemapItemMetadataOut:isP3PrimariesOut:", v7, a4, v14, &v20, &cf, &v19, *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24), &v18);
            if (v15)
            {
              v16 = v15;
              if (!objc_msgSend(v20, "count")
                || objc_msgSend(v12, "addAuxImageMetadata:type:auxImageHandle:options:parentImageHandle:", v16, 1, v10, v20, a5))
              {
                LOBYTE(v12) = 0;
              }
              else
              {
                LOBYTE(v12) = 1;
                if ((_DWORD)v7 == 2 && v19)
                  -[BWPhotoEncoderController _addAlternateImageForEncodingScheme:flexGTCColorSpace:isP3primaries:tonemapItemMetadata:parentImageHandle:gainMapHandle:](self, "_addAlternateImageForEncodingScheme:flexGTCColorSpace:isP3primaries:tonemapItemMetadata:parentImageHandle:gainMapHandle:", 2, cf, v18, v19, a5, v10);
              }
              CFRelease(v16);
              goto LABEL_14;
            }
          }
        }
      }
    }
    else
    {
      FigDebugAssert3();
    }
    LOBYTE(v12) = 0;
  }
LABEL_14:
  if (cf)
    CFRelease(cf);
  return (char)v12;
}

- (BOOL)_addSemanticMattesForEncodingScheme:(int)a3 attachedMediaKey:(id)a4 sampleBuffer:(opaqueCMSampleBuffer *)a5 primaryOutputAspectRatio:(double)a6 settingsID:(int64_t)a7 orientation:(int)a8 parentImageHandle:(int64_t)a9
{
  id v16;
  void *v17;
  _QWORD *v18;
  opaqueCMSampleBuffer *AttachedMedia;
  unsigned int v20;
  __CVBuffer *ImageBuffer;
  __CVBuffer *v22;
  size_t Width;
  size_t Height;
  int64_t v25;
  void *Attributes;
  void *v27;
  float v28;
  double v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  uint64_t v36;
  uint64_t v37;
  CGImageMetadata *v38;
  BOOL v39;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  _QWORD *v42;
  unsigned int v43;
  unsigned int v44;
  CGImageMetadata *v45;
  CGRect v46;
  CGRect v47;

  v16 = -[BWPhotoEncoderController _encoderManagerForEncodingScheme:](self, "_encoderManagerForEncodingScheme:");
  if (!v16)
    goto LABEL_25;
  v17 = v16;
  if ((objc_msgSend(v16, "isContainerOpen") & 1) == 0)
  {
    FigDebugAssert3();
LABEL_25:
    v38 = 0;
    v39 = 0;
    goto LABEL_19;
  }
  if (BWPhotoEncoderIsLinDNGEncodingScheme(a3))
    v18 = (_QWORD *)MEMORY[0x1E0D09500];
  else
    v18 = (_QWORD *)MEMORY[0x1E0D09430];
  AttachedMedia = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a5, (uint64_t)a4);
  v20 = BWPhotoEncoderNodeAuxImageTypeForSemanticMatteAttachedMediaKey(a4);
  ImageBuffer = CMSampleBufferGetImageBuffer(AttachedMedia);
  if (!ImageBuffer)
    goto LABEL_27;
  v22 = ImageBuffer;
  v43 = a8;
  Width = CVPixelBufferGetWidth(ImageBuffer);
  Height = CVPixelBufferGetHeight(v22);
  if (CVPixelBufferGetPixelFormatType(v22) != 1278226488)
    goto LABEL_27;
  v45 = -[BWPhotoEncoderController _newAuxiliaryImagePropertiesFromSemanticMatteSampleBuffer:](self, "_newAuxiliaryImagePropertiesFromSemanticMatteSampleBuffer:", AttachedMedia);
  if (!v45)
  {
    FigSignalErrorAt();
LABEL_27:
    v38 = 0;
LABEL_28:
    v39 = 0;
    goto LABEL_19;
  }
  v42 = v18;
  v44 = v20;
  v25 = a9;
  Attributes = (void *)CVPixelBufferGetAttributes();
  v27 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", BWPhotoEncoderEncodingOptionsForAuxiliaryImage(Width, Height, Attributes, -[BWPhotoEncoderControllerConfiguration usesHighEncodingPriority](self->_configuration, "usesHighEncodingPriority"), -[BWStillImageProcessorControllerConfiguration figThreadPriority](self->_configuration, "figThreadPriority")));
  -[BWPhotoEncoderController mainImageDownscalingFactorForAttachedMediaKey:attachedMediaMetadata:](self, "mainImageDownscalingFactorForAttachedMediaKey:attachedMediaMetadata:", a4, CMGetAttachment(AttachedMedia, (CFStringRef)*MEMORY[0x1E0D05CB0], 0));
  v29 = BWPhotoEncoderDenormalizedZoomRectForAttachedMedia(AttachedMedia, a6, v28);
  v31 = v30;
  v33 = v32;
  v35 = v34;
  if ((objc_msgSend((id)CMGetAttachment(AttachedMedia, (CFStringRef)*MEMORY[0x1E0D05E78], 0), "BOOLValue") & 1) != 0
    || (v46.origin.x = v29, v46.origin.y = v31, v46.size.width = v33, v46.size.height = v35, CGRectIsNull(v46)))
  {
LABEL_13:
    if (-[BWStillImageProcessorControllerInput requiresPhotosAdjustment](-[BWStillImageProcessorControllerRequest input](-[BWStillImageProcessorController currentRequest](self, "currentRequest"), "input"), "requiresPhotosAdjustment"))
    {
      objc_msgSend(v27, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D09350]);
      v36 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v43);
      objc_msgSend(v27, "setObject:forKeyedSubscript:", v36, *MEMORY[0x1E0D093B8]);
    }
    if (v17 == -[BWPhotoEncoderController _encoderManagerForEncodingScheme:](self, "_encoderManagerForEncodingScheme:", 4))
    {
      v37 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
      objc_msgSend(v27, "setObject:forKeyedSubscript:", v37, *MEMORY[0x1E0D094D0]);
    }
    v38 = v45;
    if (!objc_msgSend(v17, "addAuxImage:type:auxImageMetadata:options:parentImageHandle:auxImageHandleOut:", v22, v44, v45, v27, v25, 0))
    {
      objc_msgSend((id)-[BWStillImageProcessorControllerInput encodedAttachedMediaKeys](-[BWStillImageProcessorControllerRequest input](-[BWStillImageProcessorController currentRequest](self, "currentRequest"), "input"), "encodedAttachedMediaKeys"), "addObject:", a4);
      v39 = 1;
      goto LABEL_19;
    }
    goto LABEL_28;
  }
  if (*v42)
  {
    v47.origin.x = v29;
    v47.origin.y = v31;
    v47.size.width = v33;
    v47.size.height = v35;
    objc_msgSend(v27, "setObject:forKeyedSubscript:", CGRectCreateDictionaryRepresentation(v47), *v42);
    objc_msgSend(v27, "setObject:forKeyedSubscript:", 0, *MEMORY[0x1E0D09458]);
    goto LABEL_13;
  }
  FigSignalErrorAt();
  v39 = 0;
  v38 = v45;
LABEL_19:
  if (dword_1ECFE9A10)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (v38)
    CFRelease(v38);
  return v39;
}

- (int)_decompressSmartStylePhotoSurface:(__IOSurface *)a3
{
  int result;

  result = CMPhotoDecompressionSessionCreate();
  if (!result)
    return CMPhotoDecompressionSessionCreateContainer();
  return result;
}

- (int)_updateSmartStyleDeltaMapForSampleBufferIfNeeded:(opaqueCMSampleBuffer *)a3 decompressedStyledPixelBuffer:(__CVBuffer *)a4 stillImageSettings:(id)a5 encodingScheme:(int)a6 processingFlags:(unsigned int)a7
{
  uint64_t v7;
  BWPhotoEncoderController *v12;
  int v13;
  int *v14;
  __CVBuffer *ImageBuffer;
  unint64_t v16;
  __CVBuffer *smartStyleDeltaMapPixelBuffer;
  unint64_t v18;
  int v19;
  unint64_t v20;
  OSType PixelFormatType;
  __CVBuffer *v22;
  uint64_t v25;
  opaqueCMSampleBuffer *AttachedMedia;
  CVImageBufferRef v27;
  CVImageBufferRef v28;
  opaqueCMSampleBuffer *v29;
  CVImageBufferRef v30;
  NSObject *v31;
  const __CFString *v32;
  CFTypeRef v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  opaqueCMSampleBuffer *v42;
  void *v43;
  opaqueCMSampleBuffer *v44;
  CFTypeRef v45;
  CFTypeRef v46;
  __CVBuffer *v47;
  __CVBuffer *v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  int v57;
  int v58;
  int v59;
  NSObject *v61;
  NSObject *v62;
  NSObject *v63;
  NSObject *v64;
  NSObject *v65;
  NSObject *v66;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v68;
  const void *v69;
  id v70;
  BWPhotoEncoderController *v71;

  LODWORD(v7) = a7;
  v12 = self;
  v70 = objc_alloc_init(NSClassFromString((NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CMI%@V%d"), CFSTR("SmartStyleProcessorInputOutput"), -[BWPhotoEncoderControllerConfiguration smartStyleRenderingVersion](self->_configuration, "smartStyleRenderingVersion"))));
  v13 = BWPhotoEncoderDeltaMapPixelFormat((void *)objc_msgSend((id)objc_msgSend(a5, "requestedSettings"), "smartStyle"), a6);
  v14 = &OBJC_IVAR___BWMultiStreamCameraSourceNode__rawCompressionEnabled;
  ImageBuffer = a4;
  if (!a4)
  {
    ImageBuffer = CMSampleBufferGetImageBuffer(a3);
    if (!ImageBuffer)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      v43 = v70;
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      v59 = -12783;
      goto LABEL_49;
    }
  }
  v16 = psn_pixelBufferDimensions(ImageBuffer);
  smartStyleDeltaMapPixelBuffer = v12->_smartStyleDeltaMapPixelBuffer;
  if (smartStyleDeltaMapPixelBuffer)
  {
    v18 = psn_pixelBufferDimensions(smartStyleDeltaMapPixelBuffer);
    v19 = v18;
    v20 = HIDWORD(v18);
    PixelFormatType = CVPixelBufferGetPixelFormatType(v12->_smartStyleDeltaMapPixelBuffer);
    v22 = v12->_smartStyleDeltaMapPixelBuffer;
    if (v19 == (_DWORD)v16 && (_DWORD)v20 == HIDWORD(v16) && PixelFormatType == v13)
    {
      if (v22)
        goto LABEL_15;
    }
    else if (v22)
    {
      CFRelease(v22);
      v12->_smartStyleDeltaMapPixelBuffer = 0;
    }
  }
  v25 = -[BWStillImageProcessorControllerDelegate processorController:newOutputPixelBufferForProcessorInput:type:dimensions:](-[BWStillImageProcessorControllerRequest delegate](-[BWStillImageProcessorController currentRequest](v12, "currentRequest"), "delegate"), "processorController:newOutputPixelBufferForProcessorInput:type:dimensions:", v12, -[BWStillImageProcessorControllerRequest input](-[BWStillImageProcessorController currentRequest](v12, "currentRequest"), "input"), 48, v16);
  v12->_smartStyleDeltaMapPixelBuffer = (__CVBuffer *)v25;
  if (!v25)
  {
LABEL_36:
    v59 = -12780;
    v43 = v70;
LABEL_48:
    v14 = &OBJC_IVAR___BWMultiStreamCameraSourceNode__rawCompressionEnabled;
    goto LABEL_49;
  }
LABEL_15:
  AttachedMedia = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a3, 0x1E495B2D8);
  if (!AttachedMedia)
    goto LABEL_36;
  v27 = CMSampleBufferGetImageBuffer(AttachedMedia);
  if (!v27)
  {
    v61 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT);
    goto LABEL_46;
  }
  v28 = v27;
  v71 = v12;
  v29 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a3, 0x1E495B298);
  if (v29)
  {
    v30 = CMSampleBufferGetImageBuffer(v29);
    if (!v30)
    {
      v31 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT);
      v12 = v71;
LABEL_46:
      v43 = v70;
      goto LABEL_47;
    }
  }
  else
  {
    v30 = 0;
  }
  v32 = (const __CFString *)*MEMORY[0x1E0D05CB0];
  v33 = CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  if (!v33)
  {
    v62 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT);
    v12 = v71;
    v43 = v70;
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    v59 = -12780;
    goto LABEL_48;
  }
  if (a4)
  {
    v34 = (double)(int)v16;
    v35 = (double)SHIDWORD(v16);
    v36 = 0.0;
    v37 = 0.0;
    v7 = v7;
  }
  else
  {
    v7 = v7;
    -[BWPhotoEncoderController _cropRectForRequestedSettings:inputDimensions:metadata:processingFlags:](v71, "_cropRectForRequestedSettings:inputDimensions:metadata:processingFlags:", objc_msgSend(a5, "requestedSettings"), v16, v33, v7);
    v36 = v38;
    v37 = v39;
    v34 = v40;
    v35 = v41;
  }
  v42 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a3, 0x1E495B278);
  v43 = v70;
  if (!v42
    || (v44 = v42, (v45 = CMGetAttachment(v42, v32, 0)) == 0)
    || (v46 = v45, (v47 = CMSampleBufferGetImageBuffer(v44)) == 0))
  {
    FigDebugAssert3();
    v63 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT);
    v12 = v71;
LABEL_47:
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    v59 = -12783;
    goto LABEL_48;
  }
  v48 = v47;
  -[BWPhotoEncoderController _cropRectForRequestedSettings:inputDimensions:metadata:processingFlags:](v71, "_cropRectForRequestedSettings:inputDimensions:metadata:processingFlags:", objc_msgSend(a5, "requestedSettings"), psn_pixelBufferDimensions(v47), v46, v7);
  v50 = v49;
  v52 = v51;
  v54 = v53;
  v56 = v55;
  v57 = -[CMISmartStyleProcessor resetState](v71->_smartStyleProcessor, "resetState");
  if (v57)
  {
    v59 = v57;
    v64 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT);
    v12 = v71;
  }
  else
  {
    objc_msgSend(v70, "setInputUnstyledPixelBuffer:", ImageBuffer);
    objc_msgSend(v70, "setInputUnstyledCropRect:", v36, v37, v34, v35);
    if (v30)
      objc_msgSend(v70, "setInputUnstyledThumbnailPixelBuffer:", v30);
    objc_msgSend(v70, "setInputStyleCoefficientsPixelBuffer:", v28);
    objc_msgSend(v70, "setInputReferenceForDeltaMapComputationPixelBuffer:", v48);
    objc_msgSend(v70, "setInputReferenceForDeltaMapComputationCropRect:", v50, v52, v54, v56);
    objc_msgSend(v70, "setOutputStyledCropRect:", v36, v37, v34, v35);
    v12 = v71;
    objc_msgSend(v70, "setOutputDeltaMapPixelBuffer:", v71->_smartStyleDeltaMapPixelBuffer);
    objc_msgSend(v70, "setOutputDeltaMapCropRect:", v36, v37, v34, v35);
    -[CMISmartStyleProcessor setInputOutput:](v71->_smartStyleProcessor, "setInputOutput:", v70);
    -[CMISmartStyleProcessor setConfiguration:](v71->_smartStyleProcessor, "setConfiguration:", objc_msgSend((id)objc_opt_class(), "getDefaultProcessorConfigurationForStillsReversibility"));
    v58 = -[CMISmartStyleProcessor prepareToProcess:](v71->_smartStyleProcessor, "prepareToProcess:", 4);
    if (v58 || (v58 = -[CMISmartStyleProcessor process](v71->_smartStyleProcessor, "process")) != 0)
    {
      v59 = v58;
      v65 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT);
    }
    else
    {
      v59 = -[CMISmartStyleProcessor finishProcessing](v71->_smartStyleProcessor, "finishProcessing");
      if (!v59)
      {
        -[BWStillImageProcessorControllerInput setDeltaMapIsValid:](-[BWStillImageProcessorControllerRequest input](-[BWStillImageProcessorController currentRequest](v71, "currentRequest"), "input"), "setDeltaMapIsValid:", 1);

        return v59;
      }
      v66 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT);
    }
  }
  v14 = &OBJC_IVAR___BWMultiStreamCameraSourceNode__rawCompressionEnabled;
  fig_log_call_emit_and_clean_up_after_send_and_compose();
LABEL_49:

  v68 = v14[527];
  v69 = *(Class *)((char *)&v12->super.super.isa + v68);
  if (v69)
  {
    CFRelease(v69);
    *(Class *)((char *)&v12->super.super.isa + v68) = 0;
  }
  return v59;
}

- (int)_computeAndAddSmartStyleDeltaMapToClosedSurfaceContainer:(__IOSurface *)a3 sampleBuffer:(opaqueCMSampleBuffer *)a4 encodingScheme:(int)a5 stillImageSettings:(id)a6 processingFlags:(unsigned int)a7
{
  uint64_t v7;
  uint64_t v9;
  int v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  NSObject *v19;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v22;
  NSObject *v23;
  _QWORD v24[2];
  _QWORD v25[19];

  v7 = *(_QWORD *)&a7;
  v9 = *(_QWORD *)&a5;
  v25[18] = *MEMORY[0x1E0C80C00];
  v13 = -[BWPhotoEncoderController _decompressSmartStylePhotoSurface:](self, "_decompressSmartStylePhotoSurface:");
  if (v13
    || (v13 = -[BWPhotoEncoderController _updateSmartStyleDeltaMapForSampleBufferIfNeeded:decompressedStyledPixelBuffer:stillImageSettings:encodingScheme:processingFlags:](self, "_updateSmartStyleDeltaMapForSampleBufferIfNeeded:decompressedStyledPixelBuffer:stillImageSettings:encodingScheme:processingFlags:", a4, self->_smartStyleDecompressedStyledPixelBuffer, a6, v9, v7)) != 0)
  {
    v18 = v13;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
  }
  else
  {
    v14 = -[BWPhotoEncoderController _encoderManagerForEncodingScheme:](self, "_encoderManagerForEncodingScheme:", v9);
    if (!v14)
    {
      v22 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      v18 = 0;
      goto LABEL_6;
    }
    v15 = v14;
    v16 = BWPhotoEncoderContainerFormatForEncodingScheme(v9);
    v24[0] = *MEMORY[0x1E0D09318];
    v17 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v16);
    v24[1] = *MEMORY[0x1E0D09308];
    v25[0] = v17;
    v25[1] = &unk_1E49FB3E8;
    v18 = objc_msgSend(v15, "openExistingContainer:options:", a3, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 2));
    if (!v18)
    {
      -[BWPhotoEncoderController _primaryOutputAspectRatioForSettings:](self, "_primaryOutputAspectRatioForSettings:", a6);
      -[BWPhotoEncoderController _addSmartStyleDeltaMapForEncodingScheme:sampleBuffer:stillImageSettings:primaryOutputAspectRatio:](self, "_addSmartStyleDeltaMapForEncodingScheme:sampleBuffer:stillImageSettings:primaryOutputAspectRatio:", v9, a4, a6);
      goto LABEL_6;
    }
    v23 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
  }
  fig_log_call_emit_and_clean_up_after_send_and_compose();
LABEL_6:
  if (dword_1ECFE9A10)
  {
    v19 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v18;
}

- (int)_addUnstyledImageForEncodingScheme:(int)a3 sbuf:(opaqueCMSampleBuffer *)a4 imageDimensions:(id)a5 processingFlags:(unsigned int)a6 metadata:(id)a7 requestedStillImageCaptureSettings:(id)a8 resolvedStillImageCaptureSettings:(id)a9 cropRect:(CGRect)a10 usePixelsOutsideCrop:(BOOL)a11
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v20;
  opaqueCMSampleBuffer *AttachedMedia;
  CVImageBufferRef ImageBuffer;
  CVImageBufferRef v23;
  void *v24;
  CFDictionaryRef DictionaryRepresentation;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unsigned int v31;
  CGRect v32;
  CGRect v33;

  if (a3 != 2)
    goto LABEL_16;
  height = a10.size.height;
  width = a10.size.width;
  y = a10.origin.y;
  x = a10.origin.x;
  v20 = -[BWPhotoEncoderController _encoderManagerForEncodingScheme:](self, "_encoderManagerForEncodingScheme:", *(_QWORD *)&a3, a4, a5, *(_QWORD *)&a6);
  if (!v20)
    return (int)v20;
  AttachedMedia = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a4, 0x1E495B278);
  if (!AttachedMedia || (ImageBuffer = CMSampleBufferGetImageBuffer(AttachedMedia)) == 0)
  {
LABEL_16:
    LODWORD(v20) = 0;
    return (int)v20;
  }
  v23 = ImageBuffer;
  v24 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v32.origin.x = x;
  v32.origin.y = y;
  v32.size.width = width;
  v32.size.height = height;
  if (!CGRectIsEmpty(v32))
  {
    v33.origin.x = x;
    v33.origin.y = y;
    v33.size.width = width;
    v33.size.height = height;
    DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v33);
    objc_msgSend(v24, "setObject:forKeyedSubscript:", DictionaryRepresentation, *MEMORY[0x1E0D09430]);
    if (DictionaryRepresentation)
      CFRelease(DictionaryRepresentation);
  }
  if (a11)
    objc_msgSend(v24, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D09458]);
  v26 = BWPhotoEncoderCodecTypeForEncodingScheme(2u);
  BYTE1(v31) = 1;
  LOBYTE(v31) = self->_heifUseTiling;
  -[BWPhotoEncoderController _addQualityOptionsToDictionary:codecType:pixelBuffer:imageDimensions:metadata:requestedStillImageCaptureSettings:resolvedStillImageCaptureSettings:enableHEIFTiling:enableHEIFOrientation:auxImageType:](self, "_addQualityOptionsToDictionary:codecType:pixelBuffer:imageDimensions:metadata:requestedStillImageCaptureSettings:resolvedStillImageCaptureSettings:enableHEIFTiling:enableHEIFOrientation:auxImageType:", v24, v26, v23, a5, a7, a8, a9, v31);
  v27 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v26);
  objc_msgSend(v24, "setObject:forKeyedSubscript:", v27, *MEMORY[0x1E0D09378]);
  if (-[BWPhotoEncoderControllerConfiguration usesHighEncodingPriority](self->_configuration, "usesHighEncodingPriority"))
  {
    objc_msgSend(v24, "setObject:forKeyedSubscript:", &unk_1E49FB3B8, *MEMORY[0x1E0D09400]);
  }
  v28 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BWStillImageProcessorControllerConfiguration figThreadPriority](self->_configuration, "figThreadPriority"));
  objc_msgSend(v24, "setObject:forKeyedSubscript:", v28, *MEMORY[0x1E0D09438]);
  if (-[BWStillImageProcessorControllerInput requiresPhotosAdjustment](-[BWStillImageProcessorControllerRequest input](-[BWStillImageProcessorController currentRequest](self, "currentRequest"), "input"), "requiresPhotosAdjustment"))
  {
    objc_msgSend(v24, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D09350]);
    v29 = objc_msgSend(a7, "objectForKeyedSubscript:", *MEMORY[0x1E0D05E50]);
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v29, *MEMORY[0x1E0D093B8]);
  }
  LODWORD(v20) = objc_msgSend(v20, "addMainImage:metadata:options:imageHandleOut:", v23, 0, v24, 0);
  if ((_DWORD)v20)
    FigDebugAssert3();
  return (int)v20;
}

- (BOOL)_addSmartStyleLinearThumbnailForEncodingScheme:(int)a3 sampleBuffer:(opaqueCMSampleBuffer *)a4 primaryOutputAspectRatio:(double)a5
{
  id AttachedMedia;
  id v10;
  opaqueCMSampleBuffer *v11;
  __CVBuffer *v12;
  size_t Width;
  size_t Height;
  void *Attributes;
  void *v16;
  _QWORD *v17;
  opaqueCMSampleBuffer *v18;
  char v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  double v28;
  uint64_t v29;
  opaqueCMSampleBuffer *target;
  void *v32;
  uint64_t v33;
  _QWORD v34[2];
  CGRect v35;

  v34[1] = *MEMORY[0x1E0C80C00];
  AttachedMedia = -[BWPhotoEncoderController _encoderManagerForEncodingScheme:](self, "_encoderManagerForEncodingScheme:");
  if (AttachedMedia)
  {
    v10 = AttachedMedia;
    LODWORD(AttachedMedia) = objc_msgSend(AttachedMedia, "isContainerOpen");
    if ((_DWORD)AttachedMedia)
    {
      AttachedMedia = (id)BWSampleBufferGetAttachedMedia(a4, 0x1E495B258);
      if (AttachedMedia)
      {
        v11 = (opaqueCMSampleBuffer *)AttachedMedia;
        target = a4;
        v32 = v10;
        AttachedMedia = CMSampleBufferGetImageBuffer((CMSampleBufferRef)AttachedMedia);
        if (AttachedMedia)
        {
          v12 = (__CVBuffer *)AttachedMedia;
          Width = CVPixelBufferGetWidth((CVPixelBufferRef)AttachedMedia);
          Height = CVPixelBufferGetHeight(v12);
          Attributes = (void *)CVPixelBufferGetAttributes();
          v16 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", BWPhotoEncoderEncodingOptionsForAuxiliaryImage(Width, Height, Attributes, -[BWPhotoEncoderControllerConfiguration usesHighEncodingPriority](self->_configuration, "usesHighEncodingPriority"), -[BWStillImageProcessorControllerConfiguration figThreadPriority](self->_configuration, "figThreadPriority")));
          if (CVPixelBufferGetPixelFormatType(v12) != 2019963440)
            goto LABEL_17;
          if (a3 == 3)
            v17 = (_QWORD *)MEMORY[0x1E0D09500];
          else
            v17 = (_QWORD *)MEMORY[0x1E0D09430];
          v18 = target;
          v19 = objc_msgSend((id)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05E78], 0), "BOOLValue");
          v20 = BWPhotoEncoderDenormalizedZoomRectForAttachedMedia(v11, a5, 1.0);
          if ((v19 & 1) == 0)
          {
            v24 = v20;
            v25 = v21;
            v26 = v22;
            v27 = v23;
            if (!CGRectIsNull(*(CGRect *)&v20))
            {
              v35.origin.x = v24;
              v35.origin.y = v25;
              v35.size.width = v26;
              v35.size.height = v27;
              objc_msgSend(v16, "setObject:forKeyedSubscript:", CGRectCreateDictionaryRepresentation(v35), *v17);
              objc_msgSend(v16, "setObject:forKeyedSubscript:", 0, *MEMORY[0x1E0D09458]);
            }
          }
          if (-[BWStillImageProcessorControllerInput requiresPhotosAdjustment](-[BWStillImageProcessorControllerRequest input](-[BWStillImageProcessorController currentRequest](self, "currentRequest", v20, target), "input"), "requiresPhotosAdjustment"))
          {
            objc_msgSend(v16, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D09350]);
            objc_msgSend(v16, "setObject:forKeyedSubscript:", objc_msgSend((id)CMGetAttachment(v18, (CFStringRef)*MEMORY[0x1E0D05CB0], 0), "objectForKeyedSubscript:", *MEMORY[0x1E0D05E50]), *MEMORY[0x1E0D093B8]);
          }
          objc_msgSend(v16, "setObject:forKeyedSubscript:", &unk_1E49FB400, *MEMORY[0x1E0D09418]);
          v33 = *MEMORY[0x1E0D09618];
          LODWORD(v28) = 1050253722;
          v34[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v28);
          v29 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v29, *MEMORY[0x1E0D09410]);
          if (objc_msgSend(v32, "addAuxImage:type:auxImageMetadata:options:parentImageHandle:auxImageHandleOut:", v12, 10, 0, v16, 0, 0))
          {
LABEL_17:
            LOBYTE(AttachedMedia) = 0;
          }
          else
          {
            objc_msgSend((id)-[BWStillImageProcessorControllerInput encodedAttachedMediaKeys](-[BWStillImageProcessorControllerRequest input](-[BWStillImageProcessorController currentRequest](self, "currentRequest"), "input"), "encodedAttachedMediaKeys"), "addObject:", 0x1E495B258);
            LOBYTE(AttachedMedia) = 1;
          }
        }
      }
    }
  }
  return (char)AttachedMedia;
}

- (BOOL)_addSmartStyleDeltaMapForEncodingScheme:(int)a3 sampleBuffer:(opaqueCMSampleBuffer *)a4 stillImageSettings:(id)a5 primaryOutputAspectRatio:(double)a6
{
  id v11;
  id v12;
  __CVBuffer *smartStyleDeltaMapPixelBuffer;
  id v14;
  size_t Width;
  size_t Height;
  void *Attributes;
  unint64_t v18;
  void *v19;
  unsigned int v20;
  void *v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  unsigned int v26;
  char v27;
  CGFloat v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  _QWORD *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  _BOOL4 v39;
  unint64_t v40;
  BOOL v41;
  uint64_t v43;
  double v44;
  __CVBuffer *v45;
  void *v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;

  v11 = -[BWPhotoEncoderController _encoderManagerForEncodingScheme:](self, "_encoderManagerForEncodingScheme:");
  if (v11)
  {
    v12 = v11;
    LODWORD(v11) = objc_msgSend(v11, "isContainerOpen");
    if ((_DWORD)v11)
    {
      smartStyleDeltaMapPixelBuffer = self->_smartStyleDeltaMapPixelBuffer;
      if (!smartStyleDeltaMapPixelBuffer)
        goto LABEL_24;
      v44 = a6;
      v46 = v12;
      v14 = a5;
      Width = CVPixelBufferGetWidth(smartStyleDeltaMapPixelBuffer);
      Height = CVPixelBufferGetHeight(smartStyleDeltaMapPixelBuffer);
      v45 = smartStyleDeltaMapPixelBuffer;
      Attributes = (void *)CVPixelBufferGetAttributes();
      v18 = Width;
      v19 = v14;
      v20 = a3;
      v21 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", BWPhotoEncoderEncodingOptionsForAuxiliaryImage(v18, Height, Attributes, -[BWPhotoEncoderControllerConfiguration usesHighEncodingPriority](self->_configuration, "usesHighEncodingPriority"), -[BWStillImageProcessorControllerConfiguration figThreadPriority](self->_configuration, "figThreadPriority")));
      v22 = *MEMORY[0x1E0C9D648];
      v23 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v24 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v25 = *(double *)(MEMORY[0x1E0C9D648] + 24);
      v26 = BWStillImageProcessingFlagsForSampleBuffer(a4);
      v27 = BWIsDeferredPhotoProxyImage(v26);
      v28 = v23;
      v29 = v24;
      v30 = v25;
      v31 = v22;
      if ((BWPhotoEncoderDecompressStyledImageForDeltaMap((void *)objc_msgSend((id)objc_msgSend(v19, "requestedSettings"), "smartStyle"), v27) & 1) == 0)
      {
        v31 = BWPhotoEncoderDenormalizedZoomRectForAttachedMedia(a4, v44, 1.0);
        v28 = v32;
        v29 = v33;
        v30 = v34;
        if ((objc_msgSend((id)CMGetAttachment(a4, (CFStringRef)*MEMORY[0x1E0D05E78], 0), "BOOLValue") & 1) == 0)
        {
          v47.origin.x = v31;
          v47.origin.y = v28;
          v47.size.width = v29;
          v47.size.height = v30;
          if (!CGRectIsNull(v47))
          {
            v35 = (_QWORD *)MEMORY[0x1E0D09500];
            if (a3 != 3)
              v35 = (_QWORD *)MEMORY[0x1E0D09430];
            v48.origin.x = v31;
            v48.origin.y = v28;
            v48.size.width = v29;
            v48.size.height = v30;
            objc_msgSend(v21, "setObject:forKeyedSubscript:", CGRectCreateDictionaryRepresentation(v48), *v35);
            objc_msgSend(v21, "setObject:forKeyedSubscript:", 0, *MEMORY[0x1E0D09458]);
          }
        }
      }
      v36 = (void *)CMGetAttachment(a4, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
      if (-[BWStillImageProcessorControllerInput requiresPhotosAdjustment](-[BWStillImageProcessorControllerRequest input](-[BWStillImageProcessorController currentRequest](self, "currentRequest"), "input"), "requiresPhotosAdjustment"))
      {
        objc_msgSend(v21, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D09350]);
        v37 = objc_msgSend(v36, "objectForKeyedSubscript:", *MEMORY[0x1E0D05E50]);
        objc_msgSend(v21, "setObject:forKeyedSubscript:", v37, *MEMORY[0x1E0D093B8]);
      }
      v38 = BWPhotoEncoderCodecTypeForEncodingScheme(v20);
      v49.origin.x = v31;
      v49.origin.y = v28;
      v49.size.width = v29;
      v49.size.height = v30;
      v50.origin.x = v22;
      v50.origin.y = v23;
      v50.size.width = v24;
      v50.size.height = v25;
      v39 = CGRectEqualToRect(v49, v50);
      v40 = v39 ? v18 : (int)v29;
      Height = v39 ? Height : (int)v30;
      v41 = v20 == 2 && self->_heifUseTiling;
      HIDWORD(v43) = 12;
      LOWORD(v43) = v41;
      -[BWPhotoEncoderController _addQualityOptionsToDictionary:codecType:pixelBuffer:imageDimensions:metadata:requestedStillImageCaptureSettings:resolvedStillImageCaptureSettings:enableHEIFTiling:enableHEIFOrientation:auxImageType:](self, "_addQualityOptionsToDictionary:codecType:pixelBuffer:imageDimensions:metadata:requestedStillImageCaptureSettings:resolvedStillImageCaptureSettings:enableHEIFTiling:enableHEIFOrientation:auxImageType:", v21, v38, v45, v40 | (Height << 32), v36, objc_msgSend(v19, "requestedSettings"), objc_msgSend(v19, "captureSettings"), v43);
      if (objc_msgSend(v46, "addAuxImage:type:auxImageMetadata:options:parentImageHandle:auxImageHandleOut:", v45, 12, 0, v21, 0, 0))
      {
LABEL_24:
        LOBYTE(v11) = 0;
      }
      else
      {
        objc_msgSend((id)-[BWStillImageProcessorControllerInput encodedAttachedMediaKeys](-[BWStillImageProcessorControllerRequest input](-[BWStillImageProcessorController currentRequest](self, "currentRequest"), "input"), "encodedAttachedMediaKeys"), "addObject:", 0x1E495B338);
        LOBYTE(v11) = 1;
      }
    }
  }
  return (char)v11;
}

- (int)_addSmartStyleMetadataForEncodingScheme:(int)a3 sampleBuffer:(opaqueCMSampleBuffer *)a4 requestedStillImageCaptureSettings:(id)a5
{
  id v7;
  void *v8;
  opaqueCMSampleBuffer *AttachedMedia;
  __CVBuffer *ImageBuffer;
  opaqueCMSampleBuffer *v11;
  __CVBuffer *v12;
  opaqueCMSampleBuffer *v13;
  __CVBuffer *v14;
  const __CFString *v15;
  void *v16;
  const void *v17;
  void *v18;
  void *v19;

  v7 = -[BWPhotoEncoderController _encoderManagerForEncodingScheme:](self, "_encoderManagerForEncodingScheme:", *(_QWORD *)&a3);
  if (v7)
  {
    v8 = v7;
    if ((objc_msgSend(v7, "isContainerOpen") & 1) != 0)
    {
      AttachedMedia = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a4, 0x1E495B2D8);
      if (AttachedMedia)
        ImageBuffer = CMSampleBufferGetImageBuffer(AttachedMedia);
      else
        ImageBuffer = 0;
      v11 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a4, 0x1E495B2F8);
      if (v11)
        v12 = CMSampleBufferGetImageBuffer(v11);
      else
        v12 = 0;
      v13 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a4, 0x1E495B318);
      if (v13)
        v14 = CMSampleBufferGetImageBuffer(v13);
      else
        v14 = 0;
      v15 = (const __CFString *)*MEMORY[0x1E0D05CB0];
      v16 = (void *)CMGetAttachment(a4, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
      v17 = (const void *)BWSampleBufferGetAttachedMedia(a4, 0x1E495B258);
      if (v17)
      {
        v18 = (void *)CMGetAttachment(v17, v15, 0);
        if (v18)
        {
          v19 = BWSmartStyleInfoDictionary(v16, v18, ImageBuffer, v12, v14, (uint64_t)a5, 0);
          if (objc_msgSend(v19, "count"))
            return objc_msgSend(v8, "addCustomMetadataContents:URI:name:", v19, *MEMORY[0x1E0D09488], CFSTR("metadata"));
        }
      }
    }
    else
    {
      FigDebugAssert3();
    }
  }
  return 0;
}

- (BOOL)_addConstantColorConfidenceMapForEncodingScheme:(int)a3 sampleBuffer:(opaqueCMSampleBuffer *)a4
{
  id AttachedMedia;
  void *v7;
  __CVBuffer *v8;
  size_t Width;
  size_t Height;
  void *Attributes;
  void *v12;

  AttachedMedia = -[BWPhotoEncoderController _encoderManagerForEncodingScheme:](self, "_encoderManagerForEncodingScheme:", *(_QWORD *)&a3);
  if (AttachedMedia)
  {
    v7 = AttachedMedia;
    LODWORD(AttachedMedia) = objc_msgSend(AttachedMedia, "isContainerOpen");
    if ((_DWORD)AttachedMedia)
    {
      AttachedMedia = (id)BWSampleBufferGetAttachedMedia(a4, 0x1E495B438);
      if (AttachedMedia)
      {
        AttachedMedia = CMSampleBufferGetImageBuffer((CMSampleBufferRef)AttachedMedia);
        if (AttachedMedia)
        {
          v8 = (__CVBuffer *)AttachedMedia;
          Width = CVPixelBufferGetWidth((CVPixelBufferRef)AttachedMedia);
          Height = CVPixelBufferGetHeight(v8);
          Attributes = (void *)CVPixelBufferGetAttributes();
          v12 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", BWPhotoEncoderEncodingOptionsForAuxiliaryImage(Width, Height, Attributes, -[BWPhotoEncoderControllerConfiguration usesHighEncodingPriority](self->_configuration, "usesHighEncodingPriority"), -[BWStillImageProcessorControllerConfiguration figThreadPriority](self->_configuration, "figThreadPriority")));
          if (-[BWStillImageProcessorControllerInput requiresPhotosAdjustment](-[BWStillImageProcessorControllerRequest input](-[BWStillImageProcessorController currentRequest](self, "currentRequest"), "input"), "requiresPhotosAdjustment"))
          {
            objc_msgSend(v12, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D09350]);
            objc_msgSend(v12, "setObject:forKeyedSubscript:", objc_msgSend((id)CMGetAttachment(a4, (CFStringRef)*MEMORY[0x1E0D05CB0], 0), "objectForKeyedSubscript:", *MEMORY[0x1E0D05E50]), *MEMORY[0x1E0D093B8]);
          }
          LOBYTE(AttachedMedia) = objc_msgSend(v7, "addAuxImage:type:auxImageMetadata:options:parentImageHandle:auxImageHandleOut:", v8, 11, 0, v12, 0, 0) == 0;
        }
      }
    }
  }
  return (char)AttachedMedia;
}

- (void)_tagStereoPairGroupForEncodingScheme:(int)a3 stereoPhotoImageHandles:(id *)a4 groupMetadata:(id)a5
{
  id v7;
  void *v8;
  __int128 v9;
  int64_t var2;

  v7 = -[BWPhotoEncoderController _encoderManagerForEncodingScheme:](self, "_encoderManagerForEncodingScheme:", *(_QWORD *)&a3);
  if (v7)
  {
    v8 = v7;
    if (objc_msgSend(v7, "isContainerOpen"))
    {
      v9 = *(_OWORD *)&a4->var0;
      var2 = a4->var2;
      objc_msgSend(v8, "tagStereoPairGroupWithStereoPhotoImageHandles:groupMetadata:", &v9, a5);
    }
  }
}

- (CGImageMetadata)_newAuxiliaryImagePropertiesFromSemanticMatteSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  CFTypeRef v4;
  void *v5;
  CGImageMetadata *Mutable;
  CGImageMetadata *v7;
  const __CFString *v8;
  const __CFString *v9;
  uint64_t v10;
  uint64_t v11;
  CFErrorRef err;

  v4 = CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D08738], 0);
  if (!v4)
  {
    FigSignalErrorAt();
    return 0;
  }
  v5 = (void *)v4;
  Mutable = CGImageMetadataCreateMutable();
  v7 = Mutable;
  if (!Mutable)
  {
    FigSignalErrorAt();
    return v7;
  }
  v8 = (const __CFString *)*MEMORY[0x1E0D08758];
  v9 = (const __CFString *)*MEMORY[0x1E0D08760];
  err = 0;
  if (!CGImageMetadataRegisterNamespaceForPrefix(Mutable, v8, v9, &err))
  {
LABEL_9:
    CFRelease(v7);
    return 0;
  }
  v10 = objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D08770]), "intValue");
  v11 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v10);
  if (-[BWPhotoEncoderController _addValue:toAuxiliaryImageProperties:namespace:prefix:key:](self, "_addValue:toAuxiliaryImageProperties:namespace:prefix:key:", v11, v7, v8, v9, *MEMORY[0x1E0D08768]))
  {
    FigDebugAssert3();
    goto LABEL_9;
  }
  return v7;
}

- (int)_addValue:(id)a3 toAuxiliaryImageProperties:(CGImageMetadata *)a4 namespace:(__CFString *)a5 prefix:(__CFString *)a6 key:(__CFString *)a7
{
  CGImageMetadataTagRef v10;
  CGImageMetadataTag *v11;
  __CFString *v12;
  int v13;

  if (a3)
  {
    v10 = CGImageMetadataTagCreate(a5, a6, a7, kCGImageMetadataTypeDefault, a3);
    if (v10)
    {
      v11 = v10;
      v12 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@:%@"), a6, a7);
      if (v12)
      {
        if (CGImageMetadataSetTagWithPath(a4, 0, v12, v11))
        {
          v13 = 0;
        }
        else
        {
          FigDebugAssert3();
          v13 = -16992;
        }
      }
      else
      {
        FigDebugAssert3();
        v13 = -16991;
      }
      CFRelease(v11);
    }
    else
    {
      FigDebugAssert3();
      v12 = 0;
      v13 = -16991;
    }
  }
  else
  {
    v12 = 0;
    v13 = -17102;
  }

  return v13;
}

- (int)_addMetadataAttachmentsForEncodingScheme:(int)a3 sampleBuffer:(opaqueCMSampleBuffer *)a4 requestedSettings:(id)a5 captureType:(int)a6 parentImageHandle:(int64_t)a7
{
  uint64_t v8;
  uint64_t v11;
  id v13;
  void *v14;
  id v15;
  int v16;

  v8 = *(_QWORD *)&a6;
  v11 = *(_QWORD *)&a3;
  v13 = -[BWPhotoEncoderController _encoderManagerForEncodingScheme:](self, "_encoderManagerForEncodingScheme:");
  if (!v13)
    goto LABEL_7;
  v14 = v13;
  if ((objc_msgSend(v13, "isContainerOpen") & 1) == 0)
  {
    FigDebugAssert3();
LABEL_7:
    v16 = 0;
    v15 = 0;
    goto LABEL_5;
  }
  v15 = -[BWPhotoEncoderController _newMetadataAttachmentsForEncodingScheme:sampleBuffer:requestedSettings:captureType:](self, "_newMetadataAttachmentsForEncodingScheme:sampleBuffer:requestedSettings:captureType:", v11, a4, a5, v8);
  if (v15)
    v16 = objc_msgSend(v14, "addMetadata:parentImageHandle:", v15, a7);
  else
    v16 = 0;
LABEL_5:

  return v16;
}

- (id)_newMetadataAttachmentsForEncodingScheme:(int)a3 sampleBuffer:(opaqueCMSampleBuffer *)a4 requestedSettings:(id)a5 captureType:(int)a6
{
  __CVBuffer *ImageBuffer;
  CFTypeRef v11;
  void *v12;
  int v13;
  int v14;
  int v15;
  int v16;
  const void *StillImageMetadataInSettingsForSampleBuffer;
  void *IrisAssetIdentifierForSettingsAndSampleBuffer;
  __CFDictionary *MetadataAttachments;
  __CFString *v21;
  unsigned int v22;

  v22 = 5;
  if (a3 == 1)
  {
    v21 = 0;
  }
  else
  {
    ImageBuffer = CMSampleBufferGetImageBuffer(a4);
    v11 = CMGetAttachment(a4, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
    if (BWPhotoEncoderDefaultJPEGIndexedQTable(ImageBuffer, (_BOOL8)v11, a6, (int *)&v22, 0, -[BWPhotoEncoderControllerConfiguration zeroShutterLagEnabled](self->_configuration, "zeroShutterLagEnabled")))return 0;
    v21 = BWPhotoEncoderTranscodeQualityHintFromQuantizationTableIndex(v22);
  }
  v12 = (void *)objc_msgSend((id)CMGetAttachment(a4, CFSTR("PhotoManifest"), 0), "descriptorForSampleBuffer:", a4);
  BWStillImageProcessingFlagsForSampleBuffer(a4);
  v13 = objc_msgSend(a5, "outputOrientation");
  v14 = objc_msgSend(a5, "outputMirroring");
  v15 = -[BWPhotoEncoderControllerConfiguration cameraSupportsFlash](self->_configuration, "cameraSupportsFlash");
  v16 = objc_msgSend(a5, "flashMode");
  StillImageMetadataInSettingsForSampleBuffer = (const void *)FigCaptureMetadataUtilitiesGetStillImageMetadataInSettingsForSampleBuffer(a5, a4);
  IrisAssetIdentifierForSettingsAndSampleBuffer = (void *)FigCaptureMetadataUtilitiesGetIrisAssetIdentifierForSettingsAndSampleBuffer(a5, a4);
  MetadataAttachments = FigCaptureMetadataUtilitiesCreateMetadataAttachments(a4, v13, v14, v15, 1, v16, 0, 1, 0, 1, 0, 0, 0, 0, StillImageMetadataInSettingsForSampleBuffer, IrisAssetIdentifierForSettingsAndSampleBuffer, (const void *)objc_msgSend(a5, "imageGroupIdentifier"), v21, objc_msgSend(v12, "time"),
                          self->_clientExpectsCameraMountedInLandscapeOrientation);
  if (-[BWStillImageProcessorControllerInput requiresPhotosAdjustment](-[BWStillImageProcessorControllerRequest input](-[BWStillImageProcessorController currentRequest](self, "currentRequest"), "input"), "requiresPhotosAdjustment"))-[__CFDictionary setObject:forKeyedSubscript:](MetadataAttachments, "setObject:forKeyedSubscript:", &unk_1E49FB478, *MEMORY[0x1E0CBCFF0]);
  return MetadataAttachments;
}

- (id)_newRawMetadataAttachmentsForEncodingScheme:(int)a3 sampleBuffer:(opaqueCMSampleBuffer *)a4 dngDictionary:(id)a5 requestedSettings:(id)a6 captureType:(int)a7 dngContainsDepthData:(BOOL)a8 dngContainsSemanticSegmentationMattes:(BOOL)a9
{
  _BOOL8 v9;
  id v13;
  void *v14;
  int v15;
  void *v16;

  v9 = a8;
  v13 = -[BWPhotoEncoderController _newMetadataAttachmentsForEncodingScheme:sampleBuffer:requestedSettings:captureType:](self, "_newMetadataAttachmentsForEncodingScheme:sampleBuffer:requestedSettings:captureType:", *(_QWORD *)&a3, a4, a6, *(_QWORD *)&a7);
  if (v13)
  {
    v14 = (void *)CMGetAttachment(a4, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
    v15 = objc_msgSend(a6, "rawOutputFileCodec");
    v16 = BWCreateRawMetadataFromMetadata(v13, a5, 0x10000u, objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E0D06948]), v9, a9, v15);
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (__IOSurface)_closeContainerAndCopySurfaceForEncodingScheme:(int)a3
{
  __IOSurface *result;
  __IOSurface *v5;
  __IOSurface *v6;

  v6 = 0;
  result = -[BWPhotoEncoderController _encoderManagerForEncodingScheme:](self, "_encoderManagerForEncodingScheme:", *(_QWORD *)&a3);
  if (result)
  {
    v5 = result;
    if (-[__IOSurface isContainerOpen](result, "isContainerOpen"))
    {
      -[BWStillImageProcessorControllerInput setReservedPrimaryImageHandle:](-[BWStillImageProcessorControllerRequest input](-[BWStillImageProcessorController currentRequest](self, "currentRequest"), "input"), "setReservedPrimaryImageHandle:", -1);
      -[BWStillImageProcessorControllerInput setToneMapAlternateGroupHandle:](-[BWStillImageProcessorControllerRequest input](-[BWStillImageProcessorController currentRequest](self, "currentRequest"), "input"), "setToneMapAlternateGroupHandle:", -1);
      -[__IOSurface closeContainerAndCopySurfaceOut:](v5, "closeContainerAndCopySurfaceOut:", &v6);
      return v6;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (void)_getAssetsSizeForEncodingScheme:(int)a3 containerSizeOut:(unint64_t *)a4 thumbnailSizeOut:(unint64_t *)a5 auxiliaryImagesSizeOut:(unint64_t *)a6
{
  id v9;
  void *v10;

  v9 = -[BWPhotoEncoderController _encoderManagerForEncodingScheme:](self, "_encoderManagerForEncodingScheme:", *(_QWORD *)&a3);
  if (v9)
  {
    v10 = v9;
    if (a5)
      *a5 = objc_msgSend(v9, "thumbnailImageSize");
    if (a6)
      *a6 = objc_msgSend(v10, "auxiliaryImagesSize");
    if (a4)
      *a4 = objc_msgSend(v10, "containerSize");
  }
}

- (void)_closeContainerForEncodingScheme:(int)a3
{
  id v4;
  void *v5;

  v4 = -[BWPhotoEncoderController _encoderManagerForEncodingScheme:](self, "_encoderManagerForEncodingScheme:", *(_QWORD *)&a3);
  if (v4)
  {
    v5 = v4;
    if (objc_msgSend(v4, "isContainerOpen"))
    {
      -[BWStillImageProcessorControllerInput setReservedPrimaryImageHandle:](-[BWStillImageProcessorControllerRequest input](-[BWStillImageProcessorController currentRequest](self, "currentRequest"), "input"), "setReservedPrimaryImageHandle:", -1);
      -[BWStillImageProcessorControllerInput setToneMapAlternateGroupHandle:](-[BWStillImageProcessorControllerRequest input](-[BWStillImageProcessorController currentRequest](self, "currentRequest"), "input"), "setToneMapAlternateGroupHandle:", -1);
      objc_msgSend(v5, "closeContainer");
    }
  }
}

- (int)_generatePhotoSurfaceFromEncodedImageBuffer:(opaqueCMSampleBuffer *)a3 photoSurfaceOut:(__IOSurface *)a4 photoSurfaceSizeOut:(unint64_t *)a5
{
  OpaqueCMBlockBuffer *DataBuffer;
  OSStatus v8;
  OSStatus DataPointer;
  __IOSurface *v10;
  __IOSurface *v11;
  void *BaseAddress;
  size_t v13;
  size_t totalLengthOut;
  char *dataPointerOut;
  CMBlockBufferRef blockBufferOut;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  blockBufferOut = 0;
  DataBuffer = CMSampleBufferGetDataBuffer(a3);
  if (!a4 || !DataBuffer)
  {
    FigDebugAssert3();
    LODWORD(v11) = -12780;
    goto LABEL_8;
  }
  v8 = CMBlockBufferCreateContiguous((CFAllocatorRef)*MEMORY[0x1E0C9AE00], DataBuffer, (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, 0, 0, &blockBufferOut);
  if (v8)
  {
    LODWORD(v11) = v8;
    goto LABEL_14;
  }
  totalLengthOut = 0;
  dataPointerOut = 0;
  DataPointer = CMBlockBufferGetDataPointer(blockBufferOut, 0, 0, &totalLengthOut, &dataPointerOut);
  if (DataPointer)
  {
    LODWORD(v11) = DataPointer;
    goto LABEL_14;
  }
  v18 = *MEMORY[0x1E0CBBEE0];
  v19[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", totalLengthOut);
  v10 = IOSurfaceCreate((CFDictionaryRef)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1));
  v11 = v10;
  if (!v10)
  {
LABEL_14:
    FigDebugAssert3();
    goto LABEL_8;
  }
  BaseAddress = IOSurfaceGetBaseAddress(v10);
  memcpy(BaseAddress, dataPointerOut, totalLengthOut);
  v13 = totalLengthOut;
  *a4 = v11;
  LODWORD(v11) = 0;
  if (a5)
    *a5 = v13;
LABEL_8:
  if (blockBufferOut)
    CFRelease(blockBufferOut);
  return (int)v11;
}

- (int)_generatePreviewForSampleBuffer:(opaqueCMSampleBuffer *)a3 requestedStillImageCaptureSettings:(id)a4 cropRect:(CGRect)a5 previewPixelBuffer:(__CVBuffer *)a6
{
  double height;
  double width;
  double y;
  double x;
  __CVBuffer *ImageBuffer;
  __CVBuffer *v14;
  uint64_t PixelFormatType;
  size_t v16;
  size_t v17;
  uint64_t v18;
  unsigned int v19;
  unsigned int v20;
  uint64_t v21;
  int v22;
  int v23;
  __CVBuffer **v25;
  unsigned int v26;
  __CVBuffer *v27;

  if (!self->_previewPixelConverter)
  {
    FigDebugAssert3();
    return -12786;
  }
  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  ImageBuffer = CMSampleBufferGetImageBuffer(a3);
  if (!ImageBuffer
    || (v14 = ImageBuffer,
        PixelFormatType = CVPixelBufferGetPixelFormatType(ImageBuffer),
        v16 = CVPixelBufferGetWidth(v14),
        v17 = CVPixelBufferGetHeight(v14),
        v26 = objc_msgSend(a4, "previewWidth"),
        v18 = objc_msgSend(a4, "previewHeight"),
        v19 = objc_msgSend(a4, "payloadType"),
        v19 >= 2))
  {
    FigDebugAssert3();
    return -12780;
  }
  v20 = v19;
  v25 = a6;
  if (v19)
  {
    v21 = 0;
  }
  else if (objc_msgSend(a4, "bracketType"))
  {
    v21 = objc_msgSend(a4, "bracketImageCount");
  }
  else
  {
    v21 = 1;
  }
  v22 = -[FigCapturePixelConverter updateOutputPixelFormat:dimensions:poolCapacity:colorSpaceProperties:alwaysUseHardwareForConversion:](self->_previewPixelConverter, "updateOutputPixelFormat:dimensions:poolCapacity:colorSpaceProperties:alwaysUseHardwareForConversion:", objc_msgSend(a4, "previewFormat"), v26 | (unint64_t)(v18 << 32), v21, -[BWPhotoEncoderController _getColorSpacePropertiesForSourcePixelFormat:sourceWidth:sourceHeight:destinationPixelFormat:](self, "_getColorSpacePropertiesForSourcePixelFormat:sourceWidth:sourceHeight:destinationPixelFormat:", PixelFormatType, v16, v17, objc_msgSend(a4, "previewFormat")), 1);
  if (v22)
  {
    v23 = v22;
    goto LABEL_16;
  }
  v27 = 0;
  v23 = -[FigCapturePixelConverter convertPixelBuffer:cropRect:allocateOutputFromBufferPool:outputPixelBuffer:](self->_previewPixelConverter, "convertPixelBuffer:cropRect:allocateOutputFromBufferPool:outputPixelBuffer:", v14, v20 == 0, &v27, x, y, width, height);
  if (v23)
  {
LABEL_16:
    FigDebugAssert3();
    return v23;
  }
  *v25 = v27;
  return v23;
}

- (int)_getColorSpacePropertiesForSourcePixelFormat:(unsigned int)a3 sourceWidth:(int)a4 sourceHeight:(int)a5 destinationPixelFormat:(unsigned int)a6
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  int v10;
  uint64_t v11;

  v6 = *(_QWORD *)&a6;
  v7 = *(_QWORD *)&a5;
  v9 = *(_QWORD *)&a3;
  v10 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_resolvedVideoFormatsByAttachedMediaKey, "objectForKeyedSubscript:", CFSTR("PrimaryFormat")), "colorSpaceProperties");
  if ((v10 - 3) < 2)
    v11 = 1;
  else
    v11 = 4 * ((v10 & 0xFFFFFFFD) == 5);
  return +[BWVideoFormat colorSpacePropertiesWithSourceColorSpace:sourcePixelFormat:sourceDimensions:requestedPixelFormat:](BWVideoFormat, "colorSpacePropertiesWithSourceColorSpace:sourcePixelFormat:sourceDimensions:requestedPixelFormat:", v11, v9, a4 | (unint64_t)(v7 << 32), v6);
}

- (double)_aspectRatioAdjustmentFactorForSettings:(id)a3
{
  double v4;
  double v5;
  double v6;

  v4 = 1.0;
  if (-[BWStillImageProcessorControllerInput requiresPhotosAdjustment](-[BWStillImageProcessorControllerRequest input](-[BWStillImageProcessorController currentRequest](self, "currentRequest"), "input"), "requiresPhotosAdjustment"))
  {
    objc_msgSend(a3, "nonDestructiveCropSize");
    if (v5 > 0.0 && v6 > 0.0)
      return v5 / v6;
  }
  return v4;
}

- (opaqueCMSampleBuffer)_newAuxImageEncodingTriggerSbufForSettings:(id)a3 metadata:(id)a4
{
  __int128 v6;
  __int128 v7;
  void *v8;
  CMTime v10;
  CMSampleTimingInfo sampleTimingArray;
  CMSampleBufferRef v12;

  v12 = 0;
  v6 = *(_OWORD *)(MEMORY[0x1E0CA2E90] + 48);
  *(_OWORD *)&sampleTimingArray.presentationTimeStamp.timescale = *(_OWORD *)(MEMORY[0x1E0CA2E90] + 32);
  *(_OWORD *)&sampleTimingArray.decodeTimeStamp.value = v6;
  sampleTimingArray.decodeTimeStamp.epoch = *(_QWORD *)(MEMORY[0x1E0CA2E90] + 64);
  v7 = *(_OWORD *)(MEMORY[0x1E0CA2E90] + 16);
  *(_OWORD *)&sampleTimingArray.duration.value = *MEMORY[0x1E0CA2E90];
  *(_OWORD *)&sampleTimingArray.duration.epoch = v7;
  v8 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "processingSettings"), "photoManifest"), "photoDescriptors"), "firstObject");
  if (v8)
    objc_msgSend(v8, "presentationTimeStamp");
  else
    memset(&v10, 0, sizeof(v10));
  sampleTimingArray.presentationTimeStamp = v10;
  if (!CMSampleBufferCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 1u, 0, 0, 0, 0, 1, &sampleTimingArray, 0, 0, &v12))
  {
    CMSetAttachment(v12, (CFStringRef)*MEMORY[0x1E0D05CB0], a4, 1u);
    CMSetAttachment(v12, CFSTR("StillSettings"), a3, 1u);
    CMSetAttachment(v12, CFSTR("PhotoManifest"), (CFTypeRef)objc_msgSend((id)objc_msgSend(a3, "processingSettings"), "photoManifest"), 1u);
  }
  return v12;
}

- (void)_updateStillImageProcessingFlagsWithDepthMetadataForSbuf:(opaqueCMSampleBuffer *)a3 stillImageSettings:(id)a4
{
  CFTypeRef v6;
  void *v7;
  int v8;
  int v9;
  int v10;
  int v11;

  if (objc_msgSend((id)-[BWStillImageProcessorControllerInput encodedAttachedMediaKeys](-[BWStillImageProcessorControllerRequest input](-[BWStillImageProcessorController currentRequest](self, "currentRequest"), "input"), "encodedAttachedMediaKeys"), "containsObject:", CFSTR("Depth")))
  {
    v6 = CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D086F0], 0);
    if (v6)
    {
      v7 = (void *)v6;
      v8 = BWStillImageProcessingFlagsForSampleBuffer(a3);
      if (objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D08438]), "BOOLValue"))v9 = 32;
      else
        v9 = 16;
      v10 = v9 | v8;
      if (BWCIFilterArrayContainsPortraitFilters((void *)objc_msgSend((id)objc_msgSend(a4, "requestedSettings"), "processedImageFilters")))v11 = v10;
      else
        v11 = v10 | 0x1000000;
      BWStillImageSetProcessingFlagsForSampleBuffer(a3, v11);
    }
  }
}

- (void)_waitForPrewarmingToComplete
{
  dispatch_sync((dispatch_queue_t)self->_prewarmQueue, &__block_literal_global_467);
}

- (id)inputFormatForAttachedMediaKey:(id)a3
{
  return 0;
}

- (id)inputVideoFormatForAttachedMediaKey:(id)a3
{
  return 0;
}

- (id)inputInferenceVideoFormatForAttachedMediaKey:(id)a3
{
  id result;
  BWInferenceVideoFormatRequirements *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  result = self->_inferenceInputVideoFormat;
  if (!result)
  {
    v5 = -[BWVideoFormatRequirements initWithPixelBufferAttributes:]([BWInferenceVideoFormatRequirements alloc], "initWithPixelBufferAttributes:", -[BWVideoFormat pixelBufferAttributes](-[FigCapturePixelConverter outputFormat](self->_previewPixelConverter, "outputFormat"), "pixelBufferAttributes"));
    -[BWInferenceVideoFormatRequirements setIncludesInvalidContent:](v5, "setIncludesInvalidContent:", 0);
    v6[0] = v5;
    result = +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1));
    self->_inferenceInputVideoFormat = (BWInferenceVideoFormat *)result;
  }
  return result;
}

- (id)outputFormatForAttachedMediaKey:(id)a3
{
  return 0;
}

- (id)outputVideoFormatForAttachedMediaKey:(id)a3
{
  return 0;
}

- (BOOL)intermediateResourceTrackingAllowedForAttachedMediaKey:(id)a3
{
  return 0;
}

- (NSDictionary)resolvedVideoFormatsByAttachedMediaKey
{
  return (NSDictionary *)objc_getProperty(self, a2, 152, 1);
}

- (void)setResolvedVideoFormatsByAttachedMediaKey:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (BOOL)clientExpectsCameraMountedInLandscapeOrientation
{
  return self->_clientExpectsCameraMountedInLandscapeOrientation;
}

- (void)setClientExpectsCameraMountedInLandscapeOrientation:(BOOL)a3
{
  self->_clientExpectsCameraMountedInLandscapeOrientation = a3;
}

- (BWPhotoEncoderControllerDelegate)primaryOwnerDelegate
{
  return (BWPhotoEncoderControllerDelegate *)objc_loadWeak((id *)&self->_primaryOwnerDelegate);
}

- (void)setPrimaryOwnerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_primaryOwnerDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_primaryOwnerDelegate);
}

@end
