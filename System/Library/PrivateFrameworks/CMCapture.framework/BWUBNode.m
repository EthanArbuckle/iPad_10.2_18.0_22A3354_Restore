@implementation BWUBNode

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (BWUBNode)initWithNodeConfiguration:(id)a3 captureDevice:(id)a4
{
  BWUBNode *v6;
  BWUBNode *v7;
  BWNodeInput *v8;
  BWVideoFormatRequirements *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  int v13;
  _BOOL4 v14;
  _BOOL4 v15;
  uint64_t v16;
  BWNodeOutput *v17;
  BWFigVideoCaptureDevice *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)BWUBNode;
  v6 = -[BWNode init](&v20, sel_init);
  v7 = v6;
  if (!v6)
    return v7;
  if (!a3)
  {

    return 0;
  }
  v6->_nodeConfiguration = (BWUBNodeConfiguration *)a3;
  v8 = -[BWNodeInput initWithMediaType:node:index:]([BWNodeInput alloc], "initWithMediaType:node:index:", 1986618469, v7, 0);
  v9 = objc_alloc_init(BWVideoFormatRequirements);
  v10 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = -[BWUBNodeConfiguration generateLiDARDepth]((_BOOL8)v7->_nodeConfiguration);
  if (-[BWUBNodeConfiguration inputIs10Bit]((_BOOL8)v7->_nodeConfiguration))
  {
    objc_msgSend(v10, "addObject:", &unk_1E49FA188);
    if (!v11)
      objc_msgSend(v10, "addObject:", &unk_1E49FA1A0);
    if (-[BWUBNodeConfiguration semanticStyleRenderingEnabled]((_BOOL8)a3))
      goto LABEL_12;
    objc_msgSend(v10, "addObject:", &unk_1E49FA1B8);
    if (v11)
      goto LABEL_12;
    v12 = &unk_1E49FA1D0;
    goto LABEL_11;
  }
  objc_msgSend(v10, "addObject:", &unk_1E49FA1E8);
  if (!v11)
  {
    v12 = &unk_1E49FA200;
LABEL_11:
    objc_msgSend(v10, "addObject:", v12);
  }
LABEL_12:
  if (-[BWUBNodeConfiguration stillImageFusionScheme]((uint64_t)v7->_nodeConfiguration) == 4)
  {
    v13 = -[BWStillImageNodeConfiguration maxLossyCompressionLevel](v7->_nodeConfiguration, "maxLossyCompressionLevel");
    v14 = !-[BWUBNodeConfiguration inputIs10Bit]((_BOOL8)v7->_nodeConfiguration);
    v15 = -[BWUBNodeConfiguration inputIs10Bit]((_BOOL8)v7->_nodeConfiguration);
    objc_msgSend(v10, "addObjectsFromArray:", FigCaptureSupportedCompressedPixelFormatsForSettings(4, v13, !v11, 1, 0, v14, v15, 0));
  }
  -[BWVideoFormatRequirements setSupportedPixelFormats:](v9, "setSupportedPixelFormats:", v10);
  if (-[BWUBNodeConfiguration inputIs10Bit]((_BOOL8)v7->_nodeConfiguration))
    v16 = 64;
  else
    v16 = 16;
  -[BWVideoFormatRequirements setBytesPerRowAlignment:](v9, "setBytesPerRowAlignment:", v16);
  -[BWVideoFormatRequirements setHeightAlignment:](v9, "setHeightAlignment:", 16);
  -[BWNodeInput setFormatRequirements:](v8, "setFormatRequirements:", v9);
  -[BWNodeInput setPassthroughMode:](v8, "setPassthroughMode:", 0);
  -[BWNodeInput setRetainedBufferCount:](v8, "setRetainedBufferCount:", -[BWUBNodeConfiguration retainedBufferCount]((uint64_t)v7->_nodeConfiguration));
  -[BWNode addInput:](v7, "addInput:", v8);
  if (-[BWUBNodeConfiguration generateLiDARDepth]((_BOOL8)a3)
    || objc_msgSend(a4, "supplementalPointCloudCaptureDevice"))
  {
    if (-[BWUBNodeConfiguration generateLiDARDepth]((_BOOL8)a3)
      && objc_msgSend(a4, "supplementalPointCloudCaptureDevice"))
    {
      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("We should not be generating LiDAR depth and using the ToF camera in the supplemental mode at the same time"), 0));
    }
    v7->_pointCloudInput = -[BWNodeInput initWithMediaType:node:index:]([BWNodeInput alloc], "initWithMediaType:node:index:", 1885564004, v7, 1);
    -[BWNodeInput setFormatRequirements:](v7->_pointCloudInput, "setFormatRequirements:", objc_alloc_init(BWPointCloudFormatRequirements));
    -[BWNodeInput setRetainedBufferCount:](v7->_pointCloudInput, "setRetainedBufferCount:", 1000);
    -[BWNode addInput:](v7, "addInput:", v7->_pointCloudInput);
    v7->_pointCloudLock._os_unfair_lock_opaque = 0;
    v7->_discardPointClouds = 1;
  }
  v17 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1986618469, v7);
  -[BWNodeOutput setOwningNodeRetainedBufferCount:](v17, "setOwningNodeRetainedBufferCount:", -[BWUBNodeConfiguration outputBufferCount]((uint64_t)v7->_nodeConfiguration) - 1);
  -[BWNodeOutput setPixelBufferPoolProvidesBackPressure:](v17, "setPixelBufferPoolProvidesBackPressure:", -[BWUBNodeConfiguration outputPoolBackPressureEnabled]((_BOOL8)v7->_nodeConfiguration));
  -[BWNodeOutput setPixelBufferPoolReportSlowBackPressureAllocations:](v17, "setPixelBufferPoolReportSlowBackPressureAllocations:", -[BWUBNodeConfiguration outputPoolBackPressureEnabled]((_BOOL8)v7->_nodeConfiguration));
  -[BWNodeOutput setPassthroughMode:](v17, "setPassthroughMode:", 0);
  -[BWNode addOutput:](v7, "addOutput:", v17);
  v18 = (BWFigVideoCaptureDevice *)a4;
  v7->_device = v18;
  -[BWFigVideoCaptureDevice setAdaptiveUnifiedBracketingController:](v18, "setAdaptiveUnifiedBracketingController:", v7);
  -[BWUBNode _setupProcessorControllerConfigurations](v7);
  return v7;
}

- (id)_setupProcessorControllerConfigurations
{
  id v1;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  id v3;
  BWDeferredProcessorControllerConfiguration *v4;
  BWDeepFusionProcessorControllerConfiguration *v5;
  BWLearnedNRProcessorControllerConfiguration *v6;
  BWStillImageProcessorControllerConfiguration *v7;
  BWIntelligentDistortionCorrectionProcessorControllerConfiguration *v8;
  BWDeepZoomProcessorControllerConfiguration *v9;
  BWStereoDisparityProcessorControllerConfiguration *v10;
  BWJasperColorStillsExecutorControllerConfiguration *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    if (dword_1ECFE9AF0)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      result = (id)fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    if (!*((_QWORD *)v1 + 15))
    {
      *((_QWORD *)v1 + 15) = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", objc_msgSend((id)-[BWUBNodeConfiguration sensorConfigurationsByPortType](*((_QWORD *)v1 + 14)), "allKeys"));
      *((_DWORD *)v1 + 42) = 0;
      objc_msgSend(*((id *)v1 + 14), "figThreadPriority");
      *((_QWORD *)v1 + 20) = FigDispatchQueueCreateWithPriority();
      objc_msgSend(*((id *)v1 + 14), "figThreadPriority");
      *((_QWORD *)v1 + 22) = FigDispatchQueueCreateWithPriority();
      *((_BYTE *)v1 + 184) = -[FigCaptureCameraParameters nrfVersion](+[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance"), "nrfVersion") > 2;
      v3 = BWUBCreateNRProcessorControllerConfiguration(*((void **)v1 + 14), (uint64_t *)v1 + 26);
      *((_QWORD *)v1 + 27) = v3;
      if (v3)
        *((_QWORD *)v1 + 28) = objc_alloc_init(MEMORY[0x1E0C99E08]);
      *((_QWORD *)v1 + 29) = objc_alloc_init(MEMORY[0x1E0C99E08]);
      *((_QWORD *)v1 + 30) = objc_alloc_init(MEMORY[0x1E0C99E08]);
      *((_QWORD *)v1 + 64) = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v4 = BWUBCreateDeferredProcessorControllerConfiguration(*((void **)v1 + 14));
      *((_QWORD *)v1 + 76) = v4;
      if (v4)
      {
        objc_msgSend(*((id *)v1 + 14), "figThreadPriority");
        *((_QWORD *)v1 + 75) = FigDispatchQueueCreateWithPriority();
        *((_QWORD *)v1 + 77) = objc_alloc_init(MEMORY[0x1E0C99E08]);
      }
      *((_QWORD *)v1 + 72) = BWUBCreateDeferredContainerControllerConfiguration(*((void **)v1 + 14));
      v5 = BWUBCreateDeepFusionProcessorControllerConfiguration(*((void **)v1 + 14));
      *((_QWORD *)v1 + 33) = v5;
      if (v5)
      {
        *((_QWORD *)v1 + 34) = objc_alloc_init(MEMORY[0x1E0C99E08]);
        objc_msgSend(*((id *)v1 + 14), "figThreadPriority");
        *((_QWORD *)v1 + 35) = FigDispatchQueueCreateWithPriority();
        objc_msgSend(*((id *)v1 + 33), "setDelayPrepareAndCacheBuffers:", 0);
      }
      v6 = BWUBCreateLearnedNRProcessorControllerConfiguration(*((void **)v1 + 14));
      *((_QWORD *)v1 + 31) = v6;
      if (v6)
        *((_QWORD *)v1 + 32) = objc_alloc_init(MEMORY[0x1E0C99E08]);
      *((_QWORD *)v1 + 38) = BWUBCreateInferenceControllerConfiguration(*((void **)v1 + 14));
      objc_msgSend(*((id *)v1 + 14), "figThreadPriority");
      *((_QWORD *)v1 + 40) = FigDispatchQueueCreateWithPriority();
      if (*((_QWORD *)v1 + 38))
      {
        *((_QWORD *)v1 + 39) = objc_alloc_init(MEMORY[0x1E0C99E08]);
        *((_QWORD *)v1 + 41) = dispatch_group_create();
      }
      v7 = BWUBCreateRedEyeProcessorControllerConfiguration(*((void **)v1 + 14));
      *((_QWORD *)v1 + 50) = v7;
      if (v7)
        *((_QWORD *)v1 + 51) = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v8 = BWUBCreateIntelligentDistortionCorrectionProcessorControllerConfiguration(*((void **)v1 + 14));
      *((_QWORD *)v1 + 52) = v8;
      if (v8)
      {
        *((_QWORD *)v1 + 53) = objc_alloc_init(MEMORY[0x1E0C99E08]);
        *((_QWORD *)v1 + 54) = objc_alloc_init(MEMORY[0x1E0C99E08]);
        *((_QWORD *)v1 + 57) = (id)objc_msgSend(+[BWIntelligentDistortionCorrectionProcessorController captureTypesWithIDCSupportWithOptionalCaptureFlags](BWIntelligentDistortionCorrectionProcessorController, "captureTypesWithIDCSupportWithOptionalCaptureFlags"), "allKeys");
      }
      v9 = BWUBCreateDeepZoomProcessorControllerConfiguration(*((void **)v1 + 14));
      *((_QWORD *)v1 + 58) = v9;
      if (v9)
        *((_QWORD *)v1 + 59) = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v10 = BWUBCreateStereoDisparityProcessorControllerConfiguration(*((void **)v1 + 14));
      *((_QWORD *)v1 + 60) = v10;
      if (v10)
      {
        *((_QWORD *)v1 + 65) = objc_alloc_init(MEMORY[0x1E0C99E08]);
        objc_msgSend(*((id *)v1 + 14), "figThreadPriority");
        *((_QWORD *)v1 + 63) = FigDispatchQueueCreateWithPriority();
      }
      if (objc_msgSend(*((id *)v1 + 13), "supplementalPointCloudCaptureDevice", v12, v13))
      {
        v11 = BWUBCreateJasperColorStillsExecutorControllerConfiguration(*((void **)v1 + 14));
        *((_QWORD *)v1 + 68) = v11;
        if (v11)
          *((_QWORD *)v1 + 69) = objc_alloc_init(MEMORY[0x1E0C99E08]);
      }
      result = BWUBCreateJasperDisparityProcessorControllerConfiguration(*((void **)v1 + 14));
      *((_QWORD *)v1 + 70) = result;
      if (result)
      {
        result = objc_alloc_init(MEMORY[0x1E0C99E08]);
        *((_QWORD *)v1 + 71) = result;
      }
    }
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[BWUBNode _releaseResources]((uint64_t)self);

  self->_emitQueue = 0;
  v3.receiver = self;
  v3.super_class = (Class)BWUBNode;
  -[BWNode dealloc](&v3, sel_dealloc);
}

- (void)_releaseResources
{
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  const void *v5;
  const void *v6;
  const void *v7;
  const void *v8;
  const void *v9;
  const void *v10;
  _QWORD v11[5];
  uint64_t block;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  _QWORD *v16;

  if (a1)
  {
    if (!_FigIsNotCurrentDispatchQueue())
      FigDebugAssert3();
    if (!*(_BYTE *)(a1 + 96))
    {
      v2 = *(NSObject **)(a1 + 600);
      v3 = MEMORY[0x1E0C809B0];
      if (v2)
      {
        block = MEMORY[0x1E0C809B0];
        v13 = 3221225472;
        v14 = __ubn_dispatch_sync_block_invoke;
        v15 = &unk_1E491ECB8;
        v16 = &__block_literal_global_244;
        dispatch_sync(v2, &block);

        *(_QWORD *)(a1 + 600) = 0;
      }
      v4 = *(NSObject **)(a1 + 160);
      if (v4)
      {
        v11[0] = v3;
        v11[1] = 3221225472;
        v11[2] = __29__BWUBNode__releaseResources__block_invoke_2;
        v11[3] = &unk_1E491E720;
        v11[4] = a1;
        block = v3;
        v13 = 3221225472;
        v14 = __ubn_dispatch_sync_block_invoke;
        v15 = &unk_1E491ECB8;
        v16 = v11;
        dispatch_sync(v4, &block);
      }

      *(_QWORD *)(a1 + 120) = 0;
      *(_QWORD *)(a1 + 200) = 0;

      *(_QWORD *)(a1 + 216) = 0;
      *(_QWORD *)(a1 + 224) = 0;

      *(_QWORD *)(a1 + 584) = 0;
      *(_QWORD *)(a1 + 576) = 0;

      *(_QWORD *)(a1 + 232) = 0;
      *(_QWORD *)(a1 + 240) = 0;

      *(_QWORD *)(a1 + 512) = 0;
      *(_QWORD *)(a1 + 160) = 0;

      *(_QWORD *)(a1 + 192) = 0;
      *(_QWORD *)(a1 + 112) = 0;

      *(_QWORD *)(a1 + 104) = 0;
      *(_QWORD *)(a1 + 264) = 0;

      *(_QWORD *)(a1 + 280) = 0;
      *(_QWORD *)(a1 + 288) = 0;

      *(_QWORD *)(a1 + 296) = 0;
      *(_QWORD *)(a1 + 272) = 0;

      *(_QWORD *)(a1 + 312) = 0;
      *(_QWORD *)(a1 + 248) = 0;

      *(_QWORD *)(a1 + 256) = 0;
      *(_QWORD *)(a1 + 304) = 0;

      *(_QWORD *)(a1 + 320) = 0;
      *(_QWORD *)(a1 + 328) = 0;

      *(_QWORD *)(a1 + 336) = 0;
      *(_QWORD *)(a1 + 344) = 0;
      v5 = *(const void **)(a1 + 360);
      if (v5)
      {
        CFRelease(v5);
        *(_QWORD *)(a1 + 360) = 0;
      }

      *(_QWORD *)(a1 + 352) = 0;
      v6 = *(const void **)(a1 + 368);
      if (v6)
      {
        CFRelease(v6);
        *(_QWORD *)(a1 + 368) = 0;
      }
      v7 = *(const void **)(a1 + 376);
      if (v7)
      {
        CFRelease(v7);
        *(_QWORD *)(a1 + 376) = 0;
      }
      v8 = *(const void **)(a1 + 384);
      if (v8)
      {
        CFRelease(v8);
        *(_QWORD *)(a1 + 384) = 0;
      }

      *(_QWORD *)(a1 + 392) = 0;
      *(_QWORD *)(a1 + 416) = 0;

      *(_QWORD *)(a1 + 424) = 0;
      *(_QWORD *)(a1 + 432) = 0;

      *(_QWORD *)(a1 + 448) = 0;
      *(_QWORD *)(a1 + 456) = 0;

      *(_QWORD *)(a1 + 464) = 0;
      *(_QWORD *)(a1 + 472) = 0;

      *(_QWORD *)(a1 + 480) = 0;
      *(_QWORD *)(a1 + 488) = 0;

      *(_QWORD *)(a1 + 520) = 0;
      *(_QWORD *)(a1 + 504) = 0;

      *(_QWORD *)(a1 + 544) = 0;
      *(_QWORD *)(a1 + 552) = 0;

      *(_QWORD *)(a1 + 560) = 0;
      *(_QWORD *)(a1 + 568) = 0;

      *(_QWORD *)(a1 + 400) = 0;
      *(_QWORD *)(a1 + 408) = 0;

      *(_QWORD *)(a1 + 600) = 0;
      *(_QWORD *)(a1 + 608) = 0;

      *(_QWORD *)(a1 + 616) = 0;
      v9 = *(const void **)(a1 + 592);
      if (v9)
      {
        CFRelease(v9);
        *(_QWORD *)(a1 + 592) = 0;
      }

      *(_QWORD *)(a1 + 528) = 0;
      *(_QWORD *)(a1 + 152) = 0;
      v10 = *(const void **)(a1 + 632);
      if (v10)
      {
        CFRelease(v10);
        *(_QWORD *)(a1 + 632) = 0;
      }
      *(_BYTE *)(a1 + 96) = 1;
    }
  }
}

- (BWNodeInput)pointCloudInput
{
  return self->_pointCloudInput;
}

- (BOOL)idcSupportedForCaptureType:(int)a3 captureFlags:(unint64_t)a4 portType:(id)a5
{
  uint64_t v5;

  if (self->_intelligentDistortionCorrectionControllerConfiguration
    && (v5 = *(_QWORD *)&a3,
        objc_msgSend((id)-[BWUBNodeConfiguration portTypesWithIntelligentDistortionCorrectionEnabled]((uint64_t)self->_nodeConfiguration), "containsObject:", a5)))
  {
    return -[NSArray containsObject:](self->_captureTypesWithIntelligentDistortionCorrectionSupport, "containsObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v5));
  }
  else
  {
    return 0;
  }
}

- (BOOL)demosaicedRawSupportedForCaptureType:(int)a3
{
  if (a3 <= 0xC && ((1 << a3) & 0x1C86) != 0)
    return -[BWNoiseReductionAndFusionProcessorControllerConfiguration demosaicedRawEnabled](self->_nrProcessorControllerConfiguration, "demosaicedRawEnabled");
  else
    return 0;
}

- (BOOL)processingOnBeginMomentSupportedForCaptureSettings:(id)a3
{
  return 0;
}

- (BOOL)rawNightModeSupportedForPortType:(id)a3
{
  return 0;
}

- (id)processorCoordinator
{
  return self->_processorCoordinator;
}

- (id)nodeType
{
  return CFSTR("Effect");
}

- (id)nodeSubType
{
  return CFSTR("UnifiedBracketingProcessor");
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4
{
  _BOOL4 v6;
  uint64_t v7;
  int v8;
  int v9;
  BWDeepZoomProcessorControllerConfiguration *deepZoomProcessorControllerConfiguration;
  unsigned int v11;
  uint64_t v12;
  void *v13;
  BWUBNode *v14;
  int v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unsigned int v20;
  unsigned int v21;
  BWVideoFormatRequirements *v22;
  BWNodeOutputMediaConfiguration *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  uint64_t v32;
  void *v33;
  NSDictionary *v34;
  uint64_t v35;
  uint64_t v36;
  BWVideoFormatRequirements *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t j;
  int v44;
  int v45;
  uint64_t v46;
  BWNodeOutputMediaConfiguration *v47;
  float v48;
  BWNodeOutputMediaConfiguration *v49;
  BWVideoFormatRequirements *v50;
  float v51;
  float v52;
  float v53;
  float v54;
  BWNodeOutputMediaConfiguration *v55;
  BWVideoFormatRequirements *v56;
  BWStereoDisparityProcessorControllerConfiguration *stereoDisparityProcessorControllerConfiguration;
  BWNodeInputMediaConfiguration *v58;
  int v59;
  _BOOL4 v60;
  unsigned int v61;
  BWVideoFormatRequirements *v62;
  NSDictionary *v63;
  uint64_t v64;
  id obj;
  BWUBNode *v66;
  _BOOL4 v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  _BYTE v90[128];
  _BYTE v91[128];
  _BYTE v92[128];
  _BYTE v93[128];
  id v94;
  void *v95;
  uint64_t v96;
  uint64_t v97;
  _QWORD v98[3];

  v98[1] = *MEMORY[0x1E0C80C00];
  if (self->_pointCloudInput != a4)
  {
    v6 = -[BWUBNode _requiresResizedOutputDimensionsWithInputWidth:inputHeight:]((_BOOL8)self, objc_msgSend(a3, "width"), objc_msgSend(a3, "height"));
    if (v6)
      -[NSArray count](-[BWIntelligentDistortionCorrectionProcessorControllerConfiguration portTypesWithGeometricDistortionCorrectionEnabled](self->_intelligentDistortionCorrectionControllerConfiguration, "portTypesWithGeometricDistortionCorrectionEnabled"), "count");
    v7 = -[BWNodeOutput owningNodeRetainedBufferCount](self->super._output, "owningNodeRetainedBufferCount");
    v8 = v7 + 1;
    if (self->_intelligentDistortionCorrectionControllerConfiguration)
      v9 = v6;
    else
      v9 = 1;
    v61 = v7 + 1;
    v59 = v9;
    if ((v9 & 1) == 0)
    {
      v61 = 2 * v8;
      self->_dcOutputBufferCount = 2 * v8;
    }
    if (-[BWNoiseReductionAndFusionProcessorControllerConfiguration demosaicedRawEnabled](self->_nrProcessorControllerConfiguration, "demosaicedRawEnabled"))self->_demosaicedRawOutputBufferCount = v8;
    else
      v7 = 0xFFFFFFFFLL;
    deepZoomProcessorControllerConfiguration = self->_deepZoomProcessorControllerConfiguration;
    v60 = -[BWStillImageNodeConfiguration deferredPhotoProcessorEnabled](self->_nodeConfiguration, "deferredPhotoProcessorEnabled");
    if (deepZoomProcessorControllerConfiguration)
      v11 = v61 + 1;
    else
      v11 = v61;
    v62 = objc_alloc_init(BWVideoFormatRequirements);
    if (FigCapturePixelFormatIsFullRange(objc_msgSend(a3, "pixelFormat")))
      v12 = 875704422;
    else
      v12 = 875704438;
    v98[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v12);
    v13 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v98, 1);
    if (FigCapturePlatformSupportsUniversalCompression())
    {
      v14 = self;
      if (!self->_deepZoomProcessorControllerConfiguration && self->_nrProcessorControllerType == 6)
      {
        v15 = -[BWStillImageNodeConfiguration maxLossyCompressionLevel](self->_nodeConfiguration, "maxLossyCompressionLevel");
        if (self->_deepFusionProcessorControllerConfiguration)
          v16 = 0;
        else
          v16 = v15;
        v13 = FigCapturePixelFormatsByAddingCompressedVariants(v13, v16);
      }
    }
    else
    {
      v14 = self;
    }
    v17 = v11 - 1;
    if (objc_msgSend(a3, "colorSpaceProperties"))
    {
      v97 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(a3, "colorSpaceProperties"));
      v18 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v97, 1);
    }
    else
    {
      v18 = 0;
    }
    -[BWVideoFormatRequirements setSupportedColorSpaceProperties:](v62, "setSupportedColorSpaceProperties:", v18);
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v62, "setSupportedPixelFormats:", v13);
    if (v6)
    {
      -[BWVideoFormatRequirements setWidth:](v62, "setWidth:", (int)-[BWUBNodeConfiguration outputDimensions]((uint64_t)v14->_nodeConfiguration));
      v19 = -[BWUBNodeConfiguration outputDimensions]((uint64_t)v14->_nodeConfiguration) >> 32;
    }
    else
    {
      -[BWVideoFormatRequirements setWidth:](v62, "setWidth:", objc_msgSend(a3, "width"));
      v19 = objc_msgSend(a3, "height");
    }
    -[BWVideoFormatRequirements setHeight:](v62, "setHeight:", v19);
    -[BWVideoFormatRequirements setBytesPerRowAlignment:](v62, "setBytesPerRowAlignment:", 64);
    -[BWVideoFormatRequirements setHeightAlignment:](v62, "setHeightAlignment:", 16);
    -[BWVideoFormatRequirements setPlaneAlignment:](v62, "setPlaneAlignment:", 64);
    -[BWVideoFormatRequirements setSupportedCacheModes:](v62, "setSupportedCacheModes:", +[BWVideoFormatRequirements cacheModesForOptimizedHWAccess](BWVideoFormatRequirements, "cacheModesForOptimizedHWAccess"));
    -[BWNodeOutput setFormatRequirements:](v14->super._output, "setFormatRequirements:", v62);
    -[BWNodeOutput setOwningNodeRetainedBufferCount:](v14->super._output, "setOwningNodeRetainedBufferCount:", v17);
    v20 = objc_msgSend(a3, "width");
    v21 = objc_msgSend(a3, "height");
    -[BWNoiseReductionAndFusionProcessorControllerConfiguration setInputFormat:](v14->_nrProcessorControllerConfiguration, "setInputFormat:", a3);
    -[BWNoiseReductionAndFusionProcessorControllerConfiguration setDeepFusionInputFormat:](v14->_nrProcessorControllerConfiguration, "setDeepFusionInputFormat:", a3);
    -[BWDeepFusionProcessorControllerConfiguration setMaxInputDimensions:](v14->_deepFusionProcessorControllerConfiguration, "setMaxInputDimensions:", v20 | ((unint64_t)v21 << 32));
    -[BWDeepZoomProcessorControllerConfiguration setInputFormat:](v14->_deepZoomProcessorControllerConfiguration, "setInputFormat:", a3);
    v67 = -[BWNodeOutputMediaConfiguration pixelBufferPoolProvidesBackPressure](-[BWNodeOutput primaryMediaConfiguration](v14->super._output, "primaryMediaConfiguration"), "pixelBufferPoolProvidesBackPressure");
    if (-[BWNoiseReductionAndFusionProcessorControllerConfiguration demosaicedRawEnabled](v14->_nrProcessorControllerConfiguration, "demosaicedRawEnabled"))
    {
      v22 = -[BWUBNode _demosaicedRawFormatRequirementsWithDimensions:colorSpaceProperties:]((uint64_t)v14, -[BWVideoFormatRequirements width](v62, "width") | ((unint64_t)-[BWVideoFormatRequirements height](v62, "height") << 32), objc_msgSend(-[NSArray firstObject](-[BWVideoFormatRequirements supportedColorSpaceProperties](v62, "supportedColorSpaceProperties"), "firstObject"), "intValue"));
      v23 = objc_alloc_init(BWNodeOutputMediaConfiguration);
      -[BWNodeOutputMediaConfiguration setFormatRequirements:](v23, "setFormatRequirements:", v22);
      -[BWNodeOutputMediaConfiguration setPassthroughMode:](v23, "setPassthroughMode:", 0);
      -[BWNodeOutputMediaConfiguration setProvidesPixelBufferPool:](v23, "setProvidesPixelBufferPool:", 1);
      -[BWNodeOutputMediaConfiguration setOwningNodeRetainedBufferCount:](v23, "setOwningNodeRetainedBufferCount:", v7);
      -[BWNodeOutputMediaConfiguration setPixelBufferPoolProvidesBackPressure:](v23, "setPixelBufferPoolProvidesBackPressure:", v67);
      -[BWNodeOutputMediaConfiguration setPixelBufferPoolReportSlowBackPressureAllocations:](v23, "setPixelBufferPoolReportSlowBackPressureAllocations:", v67);
      -[BWNodeOutput setMediaConfiguration:forAttachedMediaKey:](v14->super._output, "setMediaConfiguration:forAttachedMediaKey:", v23, 0x1E495B0F8);
    }
    v94 = a3;
    v95 = &unk_1E49FA218;
    v96 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v94, 1);
    -[BWLearnedNRProcessorControllerConfiguration setInputFormatsByQSubResolutionFlavor:](v14->_learnedNRProcessorControllerConfiguration, "setInputFormatsByQSubResolutionFlavor:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v96, &v95, 1));
    -[BWLearnedNRProcessorControllerConfiguration setOutputFormat:](v14->_learnedNRProcessorControllerConfiguration, "setOutputFormat:", a3);
    v24 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v86 = 0u;
    v87 = 0u;
    v88 = 0u;
    v89 = 0u;
    v66 = v14;
    obj = (id)-[BWUBNodeConfiguration providedInferenceAttachedMediaByMode]((uint64_t)v14->_nodeConfiguration);
    v70 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v86, v93, 16);
    if (v70)
    {
      v68 = *(_QWORD *)v87;
      do
      {
        v25 = 0;
        do
        {
          if (*(_QWORD *)v87 != v68)
            objc_enumerationMutation(obj);
          v72 = v25;
          v26 = *(_QWORD *)(*((_QWORD *)&v86 + 1) + 8 * v25);
          v82 = 0u;
          v83 = 0u;
          v84 = 0u;
          v85 = 0u;
          v27 = (void *)objc_msgSend((id)-[BWUBNodeConfiguration providedInferenceAttachedMediaByMode]((uint64_t)v66->_nodeConfiguration), "objectForKeyedSubscript:", v26);
          v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v82, v92, 16);
          if (v28)
          {
            v29 = v28;
            v30 = *(_QWORD *)v83;
            do
            {
              for (i = 0; i != v29; ++i)
              {
                if (*(_QWORD *)v83 != v30)
                  objc_enumerationMutation(v27);
                v32 = *(_QWORD *)(*((_QWORD *)&v82 + 1) + 8 * i);
                v33 = (void *)objc_msgSend(v24, "objectForKeyedSubscript:", v32);
                if (v33)
                  objc_msgSend(v33, "addObject:", v26);
                else
                  objc_msgSend(v24, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v26), v32);
              }
              v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v82, v92, 16);
            }
            while (v29);
          }
          v25 = v72 + 1;
        }
        while (v72 + 1 != v70);
        v70 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v86, v93, 16);
      }
      while (v70);
    }

    v34 = (NSDictionary *)objc_msgSend(v24, "copy");
    v66->_providedInferenceAttachedMediaModesByAttachedMediaKey = v34;
    v78 = 0u;
    v79 = 0u;
    v80 = 0u;
    v81 = 0u;
    v63 = v34;
    v69 = -[NSDictionary countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v78, v91, 16);
    if (v69)
    {
      v64 = *(_QWORD *)v79;
      do
      {
        v35 = 0;
        do
        {
          if (*(_QWORD *)v79 != v64)
            objc_enumerationMutation(v63);
          v36 = *(_QWORD *)(*((_QWORD *)&v78 + 1) + 8 * v35);
          v73 = v35;
          if (+[BWMattingV2InferenceConfiguration isMattingOutputAttachedMediaKey:](BWMattingV2InferenceConfiguration, "isMattingOutputAttachedMediaKey:", v36))
          {
            if (-[BWUBNodeConfiguration inferenceMainImageDownscalingFactor]((uint64_t)v66->_nodeConfiguration) == 0.0)
            {
              v37 = 0;
            }
            else
            {
              v37 = objc_alloc_init(BWVideoFormatRequirements);
              -[BWVideoFormatRequirements setWidth:](v37, "setWidth:", (unint64_t)(float)((float)-[BWVideoFormatRequirements width](v62, "width")/ -[BWUBNodeConfiguration inferenceMainImageDownscalingFactor]((uint64_t)v66->_nodeConfiguration)));
              -[BWVideoFormatRequirements setHeight:](v37, "setHeight:", (unint64_t)(float)((float)-[BWVideoFormatRequirements height](v62, "height")/ -[BWUBNodeConfiguration inferenceMainImageDownscalingFactor]((uint64_t)v66->_nodeConfiguration)));
              -[BWVideoFormatRequirements setSupportedPixelFormats:](v37, "setSupportedPixelFormats:", &unk_1E4A00C80);
              -[BWVideoFormatRequirements setBytesPerRowAlignment:](v37, "setBytesPerRowAlignment:", 64);
              -[BWVideoFormatRequirements setPlaneAlignment:](v37, "setPlaneAlignment:", 64);
              -[BWVideoFormatRequirements setWidthAlignment:](v37, "setWidthAlignment:", 16);
              -[BWVideoFormatRequirements setHeightAlignment:](v37, "setHeightAlignment:", 16);
              -[BWVideoFormatRequirements setMemoryPoolUseAllowed:](v37, "setMemoryPoolUseAllowed:", 0);
            }
          }
          else
          {
            v37 = objc_alloc_init(BWVideoFormatRequirements);
            -[BWVideoFormatRequirements setWidth:](v37, "setWidth:", 512);
            -[BWVideoFormatRequirements setHeight:](v37, "setHeight:", 384);
            -[BWVideoFormatRequirements setSupportedPixelFormats:](v37, "setSupportedPixelFormats:", &unk_1E4A00C98);
            -[BWVideoFormatRequirements setBytesPerRowAlignment:](v37, "setBytesPerRowAlignment:", 64);
          }
          v76 = 0u;
          v77 = 0u;
          v74 = 0u;
          v75 = 0u;
          v71 = v36;
          v38 = (void *)objc_msgSend(v24, "objectForKeyedSubscript:", v36);
          v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v74, v90, 16);
          if (v39)
          {
            v40 = v39;
            LODWORD(v41) = 0;
            v42 = *(_QWORD *)v75;
            do
            {
              for (j = 0; j != v40; ++j)
              {
                if (*(_QWORD *)v75 != v42)
                  objc_enumerationMutation(v38);
                v44 = objc_msgSend(*(id *)(*((_QWORD *)&v74 + 1) + 8 * j), "intValue");
                if (v44 == 2)
                {
                  v45 = -[BWNodeOutput owningNodeRetainedBufferCount](v66->super._output, "owningNodeRetainedBufferCount");
                }
                else if (v44 == 1)
                {
                  v45 = v7;
                }
                else
                {
                  v45 = 0;
                }
                if ((int)v41 <= v45)
                  v41 = v45;
                else
                  v41 = v41;
              }
              v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v74, v90, 16);
            }
            while (v40);
          }
          else
          {
            v41 = 0;
          }
          v46 = v67 | -[BWStillImageNodeConfiguration deferredCaptureSupportEnabled](v66->_nodeConfiguration, "deferredCaptureSupportEnabled");
          v47 = objc_alloc_init(BWNodeOutputMediaConfiguration);
          -[BWNodeOutputMediaConfiguration setFormatRequirements:](v47, "setFormatRequirements:", v37);
          -[BWNodeOutputMediaConfiguration setPassthroughMode:](v47, "setPassthroughMode:", 0);
          -[BWNodeOutputMediaConfiguration setProvidesPixelBufferPool:](v47, "setProvidesPixelBufferPool:", !v60);
          -[BWNodeOutputMediaConfiguration setOwningNodeRetainedBufferCount:](v47, "setOwningNodeRetainedBufferCount:", v41);
          -[BWNodeOutputMediaConfiguration setPixelBufferPoolProvidesBackPressure:](v47, "setPixelBufferPoolProvidesBackPressure:", v46);
          -[BWNodeOutputMediaConfiguration setPixelBufferPoolReportSlowBackPressureAllocations:](v47, "setPixelBufferPoolReportSlowBackPressureAllocations:", v46);
          -[BWNodeOutput setMediaConfiguration:forAttachedMediaKey:](v66->super._output, "setMediaConfiguration:forAttachedMediaKey:", v47, v71);
          v35 = v73 + 1;
        }
        while (v73 + 1 != v69);
        v69 = -[NSDictionary countByEnumeratingWithState:objects:count:](v63, "countByEnumeratingWithState:objects:count:", &v78, v91, 16);
      }
      while (v69);
    }
    -[BWNoiseReductionAndFusionProcessorControllerConfiguration gainMapMainImageDownscalingFactor](v66->_nrProcessorControllerConfiguration, "gainMapMainImageDownscalingFactor");
    if (v48 != 0.0)
    {
      v49 = objc_alloc_init(BWNodeOutputMediaConfiguration);
      v50 = objc_alloc_init(BWVideoFormatRequirements);
      -[BWVideoFormatRequirements setSupportedPixelFormats:](v50, "setSupportedPixelFormats:", &unk_1E4A00CB0);
      v51 = (float)-[BWVideoFormatRequirements width](v62, "width");
      -[BWNoiseReductionAndFusionProcessorControllerConfiguration gainMapMainImageDownscalingFactor](v66->_nrProcessorControllerConfiguration, "gainMapMainImageDownscalingFactor");
      -[BWVideoFormatRequirements setWidth:](v50, "setWidth:", (unint64_t)(float)(v51 / v52));
      v53 = (float)-[BWVideoFormatRequirements height](v62, "height");
      -[BWNoiseReductionAndFusionProcessorControllerConfiguration gainMapMainImageDownscalingFactor](v66->_nrProcessorControllerConfiguration, "gainMapMainImageDownscalingFactor");
      -[BWVideoFormatRequirements setHeight:](v50, "setHeight:", (unint64_t)(float)(v53 / v54));
      -[BWNodeOutputMediaConfiguration setFormatRequirements:](v49, "setFormatRequirements:", v50);
      -[BWNodeOutputMediaConfiguration setPassthroughMode:](v49, "setPassthroughMode:", 0);
      -[BWNodeOutputMediaConfiguration setProvidesPixelBufferPool:](v49, "setProvidesPixelBufferPool:", v60 & v59 ^ 1u);
      -[BWNodeOutputMediaConfiguration setOwningNodeRetainedBufferCount:](v49, "setOwningNodeRetainedBufferCount:", (v61 >> (v60 & (v59 ^ 1))) - 1);
      -[BWNodeOutputMediaConfiguration setPixelBufferPoolProvidesBackPressure:](v49, "setPixelBufferPoolProvidesBackPressure:", v67);
      -[BWNodeOutputMediaConfiguration setPixelBufferPoolReportSlowBackPressureAllocations:](v49, "setPixelBufferPoolReportSlowBackPressureAllocations:", v67);
      -[BWNodeOutput setMediaConfiguration:forAttachedMediaKey:](v66->super._output, "setMediaConfiguration:forAttachedMediaKey:", v49, 0x1E4936818);
    }
    if (v66->_stereoDisparityProcessorControllerConfiguration
      || -[BWUBNodeConfiguration generateLiDARDepth]((_BOOL8)v66->_nodeConfiguration))
    {
      v55 = objc_alloc_init(BWNodeOutputMediaConfiguration);
      v56 = objc_alloc_init(BWVideoFormatRequirements);
      stereoDisparityProcessorControllerConfiguration = v66->_stereoDisparityProcessorControllerConfiguration;
      if (stereoDisparityProcessorControllerConfiguration)
      {
        -[BWVideoFormatRequirements setWidth:](v56, "setWidth:", (int)-[BWStereoDisparityProcessorControllerConfiguration disparityOutputDimensions](stereoDisparityProcessorControllerConfiguration, "disparityOutputDimensions"));
        -[BWVideoFormatRequirements setHeight:](v56, "setHeight:", -[BWStereoDisparityProcessorControllerConfiguration disparityOutputDimensions](v66->_stereoDisparityProcessorControllerConfiguration, "disparityOutputDimensions") >> 32);
        if (-[BWStereoDisparityProcessorControllerConfiguration stillImageDepthDataType](v66->_stereoDisparityProcessorControllerConfiguration, "stillImageDepthDataType") == 2)
        {
          v58 = objc_alloc_init(BWNodeInputMediaConfiguration);
          -[BWNodeInputMediaConfiguration setFormatRequirements:](v58, "setFormatRequirements:", objc_alloc_init(BWVideoFormatRequirements));
          -[BWNodeInputMediaConfiguration setPassthroughMode:](v58, "setPassthroughMode:", 0);
          -[BWNodeInput setMediaConfiguration:forAttachedMediaKey:](v66->super._input, "setMediaConfiguration:forAttachedMediaKey:", v58, 0x1E495AED8);
        }
      }
      else if (-[BWUBNodeConfiguration generateLiDARDepth]((_BOOL8)v66->_nodeConfiguration))
      {
        -[BWVideoFormatRequirements setWidth:](v56, "setWidth:", (int)-[BWUBNodeConfiguration disparityOutputDimensions]((uint64_t)v66->_nodeConfiguration));
        -[BWVideoFormatRequirements setHeight:](v56, "setHeight:", -[BWUBNodeConfiguration disparityOutputDimensions]((uint64_t)v66->_nodeConfiguration) >> 32);
      }
      -[BWVideoFormatRequirements setSupportedPixelFormats:](v56, "setSupportedPixelFormats:", &unk_1E4A00CC8);
      -[BWNodeOutputMediaConfiguration setFormatRequirements:](v55, "setFormatRequirements:", v56);
      -[BWNodeOutputMediaConfiguration setPassthroughMode:](v55, "setPassthroughMode:", 0);
      -[BWNodeOutputMediaConfiguration setProvidesPixelBufferPool:](v55, "setProvidesPixelBufferPool:", 1);
      -[BWNodeOutputMediaConfiguration setOwningNodeRetainedBufferCount:](v55, "setOwningNodeRetainedBufferCount:", -[BWNodeOutput owningNodeRetainedBufferCount](v66->super._output, "owningNodeRetainedBufferCount"));
      -[BWNodeOutput setMediaConfiguration:forAttachedMediaKey:](v66->super._output, "setMediaConfiguration:forAttachedMediaKey:", v55, CFSTR("Depth"));
    }
  }
}

- (BOOL)_requiresResizedOutputDimensionsWithInputWidth:(uint64_t)a3 inputHeight:
{
  uint64_t v5;
  uint64_t v6;

  if (result)
  {
    v5 = result;
    v6 = -[BWUBNodeConfiguration outputDimensions](*(_QWORD *)(result + 112));
    result = FigCaptureVideoDimensionsAreValid(v6);
    if ((_DWORD)result)
      return a2 != (int)-[BWUBNodeConfiguration outputDimensions](*(_QWORD *)(v5 + 112))
          || a3 != -[BWUBNodeConfiguration outputDimensions](*(_QWORD *)(v5 + 112)) >> 32;
  }
  return result;
}

- (BWVideoFormatRequirements)_demosaicedRawFormatRequirementsWithDimensions:(int)a3 colorSpaceProperties:
{
  BOOL v5;
  unsigned int v6;
  BOOL v7;
  uint64_t v8;
  BWVideoFormatRequirements *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v5 = (a3 & 0xFFFFFFFD) != 1;
  if ((a3 & 0xFFFFFFFD) == 1)
    v6 = 9;
  else
    v6 = 0;
  if (a3 == 4)
  {
    v5 = 0;
    v6 = 8;
  }
  v7 = a3 != 2 && v5;
  if (a3 == 2)
    v8 = 8;
  else
    v8 = v6;
  v9 = objc_alloc_init(BWVideoFormatRequirements);
  v12[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(*(id *)(a1 + 216), "demosaicedRawPixelFormat"));
  -[BWVideoFormatRequirements setSupportedPixelFormats:](v9, "setSupportedPixelFormats:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1));
  -[BWVideoFormatRequirements setWidth:](v9, "setWidth:", (int)a2);
  -[BWVideoFormatRequirements setHeight:](v9, "setHeight:", a2 >> 32);
  if (!v7)
  {
    v11 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v8);
    -[BWVideoFormatRequirements setSupportedColorSpaceProperties:](v9, "setSupportedColorSpaceProperties:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 1));
  }
  return v9;
}

- (void)didSelectFormat:(id)a3 forOutput:(id)a4
{
  unsigned int v6;
  unsigned int v7;

  v6 = objc_msgSend(a3, "width");
  v7 = objc_msgSend(a3, "height");
  -[BWNoiseReductionAndFusionProcessorControllerConfiguration setOutputFormat:](self->_nrProcessorControllerConfiguration, "setOutputFormat:", a3);
  -[BWDeepFusionProcessorControllerConfiguration setMaxOutputDimensions:](self->_deepFusionProcessorControllerConfiguration, "setMaxOutputDimensions:", v6 | ((unint64_t)v7 << 32));
  -[BWDeepZoomProcessorControllerConfiguration setOutputFormat:](self->_deepZoomProcessorControllerConfiguration, "setOutputFormat:", a3);
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4 forAttachedMediaKey:(id)a5
{
  objc_super v9;

  if (!objc_msgSend(a5, "isEqualToString:", 0x1E495AED8)
    || !self->_stereoDisparityProcessorControllerConfiguration)
  {
    v9.receiver = self;
    v9.super_class = (Class)BWUBNode;
    -[BWNode didSelectFormat:forInput:forAttachedMediaKey:](&v9, sel_didSelectFormat_forInput_forAttachedMediaKey_, a3, a4, a5);
  }
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *processorCoordinatorWorkerQueue;
  _QWORD v5[5];
  objc_super v6;
  os_log_type_t type;
  int v8;
  _QWORD block[17];

  block[16] = *MEMORY[0x1E0C80C00];
  if (dword_1ECFE9AF0)
  {
    v8 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v6.receiver = self;
  v6.super_class = (Class)BWUBNode;
  -[BWNode prepareForCurrentConfigurationToBecomeLive](&v6, sel_prepareForCurrentConfigurationToBecomeLive);
  processorCoordinatorWorkerQueue = self->_processorCoordinatorWorkerQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__BWUBNode_prepareForCurrentConfigurationToBecomeLive__block_invoke;
  v5[3] = &unk_1E491E720;
  v5[4] = self;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __ubn_dispatch_sync_block_invoke;
  block[3] = &unk_1E491ECB8;
  block[4] = v5;
  dispatch_sync(processorCoordinatorWorkerQueue, block);
}

void __54__BWUBNode_prepareForCurrentConfigurationToBecomeLive__block_invoke(uint64_t a1)
{
  -[BWUBNode _setupProcessorCoordinator](*(_QWORD *)(a1 + 32));
}

- (void)_setupProcessorCoordinator
{
  uint64_t v1;
  uint64_t v2;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  void *v4;
  BWVideoFormatRequirements *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  BWPixelBufferPool *v9;
  NSObject *v10;
  uint64_t v11;
  __objc2_class **v12;
  id v13;
  NSObject *v14;
  BWDeepFusionProcessorController *v15;
  NSObject *v16;
  BWDeferredCaptureController *v17;
  NSObject *v18;
  BWDeferredProcessorController *v19;
  NSObject *v20;
  BWVideoFormatRequirements *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  id v26;
  int v27;
  int v28;
  int v29;
  void *v30;
  id v31;
  id v32;
  BWVideoFormatRequirements *v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  BWDeferredContainerPixelBufferPool *v37;
  BWDeferredContainerPixelBufferPool *v38;
  BWDeferredContainerPixelBufferPool *v39;
  BWDeferredContainerPixelBufferPool *v40;
  NSObject *v41;
  uint64_t v42;
  BWLearnedNRProcessorController *v43;
  BWLearnedNRProcessorController *v44;
  BWPixelBufferPool *v45;
  BWPixelBufferPool *v46;
  id v47;
  uint64_t v48;
  void *v49;
  NSObject *v50;
  uint64_t v51;
  BWVideoFormatRequirements *v52;
  float v53;
  float v54;
  float v55;
  float v56;
  BWInferenceEngineController *v57;
  BWInferenceEngineController *v58;
  uint64_t v59;
  BWPixelBufferPool *v60;
  id v61;
  uint64_t v62;
  NSArray *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t i;
  void *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  BWPixelBufferPool *v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  void *v78;
  uint64_t v79;
  int v80;
  NSObject *v81;
  unsigned int v82;
  unsigned int v83;
  uint64_t v84;
  NSObject *v85;
  unsigned int v86;
  unsigned int v87;
  uint64_t v88;
  uint64_t v89;
  BWRedEyeReductionController *v90;
  NSObject *v91;
  unsigned int v92;
  unsigned int v93;
  uint64_t v94;
  uint64_t v95;
  BWIntelligentDistortionCorrectionProcessorController *v96;
  NSObject *v97;
  unsigned int v98;
  unsigned int v99;
  uint64_t v100;
  uint64_t v101;
  BWDeepZoomProcessorController *v102;
  BWDeepZoomProcessorController *v103;
  NSObject *v104;
  unsigned int v105;
  unsigned int v106;
  uint64_t v107;
  uint64_t v108;
  BWStereoDisparityProcessorController *v109;
  NSObject *v110;
  unsigned int v111;
  unsigned int v112;
  uint64_t v113;
  uint64_t v114;
  BWJasperColorStillsExecutorController *v115;
  NSObject *v116;
  unsigned int v117;
  unsigned int v118;
  uint64_t v119;
  uint64_t v120;
  BWJasperDisparityProcessorController *v121;
  NSObject *v122;
  unsigned int v123;
  unsigned int v124;
  uint64_t v125;
  NSObject *v126;
  unsigned int v127;
  unsigned int v128;
  uint64_t v129;
  NSObject *v130;
  unsigned int v131;
  unsigned int v132;
  NSObject *v133;
  unsigned int v134;
  unsigned int v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  void *v141;
  void *v142;
  uint64_t v143;
  uint64_t v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  os_log_type_t type;
  unsigned int v150;
  _BYTE v151[128];
  BWVideoFormatRequirements *v152;
  uint64_t v153;
  BWVideoFormatRequirements *v154;
  uint64_t v155;
  BWVideoFormatRequirements *v156;
  int v157;
  const char *v158;
  __int16 v159;
  uint64_t v160;
  __int16 v161;
  double v162;
  _QWORD v163[20];

  v163[17] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = a1;
    if (!*(_QWORD *)(a1 + 152))
    {
      if (dword_1ECFE9AF0)
      {
        v150 = 0;
        type = OS_LOG_TYPE_DEFAULT;
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      if (!_FigIsCurrentDispatchQueue())
      {
        v138 = v1;
        FigDebugAssert3();
      }
      FigDebugIsInternalBuild();
      v140 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), 0);
      mach_absolute_time();
      v142 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v143 = objc_msgSend(*(id *)(v2 + 16), "memoryPool");
      v4 = (void *)objc_msgSend(*(id *)(v2 + 8), "videoFormat");
      if (-[BWUBNode _requiresResizedOutputDimensionsWithInputWidth:inputHeight:](v2, objc_msgSend(v4, "width"), objc_msgSend(v4, "height")))
      {
        FigDebugIsInternalBuild();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), 2);
        mach_absolute_time();
        if (!objc_msgSend((id)objc_msgSend(*(id *)(v2 + 416), "portTypesWithGeometricDistortionCorrectionEnabled"), "count"))goto LABEL_181;
        v5 = -[BWVideoFormatRequirements initWithPixelBufferAttributes:]([BWVideoFormatRequirements alloc], "initWithPixelBufferAttributes:", objc_msgSend((id)objc_msgSend(*(id *)(v2 + 16), "videoFormat"), "pixelBufferAttributes"));
        -[BWVideoFormatRequirements setWidth:](v5, "setWidth:", objc_msgSend(v4, "width"));
        -[BWVideoFormatRequirements setHeight:](v5, "setHeight:", objc_msgSend(v4, "height"));
        -[BWVideoFormatRequirements setWidthAlignment:](v5, "setWidthAlignment:", objc_msgSend(v4, "extendedWidth"));
        -[BWVideoFormatRequirements setHeightAlignment:](v5, "setHeightAlignment:", objc_msgSend(v4, "extendedHeight"));
        v163[0] = v5;
        v6 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v163, 1));
        v7 = objc_msgSend(v4, "extendedWidth");
        if (v7 != objc_msgSend(v6, "extendedWidth"))
          goto LABEL_181;
        v8 = objc_msgSend(v4, "extendedHeight");
        if (v8 != objc_msgSend(v6, "extendedHeight"))
          goto LABEL_181;
        v9 = -[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:]([BWPixelBufferPool alloc], "initWithVideoFormat:capacity:name:memoryPool:", v6, objc_msgSend((id)objc_msgSend(*(id *)(v2 + 16), "preparedPixelBufferPool"), "capacity"), CFSTR("Noise Reduction and Fusion Processor Output Intermediate Pool"), v143);
        *(_QWORD *)(v2 + 200) = v9;
        if (!v9)
          goto LABEL_181;
        if (dword_1ECFE9AF0)
        {
          v150 = 0;
          type = OS_LOG_TYPE_DEFAULT;
          v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
      }
      if (!objc_msgSend(*(id *)(v2 + 112), "deferredPhotoProcessorEnabled", v136, v138)
        || *(_QWORD *)(v2 + 248))
      {
        FigDebugIsInternalBuild();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), 1);
        mach_absolute_time();
        v11 = *(_QWORD *)(v2 + 208);
        if (v11 == 1)
        {
          v12 = off_1E4915150;
        }
        else
        {
          if (v11 != 6)
            goto LABEL_181;
          v12 = off_1E4914D78;
        }
        v13 = (id)objc_msgSend(objc_alloc(*v12), "initWithConfiguration:", *(_QWORD *)(v2 + 216));
        if (!v13)
          goto LABEL_181;
        objc_msgSend(v142, "addObject:", v13);
        if (dword_1ECFE9AF0)
        {
          v150 = 0;
          type = OS_LOG_TYPE_DEFAULT;
          v14 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
      }
      if (*(_QWORD *)(v2 + 264))
      {
        FigDebugIsInternalBuild();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), 6);
        mach_absolute_time();
        v15 = -[BWDeepFusionProcessorController initWithConfiguration:]([BWDeepFusionProcessorController alloc], "initWithConfiguration:", *(_QWORD *)(v2 + 264));
        if (!v15)
          goto LABEL_181;
        objc_msgSend(v142, "addObject:", v15);
        if (dword_1ECFE9AF0)
        {
          v150 = 0;
          type = OS_LOG_TYPE_DEFAULT;
          v16 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
      }
      if (*(_QWORD *)(v2 + 576))
      {
        FigDebugIsInternalBuild();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), 8);
        mach_absolute_time();
        v17 = -[BWDeferredCaptureController initWithConfiguration:]([BWDeferredCaptureController alloc], "initWithConfiguration:", *(_QWORD *)(v2 + 576));
        if (!v17)
          goto LABEL_181;
        objc_msgSend(v142, "addObject:", v17);
        if (dword_1ECFE9AF0)
        {
          v150 = 0;
          type = OS_LOG_TYPE_DEFAULT;
          v18 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
      }
      if (*(_QWORD *)(v2 + 608))
      {
        FigDebugIsInternalBuild();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), 9);
        mach_absolute_time();
        v19 = -[BWDeferredProcessorController initWithConfiguration:]([BWDeferredProcessorController alloc], "initWithConfiguration:", *(_QWORD *)(v2 + 608));
        if (!v19)
          goto LABEL_181;
        objc_msgSend(v142, "addObject:", v19);
        if (dword_1ECFE9AF0)
        {
          v150 = 0;
          type = OS_LOG_TYPE_DEFAULT;
          v20 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
      }
      if (-[BWUBNodeConfiguration deepFusionSyntheticsInNRSupportEnabled](*(_QWORD *)(v2 + 112)))
      {
        FigDebugIsInternalBuild();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), 7);
        mach_absolute_time();
        v21 = objc_alloc_init(BWVideoFormatRequirements);
        v22 = objc_msgSend((id)objc_msgSend(*(id *)(v2 + 216), "inputFormat"), "width");
        v23 = objc_msgSend((id)objc_msgSend(*(id *)(v2 + 216), "inputFormat"), "height");
        v24 = v22 + 15;
        v25 = v23 + 15;
        -[BWVideoFormatRequirements setWidth:](v21, "setWidth:", (v24 >> 1) & 0x7FFFFFFFFFFFFFF8);
        -[BWVideoFormatRequirements setHeight:](v21, "setHeight:", (v25 >> 1) & 0x7FFFFFFFFFFFFFF8);
        -[BWVideoFormatRequirements setSupportedPixelFormats:](v21, "setSupportedPixelFormats:", &unk_1E4A00EA8);
        v156 = v21;
        v26 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v156, 1));
        v27 = -[BWUBNodeConfiguration maxDeepFusionOutputCount](*(_QWORD *)(v2 + 112));
        v28 = -[BWUBNodeConfiguration maxDeepFusionOutputCount](*(_QWORD *)(v2 + 112));
        v29 = objc_msgSend(*(id *)(v2 + 112), "deferredCaptureSupportEnabled");
        v30 = (void *)objc_msgSend(*(id *)(v2 + 216), "inputFormat");
        v31 = v30;
        if (v29)
        {
          v32 = (id)objc_msgSend((id)objc_msgSend(v30, "pixelBufferAttributes"), "mutableCopy");
          objc_msgSend(v32, "setObject:forKeyedSubscript:", &unk_1E4A00EC0, *MEMORY[0x1E0CA8F80]);
          v33 = -[BWVideoFormatRequirements initWithPixelBufferAttributes:]([BWVideoFormatRequirements alloc], "initWithPixelBufferAttributes:", v32);
          if (FigCapturePixelFormatGetCompressionType(objc_msgSend((id)objc_msgSend(*(id *)(v2 + 216), "inputFormat"), "pixelFormat")))
          {
            v155 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", FigCaptureUncompressedPixelFormatForPixelFormat(objc_msgSend((id)objc_msgSend(*(id *)(v2 + 216), "inputFormat"), "pixelFormat")));
            -[BWVideoFormatRequirements setSupportedPixelFormats:](v33, "setSupportedPixelFormats:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v155, 1));
          }
          v154 = v33;
          v31 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v154, 1));
        }
        if (!v31 || !v27 || !v28)
          goto LABEL_181;
        v34 = 3 * v28;
        v35 = 2 * v27;
        v36 = v34;
        if (objc_msgSend(*(id *)(v2 + 112), "deferredCaptureSupportEnabled"))
        {
          v37 = -[BWDeferredContainerPixelBufferPool initWithVideoFormat:capacity:name:]([BWDeferredContainerPixelBufferPool alloc], "initWithVideoFormat:capacity:name:", v31, v35, CFSTR("DeepFusion deferred synthetic intermediate pool"));
          v38 = -[BWDeferredContainerPixelBufferPool initWithVideoFormat:capacity:name:]([BWDeferredContainerPixelBufferPool alloc], "initWithVideoFormat:capacity:name:", v26, v36, CFSTR("DeepFusion deferred fusion map pool"));
        }
        else
        {
          v37 = -[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:]([BWPixelBufferPool alloc], "initWithVideoFormat:capacity:name:memoryPool:", v31, v35, CFSTR("Deep Fusion synthetic intermediate pool"), v143);
          v38 = -[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:]([BWPixelBufferPool alloc], "initWithVideoFormat:capacity:name:memoryPool:", v26, v36, CFSTR("Deep Fusion synthetic fusion map pool"), v143);
        }
        v39 = v38;
        if (!v37)
          goto LABEL_181;
        v40 = v39;
        *(_QWORD *)(v2 + 288) = v37;
        *(_QWORD *)(v2 + 296) = v40;
        if (dword_1ECFE9AF0)
        {
          v150 = 0;
          type = OS_LOG_TYPE_DEFAULT;
          v41 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
      }
      v144 = v2;
      v42 = MEMORY[0x1E0C9AA70];
      if (*(_QWORD *)(v2 + 248))
      {
        FigDebugIsInternalBuild();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), 10);
        mach_absolute_time();
        v43 = -[BWLearnedNRProcessorController initWithConfiguration:]([BWLearnedNRProcessorController alloc], "initWithConfiguration:", *(_QWORD *)(v2 + 248));
        if (v43)
        {
          v44 = v43;
          v45 = -[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:]([BWPixelBufferPool alloc], "initWithVideoFormat:capacity:name:memoryPool:", objc_msgSend(*(id *)(v2 + 248), "outputFormat"), 1, CFSTR("LearnedNR output pool"), v143);
          if (v45)
          {
            v46 = v45;
            v47 = objc_alloc(MEMORY[0x1E0C99E08]);
            v48 = *(_QWORD *)(v2 + 344) ? *(_QWORD *)(v2 + 344) : v42;
            v49 = (void *)objc_msgSend(v47, "initWithDictionary:", v48);
            objc_msgSend(v49, "setObject:forKeyedSubscript:", v46, 0x1E4951698);

            *(_QWORD *)(v2 + 344) = v49;
            if (!-[BWLearnedNRProcessorController prepareWithPixelBufferPoolProvider:](v44, "prepareWithPixelBufferPoolProvider:", v2))objc_msgSend(v142, "addObject:", v44);
          }
        }
        if (dword_1ECFE9AF0)
        {
          v150 = 0;
          type = OS_LOG_TYPE_DEFAULT;
          v50 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
      }
      if (*(_QWORD *)(v2 + 304))
      {
        FigDebugIsInternalBuild();
        v139 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), 11);
        mach_absolute_time();
        if (-[BWUBNodeConfiguration inferenceMainImageDownscalingFactor](*(_QWORD *)(v2 + 112)) == 0.0)
          goto LABEL_195;
        v51 = 875704422;
        v52 = objc_alloc_init(BWVideoFormatRequirements);
        v53 = (float)(unint64_t)objc_msgSend((id)objc_msgSend(*(id *)(v2 + 216), "inputFormat"), "width");
        v54 = v53 / -[BWUBNodeConfiguration inferenceMainImageDownscalingFactor](*(_QWORD *)(v2 + 112));
        if (v54 < 512.0)
          v54 = 512.0;
        -[BWVideoFormatRequirements setWidth:](v52, "setWidth:", (unint64_t)v54);
        v55 = (float)(unint64_t)objc_msgSend((id)objc_msgSend(*(id *)(v2 + 216), "inputFormat"), "height");
        v56 = v55 / -[BWUBNodeConfiguration inferenceMainImageDownscalingFactor](*(_QWORD *)(v2 + 112));
        if (v56 < 384.0)
          v56 = 384.0;
        -[BWVideoFormatRequirements setHeight:](v52, "setHeight:", (unint64_t)v56);
        if (FigCapturePlatformSupportsUniversalCompression() && *(_QWORD *)(v2 + 208) == 6)
          v51 = FigCaptureCompressedPixelFormatForPixelFormat(875704422, 4, 0);
        v153 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v51);
        -[BWVideoFormatRequirements setSupportedPixelFormats:](v52, "setSupportedPixelFormats:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v153, 1));
        v152 = v52;
        objc_msgSend(*(id *)(v2 + 304), "setInputFormat:", +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v152, 1)));
        v57 = -[BWInferenceEngineController initWithConfiguration:contextName:]([BWInferenceEngineController alloc], "initWithConfiguration:contextName:", *(_QWORD *)(v2 + 304), objc_msgSend((id)v2, "name"));
        if (!v57)
          goto LABEL_195;
        v58 = v57;
        v59 = objc_msgSend((id)-[BWUBNodeConfiguration providedInferenceAttachedMediaByMode](*(_QWORD *)(v2 + 112)), "objectForKeyedSubscript:", &unk_1E49FA2C0)? 4: 2;
        v60 = -[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:]([BWPixelBufferPool alloc], "initWithVideoFormat:capacity:name:memoryPool:", objc_msgSend(*(id *)(v2 + 304), "inputFormat"), v59, CFSTR("UB Inference Input Pool"), v143);
        *(_QWORD *)(v2 + 336) = v60;
        if (v60)
        {
          v61 = objc_alloc(MEMORY[0x1E0C99E08]);
          if (*(_QWORD *)(v2 + 344))
            v62 = *(_QWORD *)(v2 + 344);
          else
            v62 = v42;
          v141 = (void *)objc_msgSend(v61, "initWithDictionary:", v62);
          v145 = 0u;
          v146 = 0u;
          v147 = 0u;
          v148 = 0u;
          v63 = -[BWInferenceEngineController providedAttachedMediaKeys](v58, "providedAttachedMediaKeys");
          v64 = -[NSArray countByEnumeratingWithState:objects:count:](v63, "countByEnumeratingWithState:objects:count:", &v145, v151, 16);
          v65 = v2;
          if (v64)
          {
            v66 = v64;
            v67 = *(_QWORD *)v146;
            while (2)
            {
              for (i = 0; i != v66; ++i)
              {
                if (*(_QWORD *)v146 != v67)
                  objc_enumerationMutation(v63);
                v69 = *(void **)(*((_QWORD *)&v145 + 1) + 8 * i);
                v70 = (void *)objc_msgSend(*(id *)(v65 + 16), "mediaPropertiesForAttachedMediaKey:", v69);
                if (objc_msgSend(v70, "preparedPixelBufferPool"))
                {
                  v71 = (void *)objc_msgSend(v70, "resolvedVideoFormat");
                  if ((objc_msgSend(v71, "isEqual:", -[BWInferenceEngineController outputVideoFormatForAttachedMediaKey:](v58, "outputVideoFormatForAttachedMediaKey:", v69)) & 1) == 0)goto LABEL_101;
                }
                else
                {
                  v72 = -[BWInferenceEngineController outputVideoFormatForAttachedMediaKey:](v58, "outputVideoFormatForAttachedMediaKey:", v69);
                  if (!v72
                    || (v71 = (void *)v72,
                        v73 = objc_msgSend(*(id *)(v65 + 112), "deferredCaptureSupportEnabled"),
                        v74 = [BWPixelBufferPool alloc],
                        v75 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UB %@ Output Pool"), v69),
                        LOBYTE(v137) = v73,
                        (v76 = -[BWPixelBufferPool initWithVideoFormat:capacity:name:clientProvidesPool:memoryPool:providesBackPressure:reportSlowBackPressureAllocations:](v74, "initWithVideoFormat:capacity:name:clientProvidesPool:memoryPool:providesBackPressure:reportSlowBackPressureAllocations:", v71, 2, v75, 0, v143, v73, v137)) == 0))
                  {
LABEL_101:
                    v78 = v141;
                    goto LABEL_105;
                  }
                  v77 = (void *)v76;
                  objc_msgSend(v141, "setObject:forKeyedSubscript:", v76, v69);

                  v65 = v144;
                }
                if (*(_QWORD *)(v65 + 416)
                  && ((objc_msgSend(v69, "isEqualToString:", 0x1E49511B8) & 1) != 0
                   || objc_msgSend(v69, "isEqualToString:", 0x1E495B0D8)))
                {
                  *(_DWORD *)(v65 + 440) = objc_msgSend(v71, "width");
                  *(_DWORD *)(v65 + 444) = objc_msgSend(v71, "height");
                }
              }
              v66 = -[NSArray countByEnumeratingWithState:objects:count:](v63, "countByEnumeratingWithState:objects:count:", &v145, v151, 16);
              if (v66)
                continue;
              break;
            }
          }
          v78 = v141;
          if (objc_msgSend(v141, "count"))
          {

            *(_QWORD *)(v65 + 344) = v141;
            v78 = 0;
          }
          FigDebugIsInternalBuild();
          v79 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), 12);
          mach_absolute_time();
          v80 = -[BWInferenceEngineController prepareWithPixelBufferPoolProvider:](v58, "prepareWithPixelBufferPoolProvider:", v65);
          if (dword_1ECFE9AF0)
          {
            v150 = 0;
            type = OS_LOG_TYPE_DEFAULT;
            v81 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            v82 = v150;
            if (os_log_type_enabled(v81, type))
              v83 = v82;
            else
              v83 = v82 & 0xFFFFFFFE;
            if (v83)
            {
              mach_absolute_time();
              v84 = FigHostTimeToNanoseconds();
              v157 = 136315650;
              v158 = "-[BWUBNode _setupProcessorCoordinator]";
              v159 = 2114;
              v160 = v79;
              v161 = 2048;
              v162 = (double)(v84 / 1000) / 1000.0;
              _os_log_send_and_compose_impl();
            }
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
          if (!v80)
            objc_msgSend(v142, "addObject:", v58);
        }
        else
        {
LABEL_195:
          v78 = 0;
        }
LABEL_105:

        if (dword_1ECFE9AF0)
        {
          v150 = 0;
          type = OS_LOG_TYPE_DEFAULT;
          v85 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          v86 = v150;
          if (os_log_type_enabled(v85, type))
            v87 = v86;
          else
            v87 = v86 & 0xFFFFFFFE;
          if (v87)
          {
            mach_absolute_time();
            v88 = FigHostTimeToNanoseconds();
            v157 = 136315650;
            v158 = "-[BWUBNode _setupProcessorCoordinator]";
            v159 = 2114;
            v160 = v139;
            v161 = 2048;
            v162 = (double)(v88 / 1000) / 1000.0;
            _os_log_send_and_compose_impl();
          }
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
      }
      v2 = v144;
      if (*(_QWORD *)(v144 + 400))
      {
        FigDebugIsInternalBuild();
        v89 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), 14);
        mach_absolute_time();
        v90 = -[BWRedEyeReductionController initWithConfiguration:]([BWRedEyeReductionController alloc], "initWithConfiguration:", *(_QWORD *)(v144 + 400));
        if (!v90)
          goto LABEL_181;
        objc_msgSend(v142, "addObject:", v90);
        if (dword_1ECFE9AF0)
        {
          v150 = 0;
          type = OS_LOG_TYPE_DEFAULT;
          v91 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          v92 = v150;
          if (os_log_type_enabled(v91, type))
            v93 = v92;
          else
            v93 = v92 & 0xFFFFFFFE;
          if (v93)
          {
            mach_absolute_time();
            v94 = FigHostTimeToNanoseconds();
            v157 = 136315650;
            v158 = "-[BWUBNode _setupProcessorCoordinator]";
            v159 = 2114;
            v160 = v89;
            v161 = 2048;
            v162 = (double)(v94 / 1000) / 1000.0;
            _os_log_send_and_compose_impl();
          }
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
      }
      if (*(_QWORD *)(v144 + 416))
      {
        FigDebugIsInternalBuild();
        v95 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), 15);
        mach_absolute_time();
        if (objc_msgSend((id)objc_msgSend(*(id *)(v144 + 416), "portTypesWithIntelligentDistortionCorrectionEnabled"), "count"))
        {
          if (objc_msgSend(*(id *)(v144 + 112), "deferredPhotoProcessorEnabled"))
          {
            *(_DWORD *)(v144 + 440) = 512;
            *(_DWORD *)(v144 + 444) = 384;
          }
          else if (!-[BWUBNode _inferenceOutputPixelBufferPoolForAttachedMediaKey:](v144, CFSTR("LowResPersonSegmentationMask"))&& !-[BWUBNode _inferenceOutputPixelBufferPoolForAttachedMediaKey:](v144, CFSTR("LowResPersonSegmentationMaskClone"))|| !*(_DWORD *)(v144 + 440)|| !*(_DWORD *)(v144 + 444))
          {
            goto LABEL_181;
          }
        }
        objc_msgSend(*(id *)(v144 + 416), "setProcessorConfig:", objc_msgSend((id)objc_msgSend(*(id *)(v144 + 16), "videoFormat"), "width") | ((unint64_t)objc_msgSend((id)objc_msgSend(*(id *)(v144 + 16), "videoFormat"), "height") << 32), *(unsigned int *)(v144 + 440) | ((unint64_t)*(unsigned int *)(v144 + 444) << 32));
        v96 = -[BWIntelligentDistortionCorrectionProcessorController initWithConfiguration:]([BWIntelligentDistortionCorrectionProcessorController alloc], "initWithConfiguration:", *(_QWORD *)(v144 + 416));
        if (!v96)
          goto LABEL_181;
        objc_msgSend(v142, "addObject:", v96);
        if (dword_1ECFE9AF0)
        {
          v150 = 0;
          type = OS_LOG_TYPE_DEFAULT;
          v97 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          v98 = v150;
          if (os_log_type_enabled(v97, type))
            v99 = v98;
          else
            v99 = v98 & 0xFFFFFFFE;
          if (v99)
          {
            mach_absolute_time();
            v100 = FigHostTimeToNanoseconds();
            v157 = 136315650;
            v158 = "-[BWUBNode _setupProcessorCoordinator]";
            v159 = 2114;
            v160 = v95;
            v161 = 2048;
            v162 = (double)(v100 / 1000) / 1000.0;
            _os_log_send_and_compose_impl();
          }
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
      }
      if (*(_QWORD *)(v144 + 464))
      {
        FigDebugIsInternalBuild();
        v101 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), 16);
        mach_absolute_time();
        v102 = -[BWDeepZoomProcessorController initWithConfiguration:]([BWDeepZoomProcessorController alloc], "initWithConfiguration:", *(_QWORD *)(v144 + 464));
        if (!v102)
          goto LABEL_181;
        v103 = v102;
        if (-[BWDeepZoomProcessorController prepareWithPixelBufferPoolProvider:](v102, "prepareWithPixelBufferPoolProvider:", v144))
        {
          goto LABEL_181;
        }
        objc_msgSend(v142, "addObject:", v103);
        if (dword_1ECFE9AF0)
        {
          v150 = 0;
          type = OS_LOG_TYPE_DEFAULT;
          v104 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          v105 = v150;
          if (os_log_type_enabled(v104, type))
            v106 = v105;
          else
            v106 = v105 & 0xFFFFFFFE;
          if (v106)
          {
            mach_absolute_time();
            v107 = FigHostTimeToNanoseconds();
            v157 = 136315650;
            v158 = "-[BWUBNode _setupProcessorCoordinator]";
            v159 = 2114;
            v160 = v101;
            v161 = 2048;
            v162 = (double)(v107 / 1000) / 1000.0;
            _os_log_send_and_compose_impl();
          }
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
      }
      if (*(_QWORD *)(v144 + 480))
      {
        FigDebugIsInternalBuild();
        v108 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), 17);
        mach_absolute_time();
        objc_msgSend(*(id *)(v144 + 480), "setInputDimensions:", objc_msgSend((id)objc_msgSend(*(id *)(v144 + 8), "videoFormat"), "width") | ((unint64_t)objc_msgSend((id)objc_msgSend(*(id *)(v144 + 8), "videoFormat"), "height") << 32));
        v109 = -[BWStereoDisparityProcessorController initWithConfiguration:]([BWStereoDisparityProcessorController alloc], "initWithConfiguration:", *(_QWORD *)(v144 + 480));
        if (!v109)
          goto LABEL_181;
        objc_msgSend(v142, "addObject:", v109);
        if (dword_1ECFE9AF0)
        {
          v150 = 0;
          type = OS_LOG_TYPE_DEFAULT;
          v110 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          v111 = v150;
          if (os_log_type_enabled(v110, type))
            v112 = v111;
          else
            v112 = v111 & 0xFFFFFFFE;
          if (v112)
          {
            mach_absolute_time();
            v113 = FigHostTimeToNanoseconds();
            v157 = 136315650;
            v158 = "-[BWUBNode _setupProcessorCoordinator]";
            v159 = 2114;
            v160 = v108;
            v161 = 2048;
            v162 = (double)(v113 / 1000) / 1000.0;
            _os_log_send_and_compose_impl();
          }
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
      }
      if (*(_QWORD *)(v144 + 544))
      {
        FigDebugIsInternalBuild();
        v114 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), 18);
        mach_absolute_time();
        objc_msgSend(*(id *)(v144 + 544), "setInputColorFormat:", objc_msgSend(*(id *)(v144 + 216), "outputFormat"));
        objc_msgSend(*(id *)(v144 + 544), "setOutputDepthFormat:", objc_msgSend((id)objc_msgSend(*(id *)(v144 + 16), "mediaPropertiesForAttachedMediaKey:", CFSTR("Depth")), "resolvedVideoFormat"));
        v115 = -[BWJasperColorStillsExecutorController initWithConfiguration:]([BWJasperColorStillsExecutorController alloc], "initWithConfiguration:", *(_QWORD *)(v144 + 544));
        if (!v115)
          goto LABEL_181;
        objc_msgSend(v142, "addObject:", v115);
        if (dword_1ECFE9AF0)
        {
          v150 = 0;
          type = OS_LOG_TYPE_DEFAULT;
          v116 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          v117 = v150;
          if (os_log_type_enabled(v116, type))
            v118 = v117;
          else
            v118 = v117 & 0xFFFFFFFE;
          if (v118)
          {
            mach_absolute_time();
            v119 = FigHostTimeToNanoseconds();
            v157 = 136315650;
            v158 = "-[BWUBNode _setupProcessorCoordinator]";
            v159 = 2114;
            v160 = v114;
            v161 = 2048;
            v162 = (double)(v119 / 1000) / 1000.0;
            _os_log_send_and_compose_impl();
          }
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
      }
      if (*(_QWORD *)(v144 + 560))
      {
        FigDebugIsInternalBuild();
        v120 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), 19);
        mach_absolute_time();
        objc_msgSend(*(id *)(v144 + 560), "setInputColorFormat:", objc_msgSend(*(id *)(v144 + 216), "outputFormat"));
        objc_msgSend(*(id *)(v144 + 560), "setOutputDepthFormat:", objc_msgSend((id)objc_msgSend(*(id *)(v144 + 16), "mediaPropertiesForAttachedMediaKey:", CFSTR("Depth")), "resolvedVideoFormat"));
        objc_msgSend(*(id *)(v144 + 560), "setPointCloudTimeMachineCapacity:", objc_msgSend(*(id *)(v144 + 528), "retainedBufferCount"));
        v121 = -[BWJasperDisparityProcessorController initWithConfiguration:]([BWJasperDisparityProcessorController alloc], "initWithConfiguration:", *(_QWORD *)(v144 + 560));
        if (!v121)
        {
          FigDebugAssert3();
          goto LABEL_181;
        }
        objc_msgSend(v142, "addObject:", v121);
        if (dword_1ECFE9AF0)
        {
          v150 = 0;
          type = OS_LOG_TYPE_DEFAULT;
          v122 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          v123 = v150;
          if (os_log_type_enabled(v122, type))
            v124 = v123;
          else
            v124 = v123 & 0xFFFFFFFE;
          if (v124)
          {
            mach_absolute_time();
            v125 = FigHostTimeToNanoseconds();
            v157 = 136315650;
            v158 = "-[BWUBNode _setupProcessorCoordinator]";
            v159 = 2114;
            v160 = v120;
            v161 = 2048;
            v162 = (double)(v125 / 1000) / 1000.0;
            _os_log_send_and_compose_impl();
          }
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
      }
      os_unfair_lock_lock((os_unfair_lock_t)(v144 + 168));
      *(_QWORD *)(v144 + 152) = -[BWStillImageProcessorCoordinator initWithProcessorControllers:]([BWStillImageProcessorCoordinator alloc], "initWithProcessorControllers:", v142);
      os_unfair_lock_unlock((os_unfair_lock_t)(v144 + 168));
      if (dword_1ECFE9AF0)
      {
        v150 = 0;
        type = OS_LOG_TYPE_DEFAULT;
        v126 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        v127 = v150;
        if (os_log_type_enabled(v126, type))
          v128 = v127;
        else
          v128 = v127 & 0xFFFFFFFE;
        if (v128)
        {
          mach_absolute_time();
          v129 = FigHostTimeToNanoseconds();
          v157 = 136315650;
          v158 = "-[BWUBNode _setupProcessorCoordinator]";
          v159 = 2114;
          v160 = v140;
          v161 = 2048;
          v162 = (double)(v129 / 1000) / 1000.0;
          _os_log_send_and_compose_impl();
        }
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
LABEL_181:
      if (*(_QWORD *)(v2 + 152))
      {
        if (!dword_1ECFE9AF0)
          return;
        v150 = 0;
        type = OS_LOG_TYPE_DEFAULT;
        v130 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        v131 = v150;
        if (os_log_type_enabled(v130, type))
          v132 = v131;
        else
          v132 = v131 & 0xFFFFFFFE;
        if (!v132)
          goto LABEL_193;
      }
      else
      {
        v150 = 0;
        type = OS_LOG_TYPE_DEFAULT;
        v133 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        v134 = v150;
        if (os_log_type_enabled(v133, type))
          v135 = v134;
        else
          v135 = v134 & 0xFFFFFFFE;
        if (!v135)
          goto LABEL_193;
      }
      v157 = 136315138;
      v158 = "-[BWUBNode _setupProcessorCoordinator]";
      _os_log_send_and_compose_impl();
LABEL_193:
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
}

- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5
{
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = -[BWNode inputs](self, "inputs", a3, a4, 0);
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v13 != v10)
        objc_enumerationMutation(v7);
      if (self->_pointCloudInput == a5 && !objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11), "liveFormat"))
        break;
      if (v9 == ++v11)
      {
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v9)
          goto LABEL_3;
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:
    if (!-[BWNodeOutput liveFormat](self->super._output, "liveFormat"))
      -[BWNodeOutput makeConfiguredFormatLive](self->super._output, "makeConfiguredFormatLive");
  }
}

- (void)didReachEndOfDataForInput:(id)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *deferredProcessorControllerQueue;
  NSObject *processorCoordinatorWorkerQueue;
  uint64_t v8;
  NSObject *v9;
  NSObject *emitQueue;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[5];
  _QWORD v14[5];
  _QWORD v15[5];
  os_log_type_t type;
  int v17;
  uint64_t block;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  _QWORD *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (dword_1ECFE9AF0)
  {
    v17 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (-[BWNode input:hasReachedState:](self, "input:hasReachedState:", self->super._input, 0, v11, v12)
    && self->_pointCloudInput != a3
    && !self->_resourcesReleased)
  {
    -[BWFigVideoCaptureDevice setAdaptiveUnifiedBracketingController:](self->_device, "setAdaptiveUnifiedBracketingController:", 0);

    self->_device = 0;
    deferredProcessorControllerQueue = self->_deferredProcessorControllerQueue;
    if (deferredProcessorControllerQueue)
    {
      block = MEMORY[0x1E0C809B0];
      v19 = 3221225472;
      v20 = __ubn_dispatch_sync_block_invoke;
      v21 = &unk_1E491ECB8;
      v22 = &__block_literal_global_65;
      dispatch_sync(deferredProcessorControllerQueue, &block);
    }
    processorCoordinatorWorkerQueue = self->_processorCoordinatorWorkerQueue;
    v8 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __38__BWUBNode_didReachEndOfDataForInput___block_invoke_2;
    v15[3] = &unk_1E491E720;
    v15[4] = self;
    block = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __ubn_dispatch_sync_block_invoke;
    v21 = &unk_1E491ECB8;
    v22 = v15;
    dispatch_sync(processorCoordinatorWorkerQueue, &block);
    v9 = self->_processorCoordinatorWorkerQueue;
    v14[0] = v8;
    v14[1] = 3221225472;
    v14[2] = __38__BWUBNode_didReachEndOfDataForInput___block_invoke_6;
    v14[3] = &unk_1E491E720;
    v14[4] = self;
    block = v8;
    v19 = 3221225472;
    v20 = __ubn_dispatch_sync_block_invoke;
    v21 = &unk_1E491ECB8;
    v22 = v14;
    dispatch_sync(v9, &block);
  }
  if (-[BWNode allInputsHaveReachedState:](self, "allInputsHaveReachedState:", 0))
  {
    -[BWUBNode _releaseResources]((uint64_t)self);
    emitQueue = self->_emitQueue;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __38__BWUBNode_didReachEndOfDataForInput___block_invoke_7;
    v13[3] = &unk_1E491E720;
    v13[4] = self;
    block = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __ubn_dispatch_async_block_invoke;
    v21 = &unk_1E491ECB8;
    v22 = v13;
    dispatch_async(emitQueue, &block);
  }
}

void __38__BWUBNode_didReachEndOfDataForInput___block_invoke_2(uint64_t a1)
{
  _QWORD *v2;
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t block;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  void *v10;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2[35])
  {
    -[BWUBNode _deepFusionDispatch:direction:block:]((uint64_t)v2, 1, 1, (uint64_t)&__block_literal_global_48_0);
    v2 = *(_QWORD **)(a1 + 32);
  }
  v3 = v2[40];
  v4 = MEMORY[0x1E0C809B0];
  if (v3)
  {
    block = MEMORY[0x1E0C809B0];
    v7 = 3221225472;
    v8 = __ubn_dispatch_sync_block_invoke;
    v9 = &unk_1E491ECB8;
    v10 = &__block_literal_global_49;
    dispatch_sync(v3, &block);
    v2 = *(_QWORD **)(a1 + 32);
  }
  v5 = v2[63];
  if (v5)
  {
    block = v4;
    v7 = 3221225472;
    v8 = __ubn_dispatch_sync_block_invoke;
    v9 = &unk_1E491ECB8;
    v10 = &__block_literal_global_50_0;
    dispatch_sync(v5, &block);
  }
}

- (void)_deepFusionDispatch:(int)a3 direction:(uint64_t)a4 block:
{
  NSObject *v5;

  if (a1)
  {
    v5 = *(NSObject **)(a1 + 280);
    if (!v5)
      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("Attempting to dispatch onto a nil _deepFusionProcessorControllerQueue"), 0));
    -[BWUBNode _dispatch:direction:processingQueue:block:](a1, a2, a3, v5, a4);
  }
}

void __38__BWUBNode_didReachEndOfDataForInput___block_invoke_6(uint64_t a1)
{
  -[BWUBNode _resetProcessingState](*(_QWORD *)(a1 + 32));
}

- (void)_resetProcessingState
{
  uint64_t v1;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  const void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[5];
  os_log_type_t type;
  int v15;
  uint64_t block;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  _QWORD *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (!_FigIsCurrentDispatchQueue())
    {
      v10 = v1;
      LODWORD(v9) = 0;
      FigDebugAssert3();
    }
    if (*(_BYTE *)(a1 + 184))
    {
      if (*(_QWORD *)(a1 + 144) && dword_1ECFE9AF0 != 0)
      {
        v15 = 0;
        type = OS_LOG_TYPE_DEFAULT;
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
    }
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 152), "controllerForType:", *(_QWORD *)(a1 + 208), v9, v10), "cancelProcessing");
    v5 = MEMORY[0x1E0C809B0];
    if (*(_QWORD *)(a1 + 280))
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __33__BWUBNode__resetProcessingState__block_invoke;
      v13[3] = &unk_1E491E720;
      v13[4] = a1;
      -[BWUBNode _deepFusionDispatch:direction:block:](a1, 1, 1, (uint64_t)v13);
      objc_msgSend(*(id *)(a1 + 272), "removeAllObjects");
    }
    v6 = *(NSObject **)(a1 + 320);
    if (v6)
    {
      v12[0] = v5;
      v12[1] = 3221225472;
      v12[2] = __33__BWUBNode__resetProcessingState__block_invoke_2;
      v12[3] = &unk_1E491E720;
      v12[4] = a1;
      block = v5;
      v17 = 3221225472;
      v18 = __ubn_dispatch_sync_block_invoke;
      v19 = &unk_1E491ECB8;
      v20 = v12;
      dispatch_sync(v6, &block);
      objc_msgSend(*(id *)(a1 + 312), "removeAllObjects");
    }
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 152), "controllerForType:", 7), "cancelProcessing");
    objc_msgSend(*(id *)(a1 + 424), "removeAllObjects");
    objc_msgSend(*(id *)(a1 + 432), "removeAllObjects");
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 152), "controllerForType:", 10), "cancelProcessing");
    objc_msgSend(*(id *)(a1 + 472), "removeAllObjects");
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 152), "controllerForType:", 4), "cancelProcessing");
    objc_msgSend(*(id *)(a1 + 408), "removeAllObjects");
    v7 = *(NSObject **)(a1 + 504);
    if (v7)
    {
      v11[0] = v5;
      v11[1] = 3221225472;
      v11[2] = __33__BWUBNode__resetProcessingState__block_invoke_3;
      v11[3] = &unk_1E491E720;
      v11[4] = a1;
      block = v5;
      v17 = 3221225472;
      v18 = __ubn_dispatch_sync_block_invoke;
      v19 = &unk_1E491ECB8;
      v20 = v11;
      dispatch_sync(v7, &block);

      *(_QWORD *)(a1 + 488) = 0;
      objc_msgSend(*(id *)(a1 + 520), "removeAllObjects");
      *(_DWORD *)(a1 + 496) = 0;
    }
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 152), "controllerForType:", 9), "cancelProcessing");
    objc_msgSend(*(id *)(a1 + 552), "removeAllObjects");
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 152), "controllerForType:", 13), "cancelProcessing");
    objc_msgSend(*(id *)(a1 + 568), "removeAllObjects");
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 152), "controllerForType:", 11), "cancelProcessing");
    objc_msgSend(*(id *)(a1 + 256), "removeAllObjects");
    v8 = *(const void **)(a1 + 592);
    if (v8)
    {
      CFRelease(v8);
      *(_QWORD *)(a1 + 592) = 0;
    }
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 152), "controllerForType:", 14), "cancelProcessing");

    *(_QWORD *)(a1 + 584) = 0;
    objc_msgSend(*(id *)(a1 + 224), "removeAllObjects");
    objc_msgSend(*(id *)(a1 + 232), "removeAllObjects");
    objc_msgSend(*(id *)(a1 + 240), "removeAllObjects");
    objc_msgSend(*(id *)(a1 + 512), "removeAllObjects");
    if (*(_QWORD *)(a1 + 144))
    {

      *(_QWORD *)(a1 + 128) = *(id *)(a1 + 144);
    }
    *(_QWORD *)(a1 + 136) = 0;

    *(_QWORD *)(a1 + 144) = 0;
  }
}

uint64_t __38__BWUBNode_didReachEndOfDataForInput___block_invoke_7(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "liveFormat");
  if (result)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "markEndOfLiveOutput");
  return result;
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  NSObject *processorCoordinatorWorkerQueue;
  CFTypeRef v8;
  CFTypeRef v9;
  _QWORD v10[8];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  int v14;
  _QWORD block[5];

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  if (self->_resourcesReleased)
  {
    v14 = -12780;
  }
  else if (self->_pointCloudInput == a4)
  {
    -[BWUBNode _handlePointCloudSampleBuffer:]((uint64_t)self, a3);
  }
  else
  {
    processorCoordinatorWorkerQueue = self->_processorCoordinatorWorkerQueue;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __40__BWUBNode_renderSampleBuffer_forInput___block_invoke;
    v10[3] = &unk_1E4921438;
    v10[6] = &v11;
    v10[7] = a3;
    v10[4] = self;
    v10[5] = a4;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __ubn_dispatch_sync_block_invoke;
    block[3] = &unk_1E491ECB8;
    block[4] = v10;
    dispatch_sync(processorCoordinatorWorkerQueue, block);
  }
  if (*((_DWORD *)v12 + 6))
  {
    v8 = CMGetAttachment(a3, CFSTR("StillSettings"), 0);
    v9 = CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
    -[BWUBNode handleNodeError:forInput:](self, "handleNodeError:forInput:", +[BWNodeError newError:sourceNode:stillImageSettings:metadata:](BWNodeError, "newError:sourceNode:stillImageSettings:metadata:", *((unsigned int *)v12 + 6), self, v8, v9), a4);
  }
  _Block_object_dispose(&v11, 8);
}

- (uint64_t)_handlePointCloudSampleBuffer:(uint64_t)result
{
  uint64_t v3;

  if (!result)
    return result;
  v3 = result;
  if (!_FigIsNotCurrentDispatchQueue())
  {
    FigDebugAssert3();
    if (a2)
      goto LABEL_4;
    return 4294954516;
  }
  if (!a2)
    return 4294954516;
LABEL_4:
  if (-[BWUBNodeConfiguration generateLiDARDepth](*(_QWORD *)(v3 + 112)))
  {
    -[BWUBNode _handleLidarDepthPointCloudSampleBuffer:](v3, (uint64_t)a2);
  }
  else
  {
    result = objc_msgSend(*(id *)(v3 + 104), "supplementalPointCloudCaptureDevice");
    if (!result)
      return result;
    -[BWUBNode _handleSupplementalPointCloudSampleBuffer:](v3, a2);
  }
  return 0;
}

uint64_t __40__BWUBNode_renderSampleBuffer_forInput___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = -[BWUBNode _handleSampleBuffer:input:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 56));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (uint64_t)_handleSampleBuffer:(uint64_t)a1 input:(void *)a2
{
  CFTypeRef v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  id v13;
  CFTypeRef v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  void (**v19)(id, void *, uint64_t, id, _QWORD);
  void *v20;
  unsigned int v21;
  uint64_t v22;
  int v23;
  int v24;
  int v25;
  _QWORD v26[7];
  char v27;
  _QWORD block[5];

  if (!a1)
    return 0;
  if (!_FigIsCurrentDispatchQueue())
  {
    FigDebugAssert3();
    if (a2)
      goto LABEL_4;
LABEL_31:
    v17 = 4294954516;
    goto LABEL_14;
  }
  if (!a2)
    goto LABEL_31;
LABEL_4:
  v4 = CMGetAttachment(a2, CFSTR("StillSettings"), 0);
  if (!v4)
    goto LABEL_31;
  v5 = (void *)v4;
  v6 = (void *)CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  if (!v6)
    goto LABEL_31;
  v7 = v6;
  v8 = (void *)objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00]);
  if ((-[BWUBNode _shouldPassthroughWithStillImageSettings:](a1, v5) & 1) != 0)
  {
    if (FigCaptureSushiRawDNGDictionaryCreatedInGraph()
      && FigCapturePixelFormatIsBayerRaw(objc_msgSend((id)objc_msgSend(v5, "requestedSettings"), "rawOutputFormat")))
    {
      v21 = objc_msgSend((id)objc_msgSend(v5, "requestedSettings"), "outputWidth");
      v22 = objc_msgSend((id)objc_msgSend(v5, "requestedSettings"), "outputHeight");
      v23 = objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D05F18]), "intValue");
      v24 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 416), "portTypesWithGeometricDistortionCorrectionEnabled"), "containsObject:", v8);
      if (v23)
        v25 = 1;
      else
        v25 = v24;
      -[BWUBNode _propagateSushiRawDNGDictionaryWithOutputSampleBuffer:requestedDimensions:requiresGDCInformation:](a1, a2, v21 | (unint64_t)(v22 << 32), v25);
    }
    -[BWUBNode _emitSampleBuffer:description:](a1, a2, (uint64_t)CFSTR("passthrough input frame"));
    goto LABEL_13;
  }
  v27 = 0;
  -[BWUBNode _infoForCaptureType:isSupportedCaptureTypeOut:isFusionCaptureTypeOut:](a1, objc_msgSend((id)objc_msgSend(v5, "captureSettings"), "captureType"), 0, &v27);
  if ((objc_msgSend(*(id *)(a1 + 112), "deferredPhotoProcessorEnabled") & 1) == 0
    && v27
    && (objc_msgSend(*(id *)(a1 + 128), "isEqualToString:", objc_msgSend((id)objc_msgSend(v5, "requestedSettings"), "captureRequestIdentifier")) & 1) != 0)
  {
LABEL_13:
    v17 = 0;
LABEL_14:
    -[BWUBNode _resetProcessingStateIfDone](a1);
    return v17;
  }
  v9 = -[BWUBNode _setupProcessingStateWithSettings:](a1, v5);
  if ((_DWORD)v9)
  {
    v17 = v9;
    goto LABEL_14;
  }
  v10 = (id)objc_msgSend(*(id *)(a1 + 616), "objectForKeyedSubscript:", v8);
  v11 = (id)objc_msgSend(*(id *)(a1 + 408), "objectForKeyedSubscript:", v8);
  v12 = (id)objc_msgSend(*(id *)(a1 + 256), "objectForKeyedSubscript:", v8);
  v13 = (id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 224), "objectForKeyedSubscript:", v8), "firstObject");
  if (v10)
  {
    v14 = CMGetAttachment(a2, CFSTR("DeferredProcessingContainer"), 0);
    v15 = objc_msgSend((id)objc_msgSend((id)CMGetAttachment(a2, CFSTR("PhotoManifest"), 0), "photoDescriptors"), "firstObject");
    v16 = *(NSObject **)(a1 + 600);
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __38__BWUBNode__handleSampleBuffer_input___block_invoke;
    v26[3] = &unk_1E491EB90;
    v26[4] = v10;
    v26[5] = v14;
    v26[6] = v15;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __ubn_dispatch_async_block_invoke;
    block[3] = &unk_1E491ECB8;
    block[4] = v26;
    dispatch_async(v16, block);
    goto LABEL_13;
  }
  if (v11)
  {
    if (+[BWRedEyeReductionControllerInput requiresInferencesFromFrame:](BWRedEyeReductionControllerInput, "requiresInferencesFromFrame:", a2))
    {
      -[BWUBNode _inferenceProcessRedEyeReductionSampleBuffer:settings:portType:](a1, (opaqueCMSampleBuffer *)a2, v5, (uint64_t)v8);
    }
    else
    {
      v19 = (void (**)(id, void *, uint64_t, id, _QWORD))-[BWUBNode _ubRERRouter]((id)a1);
      v19[2](v19, a2, 1, v11, 0);
    }
    goto LABEL_13;
  }
  if (v12)
  {
    objc_msgSend(v12, "setInputFrame:", a2);
    goto LABEL_13;
  }
  v20 = v13;
  if (v13)
  {
    objc_msgSend(v13, "addFrame:", a2);
    if (objc_msgSend((id)objc_msgSend(v5, "captureSettings"), "captureType") == 7)
      -[BWUBNode _handleClientBracketFrameEmissionForProcessorInput:clientBracketFrame:](a1, v20, a2);
    else
      -[BWUBNode _handleReferenceFrameEmissionForProcessorInput:](a1, v20);
    goto LABEL_13;
  }
  v17 = 0;
  if (!-[BWUBNode _processingNeededForSettings:portType:](a1, v5, v8) || v27)
    goto LABEL_14;
  v17 = -[BWUBNode _singleImageProcessSampleBuffer:settings:portType:](a1, (uint64_t)a2, v5, (uint64_t)v8);
  if ((_DWORD)v17)
    FigDebugAssert3();
  return v17;
}

- (uint64_t)_handleLidarDepthPointCloudSampleBuffer:(uint64_t)result
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if (result)
  {
    v4 = result;
    if (!_FigIsNotCurrentDispatchQueue())
    {
      v6 = v2;
      LODWORD(v5) = 0;
      FigDebugAssert3();
    }
    return objc_msgSend((id)objc_msgSend(*(id *)(v4 + 152), "controllerForType:", 13, v5, v6), "addPointCloudToTimeMachine:", a2);
  }
  return result;
}

- (void)_handleSupplementalPointCloudSampleBuffer:(uint64_t)a1
{
  int v4;
  NSObject *v5;
  _QWORD v6[6];
  _QWORD block[5];

  if (a1)
  {
    if (!_FigIsNotCurrentDispatchQueue())
      FigDebugAssert3();
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 536));
    v4 = *(unsigned __int8 *)(a1 + 540);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 536));
    if (!v4)
    {
      if (a2)
        CFRetain(a2);
      v5 = *(NSObject **)(a1 + 160);
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __54__BWUBNode__handleSupplementalPointCloudSampleBuffer___block_invoke;
      v6[3] = &unk_1E491F158;
      v6[4] = a1;
      v6[5] = a2;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __ubn_dispatch_async_block_invoke;
      block[3] = &unk_1E491ECB8;
      block[4] = v6;
      dispatch_async(v5, block);
    }
  }
}

void __54__BWUBNode__handleSupplementalPointCloudSampleBuffer___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t i;
  void *v10;
  char v11;
  const void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 536));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(unsigned __int8 *)(v2 + 540);
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 536));
  if (!v3)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 552);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (!v5)
      goto LABEL_10;
    v6 = v5;
    v7 = *(_QWORD *)v14;
    v8 = 1;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v10 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 552), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i));
        objc_msgSend(v10, "addPointCloud:", *(_QWORD *)(a1 + 40));
        v8 &= objc_msgSend(v10, "needMorePointClouds") ^ 1;
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
    if (!v8)
    {
      v11 = 0;
    }
    else
    {
LABEL_10:
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "stopPointCloudCaptureForStillImageCaptureWithSettingsID:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136));
      v11 = 1;
    }
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 536));
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 540) = v11;
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 536));
  }
  v12 = *(const void **)(a1 + 40);
  if (v12)
    CFRelease(v12);
  -[BWUBNode _resetProcessingStateIfDone](*(_QWORD *)(a1 + 32));
}

- (void)_resetProcessingStateIfDone
{
  if (a1)
  {
    if (!_FigIsCurrentDispatchQueue())
      FigDebugAssert3();
    if (*(_QWORD *)(a1 + 144)
      && !*(_QWORD *)(a1 + 584)
      && !objc_msgSend(*(id *)(a1 + 224), "count")
      && !objc_msgSend(*(id *)(a1 + 272), "count")
      && !objc_msgSend(*(id *)(a1 + 432), "count")
      && !objc_msgSend(*(id *)(a1 + 472), "count")
      && !objc_msgSend(*(id *)(a1 + 408), "count")
      && !objc_msgSend(*(id *)(a1 + 616), "count")
      && *(int *)(a1 + 496) <= 0
      && !objc_msgSend(*(id *)(a1 + 552), "count")
      && !objc_msgSend(*(id *)(a1 + 568), "count"))
    {
      -[BWUBNode _resetProcessingState](a1);
    }
  }
}

- (uint64_t)_shouldPassthroughWithStillImageSettings:(uint64_t)result
{
  int v3;
  char v4;
  char v5;
  int v6;
  unsigned int v7;

  if (result)
  {
    v3 = objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "deliverSushiRaw");
    v4 = objc_msgSend((id)objc_msgSend(a2, "requestedSettings"), "previewEnabled");
    v5 = objc_msgSend((id)objc_msgSend(a2, "requestedSettings"), "rawThumbnailEnabled");
    v6 = objc_msgSend((id)objc_msgSend(a2, "requestedSettings"), "outputFormat");
    v7 = objc_msgSend((id)objc_msgSend(a2, "requestedSettings"), "depthDataDeliveryEnabled") ^ 1;
    if (v6)
      v7 = 0;
    if ((v5 & 1) != 0)
      v7 = 0;
    if ((v4 & 1) != 0)
      v7 = 0;
    if (v3)
      return v7;
    else
      return 0;
  }
  return result;
}

- (uint64_t)_infoForCaptureType:(_BYTE *)a3 isSupportedCaptureTypeOut:(char *)a4 isFusionCaptureTypeOut:
{
  uint64_t v6;
  char v7;

  if (result)
  {
    v6 = result;
    result = 0;
    v7 = 0;
    switch(a2)
    {
      case 1:
      case 2:
      case 6:
      case 7:
        v7 = 0;
        result = 1;
        if (a3)
          goto LABEL_10;
        goto LABEL_11;
      case 3:
      case 4:
      case 5:
      case 8:
      case 9:
        goto LABEL_9;
      case 10:
        result = objc_msgSend(*(id *)(v6 + 216), "fusionEnabled");
        goto LABEL_8;
      case 11:
        result = objc_msgSend(*(id *)(v6 + 216), "lowLightFusionEnabled");
        goto LABEL_8;
      case 12:
        result = -[BWUBNodeConfiguration deepFusionSupportEnabled](*(_QWORD *)(v6 + 112));
LABEL_8:
        v7 = 1;
LABEL_9:
        if (a3)
          goto LABEL_10;
        goto LABEL_11;
      default:
        v7 = 0;
        if (!a3)
          goto LABEL_11;
LABEL_10:
        *a3 = result;
LABEL_11:
        if (a4)
          *a4 = v7;
        break;
    }
  }
  return result;
}

- (uint64_t)_setupProcessingStateWithSettings:(uint64_t)a1
{
  uint64_t v2;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  BWStillImageProcessingPlan *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  _BOOL4 v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t k;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t m;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  int v60;
  _BOOL4 v61;
  id v62;
  char v63;
  char v64;
  void *v65;
  int v66;
  id v67;
  void *v68;
  void *v69;
  BWStillImageProcessingPlan *v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  char v87;
  char v88;
  os_log_type_t type;
  int v90;
  _BYTE v91[128];
  _BYTE v92[128];
  _BYTE v93[128];
  _BYTE v94[128];
  uint64_t v95;

  v95 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  if (!_FigIsCurrentDispatchQueue())
  {
    v59 = v2;
    LODWORD(v57) = 0;
    FigDebugAssert3();
  }
  v5 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v6 = v5;
  if (!*(_QWORD *)(a1 + 152) || !a2)
  {
    v90 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    v23 = 4294950488;
    goto LABEL_88;
  }
  v62 = v5;
  v7 = (void *)objc_msgSend(a2, "requestedSettings");
  v8 = (void *)objc_msgSend(a2, "captureSettings");
  if ((objc_msgSend(*(id *)(a1 + 144), "isEqualToString:", objc_msgSend(v7, "captureRequestIdentifier")) & 1) != 0)
  {
    v23 = 0;
    goto LABEL_87;
  }
  if (dword_1ECFE9AF0)
  {
    v90 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    v9 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v88 = 0;
  v87 = 0;
  -[BWUBNode _infoForCaptureType:isSupportedCaptureTypeOut:isFusionCaptureTypeOut:](a1, objc_msgSend(v8, "captureType", v57, v59), &v88, &v87);
  if (!v88)
  {
    v23 = 4294954516;
    goto LABEL_87;
  }
  -[BWUBNode _flushBufferPoolsWhenPossibleWithSettings:](a1, a2);
  -[BWUBNode _prepareSharedExternalMemoryResourceForProcessorControllersIfNeeded](a1);
  *(_QWORD *)(a1 + 136) = objc_msgSend(v8, "settingsID");

  *(_QWORD *)(a1 + 144) = (id)objc_msgSend(v7, "captureRequestIdentifier");
  v10 = -[BWStillImageProcessingPlan initWithSettings:]([BWStillImageProcessingPlan alloc], "initWithSettings:", a2);
  if (!v87)
  {
    if (objc_msgSend(v8, "captureType") == 7)
    {
      v6 = v62;
      if (*(_QWORD *)(a1 + 480))
      {
        v22 = -[BWUBNode _setupProcessingStateForClientBracketWithSettings:processingPlan:](a1, a2, v10);
        if ((_DWORD)v22)
        {
          v23 = v22;
          v59 = v2;
          LODWORD(v57) = v22;
          goto LABEL_83;
        }
      }
    }
    else
    {
      v6 = v62;
      if (objc_msgSend(v8, "captureType") == 2)
      {
        v52 = -[BWUBNode _setupProcessingStateForFlashCaptureWithSettings:processingPlan:](a1, a2, v10);
        if ((_DWORD)v52)
        {
          v23 = v52;
          v59 = v2;
          LODWORD(v57) = v52;
          goto LABEL_83;
        }
      }
      else
      {
        v53 = -[BWUBNode _setupProcessingStateForSingleImageCaptureWithSettings:processingPlan:](a1, a2, v10);
        if ((_DWORD)v53)
        {
          v23 = v53;
          v59 = v2;
          LODWORD(v57) = v53;
          goto LABEL_83;
        }
      }
    }
    v54 = -[BWUBNode _setupProcessingStateForDeferredCaptureIfNeededWithSettings:](a1, a2);
    v23 = v54;
    if (!(_DWORD)v54)
      goto LABEL_88;
    v59 = v2;
    LODWORD(v57) = v54;
LABEL_83:
    FigDebugAssert3();
    goto LABEL_88;
  }
  v11 = -[BWUBNode _setupProcessingStateForDeferredCaptureIfNeededWithSettings:](a1, a2);
  if ((_DWORD)v11)
  {
    v23 = v11;
    v59 = v2;
    LODWORD(v57) = v11;
LABEL_86:
    FigDebugAssert3();
LABEL_87:
    v6 = v62;
    goto LABEL_88;
  }
  v65 = v8;
  v70 = v10;
  v67 = -[BWUBNode _nrOutputSbufRouter]((id)a1);
  v69 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v83 = 0u;
  v84 = 0u;
  v85 = 0u;
  v86 = 0u;
  v12 = (void *)objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "portTypes");
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v83, v94, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v84;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v84 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v83 + 1) + 8 * i);
        if (-[BWUBNode _nrProcessorInputNeededForSettings:portType:](a1, a2, v17))
        {
          if (objc_msgSend(*(id *)(a1 + 152), "controllerForType:", *(_QWORD *)(a1 + 208)))
          {
            v18 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithSettings:portType:", a2, v17);
            v19 = -[BWUBNode _bufferTypesForCaptureSettings:](a1, (void *)objc_msgSend(a2, "captureSettings"));
            objc_msgSend(v18, "addOutputSampleBufferRouter:forBufferTypes:", v67, v19);
            -[BWStillImageProcessingPlan addInput:sequenceNumber:portType:bufferTypes:](v70, "addInput:sequenceNumber:portType:bufferTypes:", v18, 0, v17, v19);
            objc_msgSend(*(id *)(a1 + 224), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v18), v17);
            if (v18)
            {
              if (objc_msgSend(v18, "isMaster"))
                objc_msgSend(v69, "insertObject:atIndex:", v18, 0);
              else
                objc_msgSend(v69, "addObject:", v18);

            }
          }
        }
        -[BWUBNode _setupDeferredProcessingWithSettings:portType:](a1, (uint64_t)a2, v17);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v83, v94, 16);
    }
    while (v14);
  }
  v20 = (void *)objc_msgSend(*(id *)(a1 + 152), "controllerForType:", *(_QWORD *)(a1 + 208));
  if (objc_msgSend(v65, "deliverOriginalImage"))
    v21 = (objc_msgSend(v65, "captureFlags") & 0x2000) == 0;
  else
    v21 = 0;
  v24 = v69;
  v60 = objc_msgSend(v65, "deliverOriginalImage");
  if (objc_msgSend(v65, "captureType") == 12)
    v66 = objc_msgSend(v65, "deliverDeferredPhotoProxyImage") ^ 1;
  else
    v66 = 0;
  v64 = -[BWUBNode _isSemanticRenderingCapture:](a1, a2);
  v25 = -[BWUBNode _isInferenceInputImageRequiredForSettings:](a1, a2);
  v63 = -[BWUBNode _inferencesRequiredByProcessorControllersForSettings:](a1, a2);
  v61 = v21;
  if (v21)
  {
    v81 = 0u;
    v82 = 0u;
    v79 = 0u;
    v80 = 0u;
    v26 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v79, v93, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v80;
      while (2)
      {
        for (j = 0; j != v27; ++j)
        {
          if (*(_QWORD *)v80 != v28)
            objc_enumerationMutation(v69);
          v30 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * j);
          v31 = objc_msgSend(v20, "enqueueInputForProcessing:delegate:processErrorRecoveryFrame:processOriginalImage:processToneMapping:processInferenceInputImage:clientBracketSequenceNumber:processSemanticRendering:provideInferenceInputImageForProcessing:processSmartStyleRenderingInput:inferencesAvailable:", v30, a1, 0, 1, 0, 0, 0);
          if ((_DWORD)v31)
          {
            v23 = v31;
            v59 = v2;
            LODWORD(v57) = v31;
            goto LABEL_86;
          }
          objc_msgSend(v30, "setRemainingProcessingCount:", objc_msgSend(v30, "remainingProcessingCount") + 1);
        }
        v27 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v79, v93, 16);
        if (v27)
          continue;
        break;
      }
    }
  }
  v68 = v20;
  v77 = 0u;
  v78 = 0u;
  v75 = 0u;
  v76 = 0u;
  v32 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v75, v92, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v76;
    while (2)
    {
      for (k = 0; k != v33; ++k)
      {
        if (*(_QWORD *)v76 != v34)
          objc_enumerationMutation(v24);
        v36 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * k);
        v37 = (void *)objc_msgSend(v36, "portType");
        if (-[BWUBNode _processingNeededForSettings:portType:](a1, (void *)objc_msgSend(v36, "stillImageSettings"), v37))
        {
          if (v25)
          {
            objc_msgSend(v36, "addOutputSampleBufferRouter:forBufferTypes:", -[BWUBNode _ubInferenceInputRouter]((id)a1), &unk_1E4A00D40);
            -[BWStillImageProcessingPlan addInput:sequenceNumber:portType:bufferType:](v70, "addInput:sequenceNumber:portType:bufferType:", v36, 0, v37, 15);
          }
          HIBYTE(v58) = v63;
          *(_WORD *)((char *)&v58 + 5) = v25;
          BYTE4(v58) = v64;
          LODWORD(v58) = 0;
          v38 = objc_msgSend(v68, "enqueueInputForProcessing:delegate:processErrorRecoveryFrame:processOriginalImage:processToneMapping:processInferenceInputImage:clientBracketSequenceNumber:processSemanticRendering:provideInferenceInputImageForProcessing:processSmartStyleRenderingInput:inferencesAvailable:", v36, a1, 0, 0, 0, 0, v58);
          if ((_DWORD)v38)
          {
            v23 = v38;
            v59 = v2;
            LODWORD(v57) = v38;
            goto LABEL_86;
          }
          if ((v66 & 1) == 0)
          {
            v40 = -[BWUBNode _setupProcessingStateForIntelligentDistortionCorrectionIfNeededWithSettings:sequenceNumber:portType:queueProvidingInput:processingPlan:]((id *)a1, a2, 0, (uint64_t)v37, v39, v70);
            if ((_DWORD)v40)
            {
              v23 = v40;
              v59 = v2;
              LODWORD(v57) = v40;
              goto LABEL_86;
            }
            v42 = -[BWUBNode _setupProcessingStateForDeepZoomWithSettings:sequenceNumber:portType:queueProvidingInput:processingPlan:](a1, a2, 0, (uint64_t)v37, v41, v70);
            v24 = v69;
            if ((_DWORD)v42)
            {
              v23 = v42;
              v59 = v2;
              LODWORD(v57) = v42;
              goto LABEL_86;
            }
          }
        }
        objc_msgSend(v36, "setRemainingProcessingCount:", objc_msgSend(v36, "remainingProcessingCount") + 1);
      }
      v33 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v75, v92, 16);
      if (v33)
        continue;
      break;
    }
  }
  v43 = -[BWUBNode _setupProcessingStateForDisparityIfNeededWithSettings:sequenceNumber:processingPlan:](a1, a2, 0, v70);
  if ((_DWORD)v43)
  {
    v23 = v43;
    v59 = v2;
    LODWORD(v57) = v43;
    goto LABEL_86;
  }
  v6 = v62;
  if (((v60 ^ 1 | v61) & 1) == 0)
  {
    v73 = 0u;
    v74 = 0u;
    v71 = 0u;
    v72 = 0u;
    v44 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v71, v91, 16);
    if (v44)
    {
      v45 = v44;
      v46 = *(_QWORD *)v72;
      while (2)
      {
        for (m = 0; m != v45; ++m)
        {
          if (*(_QWORD *)v72 != v46)
            objc_enumerationMutation(v24);
          v48 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * m);
          v49 = objc_msgSend(v68, "enqueueInputForProcessing:delegate:processErrorRecoveryFrame:processOriginalImage:processToneMapping:processInferenceInputImage:clientBracketSequenceNumber:processSemanticRendering:provideInferenceInputImageForProcessing:processSmartStyleRenderingInput:inferencesAvailable:", v48, a1, 0, 1, 0, 0, 0);
          if ((_DWORD)v49)
          {
            v23 = v49;
            v59 = v2;
            LODWORD(v57) = v49;
            goto LABEL_83;
          }
          objc_msgSend(v48, "setRemainingProcessingCount:", objc_msgSend(v48, "remainingProcessingCount") + 1);
        }
        v45 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v71, v91, 16);
        if (v45)
          continue;
        break;
      }
    }
  }
  if (v66)
  {
    v50 = -[BWUBNode _setupProcessingStateForDeepFusionWithSettings:processingPlan:]((id *)a1, a2, v70);
    if ((_DWORD)v50)
    {
      v23 = v50;
      v59 = v2;
      LODWORD(v57) = v50;
      goto LABEL_83;
    }
  }
  v51 = -[BWUBNode _setupProcessingStateForPointCloudDepthIfNeededWithSettings:processingPlan:](a1, a2, v70);
  v23 = v51;
  if ((_DWORD)v51)
  {
    v59 = v2;
    LODWORD(v57) = v51;
    goto LABEL_83;
  }
  -[BWUBNode _setupProcessingStateForJasperDisparityIfNeededWithSettings:processingPlan:](a1, a2, v70);
LABEL_88:
  objc_msgSend(v6, "drain", v57, v59);
  return v23;
}

uint64_t __38__BWUBNode__handleSampleBuffer_input___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setContainer:photoIdentifier:", *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "photoIdentifier"));
}

- (void)_inferenceProcessRedEyeReductionSampleBuffer:(void *)a3 settings:(uint64_t)a4 portType:
{
  CVImageBufferRef ImageBuffer;
  __CVBuffer *v9;
  __CVBuffer *v10;
  int CopyWithNewPixelBuffer;
  uint64_t v12;
  uint64_t v13;
  CFTypeRef v14;
  NSObject *v15;
  NSObject *v16;
  int v17;
  _QWORD v18[7];
  CFTypeRef cf;
  _QWORD block[5];

  if (!a1)
    return;
  if (!_FigIsCurrentDispatchQueue())
    FigDebugAssert3();
  cf = 0;
  dispatch_group_wait(*(dispatch_group_t *)(a1 + 328), 0xFFFFFFFFFFFFFFFFLL);
  ImageBuffer = CMSampleBufferGetImageBuffer(a2);
  if (!ImageBuffer)
  {
    v10 = 0;
    goto LABEL_23;
  }
  v9 = ImageBuffer;
  v10 = (__CVBuffer *)objc_msgSend(*(id *)(a1 + 336), "newPixelBuffer");
  if (!v10)
  {
LABEL_23:
    v17 = -12780;
    goto LABEL_16;
  }
  CopyWithNewPixelBuffer = -[BWUBNode _scaleInferenceInputForRedEyeReductionFromPixelBuffer:outputPixelBuffer:](a1, v9, v10);
  if (!CopyWithNewPixelBuffer)
  {
    CopyWithNewPixelBuffer = BWCMSampleBufferCreateCopyWithNewPixelBuffer(a2, v10, (CFTypeRef *)(a1 + 368), (CMSampleBufferRef *)&cf);
    if (!CopyWithNewPixelBuffer)
    {
      CopyWithNewPixelBuffer = -[BWUBNode _setupProcessingStateForInferenceWithSettings:portType:](a1, a3, a4);
      if (!CopyWithNewPixelBuffer)
      {
        v12 = objc_msgSend(*(id *)(a1 + 312), "objectForKeyedSubscript:", a4);
        if (v12)
        {
          v13 = v12;
          if (a2)
            CFRetain(a2);
          if (cf)
          {
            CFRetain(cf);
            v14 = cf;
          }
          else
          {
            v14 = 0;
          }
          v15 = *(NSObject **)(a1 + 328);
          v16 = *(NSObject **)(a1 + 320);
          v18[0] = MEMORY[0x1E0C809B0];
          v18[1] = 3221225472;
          v18[2] = __75__BWUBNode__inferenceProcessRedEyeReductionSampleBuffer_settings_portType___block_invoke;
          v18[3] = &unk_1E4920768;
          v18[4] = v13;
          v18[5] = v14;
          v18[6] = a2;
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __ubn_dispatch_group_async_block_invoke;
          block[3] = &unk_1E491ECB8;
          block[4] = v18;
          dispatch_group_async(v15, v16, block);
          v17 = 0;
          goto LABEL_16;
        }
        goto LABEL_23;
      }
    }
  }
  v17 = CopyWithNewPixelBuffer;
LABEL_16:
  CVPixelBufferRelease(v10);
  if (cf)
    CFRelease(cf);
  if (v17)
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 408), "objectForKeyedSubscript:", a4), "addFrame:faceObservations:", a2, 0);
}

- (id)_ubRERRouter
{
  _QWORD v1[5];

  if (result)
  {
    v1[0] = MEMORY[0x1E0C809B0];
    v1[1] = 3221225472;
    v1[2] = __24__BWUBNode__ubRERRouter__block_invoke;
    v1[3] = &unk_1E4923398;
    v1[4] = result;
    return (id)objc_msgSend(v1, "copy");
  }
  return result;
}

- (void)_handleClientBracketFrameEmissionForProcessorInput:(const void *)a3 clientBracketFrame:
{
  if (a1)
  {
    -[BWUBNode _handleClientBracketFrameEmissionForSampleBuffer:stillImageSettings:portType:](a1, a3, (void *)objc_msgSend(a2, "stillImageSettings"), objc_msgSend(a2, "portType"));
    if ((-[BWUBNode _processingNeededForSettings:portType:](a1, (void *)objc_msgSend(a2, "stillImageSettings"), (void *)objc_msgSend(a2, "portType")) & 1) == 0)
    {
      if (objc_msgSend(a2, "receivedAllFrames"))
        -[BWUBNode _processorControllerDidFinishProcessingInputForPortType:processorType:](a1, objc_msgSend(a2, "portType"), *(_QWORD *)(a1 + 208));
    }
  }
}

- (void)_handleReferenceFrameEmissionForProcessorInput:(uint64_t)a1
{
  const void *v4;
  const void *v5;
  const void *v6;

  if (a1
    && ((objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "stillImageSettings"), "captureSettings"), "captureStreamSettingsForPortType:", objc_msgSend(a2, "portType")), "captureFlags") & 0x20000) != 0|| *(_QWORD *)(a1 + 480)))
  {
    if (objc_msgSend(*(id *)(a1 + 232), "objectForKeyedSubscript:", objc_msgSend(a2, "portType")))
    {
      v4 = 0;
      v5 = 0;
      v6 = 0;
    }
    else
    {
      v6 = (const void *)objc_msgSend(a2, "referenceFrame");
      v4 = (const void *)objc_msgSend(a2, "evMinusReferenceFrame");
      if (objc_msgSend(a2, "emitErrorRecoveryFrame"))
        v5 = (const void *)objc_msgSend(a2, "errorRecoveryFrame");
      else
        v5 = 0;
    }
    -[BWUBNode _handleReferenceFrameEmissionForSettings:portType:referenceFrame:evMinusReferenceFrame:errorRecoveryFrame:](a1, (void *)objc_msgSend(a2, "stillImageSettings"), objc_msgSend(a2, "portType"), v6, v4, v5);
    if ((-[BWUBNode _processingNeededForSettings:portType:](a1, (void *)objc_msgSend(a2, "stillImageSettings"), (void *)objc_msgSend(a2, "portType")) & 1) == 0&& objc_msgSend(a2, "receivedAllFrames"))
    {
      if (objc_msgSend(*(id *)(a1 + 232), "objectForKeyedSubscript:", objc_msgSend(a2, "portType")))
        -[BWUBNode _processorControllerDidFinishProcessingInputForPortType:processorType:](a1, objc_msgSend(a2, "portType"), *(_QWORD *)(a1 + 208));
    }
  }
}

- (uint64_t)_processingNeededForSettings:(void *)a3 portType:
{
  _BOOL4 v5;

  if (result)
  {
    if (*(_QWORD *)(result + 480))
      v5 = 0;
    else
      v5 = (objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureFlags") & 0x20800) == 2048;
    if ((objc_msgSend(a3, "isEqualToString:", objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "masterPortType")) & 1) != 0)
      return 1;
    else
      return objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "requestedSettings"), "bravoConstituentImageDeliveryDeviceTypes"), "count")|| v5;
  }
  return result;
}

- (uint64_t)_singleImageProcessSampleBuffer:(void *)a3 settings:(uint64_t)a4 portType:
{
  uint64_t v4;
  BWStillImageProcessingPlan *v9;
  void *v10;
  int v11;
  unsigned __int8 v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;

  if (!a1)
    return 0;
  if (!_FigIsCurrentDispatchQueue())
  {
    v22 = v4;
    LODWORD(v20) = 0;
    FigDebugAssert3();
  }
  v9 = -[BWStillImageProcessingPlan initWithSettings:]([BWStillImageProcessingPlan alloc], "initWithSettings:", a3);
  v10 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithSettings:portType:", a3, a4);
  v11 = -[BWUBNode _isInferenceInputImageRequiredForSettings:](a1, a3);
  v12 = v11;
  v13 = MEMORY[0x1E0C809B0];
  if (v11)
  {
    v23 = MEMORY[0x1E0C809B0];
    v24 = 3221225472;
    v25 = __35__BWUBNode__ubInferenceInputRouter__block_invoke;
    v26 = &unk_1E4923398;
    v27 = a1;
    objc_msgSend(v10, "addOutputSampleBufferRouter:forBufferTypes:", (id)objc_msgSend(&v23, "copy"), &unk_1E4A00CF8);
    -[BWStillImageProcessingPlan addInput:sequenceNumber:portType:bufferType:](v9, "addInput:sequenceNumber:portType:bufferType:", v10, 0, a4, 15);
  }
  v14 = *(_QWORD *)(a1 + 160);
  v23 = v13;
  v24 = 3221225472;
  v25 = __53__BWUBNode__standardNROutputRouterWithExpectedQueue___block_invoke;
  v26 = &unk_1E4923460;
  v27 = v14;
  v28 = a1;
  objc_msgSend(v10, "addOutputSampleBufferRouter:forBufferTypes:", (id)objc_msgSend(&v23, "copy", v20, v22), &unk_1E4A00D10);
  objc_msgSend(v10, "addFrame:", a2);
  -[BWStillImageProcessingPlan addInput:sequenceNumber:portType:bufferType:](v9, "addInput:sequenceNumber:portType:bufferType:", v10, 0, a4, 1);
  v15 = -[BWUBNode _inferencesRequiredByProcessorControllersForSettings:](a1, a3);
  -[BWUBNode _setupProcessingStateForJasperDisparityIfNeededWithSettings:processingPlan:](a1, a3, v9);
  v17 = -[BWUBNode _setupProcessingStateForIntelligentDistortionCorrectionIfNeededWithSettings:sequenceNumber:portType:queueProvidingInput:processingPlan:]((id *)a1, a3, 0, a4, v16, v9);
  if (!(_DWORD)v17)
  {
    HIBYTE(v21) = v15;
    *(_WORD *)((char *)&v21 + 5) = v12;
    BYTE4(v21) = 0;
    LODWORD(v21) = 0;
    v17 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 152), "controllerForType:", *(_QWORD *)(a1 + 208)), "enqueueInputForProcessing:delegate:processErrorRecoveryFrame:processOriginalImage:processToneMapping:processInferenceInputImage:clientBracketSequenceNumber:processSemanticRendering:provideInferenceInputImageForProcessing:processSmartStyleRenderingInput:inferencesAvailable:", v10, a1, 0, 0, 0, 0, v21);
  }
  v18 = v17;

  return v18;
}

- (void)_propagateSushiRawDNGDictionaryWithOutputSampleBuffer:(uint64_t)a3 requestedDimensions:(int)a4 requiresGDCInformation:
{
  opaqueCMSampleBuffer *AttachedMedia;
  opaqueCMSampleBuffer *v6;
  CVImageBufferRef ImageBuffer;
  __CVBuffer *v8;
  void *v9;
  const void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  unint64_t v16;
  OSType PixelFormatType;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v25;

  if (a1)
  {
    AttachedMedia = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a2, 0x1E495AEF8);
    if (AttachedMedia)
    {
      v6 = AttachedMedia;
      ImageBuffer = CMSampleBufferGetImageBuffer(AttachedMedia);
      if (ImageBuffer)
      {
        v8 = ImageBuffer;
        v9 = (void *)CMGetAttachment(v6, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
        v10 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend((id)CMGetAttachment(v6, CFSTR("StillImageProcessingFlags"), 0), "unsignedIntValue") | 0x80);
        CMSetAttachment(v6, CFSTR("StillImageProcessingFlags"), v10, 1u);
        if (!CMGetAttachment(v6, CFSTR("RawDNGDictionary"), 0))
        {
          v11 = objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00]);
          v12 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 216), "rawColorCalibrationsByPortType"), "objectForKeyedSubscript:", v11);
          if (v12)
          {
            v13 = (void *)v12;
            v14 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 216), "rawLensShadingCorrectionCoefficientsByPortType"), "objectForKeyedSubscript:", v11);
            if (v14)
            {
              v15 = (void *)v14;
              v16 = BWPixelBufferDimensionsFromSampleBuffer(v6);
              PixelFormatType = CVPixelBufferGetPixelFormatType(v8);
              v18 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 216), "sensorConfigurationsByPortType"), "objectForKeyedSubscript:", v11);
              if (v18)
              {
                v19 = v18;
                v20 = (void *)objc_msgSend(v18, "sensorIDDictionary");
                v21 = (void *)objc_msgSend(v19, "cameraInfo");
                v22 = (void *)BWCreateSushiRawDNGDictionary(v16, PixelFormatType, a3, v9, v13, v15, 1, a4, v20, v21, objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D20]), "intValue"));
                if (v22)
                {
                  v25 = v22;
                  CMSetAttachment(v6, CFSTR("RawDNGDictionary"), v22, 1u);

                }
              }
            }
          }
        }
      }
    }
  }
}

- (void)_emitSampleBuffer:(uint64_t)a3 description:
{
  NSObject *v6;
  _QWORD v7[7];
  _QWORD block[5];

  if (a1)
  {
    -[BWUBNode _removeNonPropagatedAttachedMediaFromSampleBuffer:](a1, a2);
    if (a2)
      CFRetain(a2);
    v6 = *(NSObject **)(a1 + 176);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __42__BWUBNode__emitSampleBuffer_description___block_invoke;
    v7[3] = &unk_1E491EC68;
    v7[5] = a1;
    v7[6] = a2;
    v7[4] = a3;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __ubn_dispatch_async_block_invoke;
    block[3] = &unk_1E491ECB8;
    block[4] = v7;
    dispatch_async(v6, block);
  }
}

- (void)handleNodeError:(id)a3 forInput:(id)a4
{
  _BOOL4 resourcesReleased;
  uint64_t v7;
  NSObject *processorCoordinatorWorkerQueue;
  NSObject *emitQueue;
  _QWORD v10[6];
  _QWORD v11[7];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;
  uint64_t block;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  _QWORD *v20;

  if (self->_pointCloudInput != a4)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x2020000000;
    resourcesReleased = self->_resourcesReleased;
    v15 = 1;
    v7 = MEMORY[0x1E0C809B0];
    if (resourcesReleased)
      goto LABEL_4;
    processorCoordinatorWorkerQueue = self->_processorCoordinatorWorkerQueue;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __37__BWUBNode_handleNodeError_forInput___block_invoke;
    v11[3] = &unk_1E491F368;
    v11[4] = a3;
    v11[5] = self;
    v11[6] = &v12;
    block = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __ubn_dispatch_sync_block_invoke;
    v19 = &unk_1E491ECB8;
    v20 = v11;
    dispatch_sync(processorCoordinatorWorkerQueue, &block);
    if (*((_BYTE *)v13 + 24))
    {
LABEL_4:
      emitQueue = self->_emitQueue;
      v10[0] = v7;
      v10[1] = 3221225472;
      v10[2] = __37__BWUBNode_handleNodeError_forInput___block_invoke_2;
      v10[3] = &unk_1E491E748;
      v10[4] = self;
      v10[5] = a3;
      block = v7;
      v17 = 3221225472;
      v18 = __ubn_dispatch_async_block_invoke;
      v19 = &unk_1E491ECB8;
      v20 = v10;
      dispatch_async(emitQueue, &block);
    }
    _Block_object_dispose(&v12, 8);
  }
}

void __37__BWUBNode_handleNodeError_forInput___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "errorCode") == -16800
    || objc_msgSend(*(id *)(a1 + 32), "errorCode") == -16802)
  {
    v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 552), "count");
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v3 = *(void **)(*(_QWORD *)(a1 + 40) + 552);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v19 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 552), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i)), "setSkipProcessing:", 1);
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      }
      while (v5);
    }
    v8 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 568), "count");
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v9 = *(void **)(*(_QWORD *)(a1 + 40) + 568);
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v15;
      do
      {
        for (j = 0; j != v11; ++j)
        {
          if (*(_QWORD *)v15 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 568), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * j)), "setSkipProcessing:", 1);
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
      }
      while (v11);
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 152), "controllerForType:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 208)), "finishProcessingCurrentInputNow") ^ 1;
    if (v2 && !*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 152), "controllerForType:", 9), "finishProcessingCurrentInputNow") ^ 1;
    if (v8 && !*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 152), "controllerForType:", 13), "finishProcessingCurrentInputNow") ^ 1;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "errorCode") == -16806)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "stillImageSettings"), "requestedSettings"), "isBeginMomentCaptureSettings") ^ 1;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    -[BWUBNode _resetProcessingState](*(_QWORD *)(a1 + 40));
}

uint64_t __37__BWUBNode_handleNodeError_forInput___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "emitNodeError:", *(_QWORD *)(a1 + 40));
}

- (void)handleStillImagePrewarmWithSettings:(id)a3 forInput:(id)a4
{
  NSObject *processorCoordinatorWorkerQueue;
  _QWORD v5[6];
  _QWORD block[5];

  if (!self->_resourcesReleased)
  {
    processorCoordinatorWorkerQueue = self->_processorCoordinatorWorkerQueue;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __57__BWUBNode_handleStillImagePrewarmWithSettings_forInput___block_invoke;
    v5[3] = &unk_1E491E748;
    v5[4] = self;
    v5[5] = a3;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __ubn_dispatch_sync_block_invoke;
    block[3] = &unk_1E491ECB8;
    block[4] = v5;
    dispatch_sync(processorCoordinatorWorkerQueue, block);
  }
}

void __57__BWUBNode_handleStillImagePrewarmWithSettings_forInput___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t v7;
  void *v8;
  int v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[6];
  int v15;
  os_log_type_t type;
  int v17;
  _QWORD block[17];

  block[16] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "isEqualToString:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "requestedSettings"), "captureRequestIdentifier")) & 1) == 0)
  {
    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 144);
    if (v2
      && (objc_msgSend(v2, "isEqualToString:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "requestedSettings"), "captureRequestIdentifier")) & 1) == 0)
    {
      v17 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      -[BWUBNode _resetProcessingState](*(_QWORD *)(a1 + 32));
    }
    v4 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v4 + 144))
    {
      v5 = 0;
    }
    else
    {
      if ((objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "captureSettings"), "captureFlags") & 0x200) != 0)
      {
        os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 536));
        *(_BYTE *)(*(_QWORD *)(a1 + 32) + 540) = 0;
        os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 536));
      }
      v6 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "requestedSettings", v12, v13), "isBeginMomentCaptureSettings");
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(void **)(a1 + 40);
      if (v6)
        v9 = -[BWUBNode _setupProcessingStateIfNeededWithBeginMomentSettings:](v7, v8);
      else
        v9 = -[BWUBNode _setupProcessingStateWithSettings:](v7, v8);
      v5 = v9;
      v4 = *(_QWORD *)(a1 + 32);
      if (v5 == -16808)
      {
        -[BWUBNode _resetProcessingState](v4);
        v4 = *(_QWORD *)(a1 + 32);
        v5 = -16808;
      }
    }
    v10 = *(NSObject **)(v4 + 176);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __57__BWUBNode_handleStillImagePrewarmWithSettings_forInput___block_invoke_62;
    v14[3] = &unk_1E491EEF8;
    v15 = v5;
    v11 = *(_QWORD *)(a1 + 40);
    v14[4] = v4;
    v14[5] = v11;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __ubn_dispatch_async_block_invoke;
    block[3] = &unk_1E491ECB8;
    block[4] = v14;
    dispatch_async(v10, block);
  }
}

- (uint64_t)_setupProcessingStateIfNeededWithBeginMomentSettings:(uint64_t)result
{
  uint64_t v3;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v5;

  if (result)
  {
    v3 = result;
    if (!_FigIsCurrentDispatchQueue())
      FigDebugAssert3();
    if (*(_QWORD *)(v3 + 152)
      && (objc_msgSend((id)objc_msgSend(a2, "requestedSettings"), "isBeginMomentCaptureSettings") & 1) != 0
      && (objc_msgSend((id)v3, "processingOnBeginMomentSupportedForCaptureSettings:", objc_msgSend(a2, "captureSettings")) & 1) != 0)
    {
      if ((objc_msgSend(*(id *)(v3 + 144), "isEqualToString:", objc_msgSend((id)objc_msgSend(a2, "requestedSettings"), "captureRequestIdentifier")) & 1) == 0)
      {
        if (dword_1ECFE9AF0)
        {
          os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        -[BWUBNode _resetProcessingState](v3);
        *(_QWORD *)(v3 + 136) = objc_msgSend(a2, "settingsID");
        *(_QWORD *)(v3 + 144) = (id)objc_msgSend((id)objc_msgSend(a2, "requestedSettings"), "captureRequestIdentifier");
        -[BWUBNode _flushBufferPoolsWhenPossibleWithSettings:](v3, a2);
        -[BWUBNode _prepareSharedExternalMemoryResourceForProcessorControllersIfNeeded](v3);
      }
      return 0;
    }
    else
    {
      v5 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      return 4294950488;
    }
  }
  return result;
}

void __57__BWUBNode_handleStillImagePrewarmWithSettings_forInput___block_invoke_62(uint64_t a1)
{
  id v2;

  if (*(_DWORD *)(a1 + 48) == -16808)
  {
    v2 = +[BWNodeError newError:sourceNode:stillImageSettings:metadata:](BWNodeError, "newError:sourceNode:stillImageSettings:metadata:", 4294950488, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "emitNodeError:", v2);

  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "emitStillImagePrewarmMessageWithSettings:", *(_QWORD *)(a1 + 40));
  }
}

- (__CVBuffer)processorController:(id)a3 newOutputPixelBufferForProcessorInput:(id)a4 type:(unint64_t)a5
{
  return -[BWUBNode processorController:newOutputPixelBufferForProcessorInput:type:dimensions:](self, "processorController:newOutputPixelBufferForProcessorInput:type:dimensions:", a3, a4, a5, 0);
}

- (__CVBuffer)processorController:(id)a3 newOutputPixelBufferForProcessorInput:(id)a4 type:(unint64_t)a5 dimensions:(id)a6
{
  return (__CVBuffer *)-[BWUBNode processorController:newOutputPixelBufferForProcessorInput:type:dimensions:attachedMediaKey:]((uint64_t)self, a3, (uint64_t)a4, a5);
}

- (uint64_t)processorController:(uint64_t)a3 newOutputPixelBufferForProcessorInput:(uint64_t)a4 type:dimensions:attachedMediaKey:
{
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  if (!a1)
    return 0;
  mach_absolute_time();
  v7 = 0;
  switch(objc_msgSend(a2, "type"))
  {
    case 1:
    case 6:
      v7 = 0;
      switch(a4)
      {
        case 1:
        case 2:
        case 3:
        case 4:
        case 5:
        case 6:
        case 7:
        case 14:
          goto LABEL_6;
        case 8:
        case 10:
          v11 = 288;
          goto LABEL_22;
        case 9:
        case 11:
        case 12:
          v11 = 296;
          goto LABEL_22;
        case 15:
          goto LABEL_9;
        case 19:
          goto LABEL_16;
        case 21:
          goto LABEL_15;
        default:
          goto LABEL_24;
      }
      break;
    case 2:
      v7 = 0;
      switch(a4)
      {
        case 13:
LABEL_6:
          v10 = *(void **)(a1 + 200);
          if (!v10)
            goto LABEL_13;
          goto LABEL_19;
        case 15:
LABEL_9:
          v11 = 336;
LABEL_22:
          v10 = *(void **)(a1 + v11);
          if (!v10)
            goto LABEL_23;
          goto LABEL_19;
        case 19:
          goto LABEL_16;
        case 21:
          goto LABEL_15;
        default:
          goto LABEL_24;
      }
      break;
    case 7:
      if (a4 == 21)
      {
LABEL_15:
        v8 = *(void **)(a1 + 16);
        v9 = CFSTR("DemosaicedRaw");
        goto LABEL_17;
      }
      if (a4 == 19)
      {
LABEL_16:
        v8 = *(void **)(a1 + 16);
        v9 = CFSTR("GainMap");
        goto LABEL_17;
      }
      if (a4 != 1)
        goto LABEL_23;
LABEL_13:
      v12 = (void *)objc_msgSend(*(id *)(a1 + 16), "primaryMediaProperties");
      goto LABEL_18;
    case 8:
    case 9:
    case 13:
      if (a4 == 2001)
      {
        v8 = *(void **)(a1 + 16);
        v9 = CFSTR("Depth");
LABEL_17:
        v12 = (void *)objc_msgSend(v8, "mediaPropertiesForAttachedMediaKey:", v9);
LABEL_18:
        v10 = (void *)objc_msgSend(v12, "livePixelBufferPool");
        if (v10)
          goto LABEL_19;
      }
LABEL_23:
      v7 = 0;
      break;
    case 10:
      v10 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "primaryMediaProperties"), "livePixelBufferPool");
LABEL_19:
      v7 = objc_msgSend(v10, "newPixelBuffer");
      break;
    default:
      break;
  }
LABEL_24:
  mach_absolute_time();
  FigHostTimeToNanoseconds();
  if (v7 && dword_1ECFE9AF0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v7;
}

- (__CVBuffer)processorController:(id)a3 newOutputPixelBufferForProcessorInput:(id)a4 type:(unint64_t)a5 attachedMediaKey:(id)a6
{
  return (__CVBuffer *)-[BWUBNode processorController:newOutputPixelBufferForProcessorInput:type:dimensions:attachedMediaKey:]((uint64_t)self, a3, (uint64_t)a4, a5);
}

- (void)processorController:(id)a3 didFinishProcessingSampleBuffer:(opaqueCMSampleBuffer *)a4 type:(unint64_t)a5 processorInput:(id)a6 err:(int)a7
{
  uint64_t v7;
  uint64_t v8;
  BWUBNode *v13;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  const void *v15;
  const void *AttachedMedia;
  const void *v17;
  const void *v18;
  void *v19;
  const void *v20;
  id v21;
  void *v22;
  void *v23;
  _BOOL4 v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  NSObject *v36;
  unsigned int v37;
  unsigned int v38;
  uint64_t v39;
  NSObject *processorCoordinatorWorkerQueue;
  _QWORD *v41;
  uint64_t v42;
  const void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  int *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  _QWORD v56[5];
  _QWORD v57[5];
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _QWORD v62[6];
  CMTime v63;
  CMTime v64;
  os_log_type_t type;
  unsigned int v66;
  _BYTE v67[128];
  int v68;
  const char *v69;
  __int16 v70;
  uint64_t v71;
  __int16 v72;
  id v73;
  uint64_t block;
  uint64_t v75;
  void (*v76)(uint64_t);
  void *v77;
  _QWORD *v78;
  uint64_t v79;

  v8 = *(_QWORD *)&a7;
  v13 = self;
  v79 = *MEMORY[0x1E0C80C00];
  if (dword_1ECFE9AF0)
  {
    v66 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    v13 = self;
  }
  v54 = a6;
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(a6, "settings", v47, v50), "captureRequestIdentifier"), "isEqualToString:", v13->_currentCaptureRequestIdentifier);
  if (!(_DWORD)v8
    && -[BWStillImageNodeConfiguration deferredPhotoProcessorEnabled](v13->_nodeConfiguration, "deferredPhotoProcessorEnabled")&& (objc_msgSend(a3, "type") == 2 || objc_msgSend(a3, "type") == 6))
  {
    v15 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend((id)CMGetAttachment(a4, CFSTR("StillImageProcessingFlags"), 0), "unsignedIntValue") | 0x2000);
    CMSetAttachment(a4, CFSTR("StillImageProcessingFlags"), v15, 1u);
    AttachedMedia = (const void *)BWSampleBufferGetAttachedMedia(a4, 0x1E495B0F8);
    if (AttachedMedia)
    {
      v17 = AttachedMedia;
      v18 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend((id)CMGetAttachment(AttachedMedia, CFSTR("StillImageProcessingFlags"), 0), "unsignedIntValue") | 0x2000);
      CMSetAttachment(v17, CFSTR("StillImageProcessingFlags"), v18, 1u);
    }
  }
  switch(objc_msgSend(a3, "type"))
  {
    case 1:
    case 6:
      if (!_FigIsCurrentDispatchQueue())
      {
        v51 = v7;
        LODWORD(v48) = 0;
        FigDebugAssert3();
      }
      if (a5 == 7 && !(_DWORD)v8)
      {
        if ((int)-[BWUBNodeConfiguration deepZoomVersion]((uint64_t)v13->_nodeConfiguration) >= 1
          && +[BWDeepZoomProcessorControllerConfiguration doDeepZoomStandardOrLiteForSampleBuffer:type:sensorConfiguration:intermediateZoomSrcRectOut:intermediateZoomDstRectOut:](BWDeepZoomProcessorControllerConfiguration, "doDeepZoomStandardOrLiteForSampleBuffer:type:sensorConfiguration:intermediateZoomSrcRectOut:intermediateZoomDstRectOut:", a4, 1, objc_msgSend((id)-[BWUBNodeConfiguration sensorConfigurationsByPortType]((uint64_t)v13->_nodeConfiguration), "objectForKeyedSubscript:", objc_msgSend(a6, "portType")), 0, 0))
        {
          -[BWDeferredPipelineParameters setDeepZoomVersion:](-[BWDeferredCaptureControllerInput pipelineParameters](v13->_deferredCaptureControllerInput, "pipelineParameters"), "setDeepZoomVersion:", -[BWUBNodeConfiguration deepZoomVersion]((uint64_t)v13->_nodeConfiguration));
        }
        v19 = (void *)objc_msgSend((id)CMGetAttachment(a4, CFSTR("PhotoManifest"), 0), "descriptorForSampleBuffer:", a4);
        CMSampleBufferGetPresentationTimeStamp(&v64, a4);
        v63 = v64;
        objc_msgSend(v19, "setPresentationTimeStamp:", &v63);
        objc_msgSend(v19, "setTime:", objc_msgSend(MEMORY[0x1E0C99D68], "now"));
        objc_msgSend(v19, "setTimeZone:", objc_msgSend(MEMORY[0x1E0C99E80], "systemTimeZone"));
        -[BWDeferredCaptureControllerInput addPhotoDescriptor:](v13->_deferredCaptureControllerInput, "addPhotoDescriptor:", v19);
        if (objc_msgSend((id)objc_msgSend(v54, "processingSettings"), "provideDemosaicedRaw"))
        {
          v20 = (const void *)BWSampleBufferGetAttachedMedia(a4, 0x1E495B0F8);
          v21 = (id)CMGetAttachment(v20, CFSTR("RawDNGDictionary"), 0);
          v22 = (void *)objc_msgSend(v54, "settings");
          if (v21)
          {
            v23 = (void *)BWCreateDNGDictionaryWithUpdatedDimensionsIfNeeded(v21, objc_msgSend(v22, "deferredPhotoProxyWidth") | (unint64_t)(objc_msgSend(v22, "deferredPhotoProxyHeight") << 32), objc_msgSend(v22, "deferredPhotoFinalWidth") | (unint64_t)(objc_msgSend(v22, "deferredPhotoFinalHeight") << 32));
            if (v23)
              v21 = v23;
            -[BWDeferredCaptureControllerInput addDictionary:tag:](v13->_deferredCaptureControllerInput, "addDictionary:tag:", v21, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), BWDeferredIntermediateTagDNGDictionaryPrefix, objc_msgSend(v54, "portType", v48, v51)));
          }
          else if (!objc_msgSend(v22, "outputFormat"))
          {
            -[BWDeferredCaptureControllerInput encounteredProcessingError:](v13->_deferredCaptureControllerInput, "encounteredProcessingError:", 0);
            v43 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend((id)CMGetAttachment(a4, CFSTR("StillImageProcessingFlags"), 0), "unsignedIntValue") ^ 0x1000);
            CMSetAttachment(a4, CFSTR("StillImageProcessingFlags"), v43, 1u);
          }
        }
      }
      break;
    case 2:
      if (_FigIsCurrentDispatchQueue())
      {
        if ((_DWORD)v8)
          break;
      }
      else
      {
        v51 = v7;
        LODWORD(v48) = 0;
        FigDebugAssert3();
        if ((_DWORD)v8)
          break;
      }
      v24 = -[BWUBNodeConfiguration deepFusionSupportEnabled]((_BOOL8)v13->_nodeConfiguration);
      if (a5 != 15 && v24)
      {
        v25 = objc_msgSend(a6, "portType");
        v62[0] = MEMORY[0x1E0C809B0];
        v62[1] = 3221225472;
        v62[2] = __88__BWUBNode_processorController_didFinishProcessingSampleBuffer_type_processorInput_err___block_invoke;
        v62[3] = &unk_1E491E748;
        v62[4] = v13;
        v62[5] = v25;
        -[BWUBNode _deepFusionDispatch:direction:block:]((uint64_t)v13, 2, 3, (uint64_t)v62);
      }
      break;
    case 5:
      if (!_FigIsCurrentDispatchQueue())
      {
        v51 = v7;
        LODWORD(v48) = 0;
        FigDebugAssert3();
      }
      break;
    default:
      break;
  }
  v26 = (void *)objc_msgSend(v54, "outputSampleBufferRouterForBufferType:", a5, v48, v51);
  if (!objc_msgSend(v26, "outputSampleBufferRouter"))
  {
    v45 = (void *)MEMORY[0x1E0CB3940];
    v46 = BWStillImageProcessorTypeToShortString(objc_msgSend(a3, "type"));
    v44 = objc_msgSend(v45, "stringWithFormat:", CFSTR("No output router for output sample buffer of %@ (buffer type: %@, err: %d)"), v46, BWStillImageProcessorTypeToShortString(a5), v8);
LABEL_56:
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], v44, 0));
  }
  v27 = (void *)MEMORY[0x1A858DD40]();
  v28 = objc_msgSend(v26, "outputSampleBufferRouter");
  (*(void (**)(uint64_t, opaqueCMSampleBuffer *, unint64_t, id, uint64_t))(v28 + 16))(v28, a4, a5, v54, v8);
  objc_autoreleasePoolPop(v27);
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v29 = (void *)objc_msgSend(v26, "bypassedProcessorsTypes");
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v58, v67, 16);
  if (v30)
  {
    v31 = v30;
    v32 = MEMORY[0x1E0C809B0];
    v33 = *(_QWORD *)v59;
    do
    {
      v34 = 0;
      do
      {
        if (*(_QWORD *)v59 != v33)
          objc_enumerationMutation(v29);
        v35 = (int)objc_msgSend(*(id *)(*((_QWORD *)&v58 + 1) + 8 * v34), "intValue", v49, v52);
        if (dword_1ECFE9AF0)
        {
          v66 = 0;
          type = OS_LOG_TYPE_DEFAULT;
          v36 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          v37 = v66;
          if (os_log_type_enabled(v36, type))
            v38 = v37;
          else
            v38 = v37 & 0xFFFFFFFE;
          if (v38)
          {
            v39 = BWStillImageProcessorTypeToShortString(v35);
            v68 = 136315650;
            v69 = "-[BWUBNode processorController:didFinishProcessingSampleBuffer:type:processorInput:err:]";
            v70 = 2112;
            v71 = v39;
            v72 = 2112;
            v73 = v54;
            LODWORD(v52) = 32;
            v49 = &v68;
            _os_log_send_and_compose_impl();
          }
          fig_log_call_emit_and_clean_up_after_send_and_compose();
          v13 = self;
        }
        if (v35 <= 0x13)
        {
          if (v35 == 7)
          {
            processorCoordinatorWorkerQueue = v13->_processorCoordinatorWorkerQueue;
            v57[0] = v32;
            v57[1] = 3221225472;
            v57[2] = __88__BWUBNode_processorController_didFinishProcessingSampleBuffer_type_processorInput_err___block_invoke_73;
            v57[3] = &unk_1E491E720;
            v57[4] = v13;
            block = v32;
            v75 = 3221225472;
            v76 = __ubn_dispatch_async_block_invoke;
            v77 = &unk_1E491ECB8;
            v41 = v57;
            goto LABEL_47;
          }
          if (v35 == 10)
          {
            processorCoordinatorWorkerQueue = v13->_processorCoordinatorWorkerQueue;
            v56[0] = v32;
            v56[1] = 3221225472;
            v56[2] = __88__BWUBNode_processorController_didFinishProcessingSampleBuffer_type_processorInput_err___block_invoke_2;
            v56[3] = &unk_1E491E720;
            v56[4] = v13;
            block = v32;
            v75 = 3221225472;
            v76 = __ubn_dispatch_async_block_invoke;
            v77 = &unk_1E491ECB8;
            v41 = v56;
LABEL_47:
            v78 = v41;
            dispatch_async(processorCoordinatorWorkerQueue, &block);
            goto LABEL_48;
          }
          if (((1 << v35) & 0xFFB7E) != 0)
          {
            v44 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Processor bypassing support has not been implemented for %@"), BWStillImageProcessorTypeToShortString(v35), v52, v53);
            goto LABEL_56;
          }
        }
LABEL_48:
        ++v34;
      }
      while (v31 != v34);
      v42 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v58, v67, 16);
      v31 = v42;
    }
    while (v42);
  }
}

void __88__BWUBNode_processorController_didFinishProcessingSampleBuffer_type_processorInput_err___block_invoke(uint64_t a1)
{
  -[BWUBNode _processorControllerDidFinishProcessingInputForPortType:processorType:](*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 208));
}

- (void)_processorControllerDidFinishProcessingInputForPortType:(uint64_t)a3 processorType:
{
  void *v6;
  void *v7;
  int v8;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v10;
  int v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;

  if (a1)
  {
    if (!_FigIsCurrentDispatchQueue())
      FigDebugAssert3();
    switch(a3)
    {
      case 1:
      case 6:
        v6 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 224), "objectForKeyedSubscript:", a2), "firstObject");
        if (v6)
        {
          v7 = v6;
          v8 = objc_msgSend(v6, "remainingProcessingCount");
          if (v8 > 1)
          {
            objc_msgSend(v7, "setRemainingProcessingCount:", (v8 - 1));
          }
          else
          {
            objc_msgSend(v7, "setRemainingProcessingCount:", 0);
            objc_msgSend((id)objc_msgSend(*(id *)(a1 + 224), "objectForKeyedSubscript:", a2), "removeObject:", v7);
            if (!objc_msgSend((id)objc_msgSend(*(id *)(a1 + 224), "objectForKeyedSubscript:", a2), "count"))
              objc_msgSend(*(id *)(a1 + 224), "setObject:forKeyedSubscript:", 0, a2);
            if (dword_1ECFE9AF0)
            {
              os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
              fig_log_call_emit_and_clean_up_after_send_and_compose();
            }
          }
        }
        return;
      case 2:
        v10 = 272;
        goto LABEL_23;
      case 3:
        v10 = 312;
        goto LABEL_23;
      case 4:
        v10 = 408;
        goto LABEL_23;
      case 5:
        v10 = 616;
        goto LABEL_23;
      case 7:
        if (!objc_msgSend(*(id *)(a1 + 432), "objectForKeyedSubscript:", a2))
          return;
        v11 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 432), "objectForKeyedSubscript:", a2), "intValue");
        if (v11 > 1)
        {
          v14 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v11 - 1));
          v13 = *(void **)(a1 + 432);
        }
        else
        {
          objc_msgSend(*(id *)(a1 + 424), "setObject:forKeyedSubscript:", 0, a2);
          v10 = 432;
LABEL_23:
          v13 = *(void **)(a1 + v10);
          v14 = 0;
        }
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, a2);
        break;
      case 8:
        --*(_DWORD *)(a1 + 496);

        v12 = 488;
        goto LABEL_26;
      case 9:
        v10 = 552;
        goto LABEL_23;
      case 10:
        v10 = 472;
        goto LABEL_23;
      case 11:
        v10 = 256;
        goto LABEL_23;
      case 13:
        v10 = 568;
        goto LABEL_23;
      case 14:

        v12 = 584;
LABEL_26:
        *(_QWORD *)(a1 + v12) = 0;
        break;
      default:
        return;
    }
  }
}

uint64_t __88__BWUBNode_processorController_didFinishProcessingSampleBuffer_type_processorInput_err___block_invoke_73(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "controllerForType:", 7), "cancelProcessing");
}

uint64_t __88__BWUBNode_processorController_didFinishProcessingSampleBuffer_type_processorInput_err___block_invoke_2(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "controllerForType:", 10), "cancelProcessing");
}

- (void)_removeNonPropagatedAttachedMediaFromSampleBuffer:(uint64_t)a1
{
  if (a1)
  {
    if (*(_QWORD *)(a1 + 480))
      BWSampleBufferRemoveAttachedMedia(a2, 0x1E495AED8);
    BWSampleBufferRemoveAttachedMedia(a2, 0x1E495B158);
    BWSampleBufferRemoveAttachedMedia(a2, 0x1E495B178);
  }
}

- (void)_releaseNodeResourcesIfNeededBeforeEmittingSampleBuffer:(uint64_t)a1
{
  uint64_t v2;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  if (a1)
  {
    if (!_FigIsNotCurrentDispatchQueue())
    {
      v7 = v2;
      LODWORD(v6) = 0;
      FigDebugAssert3();
    }
    if (objc_msgSend(*(id *)(a1 + 112), "deferredPhotoProcessorEnabled", v6, v7))
    {
      v5 = (void *)CMGetAttachment(a2, CFSTR("StillSettings"), 0);
      if (v5)
      {
        if ((objc_msgSend((id)objc_msgSend(v5, "captureSettings"), "captureFlags") & 0x100000000) != 0)
          -[BWUBNode _releaseResources](a1);
      }
    }
  }
}

void __42__BWUBNode__emitSampleBuffer_description___block_invoke(uint64_t a1)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  const void *v3;

  if (dword_1ECFE9AF0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  -[BWUBNode _releaseNodeResourcesIfNeededBeforeEmittingSampleBuffer:](*(_QWORD *)(a1 + 40), *(const void **)(a1 + 48));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "emitSampleBuffer:", *(_QWORD *)(a1 + 48));
  v3 = *(const void **)(a1 + 48);
  if (v3)
    CFRelease(v3);
}

- (void)_emitError:(uint64_t)a1 processorInput:(uint64_t)a2 metadata:(void *)a3 description:(uint64_t)a4
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[6];
  os_log_type_t type;
  int v15;
  _QWORD block[17];

  block[16] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (dword_1ECFE9AF0)
    {
      v15 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v9 = +[BWNodeError newError:sourceNode:stillImageSettings:metadata:](BWNodeError, "newError:sourceNode:stillImageSettings:metadata:", a2, a1, objc_msgSend(a3, "stillImageSettings", v11, v12), a4);
    v10 = *(NSObject **)(a1 + 176);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __59__BWUBNode__emitError_processorInput_metadata_description___block_invoke;
    v13[3] = &unk_1E491E748;
    v13[4] = a1;
    v13[5] = v9;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __ubn_dispatch_async_block_invoke;
    block[3] = &unk_1E491ECB8;
    block[4] = v13;
    dispatch_async(v10, block);
  }
}

void __59__BWUBNode__emitError_processorInput_metadata_description___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "emitNodeError:", *(_QWORD *)(a1 + 40));

}

- (void)processorController:(id)a3 didFinishProcessingInput:(id)a4 err:(int)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  BWUBNode *v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  NSObject *processorCoordinatorWorkerQueue;
  _QWORD *v18;
  _QWORD *v19;
  BWUBNode *v20;
  int v21;
  int v22;
  NSObject *inferenceControllerQueue;
  int v24;
  const __CFString *v25;
  opaqueCMSampleBuffer *deferredCaptureProxyOrErrorRecoverySbuf;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD v30[7];
  _QWORD v31[7];
  _QWORD v32[9];
  int v33;
  _QWORD v34[7];
  _QWORD v35[7];
  _QWORD v36[8];
  int v37;
  _QWORD v38[5];
  uint64_t block;
  uint64_t v40;
  void (*v41)(uint64_t);
  void *v42;
  _QWORD *v43;

  v6 = *(_QWORD *)&a5;
  v10 = objc_msgSend(a4, "portType");
  v11 = objc_msgSend(a3, "type");
  v12 = (void *)objc_msgSend(a4, "stillImageSettings");
  switch(v11)
  {
    case 1:
    case 6:
    case 11:
      if (!_FigIsCurrentDispatchQueue())
        FigDebugAssert3();
      -[BWUBNode _processorControllerDidFinishProcessingInputForPortType:processorType:]((uint64_t)self, v10, v11);
      v16 = objc_msgSend((id)objc_msgSend(a4, "captureSettings"), "captureType");
      if ((_DWORD)v6 && v16 == 12)
      {
        if (objc_msgSend((id)objc_msgSend(a4, "captureSettings"), "deliverDeferredPhotoProxyImage"))
        {
          -[BWDeferredCaptureControllerInput encounteredProcessingError:](self->_deferredCaptureControllerInput, "encounteredProcessingError:", v6);
        }
        else if (self->_deepFusionProcessorControllerConfiguration)
        {
          v38[0] = MEMORY[0x1E0C809B0];
          v38[1] = 3221225472;
          v38[2] = __61__BWUBNode_processorController_didFinishProcessingInput_err___block_invoke;
          v38[3] = &unk_1E491E720;
          v38[4] = self;
          v19 = v38;
          v20 = self;
          v21 = 1;
          v22 = 1;
          goto LABEL_35;
        }
      }
      return;
    case 2:
      if (!_FigIsCurrentDispatchQueue())
        FigDebugAssert3();
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __61__BWUBNode_processorController_didFinishProcessingInput_err___block_invoke_2;
      v36[3] = &unk_1E4922600;
      v37 = v6;
      v36[4] = self;
      v36[5] = a4;
      v36[6] = v10;
      v36[7] = 2;
      v19 = v36;
      v20 = self;
      v21 = 2;
      v22 = 3;
LABEL_35:
      -[BWUBNode _deepFusionDispatch:direction:block:]((uint64_t)v20, v21, v22, (uint64_t)v19);
      return;
    case 3:
      if (!_FigIsCurrentDispatchQueue())
        FigDebugAssert3();
      processorCoordinatorWorkerQueue = self->_processorCoordinatorWorkerQueue;
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __61__BWUBNode_processorController_didFinishProcessingInput_err___block_invoke_3;
      v35[3] = &unk_1E491EC68;
      v35[4] = self;
      v35[5] = v10;
      v35[6] = 3;
      block = MEMORY[0x1E0C809B0];
      v40 = 3221225472;
      v41 = __ubn_dispatch_async_block_invoke;
      v42 = &unk_1E491ECB8;
      v18 = v35;
      goto LABEL_27;
    case 4:
    case 7:
    case 10:
    case 12:
    case 15:
    case 16:
    case 17:
      if (!_FigIsCurrentDispatchQueue())
        FigDebugAssert3();
      v13 = self;
      v14 = v10;
      v15 = v11;
      goto LABEL_5;
    case 5:
      if (!_FigIsCurrentDispatchQueue())
        FigDebugAssert3();
      processorCoordinatorWorkerQueue = self->_processorCoordinatorWorkerQueue;
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __61__BWUBNode_processorController_didFinishProcessingInput_err___block_invoke_5;
      v32[3] = &unk_1E4923348;
      v33 = v6;
      v32[4] = self;
      v32[5] = a4;
      v32[7] = v12;
      v32[8] = 5;
      v32[6] = v10;
      block = MEMORY[0x1E0C809B0];
      v40 = 3221225472;
      v41 = __ubn_dispatch_async_block_invoke;
      v42 = &unk_1E491ECB8;
      v18 = v32;
      goto LABEL_27;
    case 8:
      if (!_FigIsCurrentDispatchQueue())
        FigDebugAssert3();
      processorCoordinatorWorkerQueue = self->_processorCoordinatorWorkerQueue;
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __61__BWUBNode_processorController_didFinishProcessingInput_err___block_invoke_4;
      v34[3] = &unk_1E491EC68;
      v34[4] = self;
      v34[5] = v10;
      v34[6] = 8;
      block = MEMORY[0x1E0C809B0];
      v40 = 3221225472;
      v41 = __ubn_dispatch_async_block_invoke;
      v42 = &unk_1E491ECB8;
      v18 = v34;
      goto LABEL_27;
    case 9:
    case 13:
      if (!_FigIsCurrentDispatchQueue())
        FigDebugAssert3();
      processorCoordinatorWorkerQueue = self->_processorCoordinatorWorkerQueue;
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __61__BWUBNode_processorController_didFinishProcessingInput_err___block_invoke_7;
      v31[3] = &unk_1E491EC68;
      v31[4] = self;
      v31[5] = v10;
      v31[6] = v11;
      block = MEMORY[0x1E0C809B0];
      v40 = 3221225472;
      v41 = __ubn_dispatch_async_block_invoke;
      v42 = &unk_1E491ECB8;
      v18 = v31;
LABEL_27:
      v43 = v18;
      dispatch_async(processorCoordinatorWorkerQueue, &block);
      return;
    case 14:
      if (!_FigIsCurrentDispatchQueue())
      {
        v29 = v5;
        LODWORD(v28) = 0;
        FigDebugAssert3();
      }
      if ((_DWORD)v6)
      {
        if (!self->_deferredCaptureProxyOrErrorRecoverySbuf)
        {
          objc_msgSend(a4, "description");
          -[BWUBNode _emitError:processorInput:metadata:description:]((uint64_t)self, v6, a4, 0);
          return;
        }
      }
      else if (-[BWUBNode _waitForInferenceIfNeededForProcessorInput:]((uint64_t)self, a4)
             && self->_inferenceOutputSampleBuffer)
      {
        inferenceControllerQueue = self->_inferenceControllerQueue;
        v30[0] = MEMORY[0x1E0C809B0];
        v30[1] = 3221225472;
        v30[2] = __61__BWUBNode_processorController_didFinishProcessingInput_err___block_invoke_8;
        v30[3] = &unk_1E491EB90;
        v30[4] = self;
        v30[5] = v12;
        v30[6] = a4;
        dispatch_sync(inferenceControllerQueue, v30);
      }
      v24 = objc_msgSend((id)CMGetAttachment(self->_deferredCaptureProxyOrErrorRecoverySbuf, CFSTR("StillImageProcessingFlags"), 0), "unsignedIntValue");
      if ((_DWORD)v6)
      {
        if ((v24 & 0x1000) != 0)
          CMSetAttachment(self->_deferredCaptureProxyOrErrorRecoverySbuf, CFSTR("StillImageProcessingFlags"), (CFTypeRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v24 & 0xFFFFAFFF | 0x4000), 1u);
        v25 = CFSTR("error recovery");
      }
      else
      {
        v25 = CFSTR("proxy");
      }
      deferredCaptureProxyOrErrorRecoverySbuf = self->_deferredCaptureProxyOrErrorRecoverySbuf;
      v27 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), BWPhotoEncoderStringFromEncodingScheme(objc_msgSend((id)objc_msgSend(v12, "captureSettings", v28, v29), "captureType")), v25);
      -[BWUBNode _emitSampleBuffer:description:]((uint64_t)self, deferredCaptureProxyOrErrorRecoverySbuf, v27);
      v13 = self;
      v14 = v10;
      v15 = 14;
LABEL_5:
      -[BWUBNode _processorControllerDidFinishProcessingInputForPortType:processorType:]((uint64_t)v13, v14, v15);
      -[BWUBNode _resetProcessingStateIfDone]((uint64_t)self);
      return;
    default:
      return;
  }
}

uint64_t __61__BWUBNode_processorController_didFinishProcessingInput_err___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "controllerForType:", 2), "cancelProcessing");
}

void __61__BWUBNode_processorController_didFinishProcessingInput_err___block_invoke_2(uint64_t a1)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  if (*(_DWORD *)(a1 + 64))
  {
    v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "deferredPhotoProcessorEnabled");
    v3 = *(unsigned int *)(a1 + 64);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(a1 + 40);
    if (v2)
      -[BWUBNode _emitError:processorInput:metadata:description:](v4, v3, v5, 0);
    else
      -[BWUBNode _handleDeepFusionError:processorInput:](v4, v3, v5);
  }
  -[BWUBNode _processorControllerDidFinishProcessingInputForPortType:processorType:](*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  -[BWUBNode _resetProcessingStateIfDone](*(_QWORD *)(a1 + 32));
}

- (void)_handleDeepFusionError:(void *)a3 processorInput:
{
  uint64_t v3;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[5];
  void *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (!_FigIsCurrentDispatchQueue())
    {
      v18 = v3;
      LODWORD(v17) = 0;
      FigDebugAssert3();
    }
    v19 = a2;
    v7 = (id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 224), "objectForKeyedSubscript:", objc_msgSend(a3, "portType", v17, v18)), "firstObject");
    if (!v7)
    {
      v7 = (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithSettings:portType:", objc_msgSend(a3, "stillImageSettings"), objc_msgSend(a3, "portType"));
      if (-[BWUBNode _isInferenceInputImageRequiredForSettings:](a1, (void *)objc_msgSend(a3, "stillImageSettings")))
      {
        v24[0] = MEMORY[0x1E0C809B0];
        v24[1] = 3221225472;
        v24[2] = __35__BWUBNode__ubInferenceInputRouter__block_invoke;
        v24[3] = &unk_1E4923398;
        v24[4] = a1;
        objc_msgSend(v7, "addOutputSampleBufferRouter:forBufferTypes:", (id)objc_msgSend(v24, "copy"), &unk_1E4A00CE0);
      }
      objc_msgSend(*(id *)(a1 + 224), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v7), objc_msgSend(a3, "portType"));
    }
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v8 = -[BWUBNode _bufferTypesForCaptureSettings:](a1, (void *)objc_msgSend(a3, "captureSettings"));
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v21 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          v14 = objc_msgSend((id)objc_msgSend(a3, "outputSampleBufferRouterForBufferType:", (int)objc_msgSend(v13, "intValue")), "outputSampleBufferRouter");
          v25 = v13;
          objc_msgSend(v7, "addOutputSampleBufferRouter:forBufferTypes:", v14, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1));
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
      }
      while (v10);
    }
    v15 = v19;
    if (v19 && v7)
    {
      objc_msgSend(v7, "setRemainingProcessingCount:", objc_msgSend(v7, "remainingProcessingCount") + 1);
      v16 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 152), "controllerForType:", *(_QWORD *)(a1 + 208)), "enqueueInputForProcessing:delegate:processErrorRecoveryFrame:processOriginalImage:processToneMapping:processInferenceInputImage:clientBracketSequenceNumber:processSemanticRendering:provideInferenceInputImageForProcessing:processSmartStyleRenderingInput:inferencesAvailable:", v7, a1, 1, 0, 0, 0, 0);
      if (!(_DWORD)v16)
        return;
      v15 = v16;
      -[BWUBNode _processorControllerDidFinishProcessingInputForPortType:processorType:](a1, objc_msgSend(v7, "portType"), *(_QWORD *)(a1 + 208));
    }
    else if (!v19)
    {
      return;
    }
    objc_msgSend(a3, "description");
    -[BWUBNode _emitError:processorInput:metadata:description:](a1, v15, a3, 0);
  }
}

void __61__BWUBNode_processorController_didFinishProcessingInput_err___block_invoke_3(uint64_t *a1)
{
  -[BWUBNode _processorControllerDidFinishProcessingInputForPortType:processorType:](a1[4], a1[5], a1[6]);
}

void __61__BWUBNode_processorController_didFinishProcessingInput_err___block_invoke_4(uint64_t *a1)
{
  -[BWUBNode _processorControllerDidFinishProcessingInputForPortType:processorType:](a1[4], a1[5], a1[6]);
  -[BWUBNode _resetProcessingStateIfDone](a1[4]);
}

void __61__BWUBNode_processorController_didFinishProcessingInput_err___block_invoke_5(uint64_t a1)
{
  int v2;
  uint64_t v3;
  _QWORD v4[4];
  __int128 v5;

  v2 = *(_DWORD *)(a1 + 72);
  v3 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    -[BWUBNode _resetProcessingState](v3);
    -[BWUBNode _emitError:processorInput:metadata:description:](*(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 72), *(void **)(a1 + 40), 0);
  }
  else
  {
    -[BWUBNode _processorControllerDidFinishProcessingInputForPortType:processorType:](v3, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
    if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 56), "captureSettings"), "captureType") == 12)
    {
      v4[0] = MEMORY[0x1E0C809B0];
      v4[1] = 3221225472;
      v4[2] = __61__BWUBNode_processorController_didFinishProcessingInput_err___block_invoke_6;
      v4[3] = &unk_1E491E748;
      v5 = *(_OWORD *)(a1 + 32);
      -[BWUBNode _deepFusionDispatch:direction:block:](v5, 2, 2, (uint64_t)v4);
    }
    -[BWUBNode _resetProcessingStateIfDone](*(_QWORD *)(a1 + 32));
  }
}

uint64_t __61__BWUBNode_processorController_didFinishProcessingInput_err___block_invoke_6(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 272), "objectForKeyedSubscript:", objc_msgSend(*(id *)(a1 + 40), "portType")), "allInferencesDelivered");
}

void __61__BWUBNode_processorController_didFinishProcessingInput_err___block_invoke_7(uint64_t *a1)
{
  -[BWUBNode _processorControllerDidFinishProcessingInputForPortType:processorType:](a1[4], a1[5], a1[6]);
  -[BWUBNode _resetProcessingStateIfDone](a1[4]);
}

- (uint64_t)_waitForInferenceIfNeededForProcessorInput:(uint64_t)result
{
  uint64_t v3;
  int v4;
  int v5;
  NSObject *v6;
  int v7;
  BOOL v8;

  if (result)
  {
    v3 = result;
    v4 = -[BWUBNode _isSemanticRenderingCapture:](result, (void *)objc_msgSend(a2, "stillImageSettings"));
    v5 = -[BWUBNode _provideInferenceAttachedMediaWithSettings:](v3, (void *)objc_msgSend(a2, "stillImageSettings"));
    v6 = *(NSObject **)(v3 + 328);
    v7 = v4 | v5;
    if (v6)
      v8 = v7 == 0;
    else
      v8 = 1;
    if (v8)
    {
      return 0;
    }
    else
    {
      dispatch_group_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
      return 1;
    }
  }
  return result;
}

uint64_t __61__BWUBNode_processorController_didFinishProcessingInput_err___block_invoke_8(uint64_t a1)
{
  uint64_t *v2;
  uint64_t result;
  const void *AttachedMedia;
  const __CFString **v5;
  const void *v6;
  uint64_t v7;
  uint64_t v8;
  const __CFString *v9;
  uint64_t v10;
  uint64_t v11;
  const void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  ubn_mergeInferenceMetadata(*(const void **)(*(_QWORD *)(a1 + 32) + 360), *(const void **)(*(_QWORD *)(a1 + 32) + 592), *(const void **)(*(_QWORD *)(a1 + 32) + 592));
  v2 = -[BWUBNode _inferenceAttachedMediaRequiredForDemosaicedRawCaptureWithInferenceOutputSampleBuffer:stillImageSettings:](*(uint64_t **)(a1 + 32), *(const void **)(*(_QWORD *)(a1 + 32) + 360), *(void **)(a1 + 40));
  result = objc_msgSend(v2, "count");
  if (result)
  {
    ubn_mergeInferenceAttachedMedia(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 360), v2, *(const void **)(*(_QWORD *)(a1 + 32) + 592));
    v13 = *MEMORY[0x1E0C9D628];
    v14 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
    AttachedMedia = (const void *)BWSampleBufferGetAttachedMedia(*(const void **)(*(_QWORD *)(a1 + 32) + 592), 0x1E495B0F8);
    v5 = (const __CFString **)MEMORY[0x1E0D05CB0];
    if (AttachedMedia)
      CMGetAttachment(AttachedMedia, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
    result = FigCFDictionaryGetCGRectIfPresent();
    if ((_DWORD)result)
    {
      v6 = *(const void **)(*(_QWORD *)(a1 + 32) + 592);
      objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "captureSettings", v13, v14), "settingsID");
      v15 = 0u;
      v16 = 0u;
      v17 = 0u;
      v18 = 0u;
      result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (result)
      {
        v7 = result;
        v8 = *(_QWORD *)v16;
        v9 = *v5;
        do
        {
          v10 = 0;
          do
          {
            if (*(_QWORD *)v16 != v8)
              objc_enumerationMutation(v2);
            v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10);
            v12 = (const void *)BWSampleBufferGetAttachedMedia(v6, v11);
            if (v12)
            {
              CMGetAttachment(v12, v9, 0);
              if (FigCFDictionarySetCGRect())
                BWSampleBufferRemoveAttachedMedia(v6, v11);
            }
            ++v10;
          }
          while (v7 != v10);
          result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
          v7 = result;
        }
        while (result);
      }
    }
  }
  return result;
}

- (uint64_t)_inferenceAttachedMediaRequiredForDemosaicedRawCaptureWithInferenceOutputSampleBuffer:(void *)a3 stillImageSettings:
{
  uint64_t *v3;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v3 = a1;
  v19 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (objc_msgSend((id)objc_msgSend(a3, "processingSettings"), "provideDemosaicedRaw")
      && -[BWUBNode _isSemanticRenderingCapture:]((uint64_t)v3, a3)
      && -[BWUBNodeConfiguration inferenceMainImageDownscalingFactor](v3[14]) != 0.0
      && (v6 = (void *)objc_msgSend((id)-[BWUBNodeConfiguration providedInferenceAttachedMediaByMode](v3[14]), "objectForKeyedSubscript:", &unk_1E49FA2A8), objc_msgSend(v6, "count")))
    {
      v3 = (uint64_t *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v6);
      v14 = 0u;
      v15 = 0u;
      v16 = 0u;
      v17 = 0u;
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v15;
        do
        {
          v10 = 0;
          do
          {
            if (*(_QWORD *)v15 != v9)
              objc_enumerationMutation(v6);
            v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10);
            v12 = (void *)objc_msgSend((id)BWInferenceGetAttachedInference(a2, 201, 0x1E4951178), "objectForKeyedSubscript:", v11);
            if (v12 && (objc_msgSend(v12, "BOOLValue") & 1) == 0)
              objc_msgSend(v3, "removeObject:", v11);
            ++v10;
          }
          while (v8 != v10);
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        }
        while (v8);
      }
    }
    else
    {
      return 0;
    }
  }
  return v3;
}

- (void)processorController:(id)a3 willAddBuffer:(__CVBuffer *)a4 metadata:(id)a5 bufferType:(unint64_t)a6 processorInput:(id)a7
{
  CGSize v14;
  uint64_t v15;
  CGRect v16;
  CGRect v17;

  if (a5
    && a3
    && a4
    && a7
    && objc_msgSend(a3, "type") == 2
    && (int)-[BWUBNodeConfiguration deepZoomVersion]((uint64_t)self->_nodeConfiguration) >= 1
    && a6 <= 0x1B
    && ((1 << a6) & 0x9C00000) != 0)
  {
    v14 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    v17.origin = (CGPoint)*MEMORY[0x1E0C9D628];
    v17.size = v14;
    v16.origin = v17.origin;
    v16.size = v14;
    v15 = objc_msgSend((id)-[BWUBNodeConfiguration sensorConfigurationsByPortType]((uint64_t)self->_nodeConfiguration), "objectForKeyedSubscript:", objc_msgSend(a7, "portType"));
    if (+[BWDeepZoomProcessorControllerConfiguration doDeepZoomStandardOrLiteForType:sensorConfiguration:dimensions:metadata:stillImageSettings:intermediateZoomSrcRectOut:intermediateZoomDstRectOut:](BWDeepZoomProcessorControllerConfiguration, "doDeepZoomStandardOrLiteForType:sensorConfiguration:dimensions:metadata:stillImageSettings:intermediateZoomSrcRectOut:intermediateZoomDstRectOut:", 1, v15, psn_pixelBufferDimensions(a4), a5, objc_msgSend(a7, "stillImageSettings"), &v17, &v16))
    {
      if (!CGRectIsNull(v17) && !CGRectIsNull(v16))
      {
        FigCFDictionarySetCGRect();
        FigCFDictionarySetCGRect();
      }
    }
  }
}

- (void)processorController:(id)a3 didSelectNewReferenceFrameWithPTS:(id *)a4 transform:(id)a5 processorInput:(id)a6
{
  void *v10;
  uint64_t v11;
  __int128 v12;
  int64_t var3;

  if (objc_msgSend(a6, "isMaster", a3))
  {
    v10 = (void *)-[BWUBNodeConfiguration referenceFrameSelectionDelegate]((uint64_t)self->_nodeConfiguration);
    v11 = objc_msgSend(a6, "stillImageSettings");
    v12 = *(_OWORD *)&a4->var0;
    var3 = a4->var3;
    objc_msgSend(v10, "node:didSelectNewReferenceFrameWithPTS:transform:forSettings:", self, &v12, a5, v11);
  }
}

- (void)processorController:(id)a3 didSelectFusionMode:(int)a4 processorInput:(id)a5
{
  uint64_t v5;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v5 = *(_QWORD *)&a4;
  v18 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a5, "isMaster", a3))
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_nrfusionModeByCaptureRequestIdentifier, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v5), self->_currentCaptureRequestIdentifier);
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v7 = (void *)-[NSMutableDictionary allValues](self->_nrProcessorInputsByPortType, "allValues", 0);
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          objc_msgSend((id)objc_msgSend(v12, "firstObject"), "setFusionMode:", v5);
          -[BWUBNode _handleReferenceFrameEmissionForProcessorInput:]((uint64_t)self, (void *)objc_msgSend(v12, "firstObject"));
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v9);
    }
  }
}

- (id)processorController:(id)a3 newInferencesForProcessorInput:(id)a4
{
  return -[BWUBNode processorController:newInferencesForProcessorInput:inferenceInputBufferType:](self, "processorController:newInferencesForProcessorInput:inferenceInputBufferType:", a3, a4, 15);
}

- (id)processorController:(id)a3 newInferencesForProcessorInput:(id)a4 inferenceInputBufferType:(unint64_t)a5
{
  NSObject *inferenceControllerQueue;
  void *v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  uint64_t v14;
  _QWORD block[5];

  v9 = 0;
  v10 = &v9;
  v11 = 0x3052000000;
  v12 = __Block_byref_object_copy__24;
  v13 = __Block_byref_object_dispose__24;
  v14 = 0;
  if (a5 == 15)
  {
    inferenceControllerQueue = self->_inferenceControllerQueue;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __88__BWUBNode_processorController_newInferencesForProcessorInput_inferenceInputBufferType___block_invoke;
    v8[3] = &unk_1E491E9A8;
    v8[4] = self;
    v8[5] = &v9;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __ubn_dispatch_sync_block_invoke;
    block[3] = &unk_1E491ECB8;
    block[4] = v8;
    dispatch_sync(inferenceControllerQueue, block);
    v6 = (void *)v10[5];
  }
  else
  {
    v6 = 0;
  }
  _Block_object_dispose(&v9, 8);
  return v6;
}

id __88__BWUBNode_processorController_newInferencesForProcessorInput_inferenceInputBufferType___block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(a1 + 32) + 352);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)processorController:(id)a3 didSelectLowLightReferenceFrame:(opaqueCMSampleBuffer *)a4 processorInput:(id)a5
{
  uint64_t v5;
  void *v9;
  double v10;
  double v11;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  CMTime v17;
  CMTime time;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (!_FigIsCurrentDispatchQueue())
  {
    v16 = v5;
    LODWORD(v15) = 0;
    FigDebugAssert3();
  }
  v9 = (void *)CMGetAttachment(a4, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  memset(&v17, 0, sizeof(v17));
  CMTimeMakeFromDictionary(&v17, (CFDictionaryRef)objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D05D00]));
  objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D06A20]), "doubleValue");
  v11 = v10;
  if (dword_1ECFE9AF0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if ((objc_msgSend((id)objc_msgSend(a5, "captureSettings", v15, v16), "captureFlags") & 0x200) != 0)
  {
    v13 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_jasperColorStillsExecutorInputByPortType, "objectForKeyedSubscript:", objc_msgSend(a5, "portType"));
    time = v17;
    objc_msgSend(v13, "setColorBufferPTS:exposureTime:", &time, v11);
    v14 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_jasperDisparityProcessorInputByPortType, "objectForKeyedSubscript:", objc_msgSend(a5, "portType"));
    time = v17;
    objc_msgSend(v14, "setColorBufferPTS:exposureTime:", &time, v11);
  }
  if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a5, "stillImageSettings"), "captureSettings"), "captureStreamSettingsForPortType:", objc_msgSend(a5, "portType")), "captureFlags") & 0x20000) != 0|| self->_stereoDisparityProcessorControllerConfiguration)
  {
    -[BWUBNode _handleReferenceFrameEmissionForProcessorInput:]((uint64_t)self, a5);
  }
}

- (void)processorController:(id)a3 didDetermineReferenceFrame:(opaqueCMSampleBuffer *)a4 processorInput:(id)a5 err:(int)a6
{
  CFDictionaryRef v9;
  void *v10;
  CMTime v11;
  CMTime v12;

  memset(&v12, 0, sizeof(v12));
  CMSampleBufferGetPresentationTimeStamp(&v12, a4);
  v9 = CMCopyDictionaryOfAttachments((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a4, 1u);
  v10 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_deepFusionProcessorInputByPortType, "objectForKeyedSubscript:", objc_msgSend(a5, "portType"));
  objc_msgSend(v10, "setEvZeroReferenceFrameAttachments:", v9);
  v11 = v12;
  objc_msgSend(v10, "setEvZeroReferenceFramePTS:", &v11);

}

- (void)processorController:(id)a3 didFinishProcessingInferenceBuffer:(__CVBuffer *)a4 metadata:(id)a5 inferenceAttachedMediaKey:(id)a6 processorInput:(id)a7 err:(int)a8
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *processorCoordinatorWorkerQueue;
  _QWORD v13[7];
  os_log_type_t type;
  int v15;
  _QWORD block[18];

  block[16] = *MEMORY[0x1E0C80C00];
  if (!_FigIsCurrentDispatchQueue())
    FigDebugAssert3();
  if (dword_1ECFE9AF0)
  {
    v15 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (a4)
    CFRetain(a4);
  processorCoordinatorWorkerQueue = self->_processorCoordinatorWorkerQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __121__BWUBNode_processorController_didFinishProcessingInferenceBuffer_metadata_inferenceAttachedMediaKey_processorInput_err___block_invoke;
  v13[3] = &unk_1E491EC68;
  v13[5] = a6;
  v13[6] = a4;
  v13[4] = self;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __ubn_dispatch_async_block_invoke;
  block[3] = &unk_1E491ECB8;
  block[4] = v13;
  dispatch_async(processorCoordinatorWorkerQueue, block);
}

void __121__BWUBNode_processorController_didFinishProcessingInferenceBuffer_metadata_inferenceAttachedMediaKey_processorInput_err___block_invoke(_QWORD *a1)
{
  void *v2;
  const void *v3;

  v2 = *(void **)(a1[4] + 352);
  if (!v2)
  {
    *(_QWORD *)(a1[4] + 352) = objc_alloc_init(BWStillImageInferences);
    v2 = *(void **)(a1[4] + 352);
  }
  objc_msgSend(v2, "addInferenceBuffer:metadata:inferenceAttachedMediaKey:", a1[6], 0, a1[5]);
  v3 = (const void *)a1[6];
  if (v3)
    CFRelease(v3);
}

- (void)processorController:(id)a3 didFinishProcessingInference:(id)a4 inferenceAttachmentKey:(id)a5 processorInput:(id)a6 err:(int)a7
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *processorCoordinatorWorkerQueue;
  _QWORD v12[7];
  os_log_type_t type;
  int v14;
  _QWORD block[18];

  block[16] = *MEMORY[0x1E0C80C00];
  if (!_FigIsCurrentDispatchQueue())
    FigDebugAssert3();
  if (dword_1ECFE9AF0)
  {
    v14 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  processorCoordinatorWorkerQueue = self->_processorCoordinatorWorkerQueue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __103__BWUBNode_processorController_didFinishProcessingInference_inferenceAttachmentKey_processorInput_err___block_invoke;
  v12[3] = &unk_1E491EB90;
  v12[4] = self;
  v12[5] = a4;
  v12[6] = a5;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __ubn_dispatch_async_block_invoke;
  block[3] = &unk_1E491ECB8;
  block[4] = v12;
  dispatch_async(processorCoordinatorWorkerQueue, block);
}

uint64_t __103__BWUBNode_processorController_didFinishProcessingInference_inferenceAttachmentKey_processorInput_err___block_invoke(_QWORD *a1)
{
  void *v2;

  v2 = *(void **)(a1[4] + 352);
  if (!v2)
  {
    *(_QWORD *)(a1[4] + 352) = objc_alloc_init(BWStillImageInferences);
    v2 = *(void **)(a1[4] + 352);
  }
  return objc_msgSend(v2, "addInference:inferenceAttachmentKey:", a1[5], a1[6]);
}

- (void)processorController:(id)a3 didFinishProcessingInferenceAttachedMediaMetadata:(id)a4 processorInput:(id)a5
{
  NSObject *processorCoordinatorWorkerQueue;
  _QWORD v9[7];
  _QWORD block[5];

  if (!_FigIsCurrentDispatchQueue())
    FigDebugAssert3();
  processorCoordinatorWorkerQueue = self->_processorCoordinatorWorkerQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __97__BWUBNode_processorController_didFinishProcessingInferenceAttachedMediaMetadata_processorInput___block_invoke;
  v9[3] = &unk_1E491EB90;
  v9[4] = self;
  v9[5] = a4;
  v9[6] = a5;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __ubn_dispatch_async_block_invoke;
  block[3] = &unk_1E491ECB8;
  block[4] = v9;
  dispatch_async(processorCoordinatorWorkerQueue, block);
}

void __97__BWUBNode_processorController_didFinishProcessingInferenceAttachedMediaMetadata_processorInput___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[5];
  int8x16_t v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 352);
  if (!v2)
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 352) = objc_alloc_init(BWStillImageInferences);
    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 352);
  }
  objc_msgSend(v2, "addInferenceAttachedMediaMetadata:", *(_QWORD *)(a1 + 40));
  if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "captureSettings"), "captureType") == 12)
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __97__BWUBNode_processorController_didFinishProcessingInferenceAttachedMediaMetadata_processorInput___block_invoke_2;
    v4[3] = &unk_1E491EB90;
    v4[4] = v3;
    v5 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
    -[BWUBNode _deepFusionDispatch:direction:block:](v3, 2, 1, (uint64_t)v4);
  }
}

uint64_t __97__BWUBNode_processorController_didFinishProcessingInferenceAttachedMediaMetadata_processorInput___block_invoke_2(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 272), "objectForKeyedSubscript:", objc_msgSend(*(id *)(a1 + 40), "portType")), "setProvidedInferenceAttachedMedia:", objc_msgSend(*(id *)(a1 + 48), "allKeys"));
}

- (void)processorController:(id)a3 didFinishProcessingBuffer:(__CVBuffer *)a4 metadata:(id)a5 type:(unint64_t)a6 captureFrameFlags:(unint64_t)a7 processorInput:(id)a8 err:(int)a9
{
  uint64_t v9;
  unint64_t v12;
  __CVBuffer *v14;
  id v15;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v18;
  const void *v19;
  BWDeferredCaptureControllerInput *deferredCaptureControllerInput;
  uint64_t v21;
  _QWORD *v22;
  BWUBNode *v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD v33[9];
  _QWORD v34[10];
  os_log_type_t type;
  int v36;
  uint64_t v37;

  v12 = a6;
  v14 = a4;
  v15 = a3;
  v37 = *MEMORY[0x1E0C80C00];
  if (dword_1ECFE9AF0)
  {
    v36 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    v15 = a3;
    v12 = a6;
    v14 = a4;
  }
  if (a9)
  {
    FigDebugAssert3();
    return;
  }
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(a8, "settings"), "captureRequestIdentifier"), "isEqualToString:", self->_currentCaptureRequestIdentifier);
  if (objc_msgSend((id)objc_msgSend(a8, "captureSettings"), "captureType") == 12
    || (objc_msgSend((id)objc_msgSend(a8, "captureSettings"), "captureFlags") & 0x80) != 0)
  {
    v18 = objc_msgSend(v15, "type", v26, v28);
    if (v18 == 6)
    {
LABEL_9:
      if (!_FigIsCurrentDispatchQueue())
      {
        v29 = v9;
        LODWORD(v27) = 0;
        FigDebugAssert3();
      }
      if (objc_msgSend((id)objc_msgSend(a8, "captureSettings", v27, v29), "deliverDeferredPhotoProxyImage"))
      {
        if (v12 == 8)
        {
          v19 = (const void *)objc_msgSend(a8, "referenceFrame");
          -[BWDeferredCaptureControllerInput addDictionary:tag:](self->_deferredCaptureControllerInput, "addDictionary:tag:", CMGetAttachment(v19, (CFStringRef)*MEMORY[0x1E0D05CB0], 0), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), BWDeferredIntermediateTagReferenceFrameMetadataByPortTypePrefix, objc_msgSend(a8, "portType")));
        }
        if (v14)
        {
          deferredCaptureControllerInput = self->_deferredCaptureControllerInput;
          if (deferredCaptureControllerInput)
            -[BWDeferredCaptureControllerInput addBuffer:bufferType:captureFrameFlags:metadata:rawThumbnailsBuffer:rawThumbnailsMetadata:](deferredCaptureControllerInput, "addBuffer:bufferType:captureFrameFlags:metadata:rawThumbnailsBuffer:rawThumbnailsMetadata:", v14, v12, 0, a5, 0, 0);
        }
        return;
      }
      if (objc_msgSend((id)objc_msgSend(a8, "captureSettings"), "captureType") != 12)
        return;
      v25 = -[NSMutableDictionary objectForKeyedSubscript:](self->_deepFusionProcessorInputByPortType, "objectForKeyedSubscript:", objc_msgSend(a8, "portType"));
      if (v14)
        CFRetain(v14);
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __109__BWUBNode_processorController_didFinishProcessingBuffer_metadata_type_captureFrameFlags_processorInput_err___block_invoke;
      v34[3] = &unk_1E4921550;
      v34[4] = a8;
      v34[5] = v25;
      v34[6] = a5;
      v34[7] = v12;
      v34[8] = v14;
      v34[9] = a7;
      v22 = v34;
      v23 = self;
      v24 = 1;
LABEL_27:
      -[BWUBNode _deepFusionDispatch:direction:block:]((uint64_t)v23, 2, v24, (uint64_t)v22);
      return;
    }
    if (v18 != 5)
    {
      if (v18 != 1)
        return;
      goto LABEL_9;
    }
    if (!_FigIsCurrentDispatchQueue())
    {
      v29 = v9;
      LODWORD(v27) = 0;
      FigDebugAssert3();
    }
    if (objc_msgSend((id)objc_msgSend(a8, "captureSettings", v27, v29), "captureType") == 12)
    {
      v21 = -[NSMutableDictionary objectForKeyedSubscript:](self->_deepFusionProcessorInputByPortType, "objectForKeyedSubscript:", objc_msgSend(a8, "portType"));
      if (v14)
        CFRetain(v14);
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __109__BWUBNode_processorController_didFinishProcessingBuffer_metadata_type_captureFrameFlags_processorInput_err___block_invoke_2;
      v33[3] = &unk_1E4921110;
      v33[4] = v21;
      v33[5] = a5;
      v33[6] = v14;
      v33[7] = v12;
      v33[8] = a7;
      v22 = v33;
      v23 = self;
      v24 = 2;
      goto LABEL_27;
    }
  }
}

void __109__BWUBNode_processorController_didFinishProcessingBuffer_metadata_type_captureFrameFlags_processorInput_err___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  CFDictionaryRef v4;
  void *v5;
  const void *v6;
  CMTime v7;
  CMTime v8;

  v2 = *(_QWORD *)(a1 + 56);
  if (v2 == 8)
  {
    v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "referenceFrame");
    v4 = CMCopyDictionaryOfAttachments((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v3, 1u);
    objc_msgSend(*(id *)(a1 + 40), "setEvZeroReferenceFrameAttachments:", v4);
    CMSampleBufferGetPresentationTimeStamp(&v8, (CMSampleBufferRef)v3);
    v5 = *(void **)(a1 + 40);
    v7 = v8;
    objc_msgSend(v5, "setEvZeroReferenceFramePTS:", &v7);

    v2 = *(_QWORD *)(a1 + 56);
  }
  objc_msgSend(*(id *)(a1 + 40), "addBuffer:metadata:bufferType:captureFrameFlags:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48), v2, *(_QWORD *)(a1 + 72));
  v6 = *(const void **)(a1 + 64);
  if (v6)
    CFRelease(v6);
}

void __109__BWUBNode_processorController_didFinishProcessingBuffer_metadata_type_captureFrameFlags_processorInput_err___block_invoke_2(uint64_t a1)
{
  const void *v2;

  objc_msgSend(*(id *)(a1 + 32), "addBuffer:metadata:bufferType:captureFrameFlags:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  v2 = *(const void **)(a1 + 48);
  if (v2)
    CFRelease(v2);
}

- (id)adaptiveBracketingParametersForDigitalFlashMode:(int)a3 frameStatistics:(id)a4 stationary:(BOOL)a5 sphereOffsetEnabled:(BOOL)a6 detectedObjects:(id)a7
{
  NSObject *processorCoordinatorWorkerQueue;
  id v8;
  _QWORD v10[8];
  int v11;
  BOOL v12;
  BOOL v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  uint64_t v19;
  _QWORD block[5];

  v14 = 0;
  v15 = &v14;
  v16 = 0x3052000000;
  v17 = __Block_byref_object_copy__24;
  v18 = __Block_byref_object_dispose__24;
  processorCoordinatorWorkerQueue = self->_processorCoordinatorWorkerQueue;
  v19 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __123__BWUBNode_adaptiveBracketingParametersForDigitalFlashMode_frameStatistics_stationary_sphereOffsetEnabled_detectedObjects___block_invoke;
  v10[3] = &unk_1E4923370;
  v11 = a3;
  v10[4] = self;
  v10[5] = a4;
  v12 = a5;
  v13 = a6;
  v10[6] = a7;
  v10[7] = &v14;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __ubn_dispatch_sync_block_invoke;
  block[3] = &unk_1E491ECB8;
  block[4] = v10;
  dispatch_sync(processorCoordinatorWorkerQueue, block);
  v8 = (id)v15[5];
  _Block_object_dispose(&v14, 8);
  return v8;
}

id __123__BWUBNode_adaptiveBracketingParametersForDigitalFlashMode_frameStatistics_stationary_sphereOffsetEnabled_detectedObjects___block_invoke(uint64_t a1)
{
  id result;

  -[BWUBNode _setupProcessorCoordinator](*(_QWORD *)(a1 + 32));
  result = (id)objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "controllerForType:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 208)), "adaptiveBracketingParametersForDigitalFlashMode:frameStatistics:stationary:sphereOffsetEnabled:detectedObjects:", *(unsigned int *)(a1 + 64), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 68), *(unsigned __int8 *)(a1 + 69), *(_QWORD *)(a1 + 48));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = result;
  return result;
}

- (void)stopAdaptiveBracketingForSettings:(id)a3 withGroup:(int)a4
{
  NSObject *processorCoordinatorWorkerQueue;
  _QWORD v5[5];
  int v6;
  _QWORD block[5];

  processorCoordinatorWorkerQueue = self->_processorCoordinatorWorkerQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__BWUBNode_stopAdaptiveBracketingForSettings_withGroup___block_invoke;
  v5[3] = &unk_1E4920568;
  v5[4] = self;
  v6 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __ubn_dispatch_async_block_invoke;
  block[3] = &unk_1E491ECB8;
  block[4] = v5;
  dispatch_async(processorCoordinatorWorkerQueue, block);
}

uint64_t __56__BWUBNode_stopAdaptiveBracketingForSettings_withGroup___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 224), "allValues", 0);
  result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (result)
  {
    v4 = result;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "firstObject"), "stopAdaptiveBracketingWithGroup:", *(unsigned int *)(a1 + 40));
      }
      while (v4 != v6);
      result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      v4 = result;
    }
    while (result);
  }
  return result;
}

- (id)adaptiveBracketingDigitalFlashTotalIntegrationTimesProviderForPortType:(id)a3 wait:(BOOL)a4
{
  _BOOL4 v4;
  os_unfair_lock_s *p_processorCoordinatorLock;
  BWStillImageProcessorCoordinator *processorCoordinator;
  BOOL v9;
  NSObject *processorCoordinatorWorkerQueue;
  id v11;
  _QWORD v13[7];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  uint64_t v19;
  _QWORD block[5];

  v4 = a4;
  p_processorCoordinatorLock = &self->_processorCoordinatorLock;
  os_unfair_lock_lock(&self->_processorCoordinatorLock);
  processorCoordinator = self->_processorCoordinator;
  os_unfair_lock_unlock(p_processorCoordinatorLock);
  if (processorCoordinator)
    v9 = 0;
  else
    v9 = !v4;
  if (v9)
    return 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3052000000;
  v17 = __Block_byref_object_copy__24;
  v18 = __Block_byref_object_dispose__24;
  processorCoordinatorWorkerQueue = self->_processorCoordinatorWorkerQueue;
  v19 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __88__BWUBNode_adaptiveBracketingDigitalFlashTotalIntegrationTimesProviderForPortType_wait___block_invoke;
  v13[3] = &unk_1E491F458;
  v13[5] = a3;
  v13[6] = &v14;
  v13[4] = self;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __ubn_dispatch_sync_block_invoke;
  block[3] = &unk_1E491ECB8;
  block[4] = v13;
  dispatch_sync(processorCoordinatorWorkerQueue, block);
  v11 = (id)v15[5];
  _Block_object_dispose(&v14, 8);
  return v11;
}

id __88__BWUBNode_adaptiveBracketingDigitalFlashTotalIntegrationTimesProviderForPortType_wait___block_invoke(uint64_t *a1)
{
  id result;

  -[BWUBNode _setupProcessorCoordinator](a1[4]);
  result = (id)objc_msgSend((id)objc_msgSend(*(id *)(a1[4] + 152), "controllerForType:", *(_QWORD *)(a1[4] + 208)), "adaptiveBracketingDigitalFlashTotalIntegrationTimesProviderForPortType:", a1[5]);
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) = result;
  return result;
}

- (uint64_t)_inferenceOutputPixelBufferPoolForAttachedMediaKey:(uint64_t)result
{
  uint64_t v2;
  const __CFString *v3;
  void *v4;

  if (result)
  {
    v2 = result;
    if (a2 == CFSTR("DeepZoomOutput"))
      v3 = CFSTR("PrimaryFormat");
    else
      v3 = a2;
    v4 = (void *)objc_msgSend(*(id *)(result + 16), "mediaPropertiesForAttachedMediaKey:", v3);
    result = objc_msgSend(v4, "livePixelBufferPool");
    if (!result)
    {
      result = objc_msgSend(v4, "preparedPixelBufferPool");
      if (!result)
        return objc_msgSend(*(id *)(v2 + 344), "objectForKeyedSubscript:", v3);
    }
  }
  return result;
}

- (id)preparedOutputPixelBufferPoolForAttachedMediaKey:(id)a3 format:(id)a4
{
  return (id)-[BWUBNode _inferenceOutputPixelBufferPoolForAttachedMediaKey:]((uint64_t)self, (const __CFString *)a3);
}

- (void)_dispatch:(int)a3 direction:(dispatch_queue_t)queue processingQueue:(uint64_t)a5 block:
{
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t block;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  uint64_t v16;

  if (a1)
  {
    v9 = *(NSObject **)(a1 + 160);
    if ((a3 - 1) >= 2)
    {
      if (a3 != 3)
        return;
      if (!_FigIsCurrentDispatchQueue())
        FigDebugAssert3();
      if (v9 == queue)
        goto LABEL_18;
      if (a2 != 2)
      {
        if (a2 != 1)
          return;
        v10 = *(NSObject **)(a1 + 160);
        block = MEMORY[0x1E0C809B0];
        v13 = 3221225472;
        v14 = __ubn_dispatch_sync_block_invoke;
        v15 = &unk_1E491ECB8;
        v16 = a5;
LABEL_17:
        dispatch_sync(v10, &block);
        return;
      }
      v11 = *(NSObject **)(a1 + 160);
      block = MEMORY[0x1E0C809B0];
      v13 = 3221225472;
      v14 = __ubn_dispatch_async_block_invoke;
      v15 = &unk_1E491ECB8;
      v16 = a5;
    }
    else
    {
      if (v9 == queue && a3 == 1)
      {
        if (!_FigIsCurrentDispatchQueue())
          FigDebugAssert3();
LABEL_18:
        (*(void (**)(uint64_t))(a5 + 16))(a5);
        return;
      }
      if (a2 != 2)
      {
        if (a2 != 1)
          return;
        block = MEMORY[0x1E0C809B0];
        v13 = 3221225472;
        v14 = __ubn_dispatch_sync_block_invoke;
        v15 = &unk_1E491ECB8;
        v16 = a5;
        v10 = queue;
        goto LABEL_17;
      }
      block = MEMORY[0x1E0C809B0];
      v13 = 3221225472;
      v14 = __ubn_dispatch_async_block_invoke;
      v15 = &unk_1E491ECB8;
      v16 = a5;
      v11 = queue;
    }
    dispatch_async(v11, &block);
  }
}

- (uint64_t)_nrProcessorInputNeededForSettings:(uint64_t)a3 portType:
{
  if (a1
    && objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureStreamSettingsForPortType:", a3), "hasValidFrames"))
  {
    return objc_msgSend(*(id *)(a1 + 120), "containsObject:", a3);
  }
  else
  {
    return 0;
  }
}

- (void)_handleClientBracketFrameEmissionForSampleBuffer:(void *)a3 stillImageSettings:(uint64_t)a4 portType:
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  _QWORD v12[6];
  _QWORD block[5];

  if (a1
    && ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "captureSettings"), "captureStreamSettingsForPortType:", a4), "captureFlags") & 0x20000) != 0|| *(_QWORD *)(a1 + 480)))
  {
    v8 = (void *)CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
    v9 = objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D06910]);
    if (!objc_msgSend((id)objc_msgSend(*(id *)(a1 + 512), "objectForKeyedSubscript:", a4), "objectForKeyedSubscript:", v9))
    {
      objc_msgSend((id)objc_msgSend(*(id *)(a1 + 512), "objectForKeyedSubscript:", a4), "setObject:forKeyedSubscript:", objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D06EB0]), v9);
      if (-[BWUBNode _generateDisparityForSettings:](a1, a3))
      {
        v10 = objc_msgSend(*(id *)(a1 + 520), "objectForKeyedSubscript:", v9);
        if (a2)
          CFRetain(a2);
        v11 = *(NSObject **)(a1 + 504);
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __89__BWUBNode__handleClientBracketFrameEmissionForSampleBuffer_stillImageSettings_portType___block_invoke;
        v12[3] = &unk_1E491F158;
        v12[4] = v10;
        v12[5] = a2;
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __ubn_dispatch_async_block_invoke;
        block[3] = &unk_1E491ECB8;
        block[4] = v12;
        dispatch_async(v11, block);
      }
      else
      {
        -[BWUBNode _emitSampleBuffer:description:](a1, a2, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("reference")));
      }
    }
  }
}

- (BOOL)_generateDisparityForSettings:(_BOOL8)result
{
  if (result)
    return *(_QWORD *)(result + 480)
        && (objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureFlags") & 0x800) != 0
        && (objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureFlags") & 0x200) == 0;
  return result;
}

void __89__BWUBNode__handleClientBracketFrameEmissionForSampleBuffer_stillImageSettings_portType___block_invoke(uint64_t a1)
{
  const void *v2;

  objc_msgSend(*(id *)(a1 + 32), "addSampleBuffer:", *(_QWORD *)(a1 + 40));
  v2 = *(const void **)(a1 + 40);
  if (v2)
    CFRelease(v2);
}

- (void)_handleReferenceFrameEmissionForSampleBuffer:(void *)a3 stillImageSettings:(uint64_t)a4 portType:
{
  uint64_t v8;
  NSObject *v9;
  _QWORD v10[6];
  _QWORD block[5];

  if (a1)
  {
    v8 = objc_msgSend(*(id *)(a1 + 232), "objectForKeyedSubscript:", a4);
    if (a2)
    {
      if (!v8)
      {
        objc_msgSend(*(id *)(a1 + 232), "setObject:forKeyedSubscript:", objc_msgSend((id)CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E0D05CB0], 0), "objectForKeyedSubscript:", *MEMORY[0x1E0D06EB0]), a4);
        if (-[BWUBNode _generateDisparityForSettings:](a1, a3))
        {
          CFRetain(a2);
          v9 = *(NSObject **)(a1 + 504);
          v10[0] = MEMORY[0x1E0C809B0];
          v10[1] = 3221225472;
          v10[2] = __85__BWUBNode__handleReferenceFrameEmissionForSampleBuffer_stillImageSettings_portType___block_invoke;
          v10[3] = &unk_1E491F158;
          v10[4] = a1;
          v10[5] = a2;
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __ubn_dispatch_async_block_invoke;
          block[3] = &unk_1E491ECB8;
          block[4] = v10;
          dispatch_async(v9, block);
        }
        else
        {
          -[BWUBNode _emitSampleBuffer:description:](a1, a2, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("reference frame for '%@'"), a4));
        }
      }
    }
  }
}

void __85__BWUBNode__handleReferenceFrameEmissionForSampleBuffer_stillImageSettings_portType___block_invoke(uint64_t a1)
{
  const void *v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 488), "addSampleBuffer:", *(_QWORD *)(a1 + 40));
  v2 = *(const void **)(a1 + 40);
  if (v2)
    CFRelease(v2);
}

- (void)_handleReferenceFrameEmissionForSettings:(uint64_t)a3 portType:(const void *)a4 referenceFrame:(const void *)a5 evMinusReferenceFrame:(const void *)a6 errorRecoveryFrame:
{
  void *v12;
  int v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  const void *AttachedMedia;

  if (a1
    && ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureStreamSettingsForPortType:", a3), "captureFlags") & 0x20000) != 0|| *(_QWORD *)(a1 + 480)))
  {
    v12 = (void *)objc_msgSend(a2, "captureSettings");
    if (a6)
    {
      if (objc_msgSend(v12, "deliverOriginalImage"))
        a4 = 0;
      else
        a4 = a6;
      goto LABEL_8;
    }
    if ((objc_msgSend(v12, "captureFlags") & 0x101000) != 0)
    {
      v13 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 240), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 144)), "intValue");
      if (v13 == 2)
      {
        if (!a4)
          goto LABEL_8;
        v14 = (const __CFString *)*MEMORY[0x1E0D05CB0];
        v15 = (void *)CMGetAttachment(a4, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
        if (a5)
        {
          v16 = v15;
          objc_msgSend((id)CMGetAttachment(a5, v14, 0), "setObject:forKeyedSubscript:", objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0D06EB0]), *MEMORY[0x1E0D06EB0]);
          AttachedMedia = (const void *)BWSampleBufferGetAttachedMedia(a5, 0x1E495AED8);
          if (AttachedMedia)
            objc_msgSend((id)CMGetAttachment(AttachedMedia, v14, 0), "setObject:forKeyedSubscript:", v16, CFSTR("EVZeroMetadata"));
          a4 = a5;
          goto LABEL_8;
        }
        goto LABEL_12;
      }
      if (v13 != 1)
LABEL_12:
        a4 = 0;
    }
LABEL_8:
    -[BWUBNode _handleReferenceFrameEmissionForSampleBuffer:stillImageSettings:portType:](a1, a4, a2, a3);
  }
}

- (uint64_t)_isInferenceInputImageRequiredForSettings:(uint64_t)result
{
  uint64_t v3;
  char v4;

  if (result)
  {
    v3 = result;
    v4 = -[BWUBNode _inferencesRequiredByProcessorControllersForSettings:](result, a2);
    result = -[BWUBNode _provideInferenceAttachedMediaWithSettings:](v3, a2);
    if ((v4 & 1) != 0 || (_DWORD)result)
      return !*(_QWORD *)(v3 + 400)
          || (objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureFlags") & 0x10000) == 0;
  }
  return result;
}

- (id)_ubInferenceInputRouter
{
  _QWORD v1[5];

  if (result)
  {
    v1[0] = MEMORY[0x1E0C809B0];
    v1[1] = 3221225472;
    v1[2] = __35__BWUBNode__ubInferenceInputRouter__block_invoke;
    v1[3] = &unk_1E4923398;
    v1[4] = result;
    return (id)objc_msgSend(v1, "copy");
  }
  return result;
}

- (id)_bufferTypesForCaptureSettings:(uint64_t)a1
{
  void *v3;
  void *v4;

  if (!a1)
    return 0;
  v3 = 0;
  switch(objc_msgSend(a2, "captureType"))
  {
    case 0u:
    case 3u:
    case 4u:
    case 5u:
    case 8u:
      v3 = (void *)MEMORY[0x1E0C9AA60];
      break;
    case 1u:
      v3 = &unk_1E4A00DD0;
      break;
    case 2u:
    case 6u:
    case 7u:
      v3 = &unk_1E4A00DE8;
      break;
    case 0xAu:
      v3 = &unk_1E4A00E00;
      break;
    case 0xBu:
      v3 = &unk_1E4A00E18;
      break;
    case 0xCu:
      if (objc_msgSend(a2, "deliverDeferredPhotoProxyImage"))
        v3 = &unk_1E4A00E30;
      else
        v3 = &unk_1E4A00E48;
      break;
    default:
      break;
  }
  if (objc_msgSend(a2, "deliverOriginalImage"))
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v3);
    objc_msgSend(v4, "addObject:", &unk_1E49FA3F8);
    return (id)objc_msgSend(v4, "copy");
  }
  return v3;
}

- (id)_standardNROutputRouterWithExpectedQueue:(id)result
{
  _QWORD v2[6];

  if (result)
  {
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __53__BWUBNode__standardNROutputRouterWithExpectedQueue___block_invoke;
    v2[3] = &unk_1E4923460;
    v2[4] = a2;
    v2[5] = result;
    return (id)objc_msgSend(v2, "copy");
  }
  return result;
}

- (uint64_t)_inferencesRequiredByProcessorControllersForSettings:(uint64_t)result
{
  uint64_t v3;
  int v4;
  unint64_t v5;

  if (result)
  {
    v3 = result;
    v4 = -[BWUBNode _isSemanticRenderingCapture:](result, a2);
    if (*(_QWORD *)(v3 + 400))
      v5 = ((unint64_t)objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureFlags") >> 16) & 1;
    else
      LODWORD(v5) = 0;
    return v4 | v5 | -[BWUBNode _isSemanticStylesCaptureNeedingInferencesWithSettings:](v3, a2);
  }
  return result;
}

- (uint64_t)_setupProcessingStateForJasperDisparityIfNeededWithSettings:(void *)a3 processingPlan:
{
  uint64_t v3;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  BWJasperDisparityProcessorInput *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  id obj;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _QWORD v50[6];
  _BYTE v51[128];
  void *v52;
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (!_FigIsCurrentDispatchQueue())
    {
      v28 = v3;
      LODWORD(v27) = 0;
      FigDebugAssert3();
    }
    if ((objc_msgSend((id)objc_msgSend(a2, "captureSettings", v27, v28), "captureFlags") & 0x200) != 0)
    {
      v7 = objc_msgSend(*(id *)(a1 + 152), "controllerForType:", 13);
      if (v7)
      {
        v8 = (void *)v7;
        v37 = -[BWUBNode _bufferTypesForCaptureSettings:](a1, (void *)objc_msgSend(a2, "captureSettings"));
        v50[0] = MEMORY[0x1E0C809B0];
        v50[1] = 3221225472;
        v50[2] = __87__BWUBNode__setupProcessingStateForJasperDisparityIfNeededWithSettings_processingPlan___block_invoke;
        v50[3] = &unk_1E4923460;
        v29 = v8;
        v30 = a1;
        v50[4] = a1;
        v50[5] = v8;
        v35 = (id)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v46 = 0u;
        v47 = 0u;
        v48 = 0u;
        v49 = 0u;
        obj = (id)objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "portTypes");
        v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
        if (v34)
        {
          v32 = *(_QWORD *)v47;
          v33 = a2;
          do
          {
            v9 = 0;
            do
            {
              if (*(_QWORD *)v47 != v32)
                objc_enumerationMutation(obj);
              v36 = v9;
              v10 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v9);
              v11 = -[BWJasperDisparityProcessorInput initWithSettings:portType:]([BWJasperDisparityProcessorInput alloc], "initWithSettings:portType:", a2, v10);
              v42 = 0u;
              v43 = 0u;
              v44 = 0u;
              v45 = 0u;
              v12 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v42, v53, 16);
              if (v12)
              {
                v13 = v12;
                v14 = *(_QWORD *)v43;
                do
                {
                  for (i = 0; i != v13; ++i)
                  {
                    if (*(_QWORD *)v43 != v14)
                      objc_enumerationMutation(v37);
                    v16 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
                    v17 = (int)objc_msgSend(v16, "intValue");
                    v52 = v16;
                    v18 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v52, 1);
                    v19 = (void *)objc_msgSend(a3, "lastAddedInputForSequenceNumber:portType:bufferType:", 0, v10, v17);
                    if (v19)
                    {
                      v20 = v19;
                      -[BWStillImageProcessorControllerInput addOutputSampleBufferRouter:forBufferTypes:](v11, "addOutputSampleBufferRouter:forBufferTypes:", objc_msgSend((id)objc_msgSend(v19, "outputSampleBufferRouterForBufferType:", v17), "outputSampleBufferRouter"), v18);
                      objc_msgSend(a3, "addInput:sequenceNumber:portType:bufferType:", v11, 0, v10, v17);
                      objc_msgSend(v20, "addOutputSampleBufferRouter:forBufferTypes:", v50, v18);
                    }
                  }
                  v13 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v42, v53, 16);
                }
                while (v13);
              }
              a2 = v33;
              if (objc_msgSend(v10, "isEqualToString:", objc_msgSend((id)objc_msgSend(v33, "captureSettings"), "masterPortType")))objc_msgSend(v35, "insertObject:atIndex:", v11, 0);
              else
                objc_msgSend(v35, "addObject:", v11);
              v9 = v36 + 1;
            }
            while (v36 + 1 != v34);
            v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
          }
          while (v34);
        }
        v40 = 0u;
        v41 = 0u;
        v38 = 0u;
        v39 = 0u;
        v21 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v38, v51, 16);
        if (v21)
        {
          v22 = v21;
          v23 = *(_QWORD *)v39;
          do
          {
            for (j = 0; j != v22; ++j)
            {
              if (*(_QWORD *)v39 != v23)
                objc_enumerationMutation(v35);
              v25 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * j);
              objc_msgSend(v29, "enqueueInputForProcessing:delegate:", v25, v30);
              objc_msgSend(*(id *)(v30 + 568), "setObject:forKeyedSubscript:", v25, objc_msgSend(v25, "portType"));
            }
            v22 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v38, v51, 16);
          }
          while (v22);
        }
      }
    }
  }
  return 0;
}

- (uint64_t)_setupProcessingStateForIntelligentDistortionCorrectionIfNeededWithSettings:(uint64_t)a3 sequenceNumber:(uint64_t)a4 portType:(uint64_t)a5 queueProvidingInput:(void *)a6 processingPlan:
{
  uint64_t v6;
  id *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  BWIntelligentDistortionCorrectionProcessorInput *v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  void *v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v37;
  uint64_t v38;
  id *v39;
  unsigned int v40;
  void *v41;
  unsigned int v42;
  id obj;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _QWORD v52[7];
  void *v53;
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v11 = a1;
  if (!_FigIsCurrentDispatchQueue())
  {
    v38 = v6;
    LODWORD(v37) = 0;
    FigDebugAssert3();
  }
  if (!v11[52])
  {
    v34 = 0;
    LODWORD(v15) = 0;
    goto LABEL_44;
  }
  v12 = objc_msgSend(v11[19], "controllerForType:", 7);
  if (objc_msgSend((id)objc_msgSend(a2, "processingSettings"), "processIntelligentDistortionCorrection"))
    v13 = objc_msgSend(v11, "idcSupportedForCaptureType:captureFlags:portType:", objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureType"), 0, a4);
  else
    v13 = 0;
  v14 = objc_msgSend((id)objc_msgSend(v11[52], "portTypesWithGeometricDistortionCorrectionEnabled", v37, v38), "containsObject:", a4);
  v15 = v14;
  if ((v13 & 1) == 0 && !(_DWORD)v14)
  {
    v34 = 0;
    goto LABEL_40;
  }
  v41 = (void *)v12;
  v16 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", -[BWUBNode _bufferTypesExcludingErrorRecoveryTypesForCaptureSettings:](v11, (void *)objc_msgSend(a2, "captureSettings")));
  v17 = -[BWUBNode _errorRecoveryBufferTypesForBufferTypes:](v11, v16);
  if ((_DWORD)v15)
    objc_msgSend(v16, "addObjectsFromArray:", v17);
  v52[0] = MEMORY[0x1E0C809B0];
  v52[1] = 3221225472;
  v52[2] = __147__BWUBNode__setupProcessingStateForIntelligentDistortionCorrectionIfNeededWithSettings_sequenceNumber_portType_queueProvidingInput_processingPlan___block_invoke;
  v52[3] = &unk_1E4923438;
  v52[4] = v11;
  v52[5] = a4;
  v52[6] = v17;
  if (objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureType") == 7
    && objc_msgSend(v11[53], "objectForKeyedSubscript:", a4))
  {
    v18 = (BWIntelligentDistortionCorrectionProcessorInput *)objc_msgSend(v11[53], "objectForKeyedSubscript:", a4);
    v19 = objc_msgSend((id)objc_msgSend(v11[54], "objectForKeyedSubscript:", a4), "intValue");
    objc_msgSend(v11[54], "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v19 + 1)), a4);
  }
  else
  {
    obj = v17;
    v39 = v11;
    v18 = -[BWIntelligentDistortionCorrectionProcessorInput initWithSettings:portType:]([BWIntelligentDistortionCorrectionProcessorInput alloc], "initWithSettings:portType:", a2, a4);
    v40 = v13;
    -[BWIntelligentDistortionCorrectionProcessorInput setProcessIntelligentDistortionCorrection:](v18, "setProcessIntelligentDistortionCorrection:", v13);
    v42 = v15;
    -[BWIntelligentDistortionCorrectionProcessorInput setProcessGeometricDistortionCorrection:](v18, "setProcessGeometricDistortionCorrection:", v15);
    -[BWIntelligentDistortionCorrectionProcessorInput setApplyZoom:](v18, "setApplyZoom:", 1);
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v20 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v48, v55, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v49;
      while (2)
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v49 != v22)
            objc_enumerationMutation(v16);
          v24 = (int)objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * i), "intValue");
          v25 = (void *)objc_msgSend(a6, "lastAddedInputForSequenceNumber:portType:bufferType:", a3, a4, v24);
          if (v25)
          {
            if (!ubn_insertOutputRouterForInputAfterPreviousInputForBufferType((uint64_t)v52, v18, v25, v24))
            {
              v34 = 4294954516;
              LODWORD(v15) = v42;
              LOBYTE(v13) = v40;
              goto LABEL_40;
            }
            objc_msgSend(a6, "addInput:sequenceNumber:portType:bufferType:", v18, a3, a4, v24);
          }
        }
        v21 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v48, v55, 16);
        if (v21)
          continue;
        break;
      }
    }
    if ((v42 & 1) == 0)
    {
      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
      if (v26)
      {
        v27 = v26;
        v28 = *(_QWORD *)v45;
        do
        {
          for (j = 0; j != v27; ++j)
          {
            if (*(_QWORD *)v45 != v28)
              objc_enumerationMutation(obj);
            v30 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * j);
            v31 = (void *)objc_msgSend(a6, "lastAddedInputForSequenceNumber:portType:bufferType:", a3, a4, (int)objc_msgSend(v30, "intValue"));
            v53 = v30;
            objc_msgSend(v31, "addBypassedProcessorType:forBufferTypes:", 7, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v53, 1));
          }
          v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
        }
        while (v27);
      }
    }
    v11 = v39;
    objc_msgSend(v39[53], "setObject:forKeyedSubscript:", v18, a4);
    objc_msgSend(v39[54], "setObject:forKeyedSubscript:", &unk_1E49FA308, a4);

    v15 = v42;
    v13 = v40;
  }
  v32 = objc_msgSend(v41, "enqueueInputForProcessing:delegate:", v18, v11);
  if ((_DWORD)v32)
  {
    v34 = v32;
LABEL_40:
    if ((v13 & 1) != 0)
      goto LABEL_41;
LABEL_44:
    if ((((_DWORD)v34 == 0) & ~(_DWORD)v15) == 0 && dword_1ECFE9AF0)
      goto LABEL_46;
    return v34;
  }
  v33 = v11[73];
  if (!v33)
  {
    v34 = 0;
    goto LABEL_40;
  }
  objc_msgSend((id)objc_msgSend(v33, "pipelineParameters"), "setIntelligentDistortionCorrectionEnabled:", v13);
  objc_msgSend((id)objc_msgSend(v11[73], "pipelineParameters"), "setGeometricDistortionCorrectionEnabled:", v15);
  objc_msgSend((id)objc_msgSend(v11[73], "pipelineParameters"), "setDistortionCorrectionVersion:", objc_msgSend(v11[52], "intelligentDistortionCorrectionVersion"));
  v34 = 0;
  if ((v13 & 1) == 0)
    goto LABEL_44;
LABEL_41:
  if (dword_1ECFE9AF0)
  {
LABEL_46:
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v34;
}

- (uint64_t)_isSemanticRenderingCapture:(uint64_t)result
{
  uint64_t v3;
  int v4;
  unint64_t v5;
  uint64_t v6;

  if (result)
  {
    v3 = result;
    v4 = objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureType");
    v5 = objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureFlags");
    if ((int)-[BWUBNodeConfiguration semanticRenderingVersion](*(_QWORD *)(v3 + 112)) < 1)
    {
      return 0;
    }
    else
    {
      v6 = (v5 >> 7) & 1;
      if (v4 == 11)
        LODWORD(v6) = 1;
      if (v4 == 12)
        LODWORD(v6) = 1;
      if (v4 == 10)
        return 1;
      else
        return v6;
    }
  }
  return result;
}

- (uint64_t)_isSemanticStylesCaptureNeedingInferencesWithSettings:(uint64_t)result
{
  uint64_t v3;
  _BOOL4 v4;
  char v5;
  int v6;
  unsigned int v7;
  int v8;

  if (result)
  {
    v3 = result;
    objc_msgSend(a2, "requestedSettings");
    objc_opt_class();
    v4 = (objc_opt_isKindOfClass() & 1) == 0
      || objc_msgSend((id)objc_msgSend(a2, "requestedSettings"), "semanticStyle") == 0;
    v5 = -[BWUBNode _isSemanticRenderingCapture:](v3, a2);
    v6 = objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureType");
    v7 = -[BWUBNode _provideInferenceAttachedMediaWithSettings:](v3, a2);
    v8 = !-[BWUBNodeConfiguration semanticStyleRenderingEnabled](*(_QWORD *)(v3 + 112)) || v4;
    result = v8 ^ 1u;
    if ((v8 & 1) == 0 && (v5 & 1) == 0)
    {
      if (v6 == 2)
        return 1;
      else
        return v7;
    }
  }
  return result;
}

- (uint64_t)_provideInferenceAttachedMediaWithSettings:(uint64_t)result
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = result;
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v4 = (void *)-[BWUBNodeConfiguration providedInferenceAttachedMediaByMode](*(_QWORD *)(result + 112));
    result = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (result)
    {
      v5 = result;
      v6 = *(_QWORD *)v9;
      while (2)
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v9 != v6)
            objc_enumerationMutation(v4);
          if ((-[BWUBNode _provideInferencesForAttachedMediaMode:settings:](v3, objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7), "intValue", (_QWORD)v8), a2) & 1) != 0)return 1;
          ++v7;
        }
        while (v5 != v7);
        result = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
        v5 = result;
        if (result)
          continue;
        break;
      }
    }
  }
  return result;
}

- (uint64_t)_isDemosaicedRawCaptureNeedingInferencesWithSettigs:(uint64_t)a1
{
  if (a1
    && objc_msgSend((id)objc_msgSend(a2, "processingSettings"), "provideDemosaicedRaw")
    && objc_msgSend((id)-[BWUBNodeConfiguration providedInferenceAttachedMediaByMode](*(_QWORD *)(a1 + 112)), "objectForKeyedSubscript:", &unk_1E49FA2A8))
  {
    return -[BWUBNode _isSemanticRenderingCapture:](a1, a2);
  }
  else
  {
    return 0;
  }
}

- (uint64_t)_isDepthCaptureNeedingPersonSegmentationMasksWithSettings:(uint64_t)a1
{
  if (a1
    && objc_msgSend((id)-[BWUBNodeConfiguration providedInferenceAttachedMediaByMode](*(_QWORD *)(a1 + 112)), "objectForKeyedSubscript:", &unk_1E49FA2C0)&& (objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureFlags") & 0x800) != 0)
  {
    return objc_msgSend((id)objc_msgSend(a2, "requestedSettings"), "depthDataFiltered");
  }
  else
  {
    return 0;
  }
}

- (uint64_t)_inferencesRequiredForSettings:(uint64_t)result
{
  uint64_t v3;
  int v4;

  if (result)
  {
    v3 = result;
    v4 = -[BWUBNode _inferencesRequiredByProcessorControllersForSettings:](result, a2);
    return v4 | -[BWUBNode _provideInferenceAttachedMediaWithSettings:](v3, a2);
  }
  return result;
}

- (uint64_t)_scaleInferenceInputForRedEyeReductionFromPixelBuffer:(CVPixelBufferRef)destinationBuffer outputPixelBuffer:
{
  uint64_t v4;
  OpaqueVTPixelTransferSession *v6;

  if (result)
  {
    v4 = result;
    result = 4294954516;
    if (sourceBuffer)
    {
      if (destinationBuffer)
      {
        v6 = *(OpaqueVTPixelTransferSession **)(v4 + 376);
        if (v6)
          return VTPixelTransferSessionTransferImage(v6, sourceBuffer, destinationBuffer);
        result = VTPixelTransferSessionCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (VTPixelTransferSessionRef *)(v4 + 376));
        if (!(_DWORD)result)
        {
          result = VTSessionSetProperty(*(VTSessionRef *)(v4 + 376), (CFStringRef)*MEMORY[0x1E0CED848], (CFTypeRef)*MEMORY[0x1E0CEDB40]);
          if (!(_DWORD)result)
          {
            v6 = *(OpaqueVTPixelTransferSession **)(v4 + 376);
            return VTPixelTransferSessionTransferImage(v6, sourceBuffer, destinationBuffer);
          }
        }
      }
    }
  }
  return result;
}

- (uint64_t)_setupProcessingStateForInferenceWithSettings:(uint64_t)a3 portType:
{
  int v5;
  int v6;
  int v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  __CVBuffer *ImageBuffer;
  __IOSurface *IOSurface;
  __IOSurface *v17;
  NSObject *v18;
  BWInferenceEngineControllerInput *v19;
  _BOOL8 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t k;
  BWInferenceEngineControllerInput *v29;
  NSObject *v30;
  uint64_t v31;
  BWInferenceEngineControllerInput *v33;
  unint64_t v34;
  int v35;
  uint64_t v37;
  id obj;
  int v39;
  void *v40;
  _QWORD v41[8];
  _QWORD v42[5];
  char v43;
  char v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _QWORD v53[5];
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _QWORD v58[5];
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  int v62;
  uint64_t block;
  uint64_t v64;
  void (*v65)(uint64_t);
  void *v66;
  _QWORD *v67;
  _BYTE v68[128];
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v59 = 0;
  v60 = &v59;
  v61 = 0x2020000000;
  v62 = 0;
  v37 = objc_msgSend(*(id *)(a1 + 152), "controllerForType:", 3);
  if (v37)
  {
    v5 = -[BWUBNode _isSemanticRenderingCapture:](a1, a2);
    if (*(_QWORD *)(a1 + 400))
      v34 = ((unint64_t)objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureFlags") >> 16) & 1;
    else
      LODWORD(v34) = 0;
    v6 = -[BWUBNode _isSemanticStylesCaptureNeedingInferencesWithSettings:](a1, a2);
    v7 = -[BWUBNode _provideInferenceAttachedMediaWithSettings:](a1, a2);
    v35 = -[BWUBNode _inferencesRequiredByProcessorControllersForSettings:](a1, a2);
    v8 = *(NSObject **)(a1 + 320);
    v58[0] = MEMORY[0x1E0C809B0];
    v58[1] = 3221225472;
    v58[2] = __67__BWUBNode__setupProcessingStateForInferenceWithSettings_portType___block_invoke;
    v58[3] = &unk_1E491E720;
    v58[4] = v37;
    block = MEMORY[0x1E0C809B0];
    v64 = 3221225472;
    v65 = __ubn_dispatch_sync_block_invoke;
    v66 = &unk_1E491ECB8;
    v67 = v58;
    dispatch_sync(v8, &block);
    v9 = (void *)objc_msgSend(*(id *)(a1 + 312), "objectForKeyedSubscript:", a3);
    if (objc_msgSend(v9, "inferenceImage"))
    {
      v10 = (void *)BWSampleBufferCopyDictionaryOfAttachedMedia((const void *)objc_msgSend(v9, "inferenceImage"));
      v39 = v7;
      v11 = v6;
      v56 = 0u;
      v57 = 0u;
      v54 = 0u;
      v55 = 0u;
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v54, v70, 16);
      if (v12)
      {
        v13 = *(_QWORD *)v55;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v55 != v13)
              objc_enumerationMutation(v10);
            ImageBuffer = CMSampleBufferGetImageBuffer((CMSampleBufferRef)objc_msgSend(v10, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * i)));
            if (ImageBuffer)
            {
              IOSurface = CVPixelBufferGetIOSurface(ImageBuffer);
              v17 = IOSurface;
              if (IOSurface)
              {
                IOSurfaceLock(IOSurface, 5u, 0);
                IOSurfaceUnlock(v17, 5u, 0);
              }
            }
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v54, v70, 16);
        }
        while (v12);
      }

      v7 = v39;
      v6 = v11;
      BWSampleBufferRemoveAllAttachedMedia((const void *)objc_msgSend(v9, "inferenceImage"));
    }
    if ((v35 | v7) == 1)
    {
      v18 = *(NSObject **)(a1 + 320);
      v53[0] = MEMORY[0x1E0C809B0];
      v53[1] = 3221225472;
      v53[2] = __67__BWUBNode__setupProcessingStateForInferenceWithSettings_portType___block_invoke_2;
      v53[3] = &unk_1E491E720;
      v53[4] = a1;
      block = MEMORY[0x1E0C809B0];
      v64 = 3221225472;
      v65 = __ubn_dispatch_sync_block_invoke;
      v66 = &unk_1E491ECB8;
      v67 = v53;
      dispatch_sync(v18, &block);
    }
    v19 = -[BWInferenceEngineControllerInput initWithSettings:portType:]([BWInferenceEngineControllerInput alloc], "initWithSettings:portType:", a2, a3);
    v40 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
    if ((_DWORD)v34)
    {
      if ((objc_msgSend(*(id *)(a1 + 304), "enabledVisionInferences") & 2) != 0)
        -[BWInferenceEngineControllerInput setEnabledVisionInferences:](v19, "setEnabledVisionInferences:", -[BWInferenceEngineControllerInput enabledVisionInferences](v19, "enabledVisionInferences") | 2);
      if ((objc_msgSend(*(id *)(a1 + 304), "enabledVisionInferences") & 4) != 0)
        -[BWInferenceEngineControllerInput setEnabledVisionInferences:](v19, "setEnabledVisionInferences:", -[BWInferenceEngineControllerInput enabledVisionInferences](v19, "enabledVisionInferences") | 4);
      if ((objc_msgSend(*(id *)(a1 + 304), "enabledVisionInferences") & 8) != 0)
        -[BWInferenceEngineControllerInput setEnabledVisionInferences:](v19, "setEnabledVisionInferences:", -[BWInferenceEngineControllerInput enabledVisionInferences](v19, "enabledVisionInferences") | 8);
    }
    if (v5)
    {
      objc_msgSend(v40, "addObjectsFromArray:", objc_msgSend(*(id *)(a1 + 304), "enabledInferenceMasks"));
      if ((objc_msgSend(*(id *)(a1 + 304), "enabledVisionInferences") & 2) != 0)
        -[BWInferenceEngineControllerInput setEnabledVisionInferences:](v19, "setEnabledVisionInferences:", -[BWInferenceEngineControllerInput enabledVisionInferences](v19, "enabledVisionInferences") | 2);
      if ((objc_msgSend(*(id *)(a1 + 304), "enabledVisionInferences") & 8) != 0)
        -[BWInferenceEngineControllerInput setEnabledVisionInferences:](v19, "setEnabledVisionInferences:", -[BWInferenceEngineControllerInput enabledVisionInferences](v19, "enabledVisionInferences") | 8);
      if ((objc_msgSend(*(id *)(a1 + 304), "enabledVisionInferences") & 0x10) != 0)
        -[BWInferenceEngineControllerInput setEnabledVisionInferences:](v19, "setEnabledVisionInferences:", -[BWInferenceEngineControllerInput enabledVisionInferences](v19, "enabledVisionInferences") | 0x10);
    }
    if (v6)
    {
      objc_msgSend(v40, "addObject:", CFSTR("PersonSemanticsSkin"));
      objc_msgSend(v40, "addObject:", 0x1E495B0B8);
      objc_msgSend(v40, "addObject:", 0x1E49511B8);
      if (objc_msgSend(*(id *)(a1 + 304), "smartCameraClassificationsEnabled"))
        v20 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "metadata"), "smartCamInferences") == 0;
      else
        v20 = 0;
      -[BWInferenceEngineControllerInput setSmartCameraClassificationsEnabled:](v19, "setSmartCameraClassificationsEnabled:", v20);
    }
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    obj = *(id *)(a1 + 392);
    v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v69, 16);
    v33 = v19;
    if (v21)
    {
      v22 = *(_QWORD *)v50;
      do
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v50 != v22)
            objc_enumerationMutation(obj);
          v24 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * j);
          v45 = 0u;
          v46 = 0u;
          v47 = 0u;
          v48 = 0u;
          v25 = (void *)objc_msgSend(*(id *)(a1 + 392), "objectForKeyedSubscript:", v24);
          v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v45, v68, 16);
          if (v26)
          {
            v27 = *(_QWORD *)v46;
            while (2)
            {
              for (k = 0; k != v26; ++k)
              {
                if (*(_QWORD *)v46 != v27)
                  objc_enumerationMutation(v25);
                if ((-[BWUBNode _provideInferencesForAttachedMediaMode:settings:](a1, objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * k), "intValue"), a2) & 1) != 0)
                {
                  objc_msgSend(v40, "addObject:", v24);
                  goto LABEL_54;
                }
              }
              v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v45, v68, 16);
              if (v26)
                continue;
              break;
            }
          }
LABEL_54:
          ;
        }
        v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v69, 16);
      }
      while (v21);
    }
    v29 = v33;
    -[BWInferenceEngineControllerInput setEnabledInferenceMasks:](v33, "setEnabledInferenceMasks:", objc_msgSend(v40, "allObjects"));
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __67__BWUBNode__setupProcessingStateForInferenceWithSettings_portType___block_invoke_3;
    v42[3] = &unk_1E4923488;
    v42[4] = a1;
    v43 = v35;
    v44 = v34;
    -[BWStillImageProcessorControllerInput addOutputSampleBufferRouter:forBufferTypes:](v33, "addOutputSampleBufferRouter:forBufferTypes:", v42, &unk_1E4A00DA0);
    v30 = *(NSObject **)(a1 + 320);
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __67__BWUBNode__setupProcessingStateForInferenceWithSettings_portType___block_invoke_156;
    v41[3] = &unk_1E49233C0;
    v41[4] = v37;
    v41[5] = v33;
    v41[6] = a1;
    v41[7] = &v59;
    block = MEMORY[0x1E0C809B0];
    v64 = 3221225472;
    v65 = __ubn_dispatch_sync_block_invoke;
    v66 = &unk_1E491ECB8;
    v67 = v41;
    dispatch_sync(v30, &block);
    if (!*((_DWORD *)v60 + 6))
      objc_msgSend(*(id *)(a1 + 312), "setObject:forKeyedSubscript:", v33, a3);
  }
  else
  {
    v29 = 0;
  }

  v31 = *((unsigned int *)v60 + 6);
  _Block_object_dispose(&v59, 8);
  return v31;
}

void __75__BWUBNode__inferenceProcessRedEyeReductionSampleBuffer_settings_portType___block_invoke(uint64_t a1)
{
  const void *v2;
  const void *v3;

  objc_msgSend(*(id *)(a1 + 32), "addInferenceImage:propagationImage:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = *(const void **)(a1 + 48);
  if (v2)
    CFRelease(v2);
  v3 = *(const void **)(a1 + 40);
  if (v3)
    CFRelease(v3);
}

- (uint64_t)_provideInferencesForAttachedMediaMode:(void *)a3 settings:
{
  if (a1)
  {
    if (a2 == 2)
      return -[BWUBNode _isDepthCaptureNeedingPersonSegmentationMasksWithSettings:](a1, a3);
    if (a2 == 1)
      return -[BWUBNode _isDemosaicedRawCaptureNeedingInferencesWithSettigs:](a1, a3);
  }
  return 0;
}

uint64_t __33__BWUBNode__resetProcessingState__block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "controllerForType:", 2), "cancelProcessing");
}

void __33__BWUBNode__resetProcessingState__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  const void *v3;

  objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "controllerForType:", 3), "cancelProcessing");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(const void **)(v2 + 360);
  if (v3)
  {
    CFRelease(v3);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 360) = 0;
    v2 = *(_QWORD *)(a1 + 32);
  }

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 352) = 0;
}

uint64_t __33__BWUBNode__resetProcessingState__block_invoke_3(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "controllerForType:", 8), "cancelProcessing");
}

- (void)_prepareSharedExternalMemoryResourceForProcessorControllersIfNeeded
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  os_log_type_t type;
  int v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (*(_BYTE *)(a1 + 184) && !*(_BYTE *)(a1 + 185))
    {
      v2 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 152), "controllerForType:", 6), "supportsExternalMemoryResource"))objc_msgSend(v2, "addObject:", objc_msgSend(*(id *)(a1 + 152), "controllerForType:", 6));
      if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 152), "controllerForType:", 2), "supportsExternalMemoryResource"))objc_msgSend(v2, "addObject:", objc_msgSend(*(id *)(a1 + 152), "controllerForType:", 2));
      if ((unint64_t)objc_msgSend(v2, "count") < 2)
      {
        v13 = 0;
      }
      else
      {
        v32 = 0u;
        v33 = 0u;
        v30 = 0u;
        v31 = 0u;
        v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
        if (v3)
        {
          v4 = v3;
          v5 = 0;
          v6 = 0;
          v7 = *(_QWORD *)v31;
LABEL_11:
          v8 = 0;
          while (1)
          {
            if (*(_QWORD *)v31 != v7)
              objc_enumerationMutation(v2);
            v9 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v8);
            v10 = (void *)objc_msgSend(v9, "externalMemoryDescriptor");
            if (!v10)
              goto LABEL_44;
            v11 = v10;
            if (objc_msgSend(v10, "memSize") > v6)
            {
              v6 = objc_msgSend(v11, "memSize");
              objc_msgSend(v9, "type");
            }
            v12 = objc_msgSend(v11, "allocatorType");
            if ((_DWORD)v5)
            {
              if ((_DWORD)v5 != (_DWORD)v12)
                goto LABEL_44;
            }
            else
            {
              v5 = v12;
            }
            if (objc_msgSend(v9, "type") == 6 || objc_msgSend(v9, "type") == 2)
              objc_msgSend(v11, "memSize");
            if (v4 == ++v8)
            {
              v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
              if (v4)
                goto LABEL_11;
              goto LABEL_29;
            }
          }
        }
        v5 = 0;
        LODWORD(v6) = 0;
LABEL_29:
        if (dword_1ECFE9AF0)
        {
          v29 = 0;
          type = OS_LOG_TYPE_DEFAULT;
          os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        v15 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 112), "metalCommandQueue", v22, v23), "device");
        if (!v15)
          goto LABEL_44;
        v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D08B10]), "initWithDevice:allocatorType:", v15, v5);
        if (!v13)
          goto LABEL_42;
        v16 = objc_alloc_init(MEMORY[0x1E0D08B18]);
        objc_msgSend(v16, "setMemSize:", (int)v6);
        objc_msgSend(v16, "setWireMemory:", 1);
        objc_msgSend(v16, "setLabel:", CFSTR("FigMetalAllocatorBackend-Shared-StillImage"));
        objc_msgSend(v16, "setMemoryPoolId:", -[BWMemoryPool poolIdentifier](+[BWMemoryPool sharedMemoryPool](BWMemoryPool, "sharedMemoryPool"), "poolIdentifier"));
        if (objc_msgSend(v13, "setupWithDescriptor:", v16))
          goto LABEL_42;
        v17 = objc_alloc_init(MEMORY[0x1E0D08A88]);
        *(_QWORD *)(a1 + 192) = v17;
        objc_msgSend(v17, "setAllocatorBackend:", v13);
        v26 = 0u;
        v27 = 0u;
        v24 = 0u;
        v25 = 0u;
        v18 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v25;
          do
          {
            for (i = 0; i != v19; ++i)
            {
              if (*(_QWORD *)v25 != v20)
                objc_enumerationMutation(v2);
              objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "setExternalMemoryResource:", *(_QWORD *)(a1 + 192));
            }
            v19 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
          }
          while (v19);
        }
      }
      *(_BYTE *)(a1 + 185) = 1;
LABEL_42:

      return;
    }
LABEL_44:
    v13 = 0;
    goto LABEL_42;
  }
}

- (uint64_t)_flushBufferPoolsWhenPossibleWithSettings:(uint64_t)result
{
  uint64_t v3;
  int v4;
  int v5;
  int v6;
  int v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  unint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t j;
  int v28;
  unint64_t v29;
  unsigned int v30;
  id obj;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  if (!result)
    return result;
  v3 = result;
  if ((objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureFlags") & 0x200000000) != 0)
    v4 = objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "deliverDeferredPhotoProxyImage") ^ 1;
  else
    v4 = 0;
  if ((objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureFlags") & 0x100000000) != 0)
  {
    if (objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureType") == 12)
      v5 = objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "deliverDeferredPhotoProxyImage") ^ 1;
    else
      v5 = 1;
  }
  else
  {
    v5 = 0;
  }
  if (objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureType") == 11)
  {
    objc_msgSend(*(id *)(v3 + 288), "flushToMinimumCapacity:", 0);
    objc_msgSend(*(id *)(v3 + 296), "flushToMinimumCapacity:", 0);
  }
  v6 = -[BWUBNodeConfiguration minimumOutputBufferCount](*(_QWORD *)(v3 + 112));
  if (objc_msgSend((id)objc_msgSend(a2, "requestedSettings"), "burstQualityCaptureEnabled"))
  {
    v7 = -[BWUBNodeConfiguration maxNumberOfBurstCapturesAllowedInFlight](*(_QWORD *)(v3 + 112));
    if (v6 <= v7)
      v6 = v7;
  }
  if ((objc_msgSend((id)objc_msgSend(a2, "processingSettings"), "processIntelligentDistortionCorrection") & 1) == 0)
  {
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v15 = (void *)objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "portTypes");
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v47, v54, 16);
    if (!v16)
      goto LABEL_17;
    v17 = v16;
    v18 = *(_QWORD *)v48;
LABEL_33:
    v19 = 0;
    while (1)
    {
      if (*(_QWORD *)v48 != v18)
        objc_enumerationMutation(v15);
      if ((objc_msgSend((id)v3, "idcSupportedForCaptureType:captureFlags:portType:", objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureType"), 0, *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * v19)) & 1) != 0)break;
      if (v17 == ++v19)
      {
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v47, v54, 16);
        if (v17)
          goto LABEL_33;
        goto LABEL_17;
      }
    }
  }
  v6 = *(_DWORD *)(v3 + 624);
LABEL_17:
  if (v5 && objc_msgSend((id)objc_msgSend(*(id *)(v3 + 16), "livePixelBufferPool"), "usesMemoryPool"))
    v6 = 0;
  objc_msgSend((id)objc_msgSend(*(id *)(v3 + 16), "livePixelBufferPool"), "flushToMinimumCapacity:", v6);
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v8 = *(void **)(v3 + 344);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v44 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_msgSend(*(id *)(v3 + 344), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i));
        if (objc_msgSend(v13, "usesMemoryPool"))
          objc_msgSend(v13, "flushToMinimumCapacity:", 0);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
    }
    while (v10);
  }
  if (((objc_msgSend((id)objc_msgSend(a2, "processingSettings"), "provideDemosaicedRaw") ^ 1 | v4 | v5) & 1) != 0)
    v14 = 0;
  else
    v14 = *(int *)(v3 + 628);
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(v3 + 16), "mediaPropertiesForAttachedMediaKey:", 0x1E495B0F8), "livePixelBufferPool"), "flushToMinimumCapacity:", v14);
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = *(id *)(v3 + 392);
  result = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v52, 16);
  v33 = result;
  if (result)
  {
    v32 = *(_QWORD *)v40;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v40 != v32)
          objc_enumerationMutation(obj);
        v21 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * v20);
        v35 = 0u;
        v36 = 0u;
        v37 = 0u;
        v38 = 0u;
        v34 = v21;
        v22 = (void *)objc_msgSend(*(id *)(v3 + 392), "objectForKeyedSubscript:");
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v35, v51, 16);
        if (!v23)
        {
          v25 = 0;
          goto LABEL_65;
        }
        v24 = v23;
        v25 = 0;
        v26 = *(_QWORD *)v36;
        do
        {
          for (j = 0; j != v24; ++j)
          {
            if (*(_QWORD *)v36 != v26)
              objc_enumerationMutation(v22);
            v28 = objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * j), "intValue");
            if (v28 == 2)
            {
              if (-[BWUBNode _isDepthCaptureNeedingPersonSegmentationMasksWithSettings:](v3, a2))
              {
                v30 = objc_msgSend((id)objc_msgSend(a2, "requestedSettings"), "bracketImageCount");
                if (v30)
                  v29 = v30;
                else
                  v29 = 2;
                goto LABEL_59;
              }
            }
            else if (v28 == 1)
            {
              v29 = v14;
              goto LABEL_59;
            }
            v29 = 0;
LABEL_59:
            if (v25 <= v29)
              v25 = v29;
          }
          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v35, v51, 16);
        }
        while (v24);
LABEL_65:
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(v3 + 16), "mediaPropertiesForAttachedMediaKey:", v34), "livePixelBufferPool"), "flushToMinimumCapacity:", v25);
        ++v20;
      }
      while (v20 != v33);
      result = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v52, 16);
      v33 = result;
    }
    while (result);
  }
  return result;
}

- (void)_setupDeferredProcessingWithSettings:(uint64_t)a3 portType:
{
  BWDeferredProcessorControllerInput *v6;
  _QWORD v7[5];

  if (a1)
  {
    if (objc_msgSend(*(id *)(a1 + 152), "controllerForType:", 5))
    {
      v6 = -[BWStillImageProcessorControllerInput initWithSettings:portType:]([BWDeferredProcessorControllerInput alloc], "initWithSettings:portType:", a2, a3);
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __58__BWUBNode__setupDeferredProcessingWithSettings_portType___block_invoke;
      v7[3] = &unk_1E4923398;
      v7[4] = a1;
      -[BWStillImageProcessorControllerInput addOutputSampleBufferRouter:forBufferTypes:](v6, "addOutputSampleBufferRouter:forBufferTypes:", v7, &unk_1E4A00D28);
      objc_msgSend(*(id *)(a1 + 616), "setObject:forKeyedSubscript:", v6, a3);
      objc_msgSend((id)objc_msgSend(*(id *)(a1 + 152), "controllerForType:", 5), "enqueueInputForProcessing:delegate:", v6, a1);

    }
  }
}

void __58__BWUBNode__setupDeferredProcessingWithSettings_portType___block_invoke(uint64_t a1, CMAttachmentBearerRef target, uint64_t a3, void *a4, uint64_t a5)
{
  CFTypeRef v9;
  uint64_t v10;

  if ((_DWORD)a5)
  {
    v9 = CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
    v10 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("type '%@' requested for '%@'"), BWStillImageProcessorTypeToShortString(a3), a4);
    -[BWUBNode _emitError:processorInput:metadata:description:](v10, a5, a4, (uint64_t)v9);
  }
}

- (uint64_t)_setupProcessingStateForClientBracketWithSettings:(void *)a3 processingPlan:
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  int v11;
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id *obj;
  uint64_t v20;
  id v21;
  objc_class *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[6];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v25 = (void *)objc_msgSend(*(id *)(a1 + 152), "controllerForType:", *(_QWORD *)(a1 + 208));
    if (v25)
    {
      v22 = (objc_class *)objc_opt_class();
      v5 = *(_QWORD *)(a1 + 160);
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __53__BWUBNode__standardNROutputRouterWithExpectedQueue___block_invoke;
      v31[3] = &unk_1E4923460;
      v31[4] = v5;
      v31[5] = a1;
      v21 = (id)objc_msgSend(v31, "copy");
      v6 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureStreamSettingsForPortType:", objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "masterPortType")), "unifiedBracketedCaptureParams"), "count");
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      obj = -[BWUBNode _processingOrderByPortTypeForSettings:]((id *)a1, a2);
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      if (v23)
      {
        v20 = *(_QWORD *)v28;
        while (2)
        {
          v7 = 0;
          do
          {
            if (*(_QWORD *)v28 != v20)
              objc_enumerationMutation(obj);
            v24 = v7;
            v8 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v7);
            v9 = (void *)objc_msgSend([v22 alloc], "initWithSettings:portType:", a2, v8);
            v10 = -[BWUBNode _bufferTypesForCaptureSettings:](a1, (void *)objc_msgSend(a2, "captureSettings"));
            objc_msgSend(v9, "addOutputSampleBufferRouter:forBufferTypes:", v21, v10);
            objc_msgSend(*(id *)(a1 + 224), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v9), v8);

            v11 = -[BWUBNode _processingNeededForSettings:portType:](a1, (void *)objc_msgSend(v9, "stillImageSettings"), (void *)objc_msgSend(v9, "portType"));
            if (v11)
              v12 = v6;
            else
              v12 = 1;
            objc_msgSend(v9, "setRemainingProcessingCount:", objc_msgSend(v9, "remainingProcessingCount") + v12);
            objc_msgSend(*(id *)(a1 + 512), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0C99E08], "dictionary"), v8);
            if (v6 >= 1)
            {
              v13 = 0;
              while (1)
              {
                if (v11)
                {
                  objc_msgSend(a3, "addInput:sequenceNumber:portType:bufferTypes:", v9, (v13 + 1), v8, v10);
                  v15 = -[BWUBNode _setupProcessingStateForIntelligentDistortionCorrectionIfNeededWithSettings:sequenceNumber:portType:queueProvidingInput:processingPlan:]((id *)a1, a2, (v13 + 1), v8, v14, a3);
                  if ((_DWORD)v15)
                  {
                    v17 = v15;
                    goto LABEL_24;
                  }
                  v16 = objc_msgSend(v25, "enqueueInputForProcessing:delegate:processErrorRecoveryFrame:processOriginalImage:processToneMapping:processInferenceInputImage:clientBracketSequenceNumber:processSemanticRendering:provideInferenceInputImageForProcessing:processSmartStyleRenderingInput:inferencesAvailable:", v9, a1, 0, 0, 0, 0, (v13 + 1));
                  if ((_DWORD)v16)
                    break;
                }
                if (objc_msgSend(v9, "isMaster"))
                  -[BWUBNode _setupProcessingStateForDisparityIfNeededWithSettings:sequenceNumber:processingPlan:](a1, a2, (v13 + 1), a3);
                if (v6 == ++v13)
                  goto LABEL_19;
              }
              v17 = v16;
LABEL_24:
              FigDebugAssert3();
              return v17;
            }
LABEL_19:
            v7 = v24 + 1;
          }
          while (v24 + 1 != v23);
          v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
          if (v23)
            continue;
          break;
        }
      }
    }
  }
  return 0;
}

- (uint64_t)_setupProcessingStateForFlashCaptureWithSettings:(void *)a3 processingPlan:
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  BWLearnedNRInput *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  BWRedEyeReductionControllerInput *v20;
  uint64_t v22;
  void *v23;
  char v24;
  void *v25;
  unint64_t v26;
  char v27;
  id v28;
  void *v29;
  id *obj;
  id v31;
  int v32;
  uint64_t v33;
  objc_class *v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _QWORD v40[5];
  _QWORD v41[5];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v29 = (void *)objc_msgSend(*(id *)(a1 + 152), "controllerForType:", *(_QWORD *)(a1 + 208));
  if (!v29)
    return 0;
  v34 = (objc_class *)objc_opt_class();
  v6 = objc_msgSend(*(id *)(a1 + 152), "controllerForType:", 11);
  v7 = MEMORY[0x1E0C809B0];
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __76__BWUBNode__setupProcessingStateForFlashCaptureWithSettings_processingPlan___block_invoke;
  v41[3] = &unk_1E4923398;
  v41[4] = a1;
  v28 = -[BWUBNode _standardNROutputRouterWithExpectedQueue:]((id)a1, *(_QWORD *)(a1 + 160));
  v31 = -[BWUBNode _bufferTypesForCaptureSettings:](a1, (void *)objc_msgSend(a2, "captureSettings"));
  v40[0] = v7;
  v40[1] = 3221225472;
  v40[2] = __76__BWUBNode__setupProcessingStateForFlashCaptureWithSettings_processingPlan___block_invoke_2;
  v40[3] = &unk_1E4923398;
  v40[4] = a1;
  v8 = (void *)objc_msgSend(*(id *)(a1 + 152), "controllerForType:", 4);
  v9 = -[BWUBNode _isSemanticRenderingCapture:](a1, a2);
  v32 = -[BWUBNode _isInferenceInputImageRequiredForSettings:](a1, a2);
  -[BWUBNode _inferencesRequiredForSettings:](a1, a2);
  v27 = -[BWUBNode _inferencesRequiredByProcessorControllersForSettings:](a1, a2);
  v25 = (void *)v6;
  if (*(_QWORD *)(a1 + 400))
    v26 = ((unint64_t)objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureFlags") >> 16) & 1;
  else
    LODWORD(v26) = 0;
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = -[BWUBNode _processingOrderByPortTypeForSettings:]((id *)a1, a2);
  v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
  if (v35)
  {
    v33 = *(_QWORD *)v37;
    v24 = v9;
    v23 = a2;
    while (2)
    {
      for (i = 0; i != v35; ++i)
      {
        if (*(_QWORD *)v37 != v33)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
        v12 = (void *)objc_msgSend([v34 alloc], "initWithSettings:portType:", a2, v11);
        objc_msgSend(*(id *)(a1 + 224), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v12), v11);
        objc_msgSend(v12, "setRemainingProcessingCount:", objc_msgSend(v12, "remainingProcessingCount") + 1);

        if (-[BWUBNode _processingNeededForSettings:portType:](a1, (void *)objc_msgSend(v12, "stillImageSettings"), (void *)objc_msgSend(v12, "portType")))
        {
          if ((objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureFlags") & 0x80) != 0)
          {
            if (!v25)
              return 4294954516;
            v13 = -[BWStillImageProcessorControllerInput initWithSettings:portType:]([BWLearnedNRInput alloc], "initWithSettings:portType:", a2, objc_msgSend(v12, "portType"));
            -[BWStillImageProcessorControllerInput addOutputSampleBufferRouter:forBufferTypes:](v13, "addOutputSampleBufferRouter:forBufferTypes:", v41, v31);
            objc_msgSend(a3, "addInput:sequenceNumber:portType:bufferTypes:", v13, 0, objc_msgSend(v12, "portType"), v31);
            objc_msgSend(*(id *)(a1 + 256), "setObject:forKeyedSubscript:", v13, -[BWStillImageProcessorControllerInput portType](v13, "portType"));
            v14 = objc_msgSend(v25, "enqueueInputForProcessing:delegate:", v13, a1);

            a2 = v23;
            v9 = v24;
            if ((_DWORD)v14)
              return v14;
          }
          if (v32)
          {
            objc_msgSend(v12, "addOutputSampleBufferRouter:forBufferTypes:", -[BWUBNode _ubInferenceInputRouter]((id)a1), &unk_1E4A00D70);
            objc_msgSend(a3, "addInput:sequenceNumber:portType:bufferType:", v12, 0, v11, 15);
          }
          objc_msgSend(v12, "addOutputSampleBufferRouter:forBufferTypes:", v28, v31);
          objc_msgSend(a3, "addInput:sequenceNumber:portType:bufferTypes:", v12, 0, v11, v31);
          HIBYTE(v22) = v27;
          *(_WORD *)((char *)&v22 + 5) = v32;
          BYTE4(v22) = v9;
          LODWORD(v22) = 0;
          v15 = objc_msgSend(v29, "enqueueInputForProcessing:delegate:processErrorRecoveryFrame:processOriginalImage:processToneMapping:processInferenceInputImage:clientBracketSequenceNumber:processSemanticRendering:provideInferenceInputImageForProcessing:processSmartStyleRenderingInput:inferencesAvailable:", v12, a1, 0, 0, 0, 0, v22);
          if ((_DWORD)v15)
          {
            v14 = v15;
LABEL_31:
            FigDebugAssert3();
            return v14;
          }
          v17 = -[BWUBNode _setupProcessingStateForIntelligentDistortionCorrectionIfNeededWithSettings:sequenceNumber:portType:queueProvidingInput:processingPlan:]((id *)a1, a2, 0, v11, v16, a3);
          if ((_DWORD)v17)
          {
            v14 = v17;
            goto LABEL_31;
          }
          v19 = -[BWUBNode _setupProcessingStateForDeepZoomWithSettings:sequenceNumber:portType:queueProvidingInput:processingPlan:](a1, a2, 0, v11, v18, a3);
          if ((_DWORD)v19)
          {
            v14 = v19;
            goto LABEL_31;
          }
          if ((_DWORD)v26)
          {
            if (!v8)
              return 4294954516;
            v20 = -[BWStillImageProcessorControllerInput initWithSettings:portType:]([BWRedEyeReductionControllerInput alloc], "initWithSettings:portType:", a2, v11);
            -[BWStillImageProcessorControllerInput addOutputSampleBufferRouter:forBufferTypes:](v20, "addOutputSampleBufferRouter:forBufferTypes:", v40, &unk_1E4A00D88);
            objc_msgSend(a3, "addInput:sequenceNumber:portType:bufferTypes:", v20, 0, v11, &unk_1E4A00D88);
            objc_msgSend(*(id *)(a1 + 408), "setObject:forKeyedSubscript:", v20, v11);
            v14 = objc_msgSend(v8, "enqueueInputForProcessing:delegate:", v20, a1);

            if ((_DWORD)v14)
              return v14;
          }
        }
      }
      v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
      if (v35)
        continue;
      break;
    }
  }
  -[BWUBNode _setupProcessingStateForJasperDisparityIfNeededWithSettings:processingPlan:](a1, a2, a3);
  return -[BWUBNode _setupProcessingStateForDisparityIfNeededWithSettings:sequenceNumber:processingPlan:](a1, a2, 0, a3);
}

- (uint64_t)_setupProcessingStateForSingleImageCaptureWithSettings:(void *)a3 processingPlan:
{
  objc_class *v6;
  id *v7;
  id *v8;
  void *v9;
  id *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  BWLearnedNRInput *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  BWLearnedNRInput *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v38;
  void *v39;
  char v40;
  id v41;
  void *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id obj;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _QWORD v56[5];
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v45 = objc_msgSend(*(id *)(a1 + 152), "controllerForType:", *(_QWORD *)(a1 + 208));
  if (!v45)
    return 0;
  v39 = a3;
  v6 = (objc_class *)objc_opt_class();
  v42 = (void *)objc_msgSend(*(id *)(a1 + 152), "controllerForType:", 11);
  v56[0] = MEMORY[0x1E0C809B0];
  v56[1] = 3221225472;
  v56[2] = __82__BWUBNode__setupProcessingStateForSingleImageCaptureWithSettings_processingPlan___block_invoke;
  v56[3] = &unk_1E4923398;
  v56[4] = a1;
  v41 = -[BWUBNode _standardNROutputRouterWithExpectedQueue:]((id)a1, *(_QWORD *)(a1 + 160));
  obj = (id)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v43 = -[BWUBNode _bufferTypesForCaptureSettings:](a1, (void *)objc_msgSend(a2, "captureSettings"));
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v7 = (id *)a1;
  v8 = (id *)a1;
  v9 = a2;
  v10 = -[BWUBNode _processingOrderByPortTypeForSettings:](v8, a2);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v53;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v53 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * i);
        v16 = (void *)objc_msgSend([v6 alloc], "initWithSettings:portType:", v9, v15);
        objc_msgSend(v7[28], "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v16), v15);
        objc_msgSend(obj, "addObject:", v16);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
    }
    while (v12);
  }
  v17 = v9;
  if ((-[BWUBNode _isSemanticRenderingCapture:]((uint64_t)v7, v9) & 1) != 0)
    v18 = 1;
  else
    v18 = objc_msgSend(v7[14], "deferredPhotoProcessorEnabled");
  v19 = (void *)v45;
  v20 = -[BWUBNode _isInferenceInputImageRequiredForSettings:]((uint64_t)v7, v9);
  if ((-[BWUBNode _inferencesRequiredByProcessorControllersForSettings:]((uint64_t)v7, v9) & 1) != 0)
    v40 = 1;
  else
    v40 = objc_msgSend(v7[14], "deferredPhotoProcessorEnabled");
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
  if (v46)
  {
    v44 = *(_QWORD *)v49;
    while (2)
    {
      for (j = 0; j != v46; ++j)
      {
        if (*(_QWORD *)v49 != v44)
          objc_enumerationMutation(obj);
        v22 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * j);
        if (-[BWUBNode _processingNeededForSettings:portType:]((uint64_t)v7, (void *)objc_msgSend(v22, "stillImageSettings"), (void *)objc_msgSend(v22, "portType")))
        {
          if ((objc_msgSend((id)objc_msgSend(v17, "captureSettings"), "captureFlags") & 0x80) != 0)
          {
            if (!v42)
              return 4294954516;
            v23 = -[BWStillImageProcessorControllerInput initWithSettings:portType:]([BWLearnedNRInput alloc], "initWithSettings:portType:", v17, objc_msgSend(v22, "portType"));
            v24 = v17;
            v25 = v20;
            v26 = v19;
            v27 = v18;
            v28 = v23;
            -[BWStillImageProcessorControllerInput addOutputSampleBufferRouter:forBufferTypes:](v23, "addOutputSampleBufferRouter:forBufferTypes:", v56, v43);
            objc_msgSend(v39, "addInput:sequenceNumber:portType:bufferTypes:", v28, 0, objc_msgSend(v22, "portType"), v43);
            objc_msgSend(v7[32], "setObject:forKeyedSubscript:", v28, -[BWStillImageProcessorControllerInput portType](v28, "portType"));
            v29 = objc_msgSend(v42, "enqueueInputForProcessing:delegate:", v28, v7);

            v18 = v27;
            v19 = v26;
            v20 = v25;
            v17 = v24;
            if ((_DWORD)v29)
              return v29;
          }
          if ((_DWORD)v20)
          {
            objc_msgSend(v22, "addOutputSampleBufferRouter:forBufferTypes:", -[BWUBNode _ubInferenceInputRouter](v7), &unk_1E4A00D58);
            objc_msgSend(v39, "addInput:sequenceNumber:portType:bufferType:", v22, 0, objc_msgSend(v22, "portType"), 15);
          }
          objc_msgSend(v22, "addOutputSampleBufferRouter:forBufferTypes:", v41, v43);
          objc_msgSend(v39, "addInput:sequenceNumber:portType:bufferTypes:", v22, 0, objc_msgSend(v22, "portType"), v43);
          HIBYTE(v38) = v40;
          *(_WORD *)((char *)&v38 + 5) = v20;
          BYTE4(v38) = v18;
          LODWORD(v38) = 0;
          v30 = objc_msgSend(v19, "enqueueInputForProcessing:delegate:processErrorRecoveryFrame:processOriginalImage:processToneMapping:processInferenceInputImage:clientBracketSequenceNumber:processSemanticRendering:provideInferenceInputImageForProcessing:processSmartStyleRenderingInput:inferencesAvailable:", v22, v7, 0, 0, 0, 0, v38);
          if ((_DWORD)v30)
          {
            v29 = v30;
LABEL_38:
            FigDebugAssert3();
            return v29;
          }
          v31 = objc_msgSend(v22, "portType");
          v33 = -[BWUBNode _setupProcessingStateForIntelligentDistortionCorrectionIfNeededWithSettings:sequenceNumber:portType:queueProvidingInput:processingPlan:](v7, v17, 0, v31, v32, v39);
          if ((_DWORD)v33)
          {
            v29 = v33;
            goto LABEL_38;
          }
          v34 = objc_msgSend(v22, "portType");
          v36 = -[BWUBNode _setupProcessingStateForDeepZoomWithSettings:sequenceNumber:portType:queueProvidingInput:processingPlan:]((uint64_t)v7, v17, 0, v34, v35, v39);
          if ((_DWORD)v36)
          {
            v29 = v36;
            goto LABEL_38;
          }
          -[BWUBNode _setupDeferredProcessingWithSettings:portType:]((uint64_t)v7, (uint64_t)v17, objc_msgSend(v22, "portType"));
        }
        objc_msgSend(v22, "setRemainingProcessingCount:", objc_msgSend(v22, "remainingProcessingCount") + 1);
      }
      v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
      if (v46)
        continue;
      break;
    }
  }
  -[BWUBNode _setupProcessingStateForJasperDisparityIfNeededWithSettings:processingPlan:]((uint64_t)v7, v17, v39);
  return -[BWUBNode _setupProcessingStateForDisparityIfNeededWithSettings:sequenceNumber:processingPlan:]((_BOOL8)v7, v17, 0, v39);
}

- (uint64_t)_setupProcessingStateForDeferredCaptureIfNeededWithSettings:(uint64_t)a1
{
  void *v4;
  void *v5;
  BWDeferredCaptureControllerInput *v6;
  uint64_t v7;

  if (!a1
    || !objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "deliverDeferredPhotoProxyImage")
    || *(_QWORD *)(a1 + 584))
  {
    return 0;
  }
  v4 = (void *)objc_msgSend(*(id *)(a1 + 152), "controllerForType:", 14);
  if (!v4)
    return 4294950488;
  v5 = v4;
  v6 = -[BWDeferredCaptureControllerInput initWithSettings:configuration:sourceNodePixelBufferAttributes:]([BWDeferredCaptureControllerInput alloc], "initWithSettings:configuration:sourceNodePixelBufferAttributes:", a2, objc_msgSend(v4, "configuration"), objc_msgSend((id)objc_msgSend(*(id *)(a1 + 8), "videoFormat"), "pixelBufferAttributes"));
  -[BWDeferredPipelineParameters setNoiseReductionAndFusionScheme:](-[BWDeferredCaptureControllerInput pipelineParameters](v6, "pipelineParameters"), "setNoiseReductionAndFusionScheme:", -[BWUBNodeConfiguration stillImageFusionScheme](*(_QWORD *)(a1 + 112)));
  -[BWDeferredPipelineParameters setNrfVersion:](-[BWDeferredCaptureControllerInput pipelineParameters](v6, "pipelineParameters"), "setNrfVersion:", -[FigCaptureCameraParameters nrfVersion](+[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance"), "nrfVersion"));
  v7 = objc_msgSend(v5, "enqueueInputForProcessing:delegate:", v6, a1);

  if (!(_DWORD)v7)
    *(_QWORD *)(a1 + 584) = v6;
  return v7;
}

- (id)_nrOutputSbufRouter
{
  _QWORD v1[5];

  if (result)
  {
    v1[0] = MEMORY[0x1E0C809B0];
    v1[1] = 3221225472;
    v1[2] = __31__BWUBNode__nrOutputSbufRouter__block_invoke;
    v1[3] = &unk_1E4923398;
    v1[4] = result;
    return (id)objc_msgSend(v1, "copy");
  }
  return result;
}

- (uint64_t)_setupProcessingStateForDeepZoomWithSettings:(uint64_t)a3 sequenceNumber:(uint64_t)a4 portType:(uint64_t)a5 queueProvidingInput:(void *)a6 processingPlan:
{
  uint64_t v6;
  id *v11;
  int v12;
  char v13;
  int v14;
  int v15;
  BWDeepZoomProcessorInput *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id *v33;
  id obj;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _QWORD v43[6];
  void *v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v11 = (id *)result;
    if (!_FigIsCurrentDispatchQueue())
    {
      v31 = v6;
      LODWORD(v30) = 0;
      FigDebugAssert3();
    }
    if (!v11[58] || (objc_msgSend((id)objc_msgSend(a2, "requestedSettings"), "bypassUpscaling") & 1) != 0)
      return 0;
    v12 = objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureType");
    v13 = objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureFlags");
    v14 = objc_msgSend(v11[58], "type");
    v15 = v14;
    if (v12 == 1)
    {
      result = 0;
      if ((v13 & 0x80) == 0 || v15 != 2)
        return result;
    }
    else if (v12 != 12 || v14 != 1)
    {
      return 0;
    }
    v32 = (void *)objc_msgSend(v11[19], "controllerForType:", 10, v30, v31);
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __116__BWUBNode__setupProcessingStateForDeepZoomWithSettings_sequenceNumber_portType_queueProvidingInput_processingPlan___block_invoke;
    v43[3] = &unk_1E4923460;
    v43[4] = v11;
    v43[5] = a4;
    v16 = -[BWStillImageProcessorControllerInput initWithSettings:portType:]([BWDeepZoomProcessorInput alloc], "initWithSettings:portType:", a2, a4);
    v17 = -[BWUBNode _bufferTypesExcludingErrorRecoveryTypesForCaptureSettings:](v11, (void *)objc_msgSend(a2, "captureSettings"));
    v33 = v11;
    obj = -[BWUBNode _errorRecoveryBufferTypesForBufferTypes:](v11, v17);
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v40;
      while (2)
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v40 != v20)
            objc_enumerationMutation(v17);
          v22 = (int)objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * i), "intValue");
          v23 = (void *)objc_msgSend(a6, "lastAddedInputForSequenceNumber:portType:bufferType:", a3, a4, v22);
          if (v23)
          {
            if (!ubn_insertOutputRouterForInputAfterPreviousInputForBufferType((uint64_t)v43, v16, v23, v22))return 4294954516;
            objc_msgSend(a6, "addInput:sequenceNumber:portType:bufferType:", v16, a3, a4, v22);
          }
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
        if (v19)
          continue;
        break;
      }
    }
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v36;
      do
      {
        for (j = 0; j != v25; ++j)
        {
          if (*(_QWORD *)v36 != v26)
            objc_enumerationMutation(obj);
          v28 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * j);
          v29 = (void *)objc_msgSend(a6, "lastAddedInputForSequenceNumber:portType:bufferType:", a3, a4, (int)objc_msgSend(v28, "intValue"));
          v44 = v28;
          objc_msgSend(v29, "addBypassedProcessorType:forBufferTypes:", 10, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v44, 1));
        }
        v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
      }
      while (v25);
    }
    objc_msgSend(v33[59], "setObject:forKeyedSubscript:", v16, a4);

    return objc_msgSend(v32, "enqueueInputForProcessing:delegate:", v16, v33);
  }
  return result;
}

- (uint64_t)_setupProcessingStateForDisparityIfNeededWithSettings:(uint64_t)a3 sequenceNumber:(void *)a4 processingPlan:
{
  uint64_t v4;
  uint64_t v8;
  BWStereoDisparityProcessorInput *v9;
  _QWORD *v10;
  uint64_t v11;
  NSObject *v12;
  _QWORD v14[8];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  int v18;
  uint64_t block;
  uint64_t v20;
  void *v21;
  void *v22;
  _QWORD *v23;
  uint64_t v24;

  v4 = a1;
  if (a1)
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x2020000000;
    v18 = 0;
    if (-[BWUBNode _generateDisparityForSettings:](a1, a2))
    {
      v8 = objc_msgSend(*(id *)(v4 + 152), "controllerForType:", 8);
      if (v8)
      {
        v9 = -[BWStereoDisparityProcessorInput initWithSettings:portType:]([BWStereoDisparityProcessorInput alloc], "initWithSettings:portType:", a2, objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "masterPortType"));
        ++*(_DWORD *)(v4 + 496);
        v10 = *(_QWORD **)(v4 + 504);
        v11 = MEMORY[0x1E0C809B0];
        block = MEMORY[0x1E0C809B0];
        v20 = 3221225472;
        v21 = __53__BWUBNode__standardNROutputRouterWithExpectedQueue___block_invoke;
        v22 = &unk_1E4923460;
        v23 = v10;
        v24 = v4;
        -[BWStillImageProcessorControllerInput addOutputSampleBufferRouter:forBufferTypes:](v9, "addOutputSampleBufferRouter:forBufferTypes:", (id)objc_msgSend(&block, "copy"), &unk_1E4A00DB8);
        objc_msgSend(a4, "addInput:sequenceNumber:portType:bufferType:", v9, a3, objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "masterPortType"), 20);
        if (objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureType") == 7)
          objc_msgSend(*(id *)(v4 + 520), "setObject:forKeyedSubscript:", v9, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a3));
        else
          *(_QWORD *)(v4 + 488) = v9;
        v12 = *(NSObject **)(v4 + 504);
        v14[0] = v11;
        v14[1] = 3221225472;
        v14[2] = __96__BWUBNode__setupProcessingStateForDisparityIfNeededWithSettings_sequenceNumber_processingPlan___block_invoke;
        v14[3] = &unk_1E49233C0;
        v14[4] = v8;
        v14[5] = v9;
        v14[6] = v4;
        v14[7] = &v15;
        block = v11;
        v20 = 3221225472;
        v21 = __ubn_dispatch_sync_block_invoke;
        v22 = &unk_1E491ECB8;
        v23 = v14;
        dispatch_sync(v12, &block);
      }
    }
    v4 = *((unsigned int *)v16 + 6);
    _Block_object_dispose(&v15, 8);
  }
  return v4;
}

- (uint64_t)_setupProcessingStateForDeepFusionWithSettings:(void *)a3 processingPlan:
{
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  BWDeepFusionProcessorInput *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id obj;
  _QWORD v27[8];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[5];
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  int v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 0;
  v6 = objc_msgSend(a1[19], "controllerForType:", 2);
  if (!_FigIsCurrentDispatchQueue())
  {
    v24 = v25;
    LODWORD(v23) = 0;
    FigDebugAssert3();
  }
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __74__BWUBNode__setupProcessingStateForDeepFusionWithSettings_processingPlan___block_invoke;
  v32[3] = &unk_1E4923398;
  v32[4] = a1;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v7 = (void *)objc_msgSend((id)objc_msgSend(a2, "captureSettings", v23, v24), "captureStreamSettings");
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
  obj = v7;
  if (v8)
  {
    v9 = *(_QWORD *)v29;
LABEL_6:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v29 != v9)
        objc_enumerationMutation(obj);
      v11 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v10);
      v12 = -[BWDeepFusionProcessorInput initWithSettings:portType:processInferenceInputImage:processQuadraForEnhancedResolutionInferenceInputImage:processSmartStyleRenderingInput:]([BWDeepFusionProcessorInput alloc], "initWithSettings:portType:processInferenceInputImage:processQuadraForEnhancedResolutionInferenceInputImage:processSmartStyleRenderingInput:", a2, objc_msgSend(v11, "portType"), 0, 0, 0);
      v13 = -[BWUBNode _bufferTypesForCaptureSettings:]((uint64_t)a1, (void *)objc_msgSend(a2, "captureSettings"));
      -[BWStillImageProcessorControllerInput addOutputSampleBufferRouter:forBufferTypes:](v12, "addOutputSampleBufferRouter:forBufferTypes:", v32, v13);
      objc_msgSend(a3, "addInput:sequenceNumber:portType:bufferTypes:", v12, 0, objc_msgSend(v11, "portType"), v13);
      objc_msgSend(a1[34], "setObject:forKeyedSubscript:", v12, -[BWStillImageProcessorControllerInput portType](v12, "portType"));
      v14 = (void *)objc_msgSend((id)objc_msgSend(a1[28], "objectForKeyedSubscript:", -[BWStillImageProcessorControllerInput portType](v12, "portType")), "firstObject");
      objc_msgSend(v14, "setRemainingProcessingCount:", objc_msgSend(v14, "remainingProcessingCount") + 1);
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __74__BWUBNode__setupProcessingStateForDeepFusionWithSettings_processingPlan___block_invoke_2;
      v27[3] = &unk_1E49233C0;
      v27[4] = v6;
      v27[5] = v12;
      v27[6] = a1;
      v27[7] = &v33;
      -[BWUBNode _deepFusionDispatch:direction:block:]((uint64_t)a1, 1, 1, (uint64_t)v27);
      if (*((_DWORD *)v34 + 6))
        break;
      v15 = -[BWStillImageProcessorControllerInput portType](v12, "portType");
      v17 = -[BWUBNode _setupProcessingStateForIntelligentDistortionCorrectionIfNeededWithSettings:sequenceNumber:portType:queueProvidingInput:processingPlan:](a1, a2, 0, v15, v16, a3);
      *((_DWORD *)v34 + 6) = v17;
      if (v17
        || (v18 = -[BWStillImageProcessorControllerInput portType](v12, "portType"),
            v20 = -[BWUBNode _setupProcessingStateForDeepZoomWithSettings:sequenceNumber:portType:queueProvidingInput:processingPlan:]((uint64_t)a1, a2, 0, v18, v19, a3), (*((_DWORD *)v34 + 6) = v20) != 0))
      {
        FigDebugAssert3();
        break;
      }
      if (v8 == ++v10)
      {
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
        if (v8)
          goto LABEL_6;
        break;
      }
    }
  }
  v21 = *((unsigned int *)v34 + 6);
  _Block_object_dispose(&v33, 8);
  return v21;
}

- (uint64_t)_setupProcessingStateForPointCloudDepthIfNeededWithSettings:(void *)a3 processingPlan:
{
  uint64_t v3;
  id *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  BWJasperColorStillsExecutorInput *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  id obj;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _QWORD v46[6];
  _BYTE v47[128];
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v6 = (id *)result;
    if (!_FigIsCurrentDispatchQueue())
    {
      v27 = v3;
      LODWORD(v26) = 0;
      FigDebugAssert3();
    }
    if ((objc_msgSend((id)objc_msgSend(a2, "captureSettings", v26, v27), "captureFlags") & 0x200) != 0)
    {
      result = objc_msgSend(v6[19], "controllerForType:", 9);
      if (result)
      {
        v7 = (void *)result;
        v8 = -[BWUBNode _bufferTypesForCaptureSettings:]((uint64_t)v6, (void *)objc_msgSend(a2, "captureSettings"));
        v46[0] = MEMORY[0x1E0C809B0];
        v46[1] = 3221225472;
        v46[2] = __87__BWUBNode__setupProcessingStateForPointCloudDepthIfNeededWithSettings_processingPlan___block_invoke;
        v46[3] = &unk_1E4923460;
        v46[4] = v6;
        v46[5] = v7;
        v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v42 = 0u;
        v43 = 0u;
        v44 = 0u;
        v45 = 0u;
        obj = (id)objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "portTypes");
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v49, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v43;
          v28 = *(_QWORD *)v43;
          v29 = a2;
          v31 = v9;
          do
          {
            v13 = 0;
            v30 = v11;
            do
            {
              if (*(_QWORD *)v43 != v12)
                objc_enumerationMutation(obj);
              v14 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v13);
              if (-[BWUBNode _processingNeededForSettings:portType:]((uint64_t)v6, a2, v14))
              {
                v33 = v13;
                v15 = -[BWJasperColorStillsExecutorInput initWithSettings:portType:timeOfFlightCameraType:]([BWJasperColorStillsExecutorInput alloc], "initWithSettings:portType:timeOfFlightCameraType:", a2, v14, objc_msgSend((id)objc_msgSend(v6[13], "supplementalPointCloudCaptureDevice"), "timeOfFlightCameraType"));
                v38 = 0u;
                v39 = 0u;
                v40 = 0u;
                v41 = 0u;
                v16 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
                if (v16)
                {
                  v17 = v16;
                  v18 = *(_QWORD *)v39;
                  while (2)
                  {
                    for (i = 0; i != v17; ++i)
                    {
                      if (*(_QWORD *)v39 != v18)
                        objc_enumerationMutation(v8);
                      v20 = (int)objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * i), "intValue");
                      v21 = (void *)objc_msgSend(a3, "lastAddedInputForSequenceNumber:portType:bufferType:", 0, v14, v20);
                      if (v21)
                      {
                        if (!ubn_insertOutputRouterForInputAfterPreviousInputForBufferType((uint64_t)v46, v15, v21, v20))return 4294954516;
                        objc_msgSend(a3, "addInput:sequenceNumber:portType:bufferType:", v15, 0, v14, v20);
                      }
                    }
                    v17 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
                    if (v17)
                      continue;
                    break;
                  }
                }
                a2 = v29;
                if (objc_msgSend(v14, "isEqualToString:", objc_msgSend((id)objc_msgSend(v29, "captureSettings"), "masterPortType")))objc_msgSend(v31, "insertObject:atIndex:", v15, 0);
                else
                  objc_msgSend(v31, "addObject:", v15);
                v12 = v28;
                v11 = v30;
                v13 = v33;
              }
              ++v13;
            }
            while (v13 != v11);
            v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v49, 16);
            v9 = v31;
          }
          while (v11);
        }
        v36 = 0u;
        v37 = 0u;
        v34 = 0u;
        v35 = 0u;
        result = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v47, 16);
        if (result)
        {
          v22 = result;
          v23 = *(_QWORD *)v35;
          do
          {
            v24 = 0;
            do
            {
              if (*(_QWORD *)v35 != v23)
                objc_enumerationMutation(v9);
              v25 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v24);
              objc_msgSend(v7, "enqueueInputForProcessing:delegate:", v25, v6);
              objc_msgSend(v6[69], "setObject:forKeyedSubscript:", v25, objc_msgSend(v25, "portType"));
              ++v24;
            }
            while (v22 != v24);
            result = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v47, 16);
            v22 = result;
          }
          while (result);
        }
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

void __74__BWUBNode__setupProcessingStateForDeepFusionWithSettings_processingPlan___block_invoke(uint64_t a1, const void *a2, uint64_t a3, uint64_t a4, int a5)
{
  uint64_t v6;
  uint64_t v7;

  if (!a5)
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("buffer of type '%@' requested for '%@'"), BWStillImageProcessorTypeToShortString(a3), a4);
    -[BWUBNode _emitSampleBuffer:description:](v6, a2, v7);
  }
}

void __74__BWUBNode__setupProcessingStateForDeepFusionWithSettings_processingPlan___block_invoke_2(uint64_t a1)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "enqueueInputForProcessing:delegate:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (id)_processingOrderByPortTypeForSettings:(id *)result
{
  id *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = result;
    v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = (void *)objc_msgSend((id)objc_msgSend(a2, "captureSettings", 0), "portTypes");
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
          if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureStreamSettingsForPortType:", v10), "hasValidFrames")&& objc_msgSend(v3[15], "containsObject:", v10))
          {
            if (objc_msgSend(v10, "isEqualToString:", objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "masterPortType")))objc_msgSend(v4, "insertObject:atIndex:", v10, 0);
            else
              objc_msgSend(v4, "addObject:", v10);
          }
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }
    return (id *)(id)objc_msgSend(v4, "copy");
  }
  return result;
}

void __82__BWUBNode__setupProcessingStateForSingleImageCaptureWithSettings_processingPlan___block_invoke(uint64_t a1, const void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  uint64_t v5;
  id v11;
  int v12;
  void *v13;
  CFTypeRef v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  if (!_FigIsCurrentDispatchQueue())
  {
    v17 = v5;
    LODWORD(v16) = 0;
    FigDebugAssert3();
  }
  v11 = (id)objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 224), "objectForKeyedSubscript:", objc_msgSend(a4, "portType", v16, v17)), "firstObject");
  v12 = a5;
  if (a2)
  {
    if ((_DWORD)a5)
    {
      v13 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "controllerForType:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 208));
      objc_msgSend(v13, "cancelProcessing");
      v12 = objc_msgSend(v13, "enqueueInputForProcessing:delegate:processErrorRecoveryFrame:processOriginalImage:processToneMapping:processInferenceInputImage:clientBracketSequenceNumber:processSemanticRendering:provideInferenceInputImageForProcessing:processSmartStyleRenderingInput:inferencesAvailable:", v11, *(_QWORD *)(a1 + 32), 1, 0, 0, 0, 0);
    }
    else
    {
      v12 = 0;
    }
    objc_msgSend(v11, "addFrame:", a2);
    -[BWUBNode _handleReferenceFrameEmissionForProcessorInput:](*(_QWORD *)(a1 + 32), v11);
  }
  if (v12)
  {
    v14 = CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
    -[BWUBNode _processorControllerDidFinishProcessingInputForPortType:processorType:](*(_QWORD *)(a1 + 32), objc_msgSend(v11, "portType"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 208));
    v15 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("type '%@' requested for '%@'"), BWStillImageProcessorTypeToShortString(a3), a4);
    -[BWUBNode _emitError:processorInput:metadata:description:](v15, a5, a4, (uint64_t)v14);
  }
}

void __76__BWUBNode__setupProcessingStateForFlashCaptureWithSettings_processingPlan___block_invoke(uint64_t a1, const void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  uint64_t v5;
  id v11;
  int v12;
  void *v13;
  CFTypeRef v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  if (!_FigIsCurrentDispatchQueue())
  {
    v17 = v5;
    LODWORD(v16) = 0;
    FigDebugAssert3();
  }
  v11 = (id)objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 224), "objectForKeyedSubscript:", objc_msgSend(a4, "portType", v16, v17)), "firstObject");
  v12 = a5;
  if (a2)
  {
    if ((_DWORD)a5)
    {
      v13 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "controllerForType:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 208));
      objc_msgSend(v13, "cancelProcessing");
      v12 = objc_msgSend(v13, "enqueueInputForProcessing:delegate:processErrorRecoveryFrame:processOriginalImage:processToneMapping:processInferenceInputImage:clientBracketSequenceNumber:processSemanticRendering:provideInferenceInputImageForProcessing:processSmartStyleRenderingInput:inferencesAvailable:", v11, *(_QWORD *)(a1 + 32), 1, 0, 0, 0, 0);
    }
    else
    {
      v12 = 0;
    }
    objc_msgSend(v11, "addFrame:", a2);
    -[BWUBNode _handleReferenceFrameEmissionForProcessorInput:](*(_QWORD *)(a1 + 32), v11);
  }
  if (v12)
  {
    v14 = CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
    -[BWUBNode _processorControllerDidFinishProcessingInputForPortType:processorType:](*(_QWORD *)(a1 + 32), objc_msgSend(v11, "portType"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 208));
    v15 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("type '%@' requested for '%@'"), BWStillImageProcessorTypeToShortString(a3), a4);
    -[BWUBNode _emitError:processorInput:metadata:description:](v15, a5, a4, (uint64_t)v14);
  }
}

void __76__BWUBNode__setupProcessingStateForFlashCaptureWithSettings_processingPlan___block_invoke_2(uint64_t a1, const void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  CFTypeRef v11;
  uint64_t v12;
  id *v13;

  if (!_FigIsCurrentDispatchQueue())
    FigDebugAssert3();
  if (dword_1ECFE9AF0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if ((_DWORD)a5)
  {
    v11 = CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
    v12 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("type '%@' requested for '%@'"), BWStillImageProcessorTypeToShortString(a3), a4);
    -[BWUBNode _emitError:processorInput:metadata:description:](v12, a5, a4, (uint64_t)v11);
  }
  else
  {
    v13 = -[BWUBNode _nextNRInputForPortType:](*(id **)(a1 + 32), objc_msgSend(a4, "portType"));
    objc_msgSend(v13, "addFrame:", a2);
    -[BWUBNode _handleReferenceFrameEmissionForProcessorInput:](*(_QWORD *)(a1 + 32), v13);
  }
}

- (id)_nextNRInputForPortType:(id *)result
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v2 = (void *)objc_msgSend(result[28], "objectForKeyedSubscript:", a2, 0);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v9;
LABEL_4:
      v6 = 0;
      while (1)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if (!objc_msgSend(v7, "receivedAllFrames")
          || objc_msgSend(v7, "remainingProcessingCount") > 1)
        {
          break;
        }
        if (v4 == ++v6)
        {
          v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
          v7 = 0;
          if (v4)
            goto LABEL_4;
          return (id *)v7;
        }
      }
    }
    else
    {
      v7 = 0;
    }
    return (id *)v7;
  }
  return result;
}

- (id)_bufferTypesExcludingErrorRecoveryTypesForCaptureSettings:(id)result
{
  void *v2;
  void *v3;

  if (result)
  {
    v2 = result;
    v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", -[BWUBNode _bufferTypesForCaptureSettings:]((uint64_t)result, a2));
    objc_msgSend(v3, "removeObjectsInArray:", -[BWUBNode _errorRecoveryBufferTypesForBufferTypes:](v2, v3));
    return (id)objc_msgSend(v3, "copy");
  }
  return result;
}

- (id)_errorRecoveryBufferTypesForBufferTypes:(id)result
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  int v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v4 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (!v4)
      return (id)objc_msgSend(v3, "copy");
    v5 = v4;
    v6 = *(_QWORD *)v12;
    while (1)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(a2);
        v8 = objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "intValue");
        if (v8 <= 6)
        {
          if (v8 == 2)
          {
            v9 = &unk_1E4A00E60;
          }
          else
          {
            if (v8 != 5)
              continue;
            v9 = &unk_1E4A00E78;
          }
          goto LABEL_18;
        }
        if (v8 == 7 || v8 == 13)
        {
          v9 = &unk_1E4A00E90;
LABEL_18:
          objc_msgSend(v3, "addObjectsFromArray:", v9);
          continue;
        }
      }
      v5 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (!v5)
        return (id)objc_msgSend(v3, "copy");
    }
  }
  return result;
}

void __147__BWUBNode__setupProcessingStateForIntelligentDistortionCorrectionIfNeededWithSettings_sequenceNumber_portType_queueProvidingInput_processingPlan___block_invoke(uint64_t a1, CFTypeRef cf, uint64_t a3, void *a4, uint64_t a5)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  CFTypeRef v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[10];
  _QWORD v22[2];
  uint64_t (*v23)(_QWORD *);
  void *v24;
  __int128 v25;
  CFTypeRef v26;
  os_log_type_t type;
  int v28;
  uint64_t v29;
  _QWORD block[19];

  block[16] = *MEMORY[0x1E0C80C00];
  if (dword_1ECFE9AF0)
  {
    v28 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if ((_DWORD)a5)
  {
    if (a3 != 14)
    {
      v29 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
      objc_msgSend(a4, "addBypassedProcessorType:forBufferTypes:", 7, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1));
      v11 = CMGetAttachment(cf, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
      v12 = *(_QWORD *)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("type '%@' requested for '%@'"), BWStillImageProcessorTypeToShortString(a3), a4);
      -[BWUBNode _emitError:processorInput:metadata:description:](v12, a5, a4, (uint64_t)v11);
    }
  }
  else
  {
    v13 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v23 = __147__BWUBNode__setupProcessingStateForIntelligentDistortionCorrectionIfNeededWithSettings_sequenceNumber_portType_queueProvidingInput_processingPlan___block_invoke_140;
    v24 = &unk_1E49233E8;
    v14 = *(_OWORD *)(a1 + 32);
    v25 = v14;
    v26 = cf;
    if (a3 == 13)
    {
      if (cf)
        CFRetain(cf);
      v15 = objc_msgSend(a4, "portType", v19, v20);
      v16 = *(_QWORD *)(a1 + 32);
      v17 = *(NSObject **)(v16 + 160);
      v21[0] = v13;
      v21[1] = 3221225472;
      v21[2] = __147__BWUBNode__setupProcessingStateForIntelligentDistortionCorrectionIfNeededWithSettings_sequenceNumber_portType_queueProvidingInput_processingPlan___block_invoke_2;
      v21[3] = &unk_1E4923410;
      v21[4] = v16;
      v21[5] = v15;
      v21[6] = *(_QWORD *)(a1 + 48);
      v21[7] = v22;
      v21[8] = 13;
      v21[9] = cf;
      block[0] = v13;
      block[1] = 3221225472;
      block[2] = __ubn_dispatch_async_block_invoke;
      block[3] = &unk_1E491ECB8;
      block[4] = v21;
      dispatch_async(v17, block);
    }
    else
    {
      v18 = (void *)objc_msgSend(*(id *)(v14 + 424), "objectForKeyedSubscript:", objc_msgSend(a4, "portType"));
      objc_msgSend(v18, "setApplyZoom:", v23(v22));
      if (objc_msgSend(v18, "processIntelligentDistortionCorrection")
        && objc_msgSend(*(id *)(a1 + 48), "containsObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3)))
      {
        objc_msgSend(v18, "setProcessIntelligentDistortionCorrection:", 0);
      }
      objc_msgSend(v18, "addImage:imageBufferType:", cf, a3, v19, v20);
    }
  }
}

uint64_t __147__BWUBNode__setupProcessingStateForIntelligentDistortionCorrectionIfNeededWithSettings_sequenceNumber_portType_queueProvidingInput_processingPlan___block_invoke_140(_QWORD *a1)
{
  uint64_t v1;
  _BOOL4 v3;
  uint64_t v5;
  uint64_t v6;

  if (!_FigIsCurrentDispatchQueue())
  {
    v6 = v1;
    LODWORD(v5) = 0;
    FigDebugAssert3();
  }
  if (!objc_msgSend(*(id *)(a1[4] + 472), "objectForKeyedSubscript:", a1[5], v5, v6))
    return 1;
  v3 = +[BWDeepZoomProcessorControllerConfiguration doDeepZoomStandardOrLiteForSampleBuffer:type:sensorConfiguration:intermediateZoomSrcRectOut:intermediateZoomDstRectOut:](BWDeepZoomProcessorControllerConfiguration, "doDeepZoomStandardOrLiteForSampleBuffer:type:sensorConfiguration:intermediateZoomSrcRectOut:intermediateZoomDstRectOut:", a1[6], objc_msgSend(*(id *)(a1[4] + 464), "type"), objc_msgSend((id)-[BWUBNodeConfiguration sensorConfigurationsByPortType](*(_QWORD *)(a1[4] + 112)), "objectForKeyedSubscript:", a1[5]), 0, 0);
  return +[BWDeepZoomProcessorControllerConfiguration deepZoomProcessingModeForType:sensorConfiguration:](BWDeepZoomProcessorControllerConfiguration, "deepZoomProcessingModeForType:sensorConfiguration:", objc_msgSend(*(id *)(a1[4] + 464), "type"), objc_msgSend((id)-[BWUBNodeConfiguration sensorConfigurationsByPortType](*(_QWORD *)(a1[4] + 112)), "objectForKeyedSubscript:", a1[5])) == 2|| !v3;
}

void __147__BWUBNode__setupProcessingStateForIntelligentDistortionCorrectionIfNeededWithSettings_sequenceNumber_portType_queueProvidingInput_processingPlan___block_invoke_2(uint64_t a1)
{
  void *v2;
  const void *v3;

  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v2, "setApplyZoom:", (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))());
  if (objc_msgSend(v2, "processIntelligentDistortionCorrection")
    && objc_msgSend(*(id *)(a1 + 48), "containsObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 64))))
  {
    objc_msgSend(v2, "setProcessIntelligentDistortionCorrection:", 0);
  }
  objc_msgSend(v2, "addImage:imageBufferType:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 64));
  v3 = *(const void **)(a1 + 72);
  if (v3)
    CFRelease(v3);
}

void __116__BWUBNode__setupProcessingStateForDeepZoomWithSettings_sequenceNumber_portType_queueProvidingInput_processingPlan___block_invoke(uint64_t a1, CFTypeRef cf, uint64_t a3, void *a4, uint64_t a5)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  CFTypeRef v11;
  uint64_t v12;
  __int128 v13;
  NSObject *v14;
  _QWORD v15[4];
  __int128 v16;
  CFTypeRef v17;
  uint64_t v18;
  os_log_type_t type;
  int v20;
  uint64_t v21;
  _QWORD block[18];

  block[16] = *MEMORY[0x1E0C80C00];
  if (dword_1ECFE9AF0)
  {
    v20 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if ((_DWORD)a5)
  {
    v21 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
    objc_msgSend(a4, "addBypassedProcessorType:forBufferTypes:", 10, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1));
    v11 = CMGetAttachment(cf, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
    v12 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("type '%@' requested for '%@'"), BWStillImageProcessorTypeToShortString(a3), a4);
    -[BWUBNode _emitError:processorInput:metadata:description:](v12, a5, a4, (uint64_t)v11);
  }
  else
  {
    if (cf)
      CFRetain(cf);
    v13 = *(_OWORD *)(a1 + 32);
    v14 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 160);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __116__BWUBNode__setupProcessingStateForDeepZoomWithSettings_sequenceNumber_portType_queueProvidingInput_processingPlan___block_invoke_148;
    v15[3] = &unk_1E49223F8;
    v16 = v13;
    v17 = cf;
    v18 = a3;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __ubn_dispatch_async_block_invoke;
    block[3] = &unk_1E491ECB8;
    block[4] = v15;
    dispatch_async(v14, block);
  }
}

void __116__BWUBNode__setupProcessingStateForDeepZoomWithSettings_sequenceNumber_portType_queueProvidingInput_processingPlan___block_invoke_148(_QWORD *a1)
{
  const void *v2;

  objc_msgSend((id)objc_msgSend(*(id *)(a1[4] + 472), "objectForKeyedSubscript:", a1[5]), "addSampleBuffer:bufferType:", a1[6], a1[7]);
  v2 = (const void *)a1[6];
  if (v2)
    CFRelease(v2);
}

uint64_t __67__BWUBNode__setupProcessingStateForInferenceWithSettings_portType___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancelProcessing");
}

void __67__BWUBNode__setupProcessingStateForInferenceWithSettings_portType___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  const void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(const void **)(v2 + 360);
  if (v3)
  {
    CFRelease(v3);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 360) = 0;
    v2 = *(_QWORD *)(a1 + 32);
  }

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 352) = 0;
}

void __67__BWUBNode__setupProcessingStateForInferenceWithSettings_portType___block_invoke_3(uint64_t a1, const void *a2, uint64_t a3, void *a4)
{
  uint64_t v4;
  uint64_t v8;
  const void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  int v22;
  CFStringRef *v23;
  CFTypeRef v24;
  CFTypeRef v25;
  opaqueCMSampleBuffer *v26;
  CFTypeRef v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  uint64_t v33;
  uint64_t v34;
  CFTypeRef v35;
  uint64_t v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  _QWORD v41[7];
  _QWORD v42[6];
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _QWORD block[5];
  _BYTE v48[128];
  _QWORD v49[8];

  v49[5] = *MEMORY[0x1E0C80C00];
  if (!_FigIsCurrentDispatchQueue())
  {
    v39 = v4;
    LODWORD(v38) = 0;
    FigDebugAssert3();
  }
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(const void **)(v8 + 360);
  *(_QWORD *)(v8 + 360) = a2;
  if (a2)
    CFRetain(a2);
  if (v9)
    CFRelease(v9);
  v49[0] = CFSTR("PersonSemanticsSkin");
  v49[1] = CFSTR("PersonSemanticsHair");
  v49[2] = 0x1E495B0B8;
  v49[3] = 0x1E495AF38;
  v49[4] = 0x1E49511B8;
  v10 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 5, v38, v39), "arrayByAddingObjectsFromArray:", BWInferenceLowResPersonInstanceMaskKeys());
  v11 = (void *)objc_msgSend((id)CMGetAttachment(a2, CFSTR("StillSettings"), 0), "captureSettings");
  if (-[BWUBNodeConfiguration semanticStyleRenderingEnabled](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 112)))
  {
    v12 = (id)objc_msgSend((id)objc_msgSend(v11, "metadata"), "smartCamInferences");
    if (!v12)
      v12 = +[BWInferenceEngineController smartCameraClassificationsFromSbuf:](BWInferenceEngineController, "smartCameraClassificationsFromSbuf:", a2);
    objc_msgSend((id)objc_msgSend(v11, "metadata"), "setSmartCamInferences:", v12);
    if (objc_msgSend((id)objc_msgSend(v11, "metadata"), "smartCamInferences"))
      objc_msgSend((id)objc_msgSend(v11, "metadata"), "calculateSemanticStyleSceneType");
  }
  v40 = +[BWInferenceEngineController faceObservationsFromSbuf:](BWInferenceEngineController, "faceObservationsFromSbuf:", a2);
  v13 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v14 = a4;
  v15 = -[BWUBNode _inferenceAttachedMediaRequiredForDemosaicedRawCaptureWithInferenceOutputSampleBuffer:stillImageSettings:](*(uint64_t **)(a1 + 32), a2, (void *)objc_msgSend(a4, "stillImageSettings"));
  if (objc_msgSend(v15, "count"))
    objc_msgSend(v13, "addObjectsFromArray:", v15);
  v16 = *(_QWORD *)(a1 + 32);
  v17 = (void *)objc_msgSend(a4, "stillImageSettings");
  v19 = (void *)-[BWUBNode _inferenceAttachedMediaRequiredForDepthProcessing:stillImageSettings:](v16, v18, v17);
  if (objc_msgSend(v19, "count"))
    objc_msgSend(v13, "addObjectsFromArray:", v19);
  v20 = MEMORY[0x1E0C809B0];
  if (*(_BYTE *)(a1 + 40))
  {
    if (objc_msgSend(v13, "count"))
    {
      v21 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v22 = objc_msgSend(v13, "containsObject:", CFSTR("PersonSemanticsSkin"));
      v23 = (CFStringRef *)MEMORY[0x1E0D08738];
      if (v22)
      {
        v24 = CMGetAttachment(+[BWInferenceEngineController inferenceMaskSbufFromSbuf:attachedMediaKey:](BWInferenceEngineController, "inferenceMaskSbufFromSbuf:attachedMediaKey:", a2, CFSTR("PersonSemanticsSkin")), (CFStringRef)*MEMORY[0x1E0D08738], 0);
        if (v24)
          objc_msgSend(v21, "setObject:forKeyedSubscript:", v24, CFSTR("PersonSemanticsSkin"));
      }
      if (objc_msgSend(v13, "containsObject:", 0x1E495B0B8))
      {
        v25 = CMGetAttachment(+[BWInferenceEngineController inferenceMaskSbufFromSbuf:attachedMediaKey:](BWInferenceEngineController, "inferenceMaskSbufFromSbuf:attachedMediaKey:", a2, 0x1E495B0B8), *v23, 0);
        if (v25)
          objc_msgSend(v21, "setObject:forKeyedSubscript:", v25, 0x1E495B0B8);
      }
      if (objc_msgSend(v13, "containsObject:", 0x1E495AF38))
      {
        v26 = +[BWInferenceEngineController inferenceMaskSbufFromSbuf:attachedMediaKey:](BWInferenceEngineController, "inferenceMaskSbufFromSbuf:attachedMediaKey:", a2, 0x1E495AF38);
        v27 = CMGetAttachment(v26, (CFStringRef)*MEMORY[0x1E0D08730], 0);
        if (v27)
          objc_msgSend(v21, "setObject:forKeyedSubscript:", v27, 0x1E495AF38);
      }
      if (objc_msgSend(v21, "count"))
        v28 = v21;
      else
        v28 = 0;
    }
    else
    {
      v28 = 0;
    }

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 352) = objc_alloc_init(BWStillImageInferences);
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v29 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v30; ++i)
        {
          if (*(_QWORD *)v44 != v31)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 352), "addInferenceBuffer:metadata:inferenceAttachedMediaKey:", +[BWInferenceEngineController inferenceMaskFromSbuf:attachedMediaKey:](BWInferenceEngineController, "inferenceMaskFromSbuf:attachedMediaKey:", a2, *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i)), 0, *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i));
        }
        v30 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
      }
      while (v30);
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 352), "addInference:inferenceAttachmentKey:", +[BWInferenceEngineController lowResPersonInstanceConfidencesFromSbuf:](BWInferenceEngineController, "lowResPersonInstanceConfidencesFromSbuf:", a2), 0x1E4951338);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 352), "addInference:inferenceAttachmentKey:", +[BWInferenceEngineController lowResPersonInstanceBoundingBoxesFromSbuf:](BWInferenceEngineController, "lowResPersonInstanceBoundingBoxesFromSbuf:", a2), 0x1E4951358);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 352), "addInference:inferenceAttachmentKey:", +[BWInferenceEngineController skinToneClassificationsFromSbuf:](BWInferenceEngineController, "skinToneClassificationsFromSbuf:", a2), 0x1E4951158);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 352), "addInference:inferenceAttachmentKey:", v40, 0x1E4951058);
    if (v28)
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 352), "addInferenceAttachedMediaMetadata:", v28);
    v14 = a4;
    v33 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 272), "objectForKeyedSubscript:", objc_msgSend(a4, "portType"));
    v20 = MEMORY[0x1E0C809B0];
    if (v33)
    {
      v34 = *(_QWORD *)(a1 + 32);
      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v42[2] = __67__BWUBNode__setupProcessingStateForInferenceWithSettings_portType___block_invoke_4;
      v42[3] = &unk_1E491E748;
      v42[4] = v34;
      v42[5] = a4;
      -[BWUBNode _deepFusionDispatch:direction:block:](v34, 2, 2, (uint64_t)v42);
    }
  }
  if (*(_BYTE *)(a1 + 41))
  {
    v35 = (CFTypeRef)objc_msgSend(v14, "propagationImage");
    if (v35)
      v35 = CFRetain(v35);
    v36 = *(_QWORD *)(a1 + 32);
    v37 = *(NSObject **)(v36 + 160);
    v41[0] = v20;
    v41[1] = 3221225472;
    v41[2] = __67__BWUBNode__setupProcessingStateForInferenceWithSettings_portType___block_invoke_5;
    v41[3] = &unk_1E491EC68;
    v41[5] = v14;
    v41[6] = v35;
    v41[4] = v36;
    block[0] = v20;
    block[1] = 3221225472;
    block[2] = __ubn_dispatch_async_block_invoke;
    block[3] = &unk_1E491ECB8;
    block[4] = v41;
    dispatch_async(v37, block);
  }
}

- (uint64_t)_inferenceAttachedMediaRequiredForDepthProcessing:(void *)a3 stillImageSettings:
{
  if (a1 && (objc_msgSend((id)objc_msgSend(a3, "captureSettings"), "captureFlags") & 0x800) != 0)
    return objc_msgSend((id)-[BWUBNodeConfiguration providedInferenceAttachedMediaByMode](*(_QWORD *)(a1 + 112)), "objectForKeyedSubscript:", &unk_1E49FA2C0);
  else
    return 0;
}

uint64_t __67__BWUBNode__setupProcessingStateForInferenceWithSettings_portType___block_invoke_4(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 272), "objectForKeyedSubscript:", objc_msgSend(*(id *)(a1 + 40), "portType")), "allInferencesDelivered");
}

void __67__BWUBNode__setupProcessingStateForInferenceWithSettings_portType___block_invoke_5(uint64_t a1)
{
  id v2;
  const void *v3;

  v2 = -[BWUBNode _ubRERRouter](*(id *)(a1 + 32));
  (*((void (**)(id, _QWORD, uint64_t, _QWORD, _QWORD))v2 + 2))(v2, *(_QWORD *)(a1 + 48), 1, *(_QWORD *)(a1 + 40), 0);
  v3 = *(const void **)(a1 + 48);
  if (v3)
    CFRelease(v3);
}

uint64_t __67__BWUBNode__setupProcessingStateForInferenceWithSettings_portType___block_invoke_156(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "enqueueInputForProcessing:delegate:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = result;
  return result;
}

uint64_t __96__BWUBNode__setupProcessingStateForDisparityIfNeededWithSettings_sequenceNumber_processingPlan___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "enqueueInputForProcessing:delegate:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = result;
  return result;
}

void __87__BWUBNode__setupProcessingStateForJasperDisparityIfNeededWithSettings_processingPlan___block_invoke(uint64_t a1, const void *a2, uint64_t a3, void *a4)
{
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[4];
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const void *v13;
  uint64_t v14;

  v7 = objc_msgSend(a4, "portType");
  if (!_FigIsCurrentDispatchQueue())
    FigDebugAssert3();
  if (a3 == 13)
  {
    if (a2)
      CFRetain(a2);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __87__BWUBNode__setupProcessingStateForJasperDisparityIfNeededWithSettings_processingPlan___block_invoke_2;
    v9[3] = &unk_1E49234B0;
    v8 = *(_QWORD *)(a1 + 40);
    v10 = *(_QWORD *)(a1 + 32);
    v11 = v7;
    v13 = a2;
    v14 = 13;
    v12 = v8;
    -[BWUBNode _deepFusionDispatch:direction:block:](v10, 2, 3, (uint64_t)v9);
  }
  else if (a2)
  {
    objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 568), "objectForKeyedSubscript:", v7), "setColorBuffer:type:", a2, a3);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "cancelProcessing");
  }
}

void __87__BWUBNode__setupProcessingStateForJasperDisparityIfNeededWithSettings_processingPlan___block_invoke_2(uint64_t a1)
{
  const void *v2;

  if (*(_QWORD *)(a1 + 56))
    objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 568), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40)), "setColorBuffer:type:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  else
    objc_msgSend(*(id *)(a1 + 48), "cancelProcessing");
  v2 = *(const void **)(a1 + 56);
  if (v2)
    CFRelease(v2);
}

void __87__BWUBNode__setupProcessingStateForPointCloudDepthIfNeededWithSettings_processingPlan___block_invoke(uint64_t a1, const void *a2, uint64_t a3, void *a4)
{
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[4];
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const void *v13;
  uint64_t v14;

  v7 = objc_msgSend(a4, "portType");
  if (!_FigIsCurrentDispatchQueue())
    FigDebugAssert3();
  if (a3 == 13)
  {
    if (a2)
      CFRetain(a2);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __87__BWUBNode__setupProcessingStateForPointCloudDepthIfNeededWithSettings_processingPlan___block_invoke_2;
    v9[3] = &unk_1E49234B0;
    v8 = *(_QWORD *)(a1 + 40);
    v10 = *(_QWORD *)(a1 + 32);
    v11 = v7;
    v13 = a2;
    v14 = 13;
    v12 = v8;
    -[BWUBNode _deepFusionDispatch:direction:block:](v10, 2, 3, (uint64_t)v9);
  }
  else if (a2)
  {
    objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 552), "objectForKeyedSubscript:", v7), "setColorBuffer:type:", a2, a3);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "cancelProcessing");
  }
}

void __87__BWUBNode__setupProcessingStateForPointCloudDepthIfNeededWithSettings_processingPlan___block_invoke_2(uint64_t a1)
{
  const void *v2;

  if (*(_QWORD *)(a1 + 56))
    objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 552), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40)), "setColorBuffer:type:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  else
    objc_msgSend(*(id *)(a1 + 48), "cancelProcessing");
  v2 = *(const void **)(a1 + 56);
  if (v2)
    CFRelease(v2);
}

void __31__BWUBNode__nrOutputSbufRouter__block_invoke(uint64_t a1, const void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  uint64_t v5;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  CFTypeRef v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  const void *v16;
  CFTypeRef v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  int v25;
  uint64_t v26;
  NSObject *v27;
  unsigned int v28;
  unsigned int v29;
  uint64_t v30;
  NSObject *v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD block[7];
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  os_log_type_t type;
  unsigned int v42;
  _BYTE v43[128];
  int v44;
  const char *v45;
  __int16 v46;
  uint64_t v47;
  __int16 v48;
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  if (!_FigIsCurrentDispatchQueue())
  {
    v35 = v5;
    LODWORD(v34) = 0;
    FigDebugAssert3();
  }
  if (dword_1ECFE9AF0)
  {
    v42 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if ((_DWORD)a5)
  {
    v12 = CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
    v13 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("type '%@' requested for '%@'"), BWStillImageProcessorTypeToShortString(a3), a4);
    -[BWUBNode _emitError:processorInput:metadata:description:](v13, a5, a4, (uint64_t)v12);
  }
  else if ((a3 == 7
          || (v14 = objc_msgSend((id)objc_msgSend(a4, "captureSettings"), "deliverDeferredPhotoProxyImage"), a3 == 14)
          && v14)
         && (v15 = *(_QWORD *)(a1 + 32), *(_QWORD *)(v15 + 584)))
  {
    v16 = *(const void **)(v15 + 592);
    if (v16)
    {
      CFRelease(v16);
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 592) = 0;
    }
    if (a2)
      v17 = CFRetain(a2);
    else
      v17 = 0;
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 592) = v17;
    if (dword_1ECFE9AF0)
    {
      v42 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      v31 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 584), "proxyReadyWithFPNREnabled:", 0, v34, v35);
  }
  else
  {
    if (objc_msgSend(a4, "isMaster", v34, v35) && (a3 == 6 || a3 == 3))
    {
      v18 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 232), "objectForKeyedSubscript:", objc_msgSend(a4, "portType"));
      if (v18)
        objc_msgSend((id)CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E0D05CB0], 0), "setObject:forKeyedSubscript:", v18, *MEMORY[0x1E0D06EB0]);
      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      v19 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 224), "allValues");
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v38;
        do
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v38 != v22)
              objc_enumerationMutation(v19);
            v24 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i), "firstObject");
            objc_msgSend(v24, "setEmitErrorRecoveryFrame:", 1);
            -[BWUBNode _handleReferenceFrameEmissionForProcessorInput:](*(_QWORD *)(a1 + 32), v24);
          }
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
        }
        while (v21);
      }
    }
    v25 = -[BWUBNode _waitForInferenceIfNeededForProcessorInput:](*(_QWORD *)(a1 + 32), a4);
    v26 = *(_QWORD *)(a1 + 32);
    if (v25 && *(_QWORD *)(v26 + 360))
    {
      if (dword_1ECFE9AF0)
      {
        v42 = 0;
        type = OS_LOG_TYPE_DEFAULT;
        v27 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        v28 = v42;
        if (os_log_type_enabled(v27, type))
          v29 = v28;
        else
          v29 = v28 & 0xFFFFFFFE;
        if (v29)
        {
          v30 = BWStillImageProcessorTypeToShortString(a3);
          v44 = 136315650;
          v45 = "-[BWUBNode _nrOutputSbufRouter]_block_invoke";
          v46 = 2112;
          v47 = v30;
          v48 = 2112;
          v49 = a4;
          _os_log_send_and_compose_impl();
        }
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        v26 = *(_QWORD *)(a1 + 32);
      }
      v32 = *(NSObject **)(v26 + 320);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __31__BWUBNode__nrOutputSbufRouter__block_invoke_194;
      block[3] = &unk_1E491EC68;
      block[5] = a4;
      block[6] = a2;
      block[4] = v26;
      dispatch_sync(v32, block);
      v26 = *(_QWORD *)(a1 + 32);
    }
    v33 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("buffer of type '%@' requested for '%@'"), BWStillImageProcessorTypeToShortString(a3), a4);
    -[BWUBNode _emitSampleBuffer:description:](v26, a2, v33);
  }
}

uint64_t __31__BWUBNode__nrOutputSbufRouter__block_invoke_194(uint64_t a1)
{
  void *v2;
  uint64_t *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t result;

  ubn_mergeInferenceMetadata(*(const void **)(*(_QWORD *)(a1 + 32) + 360), *(const void **)(a1 + 48), *(const void **)(a1 + 48));
  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = -[BWUBNode _inferenceAttachedMediaRequiredForDemosaicedRawCaptureWithInferenceOutputSampleBuffer:stillImageSettings:](*(uint64_t **)(a1 + 32), *(const void **)(*(_QWORD *)(a1 + 32) + 360), (void *)objc_msgSend(*(id *)(a1 + 40), "stillImageSettings"));
  if (objc_msgSend(v3, "count"))
    objc_msgSend(v2, "addObjectsFromArray:", v3);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = (void *)objc_msgSend(*(id *)(a1 + 40), "stillImageSettings");
  v7 = (void *)-[BWUBNode _inferenceAttachedMediaRequiredForDepthProcessing:stillImageSettings:](v4, v6, v5);
  if (objc_msgSend(v7, "count"))
    objc_msgSend(v2, "addObjectsFromArray:", v7);
  result = objc_msgSend(v2, "count");
  if (result)
    return ubn_mergeInferenceAttachedMedia(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 360), v2, *(const void **)(a1 + 48));
  return result;
}

void __35__BWUBNode__ubInferenceInputRouter__block_invoke(uint64_t a1, const void *a2, uint64_t a3, void *a4)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  char v11;
  int v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[6];
  _QWORD block[5];

  if (!_FigIsCurrentDispatchQueue())
  {
    v18 = v4;
    LODWORD(v17) = 0;
    FigDebugAssert3();
  }
  v8 = objc_msgSend(a4, "portType", v17, v18);
  if (-[BWUBNode _setupProcessingStateForInferenceWithSettings:portType:](*(_QWORD *)(a1 + 32), (void *)objc_msgSend(a4, "stillImageSettings"), v8)|| (v9 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 312), "objectForKeyedSubscript:", v8)) == 0)
  {
    v16 = (void *)objc_msgSend((id)objc_msgSend(a4, "stillImageSettings"), "captureSettings");
    if (objc_msgSend(v16, "captureType") == 12)
      objc_msgSend(v16, "deliverDeferredPhotoProxyImage");
  }
  else
  {
    v10 = (void *)v9;
    v11 = -[BWUBNode _isSemanticRenderingCapture:](*(_QWORD *)(a1 + 32), (void *)objc_msgSend(a4, "stillImageSettings"));
    v12 = -[BWUBNode _isSemanticStylesCaptureNeedingInferencesWithSettings:](*(_QWORD *)(a1 + 32), (void *)objc_msgSend(a4, "stillImageSettings"));
    if (((v11 & 1) != 0 || v12)
      && !+[BWInferenceEngine isNeuralEngineSupported](BWInferenceEngine, "isNeuralEngineSupported")
      && (objc_msgSend((id)objc_msgSend((id)CMGetAttachment(a2, CFSTR("StillSettings"), 0), "captureSettings"), "captureFlags") & 0x2000) != 0&& (BWSampleBufferHasDetectedFaces(a2, 0, 0, 0, 1, 0) & 1) == 0)
    {
      objc_msgSend(v10, "setEnabledVisionInferences:", objc_msgSend(v10, "enabledVisionInferences") ^ 0x13);
    }
    if (a2)
      CFRetain(a2);
    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(NSObject **)(v13 + 328);
    v15 = *(NSObject **)(v13 + 320);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __35__BWUBNode__ubInferenceInputRouter__block_invoke_2;
    v19[3] = &unk_1E491F158;
    v19[4] = v10;
    v19[5] = a2;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __ubn_dispatch_group_async_block_invoke;
    block[3] = &unk_1E491ECB8;
    block[4] = v19;
    dispatch_group_async(v14, v15, block);
  }
}

void __35__BWUBNode__ubInferenceInputRouter__block_invoke_2(uint64_t a1)
{
  const void *v2;

  objc_msgSend(*(id *)(a1 + 32), "addInferenceImage:", *(_QWORD *)(a1 + 40));
  v2 = *(const void **)(a1 + 40);
  if (v2)
    CFRelease(v2);
}

void __24__BWUBNode__ubRERRouter__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v4;
  id v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  uint64_t v22;
  _QWORD block[19];

  block[16] = *MEMORY[0x1E0C80C00];
  if (!_FigIsCurrentDispatchQueue())
  {
    v14 = v4;
    LODWORD(v12) = 0;
    FigDebugAssert3();
  }
  v8 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 408), "objectForKeyedSubscript:", objc_msgSend(a4, "portType", v12, v14));
  v17 = 0;
  v18 = &v17;
  v19 = 0x3052000000;
  v20 = __Block_byref_object_copy__24;
  v21 = __Block_byref_object_dispose__24;
  v22 = 0;
  if (!objc_msgSend(v8, "faceObservations"))
  {
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(NSObject **)(v9 + 320);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __24__BWUBNode__ubRERRouter__block_invoke_2;
    v16[3] = &unk_1E491E9A8;
    v16[4] = v9;
    v16[5] = &v17;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __ubn_dispatch_sync_block_invoke;
    block[3] = &unk_1E491ECB8;
    block[4] = v16;
    dispatch_sync(v10, block);
  }
  if (dword_1ECFE9AF0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(v8, "addFrame:faceObservations:", a2, v18[5], v13, v15);
  _Block_object_dispose(&v17, 8);
}

id __24__BWUBNode__ubRERRouter__block_invoke_2(uint64_t a1)
{
  id result;

  result = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 352), "inferenceForAttachmentKey:", 0x1E4951058);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

void __53__BWUBNode__standardNROutputRouterWithExpectedQueue___block_invoke(uint64_t a1, opaqueCMSampleBuffer *a2, uint64_t a3, void *a4, uint64_t a5)
{
  int v9;
  uint64_t v10;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  unsigned int v19;
  uint64_t v20;
  _BOOL4 v21;
  CFTypeRef v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD block[7];
  os_log_type_t type;
  int v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (!_FigIsCurrentDispatchQueue())
    FigDebugAssert3();
  v9 = -[BWUBNode _waitForInferenceIfNeededForProcessorInput:](*(_QWORD *)(a1 + 40), a4);
  v10 = *(_QWORD *)(a1 + 40);
  if (v9 && *(_QWORD *)(v10 + 360))
  {
    if (dword_1ECFE9AF0)
    {
      v33 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      v10 = *(_QWORD *)(a1 + 40);
    }
    v13 = *(NSObject **)(v10 + 320);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __53__BWUBNode__standardNROutputRouterWithExpectedQueue___block_invoke_196;
    block[3] = &unk_1E491EC68;
    block[5] = a4;
    block[6] = a2;
    block[4] = v10;
    dispatch_sync(v13, block);
  }
  else if (*(_QWORD *)(v10 + 352) && objc_msgSend(*(id *)(v10 + 112), "deferredPhotoProcessorEnabled"))
  {
    if (dword_1ECFE9AF0)
    {
      v33 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      v12 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v14 = (void *)objc_msgSend((id)-[BWUBNodeConfiguration providedInferenceAttachedMediaByMode](*(_QWORD *)(*(_QWORD *)(a1 + 40)+ 112)), "objectForKeyedSubscript:", &unk_1E49FA2A8);
    if (objc_msgSend(v14, "count"))
    {
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v34, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v28;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v28 != v17)
              objc_enumerationMutation(v14);
            BWPropagateInferenceAttachedMedia(*(void **)(*(_QWORD *)(a1 + 40) + 352), *(void **)(*((_QWORD *)&v27 + 1) + 8 * i), (CFTypeRef *)(*(_QWORD *)(a1 + 40) + 384), a2);
          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v34, 16);
        }
        while (v16);
      }
    }
  }
  if (FigCaptureSushiRawDNGDictionaryCreatedInGraph()
    && FigCapturePixelFormatIsBayerRaw(objc_msgSend((id)objc_msgSend(a4, "settings"), "rawOutputFormat")))
  {
    v19 = objc_msgSend((id)objc_msgSend(a4, "settings"), "outputWidth");
    v20 = objc_msgSend((id)objc_msgSend(a4, "settings"), "outputHeight");
    v21 = objc_msgSend((id)objc_msgSend((id)CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E0D05CB0], 0), "objectForKeyedSubscript:", *MEMORY[0x1E0D05F18]), "intValue") != 0;
    -[BWUBNode _propagateSushiRawDNGDictionaryWithOutputSampleBuffer:requestedDimensions:requiresGDCInformation:](*(_QWORD *)(a1 + 40), a2, v19 | (unint64_t)(v20 << 32), v21);
  }
  if ((_DWORD)a5)
  {
    v22 = CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
    v23 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("type '%@' requested for '%@'"), BWStillImageProcessorTypeToShortString(a3), a4);
    -[BWUBNode _emitError:processorInput:metadata:description:](v23, a5, a4, (uint64_t)v22);
  }
  else
  {
    v24 = *(_QWORD *)(a1 + 40);
    v25 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("buffer of type '%@' requested for '%@'"), BWStillImageProcessorTypeToShortString(a3), a4);
    -[BWUBNode _emitSampleBuffer:description:](v24, a2, v25);
  }
}

uint64_t __53__BWUBNode__standardNROutputRouterWithExpectedQueue___block_invoke_196(uint64_t a1)
{
  void *v2;
  uint64_t *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t result;

  ubn_mergeInferenceMetadata(*(const void **)(*(_QWORD *)(a1 + 32) + 360), *(const void **)(a1 + 48), *(const void **)(a1 + 48));
  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = -[BWUBNode _inferenceAttachedMediaRequiredForDemosaicedRawCaptureWithInferenceOutputSampleBuffer:stillImageSettings:](*(uint64_t **)(a1 + 32), *(const void **)(*(_QWORD *)(a1 + 32) + 360), (void *)objc_msgSend(*(id *)(a1 + 40), "stillImageSettings"));
  if (objc_msgSend(v3, "count"))
    objc_msgSend(v2, "addObjectsFromArray:", v3);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = (void *)objc_msgSend(*(id *)(a1 + 40), "stillImageSettings");
  v7 = (void *)-[BWUBNode _inferenceAttachedMediaRequiredForDepthProcessing:stillImageSettings:](v4, v6, v5);
  if (objc_msgSend(v7, "count"))
    objc_msgSend(v2, "addObjectsFromArray:", v7);
  result = objc_msgSend(v2, "count");
  if (result)
    return ubn_mergeInferenceAttachedMedia(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 360), v2, *(const void **)(a1 + 48));
  return result;
}

void __29__BWUBNode__releaseResources__block_invoke_2(uint64_t a1)
{
  -[BWUBNode _resetProcessingState](*(_QWORD *)(a1 + 32));

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128) = 0;
}

@end
