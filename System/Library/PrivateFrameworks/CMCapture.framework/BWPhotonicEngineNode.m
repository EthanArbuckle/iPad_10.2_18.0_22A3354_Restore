@implementation BWPhotonicEngineNode

- (BWPhotonicEngineNode)initWithNodeConfiguration:(id)a3 captureDevice:(id)a4
{
  BWPhotonicEngineNode *v6;
  BWPhotonicEngineNode *v7;
  BWNodeInput *v8;
  BWVideoFormatRequirements *v9;
  void *v10;
  _BOOL4 v11;
  BOOL v12;
  int v13;
  void *v14;
  int v15;
  _BOOL4 v16;
  _BOOL4 v17;
  uint64_t v18;
  uint64_t v19;
  BWNodeInput *v20;
  BWVideoFormatRequirements *v21;
  BWNodeOutput *v22;
  BWFigVideoCaptureDevice *v23;
  id v25;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)BWPhotonicEngineNode;
  v6 = -[BWNode init](&v26, sel_init);
  v7 = v6;
  if (!v6)
    return v7;
  if (!a3)
  {

    return 0;
  }
  v6->_nodeConfiguration = (BWPhotonicEngineNodeConfiguration *)a3;
  v8 = -[BWNodeInput initWithMediaType:node:index:]([BWNodeInput alloc], "initWithMediaType:node:index:", 1986618469, v7, 0);
  v9 = objc_alloc_init(BWVideoFormatRequirements);
  v10 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = -[BWPhotonicEngineNodeConfiguration generateLiDARDepth]((_BOOL8)v7->_nodeConfiguration);
  v12 = v11;
  v13 = !v11;
  v25 = a4;
  if (-[BWPhotonicEngineNodeConfiguration inputIs10Bit]((_BOOL8)v7->_nodeConfiguration))
  {
    objc_msgSend(v10, "addObject:", &unk_1E49FC570);
    if (!v12)
      objc_msgSend(v10, "addObject:", &unk_1E49FC588);
    if (-[BWPhotonicEngineNodeConfiguration semanticStyleRenderingEnabled]((_BOOL8)a3))
      goto LABEL_12;
    objc_msgSend(v10, "addObject:", &unk_1E49FC5A0);
    if (v12)
      goto LABEL_12;
    v14 = &unk_1E49FC5B8;
    goto LABEL_11;
  }
  objc_msgSend(v10, "addObject:", &unk_1E49FC5D0);
  if (!v12)
  {
    v14 = &unk_1E49FC5E8;
LABEL_11:
    objc_msgSend(v10, "addObject:", v14);
  }
LABEL_12:
  v15 = -[BWStillImageNodeConfiguration maxLossyCompressionLevel](v7->_nodeConfiguration, "maxLossyCompressionLevel");
  v16 = !-[BWPhotonicEngineNodeConfiguration inputIs10Bit]((_BOOL8)v7->_nodeConfiguration);
  v17 = -[BWPhotonicEngineNodeConfiguration inputIs10Bit]((_BOOL8)v7->_nodeConfiguration);
  v18 = 1;
  objc_msgSend(v10, "addObjectsFromArray:", FigCaptureSupportedCompressedPixelFormatsForSettings(4, v15, v13, 1, 0, v16, v17, 0));
  -[BWVideoFormatRequirements setSupportedPixelFormats:](v9, "setSupportedPixelFormats:", v10);
  if (-[BWPhotonicEngineNodeConfiguration inputIs10Bit]((_BOOL8)v7->_nodeConfiguration))
    v19 = 64;
  else
    v19 = 16;
  -[BWVideoFormatRequirements setBytesPerRowAlignment:](v9, "setBytesPerRowAlignment:", v19);
  -[BWVideoFormatRequirements setHeightAlignment:](v9, "setHeightAlignment:", 16);
  -[BWNodeInput setFormatRequirements:](v8, "setFormatRequirements:", v9);
  -[BWNodeInput setPassthroughMode:](v8, "setPassthroughMode:", 0);
  -[BWNodeInput setRetainedBufferCount:](v8, "setRetainedBufferCount:", -[BWPhotonicEngineNodeConfiguration retainedBufferCount]((uint64_t)v7->_nodeConfiguration));
  -[BWNode addInput:](v7, "addInput:", v8);
  if (objc_msgSend(v25, "sensorRawStillImageOutputsEnabled"))
  {
    v20 = -[BWNodeInput initWithMediaType:node:index:]([BWNodeInput alloc], "initWithMediaType:node:index:", 1986618469, v7, 1);
    v21 = objc_alloc_init(BWVideoFormatRequirements);
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v21, "setSupportedPixelFormats:", &unk_1E4A01F58);
    -[BWVideoFormatRequirements setBytesPerRowAlignment:](v21, "setBytesPerRowAlignment:", 64);
    -[BWVideoFormatRequirements setHeightAlignment:](v21, "setHeightAlignment:", 16);
    -[BWNodeInput setFormatRequirements:](v20, "setFormatRequirements:", v21);
    -[BWNodeInput setPassthroughMode:](v20, "setPassthroughMode:", 0);
    -[BWNodeInput setRetainedBufferCount:](v20, "setRetainedBufferCount:", -[BWPhotonicEngineNodeConfiguration retainedBufferCount]((uint64_t)v7->_nodeConfiguration));
    -[BWNode addInput:](v7, "addInput:", v20);
    v7->_sensorRawInput = v20;
    v18 = 2;
  }
  if (-[BWPhotonicEngineNodeConfiguration generateLiDARDepth]((_BOOL8)a3)
    || objc_msgSend(v25, "supplementalPointCloudCaptureDevice"))
  {
    if (-[BWPhotonicEngineNodeConfiguration generateLiDARDepth]((_BOOL8)a3)
      && objc_msgSend(v25, "supplementalPointCloudCaptureDevice"))
    {
      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("We should not be generating LiDAR depth and using the ToF camera in the supplemental mode at the same time"), 0));
    }
    v7->_pointCloudInput = -[BWNodeInput initWithMediaType:node:index:]([BWNodeInput alloc], "initWithMediaType:node:index:", 1885564004, v7, v18);
    -[BWNodeInput setFormatRequirements:](v7->_pointCloudInput, "setFormatRequirements:", objc_alloc_init(BWPointCloudFormatRequirements));
    -[BWNodeInput setRetainedBufferCount:](v7->_pointCloudInput, "setRetainedBufferCount:", 1000);
    -[BWNode addInput:](v7, "addInput:", v7->_pointCloudInput);
    v7->_pointCloudLock._os_unfair_lock_opaque = 0;
    v7->_discardPointClouds = 1;
  }
  v22 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1986618469, v7);
  -[BWNodeOutput setOwningNodeRetainedBufferCount:](v22, "setOwningNodeRetainedBufferCount:", -[BWPhotonicEngineNodeConfiguration outputBufferCount]((uint64_t)v7->_nodeConfiguration) - 1);
  if (FigCaptureVideoDimensionsAreValid(-[BWStillImageNodeConfiguration stereoPhotoOutputDimensions](v7->_nodeConfiguration, "stereoPhotoOutputDimensions")))
  {
    -[BWNodeOutput setOwningNodeRetainedBufferCount:](v22, "setOwningNodeRetainedBufferCount:", -[BWNodeOutput owningNodeRetainedBufferCount](v22, "owningNodeRetainedBufferCount") + 2);
  }
  -[BWNodeOutput setPixelBufferPoolProvidesBackPressure:](v22, "setPixelBufferPoolProvidesBackPressure:", -[BWPhotonicEngineNodeConfiguration outputPoolBackPressureEnabled]((_BOOL8)v7->_nodeConfiguration));
  -[BWNodeOutput setPixelBufferPoolReportSlowBackPressureAllocations:](v22, "setPixelBufferPoolReportSlowBackPressureAllocations:", -[BWPhotonicEngineNodeConfiguration outputPoolBackPressureEnabled]((_BOOL8)v7->_nodeConfiguration));
  -[BWNodeOutput setPassthroughMode:](v22, "setPassthroughMode:", 0);
  -[BWNode addOutput:](v7, "addOutput:", v22);
  v23 = (BWFigVideoCaptureDevice *)v25;
  v7->_device = v23;
  -[BWFigVideoCaptureDevice setAdaptiveUnifiedBracketingController:](v23, "setAdaptiveUnifiedBracketingController:", v7);
  -[BWPhotonicEngineNode _setupProcessorControllerConfigurations](v7);
  return v7;
}

- (void)didSelectFormat:(id)a3 forOutput:(id)a4
{
  unsigned int v6;
  unsigned int v7;

  v6 = objc_msgSend(a3, "width");
  v7 = objc_msgSend(a3, "height");
  -[BWNRFProcessorControllerConfiguration setOutputFormat:](self->_nrfProcessorControllerConfiguration, "setOutputFormat:", a3);
  -[BWDeepFusionProcessorControllerConfiguration setMaxOutputDimensions:](self->_deepFusionProcessorControllerConfiguration, "setMaxOutputDimensions:", v6 | ((unint64_t)v7 << 32));
  if (-[BWDeepZoomProcessorControllerConfiguration type](self->_deepZoomProcessorControllerConfiguration, "type") != 3)
    -[BWDeepZoomProcessorControllerConfiguration setOutputFormat:](self->_deepZoomProcessorControllerConfiguration, "setOutputFormat:", a3);
}

- (id)nodeType
{
  return CFSTR("Effect");
}

- (id)_setupProcessorControllerConfigurations
{
  id v1;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  _BOOL4 v3;
  BOOL v4;
  BWSoftISPProcessorControllerConfiguration *SoftISPProcessorControllerConfiguration;
  BWNRFProcessorControllerConfiguration *NRFProcessorControllerConfiguration;
  BWDeferredProcessorControllerConfiguration *DeferredProcessorControllerConfiguration;
  BWDeepFusionProcessorControllerConfiguration *DeepFusionProcessorControllerConfiguration;
  _BOOL4 v9;
  _BOOL8 v10;
  BWLearnedNRProcessorControllerConfiguration *LearnedNRProcessorControllerConfiguration;
  BWSWFRProcessorControllerConfiguration *SWFRProcessorControllerConfiguration;
  BWColorConstancyProcessorControllerConfiguration *ColorConstancyProcessorControllerConfiguration;
  BWStillImageProcessorControllerConfiguration *RedEyeProcessorControllerConfiguration;
  BWIntelligentDistortionCorrectionProcessorControllerConfiguration *IntelligentDistortionCorrectionProcessorControllerConfiguration;
  BWDeepZoomProcessorControllerConfiguration *DeepZoomProcessorControllerConfiguration;
  void *ScalerProcessorControllerConfiguration;
  BWSmartStyleRenderingProcessorControllerConfiguration *SmartStyleRenderingProcessorControllerConfiguration;
  BWStereoDisparityProcessorControllerConfiguration *StereoDisparityProcessorControllerConfiguration;
  BWJasperColorStillsExecutorControllerConfiguration *JasperColorStillsExecutorControllerConfiguration;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
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
      *((_QWORD *)v1 + 15) = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", objc_msgSend((id)-[BWPhotonicEngineNodeConfiguration sensorConfigurationsByPortType](*((_QWORD *)v1 + 14)), "allKeys"));
      *((_DWORD *)v1 + 246) = -[BWPhotonicEngineNodeConfiguration demosaicedRawPixelFormat](*((_QWORD *)v1 + 14));
      *((_DWORD *)v1 + 50) = 0;
      objc_msgSend(*((id *)v1 + 14), "figThreadPriority");
      *((_QWORD *)v1 + 22) = FigDispatchQueueCreateWithPriority();
      v3 = BWDeviceSupportsDeferredPhotoProcessorPrewarming();
      if (objc_msgSend(*((id *)v1 + 14), "deferredPhotoProcessorEnabled"))
        v4 = !v3;
      else
        v4 = 1;
      if (!v4)
      {
        objc_msgSend(*((id *)v1 + 14), "figThreadPriority");
        *((_QWORD *)v1 + 23) = FigDispatchQueueCreateWithPriority();
        *((_QWORD *)v1 + 24) = dispatch_group_create();
      }
      objc_msgSend(*((id *)v1 + 14), "figThreadPriority", v21, v22);
      *((_QWORD *)v1 + 26) = FigDispatchQueueCreateWithPriority();
      *((_QWORD *)v1 + 29) = objc_alloc_init(BWPhotonicEngineNodeSampleBufferAndInputQueue);
      *((_BYTE *)v1 + 216) = -[FigCaptureCameraParameters nrfVersion](+[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance"), "nrfVersion") > 2;
      SoftISPProcessorControllerConfiguration = BWPhotonicEngineCreateSoftISPProcessorControllerConfiguration(*((void **)v1 + 14));
      *((_QWORD *)v1 + 31) = SoftISPProcessorControllerConfiguration;
      if (SoftISPProcessorControllerConfiguration)
      {
        *((_QWORD *)v1 + 33) = objc_alloc_init(MEMORY[0x1E0C99E08]);
        *((_QWORD *)v1 + 34) = objc_alloc_init(MEMORY[0x1E0C99E08]);
        *((_QWORD *)v1 + 38) = objc_alloc_init(MEMORY[0x1E0C99E08]);
        *((_QWORD *)v1 + 40) = objc_alloc_init(MEMORY[0x1E0C99E08]);
        *((_QWORD *)v1 + 41) = objc_alloc_init(MEMORY[0x1E0C99E08]);
        *((_QWORD *)v1 + 42) = objc_alloc_init(MEMORY[0x1E0C99E08]);
      }
      NRFProcessorControllerConfiguration = BWPhotonicEngineCreateNRFProcessorControllerConfiguration(*((void **)v1 + 14));
      *((_QWORD *)v1 + 43) = NRFProcessorControllerConfiguration;
      if (NRFProcessorControllerConfiguration)
        *((_QWORD *)v1 + 44) = objc_alloc_init(MEMORY[0x1E0C99E08]);
      *((_QWORD *)v1 + 45) = objc_alloc_init(MEMORY[0x1E0C99E08]);
      *((_QWORD *)v1 + 46) = objc_alloc_init(MEMORY[0x1E0C99E08]);
      *((_QWORD *)v1 + 99) = objc_alloc_init(MEMORY[0x1E0C99E08]);
      DeferredProcessorControllerConfiguration = BWPhotonicEngineCreateDeferredProcessorControllerConfiguration(*((void **)v1 + 14));
      *((_QWORD *)v1 + 117) = DeferredProcessorControllerConfiguration;
      if (DeferredProcessorControllerConfiguration)
      {
        objc_msgSend(*((id *)v1 + 14), "figThreadPriority");
        *((_QWORD *)v1 + 116) = FigDispatchQueueCreateWithPriority();
        *((_QWORD *)v1 + 118) = objc_alloc_init(MEMORY[0x1E0C99E08]);
      }
      *((_QWORD *)v1 + 112) = BWPhotonicEngineCreateDeferredContainerControllerConfiguration(*((void **)v1 + 14));
      DeepFusionProcessorControllerConfiguration = BWPhotonicEngineCreateDeepFusionProcessorControllerConfiguration(*((void **)v1 + 14));
      *((_QWORD *)v1 + 51) = DeepFusionProcessorControllerConfiguration;
      if (DeepFusionProcessorControllerConfiguration)
      {
        *((_QWORD *)v1 + 52) = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v9 = !FigCaptureVideoDimensionsAreValid(objc_msgSend(*((id *)v1 + 14), "deepFusionEnhancedResolutionDimensions"));
        if (*((_QWORD *)v1 + 31))
          v10 = v9;
        else
          v10 = 0;
        objc_msgSend(*((id *)v1 + 51), "setDelayPrepareAndCacheBuffers:", v10);
      }
      LearnedNRProcessorControllerConfiguration = BWPhotonicEngineCreateLearnedNRProcessorControllerConfiguration(*((void **)v1 + 14));
      *((_QWORD *)v1 + 49) = LearnedNRProcessorControllerConfiguration;
      if (LearnedNRProcessorControllerConfiguration)
        *((_QWORD *)v1 + 50) = objc_alloc_init(MEMORY[0x1E0C99E08]);
      *((_QWORD *)v1 + 59) = BWPhotonicEngineCreateInferenceControllerConfiguration(*((void **)v1 + 14));
      objc_msgSend(*((id *)v1 + 14), "figThreadPriority");
      *((_QWORD *)v1 + 61) = FigDispatchQueueCreateWithPriority();
      *((_QWORD *)v1 + 69) = objc_alloc_init(MEMORY[0x1E0C99E08]);
      if (*((_QWORD *)v1 + 59))
      {
        *((_QWORD *)v1 + 60) = objc_alloc_init(MEMORY[0x1E0C99E08]);
        *((_QWORD *)v1 + 62) = dispatch_group_create();
      }
      SWFRProcessorControllerConfiguration = BWPhotonicEngineCreateSWFRProcessorControllerConfiguration(*((void **)v1 + 14));
      *((_QWORD *)v1 + 73) = SWFRProcessorControllerConfiguration;
      if (SWFRProcessorControllerConfiguration)
      {
        *((_QWORD *)v1 + 74) = objc_alloc_init(MEMORY[0x1E0C99E08]);
        *((_QWORD *)v1 + 75) = objc_alloc_init(MEMORY[0x1E0C99E08]);
      }
      ColorConstancyProcessorControllerConfiguration = BWPhotonicEngineCreateColorConstancyProcessorControllerConfiguration(*((void **)v1 + 14));
      *((_QWORD *)v1 + 76) = ColorConstancyProcessorControllerConfiguration;
      if (ColorConstancyProcessorControllerConfiguration)
        *((_QWORD *)v1 + 77) = objc_alloc_init(MEMORY[0x1E0C99E08]);
      RedEyeProcessorControllerConfiguration = BWPhotonicEngineCreateRedEyeProcessorControllerConfiguration(*((void **)v1 + 14));
      *((_QWORD *)v1 + 78) = RedEyeProcessorControllerConfiguration;
      if (RedEyeProcessorControllerConfiguration)
        *((_QWORD *)v1 + 79) = objc_alloc_init(MEMORY[0x1E0C99E08]);
      IntelligentDistortionCorrectionProcessorControllerConfiguration = BWPhotonicEngineCreateIntelligentDistortionCorrectionProcessorControllerConfiguration(*((void **)v1 + 14));
      *((_QWORD *)v1 + 80) = IntelligentDistortionCorrectionProcessorControllerConfiguration;
      if (IntelligentDistortionCorrectionProcessorControllerConfiguration)
      {
        *((_QWORD *)v1 + 81) = objc_alloc_init(MEMORY[0x1E0C99E08]);
        *((_QWORD *)v1 + 82) = objc_alloc_init(MEMORY[0x1E0C99E08]);
        *((_QWORD *)v1 + 85) = +[BWIntelligentDistortionCorrectionProcessorController captureTypesWithIDCSupportWithOptionalCaptureFlags](BWIntelligentDistortionCorrectionProcessorController, "captureTypesWithIDCSupportWithOptionalCaptureFlags");
      }
      DeepZoomProcessorControllerConfiguration = BWPhotonicEngineCreateDeepZoomProcessorControllerConfiguration(*((void **)v1 + 14));
      *((_QWORD *)v1 + 86) = DeepZoomProcessorControllerConfiguration;
      if (DeepZoomProcessorControllerConfiguration)
        *((_QWORD *)v1 + 87) = objc_alloc_init(MEMORY[0x1E0C99E08]);
      ScalerProcessorControllerConfiguration = BWPhotonicEngineCreateScalerProcessorControllerConfiguration(*((void **)v1 + 14));
      *((_QWORD *)v1 + 92) = ScalerProcessorControllerConfiguration;
      if (ScalerProcessorControllerConfiguration)
      {
        *((_QWORD *)v1 + 93) = objc_alloc_init(MEMORY[0x1E0C99E08]);
        *((_QWORD *)v1 + 94) = objc_alloc_init(MEMORY[0x1E0C99E08]);
      }
      SmartStyleRenderingProcessorControllerConfiguration = BWPhotonicEngineCreateSmartStyleRenderingProcessorControllerConfiguration(*((void **)v1 + 14));
      *((_QWORD *)v1 + 101) = SmartStyleRenderingProcessorControllerConfiguration;
      if (SmartStyleRenderingProcessorControllerConfiguration)
      {
        *((_QWORD *)v1 + 102) = objc_alloc_init(MEMORY[0x1E0C99E08]);
        if (!*((_DWORD *)v1 + 246))
          *((_DWORD *)v1 + 246) = objc_msgSend(*((id *)v1 + 101), "linearYUVPixelFormat");
      }
      StereoDisparityProcessorControllerConfiguration = BWPhotonicEngineCreateStereoDisparityProcessorControllerConfiguration(*((void **)v1 + 14));
      *((_QWORD *)v1 + 95) = StereoDisparityProcessorControllerConfiguration;
      if (StereoDisparityProcessorControllerConfiguration)
      {
        *((_QWORD *)v1 + 100) = objc_alloc_init(MEMORY[0x1E0C99E08]);
        objc_msgSend(*((id *)v1 + 14), "figThreadPriority");
        *((_QWORD *)v1 + 98) = FigDispatchQueueCreateWithPriority();
        *((_QWORD *)v1 + 35) = objc_alloc_init(MEMORY[0x1E0C99E08]);
      }
      if (objc_msgSend(*((id *)v1 + 13), "supplementalPointCloudCaptureDevice"))
      {
        JasperColorStillsExecutorControllerConfiguration = BWPhotonicEngineCreateJasperColorStillsExecutorControllerConfiguration(*((void **)v1 + 14));
        *((_QWORD *)v1 + 108) = JasperColorStillsExecutorControllerConfiguration;
        if (JasperColorStillsExecutorControllerConfiguration)
          *((_QWORD *)v1 + 109) = objc_alloc_init(MEMORY[0x1E0C99E08]);
      }
      result = BWPhotonicEngineCreateJasperDisparityProcessorControllerConfiguration(*((void **)v1 + 14));
      *((_QWORD *)v1 + 110) = result;
      if (result)
      {
        result = objc_alloc_init(MEMORY[0x1E0C99E08]);
        *((_QWORD *)v1 + 111) = result;
      }
    }
  }
  return result;
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4
{
  _BOOL4 v6;
  int dcOutputBufferCount;
  int v8;
  unsigned int v9;
  _BOOL4 v10;
  _BOOL4 v11;
  unsigned int v12;
  int demosaicedRawOutputBufferCount;
  uint64_t v14;
  void *v15;
  int v16;
  int *v17;
  int v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unsigned int v23;
  unint64_t v24;
  BWVideoFormatRequirements *v25;
  _BOOL4 v26;
  BWNodeOutputMediaConfiguration *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  uint64_t v36;
  void *v37;
  NSDictionary *v38;
  uint64_t v39;
  uint64_t v40;
  BWVideoFormatRequirements *v41;
  float v42;
  float v43;
  float v44;
  float v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t j;
  int v53;
  int v54;
  uint64_t v55;
  BWNodeOutputMediaConfiguration *v56;
  BWNodeOutputMediaConfiguration *v57;
  BWVideoFormatRequirements *v58;
  BWNodeOutputMediaConfiguration *v59;
  BWVideoFormatRequirements *v60;
  uint64_t v61;
  BWNodeOutputMediaConfiguration *v62;
  BWVideoFormatRequirements *v63;
  uint64_t v64;
  BWNodeOutputMediaConfiguration *v65;
  BWVideoFormatRequirements *v66;
  double v67;
  double v68;
  double v69;
  double v70;
  BWNodeOutputMediaConfiguration *v71;
  BWVideoFormatRequirements *v72;
  BWNodeOutputMediaConfiguration *v73;
  id v74;
  BWNodeOutputMediaConfiguration *v75;
  BWVideoFormatRequirements *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  id v80;
  BWNodeOutputMediaConfiguration *v81;
  BWVideoFormatRequirements *v82;
  BWNodeOutputMediaConfiguration *v83;
  BWVideoFormatRequirements *v84;
  unsigned int v85;
  unsigned int v86;
  unsigned int v87;
  BWSmartStyleRenderingProcessorControllerConfiguration *smartStyleRenderingConfiguration;
  BWVideoFormatRequirements *v89;
  id obj;
  NSDictionary *obja;
  uint64_t v92;
  uint64_t v93;
  unsigned int v94;
  _BOOL4 v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  _BYTE v119[128];
  _BYTE v120[128];
  _BYTE v121[128];
  _BYTE v122[128];
  uint64_t v123;
  _QWORD v124[3];

  v124[1] = *MEMORY[0x1E0C80C00];
  if (self->_pointCloudInput == a4)
    return;
  if (self->_sensorRawInput == a4)
  {
    -[BWSoftISPProcessorControllerConfiguration sensorRawPixelFormat](self->_softISPProcessorControllerConfiguration, "sensorRawPixelFormat");
    objc_msgSend(a3, "pixelFormat");
    return;
  }
  v6 = -[BWPhotonicEngineNode _requiresResizedOutputDimensionsWithInputWidth:inputHeight:]((_BOOL8)self, objc_msgSend(a3, "width"), objc_msgSend(a3, "height"));
  if (v6)
    -[NSArray count](-[BWIntelligentDistortionCorrectionProcessorControllerConfiguration portTypesWithGeometricDistortionCorrectionEnabled](self->_intelligentDistortionCorrectionControllerConfiguration, "portTypesWithGeometricDistortionCorrectionEnabled"), "count");
  v87 = -[BWNodeOutput owningNodeRetainedBufferCount](self->super._output, "owningNodeRetainedBufferCount");
  dcOutputBufferCount = v87 + 1;
  if (self->_intelligentDistortionCorrectionControllerConfiguration)
    v8 = v6;
  else
    v8 = 1;
  if (v8 != 1
    || (v9 = v87 + 1,
        (int)-[BWPhotonicEngineNodeConfiguration constantColorVersion]((uint64_t)self->_nodeConfiguration) >= 1))
  {
    v9 = 2 * dcOutputBufferCount;
    self->_dcOutputBufferCount = 2 * dcOutputBufferCount;
  }
  smartStyleRenderingConfiguration = self->_smartStyleRenderingConfiguration;
  if (-[BWNRFProcessorControllerConfiguration demosaicedRawEnabled](self->_nrfProcessorControllerConfiguration, "demosaicedRawEnabled"))
  {
    if (-[NSArray count](-[BWIntelligentDistortionCorrectionProcessorControllerConfiguration portTypesWithGeometricDistortionCorrectionEnabled](self->_intelligentDistortionCorrectionControllerConfiguration, "portTypesWithGeometricDistortionCorrectionEnabled"), "count")&& self->_softISPProcessorControllerConfiguration)
    {
      dcOutputBufferCount = self->_dcOutputBufferCount;
    }
  }
  else
  {
    dcOutputBufferCount = 0;
  }
  self->_demosaicedRawOutputBufferCount = dcOutputBufferCount;
  v10 = self->_deepZoomProcessorControllerConfiguration != 0;
  if (-[BWStillImageNodeConfiguration deferredPhotoProcessorEnabled](self->_nodeConfiguration, "deferredPhotoProcessorEnabled")&& !self->_intelligentDistortionCorrectionControllerConfiguration)
  {
    if ((v8 & 1) == 0)
    {
      v94 = 0;
      v85 = v9 >> 1;
      v86 = 1;
      goto LABEL_21;
    }
    v94 = 0;
    v11 = -[BWPhotonicEngineNodeConfiguration gainMapMainImageDownscalingFactor]((uint64_t)self->_nodeConfiguration) > 0.0;
  }
  else
  {
    v11 = 1;
    v94 = 1;
  }
  v85 = v9;
  v86 = v11;
LABEL_21:
  v12 = v9 + (smartStyleRenderingConfiguration != 0) + v10;
  demosaicedRawOutputBufferCount = self->_demosaicedRawOutputBufferCount;
  v89 = objc_alloc_init(BWVideoFormatRequirements);
  if (FigCapturePixelFormatIsFullRange(objc_msgSend(a3, "pixelFormat")))
    v14 = 875704422;
  else
    v14 = 875704438;
  v124[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v14);
  v15 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v124, 1);
  v16 = FigCapturePlatformSupportsUniversalCompression();
  if (self->_deepZoomProcessorControllerConfiguration)
  {
    v17 = &OBJC_IVAR___BWVisionInferenceProvider__executesRequestsIndividually;
  }
  else
  {
    v17 = &OBJC_IVAR___BWVisionInferenceProvider__executesRequestsIndividually;
    if (v16)
    {
      v18 = -[BWStillImageNodeConfiguration maxLossyCompressionLevel](self->_nodeConfiguration, "maxLossyCompressionLevel");
      if (self->_deepFusionProcessorControllerConfiguration)
        v19 = 0;
      else
        v19 = v18;
      v15 = FigCapturePixelFormatsByAddingCompressedVariants(v15, v19);
    }
  }
  v20 = v12 - 1;
  if (objc_msgSend(a3, "colorSpaceProperties"))
  {
    v123 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(a3, "colorSpaceProperties"));
    v21 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v123, 1);
  }
  else
  {
    v21 = 0;
  }
  -[BWVideoFormatRequirements setSupportedColorSpaceProperties:](v89, "setSupportedColorSpaceProperties:", v21);
  -[BWVideoFormatRequirements setSupportedPixelFormats:](v89, "setSupportedPixelFormats:", v15);
  if (v6)
  {
    -[BWVideoFormatRequirements setWidth:](v89, "setWidth:", (int)-[BWPhotonicEngineNodeConfiguration outputDimensions]((uint64_t)self->_nodeConfiguration));
    v22 = -[BWPhotonicEngineNodeConfiguration outputDimensions]((uint64_t)self->_nodeConfiguration) >> 32;
  }
  else
  {
    -[BWVideoFormatRequirements setWidth:](v89, "setWidth:", objc_msgSend(a3, "width"));
    v22 = objc_msgSend(a3, "height");
  }
  -[BWVideoFormatRequirements setHeight:](v89, "setHeight:", v22);
  -[BWVideoFormatRequirements setBytesPerRowAlignment:](v89, "setBytesPerRowAlignment:", 64);
  -[BWVideoFormatRequirements setHeightAlignment:](v89, "setHeightAlignment:", 16);
  -[BWVideoFormatRequirements setPlaneAlignment:](v89, "setPlaneAlignment:", 64);
  -[BWVideoFormatRequirements setSupportedCacheModes:](v89, "setSupportedCacheModes:", +[BWVideoFormatRequirements cacheModesForOptimizedHWAccess](BWVideoFormatRequirements, "cacheModesForOptimizedHWAccess"));
  -[BWNodeOutput setFormatRequirements:](self->super._output, "setFormatRequirements:", v89);
  -[BWNodeOutput setOwningNodeRetainedBufferCount:](self->super._output, "setOwningNodeRetainedBufferCount:", v20);
  v23 = objc_msgSend(a3, "width");
  v24 = v23 | ((unint64_t)objc_msgSend(a3, "height") << 32);
  objc_msgSend(*(id *)((char *)&self->super.super.isa + v17[196]), "setOutputDimensions:", v24);
  -[BWNRFProcessorControllerConfiguration setInputFormat:](self->_nrfProcessorControllerConfiguration, "setInputFormat:", a3);
  -[BWNRFProcessorControllerConfiguration setDeepFusionInputFormat:](self->_nrfProcessorControllerConfiguration, "setDeepFusionInputFormat:", a3);
  -[BWDeepFusionProcessorControllerConfiguration setMaxInputDimensions:](self->_deepFusionProcessorControllerConfiguration, "setMaxInputDimensions:", v24);
  -[BWDeepZoomProcessorControllerConfiguration setInputFormat:](self->_deepZoomProcessorControllerConfiguration, "setInputFormat:", a3);
  v95 = -[BWNodeOutputMediaConfiguration pixelBufferPoolProvidesBackPressure](-[BWNodeOutput primaryMediaConfiguration](self->super._output, "primaryMediaConfiguration"), "pixelBufferPoolProvidesBackPressure");
  if (-[BWNRFProcessorControllerConfiguration demosaicedRawEnabled](self->_nrfProcessorControllerConfiguration, "demosaicedRawEnabled"))
  {
    v25 = -[BWPhotonicEngineNode _demosaicedRawFormatRequirementsWithDimensions:colorSpaceProperties:]((uint64_t)self, -[BWVideoFormatRequirements width](v89, "width") | ((unint64_t)-[BWVideoFormatRequirements height](v89, "height") << 32), objc_msgSend(-[NSArray firstObject](-[BWVideoFormatRequirements supportedColorSpaceProperties](v89, "supportedColorSpaceProperties"), "firstObject"), "intValue"));
    if (-[BWStillImageNodeConfiguration deferredPhotoProcessorEnabled](self->_nodeConfiguration, "deferredPhotoProcessorEnabled"))
    {
      v26 = -[BWPhotonicEngineNodeConfiguration ultraHighResolutionProcessingEnabled]((_BOOL8)self->_nodeConfiguration);
    }
    else
    {
      v26 = 0;
    }
    v27 = objc_alloc_init(BWNodeOutputMediaConfiguration);
    -[BWNodeOutputMediaConfiguration setFormatRequirements:](v27, "setFormatRequirements:", v25);
    -[BWNodeOutputMediaConfiguration setPassthroughMode:](v27, "setPassthroughMode:", 0);
    -[BWNodeOutputMediaConfiguration setProvidesPixelBufferPool:](v27, "setProvidesPixelBufferPool:", !v26);
    if (!v26)
    {
      -[BWNodeOutputMediaConfiguration setOwningNodeRetainedBufferCount:](v27, "setOwningNodeRetainedBufferCount:", (demosaicedRawOutputBufferCount - 1));
      -[BWNodeOutputMediaConfiguration setPixelBufferPoolProvidesBackPressure:](v27, "setPixelBufferPoolProvidesBackPressure:", v95);
      -[BWNodeOutputMediaConfiguration setPixelBufferPoolReportSlowBackPressureAllocations:](v27, "setPixelBufferPoolReportSlowBackPressureAllocations:", v95);
    }
    -[BWNodeOutput setMediaConfiguration:forAttachedMediaKey:](self->super._output, "setMediaConfiguration:forAttachedMediaKey:", v27, 0x1E495B0F8);
  }
  if ((-[BWPhotonicEngineNodeConfiguration learnedNRMode]((uint64_t)self->_nodeConfiguration) & 1) != 0)
  {
    -[BWLearnedNRProcessorControllerConfiguration setInputFormatsByQSubResolutionFlavor:](self->_learnedNRProcessorControllerConfiguration, "setInputFormatsByQSubResolutionFlavor:", pen_inputFormatsByQSubResolutionFlavorByAddingFormatForFlavor(0, 0, (uint64_t)a3));
    -[BWLearnedNRProcessorControllerConfiguration setOutputFormat:](self->_learnedNRProcessorControllerConfiguration, "setOutputFormat:", a3);
  }
  v28 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v112 = 0u;
  v113 = 0u;
  v114 = 0u;
  v115 = 0u;
  obj = (id)-[BWPhotonicEngineNodeConfiguration providedInferenceAttachedMediaByMode]((uint64_t)self->_nodeConfiguration);
  v96 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v112, v122, 16);
  if (v96)
  {
    v92 = *(_QWORD *)v113;
    do
    {
      v29 = 0;
      do
      {
        if (*(_QWORD *)v113 != v92)
          objc_enumerationMutation(obj);
        v98 = v29;
        v30 = *(_QWORD *)(*((_QWORD *)&v112 + 1) + 8 * v29);
        v108 = 0u;
        v109 = 0u;
        v110 = 0u;
        v111 = 0u;
        v31 = (void *)objc_msgSend((id)-[BWPhotonicEngineNodeConfiguration providedInferenceAttachedMediaByMode]((uint64_t)self->_nodeConfiguration), "objectForKeyedSubscript:", v30);
        v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v108, v121, 16);
        if (v32)
        {
          v33 = v32;
          v34 = *(_QWORD *)v109;
          do
          {
            for (i = 0; i != v33; ++i)
            {
              if (*(_QWORD *)v109 != v34)
                objc_enumerationMutation(v31);
              v36 = *(_QWORD *)(*((_QWORD *)&v108 + 1) + 8 * i);
              v37 = (void *)objc_msgSend(v28, "objectForKeyedSubscript:", v36);
              if (v37)
                objc_msgSend(v37, "addObject:", v30);
              else
                objc_msgSend(v28, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v30), v36);
            }
            v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v108, v121, 16);
          }
          while (v33);
        }
        v29 = v98 + 1;
      }
      while (v98 + 1 != v96);
      v96 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v112, v122, 16);
    }
    while (v96);
  }

  v38 = (NSDictionary *)objc_msgSend(v28, "copy");
  self->_providedInferenceAttachedMediaModesByAttachedMediaKey = v38;
  v104 = 0u;
  v105 = 0u;
  v106 = 0u;
  v107 = 0u;
  obja = v38;
  v97 = -[NSDictionary countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v104, v120, 16);
  if (v97)
  {
    v93 = *(_QWORD *)v105;
    do
    {
      v39 = 0;
      do
      {
        if (*(_QWORD *)v105 != v93)
          objc_enumerationMutation(obja);
        v40 = *(_QWORD *)(*((_QWORD *)&v104 + 1) + 8 * v39);
        v99 = v39;
        if (+[BWMattingV2InferenceConfiguration isMattingOutputAttachedMediaKey:](BWMattingV2InferenceConfiguration, "isMattingOutputAttachedMediaKey:", v40))
        {
          if (-[BWPhotonicEngineNodeConfiguration inferenceMainImageDownscalingFactor]((uint64_t)self->_nodeConfiguration) == 0.0)
          {
            v41 = 0;
          }
          else
          {
            v41 = objc_alloc_init(BWVideoFormatRequirements);
            v42 = (float)-[BWVideoFormatRequirements width](v89, "width");
            v43 = -[BWPhotonicEngineNodeConfiguration inferenceMainImageDownscalingFactor]((uint64_t)self->_nodeConfiguration);
            -[BWVideoFormatRequirements setWidth:](v41, "setWidth:", (int)FigCaptureRoundFloatToMultipleOf(2, v42 / v43));
            v44 = (float)-[BWVideoFormatRequirements height](v89, "height");
            v45 = -[BWPhotonicEngineNodeConfiguration inferenceMainImageDownscalingFactor]((uint64_t)self->_nodeConfiguration);
            -[BWVideoFormatRequirements setHeight:](v41, "setHeight:", (int)FigCaptureRoundFloatToMultipleOf(2, v44 / v45));
            -[BWVideoFormatRequirements setSupportedPixelFormats:](v41, "setSupportedPixelFormats:", &unk_1E4A01F70);
            -[BWVideoFormatRequirements setBytesPerRowAlignment:](v41, "setBytesPerRowAlignment:", 64);
            -[BWVideoFormatRequirements setPlaneAlignment:](v41, "setPlaneAlignment:", 64);
            -[BWVideoFormatRequirements setWidthAlignment:](v41, "setWidthAlignment:", 16);
            -[BWVideoFormatRequirements setHeightAlignment:](v41, "setHeightAlignment:", 16);
            -[BWVideoFormatRequirements setMemoryPoolUseAllowed:](v41, "setMemoryPoolUseAllowed:", 0);
          }
        }
        else
        {
          v41 = objc_alloc_init(BWVideoFormatRequirements);
          -[BWVideoFormatRequirements setWidth:](v41, "setWidth:", 512);
          -[BWVideoFormatRequirements setHeight:](v41, "setHeight:", 384);
          -[BWVideoFormatRequirements setSupportedPixelFormats:](v41, "setSupportedPixelFormats:", &unk_1E4A01F88);
          -[BWVideoFormatRequirements setBytesPerRowAlignment:](v41, "setBytesPerRowAlignment:", 64);
        }
        v102 = 0u;
        v103 = 0u;
        v100 = 0u;
        v101 = 0u;
        v46 = v40;
        v47 = (void *)objc_msgSend(v28, "objectForKeyedSubscript:", v40);
        v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v100, v119, 16);
        if (v48)
        {
          v49 = v48;
          LODWORD(v50) = 0;
          v51 = *(_QWORD *)v101;
          do
          {
            for (j = 0; j != v49; ++j)
            {
              if (*(_QWORD *)v101 != v51)
                objc_enumerationMutation(v47);
              v53 = objc_msgSend(*(id *)(*((_QWORD *)&v100 + 1) + 8 * j), "intValue");
              if (v53 == 3 || v53 == 2)
              {
                v54 = -[BWNodeOutput owningNodeRetainedBufferCount](self->super._output, "owningNodeRetainedBufferCount");
              }
              else if (v53 == 1)
              {
                v54 = self->_demosaicedRawOutputBufferCount - 1;
              }
              else
              {
                v54 = 0;
              }
              if ((int)v50 <= v54)
                v50 = v54;
              else
                v50 = v50;
            }
            v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v100, v119, 16);
          }
          while (v49);
        }
        else
        {
          v50 = 0;
        }
        v55 = v95 | -[BWStillImageNodeConfiguration deferredCaptureSupportEnabled](self->_nodeConfiguration, "deferredCaptureSupportEnabled");
        v56 = objc_alloc_init(BWNodeOutputMediaConfiguration);
        -[BWNodeOutputMediaConfiguration setFormatRequirements:](v56, "setFormatRequirements:", v41);
        -[BWNodeOutputMediaConfiguration setPassthroughMode:](v56, "setPassthroughMode:", 0);
        -[BWNodeOutputMediaConfiguration setProvidesPixelBufferPool:](v56, "setProvidesPixelBufferPool:", v94);
        -[BWNodeOutputMediaConfiguration setOwningNodeRetainedBufferCount:](v56, "setOwningNodeRetainedBufferCount:", v50);
        -[BWNodeOutputMediaConfiguration setPixelBufferPoolProvidesBackPressure:](v56, "setPixelBufferPoolProvidesBackPressure:", v55);
        -[BWNodeOutputMediaConfiguration setPixelBufferPoolReportSlowBackPressureAllocations:](v56, "setPixelBufferPoolReportSlowBackPressureAllocations:", v55);
        -[BWNodeOutput setMediaConfiguration:forAttachedMediaKey:](self->super._output, "setMediaConfiguration:forAttachedMediaKey:", v56, v46);
        v39 = v99 + 1;
      }
      while (v99 + 1 != v97);
      v97 = -[NSDictionary countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v104, v120, 16);
    }
    while (v97);
  }
  if (-[BWPhotonicEngineNodeConfiguration gainMapMainImageDownscalingFactor]((uint64_t)self->_nodeConfiguration) != 0.0)
  {
    v57 = objc_alloc_init(BWNodeOutputMediaConfiguration);
    v58 = objc_alloc_init(BWVideoFormatRequirements);
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v58, "setSupportedPixelFormats:", &unk_1E4A01FA0);
    -[BWVideoFormatRequirements setWidth:](v58, "setWidth:", (unint64_t)(float)((float)-[BWVideoFormatRequirements width](v89, "width")/ -[BWPhotonicEngineNodeConfiguration gainMapMainImageDownscalingFactor]((uint64_t)self->_nodeConfiguration)));
    -[BWVideoFormatRequirements setHeight:](v58, "setHeight:", (unint64_t)(float)((float)-[BWVideoFormatRequirements height](v89, "height")/ -[BWPhotonicEngineNodeConfiguration gainMapMainImageDownscalingFactor]((uint64_t)self->_nodeConfiguration)));
    -[BWVideoFormatRequirements setWidthAlignment:](v58, "setWidthAlignment:", 16);
    -[BWVideoFormatRequirements setHeightAlignment:](v58, "setHeightAlignment:", 16);
    -[BWNodeOutputMediaConfiguration setFormatRequirements:](v57, "setFormatRequirements:", v58);
    -[BWNodeOutputMediaConfiguration setPassthroughMode:](v57, "setPassthroughMode:", 0);
    -[BWNodeOutputMediaConfiguration setProvidesPixelBufferPool:](v57, "setProvidesPixelBufferPool:", v86);
    -[BWNodeOutputMediaConfiguration setOwningNodeRetainedBufferCount:](v57, "setOwningNodeRetainedBufferCount:", v85 - 1);
    -[BWNodeOutputMediaConfiguration setPixelBufferPoolProvidesBackPressure:](v57, "setPixelBufferPoolProvidesBackPressure:", v95);
    -[BWNodeOutputMediaConfiguration setPixelBufferPoolReportSlowBackPressureAllocations:](v57, "setPixelBufferPoolReportSlowBackPressureAllocations:", v95);
    -[BWNodeOutput setMediaConfiguration:forAttachedMediaKey:](self->super._output, "setMediaConfiguration:forAttachedMediaKey:", v57, 0x1E4936818);
  }
  if ((int)-[BWPhotonicEngineNodeConfiguration constantColorVersion]((uint64_t)self->_nodeConfiguration) >= 1)
  {
    v59 = objc_alloc_init(BWNodeOutputMediaConfiguration);
    v60 = objc_alloc_init(BWVideoFormatRequirements);
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v60, "setSupportedPixelFormats:", &unk_1E4A01FB8);
    -[BWVideoFormatRequirements setWidth:](v60, "setWidth:", (int)-[BWStillImageNodeConfiguration constantColorConfidenceMapDimensions](self->_nodeConfiguration, "constantColorConfidenceMapDimensions"));
    -[BWVideoFormatRequirements setHeight:](v60, "setHeight:", -[BWStillImageNodeConfiguration constantColorConfidenceMapDimensions](self->_nodeConfiguration, "constantColorConfidenceMapDimensions") >> 32);
    -[BWNodeOutputMediaConfiguration setFormatRequirements:](v59, "setFormatRequirements:", v60);
    -[BWNodeOutputMediaConfiguration setPassthroughMode:](v59, "setPassthroughMode:", 0);
    -[BWNodeOutputMediaConfiguration setProvidesPixelBufferPool:](v59, "setProvidesPixelBufferPool:", 1);
    -[BWNodeOutputMediaConfiguration setOwningNodeRetainedBufferCount:](v59, "setOwningNodeRetainedBufferCount:", v87);
    -[BWNodeOutputMediaConfiguration setPixelBufferPoolProvidesBackPressure:](v59, "setPixelBufferPoolProvidesBackPressure:", v95);
    -[BWNodeOutputMediaConfiguration setPixelBufferPoolReportSlowBackPressureAllocations:](v59, "setPixelBufferPoolReportSlowBackPressureAllocations:", v95);
    -[BWNodeOutput setMediaConfiguration:forAttachedMediaKey:](self->super._output, "setMediaConfiguration:forAttachedMediaKey:", v59, 0x1E495B438);
  }
  v61 = -[BWPhotonicEngineNodeConfiguration depthDataOutputDimensions]((uint64_t)self->_nodeConfiguration);
  if (FigCaptureVideoDimensionsAreValid(v61))
  {
    v62 = objc_alloc_init(BWNodeOutputMediaConfiguration);
    v63 = objc_alloc_init(BWVideoFormatRequirements);
    -[BWVideoFormatRequirements setWidth:](v63, "setWidth:", (int)-[BWPhotonicEngineNodeConfiguration depthDataOutputDimensions]((uint64_t)self->_nodeConfiguration));
    -[BWVideoFormatRequirements setHeight:](v63, "setHeight:", -[BWPhotonicEngineNodeConfiguration depthDataOutputDimensions]((uint64_t)self->_nodeConfiguration) >> 32);
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v63, "setSupportedPixelFormats:", &unk_1E4A01FD0);
    -[BWNodeOutputMediaConfiguration setFormatRequirements:](v62, "setFormatRequirements:", v63);
    -[BWNodeOutputMediaConfiguration setPassthroughMode:](v62, "setPassthroughMode:", 0);
    -[BWNodeOutputMediaConfiguration setProvidesPixelBufferPool:](v62, "setProvidesPixelBufferPool:", -[BWStillImageNodeConfiguration deferredPhotoProcessorEnabled](self->_nodeConfiguration, "deferredPhotoProcessorEnabled") ^ 1);
    -[BWNodeOutputMediaConfiguration setOwningNodeRetainedBufferCount:](v62, "setOwningNodeRetainedBufferCount:", -[BWNodeOutput owningNodeRetainedBufferCount](self->super._output, "owningNodeRetainedBufferCount"));
    -[BWNodeOutput setMediaConfiguration:forAttachedMediaKey:](self->super._output, "setMediaConfiguration:forAttachedMediaKey:", v62, CFSTR("Depth"));
  }
  if (smartStyleRenderingConfiguration)
  {
    v64 = -[BWPhotonicEngineNodeConfiguration smartStyleLinearThumbnailDimensions]((uint64_t)self->_nodeConfiguration);
    v65 = objc_alloc_init(BWNodeOutputMediaConfiguration);
    v66 = objc_alloc_init(BWVideoFormatRequirements);
    -[BWVideoFormatRequirements setWidth:](v66, "setWidth:", (int)v64);
    -[BWVideoFormatRequirements setHeight:](v66, "setHeight:", v64 >> 32);
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v66, "setSupportedPixelFormats:", &unk_1E4A01FE8);
    -[BWNodeOutputMediaConfiguration setFormatRequirements:](v65, "setFormatRequirements:", v66);
    -[BWNodeOutputMediaConfiguration setPassthroughMode:](v65, "setPassthroughMode:", 0);
    -[BWNodeOutputMediaConfiguration setProvidesPixelBufferPool:](v65, "setProvidesPixelBufferPool:", 0);
    -[BWNodeOutput setMediaConfiguration:forAttachedMediaKey:](self->super._output, "setMediaConfiguration:forAttachedMediaKey:", v65, 0x1E495B258);
    if (-[BWPhotonicEngineNodeConfiguration smartStyleReversibilityEnabled]((_BOOL8)self->_nodeConfiguration))
    {
      objc_msgSend(MEMORY[0x1E0D08AD0], "intermediateStyleRendererThumbnailSizeForUseCase:", 0);
      v68 = v67;
      v70 = v69;
      v71 = objc_alloc_init(BWNodeOutputMediaConfiguration);
      v72 = objc_alloc_init(BWVideoFormatRequirements);
      -[BWVideoFormatRequirements setWidth:](v72, "setWidth:", (int)v68);
      -[BWVideoFormatRequirements setHeight:](v72, "setHeight:", (int)v70);
      -[BWVideoFormatRequirements setSupportedPixelFormats:](v72, "setSupportedPixelFormats:", &unk_1E4A02000);
      -[BWNodeOutputMediaConfiguration setFormatRequirements:](v71, "setFormatRequirements:", v72);
      -[BWNodeOutputMediaConfiguration setPassthroughMode:](v71, "setPassthroughMode:", 0);
      -[BWNodeOutputMediaConfiguration setProvidesPixelBufferPool:](v71, "setProvidesPixelBufferPool:", 0);
      -[BWNodeOutput setMediaConfiguration:forAttachedMediaKey:](self->super._output, "setMediaConfiguration:forAttachedMediaKey:", v71, 0x1E495B298);
      v73 = objc_alloc_init(BWNodeOutputMediaConfiguration);
      -[BWNodeOutputMediaConfiguration setFormatRequirements:](v73, "setFormatRequirements:", v89);
      -[BWNodeOutputMediaConfiguration setPassthroughMode:](v73, "setPassthroughMode:", 0);
      -[BWNodeOutputMediaConfiguration setProvidesPixelBufferPool:](v73, "setProvidesPixelBufferPool:", 0);
      -[BWNodeOutput setMediaConfiguration:forAttachedMediaKey:](self->super._output, "setMediaConfiguration:forAttachedMediaKey:", v73, 0x1E495B278);
      v74 = +[BWSmartStyleRenderingProcessorController pixelBufferAttributesWithCapacityForLearntCoefficients:](BWSmartStyleRenderingProcessorController, "pixelBufferAttributesWithCapacityForLearntCoefficients:", -[BWPhotonicEngineNodeConfiguration smartStyleRenderingVersion]((uint64_t)self->_nodeConfiguration));
      v75 = objc_alloc_init(BWNodeOutputMediaConfiguration);
      v76 = objc_alloc_init(BWVideoFormatRequirements);
      v77 = *MEMORY[0x1E0CA90E0];
      -[BWVideoFormatRequirements setWidth:](v76, "setWidth:", (int)objc_msgSend((id)objc_msgSend(v74, "objectForKeyedSubscript:", *MEMORY[0x1E0CA90E0]), "intValue"));
      v78 = *MEMORY[0x1E0CA8FD8];
      -[BWVideoFormatRequirements setHeight:](v76, "setHeight:", (int)objc_msgSend((id)objc_msgSend(v74, "objectForKeyedSubscript:", *MEMORY[0x1E0CA8FD8]), "intValue"));
      v79 = *MEMORY[0x1E0CA9040];
      v118 = objc_msgSend(v74, "objectForKeyedSubscript:", *MEMORY[0x1E0CA9040]);
      -[BWVideoFormatRequirements setSupportedPixelFormats:](v76, "setSupportedPixelFormats:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v118, 1));
      -[BWNodeOutputMediaConfiguration setFormatRequirements:](v75, "setFormatRequirements:", v76);
      -[BWNodeOutputMediaConfiguration setPassthroughMode:](v75, "setPassthroughMode:", 0);
      -[BWNodeOutputMediaConfiguration setProvidesPixelBufferPool:](v75, "setProvidesPixelBufferPool:", 0);
      -[BWNodeOutput setMediaConfiguration:forAttachedMediaKey:](self->super._output, "setMediaConfiguration:forAttachedMediaKey:", v75, 0x1E495B2D8);
      v80 = +[BWSmartStyleRenderingProcessorController pixelBufferAttributesForSmallLightMap:](BWSmartStyleRenderingProcessorController, "pixelBufferAttributesForSmallLightMap:", -[BWPhotonicEngineNodeConfiguration smartStyleRenderingVersion]((uint64_t)self->_nodeConfiguration));
      v81 = objc_alloc_init(BWNodeOutputMediaConfiguration);
      v82 = objc_alloc_init(BWVideoFormatRequirements);
      -[BWVideoFormatRequirements setWidth:](v82, "setWidth:", (int)objc_msgSend((id)objc_msgSend(v80, "objectForKeyedSubscript:", v77), "intValue"));
      -[BWVideoFormatRequirements setHeight:](v82, "setHeight:", (int)objc_msgSend((id)objc_msgSend(v80, "objectForKeyedSubscript:", v78), "intValue"));
      v117 = objc_msgSend(v80, "objectForKeyedSubscript:", v79);
      -[BWVideoFormatRequirements setSupportedPixelFormats:](v82, "setSupportedPixelFormats:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v117, 1));
      -[BWNodeOutputMediaConfiguration setFormatRequirements:](v81, "setFormatRequirements:", v82);
      -[BWNodeOutputMediaConfiguration setPassthroughMode:](v81, "setPassthroughMode:", 0);
      -[BWNodeOutputMediaConfiguration setProvidesPixelBufferPool:](v81, "setProvidesPixelBufferPool:", 0);
      -[BWNodeOutput setMediaConfiguration:forAttachedMediaKey:](self->super._output, "setMediaConfiguration:forAttachedMediaKey:", v81, 0x1E495B2F8);
      v83 = objc_alloc_init(BWNodeOutputMediaConfiguration);
      v84 = objc_alloc_init(BWVideoFormatRequirements);
      -[BWVideoFormatRequirements setWidth:](v84, "setWidth:", (int)objc_msgSend((id)objc_msgSend(v80, "objectForKeyedSubscript:", v77), "intValue"));
      -[BWVideoFormatRequirements setHeight:](v84, "setHeight:", (int)objc_msgSend((id)objc_msgSend(v80, "objectForKeyedSubscript:", v78), "intValue"));
      v116 = objc_msgSend(v80, "objectForKeyedSubscript:", v79);
      -[BWVideoFormatRequirements setSupportedPixelFormats:](v84, "setSupportedPixelFormats:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v116, 1));
      -[BWNodeOutputMediaConfiguration setFormatRequirements:](v83, "setFormatRequirements:", v84);
      -[BWNodeOutputMediaConfiguration setPassthroughMode:](v83, "setPassthroughMode:", 0);
      -[BWNodeOutputMediaConfiguration setProvidesPixelBufferPool:](v83, "setProvidesPixelBufferPool:", 0);
      -[BWNodeOutput setMediaConfiguration:forAttachedMediaKey:](self->super._output, "setMediaConfiguration:forAttachedMediaKey:", v83, 0x1E495B318);
    }
  }
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
  v17 = __Block_byref_object_copy__41;
  v18 = __Block_byref_object_dispose__41;
  processorCoordinatorWorkerQueue = self->_processorCoordinatorWorkerQueue;
  v19 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __100__BWPhotonicEngineNode_adaptiveBracketingDigitalFlashTotalIntegrationTimesProviderForPortType_wait___block_invoke;
  v13[3] = &unk_1E491F458;
  v13[5] = a3;
  v13[6] = &v14;
  v13[4] = self;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __ubn_dispatch_sync_block_invoke_0;
  block[3] = &unk_1E491ECB8;
  block[4] = v13;
  dispatch_sync(processorCoordinatorWorkerQueue, block);
  v11 = (id)v15[5];
  _Block_object_dispose(&v14, 8);
  return v11;
}

- (BOOL)_requiresResizedOutputDimensionsWithInputWidth:(uint64_t)a3 inputHeight:
{
  uint64_t v5;
  uint64_t v6;

  if (result)
  {
    v5 = result;
    v6 = -[BWPhotonicEngineNodeConfiguration outputDimensions](*(_QWORD *)(result + 112));
    result = FigCaptureVideoDimensionsAreValid(v6);
    if ((_DWORD)result)
      return a2 != (int)-[BWPhotonicEngineNodeConfiguration outputDimensions](*(_QWORD *)(v5 + 112))
          || a3 != -[BWPhotonicEngineNodeConfiguration outputDimensions](*(_QWORD *)(v5 + 112)) >> 32;
  }
  return result;
}

- (unint64_t)_deepFusionEnhancedResolutionOutputDimensions
{
  unsigned int v2;
  unint64_t v3;
  uint64_t v4;

  if (a1)
  {
    if (objc_msgSend(*(id *)(a1 + 16), "videoFormat")
      && FigCaptureVideoDimensionsAreValid(objc_msgSend(*(id *)(a1 + 112), "deepFusionEnhancedResolutionDimensions")))
    {
      v2 = FigCaptureRoundFloatToMultipleOf(2, (float)((float)((float)(unint64_t)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "videoFormat"), "width")/ (float)(unint64_t)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "videoFormat"), "height"))/ (float)((float)(int)objc_msgSend(*(id *)(a1 + 112), "deepFusionEnhancedResolutionDimensions")/ (float)(int)((unint64_t)objc_msgSend(*(id *)(a1 + 112), "deepFusionEnhancedResolutionDimensions") >> 32)))* (float)(int)objc_msgSend(*(id *)(a1 + 112), "deepFusionEnhancedResolutionDimensions"));
      v3 = objc_msgSend(*(id *)(a1 + 112), "deepFusionEnhancedResolutionDimensions") & 0xFFFFFFFF00000000;
      v4 = v2;
    }
    else
    {
      v3 = 0;
      v4 = 0;
    }
  }
  else
  {
    v3 = 0;
    v4 = 0;
  }
  return v4 | v3;
}

- (BWNodeInput)sensorRawInput
{
  return self->_sensorRawInput;
}

- (BWPixelBufferPool)_setupProcessorCoordinator
{
  uint64_t v1;
  uint64_t v2;
  BWPixelBufferPool *v3;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BWVideoFormatRequirements *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  unint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  NSObject *v19;
  int *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  BWVideoFormatRequirements *v25;
  id v26;
  int v27;
  BWPixelBufferPool *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  BWVideoFormatRequirements *v39;
  id v40;
  BWPixelBufferPool *v41;
  uint64_t v42;
  BWVideoFormatRequirements *v43;
  id v44;
  BWVideoFormatRequirements *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t i;
  unint64_t v51;
  void *v52;
  void *v53;
  unint64_t v54;
  uint64_t v55;
  BWPixelBufferPool *v56;
  uint64_t v57;
  BWVideoFormatRequirements *v58;
  id v59;
  void *v60;
  void *v61;
  unint64_t v62;
  uint64_t v63;
  BWPixelBufferPool *v64;
  int64_t v65;
  uint64_t v66;
  BWVideoFormatRequirements *v67;
  id v68;
  _BOOL4 v69;
  unsigned int v70;
  int v71;
  unsigned int v72;
  uint64_t v73;
  void *v74;
  void *v75;
  unint64_t v76;
  BWPixelBufferPool *v77;
  BWVideoFormatRequirements *v78;
  id v79;
  uint64_t v80;
  int64_t v81;
  uint64_t v82;
  BWVideoFormatRequirements *v83;
  id v84;
  uint64_t v85;
  uint64_t v86;
  BWPixelBufferPool *v87;
  void *v88;
  void *v89;
  uint64_t v90;
  uint64_t v91;
  BWVideoFormatRequirements *v92;
  BWPixelBufferPool *v93;
  _BOOL4 v94;
  BWVideoFormatRequirements *v95;
  id v96;
  uint64_t v97;
  BWVideoFormatRequirements *v98;
  uint64_t v99;
  id v100;
  uint64_t v101;
  uint64_t v102;
  BWVideoFormatRequirements *v103;
  uint64_t v104;
  id v105;
  BWVideoFormatRequirements *v106;
  uint64_t v107;
  id v108;
  BWVideoFormatRequirements *v109;
  uint64_t v110;
  id v111;
  uint64_t v112;
  void *v113;
  id v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  void *v118;
  uint64_t j;
  uint64_t v120;
  char v121;
  uint64_t v122;
  BWVideoFormatRequirements *v123;
  uint64_t v124;
  uint64_t v125;
  BWPixelBufferPool *v126;
  BWPixelBufferPool *v127;
  void *v128;
  uint64_t v129;
  BWVideoFormatRequirements *v130;
  BWPixelBufferPool *v131;
  BWPixelBufferPool *v132;
  uint64_t v133;
  BWVideoFormatRequirements *v134;
  BWVideoFormatRequirements *v135;
  id v136;
  void *v137;
  void *v138;
  uint64_t v139;
  unint64_t v140;
  uint64_t v141;
  BWPixelBufferPool *v142;
  char v143;
  BWVideoFormatRequirements *v144;
  id v145;
  uint64_t v146;
  void *v147;
  BWPixelBufferPool *v148;
  BWVideoFormatRequirements *v149;
  BWPixelBufferPool *v150;
  BWVideoFormatRequirements *v151;
  uint64_t v152;
  id v153;
  uint64_t v154;
  NSObject *v155;
  unsigned int v156;
  unsigned int v157;
  uint64_t v158;
  uint64_t v159;
  BWVideoFormatRequirements *v160;
  uint64_t v161;
  uint64_t v162;
  id v163;
  BWPixelBufferPool *v164;
  uint64_t v165;
  BWVideoFormatRequirements *v166;
  id v167;
  BWPixelBufferPool *v168;
  uint64_t v169;
  BWVideoFormatRequirements *v170;
  id v171;
  BWPixelBufferPool *v172;
  uint64_t v173;
  id v174;
  id v175;
  id v176;
  id v177;
  uint64_t v178;
  BWVideoFormatRequirements *v179;
  id v180;
  BWPixelBufferPool *v181;
  uint64_t v182;
  BWVideoFormatRequirements *v183;
  id v184;
  uint64_t v185;
  BWPixelBufferPool *v186;
  BWVideoFormatRequirements *v187;
  id v188;
  BWPixelBufferPool *v189;
  BWVideoFormatRequirements *v190;
  id v191;
  BWPixelBufferPool *v192;
  NSObject *v193;
  unsigned int v194;
  unsigned int v195;
  uint64_t v196;
  NSObject *v197;
  unsigned int v198;
  unsigned int v199;
  uint64_t v200;
  uint64_t v201;
  BWPixelBufferPool *v202;
  void *v203;
  unint64_t v204;
  int v205;
  unint64_t v206;
  uint64_t v207;
  BWVideoFormatRequirements *v208;
  id v209;
  uint64_t v210;
  BWVideoFormatRequirements *v211;
  id v212;
  NSObject *v213;
  unsigned int v214;
  unsigned int v215;
  uint64_t v216;
  uint64_t v217;
  NSObject *v218;
  unsigned int v219;
  unsigned int v220;
  uint64_t v221;
  uint64_t v222;
  NSObject *v223;
  unsigned int v224;
  unsigned int v225;
  uint64_t v226;
  uint64_t v227;
  NSObject *v228;
  unsigned int v229;
  unsigned int v230;
  uint64_t v231;
  uint64_t v232;
  BWVideoFormatRequirements *v233;
  uint64_t v234;
  uint64_t v235;
  unint64_t v236;
  unint64_t v237;
  id v238;
  int v239;
  int v240;
  BWPixelBufferPool *v241;
  id v242;
  BWVideoFormatRequirements *v243;
  uint64_t v244;
  uint64_t v245;
  BWDeferredContainerPixelBufferPool *v246;
  BWDeferredContainerPixelBufferPool *v247;
  BWPixelBufferPool *v248;
  NSObject *v249;
  unsigned int v250;
  unsigned int v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  BWLearnedNRProcessorController *v255;
  BWLearnedNRProcessorController *v256;
  id v257;
  uint64_t v258;
  void *v259;
  BWPixelBufferPool *v260;
  BWPixelBufferPool *v261;
  BWOnDemandPixelBufferAllocator *v262;
  BWPixelBufferPool *v263;
  BWPixelBufferPool *v264;
  NSObject *v265;
  unsigned int v266;
  unsigned int v267;
  uint64_t v268;
  uint64_t v269;
  uint64_t v270;
  uint64_t v271;
  BWVideoFormatRequirements *v272;
  float v273;
  float v274;
  unsigned int v275;
  float v276;
  float v277;
  unsigned int v278;
  int v279;
  int v280;
  uint64_t v281;
  int v282;
  char v283;
  BWPixelBufferPool *v284;
  void *v285;
  float v286;
  unsigned int v287;
  float v288;
  unsigned int v289;
  int v290;
  int v291;
  BWOnDemandPixelBufferAllocator *v292;
  BWOnDemandPixelBufferAllocator *v293;
  uint64_t v294;
  int *v295;
  BWInferenceEngineController *v296;
  id v297;
  uint64_t v298;
  uint64_t v299;
  uint64_t v300;
  uint64_t v301;
  uint64_t k;
  void *v303;
  void *v304;
  void *v305;
  uint64_t v306;
  uint64_t v307;
  uint64_t v308;
  BWPixelBufferPool *v309;
  uint64_t v310;
  uint64_t v311;
  void *v312;
  void *v313;
  BOOL v314;
  uint64_t v315;
  int v316;
  NSObject *v317;
  unsigned int v318;
  unsigned int v319;
  uint64_t v320;
  NSObject *v321;
  unsigned int v322;
  unsigned int v323;
  uint64_t v324;
  uint64_t v325;
  NSObject *v326;
  unsigned int v327;
  unsigned int v328;
  uint64_t v329;
  uint64_t v330;
  NSObject *v331;
  unsigned int v332;
  unsigned int v333;
  uint64_t v334;
  uint64_t v335;
  NSObject *v336;
  unsigned int v337;
  unsigned int v338;
  uint64_t v339;
  uint64_t v340;
  _BOOL4 v341;
  BOOL v342;
  BOOL v343;
  int v344;
  unsigned int v345;
  int *v346;
  uint64_t v347;
  BOOL v348;
  uint64_t v349;
  uint64_t v350;
  BWVideoFormatRequirements *v351;
  uint64_t v352;
  id v353;
  char v354;
  NSObject *v355;
  unsigned int v356;
  unsigned int v357;
  uint64_t v358;
  BOOL v359;
  uint64_t v360;
  BWPixelBufferPool *v361;
  NSObject *v362;
  unsigned int v363;
  unsigned int v364;
  uint64_t v365;
  uint64_t v366;
  NSObject *v367;
  unsigned int v368;
  unsigned int v369;
  uint64_t v370;
  uint64_t v371;
  NSObject *v372;
  unsigned int v373;
  unsigned int v374;
  uint64_t v375;
  uint64_t v376;
  NSObject *v377;
  unsigned int v378;
  unsigned int v379;
  uint64_t v380;
  uint64_t v381;
  NSObject *v382;
  unsigned int v383;
  unsigned int v384;
  uint64_t v385;
  uint64_t v386;
  BWJasperDisparityProcessorController *v387;
  NSObject *v388;
  unsigned int v389;
  unsigned int v390;
  uint64_t v391;
  uint64_t v392;
  NSObject *v393;
  unsigned int v394;
  unsigned int v395;
  uint64_t v396;
  void *v397;
  void *v398;
  NSObject *v399;
  unsigned int v400;
  unsigned int v401;
  uint64_t v402;
  NSObject *v403;
  unsigned int v404;
  unsigned int v405;
  NSObject *v406;
  unsigned int v407;
  unsigned int v408;
  uint64_t FrameworkRadarComponentName;
  uint64_t v410;
  uint64_t v411;
  uint64_t v412;
  int *v413;
  int *v414;
  int *v415;
  int *v416;
  int *v417;
  int *v418;
  int *v419;
  int *v420;
  int *v421;
  int *v422;
  int *v423;
  uint64_t v424;
  int *v425;
  int *v426;
  int *v427;
  int *v428;
  int *v429;
  int *v430;
  int *v431;
  int *v432;
  int *v433;
  int *v434;
  int *v435;
  int *v436;
  uint64_t v437;
  uint64_t v438;
  uint64_t v439;
  id v440;
  char v441;
  uint64_t v442;
  uint64_t v443;
  uint64_t v444;
  uint64_t v445;
  void *v446;
  void *v447;
  unsigned int v448;
  uint64_t v449;
  unint64_t v450;
  unsigned int v451;
  void *v452;
  uint64_t v453;
  uint64_t v454;
  void *v455;
  unint64_t v456;
  uint64_t v457;
  void *v458;
  void *v459;
  void *v460;
  _BOOL4 v461;
  uint64_t v462;
  unint64_t v463;
  int v464;
  BWInferenceEngineController *v465;
  void *v466;
  void *v467;
  BWSoftISPProcessorController *obj;
  NSArray *obja;
  void *v470;
  BWPixelBufferPool *v471;
  uint64_t v472;
  __int128 v473;
  __int128 v474;
  __int128 v475;
  __int128 v476;
  __int128 v477;
  __int128 v478;
  __int128 v479;
  __int128 v480;
  __int128 v481;
  __int128 v482;
  __int128 v483;
  __int128 v484;
  os_log_type_t type;
  unsigned int v486;
  BWVideoFormatRequirements *v487;
  uint64_t v488;
  uint64_t v489;
  _BYTE v490[128];
  BWVideoFormatRequirements *v491;
  BWVideoFormatRequirements *v492;
  uint64_t v493;
  BWVideoFormatRequirements *v494;
  uint64_t v495;
  BWVideoFormatRequirements *v496;
  BWVideoFormatRequirements *v497;
  uint64_t v498;
  BWVideoFormatRequirements *v499;
  uint64_t v500;
  BWVideoFormatRequirements *v501;
  BWVideoFormatRequirements *v502;
  BWVideoFormatRequirements *v503;
  uint64_t v504;
  BWVideoFormatRequirements *v505;
  uint64_t v506;
  id v507;
  id v508;
  uint64_t v509;
  BWVideoFormatRequirements *v510;
  uint64_t v511;
  BWVideoFormatRequirements *v512;
  uint64_t v513;
  BWVideoFormatRequirements *v514;
  uint64_t v515;
  uint64_t v516;
  BWVideoFormatRequirements *v517;
  uint64_t v518;
  uint64_t v519;
  BWVideoFormatRequirements *v520;
  BWVideoFormatRequirements *v521;
  BWVideoFormatRequirements *v522;
  uint64_t v523;
  BWVideoFormatRequirements *v524;
  uint64_t v525;
  BWVideoFormatRequirements *v526;
  uint64_t v527;
  BWVideoFormatRequirements *v528;
  uint64_t v529;
  uint64_t v530;
  _BYTE v531[128];
  BWVideoFormatRequirements *v532;
  uint64_t v533;
  uint64_t v534;
  BWVideoFormatRequirements *v535;
  uint64_t v536;
  uint64_t v537;
  BWVideoFormatRequirements *v538;
  uint64_t v539;
  uint64_t v540;
  BWVideoFormatRequirements *v541;
  uint64_t v542;
  uint64_t v543;
  BWVideoFormatRequirements *v544;
  BWVideoFormatRequirements *v545;
  uint64_t v546;
  BWVideoFormatRequirements *v547;
  uint64_t v548;
  BWVideoFormatRequirements *v549;
  BWVideoFormatRequirements *v550;
  uint64_t v551;
  BWVideoFormatRequirements *v552;
  uint64_t v553;
  _BYTE v554[128];
  BWVideoFormatRequirements *v555;
  uint64_t v556;
  BWVideoFormatRequirements *v557;
  uint64_t v558;
  BWVideoFormatRequirements *v559;
  uint64_t v560;
  BWVideoFormatRequirements *v561;
  uint64_t v562;
  int v563;
  const char *v564;
  __int16 v565;
  uint64_t v566;
  __int16 v567;
  double v568;
  _QWORD v569[20];

  v569[17] = *MEMORY[0x1E0C80C00];
  if (!result)
    return result;
  v2 = (uint64_t)result;
  result = (BWPixelBufferPool *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  if (*(_QWORD *)(v2 + 168))
    return result;
  v3 = result;
  if (dword_1ECFE9AF0)
  {
    v486 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (!_FigIsCurrentDispatchQueue())
  {
    v437 = v1;
    FigDebugAssert3();
  }
  FigDebugIsInternalBuild();
  v5 = 0x1E0CB3000uLL;
  v6 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), 0);
  mach_absolute_time();
  v454 = v6;
  -[BWPixelBufferPool addObject:](v3, "addObject:", v6);
  v470 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v472 = objc_msgSend(*(id *)(v2 + 16), "memoryPool");
  v460 = (void *)objc_msgSend(*(id *)(v2 + 8), "videoFormat");
  v471 = v3;
  if (-[BWPhotonicEngineNode _requiresResizedOutputDimensionsWithInputWidth:inputHeight:](v2, objc_msgSend(v460, "width"), objc_msgSend(v460, "height")))
  {
    FigDebugIsInternalBuild();
    v7 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), 2);
    mach_absolute_time();
    -[BWPixelBufferPool addObject:](v3, "addObject:", v7);
    result = (BWPixelBufferPool *)objc_msgSend((id)objc_msgSend(*(id *)(v2 + 640), "portTypesWithGeometricDistortionCorrectionEnabled"), "count");
    if (!result)
      goto LABEL_572;
    v8 = -[BWVideoFormatRequirements initWithPixelBufferAttributes:]([BWVideoFormatRequirements alloc], "initWithPixelBufferAttributes:", objc_msgSend((id)objc_msgSend(*(id *)(v2 + 16), "videoFormat"), "pixelBufferAttributes"));
    -[BWVideoFormatRequirements setWidth:](v8, "setWidth:", objc_msgSend(v460, "width"));
    -[BWVideoFormatRequirements setHeight:](v8, "setHeight:", objc_msgSend(v460, "height"));
    -[BWVideoFormatRequirements setWidthAlignment:](v8, "setWidthAlignment:", objc_msgSend(v460, "extendedWidth"));
    -[BWVideoFormatRequirements setHeightAlignment:](v8, "setHeightAlignment:", objc_msgSend(v460, "extendedHeight"));
    v569[0] = v8;
    v9 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v569, 1));
    v10 = objc_msgSend(v460, "extendedWidth");
    result = (BWPixelBufferPool *)objc_msgSend(v9, "extendedWidth");
    if ((BWPixelBufferPool *)v10 != result)
      goto LABEL_572;
    v11 = objc_msgSend(v460, "extendedHeight");
    result = (BWPixelBufferPool *)objc_msgSend(v9, "extendedHeight");
    if ((BWPixelBufferPool *)v11 != result)
      goto LABEL_572;
    result = -[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:]([BWPixelBufferPool alloc], "initWithVideoFormat:capacity:name:memoryPool:", v9, objc_msgSend((id)objc_msgSend(*(id *)(v2 + 16), "preparedPixelBufferPool"), "capacity"), CFSTR("Noise Reduction and Fusion Processor Output Intermediate Pool"), v472);
    *(_QWORD *)(v2 + 240) = result;
    if (!result)
      goto LABEL_572;
    if (dword_1ECFE9AF0)
    {
      v486 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      v12 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    -[BWPixelBufferPool removeLastObject](v3, "removeLastObject", v412, v437);
    v5 = 0x1E0CB3000;
  }
  v449 = *(_QWORD *)(v2 + 808);
  v455 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v13 = (void *)-[BWPhotonicEngineNodeConfiguration dimensionsByQSubResolutionFlavorByPortType](*(_QWORD *)(v2 + 112));
  v14 = BWCommonDimensionsForQSubResolutionFlavor(v13, 2);
  v457 = v14;
  v450 = HIDWORD(v14);
  if (FigCaptureVideoDimensionsAreValid(v14))
  {
    v464 = FigCaptureRoundFloatToMultipleOf(2, (float)((float)((float)(unint64_t)objc_msgSend((id)objc_msgSend(*(id *)(v2 + 344), "inputFormat"), "width")/ (float)(unint64_t)objc_msgSend((id)objc_msgSend(*(id *)(v2 + 344), "inputFormat"), "height"))/ (float)((float)(int)v14 / (float)SHIDWORD(v14)))* (float)(int)v14);
    if (dword_1ECFE9AF0)
    {
      v486 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      v15 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      v5 = 0x1E0CB3000;
    }
    v458 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", v411, v437);
    v463 = HIDWORD(v14);
  }
  else
  {
    v458 = 0;
    v463 = 0;
    v464 = 0;
  }
  v16 = (void *)-[BWPhotonicEngineNodeConfiguration dimensionsByQSubResolutionFlavorByPortType](*(_QWORD *)(v2 + 112));
  v461 = 1;
  v17 = (void *)BWDimensionsWithQSubResolutionFlavor(v16, 1);
  v18 = FigCaptureLargestDimensionsFromDimensionsArray(v17);
  if ((int)v18 <= (int)-[BWPhotonicEngineNodeConfiguration rawSensorDimensions](*(_QWORD *)(v2 + 112)))
  {
    v5 = 0x1E0CB3000;
    v461 = SHIDWORD(v18) > (int)((unint64_t)-[BWPhotonicEngineNodeConfiguration rawSensorDimensions](*(_QWORD *)(v2 + 112)) >> 32);
  }
  v462 = -[BWPhotonicEngineNode _resolvedZoomBasedQSubDimensionsWithSourceZoomBasedQSubDimensions:standardSoftISPOutputDimensions:](v2, v18, objc_msgSend(*(id *)(v2 + 248), "outputDimensions"));
  v456 = HIDWORD(v462);
  if (objc_msgSend(v17, "count") && dword_1ECFE9AF0)
  {
    v486 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    v19 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    v5 = 0x1E0CB3000uLL;
  }
  v459 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", v411, v437);
  v20 = &OBJC_IVAR___BWVisionInferenceProvider__executesRequestsIndividually;
  if (!*(_QWORD *)(v2 + 248))
  {
    v38 = 0;
    goto LABEL_243;
  }
  FigDebugIsInternalBuild();
  v21 = objc_msgSend(*(id *)(v5 + 2368), "stringWithFormat:", CFSTR("%d"), 3);
  mach_absolute_time();
  -[BWPixelBufferPool addObject:](v3, "addObject:", v21);
  obj = -[BWSoftISPProcessorController initWithConfiguration:]([BWSoftISPProcessorController alloc], "initWithConfiguration:", *(_QWORD *)(v2 + 248));
  if (!obj)
    goto LABEL_587;
  FigDebugIsInternalBuild();
  v22 = objc_msgSend(*(id *)(v5 + 2368), "stringWithFormat:", CFSTR("%d"), 4);
  mach_absolute_time();
  -[BWPixelBufferPool addObject:](v3, "addObject:", v22);
  v466 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v23 = 0x1E0C99000uLL;
  v444 = v22;
  v445 = v21;
  if ((objc_msgSend(*(id *)(v2 + 344), "fusionEnabled") & 1) != 0
    || (objc_msgSend(*(id *)(v2 + 344), "lowLightFusionEnabled") & 1) != 0
    || (objc_msgSend(*(id *)(v2 + 344), "rawNightModeEnabled") & 1) != 0
    || objc_msgSend(*(id *)(v2 + 344), "demosaicedRawEnabled")
    && (objc_msgSend(*(id *)(v2 + 112), "deferredPhotoProcessorEnabled") & 1) == 0)
  {
    v24 = -[BWSoftISPProcessorController outputPixelFormatForCaptureType:processingMode:](obj, "outputPixelFormatForCaptureType:processingMode:", 10, 0);
    v25 = objc_alloc_init(BWVideoFormatRequirements);
    -[BWVideoFormatRequirements setWidth:](v25, "setWidth:", (int)objc_msgSend(*(id *)(v2 + 248), "outputDimensions"));
    -[BWVideoFormatRequirements setHeight:](v25, "setHeight:", objc_msgSend(*(id *)(v2 + 248), "outputDimensions") >> 32);
    -[BWVideoFormatRequirements setWidthAlignment:](v25, "setWidthAlignment:", 16);
    -[BWVideoFormatRequirements setHeightAlignment:](v25, "setHeightAlignment:", 16);
    v562 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v24);
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v25, "setSupportedPixelFormats:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v562, 1));
    v561 = v25;
    v26 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v561, 1));
    v27 = objc_msgSend(*(id *)(v2 + 344), "fusionEnabled");
    v28 = [BWPixelBufferPool alloc];
    if (v27)
      v29 = 8;
    else
      v29 = 1;
    v30 = -[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:](v28, "initWithVideoFormat:capacity:name:memoryPool:", v26, v29, CFSTR("YUV SoftISP output pool"), v472);
    if (!v30)
      goto LABEL_587;
    v31 = (void *)v30;
    v448 = v24;
    objc_msgSend(v466, "setObject:forKeyedSubscript:", v30, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v24));

  }
  else
  {
    v448 = 0;
  }
  if (*(_QWORD *)(v2 + 584))
  {
    v32 = -[BWSoftISPProcessorController outputPixelFormatForCaptureType:processingMode:](obj, "outputPixelFormatForCaptureType:processingMode:", 2, 0);
    v33 = (void *)objc_msgSend(v466, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v32));
    if (*(_QWORD *)(v2 + 624))
      v34 = 4;
    else
      v34 = 3;
    if (v33)
    {
      v35 = v33;
      v36 = objc_msgSend(v33, "capacity");
      if (v36 <= v34)
        v37 = v34;
      else
        v37 = v36;
      if (v37 != objc_msgSend(v35, "capacity"))
        objc_msgSend(v35, "setCapacity:", v37);
    }
    else
    {
      v39 = objc_alloc_init(BWVideoFormatRequirements);
      -[BWVideoFormatRequirements setWidth:](v39, "setWidth:", (int)objc_msgSend(*(id *)(v2 + 248), "outputDimensions"));
      -[BWVideoFormatRequirements setHeight:](v39, "setHeight:", objc_msgSend(*(id *)(v2 + 248), "outputDimensions") >> 32);
      -[BWVideoFormatRequirements setWidthAlignment:](v39, "setWidthAlignment:", 16);
      -[BWVideoFormatRequirements setHeightAlignment:](v39, "setHeightAlignment:", 16);
      v560 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v32);
      -[BWVideoFormatRequirements setSupportedPixelFormats:](v39, "setSupportedPixelFormats:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v560, 1));
      v559 = v39;
      v40 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v559, 1));
      result = -[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:]([BWPixelBufferPool alloc], "initWithVideoFormat:capacity:name:memoryPool:", v40, v34, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SoftISP output pool (%@)"), BWStringForOSType(v32)), v472);
      if (!result)
        goto LABEL_572;
      v41 = result;
      objc_msgSend(v466, "setObject:forKeyedSubscript:", result, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v32));

    }
  }
  if (*(_QWORD *)(v2 + 392) && (-[BWPhotonicEngineNodeConfiguration learnedNRMode](*(_QWORD *)(v2 + 112)) & 1) != 0
    || (objc_msgSend(*(id *)(v2 + 344), "learnedNRMode") & 0x10) != 0)
  {
    v42 = -[BWSoftISPProcessorController outputPixelFormatForCaptureType:captureFlags:processingMode:](obj, "outputPixelFormatForCaptureType:captureFlags:processingMode:", 1, 128, 0);
    v43 = objc_alloc_init(BWVideoFormatRequirements);
    -[BWVideoFormatRequirements setWidth:](v43, "setWidth:", (int)objc_msgSend(*(id *)(v2 + 248), "outputDimensions"));
    -[BWVideoFormatRequirements setHeight:](v43, "setHeight:", objc_msgSend(*(id *)(v2 + 248), "outputDimensions") >> 32);
    -[BWVideoFormatRequirements setWidthAlignment:](v43, "setWidthAlignment:", 16);
    -[BWVideoFormatRequirements setHeightAlignment:](v43, "setHeightAlignment:", 16);
    v451 = v42;
    v558 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v42);
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v43, "setSupportedPixelFormats:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v558, 1));
    v557 = v43;
    v44 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v557, 1));
    v45 = objc_alloc_init(BWVideoFormatRequirements);
    -[BWVideoFormatRequirements setWidth:](v45, "setWidth:", (int)objc_msgSend(*(id *)(v2 + 248), "outputDimensions"));
    -[BWVideoFormatRequirements setHeight:](v45, "setHeight:", objc_msgSend(*(id *)(v2 + 248), "outputDimensions") >> 32);
    -[BWVideoFormatRequirements setWidthAlignment:](v45, "setWidthAlignment:", 16);
    -[BWVideoFormatRequirements setHeightAlignment:](v45, "setHeightAlignment:", 16);
    v556 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 1751527984);
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v45, "setSupportedPixelFormats:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v556, 1));
    v555 = v45;
    v46 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v555, 1));
    objc_msgSend(*(id *)(v2 + 392), "setInputFormatsByQSubResolutionFlavor:", pen_inputFormatsByQSubResolutionFlavorByAddingFormatForFlavor(0, 0, (uint64_t)v44));
    objc_msgSend(*(id *)(v2 + 392), "setOutputFormat:", v46);
    v483 = 0u;
    v484 = 0u;
    v481 = 0u;
    v482 = 0u;
    v47 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v481, v554, 16);
    if (v47)
    {
      v48 = v47;
      v49 = *(_QWORD *)v482;
      do
      {
        for (i = 0; i != v48; ++i)
        {
          if (*(_QWORD *)v482 != v49)
            objc_enumerationMutation(v17);
          v51 = FigCaptureDimensionsFromDictionaryRepresentation(*(void **)(*((_QWORD *)&v481 + 1) + 8 * i));
          if ((_DWORD)v51 == -[BWPhotonicEngineNodeConfiguration rawSensorDimensions](*(_QWORD *)(v2 + 112))
            && HIDWORD(v51) == (unint64_t)-[BWPhotonicEngineNodeConfiguration rawSensorDimensions](*(_QWORD *)(v2 + 112)) >> 32)
          {
            objc_msgSend(*(id *)(v2 + 392), "setInputFormatsByQSubResolutionFlavor:", pen_inputFormatsByQSubResolutionFlavorByAddingFormatForFlavor(objc_msgSend(*(id *)(v2 + 392), "inputFormatsByQSubResolutionFlavor"), 1, (uint64_t)v44));
          }
        }
        v48 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v481, v554, 16);
      }
      while (v48);
    }
    if ((objc_msgSend(*(id *)(v2 + 344), "learnedNRMode") & 0x10) != 0)
      objc_msgSend(*(id *)(v2 + 344), "setLearnedNRInputFormat:", v44);
    v52 = (void *)objc_msgSend(v466, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v451));
    if (v52)
    {
      v53 = v52;
      v54 = objc_msgSend(v52, "capacity");
      if (v54 <= 1)
        v55 = 1;
      else
        v55 = v54;
      v23 = 0x1E0C99000;
      if (v55 != objc_msgSend(v53, "capacity"))
        objc_msgSend(v53, "setCapacity:", v55);
    }
    else
    {
      result = -[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:]([BWPixelBufferPool alloc], "initWithVideoFormat:capacity:name:memoryPool:", v44, 1, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SoftISP output pool (%@)"), BWStringForOSType(v451)), v472);
      if (!result)
        goto LABEL_572;
      v56 = result;
      objc_msgSend(v466, "setObject:forKeyedSubscript:", result, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v451));

      v23 = 0x1E0C99000uLL;
    }
  }
  if (objc_msgSend(*(id *)(v2 + 344), "rawNightModeEnabled"))
  {
    v57 = -[BWSoftISPProcessorController outputPixelFormatForCaptureType:captureFlags:processingMode:](obj, "outputPixelFormatForCaptureType:captureFlags:processingMode:", 11, 0x800000000, 0);
    v58 = objc_alloc_init(BWVideoFormatRequirements);
    -[BWVideoFormatRequirements setWidth:](v58, "setWidth:", (int)objc_msgSend(*(id *)(v2 + 248), "outputDimensions"));
    -[BWVideoFormatRequirements setHeight:](v58, "setHeight:", objc_msgSend(*(id *)(v2 + 248), "outputDimensions") >> 32);
    -[BWVideoFormatRequirements setWidthAlignment:](v58, "setWidthAlignment:", 16);
    -[BWVideoFormatRequirements setHeightAlignment:](v58, "setHeightAlignment:", 16);
    v553 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v57);
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v58, "setSupportedPixelFormats:", objc_msgSend(*(id *)(v23 + 3360), "arrayWithObjects:count:", &v553, 1));
    v552 = v58;
    v59 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", objc_msgSend(*(id *)(v23 + 3360), "arrayWithObjects:count:", &v552, 1));
    objc_msgSend(*(id *)(v2 + 344), "setRawNightModeInputFormat:", v59);
    v60 = (void *)objc_msgSend(v466, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v57));
    if (v60)
    {
      v61 = v60;
      v62 = objc_msgSend(v60, "capacity");
      if (v62 <= 7)
        v63 = 7;
      else
        v63 = v62;
      if (v63 != objc_msgSend(v61, "capacity"))
        objc_msgSend(v61, "setCapacity:", v63);
    }
    else
    {
      result = -[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:]([BWPixelBufferPool alloc], "initWithVideoFormat:capacity:name:memoryPool:", v59, 7, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SoftISP output pool (%@)"), BWStringForOSType(v57)), v472);
      if (!result)
        goto LABEL_572;
      v64 = result;
      objc_msgSend(v466, "setObject:forKeyedSubscript:", result, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v57));

    }
  }
  v65 = -[BWPhotonicEngineNode _deepFusionEnhancedResolutionOutputDimensions](v2);
  if ((objc_msgSend(*(id *)(v2 + 344), "deepFusionEnabled") & 1) != 0 || *(_QWORD *)(v2 + 408))
  {
    v66 = -[BWSoftISPProcessorController outputPixelFormatForCaptureType:processingMode:](obj, "outputPixelFormatForCaptureType:processingMode:", 12, 0);
    v67 = objc_alloc_init(BWVideoFormatRequirements);
    -[BWVideoFormatRequirements setWidth:](v67, "setWidth:", (int)objc_msgSend(*(id *)(v2 + 248), "outputDimensions"));
    -[BWVideoFormatRequirements setHeight:](v67, "setHeight:", objc_msgSend(*(id *)(v2 + 248), "outputDimensions") >> 32);
    -[BWVideoFormatRequirements setWidthAlignment:](v67, "setWidthAlignment:", 16);
    -[BWVideoFormatRequirements setHeightAlignment:](v67, "setHeightAlignment:", 16);
    v551 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v66);
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v67, "setSupportedPixelFormats:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v551, 1));
    v550 = v67;
    v68 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v550, 1));
    objc_msgSend(*(id *)(v2 + 344), "setDeepFusionInputFormat:", v68);
    v69 = 0;
    if (objc_msgSend(*(id *)(v2 + 112), "deferredPhotoProcessorEnabled"))
      v69 = -[BWPhotonicEngineNodeConfiguration ultraHighResolutionProcessingEnabled](*(_QWORD *)(v2 + 112));
    if (FigCaptureVideoDimensionsAreValid(objc_msgSend(*(id *)(v2 + 112), "stereoPhotoOutputDimensions")))
      v70 = (-[BWPhotonicEngineNodeConfiguration learnedNRMode](*(_QWORD *)(v2 + 112)) >> 2) & 1;
    else
      v70 = 0;
    v71 = objc_msgSend(*(id *)(v2 + 112), "deferredCaptureSupportEnabled");
    if ((v69 & (v70 ^ 1)) != 0)
      v72 = 0;
    else
      v72 = 5;
    if (v71)
      v73 = 2;
    else
      v73 = v72;
    v74 = (void *)objc_msgSend(v466, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v66));
    if (v74)
    {
      v75 = v74;
      v76 = objc_msgSend(v74, "capacity");
      if (v76 > v73)
        v73 = v76;
      if (v73 != objc_msgSend(v75, "capacity"))
        objc_msgSend(v75, "setCapacity:", v73);
    }
    else
    {
      result = -[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:]([BWPixelBufferPool alloc], "initWithVideoFormat:capacity:name:memoryPool:", v68, v73, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SoftISP output pool (%@)"), BWStringForOSType(v66)), v472);
      if (!result)
        goto LABEL_572;
      v77 = result;
      objc_msgSend(v466, "setObject:forKeyedSubscript:", result, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v66));

    }
    if (-[BWPhotonicEngineNodeConfiguration gainMapMainImageDownscalingFactor](*(_QWORD *)(v2 + 112)) != 0.0
      && FigCaptureVideoDimensionsAreValid(v65))
    {
      v78 = objc_alloc_init(BWVideoFormatRequirements);
      -[BWVideoFormatRequirements setSupportedPixelFormats:](v78, "setSupportedPixelFormats:", &unk_1E4A02330);
      -[BWVideoFormatRequirements setWidth:](v78, "setWidth:", (unint64_t)(float)((float)(int)v65/ -[BWPhotonicEngineNodeConfiguration gainMapMainImageDownscalingFactor](*(_QWORD *)(v2 + 112))));
      -[BWVideoFormatRequirements setHeight:](v78, "setHeight:", (unint64_t)(float)((float)SHIDWORD(v65)/ -[BWPhotonicEngineNodeConfiguration gainMapMainImageDownscalingFactor](*(_QWORD *)(v2 + 112))));
      -[BWVideoFormatRequirements setWidthAlignment:](v78, "setWidthAlignment:", 8);
      -[BWVideoFormatRequirements setHeightAlignment:](v78, "setHeightAlignment:", 8);
      v549 = v78;
      v79 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v549, 1));
      v80 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Deep Fusion Enhanced Resolution Gain Map pool (%@)"), BWStringForOSType(0x4C303038u));
      result = -[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:]([BWPixelBufferPool alloc], "initWithVideoFormat:capacity:name:memoryPool:", v79, (int)-[BWPhotonicEngineNodeConfiguration outputBufferCount](*(_QWORD *)(v2 + 112)), v80, v472);
      *(_QWORD *)(v2 + 448) = result;
      if (!result)
        goto LABEL_572;
    }
  }
  if (*(_QWORD *)(v2 + 760))
  {
    v81 = -[BWPhotonicEngineNode _disparityProcessorInputDimensions](v2);
    v82 = -[BWSoftISPProcessorController outputPixelFormatForCaptureType:processingMode:](obj, "outputPixelFormatForCaptureType:processingMode:", 10, 3);
    v83 = objc_alloc_init(BWVideoFormatRequirements);
    -[BWVideoFormatRequirements setWidth:](v83, "setWidth:", (int)v81);
    -[BWVideoFormatRequirements setHeight:](v83, "setHeight:", v81 >> 32);
    v548 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v82);
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v83, "setSupportedPixelFormats:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v548, 1));
    v547 = v83;
    v84 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v547, 1));
    v85 = 2 * objc_msgSend(*(id *)(v2 + 16), "owningNodeRetainedBufferCount") + 2;
    v86 = objc_msgSend((id)objc_msgSend(*(id *)(v2 + 16), "primaryMediaConfiguration"), "pixelBufferPoolProvidesBackPressure");
    LOBYTE(v414) = v86;
    result = -[BWPixelBufferPool initWithVideoFormat:capacity:name:clientProvidesPool:memoryPool:providesBackPressure:reportSlowBackPressureAllocations:]([BWPixelBufferPool alloc], "initWithVideoFormat:capacity:name:clientProvidesPool:memoryPool:providesBackPressure:reportSlowBackPressureAllocations:", v84, v85, CFSTR("Disparity Processor Input SoftISP output pool"), 0, v472, v86, v414);
    if (!result)
      goto LABEL_572;
    v87 = result;
    objc_msgSend(v466, "setObject:forKeyedSubscript:", result, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v82));

  }
  v88 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v89 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = v471;
  v452 = v89;
  if (!FigCaptureVideoDimensionsAreValid(v457))
    goto LABEL_188;
  FigDebugIsInternalBuild();
  v90 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), 5);
  mach_absolute_time();
  v443 = v90;
  -[BWPixelBufferPool addObject:](v471, "addObject:", v90);
  v446 = v88;
  objc_msgSend(v88, "setObject:forKeyedSubscript:", FigCaptureDictionaryRepresentationForDimensions(v464 | (v463 << 32)), &unk_1E49FC6A8);
  if (*(_QWORD *)(v2 + 408) && FigCaptureVideoDimensionsAreValid(v65))
  {
    v91 = -[BWSoftISPProcessorController outputPixelFormatForCaptureType:processingMode:](obj, "outputPixelFormatForCaptureType:processingMode:", 12, 0);
    v92 = objc_alloc_init(BWVideoFormatRequirements);
    -[BWVideoFormatRequirements setWidth:](v92, "setWidth:", v464);
    -[BWVideoFormatRequirements setHeight:](v92, "setHeight:", (int)v463);
    -[BWVideoFormatRequirements setWidthAlignment:](v92, "setWidthAlignment:", 16);
    -[BWVideoFormatRequirements setHeightAlignment:](v92, "setHeightAlignment:", 16);
    v546 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v91);
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v92, "setSupportedPixelFormats:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v546, 1));
    v545 = v92;
    result = -[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:]([BWPixelBufferPool alloc], "initWithVideoFormat:capacity:name:memoryPool:", +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v545, 1)), 1, CFSTR("Deep Fusion Ultra High Resolution SoftISP output pool"), v472);
    if (!result)
      goto LABEL_572;
    v93 = result;
    objc_msgSend(v458, "setObject:forKeyedSubscript:", result, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v91));

    v94 = -[BWPhotonicEngineNodeConfiguration semanticStyleRenderingEnabled](*(_QWORD *)(v2 + 112))
       && !FigCaptureVideoDimensionsAreValid(objc_msgSend(*(id *)(v2 + 688), "stereoPhotoOutputDimensions"));
    v95 = objc_alloc_init(BWVideoFormatRequirements);
    -[BWVideoFormatRequirements setWidth:](v95, "setWidth:");
    v442 = v65 >> 32;
    -[BWVideoFormatRequirements setHeight:](v95, "setHeight:");
    -[BWVideoFormatRequirements setWidthAlignment:](v95, "setWidthAlignment:", 16);
    -[BWVideoFormatRequirements setHeightAlignment:](v95, "setHeightAlignment:", 16);
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v95, "setSupportedPixelFormats:", &unk_1E4A02348);
    v544 = v95;
    v96 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v544, 1));
    result = -[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:]([BWPixelBufferPool alloc], "initWithVideoFormat:capacity:name:memoryPool:", v96, 1, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Deep Zoom Transfer high resolution input pool (%@)"), BWStringForOSType(0x68663230u)), v472);
    *(_QWORD *)(v2 + 704) = result;
    if (!result)
      goto LABEL_572;
    v97 = 1751527984;
    if (!v94)
      v97 = objc_msgSend((id)objc_msgSend(*(id *)(v2 + 16), "videoFormat"), "pixelFormat");
    v98 = objc_alloc_init(BWVideoFormatRequirements);
    -[BWVideoFormatRequirements setWidth:](v98, "setWidth:", (int)v65);
    -[BWVideoFormatRequirements setHeight:](v98, "setHeight:", v442);
    -[BWVideoFormatRequirements setWidthAlignment:](v98, "setWidthAlignment:", 16);
    -[BWVideoFormatRequirements setHeightAlignment:](v98, "setHeightAlignment:", 16);
    v543 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v97);
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v98, "setSupportedPixelFormats:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v543, 1));
    if (objc_msgSend(v460, "colorSpaceProperties"))
    {
      v542 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v460, "colorSpaceProperties"));
      v99 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v542, 1);
    }
    else
    {
      v99 = 0;
    }
    -[BWVideoFormatRequirements setSupportedColorSpaceProperties:](v98, "setSupportedColorSpaceProperties:", v99);
    v541 = v98;
    v100 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v541, 1));
    v101 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Deep Zoom Transfer output pool (%@)"), BWStringForOSType(v97));
    result = -[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:]([BWPixelBufferPool alloc], "initWithVideoFormat:capacity:name:memoryPool:", v100, (int)-[BWPhotonicEngineNodeConfiguration maxDeepFusionOutputCount](*(_QWORD *)(v2 + 112)), v101, v472);
    *(_QWORD *)(v2 + 712) = result;
    if (!result)
      goto LABEL_572;
    if (v94)
    {
      v102 = objc_msgSend((id)objc_msgSend(*(id *)(v2 + 16), "videoFormat"), "pixelFormat");
      v103 = objc_alloc_init(BWVideoFormatRequirements);
      -[BWVideoFormatRequirements setWidth:](v103, "setWidth:", objc_msgSend((id)objc_msgSend(*(id *)(v2 + 16), "videoFormat"), "width"));
      -[BWVideoFormatRequirements setHeight:](v103, "setHeight:", objc_msgSend((id)objc_msgSend(*(id *)(v2 + 16), "videoFormat"), "height"));
      -[BWVideoFormatRequirements setWidthAlignment:](v103, "setWidthAlignment:", 16);
      -[BWVideoFormatRequirements setHeightAlignment:](v103, "setHeightAlignment:", 16);
      v540 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v102);
      -[BWVideoFormatRequirements setSupportedPixelFormats:](v103, "setSupportedPixelFormats:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v540, 1));
      if (objc_msgSend(v460, "colorSpaceProperties"))
      {
        v539 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v460, "colorSpaceProperties"));
        v104 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v539, 1);
      }
      else
      {
        v104 = 0;
      }
      -[BWVideoFormatRequirements setSupportedColorSpaceProperties:](v103, "setSupportedColorSpaceProperties:", v104);
      v538 = v103;
      v105 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v538, 1));
      result = -[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:]([BWPixelBufferPool alloc], "initWithVideoFormat:capacity:name:memoryPool:", v105, 1, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Deep Fusion Enhanced Resolution output pool (%@)"), BWStringForOSType(0x68663230u)), v472);
      *(_QWORD *)(v2 + 440) = result;
      if (!result)
        goto LABEL_572;
      v106 = objc_alloc_init(BWVideoFormatRequirements);
      -[BWVideoFormatRequirements setWidth:](v106, "setWidth:", (int)v65);
      -[BWVideoFormatRequirements setHeight:](v106, "setHeight:", v442);
      -[BWVideoFormatRequirements setWidthAlignment:](v106, "setWidthAlignment:", 16);
      -[BWVideoFormatRequirements setHeightAlignment:](v106, "setHeightAlignment:", 16);
      v537 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend((id)objc_msgSend(*(id *)(v2 + 16), "videoFormat"), "pixelFormat"));
      -[BWVideoFormatRequirements setSupportedPixelFormats:](v106, "setSupportedPixelFormats:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v537, 1));
      if (objc_msgSend(v460, "colorSpaceProperties"))
      {
        v536 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v460, "colorSpaceProperties"));
        v107 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v536, 1);
      }
      else
      {
        v107 = 0;
      }
      -[BWVideoFormatRequirements setSupportedColorSpaceProperties:](v106, "setSupportedColorSpaceProperties:", v107);
      v535 = v106;
      v108 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v535, 1));
      result = -[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:]([BWPixelBufferPool alloc], "initWithVideoFormat:capacity:name:memoryPool:", v108, 1, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Deep Fusion Enhanced Resolution Semantic Style output pool (%@)"), BWStringForOSType(0x68663230u)), v472);
      *(_QWORD *)(v2 + 456) = result;
      if (!result)
        goto LABEL_572;
    }
    objc_msgSend(*(id *)(v2 + 688), "setOutputFormat:", v100);
    objc_msgSend(*(id *)(v2 + 408), "setMaxInputDimensions:", v464 | (v463 << 32));
    objc_msgSend(*(id *)(v2 + 408), "setMaxOutputDimensions:", v65);
    if (v449)
    {
      v109 = objc_alloc_init(BWVideoFormatRequirements);
      -[BWVideoFormatRequirements setWidth:](v109, "setWidth:", (int)v65);
      -[BWVideoFormatRequirements setHeight:](v109, "setHeight:", v442);
      -[BWVideoFormatRequirements setWidthAlignment:](v109, "setWidthAlignment:", 16);
      -[BWVideoFormatRequirements setHeightAlignment:](v109, "setHeightAlignment:", 16);
      v534 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend((id)objc_msgSend(*(id *)(v2 + 16), "videoFormat"), "pixelFormat"));
      -[BWVideoFormatRequirements setSupportedPixelFormats:](v109, "setSupportedPixelFormats:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v534, 1));
      if (objc_msgSend(v460, "colorSpaceProperties"))
      {
        v533 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v460, "colorSpaceProperties"));
        v110 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v533, 1);
      }
      else
      {
        v110 = 0;
      }
      -[BWVideoFormatRequirements setSupportedColorSpaceProperties:](v109, "setSupportedColorSpaceProperties:", v110);
      v532 = v109;
      v111 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v532, 1));
      v112 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Smart Style Enhanced Resolution output pool (%@)"), BWStringForOSType(objc_msgSend((id)objc_msgSend(*(id *)(v2 + 16), "videoFormat"), "pixelFormat")));
      result = -[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:]([BWPixelBufferPool alloc], "initWithVideoFormat:capacity:name:memoryPool:", v111, (int)-[BWPhotonicEngineNodeConfiguration maxDeepFusionOutputCount](*(_QWORD *)(v2 + 112)), v112, v472);
      *(_QWORD *)(v2 + 824) = result;
      if (!result)
        goto LABEL_572;
    }
    *(_DWORD *)(v2 + 720) = 0;
  }
  if (-[BWPhotonicEngineNodeConfiguration ultraHighResolutionProcessingEnabled](*(_QWORD *)(v2 + 112)))
  {
    v479 = 0u;
    v480 = 0u;
    v477 = 0u;
    v478 = 0u;
    v113 = (void *)-[BWPhotonicEngineNodeConfiguration dimensionsByQSubResolutionFlavorByPortType](*(_QWORD *)(v2 + 112));
    v114 = BWPortTypesWithQSubResolutionFlavor(v113, 2);
    v115 = objc_msgSend(v114, "countByEnumeratingWithState:objects:count:", &v477, v531, 16);
    if (v115)
    {
      v116 = v115;
      v117 = *(_QWORD *)v478;
      v118 = v460;
      while (2)
      {
        for (j = 0; j != v116; ++j)
        {
          if (*(_QWORD *)v478 != v117)
            objc_enumerationMutation(v114);
          v120 = *(_QWORD *)(*((_QWORD *)&v477 + 1) + 8 * j);
          if ((objc_msgSend((id)-[BWPhotonicEngineNodeConfiguration portTypesWithGeometricDistortionCorrectionEnabled](*(_QWORD *)(v2 + 112)), "containsObject:", v120) & 1) != 0|| (objc_msgSend((id)-[BWPhotonicEngineNodeConfiguration portTypesWithIntelligentDistortionCorrectionEnabled](*(_QWORD *)(v2 + 112)), "containsObject:", v120) & 1) != 0)
          {
            v121 = 1;
            goto LABEL_151;
          }
        }
        v116 = objc_msgSend(v114, "countByEnumeratingWithState:objects:count:", &v477, v531, 16);
        v121 = 0;
        if (v116)
          continue;
        break;
      }
    }
    else
    {
      v121 = 0;
      v118 = v460;
    }
LABEL_151:
    v122 = objc_msgSend((id)objc_msgSend(*(id *)(v2 + 16), "videoFormat"), "pixelFormat");
    v123 = objc_alloc_init(BWVideoFormatRequirements);
    -[BWVideoFormatRequirements setWidth:](v123, "setWidth:");
    -[BWVideoFormatRequirements setHeight:](v123, "setHeight:");
    -[BWVideoFormatRequirements setBytesPerRowAlignment:](v123, "setBytesPerRowAlignment:", 16);
    -[BWVideoFormatRequirements setHeightAlignment:](v123, "setHeightAlignment:", 16);
    v530 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v122);
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v123, "setSupportedPixelFormats:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v530, 1));
    if (objc_msgSend(v118, "colorSpaceProperties"))
    {
      v529 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v118, "colorSpaceProperties"));
      v124 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v529, 1);
    }
    else
    {
      v124 = 0;
    }
    v125 = v464 | (v463 << 32);
    -[BWVideoFormatRequirements setSupportedColorSpaceProperties:](v123, "setSupportedColorSpaceProperties:", v124);
    v528 = v123;
    v441 = v121;
    v126 = -[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:]([BWPixelBufferPool alloc], "initWithVideoFormat:capacity:name:memoryPool:", +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v528, 1)), (uint64_t)(int)-[BWPhotonicEngineNodeConfiguration outputBufferCount](*(_QWORD *)(v2 + 112)) << v121, CFSTR("Ultra High Resolution output pool"), v472);
    if (v126)
    {
      v127 = v126;
      objc_msgSend(v458, "setObject:forKeyedSubscript:", v126, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v122));

      v128 = v452;
      if ((objc_msgSend(*(id *)(v2 + 112), "deferredPhotoProcessorEnabled") & 1) != 0)
        goto LABEL_158;
      v129 = -[BWSoftISPProcessorController outputPixelFormatForCaptureType:processingMode:](obj, "outputPixelFormatForCaptureType:processingMode:", 1, 0);
      v130 = objc_alloc_init(BWVideoFormatRequirements);
      -[BWVideoFormatRequirements setWidth:](v130, "setWidth:", v464);
      -[BWVideoFormatRequirements setHeight:](v130, "setHeight:", (int)v463);
      -[BWVideoFormatRequirements setWidthAlignment:](v130, "setWidthAlignment:", 16);
      -[BWVideoFormatRequirements setHeightAlignment:](v130, "setHeightAlignment:", 16);
      v527 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v129);
      -[BWVideoFormatRequirements setSupportedPixelFormats:](v130, "setSupportedPixelFormats:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v527, 1));
      v526 = v130;
      v131 = -[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:]([BWPixelBufferPool alloc], "initWithVideoFormat:capacity:name:memoryPool:", +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v526, 1)), 1, CFSTR("Ultra High Resolution YUV SoftISP output pool"), v472);
      if (v131)
      {
        v132 = v131;
        objc_msgSend(v458, "setObject:forKeyedSubscript:", v131, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v129));

        v128 = v452;
LABEL_158:
        objc_msgSend(v128, "setObject:forKeyedSubscript:", FigCaptureDictionaryRepresentationForDimensions(v464 | (v463 << 32)), &unk_1E49FC6A8);
        if (*(_QWORD *)(v2 + 392)
          && (-[BWPhotonicEngineNodeConfiguration learnedNRMode](*(_QWORD *)(v2 + 112)) & 4) != 0)
        {
          v133 = -[BWSoftISPProcessorController outputPixelFormatForCaptureType:captureFlags:processingMode:isQuadra:](obj, "outputPixelFormatForCaptureType:captureFlags:processingMode:isQuadra:", 1, 128, 0, 1);
          v134 = objc_alloc_init(BWVideoFormatRequirements);
          -[BWVideoFormatRequirements setWidth:](v134, "setWidth:", v464);
          -[BWVideoFormatRequirements setHeight:](v134, "setHeight:", (int)v463);
          -[BWVideoFormatRequirements setWidthAlignment:](v134, "setWidthAlignment:", 16);
          -[BWVideoFormatRequirements setHeightAlignment:](v134, "setHeightAlignment:", 16);
          v525 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v133);
          -[BWVideoFormatRequirements setSupportedPixelFormats:](v134, "setSupportedPixelFormats:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v525, 1));
          v524 = v134;
          v440 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v524, 1));
          v135 = objc_alloc_init(BWVideoFormatRequirements);
          -[BWVideoFormatRequirements setWidth:](v135, "setWidth:", v464);
          -[BWVideoFormatRequirements setHeight:](v135, "setHeight:", (int)v463);
          -[BWVideoFormatRequirements setWidthAlignment:](v135, "setWidthAlignment:", 16);
          -[BWVideoFormatRequirements setHeightAlignment:](v135, "setHeightAlignment:", 16);
          v523 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 1751527984);
          -[BWVideoFormatRequirements setSupportedPixelFormats:](v135, "setSupportedPixelFormats:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v523, 1));
          v522 = v135;
          v136 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v522, 1));
          v137 = (void *)objc_msgSend(v458, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:"));
          if (v137)
          {
            v138 = v137;
            v139 = (uint64_t)v440;
            v140 = objc_msgSend(v137, "capacity");
            if (v140 <= 1)
              v141 = 1;
            else
              v141 = v140;
            v125 = v464 | (v463 << 32);
            if (v141 != objc_msgSend(v138, "capacity"))
              objc_msgSend(v138, "setCapacity:", v141);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Ultra High Resolution SoftISP output pool (%@)"), BWStringForOSType(v133));
            v139 = (uint64_t)v440;
            result = -[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:]([BWPixelBufferPool alloc], "initWithVideoFormat:capacity:name:memoryPool:");
            v125 = v464 | (v463 << 32);
            if (!result)
              goto LABEL_572;
            v142 = result;
            objc_msgSend(v458, "setObject:forKeyedSubscript:", result, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v133));

          }
          objc_msgSend(*(id *)(v2 + 392), "setInputFormatsByQSubResolutionFlavor:", pen_inputFormatsByQSubResolutionFlavorByAddingFormatForFlavor(objc_msgSend(*(id *)(v2 + 392), "inputFormatsByQSubResolutionFlavor"), 2, v139));
          objc_msgSend(*(id *)(v2 + 392), "setUltraHighResolutionOutputFormat:", v136);
        }
        v143 = v441;
        if (objc_msgSend(*(id *)(v2 + 344), "demosaicedRawEnabled"))
        {
          v144 = -[BWPhotonicEngineNode _demosaicedRawFormatRequirementsWithDimensions:colorSpaceProperties:](v2, v125, objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(v2 + 16), "formatRequirements"), "supportedColorSpaceProperties"), "firstObject"), "intValue"));
          -[BWVideoFormatRequirements setWidthAlignment:](v144, "setWidthAlignment:", 16);
          -[BWVideoFormatRequirements setHeightAlignment:](v144, "setHeightAlignment:", 16);
          v521 = v144;
          v145 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v521, 1));
          v146 = (uint64_t)(int)-[BWPhotonicEngineNodeConfiguration outputBufferCount](*(_QWORD *)(v2 + 112)) << v441;
          v147 = (void *)objc_msgSend(v458, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v145, "pixelFormat")));
          if (v147)
          {
            objc_msgSend(v147, "setCapacity:", objc_msgSend(v147, "capacity") + v146);
          }
          else
          {
            result = -[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:]([BWPixelBufferPool alloc], "initWithVideoFormat:capacity:name:memoryPool:", v145, v146, CFSTR("Ultra High Resolution Demosaiced RAW pool"), v472);
            if (!result)
              goto LABEL_572;
            v148 = result;
            objc_msgSend(v458, "setObject:forKeyedSubscript:", result, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v145, "pixelFormat")));

            v143 = v441;
          }
        }
        v149 = objc_alloc_init(BWVideoFormatRequirements);
        -[BWVideoFormatRequirements setSupportedPixelFormats:](v149, "setSupportedPixelFormats:", &unk_1E4A02360);
        -[BWVideoFormatRequirements setWidth:](v149, "setWidth:", (unint64_t)(float)((float)v464/ -[BWPhotonicEngineNodeConfiguration gainMapMainImageDownscalingFactor](*(_QWORD *)(v2 + 112))));
        -[BWVideoFormatRequirements setHeight:](v149, "setHeight:", (unint64_t)(float)((float)(int)v463/ -[BWPhotonicEngineNodeConfiguration gainMapMainImageDownscalingFactor](*(_QWORD *)(v2 + 112))));
        v520 = v149;
        result = -[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:]([BWPixelBufferPool alloc], "initWithVideoFormat:capacity:name:memoryPool:", +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v520, 1)), (uint64_t)(int)-[BWPhotonicEngineNodeConfiguration outputBufferCount](*(_QWORD *)(v2 + 112)) << v143, CFSTR("Ultra High Resolution Gain Map pool"), v472);
        if (!result)
          goto LABEL_572;
        v150 = result;
        objc_msgSend(v458, "setObject:forKeyedSubscript:", result, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BWPixelBufferPool pixelFormat](result, "pixelFormat")));

        if (v449)
        {
          v151 = objc_alloc_init(BWVideoFormatRequirements);
          -[BWVideoFormatRequirements setWidth:](v151, "setWidth:", v464);
          -[BWVideoFormatRequirements setHeight:](v151, "setHeight:", (int)v463);
          -[BWVideoFormatRequirements setWidthAlignment:](v151, "setWidthAlignment:", 16);
          -[BWVideoFormatRequirements setHeightAlignment:](v151, "setHeightAlignment:", 16);
          v519 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend((id)objc_msgSend(*(id *)(v2 + 16), "videoFormat"), "pixelFormat"));
          -[BWVideoFormatRequirements setSupportedPixelFormats:](v151, "setSupportedPixelFormats:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v519, 1));
          if (objc_msgSend(v460, "colorSpaceProperties"))
          {
            v518 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v460, "colorSpaceProperties"));
            v152 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v518, 1);
          }
          else
          {
            v152 = 0;
          }
          -[BWVideoFormatRequirements setSupportedColorSpaceProperties:](v151, "setSupportedColorSpaceProperties:", v152);
          v517 = v151;
          v153 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v517, 1));
          v154 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Smart Style Ultra High Resolution output pool (%@)"), BWStringForOSType(objc_msgSend((id)objc_msgSend(*(id *)(v2 + 16), "videoFormat"), "pixelFormat")));
          result = -[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:]([BWPixelBufferPool alloc], "initWithVideoFormat:capacity:name:memoryPool:", v153, (int)-[BWPhotonicEngineNodeConfiguration maxDeepFusionOutputCount](*(_QWORD *)(v2 + 112)), v154, v472);
          *(_QWORD *)(v2 + 832) = result;
          if (!result)
            goto LABEL_572;
        }
        goto LABEL_180;
      }
    }
LABEL_587:
    result = (BWPixelBufferPool *)FigDebugAssert3();
    goto LABEL_572;
  }
LABEL_180:
  v3 = v471;
  if (dword_1ECFE9AF0)
  {
    v486 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    v155 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v156 = v486;
    if (os_log_type_enabled(v155, type))
      v157 = v156;
    else
      v157 = v156 & 0xFFFFFFFE;
    if (v157)
    {
      mach_absolute_time();
      v158 = FigHostTimeToNanoseconds();
      v563 = 136315650;
      v564 = "-[BWPhotonicEngineNode _setupProcessorCoordinator]";
      v565 = 2114;
      v566 = v443;
      v567 = 2048;
      v568 = (double)(v158 / 1000) / 1000.0;
      LODWORD(v438) = 32;
      v415 = &v563;
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  -[BWPixelBufferPool removeLastObject](v471, "removeLastObject", v415, v438);
  v88 = v446;
  v89 = v452;
LABEL_188:
  *(_QWORD *)(v2 + 256) = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:", v466);
  if (objc_msgSend(v17, "count"))
  {
    objc_msgSend(v88, "setObject:forKeyedSubscript:", FigCaptureDictionaryRepresentationForDimensions(v462), &unk_1E49FC6D8);
    objc_msgSend(v89, "setObject:forKeyedSubscript:", FigCaptureDictionaryRepresentationForDimensions(v462), &unk_1E49FC6D8);
    if (v461)
    {
      v447 = v88;
      v159 = objc_msgSend((id)objc_msgSend(*(id *)(v2 + 16), "videoFormat"), "pixelFormat");
      v160 = objc_alloc_init(BWVideoFormatRequirements);
      -[BWVideoFormatRequirements setWidth:](v160, "setWidth:");
      v161 = v462 >> 32;
      -[BWVideoFormatRequirements setHeight:](v160, "setHeight:", v462 >> 32);
      -[BWVideoFormatRequirements setBytesPerRowAlignment:](v160, "setBytesPerRowAlignment:", 16);
      -[BWVideoFormatRequirements setHeightAlignment:](v160, "setHeightAlignment:", 16);
      v516 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v159);
      -[BWVideoFormatRequirements setSupportedPixelFormats:](v160, "setSupportedPixelFormats:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v516, 1));
      if (objc_msgSend(v460, "colorSpaceProperties"))
      {
        v515 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v460, "colorSpaceProperties"));
        v162 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v515, 1);
      }
      else
      {
        v162 = 0;
      }
      -[BWVideoFormatRequirements setSupportedColorSpaceProperties:](v160, "setSupportedColorSpaceProperties:", v162);
      v514 = v160;
      v163 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v514, 1));
      result = -[BWOnDemandPixelBufferAllocator initWithVideoFormat:name:memoryPool:additionalPixelBufferAttributes:]([BWOnDemandPixelBufferAllocator alloc], "initWithVideoFormat:name:memoryPool:additionalPixelBufferAttributes:", v163, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ZoomBased QSub output on-demand allocator (%@)"), BWStringForOSType(v159)), v472, 0);
      if (!result)
        goto LABEL_572;
      v164 = result;
      objc_msgSend(v459, "setObject:forKeyedSubscript:", result, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v159));

      if ((objc_msgSend(*(id *)(v2 + 344), "fusionEnabled") & 1) != 0
        || (objc_msgSend(*(id *)(v2 + 344), "lowLightFusionEnabled") & 1) != 0
        || (objc_msgSend(*(id *)(v2 + 344), "rawNightModeEnabled") & 1) != 0
        || objc_msgSend(*(id *)(v2 + 344), "demosaicedRawEnabled")
        && (objc_msgSend(*(id *)(v2 + 112), "deferredPhotoProcessorEnabled") & 1) == 0)
      {
        v165 = -[BWSoftISPProcessorController outputPixelFormatForCaptureType:processingMode:](obj, "outputPixelFormatForCaptureType:processingMode:", 10, 0);
        if (!objc_msgSend(v459, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v165)))
        {
          v166 = objc_alloc_init(BWVideoFormatRequirements);
          -[BWVideoFormatRequirements setWidth:](v166, "setWidth:", (int)v462);
          -[BWVideoFormatRequirements setHeight:](v166, "setHeight:", v161);
          -[BWVideoFormatRequirements setWidthAlignment:](v166, "setWidthAlignment:", 16);
          -[BWVideoFormatRequirements setHeightAlignment:](v166, "setHeightAlignment:", 16);
          v513 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v165);
          -[BWVideoFormatRequirements setSupportedPixelFormats:](v166, "setSupportedPixelFormats:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v513, 1));
          v512 = v166;
          v167 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v512, 1));
          result = -[BWOnDemandPixelBufferAllocator initWithVideoFormat:name:memoryPool:additionalPixelBufferAttributes:]([BWOnDemandPixelBufferAllocator alloc], "initWithVideoFormat:name:memoryPool:additionalPixelBufferAttributes:", v167, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ZoomBased QSub YUV SoftISP output on-demand allocator (%@)"), BWStringForOSType(v165)), v472, 0);
          if (!result)
            goto LABEL_572;
          v168 = result;
          objc_msgSend(v459, "setObject:forKeyedSubscript:", result, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v165));

        }
      }
      if (*(_QWORD *)(v2 + 584))
      {
        v169 = -[BWSoftISPProcessorController outputPixelFormatForCaptureType:processingMode:](obj, "outputPixelFormatForCaptureType:processingMode:", 2, 0);
        if (!objc_msgSend(v459, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v169)))
        {
          v170 = objc_alloc_init(BWVideoFormatRequirements);
          -[BWVideoFormatRequirements setWidth:](v170, "setWidth:", (int)v462);
          -[BWVideoFormatRequirements setHeight:](v170, "setHeight:", v161);
          -[BWVideoFormatRequirements setWidthAlignment:](v170, "setWidthAlignment:", 16);
          -[BWVideoFormatRequirements setHeightAlignment:](v170, "setHeightAlignment:", 16);
          v511 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v169);
          -[BWVideoFormatRequirements setSupportedPixelFormats:](v170, "setSupportedPixelFormats:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v511, 1));
          v510 = v170;
          v171 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v510, 1));
          result = -[BWOnDemandPixelBufferAllocator initWithVideoFormat:name:memoryPool:additionalPixelBufferAttributes:]([BWOnDemandPixelBufferAllocator alloc], "initWithVideoFormat:name:memoryPool:additionalPixelBufferAttributes:", v171, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ZoomBased QSub SWFR SoftISP output on-demand allocator (%@)"), BWStringForOSType(v169)), v472, 0);
          if (!result)
            goto LABEL_572;
          v172 = result;
          objc_msgSend(v459, "setObject:forKeyedSubscript:", result, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v169));

        }
      }
      if (*(_QWORD *)(v2 + 392))
      {
        if ((-[BWPhotonicEngineNodeConfiguration learnedNRMode](*(_QWORD *)(v2 + 112)) & 1) != 0)
        {
          v173 = -[BWSoftISPProcessorController outputPixelFormatForCaptureType:captureFlags:processingMode:](obj, "outputPixelFormatForCaptureType:captureFlags:processingMode:", 1, 128, 0);
          v174 = +[BWVideoFormatRequirements formatRequirements](BWVideoFormatRequirements, "formatRequirements");
          objc_msgSend(v174, "setWidth:", (int)v462);
          objc_msgSend(v174, "setHeight:", v161);
          objc_msgSend(v174, "setWidthAlignment:", 16);
          objc_msgSend(v174, "setHeightAlignment:", 16);
          v509 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v173);
          objc_msgSend(v174, "setSupportedPixelFormats:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v509, 1));
          v508 = v174;
          v175 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v508, 1));
          v176 = +[BWVideoFormatRequirements formatRequirements](BWVideoFormatRequirements, "formatRequirements");
          objc_msgSend(v176, "setWidth:", (int)v462);
          objc_msgSend(v176, "setHeight:", v161);
          objc_msgSend(v176, "setWidthAlignment:", 16);
          objc_msgSend(v176, "setHeightAlignment:", 16);
          objc_msgSend(v176, "setSupportedPixelFormats:", &unk_1E4A02378);
          v507 = v176;
          v177 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v507, 1));
          objc_msgSend(*(id *)(v2 + 392), "setInputFormatsByQSubResolutionFlavor:", pen_inputFormatsByQSubResolutionFlavorByAddingFormatForFlavor(objc_msgSend(*(id *)(v2 + 392), "inputFormatsByQSubResolutionFlavor"), 1, (uint64_t)v175));
          objc_msgSend(*(id *)(v2 + 392), "setZoomBasedOutputFormat:", v177);
          if (!objc_msgSend(v459, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v173)))
          {
            result = -[BWOnDemandPixelBufferAllocator initWithVideoFormat:name:memoryPool:additionalPixelBufferAttributes:]([BWOnDemandPixelBufferAllocator alloc], "initWithVideoFormat:name:memoryPool:additionalPixelBufferAttributes:", v175, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ZoomBased QSub LearnedNR SoftISP output pool (%@)"), BWStringForOSType(v173)), v472, 0);
            if (!result)
              goto LABEL_572;
            objc_msgSend(v459, "setObject:forKeyedSubscript:", result, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v173));
          }
        }
      }
      if (objc_msgSend(*(id *)(v2 + 344), "rawNightModeEnabled"))
      {
        v178 = -[BWSoftISPProcessorController outputPixelFormatForCaptureType:captureFlags:processingMode:](obj, "outputPixelFormatForCaptureType:captureFlags:processingMode:", 11, 0x800000000, 0);
        if (!objc_msgSend(v459, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v178)))
        {
          v179 = objc_alloc_init(BWVideoFormatRequirements);
          -[BWVideoFormatRequirements setWidth:](v179, "setWidth:", (int)v462);
          -[BWVideoFormatRequirements setHeight:](v179, "setHeight:", v161);
          -[BWVideoFormatRequirements setWidthAlignment:](v179, "setWidthAlignment:", 16);
          -[BWVideoFormatRequirements setHeightAlignment:](v179, "setHeightAlignment:", 16);
          v506 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v178);
          -[BWVideoFormatRequirements setSupportedPixelFormats:](v179, "setSupportedPixelFormats:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v506, 1));
          v505 = v179;
          v180 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v505, 1));
          result = -[BWOnDemandPixelBufferAllocator initWithVideoFormat:name:memoryPool:additionalPixelBufferAttributes:]([BWOnDemandPixelBufferAllocator alloc], "initWithVideoFormat:name:memoryPool:additionalPixelBufferAttributes:", v180, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ZoomBased QSub RawNightMode SoftISP output on-demand allocator (%@)"), BWStringForOSType(v178)), v472, 0);
          if (!result)
            goto LABEL_572;
          v181 = result;
          objc_msgSend(v459, "setObject:forKeyedSubscript:", result, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v178));

          objc_msgSend(*(id *)(v2 + 344), "setRawNightModeInputFormat:", v180);
        }
      }
      v3 = v471;
      if ((objc_msgSend(*(id *)(v2 + 344), "deepFusionEnabled") & 1) != 0 || *(_QWORD *)(v2 + 408))
      {
        v182 = -[BWSoftISPProcessorController outputPixelFormatForCaptureType:processingMode:](obj, "outputPixelFormatForCaptureType:processingMode:", 12, 0);
        v183 = objc_alloc_init(BWVideoFormatRequirements);
        -[BWVideoFormatRequirements setWidth:](v183, "setWidth:", (int)v462);
        -[BWVideoFormatRequirements setHeight:](v183, "setHeight:", v161);
        -[BWVideoFormatRequirements setWidthAlignment:](v183, "setWidthAlignment:", 16);
        -[BWVideoFormatRequirements setHeightAlignment:](v183, "setHeightAlignment:", 16);
        v504 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v182);
        -[BWVideoFormatRequirements setSupportedPixelFormats:](v183, "setSupportedPixelFormats:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v504, 1));
        v503 = v183;
        v184 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v503, 1));
        v185 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ZoomBased QSub DeepFusion SoftISP output on-demand allocator (%@)"), BWStringForOSType(v182));
        if (!objc_msgSend(v459, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v182)))
        {
          result = -[BWOnDemandPixelBufferAllocator initWithVideoFormat:name:memoryPool:additionalPixelBufferAttributes:]([BWOnDemandPixelBufferAllocator alloc], "initWithVideoFormat:name:memoryPool:additionalPixelBufferAttributes:", v184, v185, v472, 0);
          if (!result)
            goto LABEL_572;
          v186 = result;
          objc_msgSend(v459, "setObject:forKeyedSubscript:", result, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v182));

          v3 = v471;
        }
        objc_msgSend(*(id *)(v2 + 344), "setDeepFusionInputFormat:", v184);
        objc_msgSend(*(id *)(v2 + 408), "setMaxInputDimensions:", v462);
        objc_msgSend(*(id *)(v2 + 408), "setMaxOutputDimensions:", v462);
      }
      if (objc_msgSend(*(id *)(v2 + 344), "demosaicedRawEnabled"))
      {
        v187 = -[BWPhotonicEngineNode _demosaicedRawFormatRequirementsWithDimensions:colorSpaceProperties:](v2, v462, objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(v2 + 16), "formatRequirements"), "supportedColorSpaceProperties"), "firstObject"), "intValue"));
        -[BWVideoFormatRequirements setWidthAlignment:](v187, "setWidthAlignment:", 16);
        -[BWVideoFormatRequirements setHeightAlignment:](v187, "setHeightAlignment:", 16);
        v502 = v187;
        v188 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v502, 1));
        if (!objc_msgSend(v459, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(v2 + 984))))
        {
          result = -[BWOnDemandPixelBufferAllocator initWithVideoFormat:name:memoryPool:additionalPixelBufferAttributes:]([BWOnDemandPixelBufferAllocator alloc], "initWithVideoFormat:name:memoryPool:additionalPixelBufferAttributes:", v188, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ZoomBased QSub Linear YUV output on-demand allocator (%@)"), BWStringForOSType(*(_DWORD *)(v2 + 984))), v472, 0);
          if (!result)
            goto LABEL_572;
          v189 = result;
          objc_msgSend(v459, "setObject:forKeyedSubscript:", result, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(v2 + 984)));

          v3 = v471;
        }
      }
      v88 = v447;
      v89 = v452;
      if (-[BWPhotonicEngineNodeConfiguration gainMapMainImageDownscalingFactor](*(_QWORD *)(v2 + 112)) != 0.0)
      {
        v190 = objc_alloc_init(BWVideoFormatRequirements);
        -[BWVideoFormatRequirements setSupportedPixelFormats:](v190, "setSupportedPixelFormats:", &unk_1E4A02390);
        -[BWVideoFormatRequirements setWidth:](v190, "setWidth:", (unint64_t)(float)((float)(int)v462/ -[BWPhotonicEngineNodeConfiguration gainMapMainImageDownscalingFactor](*(_QWORD *)(v2 + 112))));
        -[BWVideoFormatRequirements setHeight:](v190, "setHeight:", (unint64_t)(float)((float)SHIDWORD(v462)/ -[BWPhotonicEngineNodeConfiguration gainMapMainImageDownscalingFactor](*(_QWORD *)(v2 + 112))));
        v501 = v190;
        v191 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v501, 1));
        result = -[BWOnDemandPixelBufferAllocator initWithVideoFormat:name:memoryPool:additionalPixelBufferAttributes:]([BWOnDemandPixelBufferAllocator alloc], "initWithVideoFormat:name:memoryPool:additionalPixelBufferAttributes:", v191, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ZoomBased QSub gain map on-demand allocator (%@)"), BWStringForOSType(0x4C303038u)), v472, 0);
        if (!result)
          goto LABEL_572;
        v192 = result;
        objc_msgSend(v459, "setObject:forKeyedSubscript:", result, &unk_1E49FC630);

        v3 = v471;
        v88 = v447;
        v89 = v452;
      }
    }
  }
  objc_msgSend(*(id *)(v2 + 248), "setOutputDimensionsByQSubResolutionFlavor:", v88);
  objc_msgSend(*(id *)(v2 + 344), "setDimensionsByQSubResolutionFlavor:", v89);
  objc_msgSend(v470, "addObject:", obj);
  if (dword_1ECFE9AF0)
  {
    v486 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    v193 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v194 = v486;
    if (os_log_type_enabled(v193, type))
      v195 = v194;
    else
      v195 = v194 & 0xFFFFFFFE;
    if (v195)
    {
      mach_absolute_time();
      v196 = FigHostTimeToNanoseconds();
      v563 = 136315650;
      v564 = "-[BWPhotonicEngineNode _setupProcessorCoordinator]";
      v565 = 2114;
      v566 = v444;
      v567 = 2048;
      v568 = (double)(v196 / 1000) / 1000.0;
      LODWORD(v438) = 32;
      v414 = &v563;
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  -[BWPixelBufferPool removeLastObject](v3, "removeLastObject", v414, v438);
  v5 = 0x1E0CB3000;
  v20 = &OBJC_IVAR___BWVisionInferenceProvider__executesRequestsIndividually;
  if (dword_1ECFE9AF0)
  {
    v486 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    v197 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v198 = v486;
    if (os_log_type_enabled(v197, type))
      v199 = v198;
    else
      v199 = v198 & 0xFFFFFFFE;
    if (v199)
    {
      mach_absolute_time();
      v200 = FigHostTimeToNanoseconds();
      v563 = 136315650;
      v564 = "-[BWPhotonicEngineNode _setupProcessorCoordinator]";
      v565 = 2114;
      v566 = v445;
      v567 = 2048;
      v568 = (double)(v200 / 1000) / 1000.0;
      LODWORD(v439) = 32;
      v416 = &v563;
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    v5 = 0x1E0CB3000uLL;
  }
  -[BWPixelBufferPool removeLastObject](v3, "removeLastObject", v416, v439);
  v38 = v448;
LABEL_243:
  if (!objc_msgSend(*(id *)(v2 + 112), "deferredPhotoProcessorEnabled")
    || -[BWPhotonicEngineNodeConfiguration learnedNRMode](*(_QWORD *)(v2 + 112)))
  {
    FigDebugIsInternalBuild();
    v201 = objc_msgSend(*(id *)(v5 + 2368), "stringWithFormat:", CFSTR("%d"), 1);
    mach_absolute_time();
    -[BWPixelBufferPool addObject:](v3, "addObject:", v201);
    result = -[BWNRFProcessorController initWithConfiguration:]([BWNRFProcessorController alloc], "initWithConfiguration:", *(_QWORD *)(v2 + 344));
    v202 = result;
    if (*(_QWORD *)(v2 + 248))
    {
      if (objc_msgSend(*(id *)(v2 + 344), "lowLightFusionEnabled"))
      {
        v203 = (void *)objc_msgSend(*(id *)(v2 + 256), "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v38));
        v204 = objc_msgSend(v203, "capacity");
        v205 = -[BWPixelBufferPool progressiveLowLightFusionBatchSize](v202, "progressiveLowLightFusionBatchSize") + 2;
        if (v204 <= v205)
          v206 = v205;
        else
          v206 = v204;
        objc_msgSend(v203, "setCapacity:", v206);
      }
      result = (BWPixelBufferPool *)objc_msgSend(*(id *)(v2 + 344), "rawNightModeEnabled");
      if ((_DWORD)result)
      {
        v207 = -[BWPixelBufferPool rawNightModeOutputPixelFormatByBufferType:](v202, "rawNightModeOutputPixelFormatByBufferType:", 31);
        v208 = objc_alloc_init(BWVideoFormatRequirements);
        -[BWVideoFormatRequirements setWidth:](v208, "setWidth:", objc_msgSend((id)objc_msgSend(*(id *)(v2 + 344), "outputFormat"), "width"));
        -[BWVideoFormatRequirements setHeight:](v208, "setHeight:", objc_msgSend((id)objc_msgSend(*(id *)(v2 + 344), "outputFormat"), "height"));
        -[BWVideoFormatRequirements setWidthAlignment:](v208, "setWidthAlignment:", 16);
        -[BWVideoFormatRequirements setHeightAlignment:](v208, "setHeightAlignment:", 16);
        v500 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v207);
        -[BWVideoFormatRequirements setSupportedPixelFormats:](v208, "setSupportedPixelFormats:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v500, 1));
        v499 = v208;
        v209 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v499, 1));
        result = -[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:]([BWPixelBufferPool alloc], "initWithVideoFormat:capacity:name:memoryPool:", v209, 1, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Raw Night Mode Denoised Image pool (%@)"), BWStringForOSType(v207)), v472);
        if (!result)
          goto LABEL_572;
        *(_QWORD *)(v2 + 376) = result;
        v210 = -[BWPixelBufferPool rawNightModeOutputPixelFormatByBufferType:](v202, "rawNightModeOutputPixelFormatByBufferType:", 32);
        v211 = objc_alloc_init(BWVideoFormatRequirements);
        -[BWVideoFormatRequirements setWidth:](v211, "setWidth:", objc_msgSend((id)objc_msgSend(*(id *)(v2 + 344), "outputFormat"), "width"));
        -[BWVideoFormatRequirements setHeight:](v211, "setHeight:", objc_msgSend((id)objc_msgSend(*(id *)(v2 + 344), "outputFormat"), "height"));
        -[BWVideoFormatRequirements setWidthAlignment:](v211, "setWidthAlignment:", 16);
        -[BWVideoFormatRequirements setHeightAlignment:](v211, "setHeightAlignment:", 16);
        v498 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v210);
        -[BWVideoFormatRequirements setSupportedPixelFormats:](v211, "setSupportedPixelFormats:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v498, 1));
        v497 = v211;
        v212 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v497, 1));
        result = -[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:]([BWPixelBufferPool alloc], "initWithVideoFormat:capacity:name:memoryPool:", v212, 1, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Raw Night Mode Noise Map pool (%@)"), BWStringForOSType(v210)), v472);
        if (!result)
          goto LABEL_572;
        *(_QWORD *)(v2 + 384) = result;
      }
    }
    if (!v202)
      goto LABEL_572;
    objc_msgSend(v470, "addObject:", v202);
    if (dword_1ECFE9AF0)
    {
      v486 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      v213 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      v214 = v486;
      if (os_log_type_enabled(v213, type))
        v215 = v214;
      else
        v215 = v214 & 0xFFFFFFFE;
      if (v215)
      {
        mach_absolute_time();
        v216 = FigHostTimeToNanoseconds();
        v563 = 136315650;
        v564 = "-[BWPhotonicEngineNode _setupProcessorCoordinator]";
        v565 = 2114;
        v566 = v201;
        v567 = 2048;
        v568 = (double)(v216 / 1000) / 1000.0;
        LODWORD(v438) = 32;
        v417 = &v563;
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v3 = v471;
    -[BWPixelBufferPool removeLastObject](v471, "removeLastObject", v417, v438);
    v5 = 0x1E0CB3000uLL;
    v20 = &OBJC_IVAR___BWVisionInferenceProvider__executesRequestsIndividually;
  }
  if (*(_QWORD *)(v2 + v20[201]))
  {
    FigDebugIsInternalBuild();
    v217 = objc_msgSend(*(id *)(v5 + 2368), "stringWithFormat:", CFSTR("%d"), 6);
    mach_absolute_time();
    -[BWPixelBufferPool addObject:](v3, "addObject:", v217);
    result = -[BWDeepFusionProcessorController initWithConfiguration:]([BWDeepFusionProcessorController alloc], "initWithConfiguration:", *(_QWORD *)(v2 + v20[201]));
    if (!result)
      goto LABEL_572;
    objc_msgSend(v470, "addObject:", result);
    if (dword_1ECFE9AF0)
    {
      v486 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      v218 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      v219 = v486;
      if (os_log_type_enabled(v218, type))
        v220 = v219;
      else
        v220 = v219 & 0xFFFFFFFE;
      if (v220)
      {
        mach_absolute_time();
        v221 = FigHostTimeToNanoseconds();
        v563 = 136315650;
        v564 = "-[BWPhotonicEngineNode _setupProcessorCoordinator]";
        v565 = 2114;
        v566 = v217;
        v567 = 2048;
        v568 = (double)(v221 / 1000) / 1000.0;
        LODWORD(v438) = 32;
        v418 = &v563;
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v3 = v471;
    -[BWPixelBufferPool removeLastObject](v471, "removeLastObject", v418, v438);
    v5 = 0x1E0CB3000uLL;
  }
  if (*(_QWORD *)(v2 + 896))
  {
    FigDebugIsInternalBuild();
    v222 = objc_msgSend(*(id *)(v5 + 2368), "stringWithFormat:", CFSTR("%d"), 8);
    mach_absolute_time();
    -[BWPixelBufferPool addObject:](v3, "addObject:", v222);
    result = -[BWDeferredCaptureController initWithConfiguration:]([BWDeferredCaptureController alloc], "initWithConfiguration:", *(_QWORD *)(v2 + 896));
    if (!result)
      goto LABEL_572;
    objc_msgSend(v470, "addObject:", result);
    if (dword_1ECFE9AF0)
    {
      v486 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      v223 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      v224 = v486;
      if (os_log_type_enabled(v223, type))
        v225 = v224;
      else
        v225 = v224 & 0xFFFFFFFE;
      if (v225)
      {
        mach_absolute_time();
        v226 = FigHostTimeToNanoseconds();
        v563 = 136315650;
        v564 = "-[BWPhotonicEngineNode _setupProcessorCoordinator]";
        v565 = 2114;
        v566 = v222;
        v567 = 2048;
        v568 = (double)(v226 / 1000) / 1000.0;
        LODWORD(v438) = 32;
        v419 = &v563;
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v3 = v471;
    -[BWPixelBufferPool removeLastObject](v471, "removeLastObject", v419, v438);
    v5 = 0x1E0CB3000uLL;
  }
  if (*(_QWORD *)(v2 + 936))
  {
    FigDebugIsInternalBuild();
    v227 = objc_msgSend(*(id *)(v5 + 2368), "stringWithFormat:", CFSTR("%d"), 9);
    mach_absolute_time();
    -[BWPixelBufferPool addObject:](v3, "addObject:", v227);
    result = -[BWDeferredProcessorController initWithConfiguration:]([BWDeferredProcessorController alloc], "initWithConfiguration:", *(_QWORD *)(v2 + 936));
    if (!result)
      goto LABEL_572;
    objc_msgSend(v470, "addObject:", result);
    if (dword_1ECFE9AF0)
    {
      v486 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      v228 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      v229 = v486;
      if (os_log_type_enabled(v228, type))
        v230 = v229;
      else
        v230 = v229 & 0xFFFFFFFE;
      if (v230)
      {
        mach_absolute_time();
        v231 = FigHostTimeToNanoseconds();
        v563 = 136315650;
        v564 = "-[BWPhotonicEngineNode _setupProcessorCoordinator]";
        v565 = 2114;
        v566 = v227;
        v567 = 2048;
        v568 = (double)(v231 / 1000) / 1000.0;
        LODWORD(v438) = 32;
        v420 = &v563;
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v3 = v471;
    -[BWPixelBufferPool removeLastObject](v471, "removeLastObject", v420, v438);
    v5 = 0x1E0CB3000uLL;
  }
  if (-[BWPhotonicEngineNodeConfiguration deepFusionSyntheticsInNRSupportEnabled](*(_QWORD *)(v2 + 112)))
  {
    FigDebugIsInternalBuild();
    v232 = objc_msgSend(*(id *)(v5 + 2368), "stringWithFormat:", CFSTR("%d"), 7);
    mach_absolute_time();
    -[BWPixelBufferPool addObject:](v3, "addObject:", v232);
    v233 = objc_alloc_init(BWVideoFormatRequirements);
    v234 = objc_msgSend((id)objc_msgSend(*(id *)(v2 + 344), "inputFormat"), "width");
    v235 = objc_msgSend((id)objc_msgSend(*(id *)(v2 + 344), "inputFormat"), "height");
    v236 = v234 + 15;
    v237 = v235 + 15;
    -[BWVideoFormatRequirements setWidth:](v233, "setWidth:", (v236 >> 1) & 0x7FFFFFFFFFFFFFF8);
    -[BWVideoFormatRequirements setHeight:](v233, "setHeight:", (v237 >> 1) & 0x7FFFFFFFFFFFFFF8);
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v233, "setSupportedPixelFormats:", &unk_1E4A023A8);
    v496 = v233;
    v238 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v496, 1));
    v239 = -[BWPhotonicEngineNodeConfiguration maxDeepFusionOutputCount](*(_QWORD *)(v2 + 112));
    v240 = -[BWPhotonicEngineNodeConfiguration maxDeepFusionOutputCount](*(_QWORD *)(v2 + 112));
    LODWORD(v233) = objc_msgSend(*(id *)(v2 + 112), "deferredCaptureSupportEnabled");
    result = (BWPixelBufferPool *)objc_msgSend(*(id *)(v2 + 344), "inputFormat");
    v241 = result;
    if ((_DWORD)v233)
    {
      v242 = (id)objc_msgSend((id)-[BWPixelBufferPool pixelBufferAttributes](result, "pixelBufferAttributes"), "mutableCopy");
      objc_msgSend(v242, "setObject:forKeyedSubscript:", &unk_1E4A023C0, *MEMORY[0x1E0CA8F80]);
      v243 = -[BWVideoFormatRequirements initWithPixelBufferAttributes:]([BWVideoFormatRequirements alloc], "initWithPixelBufferAttributes:", v242);
      if (FigCapturePixelFormatGetCompressionType(objc_msgSend((id)objc_msgSend(*(id *)(v2 + 344), "inputFormat"), "pixelFormat")))
      {
        v495 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", FigCaptureUncompressedPixelFormatForPixelFormat(objc_msgSend((id)objc_msgSend(*(id *)(v2 + 344), "inputFormat"), "pixelFormat")));
        -[BWVideoFormatRequirements setSupportedPixelFormats:](v243, "setSupportedPixelFormats:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v495, 1));
      }
      v494 = v243;
      result = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v494, 1));
      v241 = result;
    }
    if (!v241 || !v239 || !v240)
      goto LABEL_572;
    v244 = 2 * v239;
    v245 = 3 * v240;
    if (objc_msgSend(*(id *)(v2 + 112), "deferredCaptureSupportEnabled"))
    {
      v246 = -[BWDeferredContainerPixelBufferPool initWithVideoFormat:capacity:name:]([BWDeferredContainerPixelBufferPool alloc], "initWithVideoFormat:capacity:name:", v241, v244, CFSTR("DeepFusion deferred synthetic intermediate pool"));
      v247 = -[BWDeferredContainerPixelBufferPool initWithVideoFormat:capacity:name:]([BWDeferredContainerPixelBufferPool alloc], "initWithVideoFormat:capacity:name:", v238, v245, CFSTR("DeepFusion deferred fusion map pool"));
    }
    else
    {
      v246 = -[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:]([BWPixelBufferPool alloc], "initWithVideoFormat:capacity:name:memoryPool:", v241, v244, CFSTR("Deep Fusion synthetic intermediate pool"), v472);
      v247 = -[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:]([BWPixelBufferPool alloc], "initWithVideoFormat:capacity:name:memoryPool:", v238, v245, CFSTR("Deep Fusion synthetic fusion map pool"), v472);
    }
    result = v247;
    if (!v246)
      goto LABEL_572;
    v248 = result;
    *(_QWORD *)(v2 + 424) = v246;
    *(_QWORD *)(v2 + 432) = v248;
    if (dword_1ECFE9AF0)
    {
      v486 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      v249 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      v250 = v486;
      if (os_log_type_enabled(v249, type))
        v251 = v250;
      else
        v251 = v250 & 0xFFFFFFFE;
      if (v251)
      {
        mach_absolute_time();
        v252 = FigHostTimeToNanoseconds();
        v563 = 136315650;
        v564 = "-[BWPhotonicEngineNode _setupProcessorCoordinator]";
        v565 = 2114;
        v566 = v232;
        v567 = 2048;
        v568 = (double)(v252 / 1000) / 1000.0;
        LODWORD(v438) = 32;
        v421 = &v563;
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v3 = v471;
    -[BWPixelBufferPool removeLastObject](v471, "removeLastObject", v421, v438);
    v5 = 0x1E0CB3000uLL;
  }
  v253 = MEMORY[0x1E0C9AA70];
  if (*(_QWORD *)(v2 + 392))
  {
    FigDebugIsInternalBuild();
    v254 = objc_msgSend(*(id *)(v5 + 2368), "stringWithFormat:", CFSTR("%d"), 10);
    mach_absolute_time();
    -[BWPixelBufferPool addObject:](v3, "addObject:", v254);
    v255 = -[BWLearnedNRProcessorController initWithConfiguration:]([BWLearnedNRProcessorController alloc], "initWithConfiguration:", *(_QWORD *)(v2 + 392));
    if (!v255)
    {
LABEL_330:
      v259 = 0;
      goto LABEL_331;
    }
    v256 = v255;
    v257 = objc_alloc(MEMORY[0x1E0C99E08]);
    if (*(_QWORD *)(v2 + 520))
      v258 = *(_QWORD *)(v2 + 520);
    else
      v258 = v253;
    v259 = (void *)objc_msgSend(v257, "initWithDictionary:", v258);
    if (objc_msgSend(*(id *)(v2 + 392), "outputFormat"))
    {
      v260 = -[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:]([BWPixelBufferPool alloc], "initWithVideoFormat:capacity:name:memoryPool:", objc_msgSend(*(id *)(v2 + 392), "outputFormat"), 1, CFSTR("LearnedNR output pool"), v472);
      if (!v260)
        goto LABEL_331;
      v261 = v260;
      objc_msgSend(v259, "setObject:forKeyedSubscript:", v260, 0x1E4951698);

    }
    if (objc_msgSend(*(id *)(v2 + 392), "zoomBasedOutputFormat"))
    {
      v262 = -[BWOnDemandPixelBufferAllocator initWithVideoFormat:name:memoryPool:additionalPixelBufferAttributes:]([BWOnDemandPixelBufferAllocator alloc], "initWithVideoFormat:name:memoryPool:additionalPixelBufferAttributes:", objc_msgSend(*(id *)(v2 + 392), "zoomBasedOutputFormat"), CFSTR("Zoom based LearnedNR output allocator"), v472, 0);
      if (!v262)
        goto LABEL_331;
      objc_msgSend(v259, "setObject:forKeyedSubscript:", v262, 0x1E49516B8);
    }
    if (!objc_msgSend(*(id *)(v2 + 392), "ultraHighResolutionOutputFormat"))
      goto LABEL_328;
    v263 = -[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:]([BWPixelBufferPool alloc], "initWithVideoFormat:capacity:name:memoryPool:", objc_msgSend(*(id *)(v2 + 392), "ultraHighResolutionOutputFormat"), 1, CFSTR("Ultra High Resolution LearnedNR output pool"), v472);
    if (v263)
    {
      v264 = v263;
      objc_msgSend(v259, "setObject:forKeyedSubscript:", v263, 0x1E49516D8);

LABEL_328:
      *(_QWORD *)(v2 + 520) = v259;
      if (!-[BWLearnedNRProcessorController prepareWithPixelBufferPoolProvider:](v256, "prepareWithPixelBufferPoolProvider:", v2))objc_msgSend(v470, "addObject:", v256);
      goto LABEL_330;
    }
LABEL_331:

    if (dword_1ECFE9AF0)
    {
      v486 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      v265 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      v266 = v486;
      if (os_log_type_enabled(v265, type))
        v267 = v266;
      else
        v267 = v266 & 0xFFFFFFFE;
      if (v267)
      {
        mach_absolute_time();
        v268 = FigHostTimeToNanoseconds();
        v563 = 136315650;
        v564 = "-[BWPhotonicEngineNode _setupProcessorCoordinator]";
        v565 = 2114;
        v566 = v254;
        v567 = 2048;
        v568 = (double)(v268 / 1000) / 1000.0;
        LODWORD(v438) = 32;
        v422 = &v563;
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      v3 = v471;
    }
    -[BWPixelBufferPool removeLastObject](v3, "removeLastObject", v422, v438);
    v5 = 0x1E0CB3000uLL;
  }
  if (!*(_QWORD *)(v2 + 472))
    goto LABEL_410;
  v269 = v253;
  FigDebugIsInternalBuild();
  v270 = objc_msgSend(*(id *)(v5 + 2368), "stringWithFormat:", CFSTR("%d"), 11);
  mach_absolute_time();
  v453 = v270;
  -[BWPixelBufferPool addObject:](v3, "addObject:", v270);
  if (-[BWPhotonicEngineNodeConfiguration inferenceMainImageDownscalingFactor](*(_QWORD *)(v2 + 112)) != 0.0)
  {
    v271 = 875704422;
    v272 = objc_alloc_init(BWVideoFormatRequirements);
    v273 = (float)(unint64_t)objc_msgSend((id)objc_msgSend(*(id *)(v2 + 8), "videoFormat"), "width");
    v274 = -[BWPhotonicEngineNodeConfiguration inferenceMainImageDownscalingFactor](*(_QWORD *)(v2 + 112));
    v275 = FigCaptureRoundFloatToMultipleOf(2, v273 / v274);
    v276 = (float)(unint64_t)objc_msgSend((id)objc_msgSend(*(id *)(v2 + 8), "videoFormat"), "height");
    v277 = -[BWPhotonicEngineNodeConfiguration inferenceMainImageDownscalingFactor](*(_QWORD *)(v2 + 112));
    v278 = FigCaptureRoundFloatToMultipleOf(2, v276 / v277);
    if (v275 <= 0x200)
      v279 = 512;
    else
      v279 = v275;
    -[BWVideoFormatRequirements setWidth:](v272, "setWidth:", v279);
    if (v278 <= 0x180)
      v280 = 384;
    else
      v280 = v278;
    -[BWVideoFormatRequirements setHeight:](v272, "setHeight:", v280);
    -[BWVideoFormatRequirements setWidthAlignment:](v272, "setWidthAlignment:", 8);
    -[BWVideoFormatRequirements setHeightAlignment:](v272, "setHeightAlignment:", 8);
    if (FigCapturePlatformSupportsUniversalCompression())
      v271 = FigCaptureCompressedPixelFormatForPixelFormat(875704422, 4, 0);
    v493 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v271);
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v272, "setSupportedPixelFormats:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v493, 1));
    v492 = v272;
    objc_msgSend(*(id *)(v2 + 472), "setInputFormat:", +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v492, 1)));
    v465 = -[BWInferenceEngineController initWithConfiguration:contextName:]([BWInferenceEngineController alloc], "initWithConfiguration:contextName:", *(_QWORD *)(v2 + 472), objc_msgSend((id)v2, "name"));
    if (v465)
    {
      v281 = objc_msgSend((id)-[BWPhotonicEngineNodeConfiguration providedInferenceAttachedMediaByMode](*(_QWORD *)(v2 + 112)), "objectForKeyedSubscript:", &unk_1E49FC6A8);
      v282 = -[BWPhotonicEngineNodeConfiguration outputBufferCount](*(_QWORD *)(v2 + 112));
      v283 = v281 ? 2 : 1;
      v284 = -[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:]([BWPixelBufferPool alloc], "initWithVideoFormat:capacity:name:memoryPool:", objc_msgSend(*(id *)(v2 + 472), "inputFormat"), (v282 << v283), CFSTR("Inference input pool"), v472);
      *(_QWORD *)(v2 + 504) = v284;
      if (v284)
      {
        v285 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        if (!v461)
        {
LABEL_363:
          v294 = objc_msgSend(v285, "count");
          if (v294)
            v294 = objc_msgSend(v285, "copy");
          v295 = &OBJC_IVAR___BWVisionInferenceProvider__executesRequestsIndividually;
          v296 = v465;
          *(_QWORD *)(v2 + 512) = v294;
          v297 = objc_alloc(MEMORY[0x1E0C99E08]);
          if (*(_QWORD *)(v2 + 520))
            v298 = *(_QWORD *)(v2 + 520);
          else
            v298 = v269;
          v467 = (void *)objc_msgSend(v297, "initWithDictionary:", v298);
          v473 = 0u;
          v474 = 0u;
          v475 = 0u;
          v476 = 0u;
          obja = -[BWInferenceEngineController providedAttachedMediaKeys](v465, "providedAttachedMediaKeys");
          v299 = -[NSArray countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v473, v490, 16);
          if (v299)
          {
            v300 = v299;
            v301 = *(_QWORD *)v474;
            while (2)
            {
              for (k = 0; k != v300; ++k)
              {
                if (*(_QWORD *)v474 != v301)
                  objc_enumerationMutation(obja);
                v303 = *(void **)(*((_QWORD *)&v473 + 1) + 8 * k);
                v304 = (void *)objc_msgSend(*(id *)(v2 + 16), "mediaPropertiesForAttachedMediaKey:", v303);
                if (objc_msgSend(v304, "preparedPixelBufferPool"))
                {
                  v305 = (void *)objc_msgSend(v304, "resolvedVideoFormat");
                  if ((objc_msgSend(v305, "isEqual:", -[BWInferenceEngineController outputVideoFormatForAttachedMediaKey:](v296, "outputVideoFormatForAttachedMediaKey:", v303)) & 1) == 0)goto LABEL_398;
                }
                else
                {
                  v306 = -[BWInferenceEngineController outputVideoFormatForAttachedMediaKey:](v296, "outputVideoFormatForAttachedMediaKey:", v303);
                  if (!v306
                    || ((v305 = (void *)v306,
                         v307 = objc_msgSend(*(id *)(v2 + 112), "deferredCaptureSupportEnabled"),
                         !FigCaptureVideoDimensionsAreValid(objc_msgSend(*(id *)(v2 + 112), "stereoPhotoOutputDimensions")))
                      ? (v308 = 2)
                      : (v308 = 3),
                        v309 = [BWPixelBufferPool alloc],
                        v310 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UB %@ Output Pool"), v303),
                        LOBYTE(v424) = v307,
                        (v311 = -[BWPixelBufferPool initWithVideoFormat:capacity:name:clientProvidesPool:memoryPool:providesBackPressure:reportSlowBackPressureAllocations:](v309, "initWithVideoFormat:capacity:name:clientProvidesPool:memoryPool:providesBackPressure:reportSlowBackPressureAllocations:", v305, v308, v310, 0, v472, v307, v424)) == 0))
                  {
LABEL_398:
                    v3 = v471;
                    v313 = v467;
                    goto LABEL_402;
                  }
                  v312 = (void *)v311;
                  objc_msgSend(v467, "setObject:forKeyedSubscript:", v311, v303);

                  v295 = &OBJC_IVAR___BWVisionInferenceProvider__executesRequestsIndividually;
                  v296 = v465;
                }
                if (*(_QWORD *)(v2 + v295[192])
                  && ((objc_msgSend(v303, "isEqualToString:", 0x1E49511B8) & 1) != 0
                   || objc_msgSend(v303, "isEqualToString:", 0x1E495B0D8)))
                {
                  *(_DWORD *)(v2 + 664) = objc_msgSend(v305, "width");
                  *(_DWORD *)(v2 + 668) = objc_msgSend(v305, "height");
                }
              }
              v300 = -[NSArray countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v473, v490, 16);
              if (v300)
                continue;
              break;
            }
          }
          v313 = v467;
          if (objc_msgSend(v467, "count"))
          {

            *(_QWORD *)(v2 + 520) = v467;
            v313 = 0;
          }
          v3 = v471;
          v314 = BWDeviceSupportsDeferredPhotoProcessorPrewarming();
          if (objc_msgSend(*(id *)(v2 + 112), "deferredPhotoProcessorEnabled") && v314)
            goto LABEL_401;
          FigDebugIsInternalBuild();
          v315 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), 12);
          mach_absolute_time();
          -[BWPixelBufferPool addObject:](v471, "addObject:", v315);
          v316 = -[BWInferenceEngineController prepareWithPixelBufferPoolProvider:](v296, "prepareWithPixelBufferPoolProvider:", v2);
          if (dword_1ECFE9AF0)
          {
            v486 = 0;
            type = OS_LOG_TYPE_DEFAULT;
            v317 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            v318 = v486;
            if (os_log_type_enabled(v317, type))
              v319 = v318;
            else
              v319 = v318 & 0xFFFFFFFE;
            if (v319)
            {
              mach_absolute_time();
              v320 = FigHostTimeToNanoseconds();
              v563 = 136315650;
              v564 = "-[BWPhotonicEngineNode _setupProcessorCoordinator]";
              v565 = 2114;
              v566 = v315;
              v567 = 2048;
              v568 = (double)(v320 / 1000) / 1000.0;
              LODWORD(v438) = 32;
              v425 = &v563;
              _os_log_send_and_compose_impl();
            }
            fig_log_call_emit_and_clean_up_after_send_and_compose();
            v3 = v471;
          }
          -[BWPixelBufferPool removeLastObject](v3, "removeLastObject", v425, v438);
          if (!v316)
LABEL_401:
            objc_msgSend(v470, "addObject:", v296);
          goto LABEL_402;
        }
        v286 = -[BWPhotonicEngineNodeConfiguration inferenceMainImageDownscalingFactor](*(_QWORD *)(v2 + 112));
        v287 = FigCaptureRoundFloatToMultipleOf(2, (float)(int)v462 / v286);
        v288 = -[BWPhotonicEngineNodeConfiguration inferenceMainImageDownscalingFactor](*(_QWORD *)(v2 + 112));
        v289 = FigCaptureRoundFloatToMultipleOf(2, (float)SHIDWORD(v462) / v288);
        if (v287 <= 0x200)
          v290 = 512;
        else
          v290 = v287;
        -[BWVideoFormatRequirements setWidth:](v272, "setWidth:", v290);
        if (v289 <= 0x180)
          v291 = 384;
        else
          v291 = v289;
        -[BWVideoFormatRequirements setHeight:](v272, "setHeight:", v291);
        v491 = v272;
        v292 = -[BWOnDemandPixelBufferAllocator initWithVideoFormat:name:memoryPool:additionalPixelBufferAttributes:]([BWOnDemandPixelBufferAllocator alloc], "initWithVideoFormat:name:memoryPool:additionalPixelBufferAttributes:", +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v491, 1)), CFSTR("ZoomBased QSub inference input on-demand allocator"), v472, 0);
        if (v292)
        {
          v293 = v292;
          objc_msgSend(v285, "setObject:forKeyedSubscript:", v292, &unk_1E49FC6D8);

          goto LABEL_363;
        }
      }
    }
  }
  v313 = 0;
LABEL_402:

  if (dword_1ECFE9AF0)
  {
    v486 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    v321 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v322 = v486;
    if (os_log_type_enabled(v321, type))
      v323 = v322;
    else
      v323 = v322 & 0xFFFFFFFE;
    if (v323)
    {
      mach_absolute_time();
      v324 = FigHostTimeToNanoseconds();
      v563 = 136315650;
      v564 = "-[BWPhotonicEngineNode _setupProcessorCoordinator]";
      v565 = 2114;
      v566 = v453;
      v567 = 2048;
      v568 = (double)(v324 / 1000) / 1000.0;
      LODWORD(v438) = 32;
      v423 = &v563;
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  -[BWPixelBufferPool removeLastObject](v3, "removeLastObject", v423, v438);
  v5 = 0x1E0CB3000uLL;
LABEL_410:
  if (*(_QWORD *)(v2 + 584))
  {
    FigDebugIsInternalBuild();
    v325 = objc_msgSend(*(id *)(v5 + 2368), "stringWithFormat:", CFSTR("%d"), 13);
    mach_absolute_time();
    -[BWPixelBufferPool addObject:](v3, "addObject:", v325);
    result = -[BWSWFRProcessorController initWithConfiguration:]([BWSWFRProcessorController alloc], "initWithConfiguration:", *(_QWORD *)(v2 + 584));
    if (!result)
      goto LABEL_572;
    objc_msgSend(v470, "addObject:", result);
    if (dword_1ECFE9AF0)
    {
      v486 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      v326 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      v327 = v486;
      if (os_log_type_enabled(v326, type))
        v328 = v327;
      else
        v328 = v327 & 0xFFFFFFFE;
      if (v328)
      {
        mach_absolute_time();
        v329 = FigHostTimeToNanoseconds();
        v563 = 136315650;
        v564 = "-[BWPhotonicEngineNode _setupProcessorCoordinator]";
        v565 = 2114;
        v566 = v325;
        v567 = 2048;
        v568 = (double)(v329 / 1000) / 1000.0;
        LODWORD(v438) = 32;
        v426 = &v563;
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v3 = v471;
    -[BWPixelBufferPool removeLastObject](v471, "removeLastObject", v426, v438);
    v5 = 0x1E0CB3000uLL;
  }
  if (*(_QWORD *)(v2 + 608))
  {
    FigDebugIsInternalBuild();
    v330 = objc_msgSend(*(id *)(v5 + 2368), "stringWithFormat:", CFSTR("%d"), 22);
    mach_absolute_time();
    -[BWPixelBufferPool addObject:](v3, "addObject:", v330);
    result = -[BWColorConstancyProcessorController initWithConfiguration:]([BWColorConstancyProcessorController alloc], "initWithConfiguration:", *(_QWORD *)(v2 + 608));
    if (!result)
      goto LABEL_572;
    objc_msgSend(v470, "addObject:", result);
    if (dword_1ECFE9AF0)
    {
      v486 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      v331 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      v332 = v486;
      if (os_log_type_enabled(v331, type))
        v333 = v332;
      else
        v333 = v332 & 0xFFFFFFFE;
      if (v333)
      {
        mach_absolute_time();
        v334 = FigHostTimeToNanoseconds();
        v563 = 136315650;
        v564 = "-[BWPhotonicEngineNode _setupProcessorCoordinator]";
        v565 = 2114;
        v566 = v330;
        v567 = 2048;
        v568 = (double)(v334 / 1000) / 1000.0;
        LODWORD(v438) = 32;
        v427 = &v563;
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v3 = v471;
    -[BWPixelBufferPool removeLastObject](v471, "removeLastObject", v427, v438);
    v5 = 0x1E0CB3000uLL;
  }
  if (*(_QWORD *)(v2 + 624))
  {
    FigDebugIsInternalBuild();
    v335 = objc_msgSend(*(id *)(v5 + 2368), "stringWithFormat:", CFSTR("%d"), 14);
    mach_absolute_time();
    -[BWPixelBufferPool addObject:](v3, "addObject:", v335);
    result = -[BWRedEyeReductionController initWithConfiguration:]([BWRedEyeReductionController alloc], "initWithConfiguration:", *(_QWORD *)(v2 + 624));
    if (!result)
      goto LABEL_572;
    objc_msgSend(v470, "addObject:", result);
    if (dword_1ECFE9AF0)
    {
      v486 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      v336 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      v337 = v486;
      if (os_log_type_enabled(v336, type))
        v338 = v337;
      else
        v338 = v337 & 0xFFFFFFFE;
      if (v338)
      {
        mach_absolute_time();
        v339 = FigHostTimeToNanoseconds();
        v563 = 136315650;
        v564 = "-[BWPhotonicEngineNode _setupProcessorCoordinator]";
        v565 = 2114;
        v566 = v335;
        v567 = 2048;
        v568 = (double)(v339 / 1000) / 1000.0;
        LODWORD(v438) = 32;
        v428 = &v563;
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v3 = v471;
    -[BWPixelBufferPool removeLastObject](v471, "removeLastObject", v428, v438);
    v5 = 0x1E0CB3000uLL;
  }
  if (!*(_QWORD *)(v2 + 640))
    goto LABEL_484;
  FigDebugIsInternalBuild();
  v340 = objc_msgSend(*(id *)(v5 + 2368), "stringWithFormat:", CFSTR("%d"), 15);
  mach_absolute_time();
  -[BWPixelBufferPool addObject:](v3, "addObject:", v340);
  if (objc_msgSend((id)objc_msgSend(*(id *)(v2 + 640), "portTypesWithIntelligentDistortionCorrectionEnabled"), "count"))
  {
    if (objc_msgSend(*(id *)(v2 + 112), "deferredPhotoProcessorEnabled"))
    {
      *(_DWORD *)(v2 + 664) = 512;
      *(_DWORD *)(v2 + 668) = 384;
    }
    else
    {
      result = (BWPixelBufferPool *)-[BWPhotonicEngineNode _inferenceOutputPixelBufferPoolForAttachedMediaKey:](v2, CFSTR("LowResPersonSegmentationMask"));
      if (!result)
      {
        result = (BWPixelBufferPool *)-[BWPhotonicEngineNode _inferenceOutputPixelBufferPoolForAttachedMediaKey:](v2, CFSTR("LowResPersonSegmentationMaskClone"));
        if (!result)
          goto LABEL_572;
      }
      if (!*(_DWORD *)(v2 + 664) || !*(_DWORD *)(v2 + 668))
        goto LABEL_572;
    }
  }
  if (FigCaptureVideoDimensionsAreValid(v457))
  {
    v341 = -[BWPhotonicEngineNodeConfiguration ultraHighResolutionProcessingEnabled](*(_QWORD *)(v2 + 112));
    v342 = v341 || v461;
    v343 = !v341;
    v344 = v462;
    if (v341)
      v344 = v457;
    LODWORD(v462) = v344;
    v345 = v456;
    if (!v343)
      v345 = v450;
    v346 = &OBJC_IVAR___BWVisionInferenceProvider__executesRequestsIndividually;
    if (v342)
      goto LABEL_457;
  }
  else
  {
    v346 = &OBJC_IVAR___BWVisionInferenceProvider__executesRequestsIndividually;
    v345 = HIDWORD(v462);
    if (v461)
      goto LABEL_457;
  }
  LODWORD(v462) = objc_msgSend((id)objc_msgSend(*(id *)(v2 + 16), "videoFormat"), "width");
  v345 = objc_msgSend((id)objc_msgSend(*(id *)(v2 + 16), "videoFormat"), "height");
LABEL_457:
  objc_msgSend(*(id *)(v2 + v346[192]), "setProcessorConfig:", v462 | ((unint64_t)v345 << 32), *(unsigned int *)(v2 + 664) | ((unint64_t)*(unsigned int *)(v2 + 668) << 32));
  if (-[BWPhotonicEngineNodeConfiguration depthDataDeliveryEnabled](*(_QWORD *)(v2 + 112))
    && objc_msgSend(*(id *)(v2 + 112), "depthDataType") == 3
    && -[BWPhotonicEngineNodeConfiguration dcProcessingWithDepthSupported](*(_QWORD *)(v2 + 112)))
  {
    if (objc_msgSend(*(id *)(v2 + 112), "pearlModuleType") == 3)
      v347 = 0;
    else
      v347 = 90;
    objc_msgSend(*(id *)(v2 + v346[192]), "setDepthDataCorrectionEnabled:primaryFormat:depthFormat:baseDepthRotationDegrees:", 1, objc_msgSend((id)objc_msgSend(*(id *)(v2 + 16), "mediaPropertiesForAttachedMediaKey:", CFSTR("PrimaryFormat")), "resolvedVideoFormat"), objc_msgSend((id)objc_msgSend(*(id *)(v2 + 16), "mediaPropertiesForAttachedMediaKey:", CFSTR("Depth")), "resolvedVideoFormat"), v347);
  }
  result = -[BWIntelligentDistortionCorrectionProcessorController initWithConfiguration:]([BWIntelligentDistortionCorrectionProcessorController alloc], "initWithConfiguration:", *(_QWORD *)(v2 + v346[192]));
  if (!result)
    goto LABEL_572;
  objc_msgSend(v470, "addObject:", result);
  if (FigCaptureVideoDimensionsAreValid(objc_msgSend(*(id *)(v2 + 112), "stereoPhotoOutputDimensions")))
  {
    v348 = FigCaptureVideoDimensionsAreValid(objc_msgSend(*(id *)(v2 + 112), "deepFusionEnhancedResolutionDimensions"));
    v349 = objc_msgSend((id)objc_msgSend(*(id *)(v2 + 640), "portTypesWithGeometricDistortionCorrectionEnabled"), "count")+ 1;
    v350 = objc_msgSend((id)objc_msgSend(*(id *)(v2 + 16), "videoFormat"), "pixelFormat");
    v351 = objc_alloc_init(BWVideoFormatRequirements);
    -[BWVideoFormatRequirements setWidth:](v351, "setWidth:", (int)objc_msgSend(*(id *)(v2 + 112), "stereoPhotoOutputDimensions"));
    -[BWVideoFormatRequirements setHeight:](v351, "setHeight:", objc_msgSend(*(id *)(v2 + 112), "stereoPhotoOutputDimensions") >> 32);
    -[BWVideoFormatRequirements setWidthAlignment:](v351, "setWidthAlignment:", 16);
    -[BWVideoFormatRequirements setHeightAlignment:](v351, "setHeightAlignment:", 16);
    v489 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v350);
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v351, "setSupportedPixelFormats:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v489, 1));
    if (objc_msgSend(v460, "colorSpaceProperties"))
    {
      v488 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v460, "colorSpaceProperties"));
      v352 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v488, 1);
    }
    else
    {
      v352 = 0;
    }
    -[BWVideoFormatRequirements setSupportedColorSpaceProperties:](v351, "setSupportedColorSpaceProperties:", v352);
    v487 = v351;
    v353 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v487, 1));
    result = -[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:]([BWPixelBufferPool alloc], "initWithVideoFormat:capacity:name:memoryPool:", v353, v349, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Stereo photo output pool (%@)"), BWStringForOSType(v350)), v472);
    *(_QWORD *)(v2 + 960) = result;
    if (result)
      v354 = v348;
    else
      v354 = 1;
    if ((v354 & 1) != 0)
    {
      if (!result)
        goto LABEL_572;
    }
    else
    {
      objc_msgSend(*(id *)(v2 + 688), "setInputFormat:", v353);
      objc_msgSend(*(id *)(v2 + 688), "setOutputFormat:", v353);
    }
  }
  if (dword_1ECFE9AF0)
  {
    v486 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    v355 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v356 = v486;
    if (os_log_type_enabled(v355, type))
      v357 = v356;
    else
      v357 = v356 & 0xFFFFFFFE;
    if (v357)
    {
      mach_absolute_time();
      v358 = FigHostTimeToNanoseconds();
      v563 = 136315650;
      v564 = "-[BWPhotonicEngineNode _setupProcessorCoordinator]";
      v565 = 2114;
      v566 = v340;
      v567 = 2048;
      v568 = (double)(v358 / 1000) / 1000.0;
      LODWORD(v438) = 32;
      v429 = &v563;
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v3 = v471;
  -[BWPixelBufferPool removeLastObject](v471, "removeLastObject", v429, v438);
  v5 = 0x1E0CB3000uLL;
LABEL_484:
  if (*(_QWORD *)(v2 + 688))
  {
    v359 = BWDeviceSupportsDeferredPhotoProcessorPrewarming();
    if (!objc_msgSend(*(id *)(v2 + 112), "deferredPhotoProcessorEnabled") || !v359)
    {
      FigDebugIsInternalBuild();
      v360 = objc_msgSend(*(id *)(v5 + 2368), "stringWithFormat:", CFSTR("%d"), 16);
      mach_absolute_time();
      -[BWPixelBufferPool addObject:](v3, "addObject:", v360);
      result = -[BWDeepZoomProcessorController initWithConfiguration:]([BWDeepZoomProcessorController alloc], "initWithConfiguration:", *(_QWORD *)(v2 + 688));
      if (!result)
        goto LABEL_572;
      v361 = result;
      result = (BWPixelBufferPool *)-[BWPixelBufferPool prepareWithPixelBufferPoolProvider:](result, "prepareWithPixelBufferPoolProvider:", v2);
      if ((_DWORD)result)
        goto LABEL_572;
      objc_msgSend(v470, "addObject:", v361);
      if (dword_1ECFE9AF0)
      {
        v486 = 0;
        type = OS_LOG_TYPE_DEFAULT;
        v362 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        v363 = v486;
        if (os_log_type_enabled(v362, type))
          v364 = v363;
        else
          v364 = v363 & 0xFFFFFFFE;
        if (v364)
        {
          mach_absolute_time();
          v365 = FigHostTimeToNanoseconds();
          v563 = 136315650;
          v564 = "-[BWPhotonicEngineNode _setupProcessorCoordinator]";
          v565 = 2114;
          v566 = v360;
          v567 = 2048;
          v568 = (double)(v365 / 1000) / 1000.0;
          LODWORD(v438) = 32;
          v430 = &v563;
          _os_log_send_and_compose_impl();
        }
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      v3 = v471;
      -[BWPixelBufferPool removeLastObject](v471, "removeLastObject", v430, v438);
      v5 = 0x1E0CB3000uLL;
    }
  }
  if (*(_QWORD *)(v2 + 736))
  {
    FigDebugIsInternalBuild();
    v366 = objc_msgSend(*(id *)(v5 + 2368), "stringWithFormat:", CFSTR("%d"), 17);
    mach_absolute_time();
    -[BWPixelBufferPool addObject:](v3, "addObject:", v366);
    objc_msgSend(*(id *)(v2 + 736), "setMemoryAnalyticsPayload:", objc_msgSend((id)objc_msgSend((id)v2, "graph"), "memoryAnalyticsPayload"));
    result = -[BWScalerProcessorController initWithConfiguration:]([BWScalerProcessorController alloc], "initWithConfiguration:", *(_QWORD *)(v2 + 736));
    if (!result)
      goto LABEL_572;
    objc_msgSend(v470, "addObject:", result);
    if (dword_1ECFE9AF0)
    {
      v486 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      v367 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      v368 = v486;
      if (os_log_type_enabled(v367, type))
        v369 = v368;
      else
        v369 = v368 & 0xFFFFFFFE;
      if (v369)
      {
        mach_absolute_time();
        v370 = FigHostTimeToNanoseconds();
        v563 = 136315650;
        v564 = "-[BWPhotonicEngineNode _setupProcessorCoordinator]";
        v565 = 2114;
        v566 = v366;
        v567 = 2048;
        v568 = (double)(v370 / 1000) / 1000.0;
        LODWORD(v438) = 32;
        v431 = &v563;
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v3 = v471;
    -[BWPixelBufferPool removeLastObject](v471, "removeLastObject", v431, v438);
    v5 = 0x1E0CB3000uLL;
  }
  if (*(_QWORD *)(v2 + 808))
  {
    BWDeviceSupportsDeferredPhotoProcessorPrewarming();
    objc_msgSend(*(id *)(v2 + 112), "deferredPhotoProcessorEnabled");
    FigDebugIsInternalBuild();
    v371 = objc_msgSend(*(id *)(v5 + 2368), "stringWithFormat:", CFSTR("%d"), 21);
    mach_absolute_time();
    -[BWPixelBufferPool addObject:](v3, "addObject:", v371);
    result = -[BWSmartStyleRenderingProcessorController initWithConfiguration:]([BWSmartStyleRenderingProcessorController alloc], "initWithConfiguration:", *(_QWORD *)(v2 + 808));
    if (!result)
      goto LABEL_572;
    objc_msgSend(v470, "addObject:", result);
    if (dword_1ECFE9AF0)
    {
      v486 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      v372 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      v373 = v486;
      if (os_log_type_enabled(v372, type))
        v374 = v373;
      else
        v374 = v373 & 0xFFFFFFFE;
      if (v374)
      {
        mach_absolute_time();
        v375 = FigHostTimeToNanoseconds();
        v563 = 136315650;
        v564 = "-[BWPhotonicEngineNode _setupProcessorCoordinator]";
        v565 = 2114;
        v566 = v371;
        v567 = 2048;
        v568 = (double)(v375 / 1000) / 1000.0;
        LODWORD(v438) = 32;
        v432 = &v563;
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v3 = v471;
    -[BWPixelBufferPool removeLastObject](v471, "removeLastObject", v432, v438);
    v5 = 0x1E0CB3000uLL;
  }
  if (*(_QWORD *)(v2 + 760))
  {
    FigDebugIsInternalBuild();
    v376 = objc_msgSend(*(id *)(v5 + 2368), "stringWithFormat:", CFSTR("%d"), 18);
    mach_absolute_time();
    -[BWPixelBufferPool addObject:](v3, "addObject:", v376);
    result = (BWPixelBufferPool *)objc_msgSend(*(id *)(v2 + 760), "stillImageDepthDataType");
    if ((_DWORD)result == 8 && !*(_QWORD *)(v2 + 248))
      goto LABEL_572;
    objc_msgSend(*(id *)(v2 + 760), "setInputDimensions:", -[BWPhotonicEngineNode _disparityProcessorInputDimensions](v2));
    result = -[BWStereoDisparityProcessorController initWithConfiguration:]([BWStereoDisparityProcessorController alloc], "initWithConfiguration:", *(_QWORD *)(v2 + 760));
    if (!result)
      goto LABEL_572;
    objc_msgSend(v470, "addObject:", result);
    if (dword_1ECFE9AF0)
    {
      v486 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      v377 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      v378 = v486;
      if (os_log_type_enabled(v377, type))
        v379 = v378;
      else
        v379 = v378 & 0xFFFFFFFE;
      if (v379)
      {
        mach_absolute_time();
        v380 = FigHostTimeToNanoseconds();
        v563 = 136315650;
        v564 = "-[BWPhotonicEngineNode _setupProcessorCoordinator]";
        v565 = 2114;
        v566 = v376;
        v567 = 2048;
        v568 = (double)(v380 / 1000) / 1000.0;
        LODWORD(v438) = 32;
        v433 = &v563;
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v3 = v471;
    -[BWPixelBufferPool removeLastObject](v471, "removeLastObject", v433, v438);
    v5 = 0x1E0CB3000uLL;
  }
  if (!*(_QWORD *)(v2 + 864))
    goto LABEL_539;
  FigDebugIsInternalBuild();
  v381 = objc_msgSend(*(id *)(v5 + 2368), "stringWithFormat:", CFSTR("%d"), 19);
  mach_absolute_time();
  -[BWPixelBufferPool addObject:](v3, "addObject:", v381);
  objc_msgSend(*(id *)(v2 + 864), "setInputColorFormat:", objc_msgSend(*(id *)(v2 + 344), "outputFormat"));
  objc_msgSend(*(id *)(v2 + 864), "setOutputDepthFormat:", objc_msgSend((id)objc_msgSend(*(id *)(v2 + 16), "mediaPropertiesForAttachedMediaKey:", CFSTR("Depth")), "resolvedVideoFormat"));
  result = -[BWJasperColorStillsExecutorController initWithConfiguration:]([BWJasperColorStillsExecutorController alloc], "initWithConfiguration:", *(_QWORD *)(v2 + 864));
  if (result)
  {
    objc_msgSend(v470, "addObject:", result);
    if (dword_1ECFE9AF0)
    {
      v486 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      v382 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      v383 = v486;
      if (os_log_type_enabled(v382, type))
        v384 = v383;
      else
        v384 = v383 & 0xFFFFFFFE;
      if (v384)
      {
        mach_absolute_time();
        v385 = FigHostTimeToNanoseconds();
        v563 = 136315650;
        v564 = "-[BWPhotonicEngineNode _setupProcessorCoordinator]";
        v565 = 2114;
        v566 = v381;
        v567 = 2048;
        v568 = (double)(v385 / 1000) / 1000.0;
        LODWORD(v438) = 32;
        v434 = &v563;
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v3 = v471;
    -[BWPixelBufferPool removeLastObject](v471, "removeLastObject", v434, v438);
    v5 = 0x1E0CB3000uLL;
LABEL_539:
    if (!*(_QWORD *)(v2 + 880))
    {
LABEL_549:
      os_unfair_lock_lock((os_unfair_lock_t)(v2 + 200));
      *(_QWORD *)(v2 + 168) = -[BWStillImageProcessorCoordinator initWithProcessorControllers:]([BWStillImageProcessorCoordinator alloc], "initWithProcessorControllers:", v470);
      os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 200));
      if ((objc_msgSend(*(id *)(v2 + 112), "deferredPhotoProcessorEnabled") & 1) == 0)
      {
        FigDebugIsInternalBuild();
        v392 = objc_msgSend(*(id *)(v5 + 2368), "stringWithFormat:", CFSTR("%d"), 23);
        mach_absolute_time();
        -[BWPixelBufferPool addObject:](v3, "addObject:", v392);
        -[BWPhotonicEngineNode _prepareSharedExternalMemoryResourceForProcessorControllersIfNeeded](v2);
        if (dword_1ECFE9AF0)
        {
          v486 = 0;
          type = OS_LOG_TYPE_DEFAULT;
          v393 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          v394 = v486;
          if (os_log_type_enabled(v393, type))
            v395 = v394;
          else
            v395 = v394 & 0xFFFFFFFE;
          if (v395)
          {
            mach_absolute_time();
            v396 = FigHostTimeToNanoseconds();
            v563 = 136315650;
            v564 = "-[BWPhotonicEngineNode _setupProcessorCoordinator]";
            v565 = 2114;
            v566 = v392;
            v567 = 2048;
            v568 = (double)(v396 / 1000) / 1000.0;
            LODWORD(v438) = 32;
            v436 = &v563;
            _os_log_send_and_compose_impl();
          }
          fig_log_call_emit_and_clean_up_after_send_and_compose();
          v3 = v471;
        }
        -[BWPixelBufferPool removeLastObject](v3, "removeLastObject", v436, v438);
      }
      if (objc_msgSend(v458, "count"))
        v397 = v458;
      else
        v397 = 0;
      objc_msgSend(v455, "setObject:forKeyedSubscript:", v397, &unk_1E49FC6A8);
      if (objc_msgSend(v459, "count"))
        v398 = v459;
      else
        v398 = 0;
      objc_msgSend(v455, "setObject:forKeyedSubscript:", v398, &unk_1E49FC6D8);
      *(_QWORD *)(v2 + 288) = objc_msgSend(v455, "copy");
      if (dword_1ECFE9AF0)
      {
        v486 = 0;
        type = OS_LOG_TYPE_DEFAULT;
        v399 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        v400 = v486;
        if (os_log_type_enabled(v399, type))
          v401 = v400;
        else
          v401 = v400 & 0xFFFFFFFE;
        if (v401)
        {
          mach_absolute_time();
          v402 = FigHostTimeToNanoseconds();
          v563 = 136315650;
          v564 = "-[BWPhotonicEngineNode _setupProcessorCoordinator]";
          v565 = 2114;
          v566 = v454;
          v567 = 2048;
          v568 = (double)(v402 / 1000) / 1000.0;
          LODWORD(v438) = 32;
          v413 = &v563;
          _os_log_send_and_compose_impl();
        }
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      result = (BWPixelBufferPool *)-[BWPixelBufferPool removeLastObject](v3, "removeLastObject", v413, v438);
      goto LABEL_572;
    }
    FigDebugIsInternalBuild();
    v386 = objc_msgSend(*(id *)(v5 + 2368), "stringWithFormat:", CFSTR("%d"), 20);
    mach_absolute_time();
    -[BWPixelBufferPool addObject:](v3, "addObject:", v386);
    objc_msgSend(*(id *)(v2 + 880), "setInputColorFormat:", objc_msgSend(*(id *)(v2 + 344), "outputFormat"));
    objc_msgSend(*(id *)(v2 + 880), "setOutputDepthFormat:", objc_msgSend((id)objc_msgSend(*(id *)(v2 + 16), "mediaPropertiesForAttachedMediaKey:", CFSTR("Depth")), "resolvedVideoFormat"));
    objc_msgSend(*(id *)(v2 + 880), "setPointCloudTimeMachineCapacity:", objc_msgSend(*(id *)(v2 + 840), "retainedBufferCount"));
    v387 = -[BWJasperDisparityProcessorController initWithConfiguration:]([BWJasperDisparityProcessorController alloc], "initWithConfiguration:", *(_QWORD *)(v2 + 880));
    if (v387)
    {
      objc_msgSend(v470, "addObject:", v387);
      if (dword_1ECFE9AF0)
      {
        v486 = 0;
        type = OS_LOG_TYPE_DEFAULT;
        v388 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        v389 = v486;
        if (os_log_type_enabled(v388, type))
          v390 = v389;
        else
          v390 = v389 & 0xFFFFFFFE;
        if (v390)
        {
          mach_absolute_time();
          v391 = FigHostTimeToNanoseconds();
          v563 = 136315650;
          v564 = "-[BWPhotonicEngineNode _setupProcessorCoordinator]";
          v565 = 2114;
          v566 = v386;
          v567 = 2048;
          v568 = (double)(v391 / 1000) / 1000.0;
          LODWORD(v438) = 32;
          v435 = &v563;
          _os_log_send_and_compose_impl();
        }
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        v3 = v471;
      }
      -[BWPixelBufferPool removeLastObject](v3, "removeLastObject", v435, v438);
      v5 = 0x1E0CB3000uLL;
      goto LABEL_549;
    }
    goto LABEL_587;
  }
LABEL_572:
  if (*(_QWORD *)(v2 + 168))
  {
    if (!dword_1ECFE9AF0)
      return result;
    v486 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    v403 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v404 = v486;
    if (os_log_type_enabled(v403, type))
      v405 = v404;
    else
      v405 = v404 & 0xFFFFFFFE;
    if (v405)
    {
      v563 = 136315138;
      v564 = "-[BWPhotonicEngineNode _setupProcessorCoordinator]";
      _os_log_send_and_compose_impl();
    }
  }
  else
  {
    v486 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    v406 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v407 = v486;
    if (os_log_type_enabled(v406, type))
      v408 = v407;
    else
      v408 = v407 & 0xFFFFFFFE;
    if (v408)
    {
      FrameworkRadarComponentName = FigCaptureGetFrameworkRadarComponentName();
      v410 = -[BWPixelBufferPool componentsJoinedByString:](v471, "componentsJoinedByString:", CFSTR("->"));
      v563 = 136315651;
      v564 = "-[BWPhotonicEngineNode _setupProcessorCoordinator]";
      v565 = 2081;
      v566 = FrameworkRadarComponentName;
      v567 = 2114;
      v568 = *(double *)&v410;
      _os_log_send_and_compose_impl();
    }
  }
  return (BWPixelBufferPool *)fig_log_call_emit_and_clean_up_after_send_and_compose();
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
  v6.super_class = (Class)BWPhotonicEngineNode;
  -[BWNode prepareForCurrentConfigurationToBecomeLive](&v6, sel_prepareForCurrentConfigurationToBecomeLive);
  processorCoordinatorWorkerQueue = self->_processorCoordinatorWorkerQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __66__BWPhotonicEngineNode_prepareForCurrentConfigurationToBecomeLive__block_invoke;
  v5[3] = &unk_1E491E720;
  v5[4] = self;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __ubn_dispatch_sync_block_invoke_0;
  block[3] = &unk_1E491ECB8;
  block[4] = v5;
  dispatch_sync(processorCoordinatorWorkerQueue, block);
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
  objc_super v3;

  -[BWPhotonicEngineNode _releaseResources]((uint64_t)self);

  self->_emitQueue = 0;
  v3.receiver = self;
  v3.super_class = (Class)BWPhotonicEngineNode;
  -[BWNode dealloc](&v3, sel_dealloc);
}

- (void)_releaseResources
{
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  const void *v5;
  NSObject *v6;
  const void *v7;
  const void *v8;
  const void *v9;
  const void *v10;
  const void *v11;
  _QWORD v12[5];
  _QWORD v13[5];
  uint64_t block;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  _QWORD *v18;

  if (a1)
  {
    if (!_FigIsNotCurrentDispatchQueue())
      FigDebugAssert3();
    if (!*(_BYTE *)(a1 + 96))
    {
      v2 = *(NSObject **)(a1 + 928);
      v3 = MEMORY[0x1E0C809B0];
      if (v2)
      {
        block = MEMORY[0x1E0C809B0];
        v15 = 3221225472;
        v16 = __ubn_dispatch_sync_block_invoke_0;
        v17 = &unk_1E491ECB8;
        v18 = &__block_literal_global_428;
        dispatch_sync(v2, &block);

        *(_QWORD *)(a1 + 928) = 0;
      }
      v4 = *(NSObject **)(a1 + 176);
      if (v4)
      {
        v13[0] = v3;
        v13[1] = 3221225472;
        v13[2] = __41__BWPhotonicEngineNode__releaseResources__block_invoke_2;
        v13[3] = &unk_1E491E720;
        v13[4] = a1;
        block = v3;
        v15 = 3221225472;
        v16 = __ubn_dispatch_sync_block_invoke_0;
        v17 = &unk_1E491ECB8;
        v18 = v13;
        dispatch_sync(v4, &block);
      }

      *(_QWORD *)(a1 + 120) = 0;
      *(_QWORD *)(a1 + 248) = 0;

      *(_QWORD *)(a1 + 256) = 0;
      *(_QWORD *)(a1 + 264) = 0;

      *(_QWORD *)(a1 + 272) = 0;
      *(_QWORD *)(a1 + 280) = 0;

      *(_QWORD *)(a1 + 288) = 0;
      *(_QWORD *)(a1 + 304) = 0;

      *(_QWORD *)(a1 + 320) = 0;
      *(_QWORD *)(a1 + 328) = 0;

      *(_QWORD *)(a1 + 336) = 0;
      *(_QWORD *)(a1 + 240) = 0;

      *(_QWORD *)(a1 + 344) = 0;
      *(_QWORD *)(a1 + 352) = 0;

      *(_QWORD *)(a1 + 904) = 0;
      *(_QWORD *)(a1 + 896) = 0;

      *(_QWORD *)(a1 + 920) = 0;
      *(_QWORD *)(a1 + 952) = 0;
      v5 = *(const void **)(a1 + 968);
      if (v5)
      {
        CFRelease(v5);
        *(_QWORD *)(a1 + 968) = 0;
      }

      *(_QWORD *)(a1 + 360) = 0;
      *(_QWORD *)(a1 + 368) = 0;

      *(_QWORD *)(a1 + 792) = 0;
      *(_QWORD *)(a1 + 376) = 0;

      *(_QWORD *)(a1 + 384) = 0;
      *(_QWORD *)(a1 + 176) = 0;

      *(_QWORD *)(a1 + 184) = 0;
      *(_QWORD *)(a1 + 192) = 0;

      *(_QWORD *)(a1 + 224) = 0;
      *(_QWORD *)(a1 + 112) = 0;

      *(_QWORD *)(a1 + 104) = 0;
      *(_QWORD *)(a1 + 408) = 0;

      *(_QWORD *)(a1 + 424) = 0;
      *(_QWORD *)(a1 + 432) = 0;

      *(_QWORD *)(a1 + 440) = 0;
      *(_QWORD *)(a1 + 448) = 0;

      *(_QWORD *)(a1 + 456) = 0;
      *(_QWORD *)(a1 + 416) = 0;

      *(_QWORD *)(a1 + 480) = 0;
      *(_QWORD *)(a1 + 392) = 0;

      *(_QWORD *)(a1 + 400) = 0;
      *(_QWORD *)(a1 + 472) = 0;
      v6 = *(NSObject **)(a1 + 488);
      if (v6)
      {
        v12[0] = v3;
        v12[1] = 3221225472;
        v12[2] = __41__BWPhotonicEngineNode__releaseResources__block_invoke_3;
        v12[3] = &unk_1E491E720;
        v12[4] = a1;
        block = v3;
        v15 = 3221225472;
        v16 = __ubn_dispatch_sync_block_invoke_0;
        v17 = &unk_1E491ECB8;
        v18 = v12;
        dispatch_sync(v6, &block);

        *(_QWORD *)(a1 + 488) = 0;
      }

      *(_QWORD *)(a1 + 496) = 0;
      *(_QWORD *)(a1 + 504) = 0;

      *(_QWORD *)(a1 + 512) = 0;
      *(_QWORD *)(a1 + 520) = 0;
      v7 = *(const void **)(a1 + 560);
      if (v7)
      {
        CFRelease(v7);
        *(_QWORD *)(a1 + 560) = 0;
      }
      v8 = *(const void **)(a1 + 568);
      if (v8)
      {
        CFRelease(v8);
        *(_QWORD *)(a1 + 568) = 0;
      }

      *(_QWORD *)(a1 + 576) = 0;
      *(_QWORD *)(a1 + 584) = 0;

      *(_QWORD *)(a1 + 592) = 0;
      *(_QWORD *)(a1 + 600) = 0;

      *(_QWORD *)(a1 + 608) = 0;
      *(_QWORD *)(a1 + 616) = 0;

      *(_QWORD *)(a1 + 640) = 0;
      *(_QWORD *)(a1 + 648) = 0;

      *(_QWORD *)(a1 + 656) = 0;
      *(_QWORD *)(a1 + 672) = 0;

      *(_QWORD *)(a1 + 680) = 0;
      *(_QWORD *)(a1 + 688) = 0;

      *(_QWORD *)(a1 + 696) = 0;
      *(_QWORD *)(a1 + 704) = 0;

      *(_QWORD *)(a1 + 712) = 0;
      -[BWPhotonicEngineNode _clearPortraitSemaphoreWithError:](a1);

      *(_QWORD *)(a1 + 736) = 0;
      *(_QWORD *)(a1 + 744) = 0;

      *(_QWORD *)(a1 + 752) = 0;
      *(_QWORD *)(a1 + 808) = 0;

      *(_QWORD *)(a1 + 816) = 0;
      *(_QWORD *)(a1 + 824) = 0;

      *(_QWORD *)(a1 + 832) = 0;
      *(_QWORD *)(a1 + 960) = 0;

      *(_QWORD *)(a1 + 760) = 0;
      *(_QWORD *)(a1 + 768) = 0;

      *(_QWORD *)(a1 + 800) = 0;
      *(_QWORD *)(a1 + 784) = 0;

      *(_QWORD *)(a1 + 864) = 0;
      *(_QWORD *)(a1 + 872) = 0;

      *(_QWORD *)(a1 + 880) = 0;
      *(_QWORD *)(a1 + 888) = 0;

      *(_QWORD *)(a1 + 624) = 0;
      *(_QWORD *)(a1 + 632) = 0;

      *(_QWORD *)(a1 + 936) = 0;
      *(_QWORD *)(a1 + 944) = 0;
      v9 = *(const void **)(a1 + 912);
      if (v9)
      {
        CFRelease(v9);
        *(_QWORD *)(a1 + 912) = 0;
      }

      *(_QWORD *)(a1 + 840) = 0;
      *(_QWORD *)(a1 + 128) = 0;

      *(_QWORD *)(a1 + 168) = 0;
      *(_QWORD *)(a1 + 232) = 0;
      v10 = *(const void **)(a1 + 992);
      if (v10)
      {
        CFRelease(v10);
        *(_QWORD *)(a1 + 992) = 0;
      }

      *(_QWORD *)(a1 + 1000) = 0;
      v11 = *(const void **)(a1 + 1008);
      if (v11)
      {
        CFRelease(v11);
        *(_QWORD *)(a1 + 1008) = 0;
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
  uint64_t v6;
  id v8;
  int v9;
  BOOL v10;

  if (!self->_intelligentDistortionCorrectionControllerConfiguration)
  {
LABEL_10:
    LOBYTE(v8) = 0;
    return (char)v8;
  }
  v6 = *(_QWORD *)&a3;
  LODWORD(v8) = objc_msgSend((id)-[BWPhotonicEngineNodeConfiguration portTypesWithIntelligentDistortionCorrectionEnabled]((uint64_t)self->_nodeConfiguration), "containsObject:", a5);
  if ((_DWORD)v8)
  {
    v8 = -[NSDictionary objectForKeyedSubscript:](self->_captureTypesWithIDCSupportWithOptionalCaptureFlags, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6));
    if (v8)
    {
      v9 = objc_msgSend(v8, "intValue");
      if (v9)
        v10 = (v9 & a4) == 0;
      else
        v10 = 0;
      if (!v10)
      {
        LOBYTE(v8) = 1;
        return (char)v8;
      }
      goto LABEL_10;
    }
  }
  return (char)v8;
}

- (BOOL)demosaicedRawSupportedForCaptureType:(int)a3
{
  return a3 <= 0xC
      && ((1 << a3) & 0x1C86) != 0
      && -[BWNRFProcessorControllerConfiguration demosaicedRawEnabled](self->_nrfProcessorControllerConfiguration, "demosaicedRawEnabled");
}

- (BOOL)processingOnBeginMomentSupportedForCaptureSettings:(id)a3
{
  int v5;
  char v7;

  if ((objc_msgSend(a3, "captureFlags") & 4) == 0)
    return 0;
  if (!self->_sensorRawInput)
    return 0;
  v7 = 0;
  -[BWPhotonicEngineNode _infoForCaptureType:isSupportedCaptureTypeOut:isFusionCaptureTypeOut:]((_BOOL8)self, objc_msgSend(a3, "captureType"), &v7, 0);
  if (!v7)
    return 0;
  v5 = objc_msgSend(a3, "captureType");
  if (v5 == 12)
    return objc_msgSend(a3, "deliverDeferredPhotoProxyImage");
  if (v5 != 10)
  {
    if (v5 != 1
      || (objc_msgSend(a3, "captureFlags") & 0x100000000) == 0
      || (objc_msgSend(a3, "captureFlags") & 0x80) == 0)
    {
      return 0;
    }
    return objc_msgSend(a3, "deliverDeferredPhotoProxyImage");
  }
  return 1;
}

- (BOOL)_infoForCaptureType:(_BYTE *)a3 isSupportedCaptureTypeOut:(char *)a4 isFusionCaptureTypeOut:
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
        result = -[BWPhotonicEngineNodeConfiguration fusionSupportEnabled](*(_QWORD *)(v6 + 112));
        goto LABEL_8;
      case 11:
        result = -[BWPhotonicEngineNodeConfiguration digitalFlashSupportEnabled](*(_QWORD *)(v6 + 112));
        goto LABEL_8;
      case 12:
        result = -[BWPhotonicEngineNodeConfiguration deepFusionSupportEnabled](*(_QWORD *)(v6 + 112));
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

- (BOOL)rawNightModeSupportedForPortType:(id)a3
{
  return objc_msgSend((id)-[BWPhotonicEngineNodeConfiguration portTypesWithRawNightModeEnabled]((uint64_t)self->_nodeConfiguration), "containsObject:", a3);
}

- (id)processorCoordinator
{
  return self->_processorCoordinator;
}

- (id)nodeSubType
{
  return CFSTR("PhotonicEngineProcessor");
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
  v12[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 984));
  -[BWVideoFormatRequirements setSupportedPixelFormats:](v9, "setSupportedPixelFormats:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1));
  -[BWVideoFormatRequirements setWidth:](v9, "setWidth:", (int)a2);
  -[BWVideoFormatRequirements setHeight:](v9, "setHeight:", a2 >> 32);
  -[BWVideoFormatRequirements setWidthAlignment:](v9, "setWidthAlignment:", 16);
  -[BWVideoFormatRequirements setHeightAlignment:](v9, "setHeightAlignment:", 16);
  if (!v7)
  {
    v11 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v8);
    -[BWVideoFormatRequirements setSupportedColorSpaceProperties:](v9, "setSupportedColorSpaceProperties:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 1));
  }
  return v9;
}

BWPixelBufferPool *__66__BWPhotonicEngineNode_prepareForCurrentConfigurationToBecomeLive__block_invoke(uint64_t a1)
{
  return -[BWPhotonicEngineNode _setupProcessorCoordinator](*(BWPixelBufferPool **)(a1 + 32));
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
  BWNodeInput *sensorRawInput;
  NSObject *deferredProcessorControllerQueue;
  NSObject *processorCoordinatorWorkerQueue;
  uint64_t v9;
  NSObject *v10;
  NSObject *emitQueue;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[5];
  _QWORD v15[5];
  _QWORD v16[5];
  os_log_type_t type;
  int v18;
  uint64_t block;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  _QWORD *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (dword_1ECFE9AF0)
  {
    v18 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (-[BWNode input:hasReachedState:](self, "input:hasReachedState:", self->super._input, 0, v12, v13))
  {
    sensorRawInput = self->_sensorRawInput;
    if ((!sensorRawInput || -[BWNode input:hasReachedState:](self, "input:hasReachedState:", sensorRawInput, 0))
      && self->_pointCloudInput != a3
      && !self->_resourcesReleased)
    {
      -[BWFigVideoCaptureDevice setAdaptiveUnifiedBracketingController:](self->_device, "setAdaptiveUnifiedBracketingController:", 0);

      self->_device = 0;
      deferredProcessorControllerQueue = self->_deferredProcessorControllerQueue;
      if (deferredProcessorControllerQueue)
      {
        block = MEMORY[0x1E0C809B0];
        v20 = 3221225472;
        v21 = __ubn_dispatch_sync_block_invoke_0;
        v22 = &unk_1E491ECB8;
        v23 = &__block_literal_global_117;
        dispatch_sync(deferredProcessorControllerQueue, &block);
      }
      processorCoordinatorWorkerQueue = self->_processorCoordinatorWorkerQueue;
      v9 = MEMORY[0x1E0C809B0];
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __50__BWPhotonicEngineNode_didReachEndOfDataForInput___block_invoke_2;
      v16[3] = &unk_1E491E720;
      v16[4] = self;
      block = MEMORY[0x1E0C809B0];
      v20 = 3221225472;
      v21 = __ubn_dispatch_sync_block_invoke_0;
      v22 = &unk_1E491ECB8;
      v23 = v16;
      dispatch_sync(processorCoordinatorWorkerQueue, &block);
      v10 = self->_processorCoordinatorWorkerQueue;
      v15[0] = v9;
      v15[1] = 3221225472;
      v15[2] = __50__BWPhotonicEngineNode_didReachEndOfDataForInput___block_invoke_5;
      v15[3] = &unk_1E491E720;
      v15[4] = self;
      block = v9;
      v20 = 3221225472;
      v21 = __ubn_dispatch_sync_block_invoke_0;
      v22 = &unk_1E491ECB8;
      v23 = v15;
      dispatch_sync(v10, &block);
    }
  }
  if (-[BWNode allInputsHaveReachedState:](self, "allInputsHaveReachedState:", 0))
  {
    -[BWPhotonicEngineNode _releaseResources]((uint64_t)self);
    emitQueue = self->_emitQueue;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __50__BWPhotonicEngineNode_didReachEndOfDataForInput___block_invoke_6;
    v14[3] = &unk_1E491E720;
    v14[4] = self;
    block = MEMORY[0x1E0C809B0];
    v20 = 3221225472;
    v21 = __ubn_dispatch_async_block_invoke_0;
    v22 = &unk_1E491ECB8;
    v23 = v14;
    dispatch_async(emitQueue, &block);
  }
}

void __50__BWPhotonicEngineNode_didReachEndOfDataForInput___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t block;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  void *v10;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 488);
  v4 = MEMORY[0x1E0C809B0];
  if (v3)
  {
    block = MEMORY[0x1E0C809B0];
    v7 = 3221225472;
    v8 = __ubn_dispatch_sync_block_invoke_0;
    v9 = &unk_1E491ECB8;
    v10 = &__block_literal_global_58;
    dispatch_sync(v3, &block);
    v2 = *(_QWORD *)(a1 + 32);
  }
  v5 = *(NSObject **)(v2 + 784);
  if (v5)
  {
    block = v4;
    v7 = 3221225472;
    v8 = __ubn_dispatch_sync_block_invoke_0;
    v9 = &unk_1E491ECB8;
    v10 = &__block_literal_global_59_2;
    dispatch_sync(v5, &block);
  }
}

void __50__BWPhotonicEngineNode_didReachEndOfDataForInput___block_invoke_5(uint64_t a1)
{
  -[BWPhotonicEngineNode _resetProcessingState](*(_QWORD *)(a1 + 32));
}

- (void)_resetProcessingState
{
  uint64_t v1;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  const void *v8;
  const void *v9;
  uint64_t v10;
  uint64_t v11;
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
      v11 = v1;
      LODWORD(v10) = 0;
      FigDebugAssert3();
    }
    if (*(_BYTE *)(a1 + 216))
    {
      if (*(_QWORD *)(a1 + 152) && dword_1ECFE9AF0 != 0)
      {
        v15 = 0;
        type = OS_LOG_TYPE_DEFAULT;
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
    }
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 168), "controllerForType:", 12, v10, v11), "cancelProcessing");
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 168), "controllerForType:", 6), "cancelProcessing");
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 168), "controllerForType:", 2), "cancelProcessing");
    v5 = *(NSObject **)(a1 + 488);
    v6 = MEMORY[0x1E0C809B0];
    if (v5)
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __45__BWPhotonicEngineNode__resetProcessingState__block_invoke;
      v13[3] = &unk_1E491E720;
      v13[4] = a1;
      block = MEMORY[0x1E0C809B0];
      v17 = 3221225472;
      v18 = __ubn_dispatch_sync_block_invoke_0;
      v19 = &unk_1E491ECB8;
      v20 = v13;
      dispatch_sync(v5, &block);
    }
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 168), "controllerForType:", 7), "cancelProcessing");
    objc_msgSend((id)-[BWPhotonicEngineNode _waitAndSafelyGetProcessorControllerForType:](a1, 10), "cancelProcessing");
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 168), "controllerForType:", 18), "cancelProcessing");
    objc_msgSend((id)-[BWPhotonicEngineNode _waitAndSafelyGetProcessorControllerForType:](a1, 16), "cancelProcessing");
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 168), "controllerForType:", 15), "cancelProcessing");
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 168), "controllerForType:", 4), "cancelProcessing");
    v7 = *(NSObject **)(a1 + 784);
    if (v7)
    {
      v12[0] = v6;
      v12[1] = 3221225472;
      v12[2] = __45__BWPhotonicEngineNode__resetProcessingState__block_invoke_2;
      v12[3] = &unk_1E491E720;
      v12[4] = a1;
      block = v6;
      v17 = 3221225472;
      v18 = __ubn_dispatch_sync_block_invoke_0;
      v19 = &unk_1E491ECB8;
      v20 = v12;
      dispatch_sync(v7, &block);
    }
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 168), "controllerForType:", 9), "cancelProcessing");
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 168), "controllerForType:", 13), "cancelProcessing");
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 168), "controllerForType:", 11), "cancelProcessing");
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 168), "controllerForType:", 14), "cancelProcessing");
    objc_msgSend(*(id *)(a1 + 416), "removeAllObjects");

    *(_QWORD *)(a1 + 464) = 0;
    objc_msgSend(*(id *)(a1 + 480), "removeAllObjects");
    objc_msgSend(*(id *)(a1 + 648), "removeAllObjects");
    objc_msgSend(*(id *)(a1 + 656), "removeAllObjects");
    objc_msgSend(*(id *)(a1 + 696), "removeAllObjects");
    objc_msgSend(*(id *)(a1 + 744), "removeAllObjects");
    objc_msgSend(*(id *)(a1 + 816), "removeAllObjects");
    objc_msgSend(*(id *)(a1 + 592), "removeAllObjects");
    objc_msgSend(*(id *)(a1 + 600), "removeAllObjects");
    objc_msgSend(*(id *)(a1 + 616), "removeAllObjects");
    objc_msgSend(*(id *)(a1 + 632), "removeAllObjects");

    *(_QWORD *)(a1 + 768) = 0;
    objc_msgSend(*(id *)(a1 + 800), "removeAllObjects");
    *(_DWORD *)(a1 + 776) = 0;
    objc_msgSend(*(id *)(a1 + 872), "removeAllObjects");
    objc_msgSend(*(id *)(a1 + 888), "removeAllObjects");
    objc_msgSend(*(id *)(a1 + 264), "removeAllObjects");
    objc_msgSend(*(id *)(a1 + 272), "removeAllObjects");
    objc_msgSend(*(id *)(a1 + 280), "removeAllObjects");

    *(_QWORD *)(a1 + 296) = 0;
    objc_msgSend(*(id *)(a1 + 304), "removeAllObjects");
    objc_msgSend(*(id *)(a1 + 320), "removeAllObjects");
    objc_msgSend(*(id *)(a1 + 328), "removeAllObjects");
    objc_msgSend(*(id *)(a1 + 336), "removeAllObjects");
    objc_msgSend(*(id *)(a1 + 400), "removeAllObjects");
    v8 = *(const void **)(a1 + 912);
    if (v8)
    {
      CFRelease(v8);
      *(_QWORD *)(a1 + 912) = 0;
    }

    *(_QWORD *)(a1 + 904) = 0;
    objc_msgSend(*(id *)(a1 + 920), "removeAllObjects");
    objc_msgSend(*(id *)(a1 + 952), "removeAllObjects");
    v9 = *(const void **)(a1 + 968);
    if (v9)
    {
      CFRelease(v9);
      *(_QWORD *)(a1 + 968) = 0;
    }
    objc_msgSend(*(id *)(a1 + 352), "removeAllObjects");
    objc_msgSend(*(id *)(a1 + 360), "removeAllObjects");
    objc_msgSend(*(id *)(a1 + 368), "removeAllObjects");
    objc_msgSend(*(id *)(a1 + 792), "removeAllObjects");
    if (*(_QWORD *)(a1 + 152))
    {

      *(_QWORD *)(a1 + 136) = *(id *)(a1 + 152);
    }
    *(_QWORD *)(a1 + 144) = 0;

    *(_QWORD *)(a1 + 152) = 0;
    *(_QWORD *)(a1 + 160) = 0;
    *(_BYTE *)(a1 + 312) = 0;
  }
}

uint64_t __50__BWPhotonicEngineNode_didReachEndOfDataForInput___block_invoke_6(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "liveFormat");
  if (result)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "markEndOfLiveOutput");
  return result;
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  BWPhotonicEngineNodeSampleBufferAndInput *v7;
  BWPhotonicEngineNodeSampleBufferAndInput *v8;
  NSObject *processorCoordinatorWorkerQueue;
  uint64_t v10;
  CFTypeRef v11;
  _QWORD v12[5];
  _QWORD block[5];

  if (self->_resourcesReleased)
  {
    v10 = 4294954516;
  }
  else
  {
    if (self->_pointCloudInput == a4)
    {
      -[BWPhotonicEngineNode _handlePointCloudSampleBuffer:]((uint64_t)self, a3);
      return;
    }
    v7 = -[BWPhotonicEngineNodeSampleBufferAndInput initWithSampleBuffer:nodeInput:]([BWPhotonicEngineNodeSampleBufferAndInput alloc], "initWithSampleBuffer:nodeInput:", a3, a4);
    if (v7)
    {
      v8 = v7;
      -[BWPhotonicEngineNodeSampleBufferAndInputQueue enqueue:](self->_sampleBufferAndInputQueue, "enqueue:", v7);

      processorCoordinatorWorkerQueue = self->_processorCoordinatorWorkerQueue;
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __52__BWPhotonicEngineNode_renderSampleBuffer_forInput___block_invoke;
      v12[3] = &unk_1E491E720;
      v12[4] = self;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __ubn_dispatch_async_block_invoke_0;
      block[3] = &unk_1E491ECB8;
      block[4] = v12;
      dispatch_async(processorCoordinatorWorkerQueue, block);
      return;
    }
    v10 = 4294954510;
  }
  v11 = CMGetAttachment(a3, CFSTR("StillSettings"), 0);
  -[BWPhotonicEngineNode handleNodeError:forInput:](self, "handleNodeError:forInput:", +[BWNodeError newError:sourceNode:stillImageSettings:metadata:](BWNodeError, "newError:sourceNode:stillImageSettings:metadata:", v10, self, v11, CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0)), a4);
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
  if (-[BWPhotonicEngineNodeConfiguration generateLiDARDepth](*(_QWORD *)(v3 + 112)))
  {
    -[BWPhotonicEngineNode _handleLidarDepthPointCloudSampleBuffer:](v3, (uint64_t)a2);
  }
  else
  {
    result = objc_msgSend(*(id *)(v3 + 104), "supplementalPointCloudCaptureDevice");
    if (!result)
      return result;
    -[BWPhotonicEngineNode _handleSupplementalPointCloudSampleBuffer:](v3, a2);
  }
  return 0;
}

void __52__BWPhotonicEngineNode_renderSampleBuffer_forInput___block_invoke(uint64_t a1)
{
  -[BWPhotonicEngineNode _handleNextQueuedSampleBuffer](*(_QWORD *)(a1 + 32));
}

- (void)_handleNextQueuedSampleBuffer
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  CFTypeRef v5;
  const void *v6;
  CFTypeRef v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  if (a1)
  {
    if (!_FigIsCurrentDispatchQueue())
    {
      v10 = v1;
      LODWORD(v8) = 0;
      FigDebugAssert3();
    }
    v11 = (id)objc_msgSend(*(id *)(a1 + 232), "newDequeuedSampleBufferAndInput", v8, v10);
    if (v11)
    {
      v3 = -[BWPhotonicEngineNode _handleSampleBuffer:input:](a1, (void *)objc_msgSend(v11, "sampleBuffer"), objc_msgSend(v11, "nodeInput"));
      if ((_DWORD)v3)
      {
        v4 = v3;
        LODWORD(v9) = v3;
        FigDebugAssert3();
        v5 = CMGetAttachment((CMAttachmentBearerRef)objc_msgSend(v11, "sampleBuffer", v9, v1), CFSTR("StillSettings"), 0);
        v6 = (const void *)objc_msgSend(v11, "sampleBuffer");
        v7 = CMGetAttachment(v6, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
        -[BWPhotonicEngineNode _resetProcessingState](a1);
        -[BWPhotonicEngineNode _emitError:stillImageSettings:metadata:description:](a1, v4, (uint64_t)v5, (uint64_t)v7);
      }
    }

  }
}

- (uint64_t)_handleSampleBuffer:(uint64_t)a3 input:
{
  void *v6;
  void *v7;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  CFTypeRef v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  void (**v22)(id, void *, uint64_t, id, _QWORD);
  void *v23;
  unsigned int v24;
  uint64_t v25;
  int v26;
  int v27;
  int v28;
  _QWORD v29[7];
  char v30[2];
  int v31;
  _QWORD block[18];

  block[16] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  if (!_FigIsCurrentDispatchQueue())
  {
    FigDebugAssert3();
    if (a2)
      goto LABEL_4;
LABEL_43:
    v20 = 4294954516;
    goto LABEL_20;
  }
  if (!a2)
    goto LABEL_43;
LABEL_4:
  v6 = (void *)CMGetAttachment(a2, CFSTR("StillSettings"), 0);
  if (!v6)
    goto LABEL_43;
  v7 = v6;
  if (objc_msgSend((id)objc_msgSend(v6, "requestedSettings"), "isBeginMomentCaptureSettings")
    && !*(_BYTE *)(a1 + 312)
    && objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 160), "requestedSettings"), "captureRequestIdentifier"), "isEqualToString:", objc_msgSend((id)objc_msgSend(v7, "requestedSettings"), "captureRequestIdentifier")))
  {
    BWStillImageCoordinatorUpdateBeginMomentAttachmentsForSampleBuffer(a2, *(void **)(a1 + 160));
    v7 = *(void **)(a1 + 160);
  }
  if (dword_1ECFE9AF0)
  {
    v31 = 0;
    v30[1] = 0;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v9 = (void *)CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  if (!v9)
    goto LABEL_43;
  v10 = v9;
  v11 = (void *)objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00]);
  if (-[BWPhotonicEngineNode _shouldPassthroughWithStillImageSettings:](a1, v7))
  {
    if (FigCaptureSushiRawDNGDictionaryCreatedInGraph()
      && FigCapturePixelFormatIsBayerRaw(objc_msgSend((id)objc_msgSend(v7, "requestedSettings"), "rawOutputFormat")))
    {
      v24 = objc_msgSend((id)objc_msgSend(v7, "requestedSettings"), "outputWidth");
      v25 = objc_msgSend((id)objc_msgSend(v7, "requestedSettings"), "outputHeight");
      v26 = objc_msgSend((id)objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D05F18]), "intValue");
      v27 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 640), "portTypesWithGeometricDistortionCorrectionEnabled"), "containsObject:", v11);
      if (v26)
        v28 = 1;
      else
        v28 = v27;
      -[BWPhotonicEngineNode _propagateSushiRawDNGDictionaryWithOutputSampleBuffer:requestedDimensions:requiresGDCInformation:](a1, a2, v24 | (unint64_t)(v25 << 32), v28);
    }
    -[BWPhotonicEngineNode _emitSampleBuffer:description:](a1, a2, (uint64_t)CFSTR("passthrough input frame"));
    goto LABEL_19;
  }
  v30[0] = 0;
  -[BWPhotonicEngineNode _infoForCaptureType:isSupportedCaptureTypeOut:isFusionCaptureTypeOut:](a1, objc_msgSend((id)objc_msgSend(v7, "captureSettings"), "captureType"), 0, v30);
  if ((objc_msgSend(*(id *)(a1 + 112), "deferredPhotoProcessorEnabled") & 1) == 0
    && v30[0]
    && (objc_msgSend(*(id *)(a1 + 136), "isEqualToString:", objc_msgSend((id)objc_msgSend(v7, "requestedSettings"), "captureRequestIdentifier")) & 1) != 0)
  {
LABEL_19:
    v20 = 0;
LABEL_20:
    -[BWPhotonicEngineNode _resetProcessingStateIfDone](a1);
    return v20;
  }
  v12 = -[BWPhotonicEngineNode _setupProcessingStateWithSettings:](a1, v7);
  if ((_DWORD)v12)
  {
    v20 = v12;
    goto LABEL_20;
  }
  v13 = (id)objc_msgSend(*(id *)(a1 + 944), "objectForKeyedSubscript:", v11);
  v14 = (id)objc_msgSend(*(id *)(a1 + 632), "objectForKeyedSubscript:", v11);
  v15 = (id)objc_msgSend(*(id *)(a1 + 400), "objectForKeyedSubscript:", v11);
  v16 = (id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 352), "objectForKeyedSubscript:", v11), "firstObject");
  if (v13)
  {
    v17 = CMGetAttachment(a2, CFSTR("DeferredProcessingContainer"), 0);
    v18 = objc_msgSend((id)objc_msgSend((id)CMGetAttachment(a2, CFSTR("PhotoManifest"), 0), "photoDescriptors"), "firstObject");
    v19 = *(NSObject **)(a1 + 928);
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __50__BWPhotonicEngineNode__handleSampleBuffer_input___block_invoke;
    v29[3] = &unk_1E491EB90;
    v29[4] = v13;
    v29[5] = v17;
    v29[6] = v18;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __ubn_dispatch_async_block_invoke_0;
    block[3] = &unk_1E491ECB8;
    block[4] = v29;
    dispatch_async(v19, block);
    goto LABEL_19;
  }
  if (*(_QWORD *)(a1 + 128) == a3)
  {
    v20 = -[BWPhotonicEngineNode _handleSensorRawSampleBuffer:](a1, a2);
    if ((_DWORD)v20)
      FigDebugAssert3();
    goto LABEL_20;
  }
  if (v14)
  {
    if (+[BWRedEyeReductionControllerInput requiresInferencesFromFrame:](BWRedEyeReductionControllerInput, "requiresInferencesFromFrame:", a2))
    {
      -[BWPhotonicEngineNode _inferenceProcessRedEyeReductionSampleBuffer:settings:portType:](a1, (opaqueCMSampleBuffer *)a2, v7, v11);
    }
    else
    {
      v22 = (void (**)(id, void *, uint64_t, id, _QWORD))-[BWPhotonicEngineNode _ubRERRouter]((id)a1);
      v22[2](v22, a2, 1, v14, 0);
    }
    goto LABEL_19;
  }
  if (v15)
  {
    objc_msgSend(v15, "setInputFrame:", a2);
    goto LABEL_19;
  }
  v23 = v16;
  if (v16)
  {
    objc_msgSend(v16, "addFrame:", a2);
    if ((objc_msgSend((id)objc_msgSend(v7, "captureSettings"), "captureFlags") & 4) == 0)
    {
      if (objc_msgSend((id)objc_msgSend(v7, "captureSettings"), "captureType") == 7)
      {
        -[BWPhotonicEngineNode _handleClientBracketFrameEmissionForSampleBuffer:](a1, a2);
        if (!-[BWPhotonicEngineNode _processingNeededForSettings:portType:](a1, (void *)objc_msgSend(v23, "stillImageSettings"), objc_msgSend(v23, "portType"))&& objc_msgSend(v23, "receivedAllFrames"))
        {
          -[BWPhotonicEngineNode _processorControllerDidFinishProcessingInputForPortType:processorType:captureRequestIdentifier:](a1, objc_msgSend(v23, "portType"), 6, (void *)objc_msgSend((id)objc_msgSend(v23, "settings"), "captureRequestIdentifier"));
        }
      }
      else
      {
        -[BWPhotonicEngineNode _emitOrEnqueueFusionReferenceFrameIfNeededForSampleBuffer:](a1, a2);
      }
    }
    goto LABEL_19;
  }
  v20 = 0;
  if (!-[BWPhotonicEngineNode _processingNeededForSettings:portType:](a1, v7, (uint64_t)v11) || v30[0])
    goto LABEL_20;
  v20 = -[BWPhotonicEngineNode _singleImageProcessSampleBuffer:settings:portType:](a1, (uint64_t)a2, v7, v11);
  if ((_DWORD)v20)
    FigDebugAssert3();
  return v20;
}

- (void)_emitError:(uint64_t)a1 stillImageSettings:(uint64_t)a2 metadata:(uint64_t)a3 description:(uint64_t)a4
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[6];
  os_log_type_t type;
  int v15;
  _QWORD block[18];

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
    v9 = +[BWNodeError newError:sourceNode:stillImageSettings:metadata:](BWNodeError, "newError:sourceNode:stillImageSettings:metadata:", a2, a1, a3, a4, v11, v12);
    v10 = *(NSObject **)(a1 + 208);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __75__BWPhotonicEngineNode__emitError_stillImageSettings_metadata_description___block_invoke;
    v13[3] = &unk_1E491E748;
    v13[4] = a1;
    v13[5] = v9;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __ubn_dispatch_async_block_invoke_0;
    block[3] = &unk_1E491ECB8;
    block[4] = v13;
    dispatch_async(v10, block);
  }
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
    return objc_msgSend((id)objc_msgSend(*(id *)(v4 + 168), "controllerForType:", 13, v5, v6), "addPointCloudToTimeMachine:", a2);
  }
  return result;
}

- (void)_handleSupplementalPointCloudSampleBuffer:(uint64_t)a1
{
  int v4;
  uint64_t v5;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v7;
  _QWORD v8[6];
  os_log_type_t type;
  int v10;
  _QWORD block[17];

  block[16] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (!_FigIsNotCurrentDispatchQueue())
      FigDebugAssert3();
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 848));
    v4 = *(unsigned __int8 *)(a1 + 852);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 848));
    v5 = *(_QWORD *)(a1 + 856) + 1;
    *(_QWORD *)(a1 + 856) = v5;
    if (__ROR8__(0xCCCCCCCCCCCCCCCDLL * v5, 1) <= 0x1999999999999999uLL)
    {
      if (dword_1ECFE9AF0)
      {
        v10 = 0;
        type = OS_LOG_TYPE_DEFAULT;
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        v5 = *(_QWORD *)(a1 + 856);
      }
      if (v5 == -1)
        *(_QWORD *)(a1 + 856) = 0;
    }
    if (!v4)
    {
      if (a2)
        CFRetain(a2);
      v7 = *(NSObject **)(a1 + 176);
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __66__BWPhotonicEngineNode__handleSupplementalPointCloudSampleBuffer___block_invoke;
      v8[3] = &unk_1E491F158;
      v8[4] = a1;
      v8[5] = a2;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __ubn_dispatch_async_block_invoke_0;
      block[3] = &unk_1E491ECB8;
      block[4] = v8;
      dispatch_async(v7, block);
    }
  }
}

void __66__BWPhotonicEngineNode__handleSupplementalPointCloudSampleBuffer___block_invoke(uint64_t a1)
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
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 848));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(unsigned __int8 *)(v2 + 852);
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 848));
  if (!v3)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 872);
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
        v10 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 872), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i));
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
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "stopPointCloudCaptureForStillImageCaptureWithSettingsID:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 144));
      v11 = 1;
    }
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 848));
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 852) = v11;
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 848));
  }
  v12 = *(const void **)(a1 + 40);
  if (v12)
    CFRelease(v12);
  -[BWPhotonicEngineNode _resetProcessingStateIfDone](*(_QWORD *)(a1 + 32));
}

- (void)_resetProcessingStateIfDone
{
  if (a1)
  {
    if (!_FigIsCurrentDispatchQueue())
      FigDebugAssert3();
    if (*(_QWORD *)(a1 + 152)
      && !*(_BYTE *)(a1 + 312)
      && !objc_msgSend(*(id *)(a1 + 264), "count")
      && !objc_msgSend(*(id *)(a1 + 320), "count")
      && !objc_msgSend(*(id *)(a1 + 328), "count")
      && !*(_QWORD *)(a1 + 904)
      && !objc_msgSend(*(id *)(a1 + 352), "count")
      && !objc_msgSend(*(id *)(a1 + 416), "count")
      && !objc_msgSend(*(id *)(a1 + 480), "count")
      && !objc_msgSend(*(id *)(a1 + 656), "count")
      && !objc_msgSend(*(id *)(a1 + 696), "count")
      && !objc_msgSend(*(id *)(a1 + 744), "count")
      && !objc_msgSend(*(id *)(a1 + 816), "count")
      && !objc_msgSend(*(id *)(a1 + 592), "count")
      && !objc_msgSend(*(id *)(a1 + 616), "count")
      && !objc_msgSend(*(id *)(a1 + 632), "count")
      && !objc_msgSend(*(id *)(a1 + 944), "count")
      && *(int *)(a1 + 776) <= 0
      && !objc_msgSend(*(id *)(a1 + 872), "count")
      && !objc_msgSend(*(id *)(a1 + 888), "count")
      && !*(_DWORD *)(a1 + 776))
    {
      -[BWPhotonicEngineNode _resetProcessingState](a1);
    }
  }
}

- (BOOL)_shouldPassthroughWithStillImageSettings:(_BOOL8)result
{
  int v3;
  char v4;
  char v5;
  int v6;
  _BOOL4 v8;

  if (result)
  {
    v3 = objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "deliverSushiRaw");
    v4 = objc_msgSend((id)objc_msgSend(a2, "requestedSettings"), "previewEnabled");
    v5 = objc_msgSend((id)objc_msgSend(a2, "requestedSettings"), "rawThumbnailEnabled");
    v6 = objc_msgSend((id)objc_msgSend(a2, "requestedSettings"), "outputFormat");
    v8 = (objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureFlags") & 0x800) == 0 && v6 == 0;
    if ((v5 & 1) != 0)
      v8 = 0;
    if ((v4 & 1) != 0)
      v8 = 0;
    return v3 && v8;
  }
  return result;
}

- (uint64_t)_setupProcessingStateWithSettings:(unint64_t)a1
{
  uint64_t v2;
  id v5;
  void *v6;
  void *v7;
  int v8;
  char v9;
  int *v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  unsigned int v15;
  unsigned int v16;
  uint64_t v17;
  _BOOL4 v18;
  NSObject *v19;
  NSObject *v20;
  BWStillImageProcessingPlan *v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  BWNRFProcessorInput *v32;
  id v33;
  void *v34;
  _BOOL4 v35;
  void *v36;
  uint64_t v37;
  BWStillImageProcessingPlan *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t j;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  int *v48;
  uint64_t k;
  void *v50;
  void *v51;
  uint64_t v52;
  int v53;
  char v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  int *v58;
  uint64_t v59;
  id v60;
  uint64_t v61;
  id v62;
  uint64_t v63;
  BOOL v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t m;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  id v81;
  uint64_t v82;
  uint64_t v83;
  id v85;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v87;
  int *v88;
  uint64_t v89;
  uint64_t v90;
  _BOOL4 v91;
  int v92;
  id v93;
  void *v94;
  char v95;
  char v96;
  int v97;
  void *v98;
  void *v99;
  BWStillImageProcessingPlan *v100;
  id obj;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  _QWORD v118[5];
  unsigned __int8 v119;
  char v120;
  os_log_type_t type;
  unsigned int v122;
  _BYTE v123[128];
  uint64_t v124;
  _BYTE v125[128];
  _BYTE v126[128];
  _BYTE v127[128];
  int v128;
  const char *v129;
  __int16 v130;
  uint64_t v131;
  __int16 v132;
  double v133;
  _QWORD block[19];

  block[16] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  if (!_FigIsCurrentDispatchQueue())
  {
    v90 = v2;
    LODWORD(v88) = 0;
    FigDebugAssert3();
  }
  v5 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  if (!*(_QWORD *)(a1 + 168))
  {
    v85 = v5;
    v122 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    v24 = 4294950488;
    v36 = v85;
    goto LABEL_128;
  }
  v93 = v5;
  if (!a2)
  {
    v122 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    v87 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT);
    v36 = v93;
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    v24 = 4294950488;
    goto LABEL_128;
  }
  v6 = (void *)objc_msgSend(a2, "requestedSettings");
  v7 = (void *)objc_msgSend(a2, "captureSettings");
  v8 = objc_msgSend(*(id *)(a1 + 152), "isEqualToString:", objc_msgSend(v6, "captureRequestIdentifier"));
  v9 = v8;
  v10 = &OBJC_IVAR___BWVisionInferenceProvider__executesRequestsIndividually;
  if (v8 && (!*(_BYTE *)(a1 + 312) || (objc_msgSend(v6, "isBeginMomentCaptureSettings") & 1) != 0))
  {
    v24 = 0;
    goto LABEL_127;
  }
  v98 = v7;
  if (dword_1ECFE9AF0)
  {
    v122 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    v11 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    v10 = &OBJC_IVAR___BWVisionInferenceProvider__executesRequestsIndividually;
  }
  if (*(_BYTE *)(a1 + 312))
  {
    if ((v9 & 1) != 0)
      goto LABEL_15;
    v122 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    v12 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    v10 = &OBJC_IVAR___BWVisionInferenceProvider__executesRequestsIndividually;
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  -[BWPhotonicEngineNode _resetProcessingState](a1);
LABEL_15:
  if ((objc_msgSend(v7, "captureFlags", v88, v90) & 0x200) != 0)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 848));
    *(_BYTE *)(a1 + 852) = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 848));
  }
  v120 = 0;
  v119 = 0;
  -[BWPhotonicEngineNode _infoForCaptureType:isSupportedCaptureTypeOut:isFusionCaptureTypeOut:](a1, objc_msgSend(v7, "captureType"), &v120, (char *)&v119);
  if (!v120)
    goto LABEL_130;
  -[BWPhotonicEngineNode _releaseResourcesWithSettings:](a1, a2);
  if (objc_msgSend(*(id *)(a1 + 112), "deferredPhotoProcessorEnabled"))
  {
    FigDebugIsInternalBuild();
    v13 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), 23);
    mach_absolute_time();
    -[BWPhotonicEngineNode _prepareSharedExternalMemoryResourceForProcessorControllersIfNeeded](a1);
    if (dword_1ECFE9AF0)
    {
      v122 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      v14 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      v15 = v122;
      if (os_log_type_enabled(v14, type))
        v16 = v15;
      else
        v16 = v15 & 0xFFFFFFFE;
      if (v16)
      {
        mach_absolute_time();
        v17 = FigHostTimeToNanoseconds();
        v128 = 136315650;
        v129 = "-[BWPhotonicEngineNode _setupProcessingStateWithSettings:]";
        v130 = 2114;
        v131 = v13;
        v132 = 2048;
        v133 = (double)(v17 / 1000) / 1000.0;
        LODWORD(v90) = 32;
        v88 = &v128;
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      v7 = v98;
      v10 = &OBJC_IVAR___BWVisionInferenceProvider__executesRequestsIndividually;
    }
  }
  v18 = BWDeviceSupportsDeferredPhotoProcessorPrewarming();
  if (objc_msgSend(*(id *)(a1 + 112), "deferredPhotoProcessorEnabled") && v18)
  {
    v19 = *(NSObject **)(a1 + 192);
    v20 = *(NSObject **)(a1 + 184);
    v118[0] = MEMORY[0x1E0C809B0];
    v118[1] = 3221225472;
    v118[2] = __58__BWPhotonicEngineNode__setupProcessingStateWithSettings___block_invoke;
    v118[3] = &unk_1E491E720;
    v118[4] = a1;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __ubn_dispatch_group_async_block_invoke_0;
    block[3] = &unk_1E491ECB8;
    block[4] = v118;
    dispatch_group_async(v19, v20, block);
  }
  if (!objc_msgSend(v6, "outputWidth", v88, v90) || !objc_msgSend(v6, "outputHeight"))
  {
LABEL_130:
    v24 = 4294954516;
    goto LABEL_127;
  }
  *(_QWORD *)(a1 + 144) = objc_msgSend(v7, "settingsID");

  *(_QWORD *)(a1 + 152) = (id)objc_msgSend(v6, "captureRequestIdentifier");
  *(_QWORD *)(a1 + 160) = a2;
  *(_BYTE *)(a1 + v10[213]) = 0;
  v21 = -[BWStillImageProcessingPlan initWithSettings:]([BWStillImageProcessingPlan alloc], "initWithSettings:", a2);
  v22 = v119;
  v23 = -[BWPhotonicEngineNode _setupProcessingStateForDeferredCaptureIfNeededWithSettings:](a1, a2);
  v24 = v23;
  if (!v22)
  {
    if (!(_DWORD)v23)
    {
      v36 = v93;
      if (objc_msgSend(v7, "captureType") == 7)
      {
        if (!*(_QWORD *)(a1 + 760))
          goto LABEL_117;
        v37 = -[BWPhotonicEngineNode _setupProcessingStateForClientBracketWithSettings:processingPlan:](a1, a2, v21);
        if (!(_DWORD)v37)
          goto LABEL_117;
        v24 = v37;
        v90 = v2;
        LODWORD(v88) = v37;
      }
      else if (objc_msgSend(v7, "captureType") == 2)
      {
        if (objc_msgSend(v6, "constantColorEnabled"))
          v82 = -[BWPhotonicEngineNode _setupProcessingStateForColorConstancyCaptureWithSettings:processingPlan:](a1, a2, v21);
        else
          v82 = -[BWPhotonicEngineNode _setupProcessingStateForFlashCaptureWithSettings:processingPlan:](a1, a2, v21);
        v24 = v82;
        if (!(_DWORD)v82)
          goto LABEL_117;
        v90 = v2;
        LODWORD(v88) = v82;
      }
      else
      {
        v83 = -[BWPhotonicEngineNode _setupProcessingStateForSingleImageCaptureWithSettings:processingPlan:](a1, a2, v21);
        if (!(_DWORD)v83)
          goto LABEL_117;
        v24 = v83;
        v90 = v2;
        LODWORD(v88) = v83;
      }
      goto LABEL_142;
    }
    v90 = v2;
    LODWORD(v88) = v23;
    goto LABEL_126;
  }
  if ((_DWORD)v23)
  {
    v90 = v2;
    LODWORD(v88) = v23;
LABEL_126:
    FigDebugAssert3();
LABEL_127:
    v36 = v93;
LABEL_128:
    objc_msgSend(v36, "drain", v88, v90);
    return v24;
  }
  v100 = v21;
  v25 = -[BWPhotonicEngineNode _nrfOutputSbufRouter]((id)a1);
  obj = (id)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v114 = 0u;
  v115 = 0u;
  v116 = 0u;
  v117 = 0u;
  v26 = (void *)objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "portTypes");
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v114, v127, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v115;
    do
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v115 != v29)
          objc_enumerationMutation(v26);
        v31 = *(void **)(*((_QWORD *)&v114 + 1) + 8 * i);
        if (-[BWPhotonicEngineNode _nrfProcessorInputNeededForSettings:portType:](a1, a2, (uint64_t)v31)
          && objc_msgSend(*(id *)(a1 + 168), "controllerForType:", 6))
        {
          v32 = -[BWNRFProcessorInput initWithSettings:portType:]([BWNRFProcessorInput alloc], "initWithSettings:portType:", a2, v31);
          v33 = &unk_1E4A02138;
          if (!objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "learnedNRStereoPhotoFrameFlag"))
            v33 = -[BWPhotonicEngineNode _bufferTypesForCaptureSettings:](a1, (void *)objc_msgSend(a2, "captureSettings"));
          -[BWStillImageProcessorControllerInput addOutputSampleBufferRouter:forBufferTypes:](v32, "addOutputSampleBufferRouter:forBufferTypes:", v25, v33);
          -[BWStillImageProcessingPlan addInput:sequenceNumber:portType:bufferTypes:](v100, "addInput:sequenceNumber:portType:bufferTypes:", v32, 0, v31, v33);
          objc_msgSend(*(id *)(a1 + 352), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v32), v31);
          if (v32)
          {
            if (-[BWStillImageProcessorControllerInput isMaster](v32, "isMaster"))
              objc_msgSend(obj, "insertObject:atIndex:", v32, 0);
            else
              objc_msgSend(obj, "addObject:", v32);

          }
        }
        -[BWPhotonicEngineNode _setupDeferredProcessingWithSettings:portType:](a1, a2, v31);
      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v114, v127, 16);
    }
    while (v28);
  }
  v34 = (void *)objc_msgSend(*(id *)(a1 + 168), "controllerForType:", 6);
  if (objc_msgSend(v98, "deliverOriginalImage"))
    v35 = (objc_msgSend(v98, "captureFlags") & 0x2000) == 0;
  else
    v35 = 0;
  v38 = v100;
  v92 = objc_msgSend(v98, "deliverOriginalImage");
  if (objc_msgSend(v98, "captureType") == 12)
    v97 = objc_msgSend(v98, "deliverDeferredPhotoProxyImage") ^ 1;
  else
    v97 = 0;
  v96 = -[BWPhotonicEngineNode _isSemanticRenderingCapture:](a1, a2);
  v95 = -[BWPhotonicEngineNode _inferencesRequiredByProcessorControllersForSettings:](a1, a2);
  if (v35)
  {
    v112 = 0u;
    v113 = 0u;
    v110 = 0u;
    v111 = 0u;
    v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v110, v126, 16);
    if (v39)
    {
      v40 = v39;
      v41 = *(_QWORD *)v111;
      while (2)
      {
        for (j = 0; j != v40; ++j)
        {
          if (*(_QWORD *)v111 != v41)
            objc_enumerationMutation(obj);
          v43 = *(void **)(*((_QWORD *)&v110 + 1) + 8 * j);
          v44 = objc_msgSend(v34, "enqueueInputForProcessing:delegate:processErrorRecoveryFrame:processOriginalImage:processToneMapping:processInferenceInputImage:clientBracketSequenceNumber:processSemanticRendering:provideInferenceInputImageForProcessing:processSmartStyleRenderingInput:inferencesAvailable:", v43, a1, 0, 1, 0, 0, 0);
          if ((_DWORD)v44)
          {
            v24 = v44;
            v90 = v2;
            LODWORD(v88) = v44;
            goto LABEL_126;
          }
          objc_msgSend(v43, "setRemainingProcessingCount:", objc_msgSend(v43, "remainingProcessingCount") + 1);
        }
        v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v110, v126, 16);
        if (v40)
          continue;
        break;
      }
    }
  }
  v91 = v35;
  v99 = v34;
  v108 = 0u;
  v109 = 0u;
  v106 = 0u;
  v107 = 0u;
  v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v106, v125, 16);
  if (v45)
  {
    v46 = v45;
    v47 = *(_QWORD *)v107;
    v48 = &OBJC_IVAR___BWVisionInferenceProvider__executesRequestsIndividually;
    v94 = a2;
    while (2)
    {
      for (k = 0; k != v46; ++k)
      {
        if (*(_QWORD *)v107 != v47)
          objc_enumerationMutation(obj);
        v50 = *(void **)(*((_QWORD *)&v106 + 1) + 8 * k);
        v51 = (void *)objc_msgSend(v50, "portType");
        if (-[BWPhotonicEngineNode _processingNeededForSettings:portType:](a1, (void *)objc_msgSend(v50, "stillImageSettings"), (uint64_t)v51))
        {
          v52 = -[BWPhotonicEngineNode _setupSoftISPProcessingStateIfNeededWithSettings:portType:](a1, a2, v51);
          if ((_DWORD)v52)
          {
            v24 = v52;
            v90 = v2;
            LODWORD(v88) = v52;
            goto LABEL_126;
          }
          v53 = -[BWPhotonicEngineNode _isInferenceInputImageRequiredForSettings:portType:](a1, a2, (uint64_t)v51);
          v54 = v53;
          if (v53)
          {
            v55 = objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "learnedNRStereoPhotoFrameFlag");
            v56 = v46;
            v57 = v47;
            v58 = v48;
            if (v55)
              v59 = 39;
            else
              v59 = 15;
            v60 = -[BWPhotonicEngineNode _ubInferenceInputRouter]((id)a1);
            v124 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v59);
            v61 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v124, 1);
            v62 = v60;
            v38 = v100;
            objc_msgSend(v50, "addOutputSampleBufferRouter:forBufferTypes:", v62, v61);
            v63 = v59;
            v48 = v58;
            v47 = v57;
            v46 = v56;
            a2 = v94;
            -[BWStillImageProcessingPlan addInput:sequenceNumber:portType:bufferType:](v100, "addInput:sequenceNumber:portType:bufferType:", v50, 0, v51, v63);
          }
          if (*(_QWORD *)(a1 + v48[198]))
            v64 = BWIsSmartStyleCapture(a2);
          else
            v64 = 0;
          HIBYTE(v89) = v95;
          BYTE6(v89) = v64;
          BYTE5(v89) = v54;
          BYTE4(v89) = v96;
          LODWORD(v89) = 0;
          v65 = objc_msgSend(v99, "enqueueInputForProcessing:delegate:processErrorRecoveryFrame:processOriginalImage:processToneMapping:processInferenceInputImage:clientBracketSequenceNumber:processSemanticRendering:provideInferenceInputImageForProcessing:processSmartStyleRenderingInput:inferencesAvailable:", v50, a1, 0, 0, 0, 0, v89);
          if ((_DWORD)v65)
          {
            v24 = v65;
            v90 = v2;
            LODWORD(v88) = v65;
            goto LABEL_126;
          }
          if ((v97 & 1) == 0)
          {
            v66 = -[BWPhotonicEngineNode _setupProcessingStateForIntelligentDistortionCorrectionIfNeededWithSettings:sequenceNumber:portType:processingPlan:](a1, a2, 0, (uint64_t)v51, v38);
            if ((_DWORD)v66)
            {
              v24 = v66;
              v90 = v2;
              LODWORD(v88) = v66;
              goto LABEL_126;
            }
            v67 = -[BWPhotonicEngineNode _setupProcessingStateForScalerIfNeededWithSettings:sequenceNumber:portType:processingPlan:](a1, a2, 0, v51, v38);
            if ((_DWORD)v67)
            {
              v24 = v67;
              v90 = v2;
              LODWORD(v88) = v67;
              goto LABEL_126;
            }
            v68 = -[BWPhotonicEngineNode _setupProcessingStateForDeepZoomWithSettings:sequenceNumber:portType:processingPlan:]((id *)a1, a2, 0, (uint64_t)v51, v38);
            if ((_DWORD)v68)
            {
              v24 = v68;
              v90 = v2;
              LODWORD(v88) = v68;
              goto LABEL_126;
            }
            v69 = -[BWPhotonicEngineNode _setupProcessingStateForSmartStyleWithSettings:sequenceNumber:portType:processingPlan:](a1, a2, 0, (uint64_t)v51, v38);
            if ((_DWORD)v69)
            {
              v24 = v69;
              v90 = v2;
              LODWORD(v88) = v69;
              goto LABEL_126;
            }
          }
        }
        objc_msgSend(v50, "setRemainingProcessingCount:", objc_msgSend(v50, "remainingProcessingCount") + 1);
      }
      v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v106, v125, 16);
      if (v46)
        continue;
      break;
    }
  }
  v70 = -[BWPhotonicEngineNode _setupProcessingStateForDisparityIfNeededWithSettings:sequenceNumber:processingPlan:](a1, a2, 0, v38);
  if ((_DWORD)v70)
  {
    v24 = v70;
    v90 = v2;
    LODWORD(v88) = v70;
    goto LABEL_126;
  }
  if (((v92 ^ 1 | v91) & 1) == 0)
  {
    v104 = 0u;
    v105 = 0u;
    v102 = 0u;
    v103 = 0u;
    v71 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v102, v123, 16);
    if (v71)
    {
      v72 = v71;
      v73 = *(_QWORD *)v103;
      while (2)
      {
        for (m = 0; m != v72; ++m)
        {
          if (*(_QWORD *)v103 != v73)
            objc_enumerationMutation(obj);
          v75 = *(void **)(*((_QWORD *)&v102 + 1) + 8 * m);
          v76 = objc_msgSend(v99, "enqueueInputForProcessing:delegate:processErrorRecoveryFrame:processOriginalImage:processToneMapping:processInferenceInputImage:clientBracketSequenceNumber:processSemanticRendering:provideInferenceInputImageForProcessing:processSmartStyleRenderingInput:inferencesAvailable:", v75, a1, 0, 1, 0, 0, 0);
          if ((_DWORD)v76)
          {
            v24 = v76;
            v90 = v2;
            LODWORD(v88) = v76;
            goto LABEL_126;
          }
          objc_msgSend(v75, "setRemainingProcessingCount:", objc_msgSend(v75, "remainingProcessingCount") + 1);
        }
        v72 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v102, v123, 16);
        if (v72)
          continue;
        break;
      }
    }
  }
  v36 = v93;
  if (v97)
  {
    if (!objc_msgSend(*(id *)(a1 + 264), "count"))
    {
      v77 = -[BWPhotonicEngineNode _setupSoftISPProcessingStateIfNeededWithSettings:portType:](a1, a2, (void *)objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "masterPortType"));
      if ((_DWORD)v77)
      {
        v24 = v77;
        v90 = v2;
        LODWORD(v88) = v77;
        goto LABEL_142;
      }
    }
    v78 = -[BWPhotonicEngineNode _setupProcessingStateForDeepFusionWithSettings:processingPlan:](a1, a2, v38);
    if ((_DWORD)v78)
    {
      v24 = v78;
      v90 = v2;
      LODWORD(v88) = v78;
      goto LABEL_142;
    }
  }
  v79 = -[BWPhotonicEngineNode _setupProcessingStateForPointCloudDepthIfNeededWithSettings:processingPlan:](a1, a2, v38);
  if ((_DWORD)v79)
  {
    v24 = v79;
    v90 = v2;
    LODWORD(v88) = v79;
LABEL_142:
    FigDebugAssert3();
    goto LABEL_128;
  }
  v80 = -[BWPhotonicEngineNode _setupProcessingStateForJasperDisparityIfNeededWithSettings:processingPlan:](a1, a2, v38);
  if ((_DWORD)v80)
  {
    v24 = v80;
    v90 = v2;
    LODWORD(v88) = v80;
    goto LABEL_142;
  }
  v81 = -[BWPhotonicEngineNode _softISPFusionCaptureOutputSbufRouter]((id)a1);
  -[BWPhotonicEngineNode _setupSoftISPOutputRoutingIfNeededWithOutputSampleBufferRouter:processingPlan:](a1, (uint64_t)v81, v38);
LABEL_117:
  objc_msgSend(v36, "drain");
  -[BWPhotonicEngineNode _drainStashedBeginMomentBuffersIfNeededWithSettings:](a1, a2);
  return 0;
}

uint64_t __50__BWPhotonicEngineNode__handleSampleBuffer_input___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setContainer:photoIdentifier:", *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "photoIdentifier"));
}

- (uint64_t)_handleSensorRawSampleBuffer:(uint64_t)a1
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  uint64_t v6;
  void *v7;
  unsigned __int16 v8;
  uint64_t v10;
  uint64_t v11;
  BWSharpnessScoreReferenceFrameSelector *v12;
  opaqueCMSampleBuffer *v13;
  CFTypeRef v14;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v16;
  uint64_t v17;
  CFTypeRef cf[23];

  v3 = a1;
  cf[22] = *(CFTypeRef *)MEMORY[0x1E0C80C00];
  if (!a1)
    return v3;
  if (!_FigIsCurrentDispatchQueue())
  {
    v17 = v2;
    LODWORD(v16) = 0;
    FigDebugAssert3();
  }
  v5 = (void *)CMGetAttachment(a2, CFSTR("StillSettings"), 0);
  v6 = objc_msgSend((id)CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E0D05CB0], 0), "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00]);
  v7 = (void *)objc_msgSend((id)objc_msgSend(v5, "captureSettings"), "captureStreamSettingsForPortType:", v6);
  v8 = (unsigned __int16)BWStillImageCaptureFrameFlagsForSampleBuffer(a2);
  if (objc_msgSend(v7, "sensorRawCapturedForFinalImageProcessing"))
  {
    if (-[BWPhotonicEngineNode _processingNeededForSettings:portType:](v3, v5, v6))
    {
      if ((v8 & 0x100) == 0)
        return -[BWPhotonicEngineNode _processSensorRawSampleBuffer:](v3, a2);
      v10 = objc_msgSend(v7, "expectedReferenceFrameCandidateCount");
      cf[0] = 0;
      if ((int)v10 < 2)
      {
        if (a2)
          v14 = CFRetain(a2);
        else
          v14 = 0;
        v13 = 0;
        cf[0] = v14;
      }
      else
      {
        v11 = v10;
        v12 = *(BWSharpnessScoreReferenceFrameSelector **)(v3 + 296);
        if (!v12)
        {
          v12 = -[BWSharpnessScoreReferenceFrameSelector initWithCommandQueue:externalMemoryResource:candidateCount:]([BWSharpnessScoreReferenceFrameSelector alloc], "initWithCommandQueue:externalMemoryResource:candidateCount:", objc_msgSend(*(id *)(v3 + 112), "metalCommandQueue"), *(_QWORD *)(v3 + 224), v11);
          *(_QWORD *)(v3 + 296) = v12;
        }
        v13 = -[BWSharpnessScoreReferenceFrameSelector addReferenceFrameCandidate:referenceFrameOut:](v12, "addReferenceFrameCandidate:referenceFrameOut:", a2, cf, v16, v17);
        if (!cf[0])
        {
LABEL_26:
          if (v13)
          {
            v3 = -[BWPhotonicEngineNode _processSensorRawSampleBuffer:](v3, v13);
            CFRelease(v13);
            if ((_DWORD)v3)
              return v3;
          }
          return 0;
        }

        *(_QWORD *)(v3 + 296) = 0;
        v14 = cf[0];
      }
      if (v14)
      {
        BWStillImageAppendCaptureFrameFlagsToSampleBuffer(v14, 48);
        if (dword_1ECFE9AF0)
        {
          os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        -[BWPhotonicEngineNode _processSensorRawSampleBuffer:](v3, (void *)cf[0]);
        if (cf[0])
          CFRelease(cf[0]);
      }
      goto LABEL_26;
    }
    -[BWPhotonicEngineNode _handleSampleBufferForDisparityIfNeeded:](v3, a2);
    -[BWPhotonicEngineNode _deferredCaptureHandleSensorRawSampleBuffer:](v3, a2);
  }
  else if (objc_msgSend((id)objc_msgSend(v5, "captureSettings"), "captureType") == 7)
  {
    -[BWPhotonicEngineNode _handleClientBracketFrameEmissionForSampleBuffer:](v3, a2);
  }
  else
  {
    -[BWPhotonicEngineNode _handleSampleBufferForDisparityIfNeeded:](v3, a2);
  }
  return 0;
}

- (void)_inferenceProcessRedEyeReductionSampleBuffer:(void *)a3 settings:(void *)a4 portType:
{
  uint64_t v4;
  CVImageBufferRef ImageBuffer;
  __CVBuffer *v10;
  void *v11;
  __CVBuffer *v12;
  int CopyWithNewPixelBuffer;
  uint64_t v14;
  uint64_t v15;
  CFTypeRef v16;
  NSObject *v17;
  NSObject *v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[7];
  CFTypeRef cf;
  _QWORD block[5];

  if (!a1)
    return;
  if (!_FigIsCurrentDispatchQueue())
  {
    v21 = v4;
    LODWORD(v20) = 0;
    FigDebugAssert3();
  }
  cf = 0;
  dispatch_group_wait(*(dispatch_group_t *)(a1 + 496), 0xFFFFFFFFFFFFFFFFLL);
  ImageBuffer = CMSampleBufferGetImageBuffer(a2);
  if (!ImageBuffer)
  {
    v12 = 0;
LABEL_26:
    v19 = -12780;
    goto LABEL_19;
  }
  v10 = ImageBuffer;
  if (-[BWPhotonicEngineNode _resolvedQSubResolutionFlavorForCaptureSettings:portType:](a1, (void *)objc_msgSend(a3, "captureSettings"), a4) == 1)v11 = (void *)objc_msgSend(*(id *)(a1 + 512), "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1));
  else
    v11 = *(void **)(a1 + 504);
  v12 = (__CVBuffer *)objc_msgSend(v11, "newPixelBuffer", v20, v21);
  if (!v12)
    goto LABEL_26;
  CopyWithNewPixelBuffer = -[BWPhotonicEngineNode _scaleInferenceInputForRedEyeReductionFromPixelBuffer:outputPixelBuffer:](a1, v10, v12);
  if (!CopyWithNewPixelBuffer)
  {
    CopyWithNewPixelBuffer = BWCMSampleBufferCreateCopyWithNewPixelBuffer(a2, v12, (CFTypeRef *)(a1 + 560), (CMSampleBufferRef *)&cf);
    if (!CopyWithNewPixelBuffer)
    {
      CopyWithNewPixelBuffer = -[BWPhotonicEngineNode _setupProcessingStateForInferenceWithSettings:portType:inferenceInputBufferType:](a1, a3, (uint64_t)a4, 0xFuLL);
      if (!CopyWithNewPixelBuffer)
      {
        v14 = objc_msgSend(*(id *)(a1 + 480), "objectForKeyedSubscript:", a4);
        if (v14)
        {
          v15 = v14;
          if (a2)
            CFRetain(a2);
          if (cf)
          {
            CFRetain(cf);
            v16 = cf;
          }
          else
          {
            v16 = 0;
          }
          v17 = *(NSObject **)(a1 + 496);
          v18 = *(NSObject **)(a1 + 488);
          v22[0] = MEMORY[0x1E0C809B0];
          v22[1] = 3221225472;
          v22[2] = __87__BWPhotonicEngineNode__inferenceProcessRedEyeReductionSampleBuffer_settings_portType___block_invoke;
          v22[3] = &unk_1E4920768;
          v22[4] = v15;
          v22[5] = v16;
          v22[6] = a2;
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __ubn_dispatch_group_async_block_invoke_0;
          block[3] = &unk_1E491ECB8;
          block[4] = v22;
          dispatch_group_async(v17, v18, block);
          v19 = 0;
          goto LABEL_19;
        }
        goto LABEL_26;
      }
    }
  }
  v19 = CopyWithNewPixelBuffer;
LABEL_19:
  CVPixelBufferRelease(v12);
  if (cf)
    CFRelease(cf);
  if (v19)
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 632), "objectForKeyedSubscript:", a4), "addFrame:faceObservations:", a2, 0);
}

- (id)_ubRERRouter
{
  _QWORD v1[5];

  if (result)
  {
    v1[0] = MEMORY[0x1E0C809B0];
    v1[1] = 3221225472;
    v1[2] = __36__BWPhotonicEngineNode__ubRERRouter__block_invoke;
    v1[3] = &unk_1E4923398;
    v1[4] = result;
    return (id)objc_msgSend(v1, "copy");
  }
  return result;
}

- (void)_handleClientBracketFrameEmissionForSampleBuffer:(unint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  BWSoftISPProcessorControllerInput *v8;
  uint64_t v9;
  NSObject *v10;
  _QWORD v11[6];
  _QWORD v12[6];
  CMSampleBufferRef sampleBufferOut[5];

  if (a1)
  {
    if (target)
    {
      v4 = (void *)CMGetAttachment(target, CFSTR("StillSettings"), 0);
      v5 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
      v6 = (void *)objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00]);
      if (-[BWPhotonicEngineNode _referenceOrClientBracketFrameEmissionNeededForSettings:portType:](a1, v4, v6))
      {
        v7 = objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D06910]);
        if (!objc_msgSend((id)objc_msgSend(*(id *)(a1 + 792), "objectForKeyedSubscript:", v6), "objectForKeyedSubscript:", v7))
        {
          objc_msgSend((id)objc_msgSend(*(id *)(a1 + 792), "objectForKeyedSubscript:", v6), "setObject:forKeyedSubscript:", objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D06EB0]), v7);
          if (-[BWPhotonicEngineNode _generateDisparityForSettings:](a1, v4))
          {
            if (*(_QWORD *)(a1 + 248))
            {
              v8 = -[BWSoftISPProcessorControllerInput initWithSettings:portType:]([BWSoftISPProcessorControllerInput alloc], "initWithSettings:portType:", v4, v6);
              v12[0] = MEMORY[0x1E0C809B0];
              v12[1] = 3221225472;
              v12[2] = __73__BWPhotonicEngineNode__handleClientBracketFrameEmissionForSampleBuffer___block_invoke;
              v12[3] = &unk_1E4923460;
              v12[4] = a1;
              v12[5] = v7;
              -[BWStillImageProcessorControllerInput addOutputSampleBufferRouter:forBufferTypes:](v8, "addOutputSampleBufferRouter:forBufferTypes:", v12, &unk_1E4A02018);
              -[BWSoftISPProcessorControllerInput addFrame:processingMode:](v8, "addFrame:processingMode:", target, 3);
              if (!-[BWPhotonicEngineNode _enqueueSoftISPInput:](a1, v8))

            }
            else
            {
              v9 = objc_msgSend(*(id *)(a1 + 800), "objectForKeyedSubscript:", v7);
              CFRetain(target);
              v10 = *(NSObject **)(a1 + 784);
              v11[0] = MEMORY[0x1E0C809B0];
              v11[1] = 3221225472;
              v11[2] = __73__BWPhotonicEngineNode__handleClientBracketFrameEmissionForSampleBuffer___block_invoke_135;
              v11[3] = &unk_1E491F158;
              v11[4] = v9;
              v11[5] = target;
              sampleBufferOut[0] = (CMSampleBufferRef)MEMORY[0x1E0C809B0];
              sampleBufferOut[1] = (CMSampleBufferRef)3221225472;
              sampleBufferOut[2] = (CMSampleBufferRef)__ubn_dispatch_async_block_invoke_0;
              sampleBufferOut[3] = (CMSampleBufferRef)&unk_1E491ECB8;
              sampleBufferOut[4] = (CMSampleBufferRef)v11;
              dispatch_async(v10, sampleBufferOut);
            }
          }
          else
          {
            sampleBufferOut[0] = 0;
            if (CMSampleBufferCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CMSampleBufferRef)target, sampleBufferOut))
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("reference frame for '%@'"), v6);
              -[BWPhotonicEngineNode _emitError:stillImageSettings:metadata:description:](a1, 4294954516, (uint64_t)v4, (uint64_t)v5);
            }
            else
            {
              CMSetAttachment(sampleBufferOut[0], CFSTR("NonProcessedReferenceFrame"), MEMORY[0x1E0C9AAB0], 1u);
              -[BWPhotonicEngineNode _emitSampleBuffer:description:](a1, sampleBufferOut[0], (uint64_t)CFSTR("reference frame"));
              if (sampleBufferOut[0])
                CFRelease(sampleBufferOut[0]);
            }
          }
        }
      }
    }
  }
}

- (BOOL)_processingNeededForSettings:(uint64_t)a3 portType:
{
  char v4;
  uint64_t v5;

  if (result)
  {
    v4 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "masterPortType"), "isEqualToString:", a3);
    if ((objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureFlags") & 0x4000000000) == 0 || (v4 & 1) != 0)
    {
      if ((v4 & 1) != 0)
        return 1;
      v5 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "requestedSettings"), "bravoConstituentImageDeliveryDeviceTypes"), "count");
    }
    else
    {
      v5 = objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "learnedNRStereoPhotoFrameFlag");
    }
    return v5 != 0;
  }
  return result;
}

- (void)_processorControllerDidFinishProcessingInputForPortType:(uint64_t)a3 processorType:(void *)a4 captureRequestIdentifier:
{
  uint64_t v4;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  int v14;
  uint64_t v15;
  int v16;
  int v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;

  if (a1)
  {
    if (!_FigIsCurrentDispatchQueue())
    {
      v24 = v4;
      LODWORD(v23) = 0;
      FigDebugAssert3();
    }
    if (objc_msgSend(a4, "isEqualToString:", *(_QWORD *)(a1 + 152), v23, v24))
    {
      switch(a3)
      {
        case 2:
          v9 = 416;
          goto LABEL_32;
        case 3:
          v9 = 480;
          goto LABEL_32;
        case 4:
          objc_msgSend(*(id *)(a1 + 632), "setObject:forKeyedSubscript:", 0, a2);
          v9 = 600;
          goto LABEL_32;
        case 5:
          v9 = 944;
          goto LABEL_32;
        case 6:
          v10 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 352), "objectForKeyedSubscript:", a2), "firstObject");
          if (v10)
          {
            v11 = v10;
            v12 = objc_msgSend(v10, "remainingProcessingCount");
            if (v12 > 1)
            {
              objc_msgSend(v11, "setRemainingProcessingCount:", (v12 - 1));
            }
            else
            {
              objc_msgSend(v11, "setRemainingProcessingCount:", 0);
              objc_msgSend((id)objc_msgSend(*(id *)(a1 + 352), "objectForKeyedSubscript:", a2), "removeObject:", v11);
              if (!objc_msgSend((id)objc_msgSend(*(id *)(a1 + 352), "objectForKeyedSubscript:", a2), "count"))
                objc_msgSend(*(id *)(a1 + 352), "setObject:forKeyedSubscript:", 0, a2);
              if (dword_1ECFE9AF0)
              {
                os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
                fig_log_call_emit_and_clean_up_after_send_and_compose();
              }
            }
          }
          return;
        case 7:
          if (!objc_msgSend(*(id *)(a1 + 656), "objectForKeyedSubscript:", a2))
            return;
          v14 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 656), "objectForKeyedSubscript:", a2), "intValue");
          if (v14 > 1)
          {
            v20 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v14 - 1));
            v19 = *(void **)(a1 + 656);
          }
          else
          {
            objc_msgSend(*(id *)(a1 + 648), "setObject:forKeyedSubscript:", 0, a2);
            v9 = 656;
LABEL_32:
            v19 = *(void **)(a1 + v9);
            v20 = 0;
          }
          objc_msgSend(v19, "setObject:forKeyedSubscript:", v20, a2);
          break;
        case 8:
          --*(_DWORD *)(a1 + 776);

          v15 = 768;
          goto LABEL_27;
        case 9:
          v9 = 872;
          goto LABEL_32;
        case 10:
          v9 = 696;
          goto LABEL_32;
        case 11:
          v9 = 400;
          goto LABEL_32;
        case 12:
          v16 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 272), "objectForKeyedSubscript:", a2), "intValue");
          v17 = v16;
          if (v16 >= 2)
            v18 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v16 - 1));
          else
            v18 = 0;
          objc_msgSend(*(id *)(a1 + 272), "setObject:forKeyedSubscript:", v18, a2);
          v21 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 264), "objectForKeyedSubscript:", a2), "count");
          if (v17 <= 1 && v21 == 0)
            objc_msgSend(*(id *)(a1 + 264), "setObject:forKeyedSubscript:", 0, a2);
          if (!objc_msgSend(*(id *)(a1 + 264), "count"))
          {
            -[BWPhotonicEngineNode _flushSoftISPOutputBufferPools](a1);
            -[BWPhotonicEngineNode _flushUltraHighResolutionBufferPools](a1);
          }
          return;
        case 13:
          v9 = 888;
          goto LABEL_32;
        case 14:

          v15 = 904;
LABEL_27:
          *(_QWORD *)(a1 + v15) = 0;
          return;
        case 15:
          v9 = 592;
          goto LABEL_32;
        case 16:
          v9 = 816;
          goto LABEL_32;
        case 17:
          v9 = 616;
          goto LABEL_32;
        case 18:
          v9 = 744;
          goto LABEL_32;
        default:
          return;
      }
    }
  }
}

- (void)_emitOrEnqueueFusionReferenceFrameIfNeededForSampleBuffer:(unint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  BWSoftISPProcessorControllerInput *v7;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  _QWORD v9[5];
  CMSampleBufferRef sampleBufferOut[17];

  sampleBufferOut[16] = *(CMSampleBufferRef *)MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (target)
    {
      v4 = (void *)CMGetAttachment(target, CFSTR("StillSettings"), 0);
      v5 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
      v6 = (void *)objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00]);
      if (-[BWPhotonicEngineNode _referenceOrClientBracketFrameEmissionNeededForSettings:portType:](a1, v4, v6))
      {
        if (!objc_msgSend(*(id *)(a1 + 360), "objectForKeyedSubscript:", v6))
        {
          objc_msgSend(*(id *)(a1 + 360), "setObject:forKeyedSubscript:", objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D06EB0]), v6);
          if (-[BWPhotonicEngineNode _generateDisparityForSettings:](a1, v4))
          {
            if (objc_msgSend(*(id *)(a1 + 760), "stillImageDepthDataType") == 8)
            {
              v7 = -[BWSoftISPProcessorControllerInput initWithSettings:portType:]([BWSoftISPProcessorControllerInput alloc], "initWithSettings:portType:", v4, v6);
              v9[0] = MEMORY[0x1E0C809B0];
              v9[1] = 3221225472;
              v9[2] = __82__BWPhotonicEngineNode__emitOrEnqueueFusionReferenceFrameIfNeededForSampleBuffer___block_invoke;
              v9[3] = &unk_1E4923398;
              v9[4] = a1;
              -[BWStillImageProcessorControllerInput addOutputSampleBufferRouter:forBufferTypes:](v7, "addOutputSampleBufferRouter:forBufferTypes:", v9, &unk_1E4A02030);
              -[BWSoftISPProcessorControllerInput addFrame:processingMode:](v7, "addFrame:processingMode:", target, 3);
              if (dword_1ECFE9AF0)
              {
                os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
                fig_log_call_emit_and_clean_up_after_send_and_compose();
              }
              if (!-[BWPhotonicEngineNode _enqueueSoftISPInput:](a1, v7))

            }
          }
          else
          {
            sampleBufferOut[0] = 0;
            if (CMSampleBufferCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CMSampleBufferRef)target, sampleBufferOut))
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("reference frame for '%@'"), v6);
              -[BWPhotonicEngineNode _emitError:stillImageSettings:metadata:description:](a1, 4294954516, (uint64_t)v4, (uint64_t)v5);
            }
            else
            {
              CMSetAttachment(sampleBufferOut[0], CFSTR("NonProcessedReferenceFrame"), MEMORY[0x1E0C9AAB0], 1u);
              -[BWPhotonicEngineNode _emitSampleBuffer:description:](a1, sampleBufferOut[0], (uint64_t)CFSTR("reference frame"));
              if (sampleBufferOut[0])
                CFRelease(sampleBufferOut[0]);
            }
          }
        }
      }
    }
  }
}

- (uint64_t)_singleImageProcessSampleBuffer:(void *)a3 settings:(void *)a4 portType:
{
  uint64_t v4;
  BWStillImageProcessingPlan *v9;
  BWNRFProcessorInput *v10;
  int v11;
  unsigned __int8 v12;
  uint64_t v13;
  unint64_t v14;
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
  unint64_t v27;
  unint64_t v28;

  if (!a1)
    return 0;
  if (!_FigIsCurrentDispatchQueue())
  {
    v22 = v4;
    LODWORD(v20) = 0;
    FigDebugAssert3();
  }
  v9 = -[BWStillImageProcessingPlan initWithSettings:]([BWStillImageProcessingPlan alloc], "initWithSettings:", a3);
  v10 = -[BWNRFProcessorInput initWithSettings:portType:]([BWNRFProcessorInput alloc], "initWithSettings:portType:", a3, a4);
  v11 = -[BWPhotonicEngineNode _isInferenceInputImageRequiredForSettings:portType:](a1, a3, (uint64_t)a4);
  v12 = v11;
  v13 = MEMORY[0x1E0C809B0];
  if (v11)
  {
    v23 = MEMORY[0x1E0C809B0];
    v24 = 3221225472;
    v25 = __47__BWPhotonicEngineNode__ubInferenceInputRouter__block_invoke;
    v26 = &unk_1E4923398;
    v27 = a1;
    -[BWStillImageProcessorControllerInput addOutputSampleBufferRouter:forBufferTypes:](v10, "addOutputSampleBufferRouter:forBufferTypes:", (id)objc_msgSend(&v23, "copy"), &unk_1E4A02078);
    -[BWStillImageProcessingPlan addInput:sequenceNumber:portType:bufferType:](v9, "addInput:sequenceNumber:portType:bufferType:", v10, 0, a4, 15);
  }
  v14 = *(_QWORD *)(a1 + 176);
  v23 = v13;
  v24 = 3221225472;
  v25 = __65__BWPhotonicEngineNode__standardNROutputRouterWithExpectedQueue___block_invoke;
  v26 = &unk_1E4923460;
  v27 = v14;
  v28 = a1;
  -[BWStillImageProcessorControllerInput addOutputSampleBufferRouter:forBufferTypes:](v10, "addOutputSampleBufferRouter:forBufferTypes:", (id)objc_msgSend(&v23, "copy", v20, v22), &unk_1E4A02090);
  -[BWNRFProcessorInput addFrame:](v10, "addFrame:", a2);
  -[BWStillImageProcessingPlan addInput:sequenceNumber:portType:bufferType:](v9, "addInput:sequenceNumber:portType:bufferType:", v10, 0, a4, 1);
  v15 = -[BWPhotonicEngineNode _inferencesRequiredByProcessorControllersForSettings:](a1, a3);
  v16 = -[BWPhotonicEngineNode _setupProcessingStateForJasperDisparityIfNeededWithSettings:processingPlan:](a1, a3, v9);
  if (!(_DWORD)v16)
  {
    v16 = -[BWPhotonicEngineNode _setupProcessingStateForIntelligentDistortionCorrectionIfNeededWithSettings:sequenceNumber:portType:processingPlan:](a1, a3, 0, (uint64_t)a4, v9);
    if (!(_DWORD)v16)
    {
      v17 = -[BWPhotonicEngineNode _setupProcessingStateForScalerIfNeededWithSettings:sequenceNumber:portType:processingPlan:](a1, a3, 0, a4, v9);
      if ((_DWORD)v17)
      {
        v18 = v17;
        FigDebugAssert3();
        goto LABEL_11;
      }
      HIBYTE(v21) = v15;
      *(_WORD *)((char *)&v21 + 5) = v12;
      BYTE4(v21) = 0;
      LODWORD(v21) = 0;
      v16 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 168), "controllerForType:", 6), "enqueueInputForProcessing:delegate:processErrorRecoveryFrame:processOriginalImage:processToneMapping:processInferenceInputImage:clientBracketSequenceNumber:processSemanticRendering:provideInferenceInputImageForProcessing:processSmartStyleRenderingInput:inferencesAvailable:", v10, a1, 0, 0, 0, 0, v21);
    }
  }
  v18 = v16;
LABEL_11:

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
          v12 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 344), "rawColorCalibrationsByPortType"), "objectForKeyedSubscript:", v11);
          if (v12)
          {
            v13 = (void *)v12;
            v14 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 344), "rawLensShadingCorrectionCoefficientsByPortType"), "objectForKeyedSubscript:", v11);
            if (v14)
            {
              v15 = (void *)v14;
              v16 = BWPixelBufferDimensionsFromSampleBuffer(v6);
              PixelFormatType = CVPixelBufferGetPixelFormatType(v8);
              v18 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 344), "sensorConfigurationsByPortType"), "objectForKeyedSubscript:", v11);
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
    -[BWPhotonicEngineNode _removeNonPropagatedAttachedMediaFromSampleBuffer:](a1, a2);
    if (a2)
      CFRetain(a2);
    v6 = *(NSObject **)(a1 + 208);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __54__BWPhotonicEngineNode__emitSampleBuffer_description___block_invoke;
    v7[3] = &unk_1E491EC68;
    v7[5] = a1;
    v7[6] = a2;
    v7[4] = a3;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __ubn_dispatch_async_block_invoke_0;
    block[3] = &unk_1E491ECB8;
    block[4] = v7;
    dispatch_async(v6, block);
  }
}

- (uint64_t)_processSensorRawSampleBuffer:(uint64_t)result
{
  uint64_t v2;
  unint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  unsigned __int8 v9;
  int v10;
  void *v11;
  CFDictionaryRef v12;
  uint64_t v13;
  uint64_t v14;
  CMTime v15;
  CMTime v16;
  os_log_type_t type;
  int v18;
  CFTypeRef cf[18];

  cf[16] = *(CFTypeRef *)MEMORY[0x1E0C80C00];
  if (result)
  {
    v4 = result;
    if (!_FigIsCurrentDispatchQueue())
    {
      v14 = v2;
      LODWORD(v13) = 0;
      FigDebugAssert3();
    }
    v5 = (void *)CMGetAttachment(a2, CFSTR("StillSettings"), 0);
    v6 = (void *)CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
    v7 = objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00]);
    if (dword_1ECFE9AF0)
    {
      v18 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    -[BWPhotonicEngineNode _handleSampleBufferForDisparityIfNeeded:](v4, a2);
    v9 = BWStillImageCaptureFrameFlagsForSampleBuffer(a2);
    if ((v9 & 0x20) != 0)
    {
      cf[0] = 0;
      BWCMSampleBufferCreateCopyIncludingMetadata((CMSampleBufferRef)a2, (CMSampleBufferRef *)cf);
      objc_msgSend(*(id *)(v4 + 304), "setObject:forKeyedSubscript:", cf[0], v7);
      if (cf[0])
        CFRelease(cf[0]);
    }
    if ((-[BWPhotonicEngineNode _isDeferredRawDeepFusionCapture:](v4, v5) & 1) != 0
      || -[BWPhotonicEngineNode _isDeferredRawLearnedNRCapture:](v4, v5))
    {
      if ((v9 & 0x14) == 0
        || (result = -[BWPhotonicEngineNode _serviceNextSoftISPInputWithSampleBuffer:processingMode:transferOwnership:]((id *)v4, a2, 0, 0), !(_DWORD)result))
      {
        -[BWPhotonicEngineNode _deferredCaptureHandleSensorRawSampleBuffer:](v4, a2);
        return 0;
      }
    }
    else
    {
      if (*(_QWORD *)(v4 + 624)
        && (objc_msgSend((id)objc_msgSend(v5, "captureSettings"), "captureFlags") & 0x10000) != 0
        && (objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D06878]), "BOOLValue") & 1) == 0)
      {
        objc_msgSend(*(id *)(v4 + 600), "setObject:forKeyedSubscript:", a2, v7);
      }
      v10 = objc_msgSend((id)objc_msgSend(v5, "captureSettings", v13, v14), "captureType");
      if ((v9 & 0x10) != 0 && v10 == 12)
      {
        v11 = (void *)objc_msgSend(*(id *)(v4 + 416), "objectForKeyedSubscript:", v7);
        v12 = CMCopyDictionaryOfAttachments((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a2, 1u);
        objc_msgSend(v11, "setEvZeroReferenceFrameAttachments:", v12);
        CMSampleBufferGetPresentationTimeStamp(&v16, (CMSampleBufferRef)a2);
        v15 = v16;
        objc_msgSend(v11, "setEvZeroReferenceFramePTS:", &v15);

      }
      return -[BWPhotonicEngineNode _serviceNextSoftISPInputWithSampleBuffer:processingMode:transferOwnership:]((id *)v4, a2, 0, 0);
    }
  }
  return result;
}

- (void)_handleSampleBufferForDisparityIfNeeded:(unint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  CFTypeRef v8;
  void *v9;
  void *v10;
  char v11;
  CFTypeRef cf;

  if (!a1)
    return;
  v4 = (void *)CMGetAttachment(target, CFSTR("StillSettings"), 0);
  v5 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  v6 = (void *)objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00]);
  if (objc_msgSend(*(id *)(a1 + 760), "stillImageDepthDataType") != 8)
    return;
  if (!objc_msgSend(*(id *)(a1 + 280), "objectForKeyedSubscript:", v6))
    objc_msgSend(*(id *)(a1 + 280), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0C99E08], "dictionary"), v6);
  v7 = BWStillImageCaptureFrameFlagsForSampleBuffer(target);
  if ((v7 & 0x10) != 0)
  {
    cf = 0;
    BWCMSampleBufferCreateCopyIncludingMetadata((CMSampleBufferRef)target, (CMSampleBufferRef *)&cf);
    v8 = cf;
    v9 = (void *)objc_msgSend(*(id *)(a1 + 280), "objectForKeyedSubscript:", v6);
    v10 = &unk_1E49FC708;
LABEL_9:
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v10);
    if (cf)
      CFRelease(cf);
    goto LABEL_11;
  }
  if ((v7 & 4) != 0)
  {
    cf = 0;
    BWCMSampleBufferCreateCopyIncludingMetadata((CMSampleBufferRef)target, (CMSampleBufferRef *)&cf);
    v8 = cf;
    v9 = (void *)objc_msgSend(*(id *)(a1 + 280), "objectForKeyedSubscript:", v6);
    v10 = &unk_1E49FC720;
    goto LABEL_9;
  }
LABEL_11:
  if (!*(_BYTE *)(a1 + 312))
  {
    v11 = 0;
    -[BWPhotonicEngineNode _infoForCaptureType:isSupportedCaptureTypeOut:isFusionCaptureTypeOut:](a1, objc_msgSend((id)objc_msgSend(v4, "captureSettings"), "captureType"), 0, &v11);
    if (v11)
    {
      -[BWPhotonicEngineNode _attemptDisparityReferenceFrameResolutionForSettings:portType:](a1, v4, v6);
    }
    else if ((objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D06878]), "BOOLValue") & 1) == 0)
    {
      -[BWPhotonicEngineNode _emitOrEnqueueFusionReferenceFrameIfNeededForSampleBuffer:](a1, target);
    }
  }
}

- (uint64_t)_deferredCaptureHandleSensorRawSampleBuffer:(uint64_t)result
{
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;
  int v7;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  unsigned __int8 v9;
  unsigned __int8 v10;
  CFTypeRef v11;
  void *v12;
  void *v13;
  float v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  CFTypeRef cf[18];

  cf[16] = *(CFTypeRef *)MEMORY[0x1E0C80C00];
  if (!result || !target)
    return result;
  v3 = result;
  v4 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  v5 = (void *)objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00]);
  if (*(_BYTE *)(v3 + 312))
    return objc_msgSend((id)objc_msgSend(*(id *)(v3 + 328), "objectForKeyedSubscript:", v5), "addObject:", target);
  result = *(_QWORD *)(v3 + 904);
  if (!result)
    return result;
  if ((objc_msgSend((id)objc_msgSend((id)result, "portType"), "isEqualToString:", v5) & 1) == 0
    && (objc_msgSend((id)objc_msgSend(*(id *)(v3 + 904), "captureSettings"), "captureFlags") & 0x4000000000) != 0)
  {
    v9 = BWStillImageCaptureFrameFlagsForSampleBuffer(target);
    v10 = v9;
    if (*(_QWORD *)(v3 + 920))
    {
      if ((v9 & 0x10) == 0)
      {
LABEL_17:
        if ((v10 & 4) == 0)
          return -[BWPhotonicEngineNode _deferredCaptureAddSecondaryStereoPhotoCaptureSampleBufferIfReadyForSettings:](v3, (void *)objc_msgSend(*(id *)(v3 + 904), "stillImageSettings"));
        cf[0] = 0;
        BWCMSampleBufferCreateCopyIncludingMetadata((CMSampleBufferRef)target, (CMSampleBufferRef *)cf);
        v11 = cf[0];
        v12 = *(void **)(v3 + 920);
        v13 = &unk_1E49FC6A8;
LABEL_21:
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v13);
        if (cf[0])
          CFRelease(cf[0]);
        return -[BWPhotonicEngineNode _deferredCaptureAddSecondaryStereoPhotoCaptureSampleBufferIfReadyForSettings:](v3, (void *)objc_msgSend(*(id *)(v3 + 904), "stillImageSettings"));
      }
    }
    else
    {
      *(_QWORD *)(v3 + 920) = objc_alloc_init(MEMORY[0x1E0C99E08]);
      if ((v10 & 0x10) == 0)
        goto LABEL_17;
    }
    cf[0] = 0;
    BWCMSampleBufferCreateCopyIncludingMetadata((CMSampleBufferRef)target, (CMSampleBufferRef *)cf);
    v11 = cf[0];
    v12 = *(void **)(v3 + 920);
    v13 = &unk_1E49FC6D8;
    goto LABEL_21;
  }
  result = objc_msgSend(v5, "isEqualToString:", objc_msgSend(*(id *)(v3 + 904), "portType"));
  if (!(_DWORD)result)
    return result;
  v6 = objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D20]), "intValue");
  if ((objc_msgSend((id)objc_msgSend(*(id *)(v3 + 904), "captureStreamSettings"), "captureFlags") & 0x200000000) == 0
    || v6 != 1)
  {
    goto LABEL_36;
  }
  v7 = -[BWPhotonicEngineNodeConfiguration deepZoomVersion](*(_QWORD *)(v3 + 112));
  v23 = v7 > 0;
  if (v7 >= 1)
  {
    if (BWDeepFusionEnhancedResolutionCanProcessUsingQuadraFrame(target, (char *)&v23) && dword_1ECFE9AF0)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    if (v23)
    {
      objc_msgSend((id)objc_msgSend(*(id *)(v3 + 904), "pipelineParameters"), "setGenerateInferencesForSemanticProcessingIfNeeded:", 1);
      objc_msgSend((id)objc_msgSend(*(id *)(v3 + 904), "pipelineParameters"), "setDeepZoomVersion:", -[BWPhotonicEngineNodeConfiguration deepZoomVersion](*(_QWORD *)(v3 + 112)));
      objc_msgSend((id)objc_msgSend(*(id *)(v3 + 904), "pipelineParameters"), "setDeepZoomMode:", 3);
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(v3 + 904), "captureSettings"), "metadata"), "uiZoomFactor");
      if (v14 < 1.4118
        || !-[FigCaptureCameraParameters deepZoomTransferWithZoomedImageEnabledForPortType:sensorIDString:](+[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance"), "deepZoomTransferWithZoomedImageEnabledForPortType:sensorIDString:", v5, +[FigCaptureCameraParameters sensorIDStringFromMetadata:](FigCaptureCameraParameters, "sensorIDStringFromMetadata:", v4)))
      {
        goto LABEL_34;
      }
      v15 = (void *)objc_msgSend(*(id *)(v3 + 904), "pipelineParameters");
      v16 = 4;
LABEL_33:
      objc_msgSend(v15, "setDeepZoomMode:", v16, v21, v22);
LABEL_34:
      v19 = 0;
      goto LABEL_35;
    }
  }
  v17 = objc_msgSend((id)-[BWPhotonicEngineNodeConfiguration sensorConfigurationsByPortType](*(_QWORD *)(v3 + 112)), "objectForKeyedSubscript:", v5);
  v18 = objc_msgSend(*(id *)(v3 + 304), "objectForKeyedSubscript:", v5);
  if ((objc_msgSend((id)objc_msgSend(*(id *)(v3 + 904), "captureStreamSettings"), "captureFlags") & 0x4000000000) != 0)
  {
    objc_msgSend((id)objc_msgSend(*(id *)(v3 + 904), "pipelineParameters"), "setDeepZoomVersion:", -[BWPhotonicEngineNodeConfiguration deepZoomVersion](*(_QWORD *)(v3 + 112)));
    v15 = (void *)objc_msgSend(*(id *)(v3 + 904), "pipelineParameters");
    v16 = 5;
    goto LABEL_33;
  }
  if (!+[BWDeepZoomProcessorControllerConfiguration doDeepZoomStandardOrLiteForSampleBuffer:type:sensorConfiguration:intermediateZoomSrcRectOut:intermediateZoomDstRectOut:](BWDeepZoomProcessorControllerConfiguration, "doDeepZoomStandardOrLiteForSampleBuffer:type:sensorConfiguration:intermediateZoomSrcRectOut:intermediateZoomDstRectOut:", v18, 1, v17, 0, 0))
  {
    objc_msgSend((id)objc_msgSend(*(id *)(v3 + 904), "pipelineParameters"), "setDeepZoomVersion:", 0);
    v15 = (void *)objc_msgSend(*(id *)(v3 + 904), "pipelineParameters");
    v16 = 0;
    goto LABEL_33;
  }
  objc_msgSend((id)objc_msgSend(*(id *)(v3 + 904), "pipelineParameters"), "setDeepZoomVersion:", -[BWPhotonicEngineNodeConfiguration deepZoomVersion](*(_QWORD *)(v3 + 112)));
  objc_msgSend((id)objc_msgSend(*(id *)(v3 + 904), "pipelineParameters"), "setDeepZoomMode:", 0);
  v19 = 1;
  objc_msgSend((id)objc_msgSend(*(id *)(v3 + 904), "pipelineParameters"), "setGenerateInferencesForSemanticProcessingIfNeeded:", 1);
LABEL_35:
  result = objc_msgSend(*(id *)(v3 + 904), "canProcessEnhancedResolution:skipInferences:", v23, v19, v21, v22);
  if (v23)
  {
LABEL_36:
    result = -[BWPhotonicEngineNode _processingNeededForSettings:portType:](v3, (void *)objc_msgSend(*(id *)(v3 + 904), "stillImageSettings"), objc_msgSend((id)objc_msgSend(*(id *)(v3 + 904), "captureStreamSettings"), "portType"));
    if ((_DWORD)result)
      return objc_msgSend(*(id *)(v3 + 904), "addSensorRawSampleBuffer:", target);
    return result;
  }
  if (dword_1ECFE9AF0)
  {
    v20 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

- (uint64_t)_isDeferredRawDeepFusionCapture:(uint64_t)a1
{
  if (a1
    && objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureType") == 12
    && (objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureFlags") & 4) != 0)
  {
    return objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "deliverDeferredPhotoProxyImage");
  }
  else
  {
    return 0;
  }
}

- (uint64_t)_isDeferredRawLearnedNRCapture:(uint64_t)a1
{
  if (a1
    && (objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureFlags") & 0x80) != 0
    && (objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureFlags") & 4) != 0)
  {
    return objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "deliverDeferredPhotoProxyImage");
  }
  else
  {
    return 0;
  }
}

- (void)handleNodeError:(id)a3 forInput:(id)a4
{
  _BOOL4 resourcesReleased;
  uint64_t v8;
  NSObject *processorCoordinatorWorkerQueue;
  NSObject *emitQueue;
  _QWORD v11[6];
  _QWORD v12[7];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;
  uint64_t block;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  _QWORD *v21;

  if (!_FigIsNotCurrentDispatchQueue())
    FigDebugAssert3();
  if (self->_pointCloudInput != a4)
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x2020000000;
    resourcesReleased = self->_resourcesReleased;
    v16 = 1;
    v8 = MEMORY[0x1E0C809B0];
    if (resourcesReleased)
      goto LABEL_6;
    processorCoordinatorWorkerQueue = self->_processorCoordinatorWorkerQueue;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __49__BWPhotonicEngineNode_handleNodeError_forInput___block_invoke;
    v12[3] = &unk_1E491F368;
    v12[4] = a3;
    v12[5] = self;
    v12[6] = &v13;
    block = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = __ubn_dispatch_sync_block_invoke_0;
    v20 = &unk_1E491ECB8;
    v21 = v12;
    dispatch_sync(processorCoordinatorWorkerQueue, &block);
    if (*((_BYTE *)v14 + 24))
    {
LABEL_6:
      emitQueue = self->_emitQueue;
      v11[0] = v8;
      v11[1] = 3221225472;
      v11[2] = __49__BWPhotonicEngineNode_handleNodeError_forInput___block_invoke_2;
      v11[3] = &unk_1E491E748;
      v11[4] = self;
      v11[5] = a3;
      block = v8;
      v18 = 3221225472;
      v19 = __ubn_dispatch_async_block_invoke_0;
      v20 = &unk_1E491ECB8;
      v21 = v11;
      dispatch_async(emitQueue, &block);
    }
    _Block_object_dispose(&v13, 8);
  }
}

void __49__BWPhotonicEngineNode_handleNodeError_forInput___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "errorCode");
  if (v2 == -16806)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "stillImageSettings"), "requestedSettings"), "isBeginMomentCaptureSettings") ^ 1;
    v16 = *(_QWORD *)(a1 + 40);
    if (*(_BYTE *)(v16 + 312))
      -[BWPhotonicEngineNode _resetProcessingState](v16);
  }
  else if (v2 == -16800 || v2 == -16802)
  {
    v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 872), "count");
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v5 = *(void **)(*(_QWORD *)(a1 + 40) + 872);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v22 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 872), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i)), "setSkipProcessing:", 1);
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v7);
    }
    v10 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 888), "count");
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v11 = *(void **)(*(_QWORD *)(a1 + 40) + 888);
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v18;
      do
      {
        for (j = 0; j != v13; ++j)
        {
          if (*(_QWORD *)v18 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 888), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * j)), "setSkipProcessing:", 1);
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
      }
      while (v13);
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 168), "controllerForType:", 6), "finishProcessingCurrentInputNow") ^ 1;
    if (v4 && !*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 168), "controllerForType:", 9), "finishProcessingCurrentInputNow") ^ 1;
    if (v10 && !*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 168), "controllerForType:", 13), "finishProcessingCurrentInputNow") ^ 1;
  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    -[BWPhotonicEngineNode _resetProcessingState](*(_QWORD *)(a1 + 40));
}

uint64_t __49__BWPhotonicEngineNode_handleNodeError_forInput___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "emitNodeError:", *(_QWORD *)(a1 + 40));
}

- (void)handleStillImagePrewarmWithSettings:(id)a3 forInput:(id)a4
{
  uint64_t v6;
  NSObject *processorCoordinatorWorkerQueue;
  NSObject *stereoDisparityProcessorControllerQueue;
  NSObject *v9;
  _QWORD v10[6];
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;
  uint64_t block;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  _QWORD *v20;

  if (!self->_resourcesReleased)
  {
    v6 = MEMORY[0x1E0C809B0];
    if (self->_stereoDisparityProcessorControllerQueue)
    {
      v12 = 0;
      v13 = &v12;
      v14 = 0x2020000000;
      processorCoordinatorWorkerQueue = self->_processorCoordinatorWorkerQueue;
      v15 = 0;
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __69__BWPhotonicEngineNode_handleStillImagePrewarmWithSettings_forInput___block_invoke;
      v11[3] = &unk_1E491E9A8;
      v11[4] = self;
      v11[5] = &v12;
      block = MEMORY[0x1E0C809B0];
      v17 = 3221225472;
      v18 = __ubn_dispatch_sync_block_invoke_0;
      v19 = &unk_1E491ECB8;
      v20 = v11;
      dispatch_sync(processorCoordinatorWorkerQueue, &block);
      if (*((_BYTE *)v13 + 24))
      {
        stereoDisparityProcessorControllerQueue = self->_stereoDisparityProcessorControllerQueue;
        block = v6;
        v17 = 3221225472;
        v18 = __ubn_dispatch_sync_block_invoke_0;
        v19 = &unk_1E491ECB8;
        v20 = &__block_literal_global_75;
        dispatch_sync(stereoDisparityProcessorControllerQueue, &block);
      }
      _Block_object_dispose(&v12, 8);
    }
    v9 = self->_processorCoordinatorWorkerQueue;
    v10[0] = v6;
    v10[1] = 3221225472;
    v10[2] = __69__BWPhotonicEngineNode_handleStillImagePrewarmWithSettings_forInput___block_invoke_3;
    v10[3] = &unk_1E491E748;
    v10[4] = self;
    v10[5] = a3;
    block = v6;
    v17 = 3221225472;
    v18 = __ubn_dispatch_sync_block_invoke_0;
    v19 = &unk_1E491ECB8;
    v20 = v10;
    dispatch_sync(v9, &block);
  }
}

uint64_t __69__BWPhotonicEngineNode_handleStillImagePrewarmWithSettings_forInput___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "captureSettings"), "captureFlags");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (result & 0x800) != 0;
  return result;
}

__n128 __69__BWPhotonicEngineNode_handleStillImagePrewarmWithSettings_forInput___block_invoke_3(uint64_t a1)
{
  __n128 result;
  int v3;
  void *v4;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v6;
  char v7;
  int v8;
  unint64_t v9;
  void *v10;
  __int128 v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[4];
  __int128 v16;
  int v17;
  os_log_type_t type;
  int v19;
  _QWORD block[17];

  block[16] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "isEqualToString:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "requestedSettings"), "captureRequestIdentifier")) & 1) == 0)
  {
    v3 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "requestedSettings"), "isBeginMomentCaptureSettings");
    if ((v3 & 1) != 0)
    {
      v4 = *(void **)(*(_QWORD *)(a1 + 32) + 152);
      if (v4)
      {
        if ((objc_msgSend(v4, "isEqualToString:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "requestedSettings"), "captureRequestIdentifier")) & 1) == 0)
        {
          v19 = 0;
          type = OS_LOG_TYPE_DEFAULT;
          os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
          -[BWPhotonicEngineNode _resetProcessingState](*(_QWORD *)(a1 + 32));
        }
      }
    }
    v6 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v6 + 152) && (!*(_BYTE *)(v6 + 312) ? (v7 = 1) : (v7 = v3), (v7 & 1) != 0))
    {
      v8 = 0;
    }
    else
    {
      if ((objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "captureSettings", v13, v14), "captureFlags") & 0x200) != 0)
      {
        os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 848));
        *(_BYTE *)(*(_QWORD *)(a1 + 32) + 852) = 0;
        os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 848));
      }
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(void **)(a1 + 40);
      if (v3)
        v8 = -[BWPhotonicEngineNode _setupProcessingStateIfNeededWithBeginMomentSettings:](v9, v10);
      else
        v8 = -[BWPhotonicEngineNode _setupProcessingStateWithSettings:](v9, v10);
      if (v8 == -16808)
      {
        -[BWPhotonicEngineNode _resetProcessingState](*(_QWORD *)(a1 + 32));
        v8 = -16808;
      }
    }
    if ((v3 & 1) == 0)
    {
      v11 = *(_OWORD *)(a1 + 32);
      v12 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 208);
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __69__BWPhotonicEngineNode_handleStillImagePrewarmWithSettings_forInput___block_invoke_76;
      v15[3] = &unk_1E491EEF8;
      v17 = v8;
      v16 = v11;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __ubn_dispatch_async_block_invoke_0;
      block[3] = &unk_1E491ECB8;
      block[4] = v15;
      dispatch_async(v12, block);
    }
  }
  return result;
}

- (uint64_t)_setupProcessingStateIfNeededWithBeginMomentSettings:(uint64_t)a1
{
  NSObject *v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  uint64_t v15;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[5];
  os_log_type_t type;
  int v24;
  _BYTE v25[128];
  _QWORD block[19];

  block[16] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (!_FigIsCurrentDispatchQueue())
      FigDebugAssert3();
    if (!*(_QWORD *)(a1 + 168)
      || (objc_msgSend((id)objc_msgSend(a2, "requestedSettings"), "isBeginMomentCaptureSettings") & 1) == 0
      || (objc_msgSend((id)a1, "processingOnBeginMomentSupportedForCaptureSettings:", objc_msgSend(a2, "captureSettings")) & 1) == 0)
    {
      v24 = 0;
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      return 4294950488;
    }
    if ((objc_msgSend(*(id *)(a1 + 152), "isEqualToString:", objc_msgSend((id)objc_msgSend(a2, "requestedSettings"), "captureRequestIdentifier")) & 1) == 0)
    {
      if (dword_1ECFE9AF0)
      {
        v24 = 0;
        type = OS_LOG_TYPE_DEFAULT;
        v4 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      -[BWPhotonicEngineNode _resetProcessingState](a1);
      *(_QWORD *)(a1 + 144) = objc_msgSend(a2, "settingsID");
      *(_QWORD *)(a1 + 152) = (id)objc_msgSend((id)objc_msgSend(a2, "requestedSettings"), "captureRequestIdentifier");
      *(_BYTE *)(a1 + 312) = 1;
      -[BWPhotonicEngineNode _releaseResourcesWithSettings:](a1, a2);
      if (objc_msgSend(*(id *)(a1 + 112), "deferredPhotoProcessorEnabled"))
      {
        FigDebugIsInternalBuild();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), 23);
        mach_absolute_time();
        -[BWPhotonicEngineNode _prepareSharedExternalMemoryResourceForProcessorControllersIfNeeded](a1);
        if (dword_1ECFE9AF0)
        {
          v24 = 0;
          type = OS_LOG_TYPE_DEFAULT;
          v5 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
      }
      v6 = BWDeviceSupportsDeferredPhotoProcessorPrewarming();
      if (objc_msgSend(*(id *)(a1 + 112), "deferredPhotoProcessorEnabled") && v6)
      {
        v7 = *(NSObject **)(a1 + 192);
        v8 = *(NSObject **)(a1 + 184);
        v22[0] = MEMORY[0x1E0C809B0];
        v22[1] = 3221225472;
        v22[2] = __77__BWPhotonicEngineNode__setupProcessingStateIfNeededWithBeginMomentSettings___block_invoke;
        v22[3] = &unk_1E491E720;
        v22[4] = a1;
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __ubn_dispatch_group_async_block_invoke_0;
        block[3] = &unk_1E491ECB8;
        block[4] = v22;
        dispatch_group_async(v7, v8, block);
      }
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v9 = -[BWPhotonicEngineNode _processingOrderByPortTypeForSettings:]((id)a1, a2);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v25, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v19;
        while (2)
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v19 != v12)
              objc_enumerationMutation(v9);
            v14 = -[BWPhotonicEngineNode _setupSoftISPProcessingStateIfNeededWithSettings:portType:](a1, a2, *(void **)(*((_QWORD *)&v18 + 1) + 8 * i));
            if ((_DWORD)v14)
            {
              v15 = v14;
              FigDebugAssert3();
              return v15;
            }
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v25, 16);
          if (v11)
            continue;
          break;
        }
      }
    }
  }
  return 0;
}

void __69__BWPhotonicEngineNode_handleStillImagePrewarmWithSettings_forInput___block_invoke_76(uint64_t a1)
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
  return -[BWPhotonicEngineNode processorController:newOutputPixelBufferForProcessorInput:type:dimensions:attachedMediaKey:]((char *)self, a3, a4, a5, 0, 0);
}

- (__CVBuffer)processorController:(void *)a3 newOutputPixelBufferForProcessorInput:(uint64_t)a4 type:(uint64_t)a5 dimensions:(const __CFString *)a6 attachedMediaKey:
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  char *v13;
  __CVBuffer *v14;
  __CVBuffer *v15;
  NSObject *v17;

  if (!a1)
    return 0;
  mach_absolute_time();
  -[BWPhotonicEngineNode _resolvedQSubResolutionFlavorForCaptureSettings:portType:]((uint64_t)a1, (void *)objc_msgSend(a3, "captureSettings"), (void *)objc_msgSend(a3, "portType"));
  if (dword_1ECFE9AF0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v13 = -[BWPhotonicEngineNode _pixelBufferProviderForProcessorController:processorInput:type:dimensions:attachedMediaKey:](a1, a2, a3, a4, a5, a6);
  if (v13)
  {
    v14 = (__CVBuffer *)objc_msgSend(v13, "newPixelBuffer");
    v15 = v14;
    if (a4 == 41 && v14)
    {
      CVBufferSetAttachment(v14, (CFStringRef)*MEMORY[0x1E0CA8EE8], (CFTypeRef)*MEMORY[0x1E0CA8F10], kCVAttachmentMode_ShouldPropagate);
      CVBufferSetAttachment(v15, (CFStringRef)*MEMORY[0x1E0CA8D68], (CFTypeRef)*MEMORY[0x1E0CA8D98], kCVAttachmentMode_ShouldPropagate);
      CVBufferSetAttachment(v15, (CFStringRef)*MEMORY[0x1E0CA8E98], (CFTypeRef)*MEMORY[0x1E0CA8EB8], kCVAttachmentMode_ShouldPropagate);
    }
  }
  else
  {
    v15 = 0;
  }
  mach_absolute_time();
  FigHostTimeToNanoseconds();
  if (dword_1ECFE9AF0)
  {
    v17 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v15;
}

- (__CVBuffer)processorController:(id)a3 newOutputPixelBufferForProcessorInput:(id)a4 type:(unint64_t)a5 dimensions:(id)a6
{
  return -[BWPhotonicEngineNode processorController:newOutputPixelBufferForProcessorInput:type:dimensions:attachedMediaKey:]((char *)self, a3, a4, a5, *(_QWORD *)&a6, 0);
}

- (__CVBuffer)processorController:(id)a3 newOutputPixelBufferForProcessorInput:(id)a4 type:(unint64_t)a5 attachedMediaKey:(id)a6
{
  return -[BWPhotonicEngineNode processorController:newOutputPixelBufferForProcessorInput:type:dimensions:attachedMediaKey:]((char *)self, a3, a4, a5, 0, (const __CFString *)a6);
}

- (uint64_t)_resolvedQSubResolutionFlavorForCaptureSettings:(void *)a3 portType:
{
  void *v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  _BOOL4 v10;
  unint64_t v11;
  int v12;

  if (!a1)
    return 0;
  v6 = (void *)objc_msgSend(a2, "captureStreamSettingsForPortType:");
  v7 = objc_msgSend(v6, "qsubResolutionFlavor");
  v8 = (void *)objc_msgSend((id)objc_msgSend((id)-[BWPhotonicEngineNodeConfiguration dimensionsByQSubResolutionFlavorByPortType](*(_QWORD *)(a1 + 112)), "objectForKeyedSubscript:", a3), "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v7));
  v9 = FigCaptureDimensionsFromDictionaryRepresentation(v8);
  if ((int)v9 <= (int)-[BWPhotonicEngineNodeConfiguration rawSensorDimensions](*(_QWORD *)(a1 + 112)))
  {
    v11 = (unint64_t)-[BWPhotonicEngineNodeConfiguration rawSensorDimensions](*(_QWORD *)(a1 + 112)) >> 32;
    v10 = v7 == 1;
    if (SHIDWORD(v9) <= (int)v11)
    {
      v12 = 0;
      goto LABEL_7;
    }
  }
  else
  {
    v10 = v7 == 1;
  }
  v12 = 1;
LABEL_7:
  if (v10)
    LODWORD(v7) = v12;
  if ((objc_msgSend(a2, "captureFlags") & 4) != 0)
    v7 = v7;
  else
    v7 = 0;
  if (objc_msgSend(a2, "learnedNRStereoPhotoFrameFlag")
    && (objc_msgSend(a3, "isEqualToString:", objc_msgSend(a2, "masterPortType")) & 1) == 0)
  {
    if ((int)objc_msgSend(v6, "expectedUltraHighResFrameCaptureCount") <= 0)
      return v7;
    else
      return 2;
  }
  return v7;
}

- (char)_pixelBufferProviderForProcessorController:(void *)a3 processorInput:(uint64_t)a4 type:(uint64_t)a5 dimensions:(const __CFString *)a6 attachedMediaKey:
{
  char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  unsigned int v30;
  unsigned int v31;
  unsigned int v32;
  unsigned int v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  $2825F4736939C4A6D3AD43837233062D v48;
  uint64_t v49;
  void *v50;
  unint64_t v51;
  unint64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  unsigned int v59;
  unsigned int v60;

  if (!result)
    return result;
  v11 = result;
  v12 = -[BWPhotonicEngineNode _resolvedQSubResolutionFlavorForCaptureSettings:portType:]((uint64_t)result, (void *)objc_msgSend(a3, "captureSettings"), (void *)objc_msgSend(a3, "portType"));
  v13 = objc_msgSend(a2, "type");
  result = 0;
  switch(v13)
  {
    case 2:
      if (objc_msgSend(a3, "onlyApplyingSemanticStyle"))
      {
        v21 = (void *)*((_QWORD *)v11 + 57);
        if (!v21
          || !FigCaptureVideoDimensionsAreEqual(a5, objc_msgSend(v21, "width") | ((unint64_t)objc_msgSend(*((id *)v11 + 57), "height") << 32)))
        {
          goto LABEL_83;
        }
        v22 = 456;
LABEL_20:
        result = *(char **)&v11[v22];
        if (!result)
        {
LABEL_83:
          result = (char *)*((_QWORD *)v11 + 30);
          if (!result)
            goto LABEL_84;
        }
      }
      else
      {
        result = 0;
        if (a4 <= 29)
        {
          switch(a4)
          {
            case 13:
              if ((_DWORD)v12)
                goto LABEL_25;
              if ((objc_msgSend((id)objc_msgSend(a3, "captureSettings"), "captureFlags") & 0x200000000) == 0)
                goto LABEL_83;
              v22 = 440;
              goto LABEL_20;
            case 15:
              goto LABEL_70;
            case 19:
              if ((objc_msgSend((id)objc_msgSend(a3, "captureSettings"), "captureFlags") & 0x200000000) != 0)
              {
                result = (char *)*((_QWORD *)v11 + 56);
                if (result)
                  return result;
              }
              if ((_DWORD)v12 != 1)
                goto LABEL_121;
              v23 = (void *)objc_msgSend(*((id *)v11 + 36), "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1));
              v24 = &unk_1E49FC630;
              break;
            case 21:
              if (!(_DWORD)v12)
                goto LABEL_101;
              goto LABEL_102;
            default:
              return result;
          }
          return (char *)objc_msgSend(v23, "objectForKeyedSubscript:", v24);
        }
        switch(a4)
        {
          case 30:
            v16 = 704;
            return *(char **)&v11[v16];
          case 36:
LABEL_70:
            if ((_DWORD)v12 == 1)
            {
              v18 = *((_QWORD *)v11 + 64);
              v53 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
              goto LABEL_81;
            }
            v16 = 504;
            return *(char **)&v11[v16];
          case 41:
            goto LABEL_62;
        }
      }
      return result;
    case 3:
      v23 = (void *)*((_QWORD *)v11 + 65);
      v24 = (void *)a6;
      return (char *)objc_msgSend(v23, "objectForKeyedSubscript:", v24);
    case 6:
      result = 0;
      switch(a4)
      {
        case 1:
        case 2:
        case 3:
        case 4:
        case 5:
        case 6:
        case 14:
        case 33:
        case 35:
        case 38:
          if (!(_DWORD)v12)
            goto LABEL_83;
LABEL_25:
          v25 = (void *)objc_msgSend(*((id *)v11 + 2), "format");
          v18 = objc_msgSend(*((id *)v11 + 36), "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v12));
          v19 = (void *)MEMORY[0x1E0CB37E8];
          v20 = objc_msgSend(v25, "pixelFormat");
          goto LABEL_26;
        case 7:
        case 29:
          if ((_DWORD)v12 != 1)
            goto LABEL_83;
          v42 = (void *)objc_msgSend(*((id *)v11 + 2), "format");
          v43 = (void *)*((_QWORD *)v11 + 36);
          v44 = (void *)MEMORY[0x1E0CB37E8];
          v45 = 1;
          goto LABEL_78;
        case 8:
        case 10:
          v16 = 424;
          return *(char **)&v11[v16];
        case 9:
        case 11:
        case 12:
          v16 = 432;
          return *(char **)&v11[v16];
        case 15:
          goto LABEL_70;
        case 19:
          if ((_DWORD)v12 == 1
            || (_DWORD)v12 == 2
            && -[BWPhotonicEngineNodeConfiguration ultraHighResolutionProcessingEnabled](*((_QWORD *)v11 + 14)))
          {
            v55 = (void *)*((_QWORD *)v11 + 36);
            v35 = (void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v12);
            v34 = v55;
            goto LABEL_97;
          }
          if ((objc_msgSend((id)objc_msgSend(a3, "captureSettings"), "captureFlags") & 0x200000000) == 0)
            goto LABEL_121;
          result = (char *)*((_QWORD *)v11 + 56);
          if (!result)
            goto LABEL_121;
          return result;
        case 21:
          if ((((_DWORD)v12 == 2) & ~objc_msgSend((id)objc_msgSend(a3, "captureSettings"), "deliverDeferredPhotoProxyImage")) == 0&& (_DWORD)v12 != 1)
          {
            goto LABEL_101;
          }
LABEL_102:
          v46 = objc_msgSend(*((id *)v11 + 36), "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v12));
          v47 = (void *)MEMORY[0x1E0CB37E8];
          goto LABEL_103;
        case 31:
          if ((_DWORD)v12 == 1
            || (_DWORD)v12 == 2
            && -[BWPhotonicEngineNodeConfiguration ultraHighResolutionProcessingEnabled](*((_QWORD *)v11 + 14)))
          {
            v46 = objc_msgSend(*((id *)v11 + 36), "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v12));
            v57 = (void *)MEMORY[0x1E0CB37E8];
            v58 = 376;
            goto LABEL_112;
          }
          v16 = 376;
          return *(char **)&v11[v16];
        case 32:
          if ((_DWORD)v12 != 1
            && ((_DWORD)v12 != 2
             || !-[BWPhotonicEngineNodeConfiguration ultraHighResolutionProcessingEnabled](*((_QWORD *)v11 + 14))))
          {
            v16 = 384;
            return *(char **)&v11[v16];
          }
          v46 = objc_msgSend(*((id *)v11 + 36), "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v12));
          v57 = (void *)MEMORY[0x1E0CB37E8];
          v58 = 384;
LABEL_112:
          v56 = objc_msgSend(*(id *)&v11[v58], "pixelFormat");
          v47 = v57;
          break;
        case 39:
          v59 = objc_msgSend((id)objc_msgSend(*((id *)v11 + 1), "videoFormat"), "width");
          v60 = objc_msgSend((id)objc_msgSend(*((id *)v11 + 1), "videoFormat"), "height");
          v37 = BWStillImageProcessorTypeToShortString(39);
          v38 = objc_msgSend(*((id *)v11 + 2), "memoryPool");
          v39 = v59 | ((unint64_t)v60 << 32);
          v40 = 875704422;
          return (char *)+[BWOnDemandPixelBufferAllocator onDemandAllocatorWithDimensions:pixelFormat:name:memoryPool:](BWOnDemandPixelBufferAllocator, "onDemandAllocatorWithDimensions:pixelFormat:name:memoryPool:", v39, v40, v37, v38);
        case 41:
          goto LABEL_62;
        default:
          return result;
      }
      goto LABEL_113;
    case 7:
    case 18:
      result = 0;
      if (a4 <= 20)
      {
        switch(a4)
        {
          case 1:
            if ((_DWORD)v12 != 2
              || !-[BWPhotonicEngineNodeConfiguration ultraHighResolutionProcessingEnabled](*((_QWORD *)v11 + 14)))
            {
LABEL_84:
              v54 = (void *)objc_msgSend(*((id *)v11 + 2), "primaryMediaProperties");
              return (char *)objc_msgSend(v54, "livePixelBufferPool");
            }
            v42 = (void *)objc_msgSend(*((id *)v11 + 2), "format");
            v43 = (void *)*((_QWORD *)v11 + 36);
            v44 = (void *)MEMORY[0x1E0CB37E8];
            v45 = 2;
LABEL_78:
            v18 = objc_msgSend(v43, "objectForKeyedSubscript:", objc_msgSend(v44, "numberWithInt:", v45));
            v17 = (void *)MEMORY[0x1E0CB37E8];
            v41 = objc_msgSend(v42, "pixelFormat");
LABEL_79:
            v26 = v41;
            v27 = v17;
LABEL_80:
            v53 = objc_msgSend(v27, "numberWithUnsignedInt:", v26);
LABEL_81:
            v24 = (void *)v53;
            v23 = (void *)v18;
            return (char *)objc_msgSend(v23, "objectForKeyedSubscript:", v24);
          case 16:
            v14 = (void *)*((_QWORD *)v11 + 2);
            v15 = a6;
            break;
          case 19:
            if ((_DWORD)v12 == 2
              && -[BWPhotonicEngineNodeConfiguration ultraHighResolutionProcessingEnabled](*((_QWORD *)v11 + 14)))
            {
              v34 = (void *)*((_QWORD *)v11 + 36);
              v35 = &unk_1E49FC6A8;
LABEL_97:
              result = (char *)objc_msgSend((id)objc_msgSend(v34, "objectForKeyedSubscript:", v35), "objectForKeyedSubscript:", &unk_1E49FC630);
              if (result)
                return result;
            }
LABEL_121:
            v14 = (void *)*((_QWORD *)v11 + 2);
            v15 = CFSTR("GainMap");
            break;
          default:
            return result;
        }
LABEL_122:
        v54 = (void *)objc_msgSend(v14, "mediaPropertiesForAttachedMediaKey:", v15);
        return (char *)objc_msgSend(v54, "livePixelBufferPool");
      }
      if (a4 > 40)
      {
        if (a4 == 41)
        {
LABEL_62:
          v48 = +[BWSmartStyleRenderingProcessorController linearYUVIntermediateThumbnailDimensionsForStills](BWSmartStyleRenderingProcessorController, "linearYUVIntermediateThumbnailDimensionsForStills");
          v49 = objc_msgSend(*((id *)v11 + 101), "linearYUVPixelFormat");
          v37 = BWStillImageProcessorTypeToShortString(41);
          v38 = objc_msgSend(*((id *)v11 + 2), "memoryPool");
          v39 = (unint64_t)v48;
          v40 = v49;
          return (char *)+[BWOnDemandPixelBufferAllocator onDemandAllocatorWithDimensions:pixelFormat:name:memoryPool:](BWOnDemandPixelBufferAllocator, "onDemandAllocatorWithDimensions:pixelFormat:name:memoryPool:", v39, v40, v37, v38);
        }
        if (a4 != 2002)
          return result;
LABEL_44:
        v14 = (void *)*((_QWORD *)v11 + 2);
        v15 = CFSTR("ConstantColorConfidenceMap");
        goto LABEL_122;
      }
      if (a4 == 21)
      {
        if ((_DWORD)v12 == 2
          && -[BWPhotonicEngineNodeConfiguration ultraHighResolutionProcessingEnabled](*((_QWORD *)v11 + 14)))
        {
          v46 = objc_msgSend(*((id *)v11 + 36), "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2));
          v47 = (void *)MEMORY[0x1E0CB37E8];
LABEL_103:
          v56 = *((unsigned int *)v11 + 246);
LABEL_113:
          v24 = (void *)objc_msgSend(v47, "numberWithUnsignedInt:", v56);
          v23 = (void *)v46;
          return (char *)objc_msgSend(v23, "objectForKeyedSubscript:", v24);
        }
LABEL_101:
        v14 = (void *)*((_QWORD *)v11 + 2);
        v15 = CFSTR("DemosaicedRaw");
        goto LABEL_122;
      }
      if (a4 != 38)
        return result;
      v16 = 960;
      return *(char **)&v11[v16];
    case 8:
    case 9:
    case 13:
      if (a4 != 2001)
        return 0;
      v14 = (void *)*((_QWORD *)v11 + 2);
      v15 = CFSTR("Depth");
      goto LABEL_122;
    case 10:
      goto LABEL_84;
    case 12:
      if (a4 == 28)
      {
        v36 = objc_msgSend(a2, "auxiliaryPixelFormatForInput:", a3);
        v37 = BWStillImageProcessorTypeToShortString(28);
        v38 = objc_msgSend(*((id *)v11 + 2), "memoryPool");
        v39 = a5;
        v40 = v36;
        return (char *)+[BWOnDemandPixelBufferAllocator onDemandAllocatorWithDimensions:pixelFormat:name:memoryPool:](BWOnDemandPixelBufferAllocator, "onDemandAllocatorWithDimensions:pixelFormat:name:memoryPool:", v39, v40, v37, v38);
      }
      if (a4 != 1)
        return 0;
      v28 = objc_msgSend(a2, "outputPixelFormatForInput:", a3);
      if ((_DWORD)v12 == 1)
      {
        v29 = 1;
      }
      else
      {
        v50 = (void *)objc_msgSend((id)objc_msgSend((id)-[BWPhotonicEngineNodeConfiguration dimensionsByQSubResolutionFlavorByPortType](*((_QWORD *)v11 + 14)), "objectForKeyedSubscript:", objc_msgSend(a3, "portType")), "objectForKeyedSubscript:", &unk_1E49FC6A8);
        v51 = FigCaptureDimensionsFromDictionaryRepresentation(v50);
        v52 = FigCaptureDimensionsFromDictionaryRepresentation((void *)objc_msgSend((id)objc_msgSend(*((id *)v11 + 31), "outputDimensionsByQSubResolutionFlavor"), "objectForKeyedSubscript:", &unk_1E49FC6A8));
        if (!FigCaptureVideoDimensionsAreValid(v51) || !FigCaptureVideoDimensionsAreEqual(a5, v52))
        {
          v18 = *((_QWORD *)v11 + 32);
          v27 = (void *)MEMORY[0x1E0CB37E8];
          goto LABEL_73;
        }
        v29 = 2;
      }
      v18 = objc_msgSend(*((id *)v11 + 36), "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v29));
      v27 = (void *)MEMORY[0x1E0CB37E8];
LABEL_73:
      v26 = v28;
      goto LABEL_80;
    case 15:
      if (a4 != 1)
        return 0;
      v17 = (void *)MEMORY[0x1E0CB37E8];
      if ((_DWORD)v12 != 1)
      {
        v18 = *((_QWORD *)v11 + 32);
        v41 = objc_msgSend(a2, "outputPixelFormat");
        goto LABEL_79;
      }
      v18 = objc_msgSend(*((id *)v11 + 36), "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1));
      v19 = (void *)MEMORY[0x1E0CB37E8];
      v20 = objc_msgSend(a2, "outputPixelFormat");
LABEL_26:
      v26 = v20;
      v27 = v19;
      goto LABEL_80;
    case 16:
      if (a4 == 19)
        goto LABEL_121;
      if (a4 != 1)
        return 0;
      v30 = objc_msgSend(*((id *)v11 + 103), "width");
      v31 = objc_msgSend(*((id *)v11 + 103), "height");
      v32 = objc_msgSend(*((id *)v11 + 104), "width");
      v33 = objc_msgSend(*((id *)v11 + 104), "height");
      if (FigCaptureVideoDimensionsAreEqual(a5, v30 | ((unint64_t)v31 << 32)))
      {
        v16 = 824;
        return *(char **)&v11[v16];
      }
      if (!FigCaptureVideoDimensionsAreEqual(a5, v32 | ((unint64_t)v33 << 32)))
        goto LABEL_84;
      v16 = 832;
      return *(char **)&v11[v16];
    case 17:
      if (a4 == 2002)
        goto LABEL_44;
      if (a4 != 1)
        return 0;
      goto LABEL_84;
    default:
      return result;
  }
}

- ($2825F4736939C4A6D3AD43837233062D)processorController:(id)a3 outputPixelBufferDimensionsForProcessorInput:(id)a4 type:(unint64_t)a5 attachedMediaKey:(id)a6
{
  char *v6;
  unsigned int v7;

  v6 = -[BWPhotonicEngineNode _pixelBufferProviderForProcessorController:processorInput:type:dimensions:attachedMediaKey:]((char *)self, a3, a4, a5, 0, (const __CFString *)a6);
  v7 = objc_msgSend(v6, "width");
  return ($2825F4736939C4A6D3AD43837233062D)(v7 | ((unint64_t)objc_msgSend(v6, "height") << 32));
}

- (void)_attemptPiecemealEncodingForGainMapSbuf:(uint64_t)a3 primaryImageMetadata:(uint64_t)a4 processingFlags:(void *)a5 portType:
{
  double FinalCropRect;
  double v11;
  double v12;
  BOOL v13;
  double v14;
  BOOL v15;
  void *v16;

  if (a1
    && a2
    && a3
    && objc_msgSend(a5, "isEqualToString:", objc_msgSend((id)objc_msgSend(a1[20], "captureSettings"), "masterPortType"))&& a1[125]&& (int)objc_msgSend((id)objc_msgSend(a1[82], "objectForKeyedSubscript:", a5), "intValue") <= 0)
  {
    CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
    FinalCropRect = FigCaptureMetadataUtilitiesGetFinalCropRect();
    v13 = v12 > 0.0;
    if (v14 < 1.0)
      v13 = 1;
    v15 = v11 >= 1.0 && FinalCropRect <= 0.0;
    if (v15 || !v13)
    {
      v16 = (void *)objc_msgSend(a1[125], "inputForStillImageSettings:portType:portraitAdjustedImage:optionalSampleBuffer:forEarlyEncoding:", a1[20], a5, 0, 0, 1, FinalCropRect);
      if (v16)
        objc_msgSend(v16, "addAuxSbuf:attachedMediakey:primaryImageMetadata:processingFlags:", a2, 0x1E4936818, a3, a4);
    }
  }
}

- (id)_attemptPiecemealEncodingOfAuxImagesForSmartStylesCaptureWithSampleBuffer:(void *)a3 portType:
{
  void *v4;
  void *v5;
  id *v6;
  uint64_t v7;
  id *v8;
  uint64_t v9;
  const void *v10;
  CFTypeRef v11;
  NSObject *v12;
  double v13;
  double v14;
  double v15;
  const void *v16;
  id *v18;
  unsigned int v19;
  void *v20;
  id *v21;
  id *v22;
  const __CFString *key;
  _QWORD v24[11];
  _QWORD v25[6];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  void (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD block[5];
  _BYTE v45[128];
  _QWORD v46[5];

  v46[2] = *MEMORY[0x1E0C80C00];
  v18 = result;
  if (result)
  {
    if (a2)
    {
      result = (id *)objc_msgSend(a3, "isEqualToString:", objc_msgSend((id)objc_msgSend(result[20], "captureSettings"), "masterPortType"));
      if ((_DWORD)result)
      {
        if (v18[125])
        {
          key = (const __CFString *)*MEMORY[0x1E0D05CB0];
          result = (id *)CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
          v21 = result;
          if (result)
          {
            v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            objc_msgSend(v4, "addObject:", 0x1E495B258);
            objc_msgSend(v4, "addObjectsFromArray:", BWSemanticSegmentationMatteAttachedMediaKeysSupportedByDemosaicedRaw());
            if ((objc_msgSend((id)objc_msgSend(v18[20], "requestedSettings"), "portraitEffectsMatteDeliveryEnabled") & 1) != 0
              || objc_msgSend((id)objc_msgSend((id)objc_msgSend(v18[20], "requestedSettings"), "enabledSemanticSegmentationMatteURNs"), "count"))
            {
              v46[0] = CFSTR("PersonSemanticsSkin");
              v46[1] = 0x1E495AF38;
              objc_msgSend(v4, "removeObjectsInArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 2));
            }
            result = (id *)objc_msgSend(v4, "count");
            if (result)
            {
              v5 = (void *)CMGetAttachment(a2, CFSTR("AttachedMedia"), 0);
              result = (id *)objc_msgSend(v18[125], "inputForStillImageSettings:portType:portraitAdjustedImage:optionalSampleBuffer:forEarlyEncoding:", v18[20], a3, 0, 0, 1);
              v22 = result;
              if (result)
              {
                v19 = BWStillImageProcessingFlagsForSampleBuffer(a2);
                v20 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                v42 = 0u;
                v43 = 0u;
                v40 = 0u;
                v41 = 0u;
                result = (id *)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
                v6 = result;
                if (result)
                {
                  v7 = *(_QWORD *)v41;
                  do
                  {
                    v8 = 0;
                    do
                    {
                      if (*(_QWORD *)v41 != v7)
                        objc_enumerationMutation(v4);
                      v9 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)v8);
                      v36 = 0;
                      v37 = &v36;
                      v38 = 0x2020000000;
                      v39 = 0;
                      v39 = objc_msgSend(v5, "objectForKeyedSubscript:", v9);
                      v30 = 0;
                      v31 = &v30;
                      v32 = 0x3052000000;
                      v33 = __Block_byref_object_copy__41;
                      v34 = __Block_byref_object_dispose__41;
                      v35 = 0;
                      v26 = 0;
                      v27 = &v26;
                      v28 = 0x2020000000;
                      v29 = 0;
                      v10 = (const void *)v37[3];
                      if (v10)
                      {
                        v11 = CMGetAttachment(v10, key, 0);
                        v31[5] = (uint64_t)v11;
                      }
                      else
                      {
                        v25[0] = 0;
                        v25[1] = v25;
                        v25[2] = 0x3052000000;
                        v25[3] = __Block_byref_object_copy__41;
                        v25[4] = __Block_byref_object_dispose__41;
                        v25[5] = 0;
                        v12 = v18[61];
                        v24[0] = MEMORY[0x1E0C809B0];
                        v24[1] = 3221225472;
                        v24[2] = __107__BWPhotonicEngineNode__attemptPiecemealEncodingOfAuxImagesForSmartStylesCaptureWithSampleBuffer_portType___block_invoke;
                        v24[3] = &unk_1E4928068;
                        v24[4] = v18;
                        v24[5] = v9;
                        v24[6] = &v36;
                        v24[9] = v25;
                        v24[10] = a2;
                        v24[7] = &v26;
                        v24[8] = &v30;
                        block[0] = MEMORY[0x1E0C809B0];
                        block[1] = 3221225472;
                        block[2] = __ubn_dispatch_sync_block_invoke_0;
                        block[3] = &unk_1E491ECB8;
                        block[4] = v24;
                        dispatch_sync(v12, block);
                        _Block_object_dispose(v25, 8);
                      }
                      if (v37[3]
                        && (FigCaptureMetadataUtilitiesGetFinalCropRect() <= 0.0 && v14 >= 1.0
                         || v13 <= 0.0 && v15 >= 1.0))
                      {
                        objc_msgSend(v20, "addObject:", v9);
                        objc_msgSend(v22, "addAuxSbuf:attachedMediakey:primaryImageMetadata:processingFlags:", v37[3], v9, v21, v19);
                        if (*((_BYTE *)v27 + 24))
                        {
                          v16 = (const void *)v37[3];
                          if (v16)
                            CFRelease(v16);
                        }
                      }
                      _Block_object_dispose(&v26, 8);
                      _Block_object_dispose(&v30, 8);
                      _Block_object_dispose(&v36, 8);
                      v8 = (id *)((char *)v8 + 1);
                    }
                    while (v6 != v8);
                    result = (id *)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
                    v6 = result;
                  }
                  while (result);
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

void __107__BWPhotonicEngineNode__attemptPiecemealEncodingOfAuxImagesForSmartStylesCaptureWithSampleBuffer_portType___block_invoke(uint64_t a1)
{
  uint64_t v2;
  __CVBuffer *v3;
  int v4;
  const void *v5;
  uint64_t v6;
  const __CFString *v7;
  const void *v8;
  CMTime v9;
  CFTypeRef cf;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 528), "inferenceBufferForAttachedMediaKey:", *(_QWORD *)(a1 + 40));
  if (v2)
  {
    v3 = (__CVBuffer *)v2;
    cf = 0;
    CMSampleBufferGetPresentationTimeStamp(&v9, *(CMSampleBufferRef *)(a1 + 80));
    v4 = BWSampleBufferCreateFromPixelBuffer(v3, (uint64_t)&v9, &cf, (CMSampleBufferRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
    if (cf)
    {
      CFRelease(cf);
      cf = 0;
    }
    if (!v4)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 528), "metadataForAttachedMediaKey:", *(_QWORD *)(a1 + 40));
      v5 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      if (v5)
        CMSetAttachment(*(CMAttachmentBearerRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), (CFStringRef)*MEMORY[0x1E0D05CB0], v5, 1u);
      v6 = BWMetadataAttachmentKeyForAttachedMediaKey(*(void **)(a1 + 40));
      if (v6)
      {
        v7 = (const __CFString *)v6;
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40) = objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 528), "inferenceAttachedMediaMetadata"), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
        v8 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
        if (v8)
          CMSetAttachment(*(CMAttachmentBearerRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), v7, v8, 1u);
      }
    }
  }
}

- (void)processorController:(id)a3 didFinishProcessingSampleBuffer:(opaqueCMSampleBuffer *)a4 type:(unint64_t)a5 processorInput:(id)a6 err:(int)a7
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  __CVBuffer *ImageBuffer;
  NSObject *v14;
  uint64_t v15;
  const void *v16;
  const void *AttachedMedia;
  const void *v18;
  const void *v19;
  void *PortType;
  int v21;
  uint64_t v22;
  int v23;
  opaqueCMSampleBuffer *v24;
  opaqueCMSampleBuffer *v25;
  CVImageBufferRef v26;
  CFTypeRef v27;
  CFTypeRef v28;
  CFTypeRef v29;
  uint64_t v30;
  BOOL v31;
  char v32;
  NSObject *v33;
  NSObject *v34;
  opaqueCMSampleBuffer *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t i;
  void *v43;
  const void *v44;
  id v45;
  void *v46;
  void *v47;
  const void *v48;
  opaqueCMSampleBuffer *v49;
  opaqueCMSampleBuffer *v50;
  CVImageBufferRef v51;
  CFTypeRef v52;
  void *v53;
  void *v54;
  void *v55;
  NSMutableDictionary *stereoPhotoSensorRawFrameByPortType;
  NSObject *processorCoordinatorWorkerQueue;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  BWPhotonicEngineNode *v63;
  uint64_t v64;
  opaqueCMSampleBuffer *v65;
  uint64_t v66;
  uint64_t j;
  uint64_t v68;
  NSObject *v69;
  unsigned int v70;
  unsigned int v71;
  uint64_t v72;
  NSObject *v73;
  _QWORD *v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  int *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  id v85;
  uint64_t v86;
  uint64_t v87;
  unint64_t v88;
  uint64_t v89;
  unint64_t v90;
  uint64_t v91;
  id v92;
  BWPhotonicEngineNode *v93;
  _QWORD v94[5];
  _QWORD v95[5];
  _QWORD v96[5];
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  _QWORD block[11];
  char v102;
  CMTime v103;
  CMTime v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  _QWORD v109[6];
  os_log_type_t type;
  unsigned int v111;
  _BYTE v112[128];
  _BYTE v113[128];
  int v114;
  const char *v115;
  __int16 v116;
  uint64_t v117;
  __int16 v118;
  id v119;
  CMSampleBufferRef sampleBufferOut;
  uint64_t v121;
  void (*v122)(uint64_t);
  void *v123;
  _QWORD *v124;
  uint64_t v125;

  v125 = *MEMORY[0x1E0C80C00];
  if (!a4 && !a7)
  {
    v111 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    *(_QWORD *)&a7 = 4294954516;
  }
  v90 = a5;
  v91 = *(_QWORD *)&a7;
  BWPixelBufferDimensionsFromSampleBuffer(a4);
  v88 = (unint64_t)BWStillImageCaptureFrameFlagsForSampleBuffer(a4);
  if (a4)
  {
    ImageBuffer = CMSampleBufferGetImageBuffer(a4);
    CVPixelBufferGetPixelFormatType(ImageBuffer);
  }
  v92 = a6;
  v93 = self;
  if (dword_1ECFE9AF0)
  {
    v111 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    v14 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(a6, "settings", v78, v81), "captureRequestIdentifier"), "isEqualToString:", self->_currentCaptureRequestIdentifier);
  v15 = v91;
  if (!(_DWORD)v91
    && -[BWStillImageNodeConfiguration deferredPhotoProcessorEnabled](self->_nodeConfiguration, "deferredPhotoProcessorEnabled")&& (objc_msgSend(a3, "type") == 2 || objc_msgSend(a3, "type") == 6))
  {
    v16 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend((id)CMGetAttachment(a4, CFSTR("StillImageProcessingFlags"), 0), "unsignedIntValue") | 0x2000);
    CMSetAttachment(a4, CFSTR("StillImageProcessingFlags"), v16, 1u);
    AttachedMedia = (const void *)BWSampleBufferGetAttachedMedia(a4, 0x1E495B0F8);
    if (AttachedMedia)
    {
      v18 = AttachedMedia;
      v19 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend((id)CMGetAttachment(AttachedMedia, CFSTR("StillImageProcessingFlags"), 0), "unsignedIntValue") | 0x2000);
      CMSetAttachment(v18, CFSTR("StillImageProcessingFlags"), v19, 1u);
    }
  }
  v85 = a3;
  switch(objc_msgSend(a3, "type"))
  {
    case 2:
      if (_FigIsCurrentDispatchQueue())
      {
        if ((_DWORD)v91)
          goto LABEL_101;
      }
      else
      {
        v82 = v86;
        LODWORD(v79) = 0;
        FigDebugAssert3();
        if ((_DWORD)v91)
          goto LABEL_101;
      }
      if (-[BWPhotonicEngineNodeConfiguration deepFusionSupportEnabled]((_BOOL8)self->_nodeConfiguration)
        && !-[BWStillImageNodeConfiguration deferredPhotoProcessorEnabled](self->_nodeConfiguration, "deferredPhotoProcessorEnabled")&& a5 != 15&& a5 != 36)
      {
        -[BWPhotonicEngineNode _processorControllerDidFinishProcessingInputForPortType:processorType:captureRequestIdentifier:]((uint64_t)self, objc_msgSend(a6, "portType"), 6, (void *)objc_msgSend((id)objc_msgSend(a6, "settings"), "captureRequestIdentifier"));
      }
      goto LABEL_101;
    case 5:
      if (_FigIsCurrentDispatchQueue())
      {
        if ((_DWORD)v91)
          goto LABEL_101;
      }
      else
      {
        v82 = v86;
        LODWORD(v79) = 0;
        FigDebugAssert3();
        if ((_DWORD)v91)
          goto LABEL_101;
      }
      PortType = (void *)BWSampleBufferGetPortType(a4);
      v21 = objc_msgSend(PortType, "isEqualToString:", objc_msgSend((id)objc_msgSend(a6, "captureSettings"), "masterPortType"));
      if ((objc_msgSend((id)objc_msgSend(a6, "captureStreamSettings"), "captureFlags") & 0x4000000000) != 0
        && (objc_msgSend((id)objc_msgSend(a6, "captureSettings"), "learnedNRStereoPhotoFrameFlag") & v88) != 0)
      {
        sampleBufferOut = 0;
        if (v21)
        {
          BWCMSampleBufferCreateCopyIncludingMetadata(a4, &sampleBufferOut);
          objc_msgSend((id)CMGetAttachment(sampleBufferOut, (CFStringRef)*MEMORY[0x1E0D05CB0], 0), "setObject:forKeyedSubscript:", 0, CFSTR("SyntheticReference"));
        }
        else
        {
          if (a4)
            v35 = (opaqueCMSampleBuffer *)CFRetain(a4);
          else
            v35 = 0;
          sampleBufferOut = v35;
        }
        stereoPhotoSensorRawFrameByPortType = self->_stereoPhotoSensorRawFrameByPortType;
        if (!stereoPhotoSensorRawFrameByPortType)
        {
          stereoPhotoSensorRawFrameByPortType = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
          self->_stereoPhotoSensorRawFrameByPortType = stereoPhotoSensorRawFrameByPortType;
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:](stereoPhotoSensorRawFrameByPortType, "setObject:forKeyedSubscript:", sampleBufferOut, PortType, v79, v82);
        if (sampleBufferOut)
          CFRelease(sampleBufferOut);
      }
      v15 = v91;
      if (v21)
      {
        if (a4)
          CFRetain(a4);
        processorCoordinatorWorkerQueue = self->_processorCoordinatorWorkerQueue;
        v109[0] = MEMORY[0x1E0C809B0];
        v109[1] = 3221225472;
        v109[2] = __100__BWPhotonicEngineNode_processorController_didFinishProcessingSampleBuffer_type_processorInput_err___block_invoke;
        v109[3] = &unk_1E491F158;
        v109[4] = self;
        v109[5] = a4;
        sampleBufferOut = (CMSampleBufferRef)MEMORY[0x1E0C809B0];
        v121 = 3221225472;
        v122 = __ubn_dispatch_async_block_invoke_0;
        v123 = &unk_1E491ECB8;
        v124 = v109;
        dispatch_async(processorCoordinatorWorkerQueue, &sampleBufferOut);
      }
      goto LABEL_101;
    case 6:
      if (_FigIsCurrentDispatchQueue())
      {
        if ((_DWORD)v91)
          goto LABEL_101;
      }
      else
      {
        v82 = v86;
        LODWORD(v79) = 0;
        FigDebugAssert3();
        if ((_DWORD)v91)
          goto LABEL_101;
      }
      if (a5 != 29 && a5 != 7)
        goto LABEL_101;
      v87 = objc_msgSend((id)objc_msgSend(a6, "captureSettings", v79, v82), "captureFlags");
      if ((int)-[BWPhotonicEngineNodeConfiguration deepZoomVersion]((uint64_t)self->_nodeConfiguration) < 1
        || (objc_msgSend((id)objc_msgSend(a6, "captureStreamSettings"), "captureFlags") & 0x200000000) != 0)
      {
        goto LABEL_65;
      }
      v22 = -[BWPhotonicEngineNodeConfiguration deepZoomMode]((uint64_t)self->_nodeConfiguration);
      if ((objc_msgSend((id)objc_msgSend(a6, "captureStreamSettings"), "captureFlags") & 0x4000000000) != 0)
      {
        v22 = 5;
      }
      else if (!+[BWDeepZoomProcessorControllerConfiguration doDeepZoomStandardOrLiteForSampleBuffer:type:sensorConfiguration:intermediateZoomSrcRectOut:intermediateZoomDstRectOut:](BWDeepZoomProcessorControllerConfiguration, "doDeepZoomStandardOrLiteForSampleBuffer:type:sensorConfiguration:intermediateZoomSrcRectOut:intermediateZoomDstRectOut:", a4, 1, objc_msgSend((id)-[BWPhotonicEngineNodeConfiguration sensorConfigurationsByPortType]((uint64_t)self->_nodeConfiguration), "objectForKeyedSubscript:", objc_msgSend(a6, "portType")), 0, 0))
      {
        goto LABEL_65;
      }
      -[BWDeferredPipelineParameters setDeepZoomVersion:](-[BWDeferredCaptureControllerInput pipelineParameters](self->_deferredCaptureControllerInput, "pipelineParameters"), "setDeepZoomVersion:", -[BWPhotonicEngineNodeConfiguration deepZoomVersion]((uint64_t)self->_nodeConfiguration));
      -[BWDeferredPipelineParameters setDeepZoomMode:](-[BWDeferredCaptureControllerInput pipelineParameters](self->_deferredCaptureControllerInput, "pipelineParameters"), "setDeepZoomMode:", v22);
LABEL_65:
      if ((objc_msgSend((id)objc_msgSend(a6, "captureSettings"), "captureFlags") & 0x8000000000) != 0)
      {
        v36 = (void *)CMGetAttachment(a4, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
        v37 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        BWCopyWhiteBalanceMetadata(v36, v37);
        -[BWDeferredCaptureControllerInput addDictionary:tag:](v93->_deferredCaptureControllerInput, "addDictionary:tag:", v37, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), BWDeferredIntermediateTagWhiteBalanceMetadataByPortTypePrefix, objc_msgSend(a6, "portType")));
      }
      v105 = 0u;
      v106 = 0u;
      v107 = 0u;
      v108 = 0u;
      v38 = (void *)objc_msgSend((id)CMGetAttachment(a4, CFSTR("PhotoManifest"), 0), "photoDescriptors");
      v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v105, v113, 16);
      if (v39)
      {
        v40 = v39;
        v41 = *(_QWORD *)v106;
        do
        {
          for (i = 0; i != v40; ++i)
          {
            if (*(_QWORD *)v106 != v41)
              objc_enumerationMutation(v38);
            v43 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * i);
            CMSampleBufferGetPresentationTimeStamp(&v104, a4);
            v103 = v104;
            objc_msgSend(v43, "setPresentationTimeStamp:", &v103);
            objc_msgSend(v43, "setTime:", objc_msgSend(MEMORY[0x1E0C99D68], "now"));
            objc_msgSend(v43, "setTimeZone:", objc_msgSend(MEMORY[0x1E0C99E80], "systemTimeZone"));
            -[BWDeferredCaptureControllerInput addPhotoDescriptor:](v93->_deferredCaptureControllerInput, "addPhotoDescriptor:", v43);
          }
          v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v105, v113, 16);
        }
        while (v40);
      }
      a6 = v92;
      v15 = v91;
      if (objc_msgSend((id)objc_msgSend(v92, "processingSettings"), "provideDemosaicedRaw"))
      {
        v44 = (const void *)BWSampleBufferGetAttachedMedia(a4, 0x1E495B0F8);
        v45 = (id)CMGetAttachment(v44, CFSTR("RawDNGDictionary"), 0);
        v46 = (void *)objc_msgSend(v92, "settings");
        if (v45)
        {
          v47 = (void *)BWCreateDNGDictionaryWithUpdatedDimensionsIfNeeded(v45, objc_msgSend(v46, "deferredPhotoProxyWidth") | (unint64_t)(objc_msgSend(v46, "deferredPhotoProxyHeight") << 32), objc_msgSend(v46, "deferredPhotoFinalWidth") | (unint64_t)(objc_msgSend(v46, "deferredPhotoFinalHeight") << 32));
          if (v47)
            v45 = v47;
          a6 = v92;
          -[BWDeferredCaptureControllerInput addDictionary:tag:](v93->_deferredCaptureControllerInput, "addDictionary:tag:", v45, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), BWDeferredIntermediateTagDNGDictionaryPrefix, objc_msgSend(v92, "portType")));
        }
        else if (!objc_msgSend(v46, "outputFormat"))
        {
          -[BWDeferredCaptureControllerInput encounteredProcessingError:](v93->_deferredCaptureControllerInput, "encounteredProcessingError:", 0);
          v48 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend((id)CMGetAttachment(a4, CFSTR("StillImageProcessingFlags"), 0), "unsignedIntValue") ^ 0x1000);
          CMSetAttachment(a4, CFSTR("StillImageProcessingFlags"), v48, 1u);
        }
      }
      if (-[BWStillImageNodeConfiguration depthDataType](v93->_nodeConfiguration, "depthDataType") != 3)
        goto LABEL_88;
      v49 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a4, (uint64_t)CFSTR("Depth"));
      if (v49)
      {
        v50 = v49;
        v51 = CMSampleBufferGetImageBuffer(v49);
        v52 = CMGetAttachment(v50, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
        -[BWPhotonicEngineNode _deferredCaptureAddBuffer:bufferType:captureFrameFlags:metadata:rawThumbnailsBuffer:rawThumbnailsMetadata:portType:]((uint64_t)v93, (uint64_t)v51, 2001, 0, (uint64_t)v52, 0, 0, (void *)objc_msgSend(a6, "portType"));
        v53 = (void *)CMGetAttachment(v50, (CFStringRef)*MEMORY[0x1E0D05C28], 0);
        v54 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v53);
        objc_msgSend(v54, "setObject:forKeyedSubscript:", CMGetAttachment(v50, CFSTR("DepthPixelBufferType"), 0), CFSTR("DepthPixelBufferType"));
        if (objc_msgSend(v53, "count"))
        {
          a6 = v92;
          -[BWDeferredCaptureControllerInput addDictionary:tag:](v93->_deferredCaptureControllerInput, "addDictionary:tag:", v54, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), BWDeferredIntermediateTagDepthData, objc_msgSend(v92, "portType")));
        }
        -[BWDeferredCaptureControllerInput addDictionary:tag:](v93->_deferredCaptureControllerInput, "addDictionary:tag:", objc_msgSend((id)objc_msgSend((id)-[BWPhotonicEngineNodeConfiguration sensorConfigurationsByPortType]((uint64_t)v93->_nodeConfiguration), "objectForKeyedSubscript:", *MEMORY[0x1E0D05A40]), "cameraInfo"), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), BWDeferredIntermediateTagCameraInfoByPortTypePrefix, *MEMORY[0x1E0D05A40]));
        v15 = v91;
        if ((BWCIFilterArrayContainsPortraitFilters((void *)objc_msgSend((id)objc_msgSend(a6, "settings"), "processedImageFilters")) & 1) == 0)BWSampleBufferRemoveAttachedMedia(a4, (uint64_t)CFSTR("Depth"));
      }
      else
      {
        -[BWDeferredCaptureControllerInput depthDataGenerationFailed](v93->_deferredCaptureControllerInput, "depthDataGenerationFailed");
LABEL_88:
        if ((v87 & 0x4000000000) == 0)
          goto LABEL_101;
      }
      v55 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      objc_msgSend(v55, "setObject:forKeyedSubscript:", CMGetAttachment(a4, CFSTR("OriginalCameraIntrinsicMatrix"), 0), CFSTR("OriginalCameraIntrinsicMatrix"));
      objc_msgSend(v55, "setObject:forKeyedSubscript:", CMGetAttachment(a4, CFSTR("OriginalCameraIntrinsicMatrixReferenceDimensions"), 0), CFSTR("OriginalCameraIntrinsicMatrixReferenceDimensions"));
      if (objc_msgSend(v55, "count"))
      {
        a6 = v92;
        -[BWDeferredCaptureControllerInput addDictionary:tag:](v93->_deferredCaptureControllerInput, "addDictionary:tag:", v55, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), BWDeferredIntermediateTagSampleBufferOriginalCameraIntrinsicsPrefix, objc_msgSend(v92, "portType")));
      }
LABEL_101:
      v58 = (void *)objc_msgSend(a6, "outputSampleBufferRouterForBufferType:", v90, v79, v82);
      if (!objc_msgSend(v58, "outputSampleBufferRouter"))
      {
        v76 = (void *)MEMORY[0x1E0CB3940];
        v77 = BWStillImageProcessorTypeToShortString(objc_msgSend(v85, "type"));
        v75 = objc_msgSend(v76, "stringWithFormat:", CFSTR("No output router for output sample buffer of %@ (buffer type: %@, err: %d)"), v77, BWStillImageProcessorTypeToShortString(v90), v15);
LABEL_123:
        objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], v75, 0));
      }
      v59 = (void *)MEMORY[0x1A858DD40]();
      v60 = objc_msgSend(v58, "outputSampleBufferRouter");
      (*(void (**)(uint64_t, opaqueCMSampleBuffer *, unint64_t, id, uint64_t))(v60 + 16))(v60, a4, v90, a6, v15);
      objc_autoreleasePoolPop(v59);
      v99 = 0u;
      v100 = 0u;
      v98 = 0u;
      v97 = 0u;
      v61 = (void *)objc_msgSend(v58, "bypassedProcessorsTypes");
      v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v97, v112, 16);
      v63 = v93;
      if (v62)
      {
        v64 = v62;
        v65 = (opaqueCMSampleBuffer *)MEMORY[0x1E0C809B0];
        v66 = *(_QWORD *)v98;
        do
        {
          for (j = 0; j != v64; ++j)
          {
            if (*(_QWORD *)v98 != v66)
              objc_enumerationMutation(v61);
            v68 = (int)objc_msgSend(*(id *)(*((_QWORD *)&v97 + 1) + 8 * j), "intValue", v80, v83);
            if (dword_1ECFE9AF0)
            {
              v111 = 0;
              type = OS_LOG_TYPE_DEFAULT;
              v69 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              v70 = v111;
              if (os_log_type_enabled(v69, type))
                v71 = v70;
              else
                v71 = v70 & 0xFFFFFFFE;
              if (v71)
              {
                v72 = BWStillImageProcessorTypeToShortString(v68);
                v114 = 136315651;
                v115 = "-[BWPhotonicEngineNode processorController:didFinishProcessingSampleBuffer:type:processorInput:err:]";
                v116 = 2114;
                v117 = v72;
                v118 = 2113;
                v119 = v92;
                LODWORD(v83) = 32;
                v80 = &v114;
                _os_log_send_and_compose_impl();
              }
              fig_log_call_emit_and_clean_up_after_send_and_compose();
              v63 = v93;
            }
            switch(v68)
            {
              case 1:
              case 2:
              case 3:
              case 4:
              case 5:
              case 6:
              case 8:
              case 9:
              case 11:
              case 12:
              case 13:
              case 14:
              case 15:
              case 17:
              case 18:
              case 19:
                v75 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Processor bypassing support has not been implemented for %@"), BWStillImageProcessorTypeToShortString(v68), v83, v84);
                goto LABEL_123;
              case 7:
                v73 = v63->_processorCoordinatorWorkerQueue;
                v96[0] = v65;
                v96[1] = 3221225472;
                v96[2] = __100__BWPhotonicEngineNode_processorController_didFinishProcessingSampleBuffer_type_processorInput_err___block_invoke_108;
                v96[3] = &unk_1E491E720;
                v96[4] = v63;
                sampleBufferOut = v65;
                v121 = 3221225472;
                v122 = __ubn_dispatch_async_block_invoke_0;
                v123 = &unk_1E491ECB8;
                v74 = v96;
                goto LABEL_118;
              case 10:
                v73 = v63->_processorCoordinatorWorkerQueue;
                v95[0] = v65;
                v95[1] = 3221225472;
                v95[2] = __100__BWPhotonicEngineNode_processorController_didFinishProcessingSampleBuffer_type_processorInput_err___block_invoke_2;
                v95[3] = &unk_1E491E720;
                v95[4] = v63;
                sampleBufferOut = v65;
                v121 = 3221225472;
                v122 = __ubn_dispatch_async_block_invoke_0;
                v123 = &unk_1E491ECB8;
                v74 = v95;
                goto LABEL_118;
              case 16:
                v73 = v63->_processorCoordinatorWorkerQueue;
                v94[0] = v65;
                v94[1] = 3221225472;
                v94[2] = __100__BWPhotonicEngineNode_processorController_didFinishProcessingSampleBuffer_type_processorInput_err___block_invoke_3;
                v94[3] = &unk_1E491E720;
                v94[4] = v63;
                sampleBufferOut = v65;
                v121 = 3221225472;
                v122 = __ubn_dispatch_async_block_invoke_0;
                v123 = &unk_1E491ECB8;
                v74 = v94;
LABEL_118:
                v124 = v74;
                dispatch_async(v73, &sampleBufferOut);
                break;
              default:
                continue;
            }
          }
          v64 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v97, v112, 16);
        }
        while (v64);
      }
      return;
    case 8:
      if (!_FigIsCurrentDispatchQueue())
      {
        v82 = v86;
        LODWORD(v79) = 0;
        FigDebugAssert3();
      }
      v23 = objc_msgSend((id)objc_msgSend(a6, "captureSettings", v79, v82), "deliverDeferredPhotoProxyImage");
      if (a5 == 20 && v23)
      {
        v24 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a4, (uint64_t)CFSTR("Depth"));
        v25 = v24;
        if (v24)
          v26 = CMSampleBufferGetImageBuffer(v24);
        else
          v26 = 0;
        v27 = CMGetAttachment(v25, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
        v28 = CMGetAttachment(a4, (CFStringRef)*MEMORY[0x1E0D08740], 0);
        v29 = CMGetAttachment(a4, (CFStringRef)*MEMORY[0x1E0D086F0], 0);
        v89 = objc_msgSend(a6, "portType");
        v30 = objc_msgSend((id)objc_msgSend(a6, "settings"), "settingsID");
        objc_msgSend((id)objc_msgSend(a6, "settings"), "captureRequestIdentifier");
        if ((_DWORD)v91)
          v31 = 1;
        else
          v31 = v26 == 0;
        v32 = !v31;
        if (dword_1ECFE9AF0)
        {
          v111 = 0;
          type = OS_LOG_TYPE_DEFAULT;
          v33 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        if (v26)
          CFRetain(v26);
        if ((BWCIFilterArrayContainsPortraitFilters((void *)objc_msgSend((id)objc_msgSend(v92, "settings", v79, v82), "processedImageFilters")) & 1) == 0)BWSampleBufferRemoveAttachedMedia(a4, (uint64_t)CFSTR("Depth"));
        v34 = v93->_processorCoordinatorWorkerQueue;
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __100__BWPhotonicEngineNode_processorController_didFinishProcessingSampleBuffer_type_processorInput_err___block_invoke_105;
        block[3] = &unk_1E4928090;
        v102 = v32;
        block[4] = v89;
        block[5] = v93;
        block[6] = v28;
        block[7] = v29;
        block[8] = v27;
        block[9] = v26;
        block[10] = v30;
        dispatch_async(v34, block);
        a6 = v92;
        v15 = v91;
      }
      goto LABEL_101;
    case 12:
      if (!_FigIsCurrentDispatchQueue())
      {
        v82 = v86;
        LODWORD(v79) = 0;
        FigDebugAssert3();
      }
      goto LABEL_101;
    case 16:
      if (-[BWStillImageNodeConfiguration deferredPhotoProcessorEnabled](self->_nodeConfiguration, "deferredPhotoProcessorEnabled"))
      {
        -[BWPhotonicEngineNode _attemptPiecemealEncodingOfAuxImagesForSmartStylesCaptureWithSampleBuffer:portType:]((id *)&self->super.super.isa, a4, (void *)objc_msgSend(a6, "portType"));
      }
      goto LABEL_101;
    default:
      goto LABEL_101;
  }
}

id *__100__BWPhotonicEngineNode_processorController_didFinishProcessingSampleBuffer_type_processorInput_err___block_invoke(uint64_t a1)
{
  id *result;

  result = *(id **)(a1 + 32);
  if (result)
    return (id *)-[BWPhotonicEngineNode _serviceNextSoftISPInputWithSampleBuffer:processingMode:transferOwnership:](result, *(const void **)(a1 + 40), 0, 1u);
  return result;
}

- (uint64_t)_deferredCaptureAddBuffer:(uint64_t)a3 bufferType:(uint64_t)a4 captureFrameFlags:(uint64_t)a5 metadata:(uint64_t)a6 rawThumbnailsBuffer:(uint64_t)a7 rawThumbnailsMetadata:(void *)a8 portType:
{
  uint64_t v8;

  if (result)
  {
    v8 = result;
    result = *(_QWORD *)(result + 904);
    if (result)
    {
      result = objc_msgSend(a8, "isEqualToString:", objc_msgSend((id)result, "portType"));
      if ((_DWORD)result)
      {
        result = -[BWPhotonicEngineNode _processingNeededForSettings:portType:](v8, (void *)objc_msgSend(*(id *)(v8 + 904), "stillImageSettings"), objc_msgSend(*(id *)(v8 + 904), "portType"));
        if ((_DWORD)result)
          return objc_msgSend(*(id *)(v8 + 904), "addBuffer:bufferType:captureFrameFlags:metadata:rawThumbnailsBuffer:rawThumbnailsMetadata:", a2, a3, a4, a5, a6, a7);
      }
    }
  }
  return result;
}

void __100__BWPhotonicEngineNode_processorController_didFinishProcessingSampleBuffer_type_processorInput_err___block_invoke_105(uint64_t a1)
{
  uint64_t v2;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  const void *v4;

  if (*(_BYTE *)(a1 + 88))
  {
    if (!objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 904), "portType")))goto LABEL_8;
    v2 = *(_QWORD *)(a1 + 48);
    if (v2)
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 904), "addDictionary:tag:", v2, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), BWDeferredIntermediateTagStereoPhotoDepthMetadata, *(_QWORD *)(a1 + 32)));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 904), "addDictionary:tag:", *(_QWORD *)(a1 + 56), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), BWDeferredIntermediateTagDepthMetadata, *(_QWORD *)(a1 + 32)));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 904), "addBuffer:bufferType:captureFrameFlags:metadata:rawThumbnailsBuffer:rawThumbnailsMetadata:", *(_QWORD *)(a1 + 72), 2001, 0, *(_QWORD *)(a1 + 64), 0, 0);
    if (dword_1ECFE9AF0)
    {
LABEL_8:
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 904), "depthDataGenerationFailed");
  }
  v4 = *(const void **)(a1 + 72);
  if (v4)
    CFRelease(v4);
}

uint64_t __100__BWPhotonicEngineNode_processorController_didFinishProcessingSampleBuffer_type_processorInput_err___block_invoke_108(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "controllerForType:", 7), "cancelProcessing");
}

void *__100__BWPhotonicEngineNode_processorController_didFinishProcessingSampleBuffer_type_processorInput_err___block_invoke_2(uint64_t a1)
{
  void *result;

  result = (void *)-[BWPhotonicEngineNode _waitAndSafelyGetProcessorControllerForType:](*(_QWORD *)(a1 + 32), 10);
  if (result)
    return (void *)objc_msgSend(result, "cancelProcessing");
  return result;
}

- (uint64_t)_waitAndSafelyGetProcessorControllerForType:(uint64_t)result
{
  uint64_t v3;
  NSObject *v4;

  if (result)
  {
    v3 = result;
    if (!_FigIsCurrentDispatchQueue())
      FigDebugAssert3();
    v4 = *(NSObject **)(v3 + 192);
    if (v4)
      dispatch_group_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
    return objc_msgSend(*(id *)(v3 + 168), "controllerForType:", a2);
  }
  return result;
}

uint64_t __100__BWPhotonicEngineNode_processorController_didFinishProcessingSampleBuffer_type_processorInput_err___block_invoke_3(uint64_t a1)
{
  return objc_msgSend((id)-[BWPhotonicEngineNode _waitAndSafelyGetProcessorControllerForType:](*(_QWORD *)(a1 + 32), 16), "cancelProcessing");
}

- (void)_removeNonPropagatedAttachedMediaFromSampleBuffer:(uint64_t)a1
{
  if (a1)
  {
    BWSampleBufferRemoveAttachedMedia(a2, 0x1E495B158);
    BWSampleBufferRemoveAttachedMedia(a2, 0x1E495B178);
    BWSampleBufferRemoveAttachedMedia(a2, 0x1E495B358);
    BWSampleBufferRemoveAttachedMedia(a2, 0x1E495B3F8);
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
          -[BWPhotonicEngineNode _releaseResources](a1);
      }
    }
  }
}

void __54__BWPhotonicEngineNode__emitSampleBuffer_description___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  const void *v5;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  id v7;

  v2 = (void *)CMGetAttachment(*(CMAttachmentBearerRef *)(a1 + 48), CFSTR("StillSettings"), 0);
  if (v2)
  {
    v3 = v2;
    if (objc_msgSend((id)objc_msgSend(v2, "requestedSettings"), "isBeginMomentCaptureSettings"))
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      v7 = +[BWNodeError newError:sourceNode:stillImageSettings:metadata:](BWNodeError, "newError:sourceNode:stillImageSettings:metadata:", 4294954516, *(_QWORD *)(a1 + 40), v3, CMGetAttachment(*(CMAttachmentBearerRef *)(a1 + 48), (CFStringRef)*MEMORY[0x1E0D05CB0], 0));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "emitNodeError:", v7);

    }
    else
    {
      if (dword_1ECFE9AF0)
      {
        v4 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      -[BWPhotonicEngineNode _releaseNodeResourcesIfNeededBeforeEmittingSampleBuffer:](*(_QWORD *)(a1 + 40), *(const void **)(a1 + 48));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "emitSampleBuffer:", *(_QWORD *)(a1 + 48));
    }
  }
  v5 = *(const void **)(a1 + 48);
  if (v5)
    CFRelease(v5);
}

void __75__BWPhotonicEngineNode__emitError_stillImageSettings_metadata_description___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "emitNodeError:", *(_QWORD *)(a1 + 40));

}

- (void)processorController:(id)a3 didFinishProcessingInput:(id)a4 err:(int)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  BWPhotonicEngineNode *v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  NSObject *processorCoordinatorWorkerQueue;
  _QWORD *v19;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[8];
  _QWORD v26[10];
  int v27;
  _QWORD v28[8];
  _QWORD v29[8];
  uint64_t block;
  uint64_t v31;
  void (*v32)(uint64_t);
  void *v33;
  _QWORD *v34;
  uint64_t v35;

  v6 = *(_QWORD *)&a5;
  v35 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "settings"), "captureRequestIdentifier"), "isEqualToString:", self->_currentCaptureRequestIdentifier))
  {
    v10 = objc_msgSend(a4, "portType");
    v11 = objc_msgSend(a3, "type");
    v12 = objc_msgSend(a4, "stillImageSettings");
    v13 = (void *)objc_msgSend((id)objc_msgSend(a4, "settings"), "captureRequestIdentifier");
    switch(v11)
    {
      case 2:
        if (_FigIsCurrentDispatchQueue())
        {
          if ((_DWORD)v6)
            goto LABEL_19;
        }
        else
        {
          v24 = v5;
          LODWORD(v23) = 0;
          FigDebugAssert3();
          if ((_DWORD)v6)
          {
LABEL_19:
            if (-[BWStillImageNodeConfiguration deferredPhotoProcessorEnabled](self->_nodeConfiguration, "deferredPhotoProcessorEnabled", v23, v24))
            {
              -[BWPhotonicEngineNode _emitError:stillImageSettings:metadata:description:]((uint64_t)self, v6, objc_msgSend(a4, "stillImageSettings"), 0);
            }
            else
            {
              -[BWPhotonicEngineNode _handleDeepFusionError:processorInput:]((unint64_t)self, v6, a4);
            }
          }
        }
        v14 = self;
        v15 = v10;
        v16 = 2;
        goto LABEL_6;
      case 3:
        if (!_FigIsCurrentDispatchQueue())
          FigDebugAssert3();
        processorCoordinatorWorkerQueue = self->_processorCoordinatorWorkerQueue;
        v29[0] = MEMORY[0x1E0C809B0];
        v29[1] = 3221225472;
        v29[2] = __73__BWPhotonicEngineNode_processorController_didFinishProcessingInput_err___block_invoke;
        v29[3] = &unk_1E4922AA0;
        v29[4] = self;
        v29[5] = v10;
        v29[6] = v13;
        v29[7] = 3;
        block = MEMORY[0x1E0C809B0];
        v31 = 3221225472;
        v32 = __ubn_dispatch_async_block_invoke_0;
        v33 = &unk_1E491ECB8;
        v19 = v29;
        goto LABEL_30;
      case 4:
      case 7:
      case 10:
      case 15:
      case 16:
      case 17:
      case 18:
        if (!_FigIsCurrentDispatchQueue())
          FigDebugAssert3();
        v14 = self;
        v15 = v10;
        v16 = v11;
        goto LABEL_6;
      case 5:
        if (!_FigIsCurrentDispatchQueue())
          FigDebugAssert3();
        processorCoordinatorWorkerQueue = self->_processorCoordinatorWorkerQueue;
        v26[0] = MEMORY[0x1E0C809B0];
        v26[1] = 3221225472;
        v26[2] = __73__BWPhotonicEngineNode_processorController_didFinishProcessingInput_err___block_invoke_3;
        v26[3] = &unk_1E49205E0;
        v27 = v6;
        v26[4] = self;
        v26[5] = a4;
        v26[6] = v10;
        v26[7] = v13;
        v26[8] = v12;
        v26[9] = 5;
        block = MEMORY[0x1E0C809B0];
        v31 = 3221225472;
        v32 = __ubn_dispatch_async_block_invoke_0;
        v33 = &unk_1E491ECB8;
        v19 = v26;
        goto LABEL_30;
      case 6:
      case 11:
        if (!_FigIsCurrentDispatchQueue())
          FigDebugAssert3();
        -[BWPhotonicEngineNode _processorControllerDidFinishProcessingInputForPortType:processorType:captureRequestIdentifier:]((uint64_t)self, v10, v11, v13);
        v17 = objc_msgSend((id)objc_msgSend(a4, "captureSettings"), "captureType");
        if ((_DWORD)v6 && v17 == 12)
        {
          if (objc_msgSend((id)objc_msgSend(a4, "captureSettings"), "deliverDeferredPhotoProxyImage"))
          {
            -[BWDeferredCaptureControllerInput encounteredProcessingError:](self->_deferredCaptureControllerInput, "encounteredProcessingError:", v6);
          }
          else if (self->_deepFusionProcessorControllerConfiguration)
          {
            objc_msgSend(-[BWStillImageProcessorCoordinator controllerForType:](self->_processorCoordinator, "controllerForType:", 2), "cancelProcessing");
          }
        }
        return;
      case 8:
        if (!_FigIsCurrentDispatchQueue())
          FigDebugAssert3();
        processorCoordinatorWorkerQueue = self->_processorCoordinatorWorkerQueue;
        v28[0] = MEMORY[0x1E0C809B0];
        v28[1] = 3221225472;
        v28[2] = __73__BWPhotonicEngineNode_processorController_didFinishProcessingInput_err___block_invoke_2;
        v28[3] = &unk_1E4922AA0;
        v28[4] = self;
        v28[5] = v10;
        v28[6] = v13;
        v28[7] = 8;
        block = MEMORY[0x1E0C809B0];
        v31 = 3221225472;
        v32 = __ubn_dispatch_async_block_invoke_0;
        v33 = &unk_1E491ECB8;
        v19 = v28;
        goto LABEL_30;
      case 9:
      case 13:
        if (!_FigIsCurrentDispatchQueue())
          FigDebugAssert3();
        processorCoordinatorWorkerQueue = self->_processorCoordinatorWorkerQueue;
        v25[0] = MEMORY[0x1E0C809B0];
        v25[1] = 3221225472;
        v25[2] = __73__BWPhotonicEngineNode_processorController_didFinishProcessingInput_err___block_invoke_4;
        v25[3] = &unk_1E4922AA0;
        v25[4] = self;
        v25[5] = v10;
        v25[6] = v13;
        v25[7] = v11;
        block = MEMORY[0x1E0C809B0];
        v31 = 3221225472;
        v32 = __ubn_dispatch_async_block_invoke_0;
        v33 = &unk_1E491ECB8;
        v19 = v25;
LABEL_30:
        v34 = v19;
        dispatch_async(processorCoordinatorWorkerQueue, &block);
        return;
      case 12:
        if (_FigIsCurrentDispatchQueue())
        {
          if ((_DWORD)v6)
          {
LABEL_34:
            os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
            -[BWPhotonicEngineNode _resetProcessingState]((uint64_t)self);
            -[BWPhotonicEngineNode _emitError:stillImageSettings:metadata:description:]((uint64_t)self, v6, objc_msgSend(a4, "stillImageSettings"), 0);
            return;
          }
        }
        else
        {
          v24 = v5;
          LODWORD(v23) = 0;
          FigDebugAssert3();
          if ((_DWORD)v6)
            goto LABEL_34;
        }
        -[BWPhotonicEngineNode _processorControllerDidFinishProcessingInputForPortType:processorType:captureRequestIdentifier:]((uint64_t)self, v10, 12, v13);
        if (objc_msgSend((id)objc_msgSend(a4, "captureSettings"), "captureType") == 12)
        {
          if (-[BWDeepFusionProcessorControllerConfiguration delayPrepareAndCacheBuffers](self->_deepFusionProcessorControllerConfiguration, "delayPrepareAndCacheBuffers"))
          {
            if (!-[NSMutableDictionary count](self->_softISPRemainingInputsByPortType, "count")
              || objc_msgSend((id)objc_msgSend(a4, "captureSettings"), "learnedNRStereoPhotoFrameFlag")
              && (v21 = objc_msgSend((id)objc_msgSend(a4, "captureSettings"), "masterPortType"),
                  v22 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "captureSettings"), "secondaryPortTypes"), "firstObject"), -[NSMutableDictionary count](self->_softISPRemainingInputsByPortType, "count") == 2)&& objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_softISPRemainingInputsByPortType, "objectForKeyedSubscript:", v21), "count") == 1&& objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_softISPRemainingInputsByPortType, "objectForKeyedSubscript:", v22), "count") == 1)
            {
              objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_deepFusionProcessorInputByPortType, "objectForKeyedSubscript:", v10, v23, v24), "beginProcessingCachedBuffersIfWaiting");
            }
          }
        }
LABEL_7:
        -[BWPhotonicEngineNode _resetProcessingStateIfDone]((uint64_t)self);
        break;
      case 14:
        if (!_FigIsCurrentDispatchQueue())
          FigDebugAssert3();
        -[BWPhotonicEngineNode _emitDeferredCaptureProxyOrErrorRecoverySampleBufferWithWithProcessingError:]((uint64_t)self, v6);
        v14 = self;
        v15 = v10;
        v16 = 14;
LABEL_6:
        -[BWPhotonicEngineNode _processorControllerDidFinishProcessingInputForPortType:processorType:captureRequestIdentifier:]((uint64_t)v14, v15, v16, v13);
        goto LABEL_7;
      default:
        return;
    }
  }
}

- (void)_handleDeepFusionError:(void *)a3 processorInput:
{
  uint64_t v3;
  uint64_t v6;
  void *v7;
  BWNRFProcessorInput *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[5];
  void *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (!_FigIsCurrentDispatchQueue())
    {
      v20 = v3;
      LODWORD(v19) = 0;
      FigDebugAssert3();
    }
    v6 = objc_msgSend(a3, "portType", v19, v20);
    v7 = (void *)objc_msgSend(a3, "stillImageSettings");
    v8 = (BWNRFProcessorInput *)(id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 352), "objectForKeyedSubscript:", v6), "firstObject");
    if (!v8)
    {
      v8 = -[BWNRFProcessorInput initWithSettings:portType:]([BWNRFProcessorInput alloc], "initWithSettings:portType:", v7, v6);
      if (-[BWPhotonicEngineNode _isInferenceInputImageRequiredForSettings:portType:](a1, v7, (uint64_t)-[BWStillImageProcessorControllerInput portType](v8, "portType")))
      {
        v28[0] = MEMORY[0x1E0C809B0];
        v28[1] = 3221225472;
        v28[2] = __47__BWPhotonicEngineNode__ubInferenceInputRouter__block_invoke;
        v28[3] = &unk_1E4923398;
        v28[4] = a1;
        -[BWStillImageProcessorControllerInput addOutputSampleBufferRouter:forBufferTypes:](v8, "addOutputSampleBufferRouter:forBufferTypes:", (id)objc_msgSend(v28, "copy"), &unk_1E4A02060);
      }
      objc_msgSend(*(id *)(a1 + 352), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v8), v6);
    }
    v21 = v6;
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v23 = v7;
    v9 = -[BWPhotonicEngineNode _bufferTypesForCaptureSettings:](a1, (void *)objc_msgSend(v7, "captureSettings"));
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v25 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          v15 = objc_msgSend((id)objc_msgSend(a3, "outputSampleBufferRouterForBufferType:", (int)objc_msgSend(v14, "intValue")), "outputSampleBufferRouter");
          v29 = v14;
          -[BWStillImageProcessorControllerInput addOutputSampleBufferRouter:forBufferTypes:](v8, "addOutputSampleBufferRouter:forBufferTypes:", v15, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1));
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
      }
      while (v11);
    }
    v16 = a2;
    if (a2)
    {
      v17 = v23;
      v18 = (void *)v21;
      if (v8)
      {
        if ((objc_msgSend((id)objc_msgSend(v23, "captureSettings"), "captureFlags") & 4) != 0)
        {
          v16 = -[BWPhotonicEngineNode _processRawErrorRecoveryFrameWithNRFProcessorInput:failureMetadata:](a1, v8, 0);
        }
        else
        {
          -[BWNRFProcessorInput setRemainingProcessingCount:](v8, "setRemainingProcessingCount:", -[BWNRFProcessorInput remainingProcessingCount](v8, "remainingProcessingCount") + 1);
          v16 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 168), "controllerForType:", 6), "enqueueInputForProcessing:delegate:processErrorRecoveryFrame:processOriginalImage:processToneMapping:processInferenceInputImage:clientBracketSequenceNumber:processSemanticRendering:provideInferenceInputImageForProcessing:processSmartStyleRenderingInput:inferencesAvailable:", v8, a1, 1, 0, 0, 0, 0);
          if ((_DWORD)v16)
            -[BWPhotonicEngineNode _processorControllerDidFinishProcessingInputForPortType:processorType:captureRequestIdentifier:](a1, v21, 6, (void *)objc_msgSend((id)objc_msgSend(v23, "requestedSettings"), "captureRequestIdentifier"));
        }
      }
    }
    else
    {
      v17 = v23;
      v18 = (void *)v21;
    }
    objc_msgSend(*(id *)(a1 + 368), "setObject:forKeyedSubscript:", &unk_1E49FC6D8, *(_QWORD *)(a1 + 152));
    -[BWPhotonicEngineNode _attemptDisparityReferenceFrameResolutionForSettings:portType:](a1, v17, v18);
    -[BWPhotonicEngineNode _deferredCaptureAddSecondaryStereoPhotoCaptureSampleBufferIfReadyForSettings:](a1, v17);
    if ((_DWORD)v16)
    {
      objc_msgSend(a3, "description");
      -[BWPhotonicEngineNode _emitError:stillImageSettings:metadata:description:](a1, v16, (uint64_t)v17, 0);
    }
  }
}

void __73__BWPhotonicEngineNode_processorController_didFinishProcessingInput_err___block_invoke(uint64_t a1)
{
  -[BWPhotonicEngineNode _processorControllerDidFinishProcessingInputForPortType:processorType:captureRequestIdentifier:](*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(void **)(a1 + 48));
  -[BWPhotonicEngineNode _resetProcessingStateIfDone](*(_QWORD *)(a1 + 32));
}

void __73__BWPhotonicEngineNode_processorController_didFinishProcessingInput_err___block_invoke_2(uint64_t a1)
{
  -[BWPhotonicEngineNode _processorControllerDidFinishProcessingInputForPortType:processorType:captureRequestIdentifier:](*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(void **)(a1 + 48));
  -[BWPhotonicEngineNode _resetProcessingStateIfDone](*(_QWORD *)(a1 + 32));
}

void __73__BWPhotonicEngineNode_processorController_didFinishProcessingInput_err___block_invoke_3(uint64_t a1)
{
  int v2;
  uint64_t v3;

  v2 = *(_DWORD *)(a1 + 80);
  v3 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    -[BWPhotonicEngineNode _resetProcessingState](v3);
    -[BWPhotonicEngineNode _emitError:stillImageSettings:metadata:description:](*(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 80), objc_msgSend(*(id *)(a1 + 40), "stillImageSettings"), 0);
  }
  else
  {
    -[BWPhotonicEngineNode _processorControllerDidFinishProcessingInputForPortType:processorType:captureRequestIdentifier:](v3, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 72), *(void **)(a1 + 56));
    if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 64), "captureSettings"), "captureType") == 12)
      objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "objectForKeyedSubscript:", objc_msgSend(*(id *)(a1 + 40), "portType")), "allInferencesDelivered");
    -[BWPhotonicEngineNode _resetProcessingStateIfDone](*(_QWORD *)(a1 + 32));
  }
}

void __73__BWPhotonicEngineNode_processorController_didFinishProcessingInput_err___block_invoke_4(uint64_t a1)
{
  -[BWPhotonicEngineNode _processorControllerDidFinishProcessingInputForPortType:processorType:captureRequestIdentifier:](*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(void **)(a1 + 48));
  -[BWPhotonicEngineNode _resetProcessingStateIfDone](*(_QWORD *)(a1 + 32));
}

- (void)_emitDeferredCaptureProxyOrErrorRecoverySampleBufferWithWithProcessingError:(uint64_t)a1
{
  void *v3;
  uint64_t v5;
  const void *v6;
  void *PortType;
  uint64_t v8;
  int v9;
  const __CFString *v10;
  const void *v11;
  uint64_t v12;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v14;
  uint64_t v15;

  if (!a1)
    return;
  v3 = *(void **)(a1 + 904);
  if (!v3)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    v15 = 0;
    a2 = 4294954516;
LABEL_16:
    -[BWPhotonicEngineNode _emitError:stillImageSettings:metadata:description:](a1, a2, v15, 0);
    return;
  }
  v5 = objc_msgSend(v3, "stillImageSettings");
  v6 = *(const void **)(a1 + 912);
  if (!v6)
  {
    v15 = v5;
    v14 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    if (!(_DWORD)a2)
      return;
    goto LABEL_16;
  }
  if ((_DWORD)a2)
  {
    PortType = (void *)BWSampleBufferGetPortType(*(const void **)(a1 + 912));
    v8 = objc_msgSend(*(id *)(a1 + 360), "objectForKeyedSubscript:", objc_msgSend(*(id *)(a1 + 904), "portType"));
    if (v8)
      objc_msgSend((id)CMGetAttachment(*(CMAttachmentBearerRef *)(a1 + 912), (CFStringRef)*MEMORY[0x1E0D05CB0], 0), "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0D06EB0]);
    objc_msgSend(*(id *)(a1 + 368), "setObject:forKeyedSubscript:", &unk_1E49FC6D8, *(_QWORD *)(a1 + 152));
    -[BWPhotonicEngineNode _attemptDisparityReferenceFrameResolutionForSettings:portType:](a1, (void *)objc_msgSend(*(id *)(a1 + 904), "stillImageSettings"), PortType);
    -[BWPhotonicEngineNode _deferredCaptureAddSecondaryStereoPhotoCaptureSampleBufferIfReadyForSettings:](a1, (void *)objc_msgSend(*(id *)(a1 + 904), "stillImageSettings"));
    v6 = *(const void **)(a1 + 912);
  }
  -[BWPhotonicEngineNode _waitForAndMergeInferencesIfNeededForSampleBuffer:processorInput:]((_BOOL8 *)a1, v6, *(void **)(a1 + 904));
  v9 = objc_msgSend((id)CMGetAttachment(*(CMAttachmentBearerRef *)(a1 + 912), CFSTR("StillImageProcessingFlags"), 0), "unsignedIntValue");
  if ((_DWORD)a2)
  {
    if ((v9 & 0x1000) != 0)
      CMSetAttachment(*(CMAttachmentBearerRef *)(a1 + 912), CFSTR("StillImageProcessingFlags"), (CFTypeRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v9 & 0xFFFFAFFF | 0x4000), 1u);
    v10 = CFSTR("error recovery");
  }
  else
  {
    v10 = CFSTR("proxy");
  }
  v11 = *(const void **)(a1 + 912);
  v12 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), BWPhotoEncoderStringFromEncodingScheme(objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 904), "stillImageSettings"), "captureSettings"), "captureType")), v10);
  -[BWPhotonicEngineNode _emitSampleBuffer:description:](a1, v11, v12);
}

- (void)processorController:(id)a3 willAddBuffer:(__CVBuffer *)a4 metadata:(id)a5 bufferType:(unint64_t)a6 processorInput:(id)a7
{
  CGSize v12;
  uint64_t v13;
  CGRect v14;
  CGRect v15;

  if (a5)
  {
    if (a3)
    {
      if (a4)
      {
        if (a7)
        {
          if (objc_msgSend(a3, "type") == 2
            && (int)-[BWPhotonicEngineNodeConfiguration deepZoomVersion]((uint64_t)self->_nodeConfiguration) >= 1
            && (objc_msgSend((id)objc_msgSend(a7, "captureStreamSettings"), "captureFlags") & 0x4200000000) == 0
            && a6 <= 0x1B
            && ((1 << a6) & 0x9C00000) != 0)
          {
            v12 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
            v15.origin = (CGPoint)*MEMORY[0x1E0C9D628];
            v15.size = v12;
            v14.origin = v15.origin;
            v14.size = v12;
            v13 = objc_msgSend((id)-[BWPhotonicEngineNodeConfiguration sensorConfigurationsByPortType]((uint64_t)self->_nodeConfiguration), "objectForKeyedSubscript:", objc_msgSend(a7, "portType"));
            if (+[BWDeepZoomProcessorControllerConfiguration doDeepZoomStandardOrLiteForType:sensorConfiguration:dimensions:metadata:stillImageSettings:intermediateZoomSrcRectOut:intermediateZoomDstRectOut:](BWDeepZoomProcessorControllerConfiguration, "doDeepZoomStandardOrLiteForType:sensorConfiguration:dimensions:metadata:stillImageSettings:intermediateZoomSrcRectOut:intermediateZoomDstRectOut:", 1, v13, psn_pixelBufferDimensions(a4), a5, objc_msgSend(a7, "stillImageSettings"), &v15, &v14))
            {
              if (!CGRectIsNull(v15) && !CGRectIsNull(v14))
              {
                FigCFDictionarySetCGRect();
                FigCFDictionarySetCGRect();
              }
            }
          }
        }
      }
    }
  }
}

- (void)processorController:(id)a3 willAddSampleBuffer:(opaqueCMSampleBuffer *)a4 processorInput:(id)a5
{
  void *v9;
  uint64_t v10;
  CGSize v11;
  CGSize v12;
  float v13;
  CGRect v14;
  CGRect v15;

  if (a3 && a4 && a5)
  {
    v9 = (void *)CMGetAttachment(a4, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
    v10 = objc_msgSend(a3, "type");
    if (v10 == 12)
    {
      if ((int)-[BWPhotonicEngineNodeConfiguration deepZoomVersion]((uint64_t)self->_nodeConfiguration) >= 1
        && objc_msgSend((id)objc_msgSend(a5, "captureStreamSettings"), "captureType") == 12
        && (objc_msgSend((id)objc_msgSend(a5, "captureStreamSettings"), "captureFlags") & 0x200000000) != 0)
      {
        v12 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
        v15.origin = (CGPoint)*MEMORY[0x1E0C9D628];
        v15.size = v12;
        if (+[BWDeepZoomProcessorControllerConfiguration doDeepZoomTransferForSampleBuffer:sensorConfiguration:intermediateZoomSrcRectOut:](BWDeepZoomProcessorControllerConfiguration, "doDeepZoomTransferForSampleBuffer:sensorConfiguration:intermediateZoomSrcRectOut:", a4, objc_msgSend((id)-[BWPhotonicEngineNodeConfiguration sensorConfigurationsByPortType]((uint64_t)self->_nodeConfiguration), "objectForKeyedSubscript:", objc_msgSend(a5, "portType")), &v15))
        {
          if (objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D20]), "intValue") == 1&& !CGRectIsNull(v15))
          {
            objc_msgSend((id)objc_msgSend((id)objc_msgSend(a5, "captureSettings"), "metadata"), "uiZoomFactor");
            if (v13 >= 1.4118)
            {
              if (-[BWDeepZoomProcessorControllerConfiguration mode](self->_deepZoomProcessorControllerConfiguration, "mode") != 4&& -[FigCaptureCameraParameters deepZoomTransferWithZoomedImageEnabledForPortType:sensorIDString:](+[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance"), "deepZoomTransferWithZoomedImageEnabledForPortType:sensorIDString:", objc_msgSend(a5, "portType"), +[FigCaptureCameraParameters sensorIDStringFromMetadata:](FigCaptureCameraParameters, "sensorIDStringFromMetadata:", v9)))
              {
                objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("Deep Zoom Transfer wrongly configured, processing mode should be 'FuseHighResolutionWithZoomedImage'"), 0));
              }
              goto LABEL_22;
            }
          }
        }
      }
    }
    else if (v10 == 6
           && (int)-[BWPhotonicEngineNodeConfiguration deepZoomVersion]((uint64_t)self->_nodeConfiguration) >= 1
           && objc_msgSend((id)objc_msgSend(a5, "captureStreamSettings"), "captureType") == 12
           && (objc_msgSend((id)objc_msgSend(a5, "captureStreamSettings"), "captureFlags") & 0x4200000000) == 0)
    {
      v11 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
      v15.origin = (CGPoint)*MEMORY[0x1E0C9D628];
      v15.size = v11;
      v14.origin = v15.origin;
      v14.size = v11;
      if (+[BWDeepZoomProcessorControllerConfiguration doDeepZoomStandardOrLiteForSampleBuffer:type:sensorConfiguration:intermediateZoomSrcRectOut:intermediateZoomDstRectOut:](BWDeepZoomProcessorControllerConfiguration, "doDeepZoomStandardOrLiteForSampleBuffer:type:sensorConfiguration:intermediateZoomSrcRectOut:intermediateZoomDstRectOut:", a4, 1, objc_msgSend((id)-[BWPhotonicEngineNodeConfiguration sensorConfigurationsByPortType]((uint64_t)self->_nodeConfiguration), "objectForKeyedSubscript:", objc_msgSend(a5, "portType")), &v15, &v14))
      {
        if (!CGRectIsNull(v15) && !CGRectIsNull(v14))
        {
          FigCFDictionarySetCGRect();
LABEL_22:
          FigCFDictionarySetCGRect();
        }
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
    v10 = (void *)-[BWPhotonicEngineNodeConfiguration referenceFrameSelectionDelegate]((uint64_t)self->_nodeConfiguration);
    v11 = objc_msgSend(a6, "stillImageSettings");
    v12 = *(_OWORD *)&a4->var0;
    var3 = a4->var3;
    objc_msgSend(v10, "node:didSelectNewReferenceFrameWithPTS:transform:forSettings:", self, &v12, a5, v11);
  }
}

- (void)_handleQueuedSampleBufferForDisparityWithSettingsIfNeeded:(int)a3 resolvedFusionMode:(void *)a4 portType:
{
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  CFTypeRef v11;
  const void *v12;
  CFTypeRef v13;
  _QWORD v14[5];
  int v15;

  if (a1)
  {
    if (-[BWPhotonicEngineNode _referenceOrClientBracketFrameEmissionNeededForSettings:portType:](a1, a2, a4))
    {
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __110__BWPhotonicEngineNode__handleQueuedSampleBufferForDisparityWithSettingsIfNeeded_resolvedFusionMode_portType___block_invoke;
      v14[3] = &unk_1E49280B8;
      v15 = a3;
      v14[4] = a2;
      v7 = (void *)objc_msgSend(*(id *)(a1 + 232), "newSampleBuffersAndInputsWithPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v14));
      v8 = (id)objc_msgSend(v7, "firstObject");

      if (v8)
      {
        v9 = -[BWPhotonicEngineNode _handleSampleBuffer:input:](a1, (void *)objc_msgSend(v8, "sampleBuffer"), objc_msgSend(v8, "nodeInput"));
        if ((_DWORD)v9)
        {
          v10 = v9;
          v11 = CMGetAttachment((CMAttachmentBearerRef)objc_msgSend(v8, "sampleBuffer"), CFSTR("StillSettings"), 0);
          v12 = (const void *)objc_msgSend(v8, "sampleBuffer");
          v13 = CMGetAttachment(v12, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
          -[BWPhotonicEngineNode _resetProcessingState](a1);
          -[BWPhotonicEngineNode _emitError:stillImageSettings:metadata:description:](a1, v10, (uint64_t)v11, (uint64_t)v13);
        }
      }
    }
    else
    {
      v8 = 0;
    }

  }
}

- (unint64_t)_referenceOrClientBracketFrameEmissionNeededForSettings:(void *)a3 portType:
{
  unint64_t v5;
  void *v6;
  _BOOL4 v7;
  uint64_t v8;

  if (result)
  {
    v5 = result;
    v6 = (void *)objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureStreamSettingsForPortType:", a3);
    v7 = (objc_msgSend(v6, "captureFlags") & 0x20000) != 0 || *(_QWORD *)(v5 + 760) != 0;
    v8 = objc_msgSend(v6, "captureFlags");
    result = (v8 & 0x4000000000) == 0 && v7;
    if ((v8 & 0x4000000000) != 0 && v7)
    {
      if ((objc_msgSend(a3, "isEqualToString:", objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "masterPortType")) & 1) != 0)return 1;
      else
        return ((unint64_t)objc_msgSend(v6, "captureFlags") >> 11) & 1;
    }
  }
  return result;
}

uint64_t __110__BWPhotonicEngineNode__handleQueuedSampleBufferForDisparityWithSettingsIfNeeded_resolvedFusionMode_portType___block_invoke(uint64_t a1, void *a2)
{
  BOOL v4;
  int v5;
  const void *v6;
  void *v7;
  unsigned __int8 v8;
  void *PortType;
  int v10;

  if (*(_DWORD *)(a1 + 40) != 1
    && (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "captureSettings"), "captureFlags") & 0x1000) != 0)
  {
    v5 = 0;
    v4 = *(_DWORD *)(a1 + 40) == 2;
  }
  else
  {
    v4 = 0;
    v5 = 1;
  }
  v6 = (const void *)objc_msgSend(a2, "sampleBuffer");
  v7 = (void *)CMGetAttachment(v6, CFSTR("StillImageSettings"), 0);
  v8 = BWStillImageCaptureFrameFlagsForSampleBuffer(v6);
  PortType = (void *)BWSampleBufferGetPortType(v6);
  if ((~v8 & 0x12) != 0)
    v5 = 0;
  v10 = objc_msgSend(PortType, "isEqualToString:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "captureSettings"), "masterPortType"));
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "requestedSettings"), "captureRequestIdentifier"), "isEqualToString:", objc_msgSend(v7, "captureRequestIdentifier")) & ~v10 & (v5 | (v4 && (v8 & 4) != 0));
}

- (void)processorController:(id)a3 didSelectFusionMode:(int)a4 processorInput:(id)a5
{
  uint64_t v6;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v6 = *(_QWORD *)&a4;
  v20 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a5, "isMaster"))
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_stillImageFusionModeByCaptureRequestIdentifier, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6), self->_currentCaptureRequestIdentifier);
    -[BWPhotonicEngineNode _handleQueuedSampleBufferForDisparityWithSettingsIfNeeded:resolvedFusionMode:portType:]((unint64_t)self, (void *)objc_msgSend(a5, "stillImageSettings"), v6, (void *)objc_msgSend(a5, "portType"));
    -[BWPhotonicEngineNode _attemptDisparityReferenceFrameResolutionForSettings:portType:]((uint64_t)self, (void *)objc_msgSend(a5, "stillImageSettings"), (void *)objc_msgSend(a5, "portType"));
    -[BWPhotonicEngineNode _deferredCaptureAddSecondaryStereoPhotoCaptureSampleBufferIfReadyForSettings:]((uint64_t)self, (void *)objc_msgSend(a5, "stillImageSettings"));
    if (objc_msgSend(a3, "type") == 6)
    {
      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      v9 = (void *)-[NSMutableDictionary allValues](self->_nrfProcessorInputsByPortType, "allValues", 0);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v16;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v16 != v12)
              objc_enumerationMutation(v9);
            v14 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
            objc_msgSend((id)objc_msgSend(v14, "firstObject"), "setFusionMode:", v6);
            -[BWPhotonicEngineNode _checkIfProcessingCompletedForNRFProcessorInput:]((unint64_t)self, (void *)objc_msgSend(v14, "firstObject"));
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        }
        while (v11);
      }
    }
  }
}

- (uint64_t)_attemptDisparityReferenceFrameResolutionForSettings:(void *)a3 portType:
{
  unint64_t v4;
  int v5;
  int v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const __CFString *v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  const void *v22;
  uint64_t v23;
  BOOL v24;
  const void *v25;
  void *v26;
  void *v27;
  void *v28;
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

  v39 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v4 = result;
    result = -[BWPhotonicEngineNode _referenceOrClientBracketFrameEmissionNeededForSettings:portType:](result, a2, a3);
    if ((_DWORD)result)
    {
      v5 = objc_msgSend((id)objc_msgSend(*(id *)(v4 + 368), "objectForKeyedSubscript:", *(_QWORD *)(v4 + 152)), "intValue");
      if (v5 != 1
        && (v6 = v5,
            result = objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureFlags"),
            (result & 0x1000) != 0))
      {
        if (v6 != 2)
          return result;
        v14 = *(void **)(v4 + 280);
        v28 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v33 = 0u;
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v34;
          v18 = (const __CFString *)*MEMORY[0x1E0D05CB0];
          v19 = *MEMORY[0x1E0D06EB0];
          do
          {
            for (i = 0; i != v16; ++i)
            {
              if (*(_QWORD *)v34 != v17)
                objc_enumerationMutation(v14);
              v21 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
              v22 = (const void *)objc_msgSend((id)objc_msgSend(v14, "objectForKeyedSubscript:", v21), "objectForKeyedSubscript:", &unk_1E49FC708);
              v23 = objc_msgSend((id)objc_msgSend(v14, "objectForKeyedSubscript:", v21), "objectForKeyedSubscript:", &unk_1E49FC720);
              if (v22)
                v24 = v23 == 0;
              else
                v24 = 1;
              if (!v24)
              {
                v25 = (const void *)v23;
                v26 = (void *)CMGetAttachment(v22, v18, 0);
                v27 = (void *)CMGetAttachment(v25, v18, 0);
                objc_msgSend(v27, "setObject:forKeyedSubscript:", objc_msgSend(v26, "objectForKeyedSubscript:", v19), v19);
                objc_msgSend(v27, "setObject:forKeyedSubscript:", v26, CFSTR("EVZeroMetadata"));
                objc_msgSend(v28, "addObject:", v21);
              }
            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
          }
          while (v16);
        }
        v7 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v28);
        v8 = 4;
      }
      else
      {
        v7 = (void *)objc_msgSend(*(id *)(v4 + 280), "allKeys");
        v8 = 2;
      }
      result = objc_msgSend(v7, "count");
      if (result)
      {
        v31 = 0u;
        v32 = 0u;
        v29 = 0u;
        v30 = 0u;
        result = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
        if (result)
        {
          v9 = result;
          v10 = *(_QWORD *)v30;
          do
          {
            v11 = 0;
            do
            {
              if (*(_QWORD *)v30 != v10)
                objc_enumerationMutation(v7);
              v12 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v11);
              v13 = (void *)objc_msgSend(*(id *)(v4 + 280), "objectForKeyedSubscript:", v12);
              -[BWPhotonicEngineNode _emitOrEnqueueFusionReferenceFrameIfNeededForSampleBuffer:](v4, (void *)objc_msgSend(v13, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v8)));
              objc_msgSend(*(id *)(v4 + 280), "setObject:forKeyedSubscript:", 0, v12);
              ++v11;
            }
            while (v9 != v11);
            result = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
            v9 = result;
          }
          while (result);
        }
      }
    }
  }
  return result;
}

- (uint64_t)_deferredCaptureAddSecondaryStereoPhotoCaptureSampleBufferIfReadyForSettings:(uint64_t)result
{
  uint64_t v3;
  const void *v4;
  void *v5;

  if (result)
  {
    v3 = result;
    result = objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureFlags");
    if ((result & 0x4000000000) != 0)
    {
      result = objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "deliverDeferredPhotoProxyImage");
      if ((_DWORD)result)
      {
        if (*(_QWORD *)(v3 + 904))
        {
          result = objc_msgSend(*(id *)(v3 + 920), "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1));
          if (result)
          {
            v4 = (const void *)result;
            v5 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
            objc_msgSend(v5, "setObject:forKeyedSubscript:", CMGetAttachment(v4, CFSTR("OriginalCameraIntrinsicMatrix"), 0), CFSTR("OriginalCameraIntrinsicMatrix"));
            objc_msgSend(v5, "setObject:forKeyedSubscript:", CMGetAttachment(v4, CFSTR("OriginalCameraIntrinsicMatrixReferenceDimensions"), 0), CFSTR("OriginalCameraIntrinsicMatrixReferenceDimensions"));
            if (objc_msgSend(v5, "count"))
              objc_msgSend(*(id *)(v3 + 904), "addDictionary:tag:", v5, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), BWDeferredIntermediateTagSampleBufferOriginalCameraIntrinsicsPrefix, BWSampleBufferGetPortType(v4)));
            objc_msgSend(*(id *)(v3 + 904), "addSensorRawSampleBuffer:", v4);
            return objc_msgSend(*(id *)(v3 + 920), "removeAllObjects");
          }
        }
      }
    }
  }
  return result;
}

- (void)_checkIfProcessingCompletedForNRFProcessorInput:(unint64_t)a1
{
  void *v4;
  void *v5;

  if (a1)
  {
    v4 = (void *)objc_msgSend(a2, "portType");
    v5 = (void *)objc_msgSend(a2, "stillImageSettings");
    if (-[BWPhotonicEngineNode _referenceOrClientBracketFrameEmissionNeededForSettings:portType:](a1, v5, v4))
    {
      if (!-[BWPhotonicEngineNode _processingNeededForSettings:portType:](a1, v5, (uint64_t)v4)
        && objc_msgSend(a2, "receivedAllFrames"))
      {
        if (objc_msgSend(*(id *)(a1 + 360), "objectForKeyedSubscript:", v4))
          -[BWPhotonicEngineNode _processorControllerDidFinishProcessingInputForPortType:processorType:captureRequestIdentifier:](a1, (uint64_t)v4, 6, (void *)objc_msgSend((id)objc_msgSend(a2, "settings"), "captureRequestIdentifier"));
      }
    }
  }
}

- (void)processorControllerWillProcessInferences:(id)a3
{
  NSObject *inferenceControllerGroup;

  if (objc_msgSend(a3, "type") == 8)
  {
    inferenceControllerGroup = self->_inferenceControllerGroup;
    if (inferenceControllerGroup)
      dispatch_group_wait(inferenceControllerGroup, 0xFFFFFFFFFFFFFFFFLL);
  }
}

- (id)processorController:(id)a3 newInferencesForProcessorInput:(id)a4
{
  return -[BWPhotonicEngineNode processorController:newInferencesForProcessorInput:inferenceInputBufferType:](self, "processorController:newInferencesForProcessorInput:inferenceInputBufferType:", a3, a4, 15);
}

- (id)processorController:(id)a3 newInferencesForProcessorInput:(id)a4 inferenceInputBufferType:(unint64_t)a5
{
  void *v7;
  NSObject *inferenceControllerQueue;
  _QWORD v10[7];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  uint64_t v16;
  _QWORD block[5];

  if (!_FigIsNotCurrentDispatchQueue())
    FigDebugAssert3();
  v7 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3052000000;
  v14 = __Block_byref_object_copy__41;
  v15 = __Block_byref_object_dispose__41;
  v16 = 0;
  if (a5 <= 0x27 && ((1 << a5) & 0x9000008000) != 0)
  {
    inferenceControllerQueue = self->_inferenceControllerQueue;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __100__BWPhotonicEngineNode_processorController_newInferencesForProcessorInput_inferenceInputBufferType___block_invoke;
    v10[3] = &unk_1E49280E0;
    v10[5] = &v11;
    v10[6] = a5;
    v10[4] = self;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __ubn_dispatch_sync_block_invoke_0;
    block[3] = &unk_1E491ECB8;
    block[4] = v10;
    dispatch_sync(inferenceControllerQueue, block);
    v7 = (void *)v12[5];
  }
  _Block_object_dispose(&v11, 8);
  return v7;
}

id __100__BWPhotonicEngineNode_processorController_newInferencesForProcessorInput_inferenceInputBufferType___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  int *v3;
  int *v4;
  id result;

  v2 = a1[6];
  v3 = &OBJC_IVAR___BWPhotonicEngineNode__inferences;
  if (v2 == 39)
    v3 = &OBJC_IVAR___BWPhotonicEngineNode__stereoPhotoSecondaryInferences;
  if (v2 == 36)
    v4 = &OBJC_IVAR___BWPhotonicEngineNode__quadraForEnhancedResolutionInferences;
  else
    v4 = v3;
  result = *(id *)(a1[4] + *v4);
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40) = result;
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
  -[BWPhotonicEngineNode _emitOrEnqueueFusionReferenceFrameIfNeededForSampleBuffer:]((unint64_t)self, a4);
}

- (int)processorController:(id)a3 processRawErrorRecoveryFrameForProcessorInput:(id)a4 failureMetadata:(id)a5
{
  return -[BWPhotonicEngineNode _processRawErrorRecoveryFrameWithNRFProcessorInput:failureMetadata:]((uint64_t)self, a4, (uint64_t)a5);
}

- (uint64_t)_processRawErrorRecoveryFrameWithNRFProcessorInput:(uint64_t)a3 failureMetadata:
{
  uint64_t v3;
  uint64_t v4;
  const void *v7;
  const void *v8;
  void *v9;
  BWSoftISPProcessorControllerInput *v10;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[7];

  v4 = a1;
  if (!a1)
    return v4;
  if (_FigIsCurrentDispatchQueue())
  {
    if (!a2)
      return 4294954516;
  }
  else
  {
    v13 = v3;
    LODWORD(v12) = 0;
    FigDebugAssert3();
    if (!a2)
      return 4294954516;
  }
  v7 = (const void *)objc_msgSend(*(id *)(v4 + 304), "objectForKeyedSubscript:", objc_msgSend(a2, "portType", v12, v13));
  if (!v7)
    return 4294954516;
  v8 = v7;
  v9 = (void *)CMGetAttachment(v7, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  objc_msgSend(v9, "addEntriesFromDictionary:", a3);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __91__BWPhotonicEngineNode__processRawErrorRecoveryFrameWithNRFProcessorInput_failureMetadata___block_invoke;
  v14[3] = &unk_1E4923438;
  v14[4] = v4;
  v14[5] = a2;
  v14[6] = v9;
  v10 = -[BWSoftISPProcessorControllerInput initWithSettings:portType:gdcEnabled:]([BWSoftISPProcessorControllerInput alloc], "initWithSettings:portType:gdcEnabled:", objc_msgSend(a2, "stillImageSettings"), objc_msgSend(a2, "portType"), -[BWPhotonicEngineNode _gdcSourceForSettings:portType:](v4, (void *)objc_msgSend(a2, "stillImageSettings"), objc_msgSend(a2, "portType")) == 3);
  -[BWStillImageProcessorControllerInput addOutputSampleBufferRouter:forBufferTypes:](v10, "addOutputSampleBufferRouter:forBufferTypes:", v14, &unk_1E4A02048);
  -[BWSoftISPProcessorControllerInput addFrame:processingMode:](v10, "addFrame:processingMode:", v8, 1);
  v4 = -[BWPhotonicEngineNode _enqueueSoftISPInput:](v4, v10);

  if (!(_DWORD)v4)
    objc_msgSend(a2, "setRemainingProcessingCount:", objc_msgSend(a2, "remainingProcessingCount") + 1);
  return v4;
}

- (void)processorController:(id)a3 didDetermineReferenceFrame:(opaqueCMSampleBuffer *)a4 processorInput:(id)a5 err:(int)a6
{
  uint64_t AttachedMedia;
  const void *v10;
  CFTypeRef v11;
  uint64_t v12;
  CFDictionaryRef v13;
  NSObject *processorCoordinatorWorkerQueue;
  _QWORD v15[7];
  CMTime v16;
  CMTime v17;
  _QWORD block[5];

  if (!_FigIsCurrentDispatchQueue())
    FigDebugAssert3();
  AttachedMedia = BWSampleBufferGetAttachedMedia(a4, 0x1E4936818);
  if (AttachedMedia)
  {
    if (self->_smartStyleRenderingConfiguration)
    {
      v10 = (const void *)AttachedMedia;
      if (BWIsSmartStyleCapture(self->_currentStillImageSettings))
      {
        BWPropagateZoomInformationToAttachedMediaSampleBuffer(a4, v10);
        v11 = CMGetAttachment(a4, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
        v12 = BWStillImageProcessingFlagsForSampleBuffer(a4);
        -[BWPhotonicEngineNode _attemptPiecemealEncodingForGainMapSbuf:primaryImageMetadata:processingFlags:portType:]((id *)&self->super.super.isa, v10, (uint64_t)v11, v12, (void *)objc_msgSend(a5, "portType"));
      }
    }
  }
  memset(&v17, 0, sizeof(v17));
  CMSampleBufferGetPresentationTimeStamp(&v17, a4);
  v13 = CMCopyDictionaryOfAttachments((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a4, 1u);
  processorCoordinatorWorkerQueue = self->_processorCoordinatorWorkerQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __90__BWPhotonicEngineNode_processorController_didDetermineReferenceFrame_processorInput_err___block_invoke;
  v15[3] = &unk_1E4921550;
  v15[4] = self;
  v15[5] = a5;
  v15[6] = v13;
  v16 = v17;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __ubn_dispatch_async_block_invoke_0;
  block[3] = &unk_1E491ECB8;
  block[4] = v15;
  dispatch_async(processorCoordinatorWorkerQueue, block);
}

void __90__BWPhotonicEngineNode_processorController_didDetermineReferenceFrame_processorInput_err___block_invoke(uint64_t a1)
{
  void *v2;
  __int128 v3;
  uint64_t v4;

  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "objectForKeyedSubscript:", objc_msgSend(*(id *)(a1 + 40), "portType"));
  objc_msgSend(v2, "setEvZeroReferenceFrameAttachments:", *(_QWORD *)(a1 + 48));
  v3 = *(_OWORD *)(a1 + 56);
  v4 = *(_QWORD *)(a1 + 72);
  objc_msgSend(v2, "setEvZeroReferenceFramePTS:", &v3);

}

- (void)processorController:(id)a3 didFinishProcessingInferenceBuffer:(__CVBuffer *)a4 metadata:(id)a5 inferenceAttachedMediaKey:(id)a6 processorInput:(id)a7 err:(int)a8
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *inferenceControllerQueue;
  _QWORD v14[8];
  os_log_type_t type;
  int v16;
  _QWORD block[18];

  block[16] = *MEMORY[0x1E0C80C00];
  if (!_FigIsCurrentDispatchQueue())
    FigDebugAssert3();
  if (dword_1ECFE9AF0)
  {
    v16 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (a4)
    CFRetain(a4);
  inferenceControllerQueue = self->_inferenceControllerQueue;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __133__BWPhotonicEngineNode_processorController_didFinishProcessingInferenceBuffer_metadata_inferenceAttachedMediaKey_processorInput_err___block_invoke;
  v14[3] = &unk_1E4922AA0;
  v14[4] = self;
  v14[5] = a5;
  v14[6] = a6;
  v14[7] = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __ubn_dispatch_async_block_invoke_0;
  block[3] = &unk_1E491ECB8;
  block[4] = v14;
  dispatch_async(inferenceControllerQueue, block);
}

void __133__BWPhotonicEngineNode_processorController_didFinishProcessingInferenceBuffer_metadata_inferenceAttachedMediaKey_processorInput_err___block_invoke(_QWORD *a1)
{
  void *v2;
  const void *v3;

  v2 = *(void **)(a1[4] + 528);
  if (!v2)
  {
    *(_QWORD *)(a1[4] + 528) = objc_alloc_init(BWStillImageInferences);
    v2 = *(void **)(a1[4] + 528);
  }
  objc_msgSend(v2, "addInferenceBuffer:metadata:inferenceAttachedMediaKey:", a1[7], a1[5], a1[6]);
  v3 = (const void *)a1[7];
  if (v3)
    CFRelease(v3);
}

- (void)processorController:(id)a3 didFinishProcessingInference:(id)a4 inferenceAttachmentKey:(id)a5 processorInput:(id)a6 err:(int)a7
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *inferenceControllerQueue;
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
  inferenceControllerQueue = self->_inferenceControllerQueue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __115__BWPhotonicEngineNode_processorController_didFinishProcessingInference_inferenceAttachmentKey_processorInput_err___block_invoke;
  v12[3] = &unk_1E491EB90;
  v12[4] = self;
  v12[5] = a4;
  v12[6] = a5;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __ubn_dispatch_async_block_invoke_0;
  block[3] = &unk_1E491ECB8;
  block[4] = v12;
  dispatch_async(inferenceControllerQueue, block);
}

uint64_t __115__BWPhotonicEngineNode_processorController_didFinishProcessingInference_inferenceAttachmentKey_processorInput_err___block_invoke(_QWORD *a1)
{
  void *v2;

  v2 = *(void **)(a1[4] + 528);
  if (!v2)
  {
    *(_QWORD *)(a1[4] + 528) = objc_alloc_init(BWStillImageInferences);
    v2 = *(void **)(a1[4] + 528);
  }
  return objc_msgSend(v2, "addInference:inferenceAttachmentKey:", a1[5], a1[6]);
}

- (void)processorController:(id)a3 didFinishProcessingInferenceAttachedMediaMetadata:(id)a4 processorInput:(id)a5
{
  NSObject *inferenceControllerQueue;
  _QWORD v9[7];
  _QWORD block[5];

  if (!_FigIsCurrentDispatchQueue())
    FigDebugAssert3();
  inferenceControllerQueue = self->_inferenceControllerQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __109__BWPhotonicEngineNode_processorController_didFinishProcessingInferenceAttachedMediaMetadata_processorInput___block_invoke;
  v9[3] = &unk_1E491EB90;
  v9[4] = self;
  v9[5] = a4;
  v9[6] = a5;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __ubn_dispatch_async_block_invoke_0;
  block[3] = &unk_1E491ECB8;
  block[4] = v9;
  dispatch_async(inferenceControllerQueue, block);
}

void __109__BWPhotonicEngineNode_processorController_didFinishProcessingInferenceAttachedMediaMetadata_processorInput___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  _QWORD v6[6];
  _QWORD block[5];

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 528);
  if (!v2)
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 528) = objc_alloc_init(BWStillImageInferences);
    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 528);
  }
  objc_msgSend(v2, "addInferenceAttachedMediaMetadata:", *(_QWORD *)(a1 + 40));
  if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "captureSettings"), "captureType") == 12)
  {
    v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "objectForKeyedSubscript:", objc_msgSend(*(id *)(a1 + 48), "portType"));
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 176);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __109__BWPhotonicEngineNode_processorController_didFinishProcessingInferenceAttachedMediaMetadata_processorInput___block_invoke_2;
    v6[3] = &unk_1E491E748;
    v6[4] = v3;
    v6[5] = v4;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __ubn_dispatch_async_block_invoke_0;
    block[3] = &unk_1E491ECB8;
    block[4] = v6;
    dispatch_async(v5, block);
  }
}

uint64_t __109__BWPhotonicEngineNode_processorController_didFinishProcessingInferenceAttachedMediaMetadata_processorInput___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setProvidedInferenceAttachedMedia:", objc_msgSend(*(id *)(a1 + 40), "allKeys"));
}

- (void)processorController:(id)a3 didFinishProcessingBuffer:(__CVBuffer *)a4 metadata:(id)a5 type:(unint64_t)a6 captureFrameFlags:(unint64_t)a7 processorInput:(id)a8 err:(int)a9
{
  id v9;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  __CFString **v20;
  NSObject *processorCoordinatorWorkerQueue;
  void *v22;
  CFDictionaryRef v23;
  CFTypeRef v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD v33[10];
  CMTime v34;
  CMTime v35;
  os_log_type_t type;
  int v37;
  CMAttachmentBearerRef block[19];

  v9 = a8;
  block[16] = *(CMAttachmentBearerRef *)MEMORY[0x1E0C80C00];
  if (dword_1ECFE9AF0)
  {
    v37 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    v9 = a8;
  }
  if (a9)
  {
    FigDebugAssert3();
  }
  else
  {
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "settings"), "captureRequestIdentifier"), "isEqualToString:", self->_currentCaptureRequestIdentifier);
    if (a6 == 19
      || objc_msgSend((id)objc_msgSend(v9, "captureSettings"), "captureType") == 12
      || (objc_msgSend((id)objc_msgSend(v9, "captureSettings"), "captureFlags") & 0x80) != 0)
    {
      v16 = objc_msgSend(a3, "type", v26, v28);
      if (v16 == 5)
      {
        if (!_FigIsCurrentDispatchQueue())
        {
          v29 = v30;
          LODWORD(v27) = 0;
          FigDebugAssert3();
        }
        if (objc_msgSend((id)objc_msgSend(v9, "captureSettings", v27, v29), "captureType") == 12)
        {
          if (a4)
            CFRetain(a4);
          processorCoordinatorWorkerQueue = self->_processorCoordinatorWorkerQueue;
          v33[0] = MEMORY[0x1E0C809B0];
          v33[1] = 3221225472;
          v33[2] = __121__BWPhotonicEngineNode_processorController_didFinishProcessingBuffer_metadata_type_captureFrameFlags_processorInput_err___block_invoke;
          v33[3] = &unk_1E4921550;
          v33[4] = self;
          v33[5] = v9;
          v33[6] = a5;
          v33[7] = a4;
          v33[8] = a6;
          v33[9] = a7;
          block[0] = (CMAttachmentBearerRef)MEMORY[0x1E0C809B0];
          block[1] = (CMAttachmentBearerRef)3221225472;
          block[2] = __ubn_dispatch_async_block_invoke_0;
          block[3] = &unk_1E491ECB8;
          block[4] = v33;
          dispatch_async(processorCoordinatorWorkerQueue, block);
        }
      }
      else if (v16 == 6)
      {
        if (!_FigIsCurrentDispatchQueue())
        {
          v29 = v30;
          LODWORD(v27) = 0;
          FigDebugAssert3();
        }
        v17 = (void *)objc_msgSend(v9, "referenceFrame", v27, v29);
        if (a6 == 19 && !objc_msgSend(a5, "count"))
        {
          if (self->_smartStyleRenderingConfiguration && BWIsSmartStyleCapture(self->_currentStillImageSettings))
          {
            block[0] = 0;
            if (BWSampleBufferCreateAttachedMediaFromPixelBuffer((opaqueCMSampleBuffer *)v17, 0x1E4936818, a4, (CFTypeRef *)&self->_gainMapFormatDescription, 0, 0, 1, block))
            {
              FigDebugAssert3();
            }
            else
            {
              v24 = CMGetAttachment(v17, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
              v25 = BWStillImageProcessingFlagsForSampleBuffer(v17);
              -[BWPhotonicEngineNode _attemptPiecemealEncodingForGainMapSbuf:primaryImageMetadata:processingFlags:portType:]((id *)&self->super.super.isa, block[0], (uint64_t)v24, v25, (void *)objc_msgSend(v9, "portType"));
            }
            if (block[0])
              CFRelease(block[0]);
          }
        }
        else if (objc_msgSend((id)objc_msgSend(v9, "captureSettings"), "deliverDeferredPhotoProxyImage"))
        {
          if (a6 == 8)
          {
            if ((objc_msgSend((id)objc_msgSend(v9, "captureSettings"), "captureFlags") & 4) != 0)
            {
              v20 = &BWDeferredIntermediateTagSyntheticReferenceFrameMetadataByPortTypePrefix;
              v18 = a5;
              v19 = a5;
            }
            else
            {
              v18 = a5;
              v19 = (void *)CMGetAttachment(v17, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
              v20 = &BWDeferredIntermediateTagReferenceFrameMetadataByPortTypePrefix;
            }
            -[BWDeferredCaptureControllerInput addDictionary:tag:](self->_deferredCaptureControllerInput, "addDictionary:tag:", v19, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), *v20, objc_msgSend(v9, "portType")));
            a5 = v18;
          }
          if (a4
            && (a6 != 19
             || (objc_msgSend((id)objc_msgSend(v9, "captureStreamSettings"), "captureFlags") & 0x100000000) == 0))
          {
            -[BWPhotonicEngineNode _deferredCaptureAddBuffer:bufferType:captureFrameFlags:metadata:rawThumbnailsBuffer:rawThumbnailsMetadata:portType:]((uint64_t)self, (uint64_t)a4, a6, 0, (uint64_t)a5, 0, 0, (void *)objc_msgSend(v9, "portType"));
          }
        }
        else if (objc_msgSend((id)objc_msgSend(v9, "captureSettings"), "captureType") == 12)
        {
          v22 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_deepFusionProcessorInputByPortType, "objectForKeyedSubscript:", objc_msgSend(v9, "portType"));
          if (a6 == 8)
          {
            v23 = CMCopyDictionaryOfAttachments((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v17, 1u);
            objc_msgSend(v22, "setEvZeroReferenceFrameAttachments:", v23);
            CMSampleBufferGetPresentationTimeStamp(&v35, (CMSampleBufferRef)v17);
            v34 = v35;
            objc_msgSend(v22, "setEvZeroReferenceFramePTS:", &v34);

            a6 = 8;
          }
          objc_msgSend(v22, "addBuffer:metadata:bufferType:captureFrameFlags:", a4, a5, a6, a7);
        }
      }
    }
  }
}

void __121__BWPhotonicEngineNode_processorController_didFinishProcessingBuffer_metadata_type_captureFrameFlags_processorInput_err___block_invoke(uint64_t a1)
{
  const void *v2;

  objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "objectForKeyedSubscript:", objc_msgSend(*(id *)(a1 + 40), "portType")), "addBuffer:metadata:bufferType:captureFrameFlags:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
  v2 = *(const void **)(a1 + 56);
  if (v2)
    CFRelease(v2);
}

- (void)processorController:(id)a3 willProcessRedEyeReductionForProcessorInput:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  BWSoftISPProcessorControllerInput *v8;
  id v9;

  if (-[BWPhotonicEngineNode _isSWFRFlashCapture:]((unint64_t)self, (void *)objc_msgSend(a4, "stillImageSettings", a3)))
  {
    v6 = -[NSMutableDictionary objectForKeyedSubscript:](self->_swfrRawRedEyeReductionAuxImageByPortType, "objectForKeyedSubscript:", objc_msgSend(a4, "portType"));
    if (!v6
      || (v7 = v6,
          v8 = -[BWSoftISPProcessorControllerInput initWithSettings:portType:]([BWSoftISPProcessorControllerInput alloc], "initWithSettings:portType:", objc_msgSend(a4, "stillImageSettings"), objc_msgSend(a4, "portType")), v9 = -[BWPhotonicEngineNode _ubRERRouter](self), -[BWStillImageProcessorControllerInput addOutputSampleBufferRouter:forBufferTypes:](v8, "addOutputSampleBufferRouter:forBufferTypes:", v9, -[BWPhotonicEngineNode _bufferTypesForCaptureSettings:]((uint64_t)self, (void *)objc_msgSend((id)objc_msgSend(a4, "stillImageSettings"), "captureSettings"))), objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_softISPRemainingInputsByPortType, "objectForKeyedSubscript:", objc_msgSend(a4, "portType")), "addObject:", v8),
          LODWORD(v9) = -[BWPhotonicEngineNode _enqueueSoftISPInput:]((uint64_t)self, v8),
          v8,
          (_DWORD)v9))
    {
      objc_msgSend(-[BWStillImageProcessorCoordinator controllerForType:](self->_processorCoordinator, "controllerForType:", 4), "cancelProcessing");
    }
    else
    {
      -[BWSoftISPProcessorControllerInput addFrame:processingMode:](v8, "addFrame:processingMode:", v7, 2);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_swfrRawRedEyeReductionAuxImageByPortType, "setObject:forKeyedSubscript:", 0, objc_msgSend(a4, "portType"));
    }
  }
}

- (unint64_t)_isSWFRFlashCapture:(unint64_t)result
{
  if (result)
  {
    if (*(_QWORD *)(result + 584)
      && objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureType") == 2)
    {
      return ((unint64_t)objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureFlags") >> 3) & 1;
    }
    else
    {
      return 0;
    }
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
      if (objc_msgSend(a2, "deliverDeferredPhotoProxyImage")
        && (objc_msgSend(a2, "captureFlags") & 0x80) != 0)
      {
        v3 = &unk_1E4A02210;
      }
      else
      {
        v3 = &unk_1E4A02228;
      }
      break;
    case 2u:
    case 6u:
    case 7u:
      v3 = &unk_1E4A02240;
      break;
    case 0xAu:
      v3 = &unk_1E4A02258;
      break;
    case 0xBu:
      if ((objc_msgSend(a2, "captureFlags") & 0x800000000) != 0)
        v3 = &unk_1E4A02270;
      else
        v3 = &unk_1E4A02288;
      break;
    case 0xCu:
      if (objc_msgSend(a2, "deliverDeferredPhotoProxyImage"))
        v3 = &unk_1E4A022A0;
      else
        v3 = &unk_1E4A022B8;
      break;
    default:
      break;
  }
  if (objc_msgSend(a2, "deliverOriginalImage"))
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v3);
    objc_msgSend(v4, "addObject:", &unk_1E49FC720);
    return (id)objc_msgSend(v4, "copy");
  }
  return v3;
}

- (uint64_t)_enqueueSoftISPInput:(uint64_t)result
{
  uint64_t v2;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  if (result)
  {
    v4 = result;
    if (!_FigIsCurrentDispatchQueue())
    {
      v9 = v2;
      LODWORD(v8) = 0;
      FigDebugAssert3();
    }
    v5 = (void *)objc_msgSend(*(id *)(v4 + 272), "objectForKeyedSubscript:", objc_msgSend(a2, "portType", v8, v9));
    if (v5)
      v6 = (void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v5, "intValue") + 1);
    else
      v6 = &unk_1E49FC798;
    objc_msgSend(*(id *)(v4 + 272), "setObject:forKeyedSubscript:", v6, objc_msgSend(a2, "portType"));
    v7 = (void *)objc_msgSend(*(id *)(v4 + 168), "controllerForType:", 12);
    if (v7)
      return objc_msgSend(v7, "enqueueInputForProcessing:delegate:", a2, v4);
    else
      return 4294950488;
  }
  return result;
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
  v17 = __Block_byref_object_copy__41;
  v18 = __Block_byref_object_dispose__41;
  processorCoordinatorWorkerQueue = self->_processorCoordinatorWorkerQueue;
  v19 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __135__BWPhotonicEngineNode_adaptiveBracketingParametersForDigitalFlashMode_frameStatistics_stationary_sphereOffsetEnabled_detectedObjects___block_invoke;
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
  block[2] = __ubn_dispatch_sync_block_invoke_0;
  block[3] = &unk_1E491ECB8;
  block[4] = v10;
  dispatch_sync(processorCoordinatorWorkerQueue, block);
  v8 = (id)v15[5];
  _Block_object_dispose(&v14, 8);
  return v8;
}

id __135__BWPhotonicEngineNode_adaptiveBracketingParametersForDigitalFlashMode_frameStatistics_stationary_sphereOffsetEnabled_detectedObjects___block_invoke(uint64_t a1)
{
  id result;

  -[BWPhotonicEngineNode _setupProcessorCoordinator](*(BWPixelBufferPool **)(a1 + 32));
  result = (id)objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "controllerForType:", 6), "adaptiveBracketingParametersForDigitalFlashMode:frameStatistics:stationary:sphereOffsetEnabled:detectedObjects:", *(unsigned int *)(a1 + 64), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 68), *(unsigned __int8 *)(a1 + 69), *(_QWORD *)(a1 + 48));
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
  v5[2] = __68__BWPhotonicEngineNode_stopAdaptiveBracketingForSettings_withGroup___block_invoke;
  v5[3] = &unk_1E4920568;
  v5[4] = self;
  v6 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __ubn_dispatch_async_block_invoke_0;
  block[3] = &unk_1E491ECB8;
  block[4] = v5;
  dispatch_async(processorCoordinatorWorkerQueue, block);
}

uint64_t __68__BWPhotonicEngineNode_stopAdaptiveBracketingForSettings_withGroup___block_invoke(uint64_t a1)
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
  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 352), "allValues", 0);
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

id __100__BWPhotonicEngineNode_adaptiveBracketingDigitalFlashTotalIntegrationTimesProviderForPortType_wait___block_invoke(uint64_t a1)
{
  id result;

  -[BWPhotonicEngineNode _setupProcessorCoordinator](*(BWPixelBufferPool **)(a1 + 32));
  result = (id)objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "controllerForType:", 6), "adaptiveBracketingDigitalFlashTotalIntegrationTimesProviderForPortType:", *(_QWORD *)(a1 + 40));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = result;
  return result;
}

- (uint64_t)_inferenceOutputPixelBufferPoolForAttachedMediaKey:(uint64_t)result
{
  __CFString *v2;
  id *v3;
  int *v4;
  void *v5;

  if (!result)
    return result;
  v2 = a2;
  v3 = (id *)result;
  if (-[__CFString isEqualToString:](a2, "isEqualToString:", 0x1E4951638))
  {
    if (objc_msgSend(v3[86], "type") == 3)
    {
      v4 = &OBJC_IVAR___BWPhotonicEngineNode__deepZoomTransferEnhancedResolutionOutputPool;
      goto LABEL_7;
    }
    v2 = CFSTR("PrimaryFormat");
  }
  else if (-[__CFString isEqualToString:](v2, "isEqualToString:", 0x1E4951658))
  {
    v4 = &OBJC_IVAR___BWPhotonicEngineNode__stereoPhotoOutputPool;
LABEL_7:
    result = *(uint64_t *)((char *)v3 + *v4);
    if (result)
      return result;
  }
  v5 = (void *)objc_msgSend(v3[2], "mediaPropertiesForAttachedMediaKey:", v2);
  result = objc_msgSend(v5, "livePixelBufferPool");
  if (!result)
  {
    result = objc_msgSend(v5, "preparedPixelBufferPool");
    if (!result)
      return objc_msgSend(v3[65], "objectForKeyedSubscript:", v2);
  }
  return result;
}

- (id)preparedOutputPixelBufferPoolForAttachedMediaKey:(id)a3 format:(id)a4
{
  return (id)-[BWPhotonicEngineNode _inferenceOutputPixelBufferPoolForAttachedMediaKey:]((uint64_t)self, (__CFString *)a3);
}

- (uint64_t)_flushSoftISPOutputBufferPools
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    v8 = 0u;
    v9 = 0u;
    v6 = 0u;
    v7 = 0u;
    v2 = *(void **)(result + 256);
    result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    if (result)
    {
      v3 = result;
      v4 = *(_QWORD *)v7;
      do
      {
        v5 = 0;
        do
        {
          if (*(_QWORD *)v7 != v4)
            objc_enumerationMutation(v2);
          objc_msgSend((id)objc_msgSend(*(id *)(v1 + 256), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5++)), "flushToMinimumCapacity:", 0);
        }
        while (v3 != v5);
        result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
        v3 = result;
      }
      while (result);
    }
  }
  return result;
}

- (uint64_t)_flushUltraHighResolutionBufferPools
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = (void *)objc_msgSend(*(id *)(result + 288), "objectForKeyedSubscript:", &unk_1E49FC6A8);
    v6 = 0u;
    v7 = 0u;
    v8 = 0u;
    v9 = 0u;
    result = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    if (result)
    {
      v2 = result;
      v3 = *(_QWORD *)v7;
      do
      {
        v4 = 0;
        do
        {
          if (*(_QWORD *)v7 != v3)
            objc_enumerationMutation(v1);
          v5 = (void *)objc_msgSend(v1, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v4));
          if (v5)
            objc_msgSend(v5, "flushToMinimumCapacity:", 0);
          ++v4;
        }
        while (v2 != v4);
        result = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
        v2 = result;
      }
      while (result);
    }
  }
  return result;
}

- (uint64_t)_nrfProcessorInputNeededForSettings:(uint64_t)a3 portType:
{
  uint64_t v5;

  if (result)
  {
    v5 = result;
    result = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureStreamSettingsForPortType:", a3), "hasValidFrames");
    if ((_DWORD)result)
    {
      result = objc_msgSend(*(id *)(v5 + 120), "containsObject:", a3);
      if ((_DWORD)result)
      {
        if (objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureType") == 12
          && (objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "deliverDeferredPhotoProxyImage") & 1) == 0)
        {
          return objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "learnedNRStereoPhotoFrameFlag") != 0;
        }
        else
        {
          return -[BWPhotonicEngineNode _processingNeededForSettings:portType:](v5, a2, a3);
        }
      }
    }
  }
  return result;
}

- (uint64_t)_deepFusionProcessorInputNeededForSettings:(uint64_t)a3 portType:
{
  if (!a1
    || !objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureStreamSettingsForPortType:", a3), "hasValidFrames")|| !objc_msgSend(*(id *)(a1 + 120), "containsObject:", a3)|| objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureType") != 12|| (objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "deliverDeferredPhotoProxyImage") & 1) != 0)
  {
    return 0;
  }
  if (objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "learnedNRStereoPhotoFrameFlag"))
    return objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "masterPortType"), "isEqualToString:", a3);
  return -[BWPhotonicEngineNode _processingNeededForSettings:portType:](a1, a2, a3);
}

- (BOOL)_generateDisparityForSettings:(_BOOL8)result
{
  if (result)
    return *(_QWORD *)(result + 760)
        && (objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureFlags") & 0x800) != 0
        && (objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureFlags") & 0x200) == 0;
  return result;
}

void __73__BWPhotonicEngineNode__handleClientBracketFrameEmissionForSampleBuffer___block_invoke(uint64_t a1, CFTypeRef cf)
{
  __int128 v4;
  NSObject *v5;
  _QWORD v6[4];
  __int128 v7;
  CFTypeRef v8;
  _QWORD block[5];

  if (cf)
    CFRetain(cf);
  v4 = *(_OWORD *)(a1 + 32);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 784);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __73__BWPhotonicEngineNode__handleClientBracketFrameEmissionForSampleBuffer___block_invoke_2;
  v6[3] = &unk_1E491EC68;
  v7 = v4;
  v8 = cf;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __ubn_dispatch_async_block_invoke_0;
  block[3] = &unk_1E491ECB8;
  block[4] = v6;
  dispatch_async(v5, block);
}

void __73__BWPhotonicEngineNode__handleClientBracketFrameEmissionForSampleBuffer___block_invoke_2(_QWORD *a1)
{
  const void *v2;

  objc_msgSend((id)objc_msgSend(*(id *)(a1[4] + 800), "objectForKeyedSubscript:", a1[5]), "addSampleBuffer:", a1[6]);
  v2 = (const void *)a1[6];
  if (v2)
    CFRelease(v2);
}

void __73__BWPhotonicEngineNode__handleClientBracketFrameEmissionForSampleBuffer___block_invoke_135(uint64_t a1)
{
  const void *v2;

  objc_msgSend(*(id *)(a1 + 32), "addSampleBuffer:", *(_QWORD *)(a1 + 40));
  v2 = *(const void **)(a1 + 40);
  if (v2)
    CFRelease(v2);
}

void __82__BWPhotonicEngineNode__emitOrEnqueueFusionReferenceFrameIfNeededForSampleBuffer___block_invoke(uint64_t a1, CFTypeRef cf, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  NSObject *v8;
  _QWORD v9[7];
  _QWORD block[5];

  if (cf)
    CFRetain(cf);
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(NSObject **)(v7 + 784);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __82__BWPhotonicEngineNode__emitOrEnqueueFusionReferenceFrameIfNeededForSampleBuffer___block_invoke_2;
  v9[3] = &unk_1E491EC68;
  v9[5] = v7;
  v9[6] = cf;
  v9[4] = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __ubn_dispatch_async_block_invoke_0;
  block[3] = &unk_1E491ECB8;
  block[4] = v9;
  dispatch_async(v8, block);
}

void __82__BWPhotonicEngineNode__emitOrEnqueueFusionReferenceFrameIfNeededForSampleBuffer___block_invoke_2(uint64_t a1)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  const void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (dword_1ECFE9AF0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 768), "addSampleBuffer:", *(_QWORD *)(a1 + 48), v4, v5);
  v3 = *(const void **)(a1 + 48);
  if (v3)
    CFRelease(v3);
}

void __91__BWPhotonicEngineNode__processRawErrorRecoveryFrameWithNRFProcessorInput_failureMetadata___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  void *v9;
  void *v10;
  unint64_t v11;
  char v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  if (!_FigIsCurrentDispatchQueue())
  {
    v20 = v5;
    LODWORD(v18) = 0;
    FigDebugAssert3();
  }
  v9 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "controllerForType:", 6, v18, v20);
  if ((_DWORD)a5)
    goto LABEL_9;
  objc_msgSend(*(id *)(a1 + 40), "setProcessedRawErrorRecoveryFrame:", a2);
  v11 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(a1 + 40);
  v12 = -[BWPhotonicEngineNode _isInferenceInputImageRequiredForSettings:portType:](v11, (void *)objc_msgSend(v10, "stillImageSettings"), objc_msgSend(v10, "portType"));
  v13 = *(_QWORD *)(a1 + 32);
  v14 = (void *)objc_msgSend(*(id *)(a1 + 40), "stillImageSettings");
  if (v13)
  {
    if (*(_QWORD *)(v13 + 808))
      LOBYTE(v13) = BWIsSmartStyleCapture(v14);
    else
      LOBYTE(v13) = 0;
  }
  HIBYTE(v19) = -[BWPhotonicEngineNode _inferencesRequiredByProcessorControllersForSettings:](*(_QWORD *)(a1 + 32), (void *)objc_msgSend(*(id *)(a1 + 40), "stillImageSettings"));
  BYTE6(v19) = v13;
  BYTE5(v19) = v12;
  BYTE4(v19) = 0;
  LODWORD(v19) = 0;
  a5 = objc_msgSend(v9, "enqueueInputForProcessing:delegate:processErrorRecoveryFrame:processOriginalImage:processToneMapping:processInferenceInputImage:clientBracketSequenceNumber:processSemanticRendering:provideInferenceInputImageForProcessing:processSmartStyleRenderingInput:inferencesAvailable:", v10, v11, 1, 0, 0, 0, v19);
  if ((_DWORD)a5)
  {
LABEL_9:
    objc_msgSend(*(id *)(a1 + 32), "processorController:didFinishProcessingInput:err:", v9, *(_QWORD *)(a1 + 40), a5);
    v15 = *(_QWORD *)(a1 + 32);
    v16 = objc_msgSend(*(id *)(a1 + 40), "stillImageSettings");
    v17 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "description");
    -[BWPhotonicEngineNode _emitError:stillImageSettings:metadata:description:](v15, a5, v16, v17);
  }
}

- (unint64_t)_isInferenceInputImageRequiredForSettings:(uint64_t)a3 portType:
{
  unint64_t v5;

  if (result)
  {
    v5 = result;
    if (objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "learnedNRStereoPhotoFrameFlag"))
    {
      return objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "masterPortType"), "isEqualToString:", a3) ^ 1;
    }
    else
    {
      result = -[BWPhotonicEngineNode _inferenceGenerationRequiredForSettings:](v5, a2);
      if ((_DWORD)result)
      {
        if (*(_QWORD *)(v5 + 624)
          && (objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureFlags") & 0x10000) != 0)
        {
          return -[BWPhotonicEngineNode _isSWFRFlashCapture:](v5, a2);
        }
        else
        {
          return 1;
        }
      }
    }
  }
  return result;
}

- (uint64_t)_inferencesRequiredByProcessorControllersForSettings:(uint64_t)result
{
  unint64_t v3;
  int v4;
  _BOOL4 v5;
  unint64_t v6;
  _BOOL4 v7;

  if (result)
  {
    v3 = result;
    v4 = -[BWPhotonicEngineNode _isSemanticRenderingCapture:](result, a2);
    if (-[BWPhotonicEngineNode _isSWFRFlashCapture:](v3, a2))
      v5 = objc_msgSend((id)objc_msgSend(*(id *)(v3 + 472), "swfrInferenceMasks"), "count") != 0;
    else
      v5 = 0;
    if (*(_QWORD *)(v3 + 624))
      v6 = ((unint64_t)objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureFlags") >> 16) & 1;
    else
      LODWORD(v6) = 0;
    v7 = -[BWPhotonicEngineNode _isSemanticStylesCaptureNeedingInferencesWithSettings:](v3, a2);
    return v4 | v5 | v6 | v7 | -[BWPhotonicEngineNode _isSmartStylesCaptureNeedingInferencesWithSettings:](v3, a2);
  }
  return result;
}

- (uint64_t)_gdcSourceForSettings:(uint64_t)a3 portType:
{
  unint64_t v5;
  void *v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  int v10;
  int v11;
  char v12;
  int v13;
  BOOL v14;
  unsigned int v15;

  if (result)
  {
    v5 = result;
    result = objc_msgSend((id)objc_msgSend(*(id *)(result + 640), "portTypesWithGeometricDistortionCorrectionEnabled"), "containsObject:", a3);
    if ((_DWORD)result)
    {
      v6 = (void *)objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureStreamSettingsForPortType:", a3);
      v7 = *(_QWORD *)(v5 + 248);
      v8 = objc_msgSend(v6, "captureFlags");
      v9 = objc_msgSend(v6, "captureFlags");
      v10 = objc_msgSend(v6, "captureType");
      v11 = -[BWPhotonicEngineNode _isSWFRFlashCapture:](v5, a2);
      v12 = objc_msgSend(v6, "captureFlags");
      v13 = -[BWPhotonicEngineNodeConfiguration stillImageGDCSourceMode](*(_QWORD *)(v5 + 112));
      v14 = !v7 || v13 == 1;
      result = v14 ? 2 : 0;
      if (!v14 && (v8 & 4) != 0)
      {
        if (v12 < 0)
          v15 = 2;
        else
          v15 = 3;
        if (v11)
          v15 = 2;
        if (v10 == 12)
          v15 = 2;
        if ((v9 & 0x800000000) != 0)
          return 2;
        else
          return v15;
      }
    }
  }
  return result;
}

- (uint64_t)_handleDeferredCaptureProxyOrErrorRecoverySampleBuffer:(uint64_t)result bufferType:(CFTypeRef)cf
{
  uint64_t v2;
  const void *v4;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v6;

  if (result)
  {
    v2 = result;
    if (*(_QWORD *)(result + 904) && cf)
    {
      v4 = *(const void **)(result + 912);
      if (v4)
      {
        CFRelease(v4);
        *(_QWORD *)(v2 + 912) = 0;
      }
      *(_QWORD *)(v2 + 912) = CFRetain(cf);
      if (dword_1ECFE9AF0)
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      objc_msgSend(*(id *)(v2 + 904), "proxyReadyWithFPNREnabled:", objc_msgSend((id)objc_msgSend((id)CMGetAttachment(cf, (CFStringRef)*MEMORY[0x1E0D05CB0], 0), "objectForKeyedSubscript:", *MEMORY[0x1E0D05E80]), "BOOLValue"));
      return 0;
    }
    else
    {
      v6 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      return 4294954516;
    }
  }
  return result;
}

- (void)_waitForAndMergeInferencesIfNeededForSampleBuffer:(void *)a3 processorInput:
{
  uint64_t v3;
  char v7;
  int v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD block[7];

  if (a1)
  {
    if (!_FigIsNotCurrentDispatchQueue())
    {
      v12 = v3;
      LODWORD(v11) = 0;
      FigDebugAssert3();
    }
    if ((objc_msgSend((id)CMGetAttachment(a2, CFSTR("NonProcessedReferenceFrame"), 0), "BOOLValue") & 1) == 0
      && (-[BWPhotonicEngineNodeConfiguration generateInferencesForSemanticProcessingIfNeeded](a1[14])
       || objc_msgSend((id)a1[14], "deferredPhotoProcessorEnabled")))
    {
      v7 = -[BWPhotonicEngineNode _isSemanticRenderingCapture:]((uint64_t)a1, (void *)objc_msgSend(a3, "stillImageSettings", v11, v12));
      v8 = -[BWPhotonicEngineNode _provideInferenceAttachedMediaWithSettings:]((uint64_t)a1, (void *)objc_msgSend(a3, "stillImageSettings"));
      if ((v7 & 1) != 0 || v8)
      {
        if (-[BWPhotonicEngineNodeConfiguration generateInferencesForSemanticProcessingIfNeeded](a1[14]))
        {
          v9 = a1[62];
          if (!v9)
            return;
          dispatch_group_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
        }
        v10 = a1[61];
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __89__BWPhotonicEngineNode__waitForAndMergeInferencesIfNeededForSampleBuffer_processorInput___block_invoke;
        block[3] = &unk_1E491EC68;
        block[5] = a1;
        block[6] = a2;
        block[4] = a3;
        dispatch_sync(v10, block);
      }
    }
  }
}

- (id)_ubInferenceInputRouter
{
  _QWORD v1[5];

  if (result)
  {
    v1[0] = MEMORY[0x1E0C809B0];
    v1[1] = 3221225472;
    v1[2] = __47__BWPhotonicEngineNode__ubInferenceInputRouter__block_invoke;
    v1[3] = &unk_1E4923398;
    v1[4] = result;
    return (id)objc_msgSend(v1, "copy");
  }
  return result;
}

- (id)_standardNROutputRouterWithExpectedQueue:(id)result
{
  _QWORD v2[6];

  if (result)
  {
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __65__BWPhotonicEngineNode__standardNROutputRouterWithExpectedQueue___block_invoke;
    v2[3] = &unk_1E4923460;
    v2[4] = a2;
    v2[5] = result;
    return (id)objc_msgSend(v2, "copy");
  }
  return result;
}

- (uint64_t)_setupProcessingStateForJasperDisparityIfNeededWithSettings:(void *)a3 processingPlan:
{
  uint64_t v3;
  uint64_t v6;
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
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  id obj;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  id v35;
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
  _QWORD v48[6];
  _BYTE v49[128];
  void *v50;
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v6 = result;
    if (!_FigIsCurrentDispatchQueue())
    {
      v26 = v3;
      LODWORD(v25) = 0;
      FigDebugAssert3();
    }
    if ((objc_msgSend((id)objc_msgSend(a2, "captureSettings", v25, v26), "captureFlags") & 0x200) != 0
      && *(_QWORD *)(v6 + 880))
    {
      v7 = objc_msgSend(*(id *)(v6 + 168), "controllerForType:", 13);
      if (v7)
      {
        v8 = (void *)v7;
        v35 = -[BWPhotonicEngineNode _bufferTypesForCaptureSettings:](v6, (void *)objc_msgSend(a2, "captureSettings"));
        v48[0] = MEMORY[0x1E0C809B0];
        v48[1] = 3221225472;
        v48[2] = __99__BWPhotonicEngineNode__setupProcessingStateForJasperDisparityIfNeededWithSettings_processingPlan___block_invoke;
        v48[3] = &unk_1E4923460;
        v27 = v8;
        v28 = v6;
        v48[4] = v6;
        v48[5] = v8;
        v33 = (id)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v44 = 0u;
        v45 = 0u;
        v46 = 0u;
        v47 = 0u;
        obj = (id)objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "portTypes");
        v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
        if (v32)
        {
          v30 = *(_QWORD *)v45;
          v31 = a2;
          do
          {
            v9 = 0;
            do
            {
              if (*(_QWORD *)v45 != v30)
                objc_enumerationMutation(obj);
              v34 = v9;
              v10 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v9);
              v11 = -[BWJasperDisparityProcessorInput initWithSettings:portType:]([BWJasperDisparityProcessorInput alloc], "initWithSettings:portType:", a2, v10);
              v40 = 0u;
              v41 = 0u;
              v42 = 0u;
              v43 = 0u;
              v12 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v40, v51, 16);
              if (v12)
              {
                v13 = v12;
                v14 = *(_QWORD *)v41;
                do
                {
                  for (i = 0; i != v13; ++i)
                  {
                    if (*(_QWORD *)v41 != v14)
                      objc_enumerationMutation(v35);
                    v16 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
                    v17 = (int)objc_msgSend(v16, "intValue");
                    v50 = v16;
                    v18 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v50, 1);
                    v19 = (void *)objc_msgSend(a3, "lastAddedInputForSequenceNumber:portType:bufferType:", 0, v10, v17);
                    if (v19)
                    {
                      v20 = v19;
                      -[BWStillImageProcessorControllerInput addOutputSampleBufferRouter:forBufferTypes:](v11, "addOutputSampleBufferRouter:forBufferTypes:", objc_msgSend((id)objc_msgSend(v19, "outputSampleBufferRouterForBufferType:", v17), "outputSampleBufferRouter"), v18);
                      objc_msgSend(a3, "addInput:sequenceNumber:portType:bufferType:", v11, 0, v10, v17);
                      objc_msgSend(v20, "addOutputSampleBufferRouter:forBufferTypes:", v48, v18);
                    }
                  }
                  v13 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v40, v51, 16);
                }
                while (v13);
              }
              a2 = v31;
              if (objc_msgSend(v10, "isEqualToString:", objc_msgSend((id)objc_msgSend(v31, "captureSettings"), "masterPortType")))objc_msgSend(v33, "insertObject:atIndex:", v11, 0);
              else
                objc_msgSend(v33, "addObject:", v11);
              v9 = v34 + 1;
            }
            while (v34 + 1 != v32);
            v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
          }
          while (v32);
        }
        v38 = 0u;
        v39 = 0u;
        v36 = 0u;
        v37 = 0u;
        result = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v36, v49, 16);
        if (result)
        {
          v21 = result;
          v22 = *(_QWORD *)v37;
          do
          {
            v23 = 0;
            do
            {
              if (*(_QWORD *)v37 != v22)
                objc_enumerationMutation(v33);
              v24 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v23);
              objc_msgSend(v27, "enqueueInputForProcessing:delegate:", v24, v28);
              objc_msgSend(*(id *)(v28 + 888), "setObject:forKeyedSubscript:", v24, objc_msgSend(v24, "portType"));
              ++v23;
            }
            while (v21 != v23);
            result = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v36, v49, 16);
            v21 = result;
          }
          while (result);
        }
      }
      else
      {
        return 4294894081;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (uint64_t)_setupProcessingStateForIntelligentDistortionCorrectionIfNeededWithSettings:(uint64_t)a3 sequenceNumber:(uint64_t)a4 portType:(void *)a5 processingPlan:
{
  uint64_t v5;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  unsigned int v14;
  int v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  BWIntelligentDistortionCorrectionProcessorInput *v19;
  int v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  void *v39;
  void *v40;
  uint64_t v41;
  unsigned int v42;
  int *v43;
  void *v44;
  uint64_t v45;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  unsigned int v54;
  int v55;
  id obj;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _QWORD v69[7];
  void *v70;
  _BYTE v71[128];
  _BYTE v72[128];
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v10 = a1;
  if (!_FigIsCurrentDispatchQueue())
  {
    v49 = v5;
    LODWORD(v48) = 0;
    FigDebugAssert3();
  }
  if (!*(_QWORD *)(v10 + 640))
    goto LABEL_68;
  v11 = objc_msgSend(*(id *)(v10 + 168), "controllerForType:", 7);
  if (!v11)
  {
    v53 = 0;
    v42 = 0;
    v45 = 4294894081;
    goto LABEL_65;
  }
  v12 = (void *)v11;
  v13 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureStreamSettingsForPortType:", a4), "captureFlags");
  v14 = objc_msgSend((id)objc_msgSend(a2, "processingSettings"), "processIntelligentDistortionCorrection")
      ? objc_msgSend((id)v10, "idcSupportedForCaptureType:captureFlags:portType:", objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureType"), v13, a4): 0;
  v15 = -[BWPhotonicEngineNode _gdcSourceForSettings:portType:](v10, a2, a4);
  HIDWORD(v53) = v15 == 2;
  if ((v14 & 1) != 0 || v15 == 2)
  {
    v54 = v14;
    v55 = v15;
    v16 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array", v48, v49);
    obj = -[BWPhotonicEngineNode _errorRecoveryBufferTypesForBufferTypes:]((id)v10, v16);
    v17 = objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "learnedNRStereoPhotoFrameFlag");
    LODWORD(v53) = v17 != 0;
    if (v17)
    {
      objc_msgSend(v16, "addObject:", &unk_1E49FC738);
    }
    else
    {
      objc_msgSend(v16, "addObjectsFromArray:", -[BWPhotonicEngineNode _bufferTypesExcludingErrorRecoveryTypesForCaptureSettings:]((id)v10, (void *)objc_msgSend(a2, "captureSettings")));
      if (v55 == 2)
        objc_msgSend(v16, "addObjectsFromArray:", obj);
    }
    v69[0] = MEMORY[0x1E0C809B0];
    v69[1] = 3221225472;
    v69[2] = __139__BWPhotonicEngineNode__setupProcessingStateForIntelligentDistortionCorrectionIfNeededWithSettings_sequenceNumber_portType_processingPlan___block_invoke;
    v69[3] = &unk_1E4923438;
    v69[4] = v10;
    v69[5] = a4;
    v69[6] = obj;
    if (objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureType") == 7
      && objc_msgSend(*(id *)(v10 + 648), "objectForKeyedSubscript:", a4))
    {
      v18 = v10;
      v19 = (BWIntelligentDistortionCorrectionProcessorInput *)objc_msgSend(*(id *)(v10 + 648), "objectForKeyedSubscript:", a4);
      v20 = objc_msgSend((id)objc_msgSend(*(id *)(v18 + 656), "objectForKeyedSubscript:", a4), "intValue");
      objc_msgSend(*(id *)(v18 + 656), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v20 + 1)), a4);
      goto LABEL_53;
    }
    v51 = a2;
    v52 = v10;
    if (!objc_msgSend((id)objc_msgSend(a2, "requestedSettings"), "constantColorEnabled")
      || !objc_msgSend((id)objc_msgSend(a2, "requestedSettings"), "constantColorFallbackPhotoDeliveryEnabled")|| !objc_msgSend(*(id *)(v10 + 648), "objectForKeyedSubscript:", a4))
    {
      v19 = -[BWIntelligentDistortionCorrectionProcessorInput initWithSettings:portType:]([BWIntelligentDistortionCorrectionProcessorInput alloc], "initWithSettings:portType:", a2, a4);
      -[BWIntelligentDistortionCorrectionProcessorInput setProcessIntelligentDistortionCorrection:](v19, "setProcessIntelligentDistortionCorrection:", v14);
      -[BWIntelligentDistortionCorrectionProcessorInput setProcessGeometricDistortionCorrection:](v19, "setProcessGeometricDistortionCorrection:", v55 == 2);
      -[BWIntelligentDistortionCorrectionProcessorInput setApplyZoom:](v19, "setApplyZoom:", 1);
      if (v17)
        -[BWIntelligentDistortionCorrectionProcessorInput setUseBilinearInterpolation:](v19, "setUseBilinearInterpolation:", 1);
      v63 = 0u;
      v64 = 0u;
      v61 = 0u;
      v62 = 0u;
      v29 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v61, v72, 16);
      if (v29)
      {
        v30 = v29;
        v31 = *(_QWORD *)v62;
        do
        {
          for (i = 0; i != v30; ++i)
          {
            if (*(_QWORD *)v62 != v31)
              objc_enumerationMutation(v16);
            v33 = (int)objc_msgSend(*(id *)(*((_QWORD *)&v61 + 1) + 8 * i), "intValue");
            v34 = (void *)objc_msgSend(a5, "lastAddedInputForSequenceNumber:portType:bufferType:", a3, a4, v33);
            if (v34)
            {
              if (!ubn_insertOutputRouterForInputAfterPreviousInputForBufferType_0((uint64_t)v69, v19, v34, v33))goto LABEL_64;
              objc_msgSend(a5, "addInput:sequenceNumber:portType:bufferType:", v19, a3, a4, v33);
            }
          }
          v30 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v61, v72, 16);
        }
        while (v30);
      }
      v50 = v12;
      if (v55 != 2)
      {
        v59 = 0u;
        v60 = 0u;
        v57 = 0u;
        v58 = 0u;
        v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v71, 16);
        if (v35)
        {
          v36 = v35;
          v37 = *(_QWORD *)v58;
          do
          {
            for (j = 0; j != v36; ++j)
            {
              if (*(_QWORD *)v58 != v37)
                objc_enumerationMutation(obj);
              v39 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * j);
              v40 = (void *)objc_msgSend(a5, "lastAddedInputForSequenceNumber:portType:bufferType:", a3, a4, (int)objc_msgSend(v39, "intValue"));
              v70 = v39;
              objc_msgSend(v40, "addBypassedProcessorType:forBufferTypes:", 7, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v70, 1));
            }
            v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v71, 16);
          }
          while (v36);
        }
      }
      v18 = v52;
      objc_msgSend(*(id *)(v52 + 648), "setObject:forKeyedSubscript:", v19, a4);
      objc_msgSend(*(id *)(v52 + 656), "setObject:forKeyedSubscript:", &unk_1E49FC798, a4);

      a2 = v51;
LABEL_52:
      v12 = v50;
      goto LABEL_53;
    }
    v21 = v10;
    v19 = (BWIntelligentDistortionCorrectionProcessorInput *)objc_msgSend(*(id *)(v10 + 648), "objectForKeyedSubscript:", a4);
    v22 = objc_msgSend((id)objc_msgSend(*(id *)(v21 + 656), "objectForKeyedSubscript:", a4), "intValue");
    objc_msgSend(*(id *)(v21 + 656), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v22 + 1)), a4);
    v67 = 0u;
    v68 = 0u;
    v65 = 0u;
    v66 = 0u;
    v23 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v65, v73, 16);
    if (!v23)
    {
      v18 = v52;
LABEL_53:
      v41 = objc_msgSend(v12, "enqueueInputForProcessing:delegate:", v19, v18);
      v10 = v18;
      v42 = v54;
      v43 = &OBJC_IVAR___BWVisionInferenceProvider__executesRequestsIndividually;
      if ((_DWORD)v41)
      {
        v45 = v41;
      }
      else
      {
        v44 = *(void **)(v18 + 904);
        if (v44)
        {
          objc_msgSend((id)objc_msgSend(v44, "pipelineParameters"), "setIntelligentDistortionCorrectionEnabled:", v54);
          objc_msgSend((id)objc_msgSend(*(id *)(v18 + 904), "pipelineParameters"), "setGeometricDistortionCorrectionEnabled:", v55 == 2);
          objc_msgSend((id)objc_msgSend(*(id *)(v18 + 904), "pipelineParameters"), "setDistortionCorrectionVersion:", objc_msgSend(*(id *)(v18 + 640), "intelligentDistortionCorrectionVersion"));
          objc_msgSend((id)objc_msgSend(*(id *)(v18 + 904), "pipelineParameters"), "setDcProcessingWithDepthSupported:", -[BWPhotonicEngineNodeConfiguration dcProcessingWithDepthSupported](*(_QWORD *)(v18 + 112)));
          objc_msgSend((id)objc_msgSend(*(id *)(v18 + 904), "pipelineParameters"), "setStillImageGDCSourceMode:", -[BWPhotonicEngineNodeConfiguration stillImageGDCSourceMode](*(_QWORD *)(v18 + 112)));
        }
        v45 = 0;
      }
      goto LABEL_57;
    }
    v24 = v23;
    v50 = v12;
    v25 = *(_QWORD *)v66;
LABEL_23:
    v26 = 0;
    while (1)
    {
      if (*(_QWORD *)v66 != v25)
        objc_enumerationMutation(v16);
      v27 = (int)objc_msgSend(*(id *)(*((_QWORD *)&v65 + 1) + 8 * v26), "intValue");
      v28 = (void *)objc_msgSend(a5, "lastAddedInputForSequenceNumber:portType:bufferType:", a3, a4, v27);
      if (v28)
      {
        if (!ubn_insertOutputRouterForInputAfterPreviousInputForBufferType_0((uint64_t)v69, v19, v28, v27))
          break;
      }
      if (v24 == ++v26)
      {
        v24 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v65, v73, 16);
        if (v24)
          goto LABEL_23;
        a2 = v51;
        v18 = v52;
        goto LABEL_52;
      }
    }
LABEL_64:
    v45 = 4294954516;
    a2 = v51;
    v10 = v52;
    v42 = v54;
  }
  else
  {
LABEL_68:
    v53 = 0;
    v42 = 0;
    v45 = 0;
  }
LABEL_65:
  v43 = &OBJC_IVAR___BWVisionInferenceProvider__executesRequestsIndividually;
LABEL_57:
  if (*(_QWORD *)(v10 + v43[249])
    && (objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureFlags") & 0x4000000000) != 0)
  {
    objc_msgSend((id)objc_msgSend(*(id *)(v10 + v43[249]), "pipelineParameters"), "setDistortionCorrectionVersion:", objc_msgSend(*(id *)(v10 + 640), "intelligentDistortionCorrectionVersion"));
    objc_msgSend((id)objc_msgSend(*(id *)(v10 + v43[249]), "pipelineParameters"), "setStillImageGDCSourceMode:", -[BWPhotonicEngineNodeConfiguration stillImageGDCSourceMode](*(_QWORD *)(v10 + 112)));
  }
  if (((v42 | HIDWORD(v53)) & 1) != 0 || (((_DWORD)v45 == 0) & ~(_DWORD)v53) == 0)
  {
    if (dword_1ECFE9AF0)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  return v45;
}

- (uint64_t)_setupProcessingStateForScalerIfNeededWithSettings:(uint64_t)a3 sequenceNumber:(void *)a4 portType:(void *)a5 processingPlan:
{
  uint64_t v5;
  uint64_t v10;
  int v11;
  BOOL v12;
  uint64_t v13;
  void *v14;
  BWScalerProcessorControllerInput *v15;
  int v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[7];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v10 = result;
    if (!_FigIsCurrentDispatchQueue())
    {
      v25 = v5;
      LODWORD(v24) = 0;
      FigDebugAssert3();
    }
    if (*(_QWORD *)(v10 + 736)
      && ((v11 = -[BWPhotonicEngineNode _resolvedQSubResolutionFlavorForCaptureSettings:portType:](v10, (void *)objc_msgSend(a2, "captureSettings"), a4), *(_QWORD *)(v10 + 736))? (v12 = v11 == 1): (v12 = 0), v12))
    {
      v13 = objc_msgSend(*(id *)(v10 + 168), "controllerForType:", 18);
      if (v13)
      {
        v14 = (void *)v13;
        v31[0] = MEMORY[0x1E0C809B0];
        v31[1] = 3221225472;
        v31[2] = __114__BWPhotonicEngineNode__setupProcessingStateForScalerIfNeededWithSettings_sequenceNumber_portType_processingPlan___block_invoke;
        v31[3] = &unk_1E4923438;
        v31[4] = v10;
        v31[5] = a4;
        v31[6] = a2;
        if (objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureType") == 7
          && objc_msgSend(*(id *)(v10 + 744), "objectForKeyedSubscript:", a4))
        {
          v15 = (BWScalerProcessorControllerInput *)objc_msgSend(*(id *)(v10 + 744), "objectForKeyedSubscript:", a4);
          v16 = objc_msgSend((id)objc_msgSend(*(id *)(v10 + 752), "objectForKeyedSubscript:", a4), "intValue");
          objc_msgSend(*(id *)(v10 + 752), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v16 + 1)), a4);
        }
        else
        {
          v26 = v14;
          v15 = -[BWScalerProcessorControllerInput initWithSettings:portType:]([BWScalerProcessorControllerInput alloc], "initWithSettings:portType:", a2, a4);
          v27 = 0u;
          v28 = 0u;
          v29 = 0u;
          v30 = 0u;
          v17 = -[BWPhotonicEngineNode _bufferTypesForCaptureSettings:](v10, (void *)objc_msgSend(a2, "captureSettings"));
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
          if (v18)
          {
            v19 = v18;
            v20 = *(_QWORD *)v28;
            while (2)
            {
              for (i = 0; i != v19; ++i)
              {
                if (*(_QWORD *)v28 != v20)
                  objc_enumerationMutation(v17);
                v22 = (int)objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "intValue", v24, v25);
                v23 = (void *)objc_msgSend(a5, "lastAddedInputForSequenceNumber:portType:bufferType:", a3, a4, v22);
                if (v23)
                {
                  if (!ubn_insertOutputRouterForInputAfterPreviousInputForBufferType_0((uint64_t)v31, v15, v23, v22))return 4294954516;
                  objc_msgSend(a5, "addInput:sequenceNumber:portType:bufferType:", v15, a3, a4, v22);
                }
              }
              v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
              if (v19)
                continue;
              break;
            }
          }
          objc_msgSend(*(id *)(v10 + 744), "setObject:forKeyedSubscript:", v15, a4, v24);
          objc_msgSend(*(id *)(v10 + 752), "setObject:forKeyedSubscript:", &unk_1E49FC798, a4);

          v14 = v26;
        }
        return objc_msgSend(v14, "enqueueInputForProcessing:delegate:", v15, v10, v24);
      }
      else
      {
        FigDebugAssert3();
        return 4294894081;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
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
    if ((int)-[BWPhotonicEngineNodeConfiguration semanticRenderingVersion](*(_QWORD *)(v3 + 112)) < 1)
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

- (uint64_t)_isSmartStylesCaptureNeedingInferencesWithSettings:(uint64_t)result
{
  uint64_t v3;
  uint64_t v4;
  unsigned int v5;
  unint64_t v6;
  unsigned int v7;

  if (result)
  {
    v3 = result;
    v4 = objc_msgSend((id)objc_msgSend(a2, "requestedSettings"), "smartStyle");
    v5 = objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureType");
    v6 = objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureFlags");
    if (v5 > 0xC || (v7 = 1, ((1 << v5) & 0x1404) == 0))
    {
      if (v5 == 11)
        v7 = 1;
      else
        v7 = (v6 >> 7) & 1;
    }
    result = -[BWPhotonicEngineNodeConfiguration smartStyleRenderingVersion](*(_QWORD *)(v3 + 112));
    if ((_DWORD)result)
    {
      if (v4)
        return v7;
      else
        return 0;
    }
  }
  return result;
}

- (BOOL)_isSemanticStylesCaptureNeedingInferencesWithSettings:(_BOOL8)result
{
  uint64_t v3;
  _BOOL4 v4;
  int v5;
  int v6;
  int v7;

  if (result)
  {
    v3 = result;
    objc_msgSend(a2, "requestedSettings");
    objc_opt_class();
    v4 = (objc_opt_isKindOfClass() & 1) != 0
      && objc_msgSend((id)objc_msgSend(a2, "requestedSettings"), "semanticStyle") != 0;
    v5 = -[BWPhotonicEngineNode _isSemanticRenderingCapture:](v3, a2);
    v6 = objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureType");
    result = -[BWPhotonicEngineNodeConfiguration semanticStyleRenderingEnabled](*(_QWORD *)(v3 + 112));
    if (result)
    {
      if (v6 == 2)
        v7 = 1;
      else
        v7 = v5;
      return v4 & v7;
    }
  }
  return result;
}

- (uint64_t)_isDemosaicedRawCaptureNeedingInferencesWithSettigs:(uint64_t)a1
{
  if (a1
    && objc_msgSend((id)objc_msgSend(a2, "processingSettings"), "provideDemosaicedRaw")
    && objc_msgSend((id)objc_msgSend((id)-[BWPhotonicEngineNodeConfiguration providedInferenceAttachedMediaByMode](*(_QWORD *)(a1 + 112)), "objectForKeyedSubscript:", &unk_1E49FC6D8), "count")&& -[BWPhotonicEngineNodeConfiguration inferenceMainImageDownscalingFactor](*(_QWORD *)(a1 + 112)) != 0.0)
  {
    return -[BWPhotonicEngineNode _isSemanticRenderingCapture:](a1, a2);
  }
  else
  {
    return 0;
  }
}

- (uint64_t)_isDepthCaptureNeedingPersonSegmentationMasksWithSettings:(uint64_t)a1
{
  if (a1
    && objc_msgSend((id)objc_msgSend((id)-[BWPhotonicEngineNodeConfiguration providedInferenceAttachedMediaByMode](*(_QWORD *)(a1 + 112)), "objectForKeyedSubscript:", &unk_1E49FC6A8), "count")&& (objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureFlags") & 0x800) != 0)
  {
    return objc_msgSend((id)objc_msgSend(a2, "requestedSettings"), "depthDataFiltered");
  }
  else
  {
    return 0;
  }
}

- (uint64_t)_inferenceGenerationRequiredForSettings:(uint64_t)result
{
  uint64_t v3;
  int v4;

  if (result)
  {
    v3 = result;
    result = -[BWPhotonicEngineNodeConfiguration generateInferencesForSemanticProcessingIfNeeded](*(_QWORD *)(result + 112));
    if ((_DWORD)result)
    {
      v4 = -[BWPhotonicEngineNode _inferencesRequiredByProcessorControllersForSettings:](v3, a2);
      return v4 | -[BWPhotonicEngineNode _provideInferenceAttachedMediaWithSettings:](v3, a2);
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
    v4 = (void *)-[BWPhotonicEngineNodeConfiguration providedInferenceAttachedMediaByMode](*(_QWORD *)(result + 112));
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
          if ((-[BWPhotonicEngineNode _provideInferencesForAttachedMediaMode:settings:](v3, objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7), "intValue", (_QWORD)v8), a2) & 1) != 0)return 1;
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

- (unint64_t)_resolvedZoomBasedQSubDimensionsWithSourceZoomBasedQSubDimensions:(unint64_t)a3 standardSoftISPOutputDimensions:
{
  int v3;
  unint64_t v6;
  unint64_t v7;
  double v8;
  unint64_t v9;
  unint64_t v10;

  if (a1)
  {
    v3 = a3;
    v6 = HIDWORD(a2);
    v7 = HIDWORD(a3);
    if ((int)a2 > (int)-[BWPhotonicEngineNodeConfiguration rawSensorDimensions](*(_QWORD *)(a1 + 112))
      || (int)v6 > (int)((unint64_t)-[BWPhotonicEngineNodeConfiguration rawSensorDimensions](*(_QWORD *)(a1 + 112)) >> 32))
    {
      v8 = (double)(int)a2 / (double)(int)v6;
      if (vabdd_f64((double)v3 / (double)(int)v7, v8) > 0.1)
        v8 = (double)v3 / (double)(int)v7;
      v9 = FigCaptureMetadataUtilitiesEnforceAspectRatioWithStillImageDimensions(a2, v8);
      v10 = BWExtendDimensionsToConformToAlignmentRequirements(v9, 16, 16);
      if ((int)v10 >= (int)a2)
        v3 = a2;
      else
        v3 = v10;
      if (SHIDWORD(v10) >= (int)v6)
        LODWORD(v7) = v6;
      else
        v7 = HIDWORD(v10);
    }
  }
  else
  {
    LODWORD(v7) = 0;
    v3 = 0;
  }
  return v3 | ((unint64_t)v7 << 32);
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
        v6 = *(OpaqueVTPixelTransferSession **)(v4 + 568);
        if (v6)
          return VTPixelTransferSessionTransferImage(v6, sourceBuffer, destinationBuffer);
        result = VTPixelTransferSessionCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (VTPixelTransferSessionRef *)(v4 + 568));
        if (!(_DWORD)result)
        {
          result = VTSessionSetProperty(*(VTSessionRef *)(v4 + 568), (CFStringRef)*MEMORY[0x1E0CED848], (CFTypeRef)*MEMORY[0x1E0CEDB40]);
          if (!(_DWORD)result)
          {
            v6 = *(OpaqueVTPixelTransferSession **)(v4 + 568);
            return VTPixelTransferSessionTransferImage(v6, sourceBuffer, destinationBuffer);
          }
        }
      }
    }
  }
  return result;
}

- (uint64_t)_setupProcessingStateForInferenceWithSettings:(uint64_t)a3 portType:(unint64_t)a4 inferenceInputBufferType:
{
  int v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  __CVBuffer *ImageBuffer;
  __IOSurface *IOSurface;
  __IOSurface *v16;
  NSObject *v17;
  int v18;
  int v19;
  BOOL v20;
  int v21;
  uint64_t *v22;
  _BOOL8 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t k;
  NSObject *v32;
  uint64_t v33;
  char v35;
  unint64_t v36;
  uint64_t v37;
  BWInferenceEngineControllerInput *v39;
  id obj;
  void *v41;
  _QWORD v42[8];
  _QWORD v43[7];
  char v44;
  char v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _QWORD v54[6];
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _QWORD v59[5];
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  int v63;
  uint64_t block;
  uint64_t v65;
  void (*v66)(uint64_t);
  void *v67;
  _QWORD *v68;
  _BYTE v69[128];
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v60 = 0;
  v61 = &v60;
  v62 = 0x2020000000;
  v63 = 0;
  v37 = objc_msgSend(*(id *)(a1 + 168), "controllerForType:", 3);
  if (v37)
  {
    v7 = -[BWPhotonicEngineNode _provideInferenceAttachedMediaWithSettings:](a1, a2);
    if ((-[BWPhotonicEngineNode _inferencesRequiredByProcessorControllersForSettings:](a1, a2) | v7) == 1)
    {
      v39 = 0;
      if (a4 <= 0x27 && ((1 << a4) & 0x9000008000) != 0)
      {
        v8 = (void *)objc_msgSend(*(id *)(a1 + 480), "objectForKeyedSubscript:", a3);
        v9 = *(NSObject **)(a1 + 488);
        v59[0] = MEMORY[0x1E0C809B0];
        v59[1] = 3221225472;
        v59[2] = __104__BWPhotonicEngineNode__setupProcessingStateForInferenceWithSettings_portType_inferenceInputBufferType___block_invoke;
        v59[3] = &unk_1E491E720;
        v59[4] = v37;
        block = MEMORY[0x1E0C809B0];
        v65 = 3221225472;
        v66 = __ubn_dispatch_sync_block_invoke_0;
        v67 = &unk_1E491ECB8;
        v68 = v59;
        dispatch_sync(v9, &block);
        if (objc_msgSend(v8, "inferenceImage"))
        {
          v10 = (void *)BWSampleBufferCopyDictionaryOfAttachedMedia((const void *)objc_msgSend(v8, "inferenceImage"));
          v57 = 0u;
          v58 = 0u;
          v55 = 0u;
          v56 = 0u;
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v55, v71, 16);
          if (v11)
          {
            v12 = *(_QWORD *)v56;
            do
            {
              for (i = 0; i != v11; ++i)
              {
                if (*(_QWORD *)v56 != v12)
                  objc_enumerationMutation(v10);
                ImageBuffer = CMSampleBufferGetImageBuffer((CMSampleBufferRef)objc_msgSend(v10, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * i)));
                if (ImageBuffer)
                {
                  IOSurface = CVPixelBufferGetIOSurface(ImageBuffer);
                  v16 = IOSurface;
                  if (IOSurface)
                  {
                    IOSurfaceLock(IOSurface, 5u, 0);
                    IOSurfaceUnlock(v16, 5u, 0);
                  }
                }
              }
              v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v55, v71, 16);
            }
            while (v11);
          }

          BWSampleBufferRemoveAllAttachedMedia((const void *)objc_msgSend(v8, "inferenceImage"));
        }
        v17 = *(NSObject **)(a1 + 488);
        v54[0] = MEMORY[0x1E0C809B0];
        v54[1] = 3221225472;
        v54[2] = __104__BWPhotonicEngineNode__setupProcessingStateForInferenceWithSettings_portType_inferenceInputBufferType___block_invoke_2;
        v54[3] = &unk_1E491F158;
        v54[4] = a1;
        v54[5] = a4;
        block = MEMORY[0x1E0C809B0];
        v65 = 3221225472;
        v66 = __ubn_dispatch_sync_block_invoke_0;
        v67 = &unk_1E491ECB8;
        v68 = v54;
        dispatch_sync(v17, &block);
        v39 = -[BWInferenceEngineControllerInput initWithSettings:portType:inferenceInputBufferType:]([BWInferenceEngineControllerInput alloc], "initWithSettings:portType:inferenceInputBufferType:", a2, a3, a4);
        v41 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v18 = -[BWPhotonicEngineNode _isSemanticRenderingCapture:](a1, a2);
        v19 = -[BWPhotonicEngineNode _isSWFRFlashCapture:](a1, a2);
        if (*(_QWORD *)(a1 + 624))
          v36 = ((unint64_t)objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureFlags") >> 16) & 1;
        else
          LODWORD(v36) = 0;
        v20 = -[BWPhotonicEngineNode _isSemanticStylesCaptureNeedingInferencesWithSettings:](a1, a2);
        if ((_DWORD)v36)
        {
          if ((objc_msgSend(*(id *)(a1 + 472), "enabledVisionInferences") & 2) != 0)
            -[BWInferenceEngineControllerInput setEnabledVisionInferences:](v39, "setEnabledVisionInferences:", -[BWInferenceEngineControllerInput enabledVisionInferences](v39, "enabledVisionInferences") | 2);
          if ((objc_msgSend(*(id *)(a1 + 472), "enabledVisionInferences") & 4) != 0)
            -[BWInferenceEngineControllerInput setEnabledVisionInferences:](v39, "setEnabledVisionInferences:", -[BWInferenceEngineControllerInput enabledVisionInferences](v39, "enabledVisionInferences") | 4);
          if ((objc_msgSend(*(id *)(a1 + 472), "enabledVisionInferences") & 8) != 0)
            -[BWInferenceEngineControllerInput setEnabledVisionInferences:](v39, "setEnabledVisionInferences:", -[BWInferenceEngineControllerInput enabledVisionInferences](v39, "enabledVisionInferences") | 8);
        }
        if (v18)
        {
          objc_msgSend(v41, "addObjectsFromArray:", objc_msgSend(*(id *)(a1 + 472), "enabledInferenceMasks"));
          if ((objc_msgSend(*(id *)(a1 + 472), "enabledVisionInferences") & 2) != 0)
            -[BWInferenceEngineControllerInput setEnabledVisionInferences:](v39, "setEnabledVisionInferences:", -[BWInferenceEngineControllerInput enabledVisionInferences](v39, "enabledVisionInferences") | 2);
          if ((objc_msgSend(*(id *)(a1 + 472), "enabledVisionInferences") & 8) != 0)
            -[BWInferenceEngineControllerInput setEnabledVisionInferences:](v39, "setEnabledVisionInferences:", -[BWInferenceEngineControllerInput enabledVisionInferences](v39, "enabledVisionInferences") | 8);
          if ((objc_msgSend(*(id *)(a1 + 472), "enabledVisionInferences") & 0x10) != 0)
            -[BWInferenceEngineControllerInput setEnabledVisionInferences:](v39, "setEnabledVisionInferences:", -[BWInferenceEngineControllerInput enabledVisionInferences](v39, "enabledVisionInferences") | 0x10);
        }
        if (v19 && objc_msgSend((id)objc_msgSend(*(id *)(a1 + 472), "swfrInferenceMasks"), "count"))
          objc_msgSend(v41, "addObjectsFromArray:", objc_msgSend(*(id *)(a1 + 472), "swfrInferenceMasks"));
        if ((objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureFlags") & 0x800000000) != 0)
        {
          objc_msgSend(v41, "addObject:", CFSTR("PersonSemanticsSkin"));
          objc_msgSend(v41, "addObject:", CFSTR("PersonSemanticsHair"));
          objc_msgSend(v41, "addObject:", 0x1E49511B8);
          objc_msgSend(v41, "addObject:", 0x1E495B0B8);
        }
        if (v20 || -[BWPhotonicEngineNode _isSmartStylesCaptureNeedingInferencesWithSettings:](a1, a2))
        {
          objc_msgSend(v41, "addObject:", CFSTR("PersonSemanticsSkin"));
          objc_msgSend(v41, "addObject:", 0x1E495B0B8);
          v21 = -[BWPhotonicEngineNodeConfiguration semanticRenderingVersion](*(_QWORD *)(a1 + 112));
          v22 = &BWAttachedMediaKey_PersonSegmentationMask;
          if (v21 <= 3)
            v22 = &BWInferenceAttachedMediaKey_LowResPersonSegmentationMask;
          objc_msgSend(v41, "addObject:", *v22);
          if (objc_msgSend(*(id *)(a1 + 472), "smartCameraClassificationsEnabled"))
            v23 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "metadata"), "smartCamInferences") == 0;
          else
            v23 = 0;
          -[BWInferenceEngineControllerInput setSmartCameraClassificationsEnabled:](v39, "setSmartCameraClassificationsEnabled:", v23);
        }
        v52 = 0u;
        v53 = 0u;
        v50 = 0u;
        v51 = 0u;
        obj = *(id *)(a1 + 576);
        v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v70, 16);
        v35 = v19;
        if (v24)
        {
          v25 = *(_QWORD *)v51;
          do
          {
            for (j = 0; j != v24; ++j)
            {
              if (*(_QWORD *)v51 != v25)
                objc_enumerationMutation(obj);
              v27 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * j);
              v46 = 0u;
              v47 = 0u;
              v48 = 0u;
              v49 = 0u;
              v28 = (void *)objc_msgSend(*(id *)(a1 + 576), "objectForKeyedSubscript:", v27);
              v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v46, v69, 16);
              if (v29)
              {
                v30 = *(_QWORD *)v47;
                while (2)
                {
                  for (k = 0; k != v29; ++k)
                  {
                    if (*(_QWORD *)v47 != v30)
                      objc_enumerationMutation(v28);
                    if ((-[BWPhotonicEngineNode _provideInferencesForAttachedMediaMode:settings:](a1, objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * k), "intValue"), a2) & 1) != 0)
                    {
                      objc_msgSend(v41, "addObject:", v27);
                      goto LABEL_63;
                    }
                  }
                  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v46, v69, 16);
                  if (v29)
                    continue;
                  break;
                }
              }
LABEL_63:
              ;
            }
            v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v70, 16);
          }
          while (v24);
        }
        -[BWInferenceEngineControllerInput setEnabledInferenceMasks:](v39, "setEnabledInferenceMasks:", objc_msgSend(v41, "allObjects"));
        v43[0] = MEMORY[0x1E0C809B0];
        v43[1] = 3221225472;
        v43[2] = __104__BWPhotonicEngineNode__setupProcessingStateForInferenceWithSettings_portType_inferenceInputBufferType___block_invoke_3;
        v43[3] = &unk_1E4928130;
        v43[4] = a1;
        v43[5] = v41;
        v43[6] = a3;
        v44 = v36;
        v45 = v35;
        -[BWStillImageProcessorControllerInput addOutputSampleBufferRouter:forBufferTypes:](v39, "addOutputSampleBufferRouter:forBufferTypes:", v43, &unk_1E4A021E0);
        v32 = *(NSObject **)(a1 + 488);
        v42[0] = MEMORY[0x1E0C809B0];
        v42[1] = 3221225472;
        v42[2] = __104__BWPhotonicEngineNode__setupProcessingStateForInferenceWithSettings_portType_inferenceInputBufferType___block_invoke_245;
        v42[3] = &unk_1E49233C0;
        v42[4] = v37;
        v42[5] = v39;
        v42[6] = a1;
        v42[7] = &v60;
        block = MEMORY[0x1E0C809B0];
        v65 = 3221225472;
        v66 = __ubn_dispatch_sync_block_invoke_0;
        v67 = &unk_1E491ECB8;
        v68 = v42;
        dispatch_sync(v32, &block);
        if (!*((_DWORD *)v61 + 6))
          objc_msgSend(*(id *)(a1 + 480), "setObject:forKeyedSubscript:", v39, a3);
      }

    }
    else
    {

    }
  }
  else
  {
    *((_DWORD *)v61 + 6) = -73215;

  }
  v33 = *((unsigned int *)v61 + 6);
  _Block_object_dispose(&v60, 8);
  return v33;
}

void __87__BWPhotonicEngineNode__inferenceProcessRedEyeReductionSampleBuffer_settings_portType___block_invoke(uint64_t a1)
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
    switch(a2)
    {
      case 3:
        return -[BWPhotonicEngineNode _isSmartStylesCaptureNeedingInferencesWithSettings:](a1, a3);
      case 2:
        return -[BWPhotonicEngineNode _isDepthCaptureNeedingPersonSegmentationMasksWithSettings:](a1, a3);
      case 1:
        return -[BWPhotonicEngineNode _isDemosaicedRawCaptureNeedingInferencesWithSettigs:](a1, a3);
    }
  }
  return 0;
}

uint64_t __89__BWPhotonicEngineNode__waitForAndMergeInferencesIfNeededForSampleBuffer_processorInput___block_invoke(uint64_t a1)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  BWInferenceResult *v17;
  uint64_t v18;
  BWInferenceResult *v19;
  BWInferenceResult *v20;
  void *v21;
  uint64_t v22;
  opaqueCMSampleBuffer *v23;
  void *v24;
  uint64_t result;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  CFTypeRef v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  CMSampleBufferRef sbuf;
  CMSampleBufferRef sbufa;
  id obj;
  id obja;
  CFTypeRef cf;
  _BYTE v43[32];
  __int128 v44;
  __int128 v45;
  os_log_type_t type[16];
  uint64_t v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _QWORD v52[19];

  v52[16] = *MEMORY[0x1E0C80C00];
  if (dword_1ECFE9AF0)
  {
    *(_DWORD *)v43 = 0;
    type[0] = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v36 = a1;
  v3 = *(void **)(*(_QWORD *)(a1 + 40) + 528);
  sbuf = *(CMSampleBufferRef *)(a1 + 48);
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", CMGetAttachment(sbuf, CFSTR("Inferences"), 0));
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52[0] = 0x1E4951338;
  v52[1] = 0x1E4951358;
  v52[2] = 0x1E4951058;
  v52[3] = 0x1E4951158;
  v52[4] = 0x1E4951178;
  obj = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 5);
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v49 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
        v10 = objc_msgSend(v3, "inferenceForAttachmentKey:", v9, v32, v34);
        if (v10)
        {
          v11 = v10;
          v12 = BWInferenceTypeForInferenceAttachmentKey(v9);
          v13 = (void *)objc_msgSend(v4, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v12));
          if (v13)
          {
            v14 = v13;
            v15 = objc_msgSend(v13, "inferences");
            v16 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v15);
            objc_msgSend(v16, "setObject:forKeyedSubscript:", v11, v9);
            v17 = -[BWInferenceResult initWithResult:replacementInferences:replacementPreventionReason:]([BWInferenceResult alloc], "initWithResult:replacementInferences:replacementPreventionReason:", v14, v16, 0);
          }
          else
          {
            v18 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v11, v9);
            memset(v43, 0, 24);
            CMSampleBufferGetPresentationTimeStamp((CMTime *)v43, sbuf);
            v19 = [BWInferenceResult alloc];
            *(_OWORD *)type = *(_OWORD *)v43;
            v47 = *(_QWORD *)&v43[16];
            v17 = -[BWInferenceResult initWithInferenceType:inferences:atTimestamp:](v19, "initWithInferenceType:inferences:atTimestamp:", v12, v18, type);
          }
          v20 = v17;
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v17, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v12));

        }
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
    }
    while (v6);
  }
  if (objc_msgSend(v4, "count", v32, v34))
    CMSetAttachment(sbuf, CFSTR("Inferences"), v4, 1u);
  v21 = (void *)-[BWPhotonicEngineNode _inferenceAttachedMediaRequiredForSettings:inferences:sampleBuffer:](*(_QWORD *)(v36 + 40), (void *)objc_msgSend(*(id *)(v36 + 32), "stillImageSettings"), *(void **)(*(_QWORD *)(v36 + 40) + 528));
  v22 = *(_QWORD *)(v36 + 40);
  v23 = *(opaqueCMSampleBuffer **)(v36 + 48);
  obja = *(id *)(v22 + 528);
  v24 = *(void **)(v22 + 552);
  memset(v43, 0, sizeof(v43));
  v44 = 0u;
  v45 = 0u;
  result = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", v43, v52, 16);
  if (result)
  {
    v26 = result;
    v27 = **(_QWORD **)&v43[16];
    v37 = v24;
    sbufa = (CMSampleBufferRef)v21;
    do
    {
      v28 = 0;
      do
      {
        if (**(_QWORD **)&v43[16] != v27)
          objc_enumerationMutation(v21);
        v29 = *(void **)(*(_QWORD *)&v43[8] + 8 * v28);
        if (!BWSampleBufferGetAttachedMedia(v23, (uint64_t)v29))
        {
          cf = 0;
          v30 = (CFTypeRef)objc_msgSend(v24, "objectForKeyedSubscript:", v29);
          if (v30)
            v30 = CFRetain(v30);
          cf = v30;
          if (BWPropagateInferenceAttachedMedia(obja, v29, &cf, v23))
          {
            v31 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
            v24 = v37;
            v21 = sbufa;
          }
          objc_msgSend(v24, "setObject:forKeyedSubscript:", cf, v29, v33, v35);
          if (cf)
            CFRelease(cf);
        }
        ++v28;
      }
      while (v26 != v28);
      result = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", v43, v52, 16);
      v26 = result;
    }
    while (result);
  }
  return result;
}

- (uint64_t)_inferenceAttachedMediaRequiredForSettings:(uint64_t)result inferences:(void *)a2 sampleBuffer:(void *)a3
{
  uint64_t v3;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  if (result)
  {
    v6 = result;
    if (!_FigIsCurrentDispatchQueue())
    {
      v9 = v3;
      LODWORD(v8) = 0;
      FigDebugAssert3();
    }
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set", v8, v9);
    objc_msgSend(v7, "addObjectsFromArray:", -[BWPhotonicEngineNode _inferenceAttachedMediaRequiredForDemosaicedRawCaptureWithSettings:inferences:](v6, a2, a3));
    objc_msgSend(v7, "addObjectsFromArray:", -[BWPhotonicEngineNode _inferenceAttachedMediaRequiredForDepthProcessingWithSettings:](v6, a2));
    objc_msgSend(v7, "addObjectsFromArray:", -[BWPhotonicEngineNode _inferenceAttachedMediaRequiredForSmartStyleWithSettings:](v6, a2));
    return objc_msgSend(v7, "allObjects");
  }
  return result;
}

void __45__BWPhotonicEngineNode__resetProcessingState__block_invoke(uint64_t a1)
{
  objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "controllerForType:", 3), "cancelProcessing");

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 528) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 536) = 0;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 544) = 0;
}

uint64_t __45__BWPhotonicEngineNode__resetProcessingState__block_invoke_2(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "controllerForType:", 8), "cancelProcessing");
}

- (void)_prepareSharedExternalMemoryResourceForProcessorControllersIfNeeded
{
  int *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _BOOL4 v16;
  float v17;
  void *v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  os_log_type_t type;
  int v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (*(_BYTE *)(a1 + 216))
    {
      v2 = &OBJC_IVAR___BWVisionInferenceProvider__executesRequestsIndividually;
      if (!*(_BYTE *)(a1 + 217))
      {
        v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 168), "controllerForType:", 12), "supportsExternalMemoryResource"))objc_msgSend(v3, "addObject:", objc_msgSend(*(id *)(a1 + 168), "controllerForType:", 12));
        if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 168), "controllerForType:", 6), "supportsExternalMemoryResource"))objc_msgSend(v3, "addObject:", objc_msgSend(*(id *)(a1 + 168), "controllerForType:", 6));
        if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 168), "controllerForType:", 2), "supportsExternalMemoryResource"))objc_msgSend(v3, "addObject:", objc_msgSend(*(id *)(a1 + 168), "controllerForType:", 2));
        if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 168), "controllerForType:", 15), "supportsExternalMemoryResource"))objc_msgSend(v3, "addObject:", objc_msgSend(*(id *)(a1 + 168), "controllerForType:", 15));
        if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 168), "controllerForType:", 16), "supportsExternalMemoryResource"))objc_msgSend(v3, "addObject:", objc_msgSend(*(id *)(a1 + 168), "controllerForType:", 16));
        if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 168), "controllerForType:", 17), "supportsExternalMemoryResource"))objc_msgSend(v3, "addObject:", objc_msgSend(*(id *)(a1 + 168), "controllerForType:", 17));
        if ((unint64_t)objc_msgSend(v3, "count") < 2)
        {
          v15 = 0;
        }
        else
        {
          v40 = 0u;
          v41 = 0u;
          v38 = 0u;
          v39 = 0u;
          v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
          if (v4)
          {
            v5 = v3;
            v6 = 0;
            v30 = 0;
            v7 = 0;
            v8 = *(_QWORD *)v39;
            v9 = 6;
LABEL_19:
            v10 = 0;
            while (1)
            {
              if (*(_QWORD *)v39 != v8)
                objc_enumerationMutation(v5);
              v11 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v10);
              v12 = (void *)objc_msgSend(v11, "externalMemoryDescriptor");
              if (!v12)
                goto LABEL_66;
              v13 = v12;
              if (objc_msgSend(v12, "memSize") > v7)
              {
                v7 = objc_msgSend(v13, "memSize");
                v9 = objc_msgSend(v11, "type");
              }
              v14 = objc_msgSend(v13, "allocatorType");
              if ((_DWORD)v6)
              {
                if ((_DWORD)v6 != (_DWORD)v14)
                  goto LABEL_66;
              }
              else
              {
                v6 = v14;
              }
              if (objc_msgSend(v11, "type") == 6)
              {
                v30 = objc_msgSend(v13, "memSize");
              }
              else if (objc_msgSend(v11, "type") == 12
                     || objc_msgSend(v11, "type") == 15
                     || objc_msgSend(v11, "type") == 2
                     || objc_msgSend(v11, "type") == 16
                     || objc_msgSend(v11, "type") == 17)
              {
                objc_msgSend(v13, "memSize");
              }
              if (v4 == ++v10)
              {
                v4 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
                if (v4)
                  goto LABEL_19;
                if (v9 == 12)
                {
                  v3 = v5;
                  if (-[BWPhotonicEngineNodeConfiguration ultraHighResolutionProcessingEnabled](*(_QWORD *)(a1 + 112)))
                  {
                    v2 = &OBJC_IVAR___BWVisionInferenceProvider__executesRequestsIndividually;
                  }
                  else
                  {
                    v16 = -[BWPhotonicEngineNodeConfiguration digitalFlashSupportEnabled](*(_QWORD *)(a1 + 112));
                    v17 = 0.1;
                    if (v16)
                      v17 = 0.6;
                    v7 += (unint64_t)(float)(v17 * (float)v30);
                    v2 = &OBJC_IVAR___BWVisionInferenceProvider__executesRequestsIndividually;
                  }
                }
                else
                {
                  v2 = &OBJC_IVAR___BWVisionInferenceProvider__executesRequestsIndividually;
                  v3 = v5;
                }
                goto LABEL_49;
              }
            }
          }
          v6 = 0;
          LODWORD(v7) = 0;
LABEL_49:
          v18 = (void *)-[BWPhotonicEngineNodeConfiguration dimensionsByQSubResolutionFlavorByPortType](*(_QWORD *)(a1 + 112));
          v19 = BWCommonDimensionsForQSubResolutionFlavor(v18, 2);
          if (FigCaptureVideoDimensionsAreValid(v19))
            objc_msgSend(*(id *)(a1 + 112), "deferredPhotoProcessorEnabled");
          v20 = (int)v7;
          if (dword_1ECFE9AF0)
          {
            v37 = 0;
            type = OS_LOG_TYPE_DEFAULT;
            os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
          v21 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 112), "metalCommandQueue", v28, v29), "device");
          if (!v21)
            goto LABEL_66;
          v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D08B10]), "initWithDevice:allocatorType:", v21, v6);
          if (!v15)
            goto LABEL_64;
          v22 = objc_alloc_init(MEMORY[0x1E0D08B18]);
          objc_msgSend(v22, "setMemSize:", v20);
          objc_msgSend(v22, "setWireMemory:", 1);
          objc_msgSend(v22, "setLabel:", CFSTR("FigMetalAllocatorBackend-Shared-StillImage"));
          objc_msgSend(v22, "setMemoryPoolId:", -[BWMemoryPool poolIdentifier](+[BWMemoryPool sharedMemoryPool](BWMemoryPool, "sharedMemoryPool"), "poolIdentifier"));
          if (objc_msgSend(v15, "setupWithDescriptor:", v22))
            goto LABEL_64;
          v23 = objc_alloc_init(MEMORY[0x1E0D08A88]);
          *(_QWORD *)(a1 + 224) = v23;
          objc_msgSend(v23, "setAllocatorBackend:", v15);
          v34 = 0u;
          v35 = 0u;
          v32 = 0u;
          v33 = 0u;
          v24 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
          if (v24)
          {
            v25 = v24;
            v26 = *(_QWORD *)v33;
            do
            {
              for (i = 0; i != v25; ++i)
              {
                if (*(_QWORD *)v33 != v26)
                  objc_enumerationMutation(v3);
                objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "setExternalMemoryResource:", *(_QWORD *)(a1 + 224));
              }
              v25 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
            }
            while (v25);
          }
        }
        *(_BYTE *)(a1 + v2[289]) = 1;
LABEL_64:

        return;
      }
    }
LABEL_66:
    v15 = 0;
    goto LABEL_64;
  }
}

- (uint64_t)_releaseResourcesWithSettings:(uint64_t)result
{
  uint64_t v3;
  int v4;
  int v5;
  int v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t j;
  int v32;
  unint64_t v33;
  unsigned int v34;
  int v35;
  int obj;
  id obja;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _BYTE v59[128];
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  if (!result)
    return result;
  v3 = result;
  v40 = objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureFlags");
  if ((v40 & 0x200000000) != 0)
    obj = objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "deliverDeferredPhotoProxyImage") ^ 1;
  else
    obj = 0;
  if ((objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureFlags") & 0x100000000) != 0)
  {
    if (objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureType") == 12)
      v4 = objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "deliverDeferredPhotoProxyImage") ^ 1;
    else
      v4 = 1;
    v35 = v4;
  }
  else
  {
    v35 = 0;
  }
  if (objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureType") == 11)
  {
    objc_msgSend(*(id *)(v3 + 424), "flushToMinimumCapacity:", 0);
    objc_msgSend(*(id *)(v3 + 432), "flushToMinimumCapacity:", 0);
  }
  if ((objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureFlags") & 0x800000000) == 0)
  {
    objc_msgSend(*(id *)(v3 + 376), "flushToMinimumCapacity:", 0);
    objc_msgSend(*(id *)(v3 + 384), "flushToMinimumCapacity:", 0);
  }
  if ((objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureFlags") & 0x200) == 0
    && objc_msgSend(*(id *)(v3 + 864), "postponeProcessorSetup"))
  {
    objc_msgSend((id)objc_msgSend(*(id *)(v3 + 168), "controllerForType:", 9), "purgeResources");
  }
  v5 = -[BWPhotonicEngineNodeConfiguration minimumOutputBufferCount](*(_QWORD *)(v3 + 112));
  if (objc_msgSend((id)objc_msgSend(a2, "requestedSettings"), "burstQualityCaptureEnabled"))
  {
    v6 = -[BWPhotonicEngineNodeConfiguration maxNumberOfBurstCapturesAllowedInFlight](*(_QWORD *)(v3 + 112));
    if (v5 <= v6)
      v5 = v6;
  }
  if ((objc_msgSend((id)objc_msgSend(a2, "processingSettings"), "processIntelligentDistortionCorrection") & 1) != 0)
    goto LABEL_22;
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v11 = (void *)objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureStreamSettings");
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v54, v61, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v55;
LABEL_30:
    v15 = 0;
    while (1)
    {
      if (*(_QWORD *)v55 != v14)
        objc_enumerationMutation(v11);
      if ((objc_msgSend((id)v3, "idcSupportedForCaptureType:captureFlags:portType:", objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureType"), objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * v15), "captureFlags"), objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * v15), "portType")) & 1) != 0)break;
      if (v13 == ++v15)
      {
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v54, v61, 16);
        if (v13)
          goto LABEL_30;
        goto LABEL_23;
      }
    }
LABEL_22:
    v5 = *(_DWORD *)(v3 + 976);
  }
LABEL_23:
  v7 = (void *)objc_msgSend(*(id *)(v3 + 16), "livePixelBufferPool");
  if (v35)
  {
    v8 = objc_msgSend(v7, "usesMemoryPool");
    v9 = (void *)objc_msgSend(*(id *)(v3 + 16), "livePixelBufferPool");
    if (v8)
      v10 = 0;
    else
      v10 = v5;
    objc_msgSend(v9, "flushToMinimumCapacity:", v10);
    -[BWPhotonicEngineNode _flushSoftISPOutputBufferPools](v3);
  }
  else
  {
    objc_msgSend(v7, "flushToMinimumCapacity:", v5);
    -[BWPhotonicEngineNode _flushSoftISPOutputBufferPools](v3);
    -[BWPhotonicEngineNode _flushUltraHighResolutionBufferPools](v3);
  }
  if ((v40 & 0x200000000) == 0)
    objc_msgSend(*(id *)(v3 + 448), "flushToMinimumCapacity:", 0);
  if ((obj & 1) == 0)
  {
    objc_msgSend(*(id *)(v3 + 440), "flushToMinimumCapacity:", 0);
    objc_msgSend(*(id *)(v3 + 456), "flushToMinimumCapacity:", 0);
    objc_msgSend(*(id *)(v3 + 704), "flushToMinimumCapacity:", 0);
    objc_msgSend(*(id *)(v3 + 712), "flushToMinimumCapacity:", 0);
    objc_msgSend(*(id *)(v3 + 824), "flushToMinimumCapacity:", 0);
    objc_msgSend(*(id *)(v3 + 832), "flushToMinimumCapacity:", 0);
  }
  if (!objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "learnedNRStereoPhotoFrameFlag"))
    objc_msgSend(*(id *)(v3 + 960), "flushToMinimumCapacity:", 0);
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v16 = *(void **)(v3 + 520);
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v50, v60, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v51;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v51 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
        v22 = (void *)objc_msgSend(*(id *)(v3 + 520), "objectForKeyedSubscript:", v21);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && v22
          && objc_msgSend(v22, "usesMemoryPool")
          && ((objc_msgSend(v21, "isEqualToString:", 0x1E4951698) & 1) == 0
           && (objc_msgSend(v21, "isEqualToString:", 0x1E49516B8) & 1) == 0
           && !objc_msgSend(v21, "isEqualToString:", 0x1E49516D8)
           || (objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureFlags") & 0x80) == 0))
        {
          objc_msgSend(v22, "flushToMinimumCapacity:", 0);
        }
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v50, v60, 16);
    }
    while (v18);
  }
  if (((objc_msgSend((id)objc_msgSend(a2, "processingSettings"), "provideDemosaicedRaw") ^ 1 | obj | v35) & 1) != 0)
    v23 = 0;
  else
    v23 = *(int *)(v3 + 980);
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(v3 + 16), "mediaPropertiesForAttachedMediaKey:", 0x1E495B0F8), "livePixelBufferPool"), "flushToMinimumCapacity:", v23);
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  obja = *(id *)(v3 + 576);
  result = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v46, v59, 16);
  v39 = result;
  if (result)
  {
    v38 = *(_QWORD *)v47;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v47 != v38)
          objc_enumerationMutation(obja);
        v25 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * v24);
        v42 = 0u;
        v43 = 0u;
        v44 = 0u;
        v45 = 0u;
        v41 = v25;
        v26 = (void *)objc_msgSend(*(id *)(v3 + 576), "objectForKeyedSubscript:");
        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v42, v58, 16);
        if (!v27)
        {
          v29 = 0;
          goto LABEL_88;
        }
        v28 = v27;
        v29 = 0;
        v30 = *(_QWORD *)v43;
        do
        {
          for (j = 0; j != v28; ++j)
          {
            if (*(_QWORD *)v43 != v30)
              objc_enumerationMutation(v26);
            v32 = objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * j), "intValue");
            switch(v32)
            {
              case 3:
LABEL_78:
                v34 = objc_msgSend((id)objc_msgSend(a2, "requestedSettings"), "bracketImageCount");
                if (v34)
                  v33 = v34;
                else
                  v33 = 2;
                break;
              case 2:
                if (-[BWPhotonicEngineNode _isDepthCaptureNeedingPersonSegmentationMasksWithSettings:](v3, a2))goto LABEL_78;
                v33 = 0;
                break;
              case 1:
                v33 = v23;
                break;
              default:
                v33 = 0;
                break;
            }
            if (v29 <= v33)
              v29 = v33;
          }
          v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v42, v58, 16);
        }
        while (v28);
LABEL_88:
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(v3 + 16), "mediaPropertiesForAttachedMediaKey:", v41), "livePixelBufferPool"), "flushToMinimumCapacity:", v29);
        ++v24;
      }
      while (v24 != v39);
      result = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v46, v59, 16);
      v39 = result;
    }
    while (result);
  }
  return result;
}

- (void)_setupDeferredProcessingWithSettings:(void *)a3 portType:
{
  BWDeferredProcessorControllerInput *v6;
  _QWORD v7[5];

  if (a1
    && objc_msgSend(*(id *)(a1 + 168), "controllerForType:", 5)
    && -[BWPhotonicEngineNode _processingNeededForSettings:portType:](a1, a2, (uint64_t)a3)
    && (!objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "learnedNRStereoPhotoFrameFlag")
     || objc_msgSend(a3, "isEqualToString:", objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "masterPortType"))))
  {
    v6 = -[BWStillImageProcessorControllerInput initWithSettings:portType:]([BWDeferredProcessorControllerInput alloc], "initWithSettings:portType:", a2, a3);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __70__BWPhotonicEngineNode__setupDeferredProcessingWithSettings_portType___block_invoke;
    v7[3] = &unk_1E4923398;
    v7[4] = a1;
    -[BWStillImageProcessorControllerInput addOutputSampleBufferRouter:forBufferTypes:](v6, "addOutputSampleBufferRouter:forBufferTypes:", v7, &unk_1E4A020A8);
    objc_msgSend(*(id *)(a1 + 944), "setObject:forKeyedSubscript:", v6, a3);
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 168), "controllerForType:", 5), "enqueueInputForProcessing:delegate:", v6, a1);

  }
}

void __70__BWPhotonicEngineNode__setupDeferredProcessingWithSettings_portType___block_invoke(uint64_t a1, CMAttachmentBearerRef target, uint64_t a3, void *a4, uint64_t a5)
{
  CFTypeRef v9;
  uint64_t v10;
  uint64_t v11;

  if ((_DWORD)a5)
  {
    v9 = CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
    v10 = *(_QWORD *)(a1 + 32);
    v11 = objc_msgSend(a4, "stillImageSettings");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("type '%@' requested for '%@'"), BWStillImageProcessorTypeToShortString(a3), a4);
    -[BWPhotonicEngineNode _emitError:stillImageSettings:metadata:description:](v10, a5, v11, (uint64_t)v9);
  }
}

uint64_t __77__BWPhotonicEngineNode__setupProcessingStateIfNeededWithBeginMomentSettings___block_invoke(uint64_t a1)
{
  return -[BWPhotonicEngineNode _ensureProcessorCoordinatorSetupForPostponedProcessors](*(_QWORD *)(a1 + 32));
}

- (uint64_t)_ensureProcessorCoordinatorSetupForPostponedProcessors
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _BOOL4 v8;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  BWDeepZoomProcessorController *v13;
  BWDeepZoomProcessorController *v14;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v16;
  BWSmartStyleRenderingProcessorController *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[6];
  _QWORD block[18];

  block[16] = *MEMORY[0x1E0C80C00];
  if (!result)
    return result;
  v2 = result;
  if (!_FigIsCurrentDispatchQueue())
  {
    v25 = v1;
    LODWORD(v21) = 0;
    FigDebugAssert3();
  }
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array", v21, v25);
  FigDebugIsInternalBuild();
  v4 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), 24);
  mach_absolute_time();
  objc_msgSend(v3, "addObject:", v4);
  v5 = *(void **)(v2 + 168);
  if (!v5)
    goto LABEL_28;
  v6 = objc_msgSend(v5, "controllerForType:", 3);
  if (v6)
  {
    v7 = v6;
    v8 = BWDeviceSupportsDeferredPhotoProcessorPrewarming();
    if (objc_msgSend(*(id *)(v2 + 112), "deferredPhotoProcessorEnabled") && v8)
    {
      v10 = *(NSObject **)(v2 + 496);
      v11 = *(NSObject **)(v2 + 488);
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __78__BWPhotonicEngineNode__ensureProcessorCoordinatorSetupForPostponedProcessors__block_invoke;
      v27[3] = &unk_1E491E748;
      v27[4] = v7;
      v27[5] = v2;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __ubn_dispatch_group_async_block_invoke_0;
      block[3] = &unk_1E491ECB8;
      block[4] = v27;
      dispatch_group_async(v10, v11, block);
    }
  }
  if (*(_QWORD *)(v2 + 688) && !objc_msgSend(*(id *)(v2 + 168), "controllerForType:", 10))
  {
    FigDebugIsInternalBuild();
    v12 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), 16);
    mach_absolute_time();
    objc_msgSend(v3, "addObject:", v12);
    v13 = -[BWDeepZoomProcessorController initWithConfiguration:]([BWDeepZoomProcessorController alloc], "initWithConfiguration:", *(_QWORD *)(v2 + 688));
    if (!v13)
      goto LABEL_28;
    v14 = v13;
    if (-[BWDeepZoomProcessorController prepareWithPixelBufferPoolProvider:](v13, "prepareWithPixelBufferPoolProvider:", v2))
    {
      goto LABEL_28;
    }
    objc_msgSend(*(id *)(v2 + 168), "addController:", v14);
    if (dword_1ECFE9AF0)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    objc_msgSend(v3, "removeLastObject", v23, v26);
  }
  if (*(_QWORD *)(v2 + 808) && !objc_msgSend(*(id *)(v2 + 168), "controllerForType:", 16))
  {
    FigDebugIsInternalBuild();
    v16 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), 21);
    mach_absolute_time();
    objc_msgSend(v3, "addObject:", v16);
    v17 = -[BWSmartStyleRenderingProcessorController initWithConfiguration:]([BWSmartStyleRenderingProcessorController alloc], "initWithConfiguration:", *(_QWORD *)(v2 + 808));
    if (v17)
    {
      objc_msgSend(*(id *)(v2 + 168), "addController:", v17);
      if (dword_1ECFE9AF0)
      {
        v18 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      objc_msgSend(v3, "removeLastObject", v24, v26);
      goto LABEL_24;
    }
LABEL_28:
    v20 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
LABEL_24:
  if (dword_1ECFE9AF0)
  {
    v19 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return objc_msgSend(v3, "removeLastObject", v22, v26);
}

- (id)_processingOrderByPortTypeForSettings:(id)result
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
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
    v3 = (uint64_t)result;
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
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
          if (-[BWPhotonicEngineNode _nrfProcessorInputNeededForSettings:portType:](v3, a2, (uint64_t)v10))
          {
            if (objc_msgSend(v10, "isEqualToString:", objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "masterPortType")))objc_msgSend(v4, "insertObject:atIndex:", v10, 0);
            else
              objc_msgSend(v4, "addObject:", v10);
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }
    return (id)objc_msgSend(v4, "copy");
  }
  return result;
}

- (uint64_t)_setupSoftISPProcessingStateIfNeededWithSettings:(void *)a3 portType:
{
  uint64_t v3;
  id *v6;
  int *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  int v15;
  int v16;
  uint64_t v17;
  BWSoftISPProcessorControllerInput *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[5];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v6 = (id *)result;
    if (!_FigIsCurrentDispatchQueue())
    {
      v20 = v3;
      LODWORD(v19) = 0;
      FigDebugAssert3();
    }
    if ((objc_msgSend((id)objc_msgSend(a2, "captureSettings", v19, v20), "captureFlags") & 4) == 0
      || objc_msgSend(v6[40], "objectForKeyedSubscript:", a3))
    {
      return 0;
    }
    if (!objc_msgSend(v6[21], "controllerForType:", 12))
      return 4294950488;
    v7 = &OBJC_IVAR___BWVisionInferenceProvider__executesRequestsIndividually;
    objc_msgSend(v6[33], "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0C99DE8], "array"), a3);
    objc_msgSend(v6[40], "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0C99DE8], "array"), a3);
    v8 = (void *)objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureStreamSettingsForPortType:", a3);
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __82__BWPhotonicEngineNode__setupSoftISPProcessingStateIfNeededWithSettings_portType___block_invoke;
    v26[3] = &unk_1E4923398;
    v26[4] = v6;
    v9 = objc_msgSend(v8, "expectedFrameCount");
    if (-[BWPhotonicEngineNode _isDeferredRawDeepFusionCapture:]((uint64_t)v6, a2))
    {
      if ((objc_msgSend(v8, "captureFlags") & 0x100000) != 0)
        v9 = 2;
      else
        v9 = 1;
      objc_msgSend(v6[41], "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0C99DE8], "array"), a3);
      if ((objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureFlags") & 0x4000000000) != 0)
      {
        v24 = 0u;
        v25 = 0u;
        v22 = 0u;
        v23 = 0u;
        v10 = (void *)objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "secondaryPortTypes");
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
        if (v11)
        {
          v12 = v11;
          v21 = a3;
          v13 = *(_QWORD *)v23;
          do
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v23 != v13)
                objc_enumerationMutation(v10);
              objc_msgSend(v6[41], "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0C99DE8], "array"), *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i));
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
          }
          while (v12);
          a3 = v21;
          v7 = &OBJC_IVAR___BWVisionInferenceProvider__executesRequestsIndividually;
        }
      }
    }
    else if (-[BWPhotonicEngineNode _isDeferredRawLearnedNRCapture:]((uint64_t)v6, a2))
    {
      objc_msgSend(v6[41], "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0C99DE8], "array"), a3);
    }
    else if (objc_msgSend(v8, "adaptiveBracketingParameters"))
    {
      v9 = 1;
      v15 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "adaptiveBracketingParameters"), "adaptiveBracketingFrameParametersForGroup:", 1), "count");
      if (v15)
      {
        v16 = 0;
        v17 = 2;
        do
        {
          v16 += v15;
          v15 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "adaptiveBracketingParameters"), "adaptiveBracketingFrameParametersForGroup:", v17), "count");
          v17 = (v17 + 1);
        }
        while (v15);
        v9 = v16 + 1;
      }
    }
    if (objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "learnedNRStereoPhotoFrameFlag"))
    {
      if (!objc_msgSend(a3, "isEqualToString:", objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "masterPortType")))
      {
        v9 = 1;
        goto LABEL_33;
      }
      ++v9;
    }
    if (v9 < 1)
      return 0;
    do
    {
LABEL_33:
      v18 = -[BWSoftISPProcessorControllerInput initWithSettings:portType:gdcEnabled:]([BWSoftISPProcessorControllerInput alloc], "initWithSettings:portType:gdcEnabled:", a2, a3, -[BWPhotonicEngineNode _gdcSourceForSettings:portType:]((uint64_t)v6, a2, (uint64_t)a3) == 3);
      -[BWStillImageProcessorControllerInput addOutputSampleBufferRouter:forBufferTypes:](v18, "addOutputSampleBufferRouter:forBufferTypes:", v26, &unk_1E4A020C0);
      objc_msgSend((id)objc_msgSend(*(id *)((char *)v6 + v7[250]), "objectForKeyedSubscript:", -[BWStillImageProcessorControllerInput portType](v18, "portType")), "addObject:", v18);

      --v9;
    }
    while (v9);
    return 0;
  }
  return result;
}

- (void)_drainStashedBeginMomentBuffersIfNeededWithSettings:(uint64_t)a1
{
  uint64_t v2;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t k;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t m;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t n;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  int *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t ii;
  uint64_t v45;
  int *v46;
  unint64_t v47;
  void *v48;
  const void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  id obj;
  uint64_t v56;
  uint64_t v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
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
  os_log_type_t type;
  int v87;
  _BYTE v88[128];
  _BYTE v89[128];
  _BYTE v90[128];
  _BYTE v91[128];
  _BYTE v92[128];
  _BYTE v93[128];
  _BYTE v94[128];
  uint64_t v95;

  v95 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (!_FigIsCurrentDispatchQueue())
    {
      v52 = v2;
      LODWORD(v51) = 0;
      FigDebugAssert3();
    }
    if (dword_1ECFE9AF0)
    {
      v87 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    if (!*(_BYTE *)(a1 + 312)
      && (objc_msgSend(*(id *)(a1 + 304), "count")
       || objc_msgSend(*(id *)(a1 + 320), "count")
       || objc_msgSend(*(id *)(a1 + 328), "count")))
    {
      v84 = 0u;
      v85 = 0u;
      v82 = 0u;
      v83 = 0u;
      v6 = *(void **)(a1 + 304);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v82, v94, 16, v51, v52);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v83;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v83 != v9)
              objc_enumerationMutation(v6);
            BWStillImageCoordinatorUpdateBeginMomentAttachmentsForSampleBuffer((const void *)objc_msgSend(*(id *)(a1 + 304), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v82 + 1) + 8 * i)), a2);
          }
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v82, v94, 16);
        }
        while (v8);
      }
      v80 = 0u;
      v81 = 0u;
      v78 = 0u;
      v79 = 0u;
      v57 = a1;
      v11 = *(void **)(a1 + 280);
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v78, v93, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v79;
        do
        {
          for (j = 0; j != v13; ++j)
          {
            if (*(_QWORD *)v79 != v14)
              objc_enumerationMutation(v11);
            v16 = (void *)objc_msgSend(*(id *)(v57 + 280), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v78 + 1) + 8 * j));
            v74 = 0u;
            v75 = 0u;
            v76 = 0u;
            v77 = 0u;
            v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v74, v92, 16);
            if (v17)
            {
              v18 = v17;
              v19 = *(_QWORD *)v75;
              do
              {
                for (k = 0; k != v18; ++k)
                {
                  if (*(_QWORD *)v75 != v19)
                    objc_enumerationMutation(v16);
                  BWStillImageCoordinatorUpdateBeginMomentAttachmentsForSampleBuffer((const void *)objc_msgSend(v16, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v74 + 1) + 8 * k)), a2);
                }
                v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v74, v92, 16);
              }
              while (v18);
            }
          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v78, v93, 16);
        }
        while (v13);
      }
      v72 = 0u;
      v73 = 0u;
      v70 = 0u;
      v71 = 0u;
      v21 = (void *)objc_msgSend(*(id *)(v57 + 280), "allKeys");
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v70, v91, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v71;
        do
        {
          for (m = 0; m != v23; ++m)
          {
            if (*(_QWORD *)v71 != v24)
              objc_enumerationMutation(v21);
            -[BWPhotonicEngineNode _attemptDisparityReferenceFrameResolutionForSettings:portType:](v57, a2, *(void **)(*((_QWORD *)&v70 + 1) + 8 * m));
          }
          v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v70, v91, 16);
        }
        while (v23);
      }
      v26 = (void *)objc_msgSend(*(id *)(v57 + 320), "copy");
      v66 = 0u;
      v67 = 0u;
      v68 = 0u;
      v69 = 0u;
      obj = v26;
      v54 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v66, v90, 16);
      if (v54)
      {
        v53 = *(_QWORD *)v67;
        do
        {
          v27 = 0;
          do
          {
            if (*(_QWORD *)v67 != v53)
              objc_enumerationMutation(obj);
            v56 = v27;
            v28 = *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * v27);
            v62 = 0u;
            v63 = 0u;
            v64 = 0u;
            v65 = 0u;
            v29 = (void *)objc_msgSend(obj, "objectForKeyedSubscript:", v28);
            v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v62, v89, 16);
            if (v30)
            {
              v31 = v30;
              v32 = *(_QWORD *)v63;
              do
              {
                for (n = 0; n != v31; ++n)
                {
                  if (*(_QWORD *)v63 != v32)
                    objc_enumerationMutation(v29);
                  v34 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * n);
                  v35 = (void *)objc_msgSend((id)objc_msgSend(v34, "input"), "outputSampleBufferRouterForBufferType:", 1);
                  if (objc_msgSend(v35, "outputSampleBufferRouter"))
                  {
                    v36 = (void *)MEMORY[0x1A858DD40]();
                    BWStillImageCoordinatorUpdateBeginMomentAttachmentsForSampleBuffer((const void *)objc_msgSend(v34, "outputSampleBuffer"), a2);
                    v37 = objc_msgSend(v35, "outputSampleBufferRouter");
                    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v37 + 16))(v37, objc_msgSend(v34, "outputSampleBuffer"), 1, objc_msgSend(v34, "input"), objc_msgSend(v34, "error"));
                    objc_autoreleasePoolPop(v36);
                  }
                }
                v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v62, v89, 16);
              }
              while (v31);
            }
            v27 = v56 + 1;
          }
          while (v56 + 1 != v54);
          v54 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v90, 16);
        }
        while (v54);
      }

      v38 = v57;
      objc_msgSend(*(id *)(v57 + 320), "removeAllObjects");
      v39 = &OBJC_IVAR___BWVisionInferenceProvider__executesRequestsIndividually;
      if (objc_msgSend(*(id *)(v57 + 152), "isEqualToString:", objc_msgSend((id)objc_msgSend(a2, "requestedSettings"), "captureRequestIdentifier")))
      {
        v60 = 0u;
        v61 = 0u;
        v58 = 0u;
        v59 = 0u;
        v40 = *(void **)(v57 + 328);
        v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v58, v88, 16);
        if (v41)
        {
          v42 = v41;
          v43 = *(_QWORD *)v59;
          do
          {
            for (ii = 0; ii != v42; ++ii)
            {
              if (*(_QWORD *)v59 != v43)
                objc_enumerationMutation(v40);
              v45 = *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * ii);
              v46 = v39;
              if (objc_msgSend((id)objc_msgSend(*(id *)(v38 + v39[282]), "objectForKeyedSubscript:", v45), "count"))
              {
                v47 = 0;
                do
                {
                  v48 = (void *)MEMORY[0x1A858DD40]();
                  v49 = (const void *)objc_msgSend((id)objc_msgSend(*(id *)(v38 + v46[282]), "objectForKeyedSubscript:", v45), "objectAtIndexedSubscript:", v47);
                  BWStillImageCoordinatorUpdateBeginMomentAttachmentsForSampleBuffer(v49, a2);
                  v50 = (void *)v49;
                  v38 = v57;
                  -[BWPhotonicEngineNode _deferredCaptureHandleSensorRawSampleBuffer:](v57, v50);
                  objc_autoreleasePoolPop(v48);
                  ++v47;
                }
                while (objc_msgSend((id)objc_msgSend(*(id *)(v57 + v46[282]), "objectForKeyedSubscript:", v45), "count") > v47);
              }
              v39 = v46;
            }
            v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v58, v88, 16);
          }
          while (v42);
        }
      }
      objc_msgSend(*(id *)(v38 + v39[282]), "removeAllObjects");
      -[BWPhotonicEngineNode _resetProcessingStateIfDone](v38);
    }
  }
}

void __82__BWPhotonicEngineNode__setupSoftISPProcessingStateIfNeededWithSettings_portType___block_invoke(uint64_t a1, const void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  BWSoftISPResult *v10;

  if (!_FigIsCurrentDispatchQueue())
    FigDebugAssert3();
  if (dword_1ECFE9AF0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v10 = -[BWSoftISPResult initWithInput:outputSampleBuffer:error:]([BWSoftISPResult alloc], "initWithInput:outputSampleBuffer:error:", a4, a2, a5);
  -[BWPhotonicEngineNode _stashAWBMetadataIfNeededForSampleBuffer:processingMode:](*(_QWORD *)(a1 + 32), a2, objc_msgSend(a4, "processingMode"));
  objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 320), "objectForKeyedSubscript:", objc_msgSend(a4, "portType")), "addObject:", v10);

}

- (uint64_t)_stashAWBMetadataIfNeededForSampleBuffer:(int)a3 processingMode:
{
  uint64_t v3;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;

  if (result)
  {
    v6 = result;
    result = _FigIsCurrentDispatchQueue();
    if ((_DWORD)result)
    {
      if (!a2)
        return result;
    }
    else
    {
      v15 = v3;
      LODWORD(v14) = 0;
      result = FigDebugAssert3();
      if (!a2)
        return result;
    }
    v7 = (void *)CMGetAttachment(a2, CFSTR("StillSettings"), 0);
    v8 = objc_msgSend((id)objc_msgSend(v7, "captureSettings"), "learnedNRStereoPhotoFrameFlag");
    v9 = (void *)objc_msgSend(v7, "captureSettings");
    if (a3 == 6 && v8)
    {
      v10 = objc_msgSend(v9, "learnedNRStereoPhotoFrameFlag");
    }
    else
    {
      result = objc_msgSend(v9, "captureFlags", v14, v15);
      if ((result & 0x8000000000) == 0)
        return result;
      v10 = 16;
    }
    result = (uint64_t)BWStillImageCaptureFrameFlagsForSampleBuffer(a2);
    if ((result & v10) != 0)
    {
      v11 = (void *)CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
      v12 = objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00]);
      result = objc_msgSend(*(id *)(v6 + 336), "objectForKeyedSubscript:", v12);
      if (!result)
      {
        v13 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        BWCopyWhiteBalanceMetadata(v11, v13);
        return objc_msgSend(*(id *)(v6 + 336), "setObject:forKeyedSubscript:", v13, v12);
      }
    }
  }
  return result;
}

- (uint64_t)_setupSoftISPOutputRoutingIfNeededWithOutputSampleBufferRouter:(void *)a3 processingPlan:
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  id obj;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v6 = result;
    if (!_FigIsCurrentDispatchQueue())
    {
      v25 = v3;
      LODWORD(v24) = 0;
      FigDebugAssert3();
    }
    result = objc_msgSend(*(id *)(v6 + 320), "count", v24, v25);
    if (result)
    {
      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      obj = *(id *)(v6 + 320);
      result = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
      v28 = result;
      if (result)
      {
        v27 = *(_QWORD *)v40;
        v29 = v6;
        do
        {
          v7 = 0;
          do
          {
            if (*(_QWORD *)v40 != v27)
              objc_enumerationMutation(obj);
            v30 = v7;
            v8 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * v7);
            v35 = 0u;
            v36 = 0u;
            v37 = 0u;
            v38 = 0u;
            v9 = (void *)objc_msgSend(*(id *)(v6 + 320), "objectForKeyedSubscript:", v8);
            v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
            if (v10)
            {
              v11 = v10;
              v12 = 0;
              v13 = *(_QWORD *)v36;
              do
              {
                v14 = 0;
                v15 = v12;
                do
                {
                  if (*(_QWORD *)v36 != v13)
                    objc_enumerationMutation(v9);
                  v16 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v14);
                  objc_msgSend((id)objc_msgSend(v16, "input"), "addOutputSampleBufferRouter:forBufferTypes:", a2, &unk_1E4A020D8);
                  objc_msgSend(a3, "addInput:sequenceNumber:portType:bufferTypes:", objc_msgSend(v16, "input"), v15 + v14++, v8, &unk_1E4A020F0);
                }
                while (v11 != v14);
                v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
                v12 = (v15 + v14);
              }
              while (v11);
              v17 = (v15 + v14);
              v6 = v29;
            }
            else
            {
              v17 = 0;
            }
            v33 = 0u;
            v34 = 0u;
            v31 = 0u;
            v32 = 0u;
            v18 = (void *)objc_msgSend(*(id *)(v6 + 264), "objectForKeyedSubscript:", v8);
            v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
            if (v19)
            {
              v20 = v19;
              v21 = *(_QWORD *)v32;
              do
              {
                for (i = 0; i != v20; ++i)
                {
                  if (*(_QWORD *)v32 != v21)
                    objc_enumerationMutation(v18);
                  v23 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
                  objc_msgSend(v23, "addOutputSampleBufferRouter:forBufferTypes:", a2, &unk_1E4A02108);
                  objc_msgSend(a3, "addInput:sequenceNumber:portType:bufferTypes:", v23, v17 + i, v8, &unk_1E4A02120);
                }
                v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
                v17 = (v17 + i);
              }
              while (v20);
            }
            v6 = v29;
            v7 = v30 + 1;
          }
          while (v30 + 1 != v28);
          result = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
          v28 = result;
        }
        while (result);
      }
    }
  }
  return result;
}

uint64_t __58__BWPhotonicEngineNode__setupProcessingStateWithSettings___block_invoke(uint64_t a1)
{
  return -[BWPhotonicEngineNode _ensureProcessorCoordinatorSetupForPostponedProcessors](*(_QWORD *)(a1 + 32));
}

- (uint64_t)_setupProcessingStateForDeferredCaptureIfNeededWithSettings:(uint64_t)a1
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  BWDeferredCaptureControllerInput *v21;
  double v22;
  double v23;
  uint64_t v24;
  void *v26;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  uint64_t v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v2 = a2;
  v3 = a1;
  if (!objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "deliverDeferredPhotoProxyImage")
    || *(_QWORD *)(v3 + 904))
  {
    return 0;
  }
  v4 = objc_msgSend(*(id *)(v3 + 168), "controllerForType:", 14);
  if (!v4)
    return 4294950488;
  v26 = (void *)v4;
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = (id)objc_msgSend((id)objc_msgSend(v2, "captureSettings"), "portTypes");
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v29 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        v11 = -[BWPhotonicEngineNode _resolvedQSubResolutionFlavorForCaptureSettings:portType:](v3, (void *)objc_msgSend(v2, "captureSettings"), v10);
        if ((v11 - 1) <= 1)
        {
          v12 = v11;
          v32 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v11);
          v13 = objc_msgSend((id)-[BWPhotonicEngineNodeConfiguration dimensionsByQSubResolutionFlavorByPortType](*(_QWORD *)(v3 + 112)), "objectForKeyedSubscript:", v10);
          v14 = v3;
          v15 = v5;
          v16 = v2;
          v17 = (void *)v13;
          v18 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v12);
          v19 = v17;
          v2 = v16;
          v5 = v15;
          v3 = v14;
          v33 = objc_msgSend(v19, "objectForKeyedSubscript:", v18);
          objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1), v10);
        }
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    }
    while (v7);
  }
  if (objc_msgSend(v5, "count"))
    v20 = (id)objc_msgSend(v5, "copy");
  else
    v20 = 0;
  v21 = -[BWDeferredCaptureControllerInput initWithSettings:configuration:sourceNodePixelBufferAttributes:]([BWDeferredCaptureControllerInput alloc], "initWithSettings:configuration:sourceNodePixelBufferAttributes:", v2, objc_msgSend(v26, "configuration"), objc_msgSend((id)objc_msgSend(*(id *)(v3 + 8), "videoFormat"), "pixelBufferAttributes"));
  -[BWDeferredPipelineParameters setNoiseReductionAndFusionScheme:](-[BWDeferredCaptureControllerInput pipelineParameters](v21, "pipelineParameters"), "setNoiseReductionAndFusionScheme:", -[BWPhotonicEngineNodeConfiguration stillImageFusionScheme](*(_QWORD *)(v3 + 112)));
  -[BWDeferredPipelineParameters setRawSensorDimensions:](-[BWDeferredCaptureControllerInput pipelineParameters](v21, "pipelineParameters"), "setRawSensorDimensions:", -[BWPhotonicEngineNodeConfiguration rawSensorDimensions](*(_QWORD *)(v3 + 112)));
  -[BWDeferredPipelineParameters setDimensionsByQSubResolutionFlavorByPortType:](-[BWDeferredCaptureControllerInput pipelineParameters](v21, "pipelineParameters"), "setDimensionsByQSubResolutionFlavorByPortType:", v20);
  -[BWDeferredPipelineParameters setNrfVersion:](-[BWDeferredCaptureControllerInput pipelineParameters](v21, "pipelineParameters"), "setNrfVersion:", -[FigCaptureCameraParameters nrfVersion](+[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance"), "nrfVersion"));
  -[BWDeferredPipelineParameters setSemanticRenderingVersion:](-[BWDeferredCaptureControllerInput pipelineParameters](v21, "pipelineParameters"), "setSemanticRenderingVersion:", -[BWPhotonicEngineNodeConfiguration semanticRenderingVersion](*(_QWORD *)(v3 + 112)));
  -[BWDeferredPipelineParameters setSmartStyleRenderingVersion:](-[BWDeferredCaptureControllerInput pipelineParameters](v21, "pipelineParameters"), "setSmartStyleRenderingVersion:", -[BWPhotonicEngineNodeConfiguration smartStyleRenderingVersion](*(_QWORD *)(v3 + 112)));
  -[BWDeferredPipelineParameters setSmartStyleReversibilityEnabled:](-[BWDeferredCaptureControllerInput pipelineParameters](v21, "pipelineParameters"), "setSmartStyleReversibilityEnabled:", -[BWPhotonicEngineNodeConfiguration smartStyleReversibilityEnabled](*(_QWORD *)(v3 + 112)));
  -[BWDeferredPipelineParameters setSmartStyleLinearThumbnailDimensions:](-[BWDeferredCaptureControllerInput pipelineParameters](v21, "pipelineParameters"), "setSmartStyleLinearThumbnailDimensions:", -[BWPhotonicEngineNodeConfiguration smartStyleLinearThumbnailDimensions](*(_QWORD *)(v3 + 112)));
  -[BWDeferredPipelineParameters setSmartStyleStyledThumbnailDimensions:](-[BWDeferredCaptureControllerInput pipelineParameters](v21, "pipelineParameters"), "setSmartStyleStyledThumbnailDimensions:", -[BWPhotonicEngineNodeConfiguration smartStyleStyledThumbnailDimensions](*(_QWORD *)(v3 + 112)));
  -[BWDeferredPipelineParameters setContinuousZoomWithDepthSupported:](-[BWDeferredCaptureControllerInput pipelineParameters](v21, "pipelineParameters"), "setContinuousZoomWithDepthSupported:", -[BWPhotonicEngineNodeConfiguration continuousZoomWithDepthSupported](*(_QWORD *)(v3 + 112)));
  if ((objc_msgSend((id)objc_msgSend(v2, "captureSettings"), "captureFlags") & 0x800) != 0)
    -[BWDeferredPipelineParameters setPearlModuleType:](-[BWDeferredCaptureControllerInput pipelineParameters](v21, "pipelineParameters"), "setPearlModuleType:", objc_msgSend(*(id *)(v3 + 112), "pearlModuleType"));
  -[BWDeferredPipelineParameters setSfhrMode:](-[BWDeferredCaptureControllerInput pipelineParameters](v21, "pipelineParameters"), "setSfhrMode:", -[BWPhotonicEngineNodeConfiguration sfhrMode](*(_QWORD *)(v3 + 112)));
  v22 = -[BWPhotonicEngineNodeConfiguration sensorCenterOffset](*(_QWORD *)(v3 + 112));
  -[BWDeferredPipelineParameters setSensorCenterOffset:](-[BWDeferredCaptureControllerInput pipelineParameters](v21, "pipelineParameters"), "setSensorCenterOffset:", v22, v23);
  v24 = objc_msgSend(v26, "enqueueInputForProcessing:delegate:", v21, v3);

  if (!(_DWORD)v24)
    *(_QWORD *)(v3 + 904) = v21;
  return v24;
}

- (uint64_t)_setupProcessingStateForClientBracketWithSettings:(void *)a3 processingPlan:
{
  uint64_t v6;
  int v7;
  uint64_t v8;
  void *v9;
  BWNRFProcessorInput *v10;
  _BOOL4 v11;
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id obj;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[6];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v24 = (void *)objc_msgSend(*(id *)(a1 + 168), "controllerForType:", 6);
    if (!v24)
      return 4294894081;
    v6 = *(_QWORD *)(a1 + 176);
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __65__BWPhotonicEngineNode__standardNROutputRouterWithExpectedQueue___block_invoke;
    v30[3] = &unk_1E4923460;
    v30[4] = v6;
    v30[5] = a1;
    v21 = (id)objc_msgSend(v30, "copy");
    v7 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureStreamSettingsForPortType:", objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "masterPortType")), "unifiedBracketedCaptureParams"), "count");
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    obj = -[BWPhotonicEngineNode _processingOrderByPortTypeForSettings:]((id)a1, a2);
    v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v22)
    {
      v20 = *(_QWORD *)v27;
      while (2)
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v27 != v20)
            objc_enumerationMutation(obj);
          v23 = v8;
          v9 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v8);
          v10 = -[BWNRFProcessorInput initWithSettings:portType:]([BWNRFProcessorInput alloc], "initWithSettings:portType:", a2, v9);
          v25 = -[BWPhotonicEngineNode _bufferTypesForCaptureSettings:](a1, (void *)objc_msgSend(a2, "captureSettings"));
          -[BWStillImageProcessorControllerInput addOutputSampleBufferRouter:forBufferTypes:](v10, "addOutputSampleBufferRouter:forBufferTypes:", v21);
          objc_msgSend(*(id *)(a1 + 352), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v10), v9);

          v11 = -[BWPhotonicEngineNode _processingNeededForSettings:portType:](a1, -[BWStillImageProcessorControllerInput stillImageSettings](v10, "stillImageSettings"), (uint64_t)-[BWStillImageProcessorControllerInput portType](v10, "portType"));
          if (v11)
            v12 = v7;
          else
            v12 = 1;
          -[BWNRFProcessorInput setRemainingProcessingCount:](v10, "setRemainingProcessingCount:", -[BWNRFProcessorInput remainingProcessingCount](v10, "remainingProcessingCount") + v12);
          objc_msgSend(*(id *)(a1 + 792), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0C99E08], "dictionary"), v9);
          if (v7 >= 1)
          {
            v13 = 0;
            while (1)
            {
              if (v11)
              {
                objc_msgSend(a3, "addInput:sequenceNumber:portType:bufferTypes:", v10, (v13 + 1), v9, v25);
                v14 = -[BWPhotonicEngineNode _setupProcessingStateForIntelligentDistortionCorrectionIfNeededWithSettings:sequenceNumber:portType:processingPlan:](a1, a2, (v13 + 1), (uint64_t)v9, a3);
                if ((_DWORD)v14)
                {
                  v17 = v14;
                  goto LABEL_26;
                }
                v15 = -[BWPhotonicEngineNode _setupProcessingStateForScalerIfNeededWithSettings:sequenceNumber:portType:processingPlan:](a1, a2, (v13 + 1), v9, a3);
                if ((_DWORD)v15)
                {
                  v17 = v15;
                  goto LABEL_26;
                }
                v16 = objc_msgSend(v24, "enqueueInputForProcessing:delegate:processErrorRecoveryFrame:processOriginalImage:processToneMapping:processInferenceInputImage:clientBracketSequenceNumber:processSemanticRendering:provideInferenceInputImageForProcessing:processSmartStyleRenderingInput:inferencesAvailable:", v10, a1, 0, 0, 0, 0, (v13 + 1));
                if ((_DWORD)v16)
                  break;
              }
              if (-[BWStillImageProcessorControllerInput isMaster](v10, "isMaster"))
                -[BWPhotonicEngineNode _setupProcessingStateForDisparityIfNeededWithSettings:sequenceNumber:processingPlan:](a1, a2, (v13 + 1), a3);
              if (v7 == ++v13)
                goto LABEL_20;
            }
            v17 = v16;
LABEL_26:
            FigDebugAssert3();
            return v17;
          }
LABEL_20:
          v8 = v23 + 1;
        }
        while (v23 + 1 != v22);
        v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
        if (v22)
          continue;
        break;
      }
    }
  }
  return 0;
}

- (uint64_t)_setupProcessingStateForColorConstancyCaptureWithSettings:(void *)a3 processingPlan:
{
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void **p_vtable;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  BWNRFProcessorInput *v14;
  uint64_t v15;
  void *v16;
  BWNRFProcessorInput *v17;
  BWColorConstancyProcessorControllerInput *v18;
  uint64_t v19;
  uint64_t v20;
  void *v22;
  uint64_t v23;
  id obj;
  uint64_t v25;
  void *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[5];
  _QWORD v33[6];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v6 = 4294894081;
  v26 = (void *)objc_msgSend(*(id *)(a1 + 168), "controllerForType:", 6);
  if (v26)
  {
    if (objc_msgSend(*(id *)(a1 + 168), "controllerForType:", 12))
    {
      v22 = (void *)objc_msgSend(*(id *)(a1 + 168), "controllerForType:", 17);
      if (v22)
      {
        v32[4] = a1;
        v33[0] = MEMORY[0x1E0C809B0];
        v33[1] = 3221225472;
        v33[2] = __97__BWPhotonicEngineNode__setupProcessingStateForColorConstancyCaptureWithSettings_processingPlan___block_invoke;
        v33[3] = &unk_1E4923460;
        v33[4] = a1;
        v33[5] = a2;
        v32[0] = MEMORY[0x1E0C809B0];
        v32[1] = 3221225472;
        v32[2] = __97__BWPhotonicEngineNode__setupProcessingStateForColorConstancyCaptureWithSettings_processingPlan___block_invoke_216;
        v32[3] = &unk_1E4923398;
        v27 = -[BWPhotonicEngineNode _standardNROutputRouterWithExpectedQueue:]((id)a1, *(_QWORD *)(a1 + 176));
        v7 = -[BWPhotonicEngineNode _bufferTypesForCaptureSettings:](a1, (void *)objc_msgSend(a2, "captureSettings"));
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        obj = -[BWPhotonicEngineNode _processingOrderByPortTypeForSettings:]((id)a1, a2);
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
        if (v8)
        {
          v9 = v8;
          p_vtable = BWVisionInferenceStorage.vtable;
          v25 = *(_QWORD *)v29;
          while (2)
          {
            v11 = 0;
            v23 = v9;
            do
            {
              if (*(_QWORD *)v29 != v25)
                objc_enumerationMutation(obj);
              v12 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v11);
              v13 = (void *)objc_msgSend(objc_alloc((Class)(p_vtable + 137)), "initWithSettings:portType:", a2, v12);
              objc_msgSend(v13, "addOutputSampleBufferRouter:forBufferTypes:", v33, v7);
              objc_msgSend(a3, "addInput:sequenceNumber:portType:bufferTypes:", v13, 0, v12, v7);
              objc_msgSend(*(id *)(a1 + 264), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v13), v12);

              if (objc_msgSend((id)objc_msgSend(a2, "requestedSettings"), "constantColorFallbackPhotoDeliveryEnabled"))
              {
                v14 = -[BWNRFProcessorInput initWithSettings:portType:]([BWNRFProcessorInput alloc], "initWithSettings:portType:", a2, v12);
                -[BWStillImageProcessorControllerInput addOutputSampleBufferRouter:forBufferTypes:](v14, "addOutputSampleBufferRouter:forBufferTypes:", v27, &unk_1E4A021B0);
                objc_msgSend(a3, "addInput:sequenceNumber:portType:bufferType:", v14, 0, v12, 1);
                objc_msgSend(*(id *)(a1 + 352), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v14), v12);
                -[BWNRFProcessorInput setRemainingProcessingCount:](v14, "setRemainingProcessingCount:", -[BWNRFProcessorInput remainingProcessingCount](v14, "remainingProcessingCount") + 1);
                v6 = objc_msgSend(v26, "enqueueInputForProcessing:delegate:processErrorRecoveryFrame:processOriginalImage:processToneMapping:processInferenceInputImage:clientBracketSequenceNumber:processSemanticRendering:provideInferenceInputImageForProcessing:processSmartStyleRenderingInput:inferencesAvailable:", v14, a1, 0, 0, 0, 0, 0);

                if ((_DWORD)v6)
                  goto LABEL_28;
                v15 = -[BWPhotonicEngineNode _setupProcessingStateForIntelligentDistortionCorrectionIfNeededWithSettings:sequenceNumber:portType:processingPlan:](a1, a2, 0, v12, a3);
                if ((_DWORD)v15)
                {
                  v6 = v15;
LABEL_28:
                  FigDebugAssert3();
                  return v6;
                }
              }
              v16 = (void *)objc_msgSend(objc_alloc((Class)(p_vtable + 137)), "initWithSettings:portType:", a2, v12);
              objc_msgSend(v16, "addOutputSampleBufferRouter:forBufferTypes:", v33, v7);
              objc_msgSend(a3, "addInput:sequenceNumber:portType:bufferTypes:", v16, 0, v12, v7);
              objc_msgSend((id)objc_msgSend(*(id *)(a1 + 264), "objectForKeyedSubscript:", v12), "addObject:", v16);

              v17 = -[BWNRFProcessorInput initWithSettings:portType:]([BWNRFProcessorInput alloc], "initWithSettings:portType:", a2, v12);
              if (objc_msgSend(*(id *)(a1 + 352), "objectForKeyedSubscript:", v12))
                objc_msgSend((id)objc_msgSend(*(id *)(a1 + 352), "objectForKeyedSubscript:", v12), "addObject:", v17);
              else
                objc_msgSend(*(id *)(a1 + 352), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v17), v12);
              -[BWNRFProcessorInput setRemainingProcessingCount:](v17, "setRemainingProcessingCount:", -[BWNRFProcessorInput remainingProcessingCount](v17, "remainingProcessingCount") + 1);

              if (-[BWPhotonicEngineNode _processingNeededForSettings:portType:](a1, -[BWStillImageProcessorControllerInput stillImageSettings](v17, "stillImageSettings"), (uint64_t)-[BWStillImageProcessorControllerInput portType](v17, "portType")))
              {
                v18 = -[BWStillImageProcessorControllerInput initWithSettings:portType:]([BWColorConstancyProcessorControllerInput alloc], "initWithSettings:portType:", a2, v12);
                -[BWStillImageProcessorControllerInput addOutputSampleBufferRouter:forBufferTypes:](v18, "addOutputSampleBufferRouter:forBufferTypes:", v32, v7);
                objc_msgSend(a3, "addInput:sequenceNumber:portType:bufferTypes:", v18, 0, v12, v7);
                objc_msgSend(*(id *)(a1 + 616), "setObject:forKeyedSubscript:", v18, v12);
                v6 = objc_msgSend(v22, "enqueueInputForProcessing:delegate:", v18, a1);

                if ((_DWORD)v6)
                  goto LABEL_28;
                -[BWStillImageProcessorControllerInput addOutputSampleBufferRouter:forBufferTypes:](v17, "addOutputSampleBufferRouter:forBufferTypes:", v27, v7);
                objc_msgSend(a3, "addInput:sequenceNumber:portType:bufferTypes:", v17, 0, v12, v7);
                v19 = objc_msgSend(v26, "enqueueInputForProcessing:delegate:processErrorRecoveryFrame:processOriginalImage:processToneMapping:processInferenceInputImage:clientBracketSequenceNumber:processSemanticRendering:provideInferenceInputImageForProcessing:processSmartStyleRenderingInput:inferencesAvailable:", v17, a1, 0, 0, 0, 0, 0);
                if ((_DWORD)v19)
                {
                  v6 = v19;
                  goto LABEL_28;
                }
                v20 = -[BWPhotonicEngineNode _setupProcessingStateForIntelligentDistortionCorrectionIfNeededWithSettings:sequenceNumber:portType:processingPlan:](a1, a2, 0, v12, a3);
                v9 = v23;
                p_vtable = (void **)(BWVisionInferenceStorage + 24);
                if ((_DWORD)v20)
                {
                  v6 = v20;
                  goto LABEL_28;
                }
              }
              ++v11;
            }
            while (v9 != v11);
            v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
            if (v9)
              continue;
            break;
          }
        }
        return -[BWPhotonicEngineNode _setupProcessingStateForDisparityIfNeededWithSettings:sequenceNumber:processingPlan:](a1, a2, 0, a3);
      }
    }
  }
  return v6;
}

- (uint64_t)_setupProcessingStateForFlashCaptureWithSettings:(void *)a3 processingPlan:
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  char v12;
  void *v13;
  char v14;
  uint64_t v15;
  void *v16;
  void *v17;
  BWNRFProcessorInput *v18;
  BWSoftISPProcessorControllerInput *v19;
  BWSoftISPProcessorControllerInput *v20;
  BWSWFRProcessorControllerInput *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  BWNRFProcessorInput *v31;
  void *v32;
  BWNRFProcessorInput *v33;
  BOOL v34;
  BWLearnedNRInput *v35;
  BOOL v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  BWRedEyeReductionControllerInput *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  char v54;
  uint64_t v55;
  int v56;
  char v57;
  id v58;
  char v59;
  void *v60;
  id v61;
  id obj;
  unint64_t v63;
  int v64;
  uint64_t v65;
  uint64_t v66;
  int v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _QWORD v80[5];
  _QWORD v81[6];
  _QWORD v82[5];
  _QWORD v83[5];
  _BYTE v84[128];
  _BYTE v85[128];
  _BYTE v86[128];
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v6 = 4294894081;
  v60 = (void *)objc_msgSend(*(id *)(a1 + 168), "controllerForType:", 6);
  if (v60)
  {
    v7 = objc_msgSend(*(id *)(a1 + 168), "controllerForType:", 12);
    v8 = MEMORY[0x1E0C809B0];
    v83[0] = MEMORY[0x1E0C809B0];
    v83[1] = 3221225472;
    v83[2] = __88__BWPhotonicEngineNode__setupProcessingStateForFlashCaptureWithSettings_processingPlan___block_invoke;
    v83[3] = &unk_1E4923398;
    v83[4] = a1;
    v55 = objc_msgSend(*(id *)(a1 + 168), "controllerForType:", 11);
    v82[0] = v8;
    v82[1] = 3221225472;
    v82[2] = __88__BWPhotonicEngineNode__setupProcessingStateForFlashCaptureWithSettings_processingPlan___block_invoke_205;
    v82[3] = &unk_1E4923398;
    v82[4] = a1;
    v9 = objc_msgSend(*(id *)(a1 + 168), "controllerForType:", 15);
    v81[0] = v8;
    v81[1] = 3221225472;
    v81[2] = __88__BWPhotonicEngineNode__setupProcessingStateForFlashCaptureWithSettings_processingPlan___block_invoke_2;
    v81[3] = &unk_1E4923460;
    v81[4] = a1;
    v81[5] = a2;
    v58 = -[BWPhotonicEngineNode _standardNROutputRouterWithExpectedQueue:]((id)a1, *(_QWORD *)(a1 + 176));
    v61 = -[BWPhotonicEngineNode _bufferTypesForCaptureSettings:](a1, (void *)objc_msgSend(a2, "captureSettings"));
    v80[0] = v8;
    v80[1] = 3221225472;
    v80[2] = __88__BWPhotonicEngineNode__setupProcessingStateForFlashCaptureWithSettings_processingPlan___block_invoke_206;
    v80[3] = &unk_1E4923398;
    v80[4] = a1;
    v10 = objc_msgSend(*(id *)(a1 + 168), "controllerForType:", 4);
    v11 = objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureFlags");
    v67 = -[BWPhotonicEngineNode _isSWFRFlashCapture:](a1, a2);
    if (*(_QWORD *)(a1 + 624))
      v63 = ((unint64_t)objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureFlags") >> 16) & 1;
    else
      LODWORD(v63) = 0;
    v57 = -[BWPhotonicEngineNode _inferencesRequiredByProcessorControllersForSettings:](a1, a2);
    v12 = v67;
    if (v9)
      v12 = 0;
    v13 = v61;
    if (((v7 == 0) & (v11 >> 2)) == 0 && (v12 & 1) == 0)
    {
      v56 = v67 ^ 1;
      if (((v67 ^ 1) & 1) != 0 || (v11 & 4) != 0)
      {
        v78 = 0u;
        v79 = 0u;
        v76 = 0u;
        v77 = 0u;
        obj = -[BWPhotonicEngineNode _processingOrderByPortTypeForSettings:]((id)a1, a2);
        v65 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v86, 16);
        if (v65)
        {
          if ((v11 & 4) != 0)
            v14 = v63;
          else
            v14 = 1;
          v54 = v14;
          v66 = *(_QWORD *)v77;
          v50 = (void *)v9;
          v51 = (void *)v10;
          v59 = v11;
          while (2)
          {
            v15 = 0;
            v16 = (void *)v55;
            do
            {
              if (*(_QWORD *)v77 != v66)
                objc_enumerationMutation(obj);
              v17 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * v15);
              v18 = -[BWNRFProcessorInput initWithSettings:portType:]([BWNRFProcessorInput alloc], "initWithSettings:portType:", a2, v17);
              objc_msgSend(*(id *)(a1 + 352), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v18), v17);
              -[BWNRFProcessorInput setRemainingProcessingCount:](v18, "setRemainingProcessingCount:", -[BWNRFProcessorInput remainingProcessingCount](v18, "remainingProcessingCount") + 1);

              if (-[BWPhotonicEngineNode _processingNeededForSettings:portType:](a1, -[BWStillImageProcessorControllerInput stillImageSettings](v18, "stillImageSettings"), (uint64_t)-[BWStillImageProcessorControllerInput portType](v18, "portType")))
              {
                v64 = -[BWPhotonicEngineNode _isInferenceInputImageRequiredForSettings:portType:](a1, a2, (uint64_t)v17);
                if ((v59 & 4) != 0)
                {
                  v19 = -[BWSoftISPProcessorControllerInput initWithSettings:portType:]([BWSoftISPProcessorControllerInput alloc], "initWithSettings:portType:", a2, v17);
                  -[BWStillImageProcessorControllerInput addOutputSampleBufferRouter:forBufferTypes:](v19, "addOutputSampleBufferRouter:forBufferTypes:", v83, v13);
                  objc_msgSend(a3, "addInput:sequenceNumber:portType:bufferTypes:", v19, 0, v17, v13);
                  objc_msgSend(*(id *)(a1 + 264), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v19), v17);

                }
                if (v67)
                {
                  v20 = -[BWSoftISPProcessorControllerInput initWithSettings:portType:]([BWSoftISPProcessorControllerInput alloc], "initWithSettings:portType:", a2, v17);
                  -[BWStillImageProcessorControllerInput addOutputSampleBufferRouter:forBufferTypes:](v20, "addOutputSampleBufferRouter:forBufferTypes:", v83, v13);
                  objc_msgSend(a3, "addInput:sequenceNumber:portType:bufferTypes:", v20, 0, v17, v13);
                  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 264), "objectForKeyedSubscript:", v17), "addObject:", v20);

                  v21 = -[BWStillImageProcessorControllerInput initWithSettings:portType:]([BWSWFRProcessorControllerInput alloc], "initWithSettings:portType:", a2, v17);
                  v72 = 0u;
                  v73 = 0u;
                  v74 = 0u;
                  v75 = 0u;
                  v52 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v72, v85, 16);
                  if (v52)
                  {
                    v22 = *(_QWORD *)v73;
                    v48 = a2;
                    v49 = a3;
                    v47 = *(_QWORD *)v73;
                    while (2)
                    {
                      v23 = 0;
                      do
                      {
                        if (*(_QWORD *)v73 != v22)
                        {
                          v24 = v23;
                          objc_enumerationMutation(v13);
                          v23 = v24;
                        }
                        v53 = v23;
                        v25 = (int)objc_msgSend(*(id *)(*((_QWORD *)&v72 + 1) + 8 * v23), "intValue");
                        v68 = 0u;
                        v69 = 0u;
                        v70 = 0u;
                        v71 = 0u;
                        v26 = (void *)objc_msgSend(*(id *)(a1 + 264), "objectForKeyedSubscript:", v17);
                        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v68, v84, 16);
                        if (v27)
                        {
                          v28 = v27;
                          v29 = *(_QWORD *)v69;
LABEL_31:
                          v30 = 0;
                          while (1)
                          {
                            if (*(_QWORD *)v69 != v29)
                              objc_enumerationMutation(v26);
                            if (!ubn_insertOutputRouterForInputAfterPreviousInputForBufferType_0((uint64_t)v81, v21, *(void **)(*((_QWORD *)&v68 + 1) + 8 * v30), v25))return 4294954516;
                            if (v28 == ++v30)
                            {
                              v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v68, v84, 16);
                              if (v28)
                                goto LABEL_31;
                              break;
                            }
                          }
                        }
                        a3 = v49;
                        objc_msgSend(v49, "addInput:sequenceNumber:portType:bufferType:", v21, 0, v17, v25);
                        v23 = v53 + 1;
                        v22 = v47;
                        a2 = v48;
                        v16 = (void *)v55;
                        v13 = v61;
                      }
                      while (v53 + 1 != v52);
                      v52 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v72, v85, 16);
                      if (v52)
                        continue;
                      break;
                    }
                  }
                  objc_msgSend(*(id *)(a1 + 592), "setObject:forKeyedSubscript:", v21, v17);
                  v6 = objc_msgSend(v50, "enqueueInputForProcessing:delegate:", v21, a1);

                  if ((_DWORD)v6)
                    return v6;
                  if (v64)
                  {
                    v31 = -[BWNRFProcessorInput initWithSettings:portType:]([BWNRFProcessorInput alloc], "initWithSettings:portType:", a2, v17);
                    -[BWStillImageProcessorControllerInput addOutputSampleBufferRouter:forBufferTypes:](v31, "addOutputSampleBufferRouter:forBufferTypes:", -[BWPhotonicEngineNode _ubInferenceInputRouter]((id)a1), &unk_1E4A02168);
                    objc_msgSend(a3, "addInput:sequenceNumber:portType:bufferType:", v31, 0, v17, 15);
                    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 352), "objectForKeyedSubscript:", v17), "insertObject:atIndex:", v31, 0);
                    v6 = objc_msgSend(v60, "enqueueInputForProcessing:delegate:processErrorRecoveryFrame:processOriginalImage:processToneMapping:processInferenceInputImage:clientBracketSequenceNumber:processSemanticRendering:provideInferenceInputImageForProcessing:processSmartStyleRenderingInput:inferencesAvailable:", v31, a1, 0, 0, 0, 1, 0);

                    v13 = v61;
                    if ((_DWORD)v6)
                      goto LABEL_76;
                  }
                  if ((_DWORD)v63)
                  {
                    v32 = v13;
                    v33 = -[BWNRFProcessorInput initWithSettings:portType:]([BWNRFProcessorInput alloc], "initWithSettings:portType:", a2, v17);
                    -[BWStillImageProcessorControllerInput addOutputSampleBufferRouter:forBufferTypes:](v21, "addOutputSampleBufferRouter:forBufferTypes:", v83, v32);
                    -[BWStillImageProcessorControllerInput addOutputSampleBufferRouter:forBufferTypes:](v33, "addOutputSampleBufferRouter:forBufferTypes:", -[BWPhotonicEngineNode _ubRERRouter]((id)a1), v32);
                    objc_msgSend(a3, "addInput:sequenceNumber:portType:bufferType:", v33, 0, v17, 1);
                    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 352), "objectForKeyedSubscript:", v17), "insertObject:atIndex:", v33, 1);
                    v34 = *(_QWORD *)(a1 + 808) && BWIsSmartStyleCapture(a2);
                    HIWORD(v45) = v34;
                    WORD2(v45) = 0;
                    LODWORD(v45) = 0;
                    v6 = objc_msgSend(v60, "enqueueInputForProcessing:delegate:processErrorRecoveryFrame:processOriginalImage:processToneMapping:processInferenceInputImage:clientBracketSequenceNumber:processSemanticRendering:provideInferenceInputImageForProcessing:processSmartStyleRenderingInput:inferencesAvailable:", v33, a1, 0, 0, 1, 0, v45);

                    v13 = v61;
                    if ((_DWORD)v6)
                      goto LABEL_76;
                  }
                }
                if ((objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureFlags") & 0x80) != 0)
                {
                  if (!v16)
                    return 4294954516;
                  v35 = -[BWStillImageProcessorControllerInput initWithSettings:portType:]([BWLearnedNRInput alloc], "initWithSettings:portType:", a2, -[BWStillImageProcessorControllerInput portType](v18, "portType"));
                  -[BWStillImageProcessorControllerInput addOutputSampleBufferRouter:forBufferTypes:](v35, "addOutputSampleBufferRouter:forBufferTypes:", v82, v13);
                  objc_msgSend(a3, "addInput:sequenceNumber:portType:bufferTypes:", v35, 0, -[BWStillImageProcessorControllerInput portType](v18, "portType"), v13);
                  objc_msgSend(*(id *)(a1 + 400), "setObject:forKeyedSubscript:", v35, -[BWStillImageProcessorControllerInput portType](v35, "portType"));
                  v6 = objc_msgSend(v16, "enqueueInputForProcessing:delegate:", v35, a1);

                  if ((_DWORD)v6)
                    return v6;
                }
                if ((v64 & v56) != 0)
                {
                  -[BWStillImageProcessorControllerInput addOutputSampleBufferRouter:forBufferTypes:](v18, "addOutputSampleBufferRouter:forBufferTypes:", -[BWPhotonicEngineNode _ubInferenceInputRouter]((id)a1), &unk_1E4A02180);
                  objc_msgSend(a3, "addInput:sequenceNumber:portType:bufferType:", v18, 0, v17, 15);
                }
                -[BWStillImageProcessorControllerInput addOutputSampleBufferRouter:forBufferTypes:](v18, "addOutputSampleBufferRouter:forBufferTypes:", v58, v13);
                objc_msgSend(a3, "addInput:sequenceNumber:portType:bufferTypes:", v18, 0, v17, v13);
                v36 = 0;
                if ((v54 & 1) == 0)
                {
                  if (*(_QWORD *)(a1 + 808))
                    v36 = BWIsSmartStyleCapture(a2);
                  else
                    v36 = 0;
                }
                HIBYTE(v46) = v57;
                BYTE6(v46) = v36;
                BYTE5(v46) = v64 & v56;
                BYTE4(v46) = 0;
                LODWORD(v46) = 0;
                v37 = objc_msgSend(v60, "enqueueInputForProcessing:delegate:processErrorRecoveryFrame:processOriginalImage:processToneMapping:processInferenceInputImage:clientBracketSequenceNumber:processSemanticRendering:provideInferenceInputImageForProcessing:processSmartStyleRenderingInput:inferencesAvailable:", v18, a1, 0, 0, 0, 0, v46);
                if ((_DWORD)v37)
                {
                  v6 = v37;
LABEL_76:
                  FigDebugAssert3();
                  return v6;
                }
                v38 = -[BWPhotonicEngineNode _setupProcessingStateForIntelligentDistortionCorrectionIfNeededWithSettings:sequenceNumber:portType:processingPlan:](a1, a2, 0, (uint64_t)v17, a3);
                if ((_DWORD)v38)
                {
                  v6 = v38;
                  goto LABEL_76;
                }
                v39 = -[BWPhotonicEngineNode _setupProcessingStateForScalerIfNeededWithSettings:sequenceNumber:portType:processingPlan:](a1, a2, 0, v17, a3);
                if ((_DWORD)v39)
                {
                  v6 = v39;
                  goto LABEL_76;
                }
                v40 = -[BWPhotonicEngineNode _setupProcessingStateForDeepZoomWithSettings:sequenceNumber:portType:processingPlan:]((id *)a1, a2, 0, (uint64_t)v17, a3);
                if ((_DWORD)v40)
                {
                  v6 = v40;
                  goto LABEL_76;
                }
                if ((_DWORD)v63)
                {
                  if (!v51)
                    return 4294954516;
                  v41 = -[BWStillImageProcessorControllerInput initWithSettings:portType:]([BWRedEyeReductionControllerInput alloc], "initWithSettings:portType:", a2, v17);
                  -[BWStillImageProcessorControllerInput addOutputSampleBufferRouter:forBufferTypes:](v41, "addOutputSampleBufferRouter:forBufferTypes:", v80, &unk_1E4A02198);
                  objc_msgSend(a3, "addInput:sequenceNumber:portType:bufferTypes:", v41, 0, v17, &unk_1E4A02198);
                  objc_msgSend(*(id *)(a1 + 632), "setObject:forKeyedSubscript:", v41, v17);
                  v6 = objc_msgSend(v51, "enqueueInputForProcessing:delegate:", v41, a1);

                  if ((_DWORD)v6)
                    return v6;
                }
                v42 = -[BWPhotonicEngineNode _setupProcessingStateForSmartStyleWithSettings:sequenceNumber:portType:processingPlan:](a1, a2, 0, (uint64_t)v17, a3);
                if ((_DWORD)v42)
                {
                  v6 = v42;
                  goto LABEL_76;
                }
              }
              ++v15;
            }
            while (v15 != v65);
            v65 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v86, 16);
            if (v65)
              continue;
            break;
          }
        }
        v43 = -[BWPhotonicEngineNode _setupProcessingStateForJasperDisparityIfNeededWithSettings:processingPlan:](a1, a2, a3);
        if (!(_DWORD)v43)
          return -[BWPhotonicEngineNode _setupProcessingStateForDisparityIfNeededWithSettings:sequenceNumber:processingPlan:](a1, a2, 0, a3);
        return v43;
      }
      else
      {
        return 4294954516;
      }
    }
  }
  return v6;
}

- (uint64_t)_setupProcessingStateForSingleImageCaptureWithSettings:(void *)a3 processingPlan:
{
  uint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  BWNRFProcessorInput *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  BWLearnedNRInput *v26;
  uint64_t v27;
  int v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  unint64_t v42;
  char v43;
  char v44;
  void *v45;
  id obj;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _QWORD v55[5];
  _QWORD v56[5];
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v45 = (void *)objc_msgSend(*(id *)(a1 + 168), "controllerForType:", 6);
  if (!v45)
    return 4294894081;
  v38 = a3;
  v6 = MEMORY[0x1E0C809B0];
  v56[0] = MEMORY[0x1E0C809B0];
  v56[1] = 3221225472;
  v56[2] = __94__BWPhotonicEngineNode__setupProcessingStateForSingleImageCaptureWithSettings_processingPlan___block_invoke;
  v56[3] = &unk_1E4923398;
  v56[4] = a1;
  v39 = (void *)objc_msgSend(*(id *)(a1 + 168), "controllerForType:", 11);
  v55[0] = v6;
  v55[1] = 3221225472;
  v55[2] = __94__BWPhotonicEngineNode__setupProcessingStateForSingleImageCaptureWithSettings_processingPlan___block_invoke_201;
  v55[3] = &unk_1E4923398;
  v55[4] = a1;
  v40 = -[BWPhotonicEngineNode _standardNROutputRouterWithExpectedQueue:]((id)a1, *(_QWORD *)(a1 + 176));
  obj = (id)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v41 = -[BWPhotonicEngineNode _bufferTypesForCaptureSettings:](a1, (void *)objc_msgSend(a2, "captureSettings"));
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v7 = a1;
  v8 = (void *)a1;
  v9 = a2;
  v10 = -[BWPhotonicEngineNode _processingOrderByPortTypeForSettings:](v8, a2);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v51, v58, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v52;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v52 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * i);
        v16 = -[BWNRFProcessorInput initWithSettings:portType:]([BWNRFProcessorInput alloc], "initWithSettings:portType:", v9, v15);
        objc_msgSend(*(id *)(v7 + 352), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v16), v15);
        objc_msgSend(obj, "addObject:", v16);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v51, v58, 16);
    }
    while (v12);
  }
  v17 = v9;
  v44 = -[BWPhotonicEngineNode _isSemanticRenderingCapture:](v7, v9);
  v43 = -[BWPhotonicEngineNode _inferencesRequiredByProcessorControllersForSettings:](v7, v9);
  if (*(_QWORD *)(v7 + 808))
  {
    v18 = v38;
    if (BWIsSmartStyleCapture(v9))
      v42 = ((unint64_t)objc_msgSend((id)objc_msgSend(v9, "captureSettings"), "captureFlags") >> 7) & 1;
    else
      LOBYTE(v42) = 0;
  }
  else
  {
    LOBYTE(v42) = 0;
    v18 = v38;
  }
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v57, 16);
  v20 = v40;
  v21 = v41;
  if (v19)
  {
    v22 = v19;
    v23 = *(_QWORD *)v48;
    while (2)
    {
      for (j = 0; j != v22; ++j)
      {
        if (*(_QWORD *)v48 != v23)
          objc_enumerationMutation(obj);
        v25 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * j);
        if (-[BWPhotonicEngineNode _processingNeededForSettings:portType:](v7, (void *)objc_msgSend(v25, "stillImageSettings"), objc_msgSend(v25, "portType")))
        {
          if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v17, "captureSettings"), "captureStreamSettingsForPortType:", objc_msgSend(v25, "portType")), "sensorRawCapturedForFinalImageProcessing"))-[BWPhotonicEngineNode _setupSoftISPProcessingStateIfNeededWithSettings:portType:](v7, v17, (void *)objc_msgSend(v25, "portType"));
          if ((objc_msgSend((id)objc_msgSend(v17, "captureSettings"), "captureFlags") & 0x80) != 0
            && (-[BWPhotonicEngineNode _isDeferredRawLearnedNRCapture:](v7, v17) & 1) == 0)
          {
            if (!v39)
              return 4294954516;
            v26 = -[BWStillImageProcessorControllerInput initWithSettings:portType:]([BWLearnedNRInput alloc], "initWithSettings:portType:", v17, objc_msgSend(v25, "portType"));
            -[BWStillImageProcessorControllerInput addOutputSampleBufferRouter:forBufferTypes:](v26, "addOutputSampleBufferRouter:forBufferTypes:", v55, v41);
            objc_msgSend(v18, "addInput:sequenceNumber:portType:bufferTypes:", v26, 0, objc_msgSend(v25, "portType"), v41);
            objc_msgSend(*(id *)(v7 + 400), "setObject:forKeyedSubscript:", v26, -[BWStillImageProcessorControllerInput portType](v26, "portType"));
            v27 = objc_msgSend(v39, "enqueueInputForProcessing:delegate:", v26, v7);

            v20 = v40;
            v21 = v41;
            if ((_DWORD)v27)
              return v27;
          }
          v28 = -[BWPhotonicEngineNode _isInferenceInputImageRequiredForSettings:portType:](v7, v17, objc_msgSend(v25, "portType"));
          v29 = v28;
          if (v28)
          {
            objc_msgSend(v25, "addOutputSampleBufferRouter:forBufferTypes:", -[BWPhotonicEngineNode _ubInferenceInputRouter]((id)v7), &unk_1E4A02150);
            objc_msgSend(v18, "addInput:sequenceNumber:portType:bufferType:", v25, 0, objc_msgSend(v25, "portType"), 15);
          }
          objc_msgSend(v25, "addOutputSampleBufferRouter:forBufferTypes:", v20, v21);
          objc_msgSend(v18, "addInput:sequenceNumber:portType:bufferTypes:", v25, 0, objc_msgSend(v25, "portType"), v21);
          HIBYTE(v37) = v43;
          BYTE6(v37) = v42;
          BYTE5(v37) = v29;
          BYTE4(v37) = v44;
          LODWORD(v37) = 0;
          v30 = objc_msgSend(v45, "enqueueInputForProcessing:delegate:processErrorRecoveryFrame:processOriginalImage:processToneMapping:processInferenceInputImage:clientBracketSequenceNumber:processSemanticRendering:provideInferenceInputImageForProcessing:processSmartStyleRenderingInput:inferencesAvailable:", v25, v7, 0, 0, 0, 0, v37);
          if ((_DWORD)v30)
          {
            v27 = v30;
LABEL_45:
            FigDebugAssert3();
            return v27;
          }
          v31 = -[BWPhotonicEngineNode _setupProcessingStateForIntelligentDistortionCorrectionIfNeededWithSettings:sequenceNumber:portType:processingPlan:](v7, v17, 0, objc_msgSend(v25, "portType"), v18);
          if ((_DWORD)v31)
          {
            v27 = v31;
            goto LABEL_45;
          }
          v32 = -[BWPhotonicEngineNode _setupProcessingStateForScalerIfNeededWithSettings:sequenceNumber:portType:processingPlan:](v7, v17, 0, (void *)objc_msgSend(v25, "portType"), v18);
          if ((_DWORD)v32)
          {
            v27 = v32;
            goto LABEL_45;
          }
          v33 = -[BWPhotonicEngineNode _setupProcessingStateForDeepZoomWithSettings:sequenceNumber:portType:processingPlan:]((id *)v7, v17, 0, objc_msgSend(v25, "portType"), v18);
          if ((_DWORD)v33)
          {
            v27 = v33;
            goto LABEL_45;
          }
          v34 = -[BWPhotonicEngineNode _setupProcessingStateForSmartStyleWithSettings:sequenceNumber:portType:processingPlan:](v7, v17, 0, objc_msgSend(v25, "portType"), v18);
          if ((_DWORD)v34)
          {
            v27 = v34;
            goto LABEL_45;
          }
          -[BWPhotonicEngineNode _setupDeferredProcessingWithSettings:portType:](v7, v17, (void *)objc_msgSend(v25, "portType"));
        }
        objc_msgSend(v25, "setRemainingProcessingCount:", objc_msgSend(v25, "remainingProcessingCount") + 1);
      }
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v57, 16);
      if (v22)
        continue;
      break;
    }
  }
  v35 = -[BWPhotonicEngineNode _setupProcessingStateForJasperDisparityIfNeededWithSettings:processingPlan:](v7, v17, v18);
  if ((_DWORD)v35)
    return v35;
  v27 = -[BWPhotonicEngineNode _setupProcessingStateForDisparityIfNeededWithSettings:sequenceNumber:processingPlan:](v7, v17, 0, v18);
  if (!(_DWORD)v27)
    -[BWPhotonicEngineNode _setupSoftISPOutputRoutingIfNeededWithOutputSampleBufferRouter:processingPlan:](v7, (uint64_t)v56, v18);
  return v27;
}

- (id)_nrfOutputSbufRouter
{
  _QWORD v1[5];

  if (result)
  {
    v1[0] = MEMORY[0x1E0C809B0];
    v1[1] = 3221225472;
    v1[2] = __44__BWPhotonicEngineNode__nrfOutputSbufRouter__block_invoke;
    v1[3] = &unk_1E4923398;
    v1[4] = result;
    return (id)objc_msgSend(v1, "copy");
  }
  return result;
}

- (uint64_t)_setupProcessingStateForDeepZoomWithSettings:(uint64_t)a3 sequenceNumber:(uint64_t)a4 portType:(void *)a5 processingPlan:
{
  uint64_t v5;
  int v11;
  uint64_t v12;
  int v13;
  int v14;
  uint64_t v15;
  BWDeepZoomProcessorInput *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  void *v33;
  uint64_t v35;
  uint64_t v36;
  id *v37;
  uint64_t v38;
  void *v39;
  id obj;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _QWORD v49[6];
  _QWORD v50[7];
  void *v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  if (!_FigIsCurrentDispatchQueue())
  {
    v36 = v5;
    LODWORD(v35) = 0;
    FigDebugAssert3();
  }
  if (!a1[86] || (objc_msgSend((id)objc_msgSend(a2, "requestedSettings"), "bypassUpscaling") & 1) != 0)
    goto LABEL_42;
  v11 = objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureType");
  v12 = objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureFlags");
  v13 = objc_msgSend(a1[86], "type");
  v14 = v13;
  if (v11 == 1)
  {
    v15 = 0;
    v16 = 0;
    if ((v12 & 0x80) == 0 || v13 != 2)
      goto LABEL_44;
  }
  else
  {
    if (v11 != 12)
      goto LABEL_42;
    if ((v12 & 0x200000000) == 0)
    {
      if (v13 != 1)
        goto LABEL_42;
      goto LABEL_15;
    }
    if (v13 != 3)
    {
LABEL_42:
      v16 = 0;
      goto LABEL_43;
    }
  }
LABEL_15:
  v17 = MEMORY[0x1E0C809B0];
  v50[0] = MEMORY[0x1E0C809B0];
  v50[1] = 3221225472;
  v50[2] = __108__BWPhotonicEngineNode__setupProcessingStateForDeepZoomWithSettings_sequenceNumber_portType_processingPlan___block_invoke;
  v50[3] = &unk_1E4923438;
  v50[4] = a1;
  v50[5] = a2;
  v50[6] = a4;
  v16 = -[BWStillImageProcessorControllerInput initWithSettings:portType:]([BWDeepZoomProcessorInput alloc], "initWithSettings:portType:", a2, a4);
  objc_msgSend(a2, "requestedSettings");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_19;
  v18 = objc_msgSend((id)objc_msgSend(a2, "requestedSettings"), "semanticStyle");
  v19 = 0;
  v20 = 0;
  if (v14 != 3 || !v18)
    goto LABEL_20;
  if (!FigCaptureVideoDimensionsAreValid(objc_msgSend(a1[86], "stereoPhotoOutputDimensions")))
  {
    v20 = +[BWDeepFusionProcessorInput inputForOnlyApplyingSemanticStyleWithSettings:portType:](BWDeepFusionProcessorInput, "inputForOnlyApplyingSemanticStyleWithSettings:portType:", a2, a4);
    v49[0] = v17;
    v49[1] = 3221225472;
    v49[2] = __108__BWPhotonicEngineNode__setupProcessingStateForDeepZoomWithSettings_sequenceNumber_portType_processingPlan___block_invoke_227;
    v49[3] = &unk_1E4923460;
    v49[4] = a1;
    v49[5] = v20;
    v19 = v49;
  }
  else
  {
LABEL_19:
    v19 = 0;
    v20 = 0;
  }
LABEL_20:
  v38 = (uint64_t)v19;
  v39 = v20;
  v21 = -[BWPhotonicEngineNode _bufferTypesExcludingErrorRecoveryTypesForCaptureSettings:](a1, (void *)objc_msgSend(a2, "captureSettings", v35, v36));
  v37 = a1;
  obj = -[BWPhotonicEngineNode _errorRecoveryBufferTypesForBufferTypes:](a1, v21);
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v46 != v24)
          objc_enumerationMutation(v21);
        v26 = (int)objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * i), "intValue");
        v27 = (void *)objc_msgSend(a5, "lastAddedInputForSequenceNumber:portType:bufferType:", a3, a4, v26);
        if (v27)
        {
          if (!ubn_insertOutputRouterForInputAfterPreviousInputForBufferType_0((uint64_t)v50, v16, v27, v26))goto LABEL_46;
          objc_msgSend(a5, "addInput:sequenceNumber:portType:bufferType:", v16, a3, a4, v26);
        }
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
    }
    while (v23);
  }
  if (v38 && v39)
  {
    if (!ubn_insertOutputRouterForInputAfterPreviousInputForBufferType_0(v38, v39, v16, 13))
    {
LABEL_46:
      v15 = 4294954516;
      goto LABEL_44;
    }
    objc_msgSend(a5, "addInput:sequenceNumber:portType:bufferType:", v39, a3, a4, 13);
  }
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v52, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v42;
    do
    {
      for (j = 0; j != v29; ++j)
      {
        if (*(_QWORD *)v42 != v30)
          objc_enumerationMutation(obj);
        v32 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * j);
        v33 = (void *)objc_msgSend(a5, "lastAddedInputForSequenceNumber:portType:bufferType:", a3, a4, (int)objc_msgSend(v32, "intValue"));
        v51 = v32;
        objc_msgSend(v33, "addBypassedProcessorType:forBufferTypes:", 10, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v51, 1));
      }
      v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v52, 16);
    }
    while (v29);
  }
  objc_msgSend(v37[87], "setObject:forKeyedSubscript:", v16, a4);
LABEL_43:
  v15 = 0;
LABEL_44:

  return v15;
}

- (uint64_t)_setupProcessingStateForSmartStyleWithSettings:(uint64_t)a3 sequenceNumber:(uint64_t)a4 portType:(void *)a5 processingPlan:
{
  uint64_t v5;
  uint64_t v10;
  BWSmartStyleRenderingProcessorInput *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[6];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v10 = result;
    if (!_FigIsCurrentDispatchQueue())
    {
      v20 = v5;
      LODWORD(v19) = 0;
      FigDebugAssert3();
    }
    if (*(_QWORD *)(v10 + 808))
    {
      result = BWIsSmartStyleCapture(a2);
      if (!(_DWORD)result)
        return result;
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __110__BWPhotonicEngineNode__setupProcessingStateForSmartStyleWithSettings_sequenceNumber_portType_processingPlan___block_invoke;
      v25[3] = &unk_1E4923460;
      v25[4] = v10;
      v25[5] = a4;
      v11 = -[BWSmartStyleRenderingProcessorInput initWithSettings:portType:]([BWSmartStyleRenderingProcessorInput alloc], "initWithSettings:portType:", a2, a4);
      v12 = -[BWPhotonicEngineNode _bufferTypesForCaptureSettings:](v10, (void *)objc_msgSend(a2, "captureSettings"));
      v21 = 0u;
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v22;
        while (2)
        {
          v16 = 0;
          do
          {
            if (*(_QWORD *)v22 != v15)
              objc_enumerationMutation(v12);
            v17 = (int)objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v16), "intValue", v19, v20);
            v18 = (void *)objc_msgSend(a5, "lastAddedInputForSequenceNumber:portType:bufferType:", a3, a4, v17);
            if (v18)
            {
              if (!ubn_insertOutputRouterForInputAfterPreviousInputForBufferType_0((uint64_t)v25, v11, v18, v17))return 4294954516;
              objc_msgSend(a5, "addInput:sequenceNumber:portType:bufferType:", v11, a3, a4, v17);
            }
            ++v16;
          }
          while (v14 != v16);
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
          if (v14)
            continue;
          break;
        }
      }
      objc_msgSend(*(id *)(v10 + 816), "setObject:forKeyedSubscript:", v11, a4, v19);

    }
    return 0;
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
    if (!_FigIsCurrentDispatchQueue())
      FigDebugAssert3();
    if (-[BWPhotonicEngineNode _generateDisparityForSettings:](v4, a2))
    {
      v8 = objc_msgSend(*(id *)(v4 + 168), "controllerForType:", 8);
      if (v8)
      {
        v9 = -[BWStereoDisparityProcessorInput initWithSettings:portType:]([BWStereoDisparityProcessorInput alloc], "initWithSettings:portType:", a2, objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "masterPortType"));
        ++*(_DWORD *)(v4 + 776);
        v10 = *(_QWORD **)(v4 + 784);
        v11 = MEMORY[0x1E0C809B0];
        block = MEMORY[0x1E0C809B0];
        v20 = 3221225472;
        v21 = __65__BWPhotonicEngineNode__standardNROutputRouterWithExpectedQueue___block_invoke;
        v22 = &unk_1E4923460;
        v23 = v10;
        v24 = v4;
        -[BWStillImageProcessorControllerInput addOutputSampleBufferRouter:forBufferTypes:](v9, "addOutputSampleBufferRouter:forBufferTypes:", (id)objc_msgSend(&block, "copy"), &unk_1E4A021F8);
        objc_msgSend(a4, "addInput:sequenceNumber:portType:bufferType:", v9, a3, objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "masterPortType"), 20);
        if (objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureType") == 7)
          objc_msgSend(*(id *)(v4 + 800), "setObject:forKeyedSubscript:", v9, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a3));
        else
          *(_QWORD *)(v4 + 768) = v9;
        v12 = *(NSObject **)(v4 + 784);
        v14[0] = v11;
        v14[1] = 3221225472;
        v14[2] = __108__BWPhotonicEngineNode__setupProcessingStateForDisparityIfNeededWithSettings_sequenceNumber_processingPlan___block_invoke;
        v14[3] = &unk_1E49233C0;
        v14[4] = v8;
        v14[5] = v9;
        v14[6] = v4;
        v14[7] = &v15;
        block = v11;
        v20 = 3221225472;
        v21 = __ubn_dispatch_sync_block_invoke_0;
        v22 = &unk_1E491ECB8;
        v23 = v14;
        dispatch_sync(v12, &block);
      }
      else
      {
        *((_DWORD *)v16 + 6) = -73215;
      }
    }
    v4 = *((unsigned int *)v16 + 6);
    _Block_object_dispose(&v15, 8);
  }
  return v4;
}

- (uint64_t)_setupProcessingStateForDeepFusionWithSettings:(void *)a3 processingPlan:
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  BWDeepFusionProcessorInput *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _BOOL4 v36;
  int v37;
  void *v38;
  id obj;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _QWORD v48[5];
  _QWORD v49[5];
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v38 = (void *)objc_msgSend(*(id *)(a1 + 168), "controllerForType:", 2);
  if (!v38)
    return 4294894081;
  if (!_FigIsCurrentDispatchQueue())
  {
    v33 = v3;
    LODWORD(v32) = 0;
    FigDebugAssert3();
  }
  v48[0] = MEMORY[0x1E0C809B0];
  v48[1] = 3221225472;
  v48[2] = __86__BWPhotonicEngineNode__setupProcessingStateForDeepFusionWithSettings_processingPlan___block_invoke;
  v48[3] = &unk_1E4923398;
  v48[4] = a1;
  v37 = -[BWPhotonicEngineNode _inferencesRequiredByProcessorControllersForSettings:](a1, a2);
  v36 = *(_QWORD *)(a1 + 808) && BWIsSmartStyleCapture(a2);
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = (id)objc_msgSend((id)objc_msgSend(a2, "captureSettings", v32, v33), "captureStreamSettings");
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
  if (!v7)
    return 0;
  v8 = v7;
  v9 = *(_QWORD *)v45;
  v34 = *(_QWORD *)v45;
  while (2)
  {
    v10 = 0;
    v35 = v8;
    do
    {
      if (*(_QWORD *)v45 != v9)
        objc_enumerationMutation(obj);
      v11 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v10);
      if (-[BWPhotonicEngineNode _deepFusionProcessorInputNeededForSettings:portType:](a1, a2, objc_msgSend(v11, "portType")))
      {
        if (-[BWPhotonicEngineNode _isInferenceInputImageRequiredForSettings:portType:](a1, a2, objc_msgSend(v11, "portType")))
        {
          if (objc_msgSend(*(id *)(a1 + 112), "deferredPhotoProcessorEnabled"))
            v12 = objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "downgradedDeepFusionEnhancedResolutionCapture");
          else
            v12 = 1;
        }
        else
        {
          v12 = 0;
        }
        if (v37)
          v13 = ((unint64_t)objc_msgSend(v11, "captureFlags") >> 33) & 1;
        else
          v13 = 0;
        v14 = -[BWDeepFusionProcessorInput initWithSettings:portType:processInferenceInputImage:processQuadraForEnhancedResolutionInferenceInputImage:processSmartStyleRenderingInput:]([BWDeepFusionProcessorInput alloc], "initWithSettings:portType:processInferenceInputImage:processQuadraForEnhancedResolutionInferenceInputImage:processSmartStyleRenderingInput:", a2, objc_msgSend(v11, "portType"), v12, v13, v36);
        v15 = -[BWPhotonicEngineNode _bufferTypesForCaptureSettings:](a1, (void *)objc_msgSend(a2, "captureSettings"));
        -[BWStillImageProcessorControllerInput addOutputSampleBufferRouter:forBufferTypes:](v14, "addOutputSampleBufferRouter:forBufferTypes:", v48, v15);
        v16 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v17 = v16;
        if ((_DWORD)v12)
          objc_msgSend(v16, "addObject:", &unk_1E49FC6F0);
        if ((_DWORD)v13)
          objc_msgSend(v17, "addObject:", &unk_1E49FC750);
        if (objc_msgSend(v17, "count"))
        {
          v49[0] = MEMORY[0x1E0C809B0];
          v49[1] = 3221225472;
          v49[2] = __47__BWPhotonicEngineNode__ubInferenceInputRouter__block_invoke;
          v49[3] = &unk_1E4923398;
          v49[4] = a1;
          -[BWStillImageProcessorControllerInput addOutputSampleBufferRouter:forBufferTypes:](v14, "addOutputSampleBufferRouter:forBufferTypes:", (id)objc_msgSend(v49, "copy"), v17);
          objc_msgSend(a3, "addInput:sequenceNumber:portType:bufferTypes:", v14, 0, objc_msgSend(v11, "portType"), v17);
        }
        objc_msgSend(a3, "addInput:sequenceNumber:portType:bufferTypes:", v14, 0, objc_msgSend(v11, "portType"), v15);
        objc_msgSend(*(id *)(a1 + 416), "setObject:forKeyedSubscript:", v14, -[BWStillImageProcessorControllerInput portType](v14, "portType"));
        v18 = objc_msgSend(v38, "enqueueInputForProcessing:delegate:", v14, a1);

        if ((_DWORD)v18)
          return v18;
        v19 = -[BWPhotonicEngineNode _setupProcessingStateForIntelligentDistortionCorrectionIfNeededWithSettings:sequenceNumber:portType:processingPlan:](a1, a2, 0, (uint64_t)-[BWStillImageProcessorControllerInput portType](v14, "portType"), a3);
        if ((_DWORD)v19)
        {
          v18 = v19;
LABEL_50:
          FigDebugAssert3();
          return v18;
        }
        v20 = -[BWPhotonicEngineNode _setupProcessingStateForScalerIfNeededWithSettings:sequenceNumber:portType:processingPlan:](a1, a2, 0, -[BWStillImageProcessorControllerInput portType](v14, "portType"), a3);
        if ((_DWORD)v20)
        {
          v18 = v20;
          goto LABEL_50;
        }
        if (objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "learnedNRStereoPhotoFrameFlag"))
        {
          v42 = 0u;
          v43 = 0u;
          v40 = 0u;
          v41 = 0u;
          v21 = (void *)objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "secondaryPortTypes");
          v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
          if (v22)
          {
            v23 = v22;
            v24 = *(_QWORD *)v41;
            while (2)
            {
              for (i = 0; i != v23; ++i)
              {
                if (*(_QWORD *)v41 != v24)
                  objc_enumerationMutation(v21);
                v26 = -[BWPhotonicEngineNode _setupProcessingStateForIntelligentDistortionCorrectionIfNeededWithSettings:sequenceNumber:portType:processingPlan:](a1, a2, 0, *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i), a3);
                if ((_DWORD)v26)
                {
                  v18 = v26;
                  goto LABEL_50;
                }
                v27 = -[BWPhotonicEngineNode _setupProcessingStateForScalerIfNeededWithSettings:sequenceNumber:portType:processingPlan:](a1, a2, 0, -[BWStillImageProcessorControllerInput portType](v14, "portType"), a3);
                if ((_DWORD)v27)
                {
                  v18 = v27;
                  goto LABEL_50;
                }
              }
              v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
              if (v23)
                continue;
              break;
            }
          }
        }
        v28 = -[BWPhotonicEngineNode _setupProcessingStateForDeepZoomWithSettings:sequenceNumber:portType:processingPlan:]((id *)a1, a2, 0, (uint64_t)-[BWStillImageProcessorControllerInput portType](v14, "portType"), a3);
        if ((_DWORD)v28)
        {
          v18 = v28;
          goto LABEL_50;
        }
        v29 = -[BWPhotonicEngineNode _setupProcessingStateForStereoPhotoDeepZoomTransferWithSettings:processingPlan:](a1, a2, a3);
        if ((_DWORD)v29)
        {
          v18 = v29;
          goto LABEL_50;
        }
        v30 = -[BWPhotonicEngineNode _setupProcessingStateForSmartStyleWithSettings:sequenceNumber:portType:processingPlan:](a1, a2, 0, (uint64_t)-[BWStillImageProcessorControllerInput portType](v14, "portType"), a3);
        v9 = v34;
        v8 = v35;
        if ((_DWORD)v30)
        {
          v18 = v30;
          goto LABEL_50;
        }
      }
      ++v10;
    }
    while (v10 != v8);
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
    v18 = 0;
    if (v8)
      continue;
    return v18;
  }
}

- (uint64_t)_setupProcessingStateForPointCloudDepthIfNeededWithSettings:(void *)a3 processingPlan:
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  BWJasperColorStillsExecutorInput *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  id obj;
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
  _QWORD v47[6];
  _BYTE v48[128];
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v6 = result;
    if (!_FigIsCurrentDispatchQueue())
    {
      v28 = v3;
      LODWORD(v27) = 0;
      FigDebugAssert3();
    }
    if ((objc_msgSend((id)objc_msgSend(a2, "captureSettings", v27, v28), "captureFlags") & 0x200) != 0
      && *(_QWORD *)(v6 + 864))
    {
      v7 = objc_msgSend(*(id *)(v6 + 168), "controllerForType:", 9);
      if (v7)
      {
        v8 = (void *)v7;
        v9 = -[BWPhotonicEngineNode _bufferTypesForCaptureSettings:](v6, (void *)objc_msgSend(a2, "captureSettings"));
        v47[0] = MEMORY[0x1E0C809B0];
        v47[1] = 3221225472;
        v47[2] = __99__BWPhotonicEngineNode__setupProcessingStateForPointCloudDepthIfNeededWithSettings_processingPlan___block_invoke;
        v47[3] = &unk_1E4923460;
        v47[4] = v6;
        v47[5] = v8;
        v10 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v43 = 0u;
        v44 = 0u;
        v45 = 0u;
        v46 = 0u;
        obj = (id)objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "portTypes");
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v44;
          v29 = *(_QWORD *)v44;
          v30 = a2;
          v32 = v10;
          do
          {
            v14 = 0;
            v31 = v12;
            do
            {
              if (*(_QWORD *)v44 != v13)
                objc_enumerationMutation(obj);
              v15 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v14);
              if (-[BWPhotonicEngineNode _processingNeededForSettings:portType:](v6, a2, (uint64_t)v15))
              {
                v34 = v14;
                v16 = -[BWJasperColorStillsExecutorInput initWithSettings:portType:timeOfFlightCameraType:]([BWJasperColorStillsExecutorInput alloc], "initWithSettings:portType:timeOfFlightCameraType:", a2, v15, objc_msgSend((id)objc_msgSend(*(id *)(v6 + 104), "supplementalPointCloudCaptureDevice"), "timeOfFlightCameraType"));
                v39 = 0u;
                v40 = 0u;
                v41 = 0u;
                v42 = 0u;
                v17 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
                if (v17)
                {
                  v18 = v17;
                  v19 = *(_QWORD *)v40;
                  while (2)
                  {
                    for (i = 0; i != v18; ++i)
                    {
                      if (*(_QWORD *)v40 != v19)
                        objc_enumerationMutation(v9);
                      v21 = (int)objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * i), "intValue");
                      v22 = (void *)objc_msgSend(a3, "lastAddedInputForSequenceNumber:portType:bufferType:", 0, v15, v21);
                      if (v22)
                      {
                        if (!ubn_insertOutputRouterForInputAfterPreviousInputForBufferType_0((uint64_t)v47, v16, v22, v21))return 4294954516;
                        objc_msgSend(a3, "addInput:sequenceNumber:portType:bufferType:", v16, 0, v15, v21);
                      }
                    }
                    v18 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
                    if (v18)
                      continue;
                    break;
                  }
                }
                a2 = v30;
                if (objc_msgSend(v15, "isEqualToString:", objc_msgSend((id)objc_msgSend(v30, "captureSettings"), "masterPortType")))objc_msgSend(v32, "insertObject:atIndex:", v16, 0);
                else
                  objc_msgSend(v32, "addObject:", v16);
                v13 = v29;
                v12 = v31;
                v14 = v34;
              }
              ++v14;
            }
            while (v14 != v12);
            v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
            v10 = v32;
          }
          while (v12);
        }
        v37 = 0u;
        v38 = 0u;
        v35 = 0u;
        v36 = 0u;
        result = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v35, v48, 16);
        if (result)
        {
          v23 = result;
          v24 = *(_QWORD *)v36;
          do
          {
            v25 = 0;
            do
            {
              if (*(_QWORD *)v36 != v24)
                objc_enumerationMutation(v10);
              v26 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v25);
              objc_msgSend(v8, "enqueueInputForProcessing:delegate:", v26, v6);
              objc_msgSend(*(id *)(v6 + 872), "setObject:forKeyedSubscript:", v26, objc_msgSend(v26, "portType"));
              ++v25;
            }
            while (v23 != v25);
            result = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v35, v48, 16);
            v23 = result;
          }
          while (result);
        }
      }
      else
      {
        return 4294894081;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (id)_softISPFusionCaptureOutputSbufRouter
{
  _QWORD v1[5];

  if (result)
  {
    v1[0] = MEMORY[0x1E0C809B0];
    v1[1] = 3221225472;
    v1[2] = __61__BWPhotonicEngineNode__softISPFusionCaptureOutputSbufRouter__block_invoke;
    v1[3] = &unk_1E4923398;
    v1[4] = result;
    return (id)objc_msgSend(v1, "copy");
  }
  return result;
}

void __86__BWPhotonicEngineNode__setupProcessingStateForDeepFusionWithSettings_processingPlan___block_invoke(uint64_t a1, const void *a2, uint64_t a3, void *a4, int a5)
{
  uint64_t v10;
  uint64_t v11;

  if (!_FigIsCurrentDispatchQueue())
    FigDebugAssert3();
  -[BWPhotonicEngineNode _waitForAndMergeInferencesIfNeededForSampleBuffer:processorInput:](*(_BOOL8 **)(a1 + 32), a2, a4);
  if (!a5)
  {
    if ((objc_msgSend((id)objc_msgSend(a4, "captureSettings"), "captureFlags") & 0x200000000) == 0)
      -[BWPhotonicEngineNode _beginStereoPhotoProcessingIfNeededForSettings:](*(_QWORD *)(a1 + 32), (void *)objc_msgSend(a4, "stillImageSettings"));
    v10 = *(_QWORD *)(a1 + 32);
    v11 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("buffer of type '%@' requested for '%@'"), BWStillImageProcessorTypeToShortString(a3), a4);
    -[BWPhotonicEngineNode _emitSampleBuffer:description:](v10, a2, v11);
  }
}

- (uint64_t)_beginStereoPhotoProcessingIfNeededForSettings:(uint64_t)result
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const void *v10;
  CFTypeRef v11;
  NSObject *v12;
  _QWORD v13[6];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _QWORD block[5];
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = result;
    result = objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "learnedNRStereoPhotoFrameFlag");
    if (result)
    {
      if (-[BWPhotonicEngineNode _setStereoPhotoInverseHomograhiesOnDCProcessorInputsWithSettings:](v3, a2))
      {
        return FigDebugAssert3();
      }
      else
      {
        v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "secondaryPortTypes"));
        objc_msgSend(v4, "insertObject:atIndex:", objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "masterPortType"), 0);
        v16 = 0u;
        v17 = 0u;
        v14 = 0u;
        v15 = 0u;
        result = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
        if (result)
        {
          v5 = result;
          v6 = *(_QWORD *)v15;
          v7 = MEMORY[0x1E0C809B0];
          do
          {
            v8 = 0;
            do
            {
              if (*(_QWORD *)v15 != v6)
                objc_enumerationMutation(v4);
              v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v8);
              v10 = (const void *)objc_msgSend(*(id *)(v3 + 952), "objectForKeyedSubscript:", v9);
              if (v10)
                v11 = CFRetain(v10);
              else
                v11 = 0;
              objc_msgSend(*(id *)(v3 + 952), "setObject:forKeyedSubscript:", 0, v9);
              v12 = *(NSObject **)(v3 + 176);
              v13[0] = v7;
              v13[1] = 3221225472;
              v13[2] = __71__BWPhotonicEngineNode__beginStereoPhotoProcessingIfNeededForSettings___block_invoke;
              v13[3] = &unk_1E491F158;
              v13[4] = v3;
              v13[5] = v11;
              block[0] = v7;
              block[1] = 3221225472;
              block[2] = __ubn_dispatch_async_block_invoke_0;
              block[3] = &unk_1E491ECB8;
              block[4] = v13;
              dispatch_async(v12, block);
              ++v8;
            }
            while (v5 != v8);
            result = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
            v5 = result;
          }
          while (result);
        }
      }
    }
  }
  return result;
}

- (uint64_t)_setupProcessingStateForStereoPhotoDeepZoomTransferWithSettings:(void *)a3 processingPlan:
{
  uint64_t v3;
  uint64_t v4;
  void *v7;
  uint64_t v8;
  BWDeepZoomProcessorInput *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[5];
  _BYTE v25[128];
  uint64_t v26;

  v4 = a1;
  v26 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (!_FigIsCurrentDispatchQueue())
    {
      v19 = v3;
      LODWORD(v18) = 0;
      FigDebugAssert3();
    }
    if (FigCaptureVideoDimensionsAreValid(objc_msgSend(*(id *)(v4 + 688), "stereoPhotoOutputDimensions", v18, v19))
      && objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "learnedNRStereoPhotoFrameFlag")
      && (v7 = *(void **)(v4 + 688)) != 0
      && objc_msgSend(v7, "type") == 3
      && objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureType") == 12
      && objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureStreamSettings"), "count") == 2)
    {
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __103__BWPhotonicEngineNode__setupProcessingStateForStereoPhotoDeepZoomTransferWithSettings_processingPlan___block_invoke;
      v24[3] = &unk_1E4923398;
      v24[4] = v4;
      v8 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "secondaryPortTypes"), "firstObject");
      v9 = -[BWStillImageProcessorControllerInput initWithSettings:portType:]([BWDeepZoomProcessorInput alloc], "initWithSettings:portType:", a2, v8);
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      v23 = 0u;
      v10 = (void *)objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "portTypes");
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v21;
        while (2)
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v21 != v13)
              objc_enumerationMutation(v10);
            v15 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
            v16 = (void *)objc_msgSend(a3, "lastAddedInputForSequenceNumber:portType:bufferType:", 0, v15, 38);
            if (!v16
              || !ubn_insertOutputRouterForInputAfterPreviousInputForBufferType_0((uint64_t)v24, v9, v16, 38))
            {
              v4 = 4294954516;
              goto LABEL_22;
            }
            objc_msgSend(a3, "addInput:sequenceNumber:portType:bufferType:", v9, 0, v15, 38);
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
          if (v12)
            continue;
          break;
        }
      }
      objc_msgSend(*(id *)(v4 + 696), "setObject:forKeyedSubscript:", v9, v8);
    }
    else
    {
      v9 = 0;
    }
    v4 = 0;
LABEL_22:

  }
  return v4;
}

void __94__BWPhotonicEngineNode__setupProcessingStateForSingleImageCaptureWithSettings_processingPlan___block_invoke(uint64_t a1, const void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  void *v11;
  CFTypeRef v12;
  uint64_t v13;
  uint64_t v14;
  id *v15;

  if (!_FigIsCurrentDispatchQueue())
    FigDebugAssert3();
  if (dword_1ECFE9AF0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (!a2 || (_DWORD)a5)
  {
    v12 = CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
    -[BWPhotonicEngineNode _resetProcessingState](*(_QWORD *)(a1 + 32));
    v13 = *(_QWORD *)(a1 + 32);
    v14 = objc_msgSend(a4, "stillImageSettings");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("type '%@' requested for '%@'"), BWStillImageProcessorTypeToShortString(a3), a4);
    -[BWPhotonicEngineNode _emitError:stillImageSettings:metadata:description:](v13, a5, v14, (uint64_t)v12);
  }
  else
  {
    v11 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 400), "objectForKeyedSubscript:", objc_msgSend(a4, "portType"));
    if (v11)
    {
      objc_msgSend(v11, "setInputFrame:", a2);
    }
    else
    {
      v15 = -[BWPhotonicEngineNode _nextNRInputForPortType:](*(id **)(a1 + 32), objc_msgSend(a4, "portType"));
      objc_msgSend(v15, "addFrame:", a2);
      -[BWPhotonicEngineNode _checkIfProcessingCompletedForNRFProcessorInput:](*(_QWORD *)(a1 + 32), v15);
    }
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
    v2 = (void *)objc_msgSend(result[44], "objectForKeyedSubscript:", a2, 0);
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

void __94__BWPhotonicEngineNode__setupProcessingStateForSingleImageCaptureWithSettings_processingPlan___block_invoke_201(uint64_t a1, const void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  uint64_t v5;
  id v11;
  int v12;
  void *v13;
  CFTypeRef v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  if (!_FigIsCurrentDispatchQueue())
  {
    v18 = v5;
    LODWORD(v17) = 0;
    FigDebugAssert3();
  }
  v11 = (id)objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 352), "objectForKeyedSubscript:", objc_msgSend(a4, "portType", v17, v18)), "firstObject");
  v12 = a5;
  if (a2)
  {
    if ((_DWORD)a5)
    {
      v13 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "controllerForType:", 6);
      objc_msgSend(v13, "cancelProcessing");
      v12 = objc_msgSend(v13, "enqueueInputForProcessing:delegate:processErrorRecoveryFrame:processOriginalImage:processToneMapping:processInferenceInputImage:clientBracketSequenceNumber:processSemanticRendering:provideInferenceInputImageForProcessing:processSmartStyleRenderingInput:inferencesAvailable:", v11, *(_QWORD *)(a1 + 32), 1, 0, 0, 0, 0);
    }
    else
    {
      v12 = 0;
    }
    objc_msgSend(v11, "addFrame:", a2);
    -[BWPhotonicEngineNode _checkIfProcessingCompletedForNRFProcessorInput:](*(_QWORD *)(a1 + 32), v11);
  }
  if (v12)
  {
    v14 = CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
    -[BWPhotonicEngineNode _processorControllerDidFinishProcessingInputForPortType:processorType:captureRequestIdentifier:](*(_QWORD *)(a1 + 32), objc_msgSend(v11, "portType"), 6, (void *)objc_msgSend((id)objc_msgSend(a4, "settings"), "captureRequestIdentifier"));
    v15 = *(_QWORD *)(a1 + 32);
    v16 = objc_msgSend(a4, "stillImageSettings");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("type '%@' requested for '%@'"), BWStillImageProcessorTypeToShortString(a3), a4);
    -[BWPhotonicEngineNode _emitError:stillImageSettings:metadata:description:](v15, a5, v16, (uint64_t)v14);
  }
}

void __88__BWPhotonicEngineNode__setupProcessingStateForFlashCaptureWithSettings_processingPlan___block_invoke(uint64_t a1, const void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  id *v11;
  CFTypeRef v12;
  uint64_t v13;
  uint64_t v14;

  if (!_FigIsCurrentDispatchQueue())
    FigDebugAssert3();
  if (dword_1ECFE9AF0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (!a2 || (_DWORD)a5)
  {
    v12 = CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
    -[BWPhotonicEngineNode _processorControllerDidFinishProcessingInputForPortType:processorType:captureRequestIdentifier:](*(_QWORD *)(a1 + 32), objc_msgSend(a4, "portType"), 6, (void *)objc_msgSend((id)objc_msgSend(a4, "settings"), "captureRequestIdentifier"));
    v13 = *(_QWORD *)(a1 + 32);
    v14 = objc_msgSend(a4, "stillImageSettings");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("type '%@' requested for '%@'"), BWStillImageProcessorTypeToShortString(a3), a4);
    -[BWPhotonicEngineNode _emitError:stillImageSettings:metadata:description:](v13, a5, v14, (uint64_t)v12);
    -[BWPhotonicEngineNode _resetProcessingState](*(_QWORD *)(a1 + 32));
  }
  else
  {
    v11 = -[BWPhotonicEngineNode _nextNRInputForPortType:](*(id **)(a1 + 32), objc_msgSend(a4, "portType"));
    objc_msgSend(v11, "addFrame:", a2);
    -[BWPhotonicEngineNode _checkIfProcessingCompletedForNRFProcessorInput:](*(_QWORD *)(a1 + 32), v11);
  }
}

void __88__BWPhotonicEngineNode__setupProcessingStateForFlashCaptureWithSettings_processingPlan___block_invoke_205(uint64_t a1, const void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  uint64_t v5;
  id v11;
  int v12;
  void *v13;
  CFTypeRef v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  if (!_FigIsCurrentDispatchQueue())
  {
    v18 = v5;
    LODWORD(v17) = 0;
    FigDebugAssert3();
  }
  v11 = (id)objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 352), "objectForKeyedSubscript:", objc_msgSend(a4, "portType", v17, v18)), "firstObject");
  v12 = a5;
  if (a2)
  {
    if ((_DWORD)a5)
    {
      v13 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "controllerForType:", 6);
      objc_msgSend(v13, "cancelProcessing");
      v12 = objc_msgSend(v13, "enqueueInputForProcessing:delegate:processErrorRecoveryFrame:processOriginalImage:processToneMapping:processInferenceInputImage:clientBracketSequenceNumber:processSemanticRendering:provideInferenceInputImageForProcessing:processSmartStyleRenderingInput:inferencesAvailable:", v11, *(_QWORD *)(a1 + 32), 1, 0, 0, 0, 0);
    }
    else
    {
      v12 = 0;
    }
    objc_msgSend(v11, "addFrame:", a2);
    -[BWPhotonicEngineNode _checkIfProcessingCompletedForNRFProcessorInput:](*(_QWORD *)(a1 + 32), v11);
  }
  if (v12)
  {
    v14 = CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
    -[BWPhotonicEngineNode _processorControllerDidFinishProcessingInputForPortType:processorType:captureRequestIdentifier:](*(_QWORD *)(a1 + 32), objc_msgSend(v11, "portType"), 6, (void *)objc_msgSend((id)objc_msgSend(a4, "settings"), "captureRequestIdentifier"));
    v15 = *(_QWORD *)(a1 + 32);
    v16 = objc_msgSend(a4, "stillImageSettings");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("type '%@' requested for '%@'"), BWStillImageProcessorTypeToShortString(a3), a4);
    -[BWPhotonicEngineNode _emitError:stillImageSettings:metadata:description:](v15, a5, v16, (uint64_t)v14);
  }
}

void __88__BWPhotonicEngineNode__setupProcessingStateForFlashCaptureWithSettings_processingPlan___block_invoke_2(uint64_t a1, const void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  uint64_t v5;
  void *v10;
  char v11;
  int v12;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (!_FigIsCurrentDispatchQueue())
  {
    v19 = v5;
    LODWORD(v18) = 0;
    FigDebugAssert3();
  }
  v10 = (void *)CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  v11 = objc_msgSend((id)objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D06878]), "BOOLValue");
  v12 = -[BWPhotonicEngineNode _isInferenceInputImageRequiredForSettings:portType:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), objc_msgSend(a4, "portType"));
  if (!(_DWORD)a5 && (v11 & 1) == 0 && v12)
  {
    if (dword_1ECFE9AF0)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    objc_msgSend(-[BWPhotonicEngineNode _nextNRInputForPortType:](*(id **)(a1 + 32), objc_msgSend(a4, "portType", v18, v19)), "addFrame:", a2);
  }
  if (dword_1ECFE9AF0)
  {
    v14 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if ((_DWORD)a5
    || (v15 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 592), "objectForKeyedSubscript:", objc_msgSend(a4, "portType"))) == 0)
  {
    v16 = *(_QWORD *)(a1 + 32);
    v17 = objc_msgSend(a4, "stillImageSettings", v18, v19);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("type '%@' requested for '%@'"), BWStillImageProcessorTypeToShortString(a3), a4);
    -[BWPhotonicEngineNode _emitError:stillImageSettings:metadata:description:](v16, a5, v17, (uint64_t)v10);
  }
  else
  {
    objc_msgSend(v15, "addFrame:", a2);
  }
}

void __88__BWPhotonicEngineNode__setupProcessingStateForFlashCaptureWithSettings_processingPlan___block_invoke_206(uint64_t a1, const void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  CFTypeRef v11;
  uint64_t v12;
  uint64_t v13;
  id *v14;

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
    v13 = objc_msgSend(a4, "stillImageSettings");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("type '%@' requested for '%@'"), BWStillImageProcessorTypeToShortString(a3), a4);
    -[BWPhotonicEngineNode _emitError:stillImageSettings:metadata:description:](v12, a5, v13, (uint64_t)v11);
  }
  else
  {
    v14 = -[BWPhotonicEngineNode _nextNRInputForPortType:](*(id **)(a1 + 32), objc_msgSend(a4, "portType"));
    objc_msgSend(v14, "addFrame:", a2);
    -[BWPhotonicEngineNode _checkIfProcessingCompletedForNRFProcessorInput:](*(_QWORD *)(a1 + 32), v14);
  }
}

void __97__BWPhotonicEngineNode__setupProcessingStateForColorConstancyCaptureWithSettings_processingPlan___block_invoke(uint64_t a1, const void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  uint64_t v5;
  void *v10;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (!_FigIsCurrentDispatchQueue())
  {
    v17 = v5;
    LODWORD(v16) = 0;
    FigDebugAssert3();
  }
  v10 = (void *)CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  if (dword_1ECFE9AF0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if ((_DWORD)a5)
    goto LABEL_13;
  if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "requestedSettings"), "constantColorFallbackPhotoDeliveryEnabled")&& objc_msgSend((id)objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D06878]), "BOOLValue"))
  {
    if (dword_1ECFE9AF0)
    {
      v12 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    objc_msgSend(-[BWPhotonicEngineNode _nextNRInputForPortType:](*(id **)(a1 + 32), objc_msgSend(a4, "portType", v16, v17)), "addFrame:", a2);
  }
  v13 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 616), "objectForKeyedSubscript:", objc_msgSend(a4, "portType", v16));
  if (!v13)
  {
LABEL_13:
    v14 = *(_QWORD *)(a1 + 32);
    v15 = objc_msgSend(a4, "stillImageSettings", v16);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("type '%@' requested for '%@'"), BWStillImageProcessorTypeToShortString(a3), a4);
    -[BWPhotonicEngineNode _emitError:stillImageSettings:metadata:description:](v14, a5, v15, (uint64_t)v10);
  }
  else
  {
    objc_msgSend(v13, "addFrame:", a2);
  }
}

void __97__BWPhotonicEngineNode__setupProcessingStateForColorConstancyCaptureWithSettings_processingPlan___block_invoke_216(uint64_t a1, const void *a2, uint64_t a3, uint64_t a4, int a5)
{
  uint64_t v10;
  NSObject *v11;
  _QWORD v12[8];
  int v13;
  _QWORD block[5];

  if (!_FigIsCurrentDispatchQueue())
  {
    FigDebugAssert3();
    if (!a2)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (a2)
LABEL_3:
    CFRetain(a2);
LABEL_4:
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(NSObject **)(v10 + 176);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __97__BWPhotonicEngineNode__setupProcessingStateForColorConstancyCaptureWithSettings_processingPlan___block_invoke_2;
  v12[3] = &unk_1E4928108;
  v13 = a5;
  v12[6] = a3;
  v12[7] = a2;
  v12[4] = a4;
  v12[5] = v10;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __ubn_dispatch_async_block_invoke_0;
  block[3] = &unk_1E491ECB8;
  block[4] = v12;
  dispatch_async(v11, block);
}

void __97__BWPhotonicEngineNode__setupProcessingStateForColorConstancyCaptureWithSettings_processingPlan___block_invoke_2(uint64_t a1)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  CFTypeRef v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id *v7;
  const void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (dword_1ECFE9AF0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (*(_QWORD *)(a1 + 56) && !*(_DWORD *)(a1 + 64))
  {
    v7 = -[BWPhotonicEngineNode _nextNRInputForPortType:](*(id **)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "portType"));
    objc_msgSend(v7, "addFrame:", *(_QWORD *)(a1 + 56));
    -[BWPhotonicEngineNode _checkIfProcessingCompletedForNRFProcessorInput:](*(_QWORD *)(a1 + 40), v7);
  }
  else
  {
    -[BWPhotonicEngineNode _processorControllerDidFinishProcessingInputForPortType:processorType:captureRequestIdentifier:](*(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "portType", v9, v10), 6, (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "settings"), "captureRequestIdentifier"));
    v3 = CMGetAttachment(*(CMAttachmentBearerRef *)(a1 + 56), (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
    v4 = *(unsigned int *)(a1 + 64);
    v5 = *(_QWORD *)(a1 + 40);
    v6 = objc_msgSend(*(id *)(a1 + 32), "stillImageSettings");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("type '%@' requested for '%@'"), BWStillImageProcessorTypeToShortString(*(_QWORD *)(a1 + 48)), *(_QWORD *)(a1 + 32));
    -[BWPhotonicEngineNode _emitError:stillImageSettings:metadata:description:](v5, v4, v6, (uint64_t)v3);
    -[BWPhotonicEngineNode _resetProcessingState](*(_QWORD *)(a1 + 40));
  }
  v8 = *(const void **)(a1 + 56);
  if (v8)
    CFRelease(v8);
}

- (id)_errorRecoveryBufferTypesForBufferTypes:(id)result
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  int v8;
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
          v10 = &unk_1E4A022D0;
          if (v8 != 2)
          {
            if (v8 != 5)
              continue;
            v10 = &unk_1E4A022E8;
          }
        }
        else if (v8 == 7 || v8 == 13)
        {
          v10 = &unk_1E4A02300;
        }
        else
        {
          if (v8 != 33)
            continue;
          v10 = &unk_1E4A02318;
        }
        objc_msgSend(v3, "addObjectsFromArray:", v10);
      }
      v5 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (!v5)
        return (id)objc_msgSend(v3, "copy");
    }
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
    v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", -[BWPhotonicEngineNode _bufferTypesForCaptureSettings:]((uint64_t)result, a2));
    objc_msgSend(v3, "removeObjectsInArray:", -[BWPhotonicEngineNode _errorRecoveryBufferTypesForBufferTypes:](v2, v3));
    return (id)objc_msgSend(v3, "copy");
  }
  return result;
}

void __139__BWPhotonicEngineNode__setupProcessingStateForIntelligentDistortionCorrectionIfNeededWithSettings_sequenceNumber_portType_processingPlan___block_invoke(uint64_t a1, const void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  CFTypeRef v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[25];

  v19[23] = *MEMORY[0x1E0C80C00];
  if (dword_1ECFE9AF0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (_FigIsCurrentDispatchQueue())
  {
    if ((_DWORD)a5)
      goto LABEL_5;
  }
  else
  {
    v17 = v18;
    LODWORD(v16) = 0;
    FigDebugAssert3();
    if ((_DWORD)a5)
    {
LABEL_5:
      if (a3 != 14)
      {
        v19[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
        objc_msgSend(a4, "addBypassedProcessorType:forBufferTypes:", 7, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1));
        v11 = CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
        v12 = *(_QWORD *)(a1 + 32);
        v13 = objc_msgSend(a4, "stillImageSettings");
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("type '%@' requested for '%@'"), BWStillImageProcessorTypeToShortString(a3), a4);
        -[BWPhotonicEngineNode _emitError:stillImageSettings:metadata:description:](v12, a5, v13, (uint64_t)v11);
      }
      return;
    }
  }
  v14 = -[BWPhotonicEngineNode _applyingZoomBeforeDeepZoomAllowedWithSampleBuffer:bufferType:portType:](*(_QWORD *)(a1 + 32), (uint64_t)a2, a3, *(_QWORD *)(a1 + 40));
  v15 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 648), "objectForKeyedSubscript:", objc_msgSend(a4, "portType"));
  objc_msgSend(v15, "setApplyZoom:", v14);
  if (objc_msgSend(v15, "processIntelligentDistortionCorrection")
    && objc_msgSend(*(id *)(a1 + 48), "containsObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3)))
  {
    objc_msgSend(v15, "setProcessIntelligentDistortionCorrection:", 0);
  }
  objc_msgSend(v15, "addImage:imageBufferType:", a2, a3, v16, v17);
}

- (uint64_t)_applyingZoomBeforeDeepZoomAllowedWithSampleBuffer:(uint64_t)a3 bufferType:(uint64_t)a4 portType:
{
  uint64_t v4;
  uint64_t v8;

  if (result)
  {
    v4 = result;
    if (!*(_QWORD *)(result + 688))
      return 1;
    v8 = objc_msgSend(*(id *)(result + 696), "objectForKeyedSubscript:", a4);
    result = 1;
    if (a3 != 38 && v8)
    {
      if ((objc_msgSend(*(id *)(v4 + 688), "type") == 1
         || objc_msgSend(*(id *)(v4 + 688), "type") == 2)
        && +[BWDeepZoomProcessorControllerConfiguration doDeepZoomStandardOrLiteForSampleBuffer:type:sensorConfiguration:intermediateZoomSrcRectOut:intermediateZoomDstRectOut:](BWDeepZoomProcessorControllerConfiguration, "doDeepZoomStandardOrLiteForSampleBuffer:type:sensorConfiguration:intermediateZoomSrcRectOut:intermediateZoomDstRectOut:", a2, objc_msgSend(*(id *)(v4 + 688), "type"), objc_msgSend((id)-[BWPhotonicEngineNodeConfiguration sensorConfigurationsByPortType](*(_QWORD *)(v4 + 112)), "objectForKeyedSubscript:", a4), 0, 0))
      {
        return +[BWDeepZoomProcessorControllerConfiguration deepZoomProcessingModeForType:sensorConfiguration:](BWDeepZoomProcessorControllerConfiguration, "deepZoomProcessingModeForType:sensorConfiguration:", objc_msgSend(*(id *)(v4 + 688), "type"), objc_msgSend((id)-[BWPhotonicEngineNodeConfiguration sensorConfigurationsByPortType](*(_QWORD *)(v4 + 112)), "objectForKeyedSubscript:", a4)) == 2;
      }
      return 1;
    }
  }
  return result;
}

void __108__BWPhotonicEngineNode__setupProcessingStateForDeepZoomWithSettings_sequenceNumber_portType_processingPlan___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  uint64_t v5;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  int v12;
  uint64_t CopyIncludingMetadata;
  void *v14;
  void *v15;
  CFTypeRef v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  CFTypeRef cf[17];

  cf[16] = *(CFTypeRef *)MEMORY[0x1E0C80C00];
  if (_FigIsCurrentDispatchQueue())
  {
    if ((_DWORD)a5)
    {
LABEL_22:
      v21 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3, v19);
      objc_msgSend(a4, "addBypassedProcessorType:forBufferTypes:", 10, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1));
      v16 = CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
      v17 = *(_QWORD *)(a1 + 32);
      v18 = objc_msgSend(a4, "stillImageSettings");
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("type '%@' requested for '%@'"), BWStillImageProcessorTypeToShortString(a3), a4);
      -[BWPhotonicEngineNode _emitError:stillImageSettings:metadata:description:](v17, a5, v18, (uint64_t)v16);
      return;
    }
  }
  else
  {
    v20 = v5;
    LODWORD(v19) = 0;
    FigDebugAssert3();
    if ((_DWORD)a5)
      goto LABEL_22;
  }
  if (dword_1ECFE9AF0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v12 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "optimizedEnhancedResolutionDepthPipelineEnabled", v19, v20);
  if (a3 == 13 && v12 && (objc_msgSend((id)objc_msgSend(a4, "captureSettings"), "captureFlags") & 0x800) != 0)
  {
    cf[0] = 0;
    CopyIncludingMetadata = BWCMSampleBufferCreateCopyIncludingMetadata((CMSampleBufferRef)a2, (CMSampleBufferRef *)cf);
    if ((_DWORD)CopyIncludingMetadata)
    {
LABEL_18:
      a5 = CopyIncludingMetadata;
      goto LABEL_22;
    }
    BWSampleBufferRemoveAttachedMedia(cf[0], 0x1E4951618);
    BWSampleBufferRemoveAttachedMedia(cf[0], 0x1E495B238);
    CMSetAttachment(cf[0], CFSTR("StillImageBufferFrameType"), (CFTypeRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 13), 1u);
    -[BWPhotonicEngineNode _emitSampleBuffer:description:](*(_QWORD *)(a1 + 32), cf[0], (uint64_t)CFSTR("Deep Fusion 12MP"));
    if (cf[0])
      CFRelease(cf[0]);
    if (BWCIFilterArrayContainsPortraitFilters((void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "requestedSettings"), "processedImageFilters")))
    {
      os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 720));
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 728) = dispatch_semaphore_create(0);
      os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 720));
      dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 728), 0xFFFFFFFFFFFFFFFFLL);
    }
  }
  v14 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 696), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
  if (!v14)
  {
    a5 = 4294954516;
    goto LABEL_22;
  }
  v15 = v14;
  CopyIncludingMetadata = -[BWPhotonicEngineNode _ensureDeepZoomInputEnqueued:](*(_QWORD *)(a1 + 32), v14);
  if ((_DWORD)CopyIncludingMetadata)
    goto LABEL_18;
  objc_msgSend(v15, "addSampleBuffer:bufferType:", a2, a3);
  if ((objc_msgSend((id)objc_msgSend(a4, "captureSettings"), "captureFlags") & 0x200000000) != 0)
    -[BWPhotonicEngineNode _beginStereoPhotoProcessingIfNeededForSettings:](*(_QWORD *)(a1 + 32), (void *)objc_msgSend(a4, "stillImageSettings"));
}

- (uint64_t)_ensureDeepZoomInputEnqueued:(uint64_t)result
{
  uint64_t v2;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  if (result)
  {
    v4 = result;
    if (!_FigIsCurrentDispatchQueue())
    {
      v7 = v2;
      LODWORD(v6) = 0;
      FigDebugAssert3();
    }
    if ((objc_msgSend(a2, "isEnqueued", v6, v7) & 1) != 0)
      return 0;
    if (!a2)
      return 4294954516;
    v5 = (void *)-[BWPhotonicEngineNode _waitAndSafelyGetProcessorControllerForType:](v4, 10);
    if (!v5)
      return 4294954510;
    result = objc_msgSend(v5, "enqueueInputForProcessing:delegate:", a2, v4);
    if (!(_DWORD)result)
    {
      objc_msgSend(a2, "setEnqueued:", 1);
      return 0;
    }
  }
  return result;
}

void __108__BWPhotonicEngineNode__setupProcessingStateForDeepZoomWithSettings_sequenceNumber_portType_processingPlan___block_invoke_227(uint64_t a1, opaqueCMSampleBuffer *a2, uint64_t a3, void *a4, uint64_t a5)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  CVImageBufferRef ImageBuffer;
  CFTypeRef v12;
  CFDictionaryRef v13;
  const void *v14;
  void *v15;
  void *v16;
  CFTypeRef v17;
  uint64_t v18;
  uint64_t v19;
  CMTime v20;
  CMTime v21;
  os_log_type_t type;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (!_FigIsCurrentDispatchQueue())
    FigDebugAssert3();
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 528))
  {
    if (!a2)
      goto LABEL_9;
  }
  else
  {
    v23 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    if (!a2)
      goto LABEL_9;
  }
  if (!(_DWORD)a5)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "flushToMinimumCapacity:", 0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 704), "flushToMinimumCapacity:", 0);
    objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "controllerForType:", 2), "enqueueInputForProcessing:delegate:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
    ImageBuffer = CMSampleBufferGetImageBuffer(a2);
    v12 = CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
    v13 = CMCopyDictionaryOfAttachments((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a2, 1u);
    v14 = BWStillImageCaptureFrameFlagsForSampleBuffer(a2);
    v15 = (void *)-[__CFDictionary mutableCopy](v13, "mutableCopy");
    objc_msgSend(*(id *)(a1 + 40), "setEvZeroReferenceFrameAttachments:", v15);
    CMSampleBufferGetPresentationTimeStamp(&v21, a2);
    v16 = *(void **)(a1 + 40);
    v20 = v21;
    objc_msgSend(v16, "setEvZeroReferenceFramePTS:", &v20);

    objc_msgSend(*(id *)(a1 + 40), "allInferencesDelivered");
    objc_msgSend(*(id *)(a1 + 40), "addBuffer:metadata:bufferType:captureFrameFlags:", ImageBuffer, v12, 13, v14);
    return;
  }
LABEL_9:
  v17 = CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  v18 = *(_QWORD *)(a1 + 32);
  v19 = objc_msgSend(a4, "stillImageSettings");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("type '%@' requested for '%@'"), BWStillImageProcessorTypeToShortString(a3), a4);
  -[BWPhotonicEngineNode _emitError:stillImageSettings:metadata:description:](v18, a5, v19, (uint64_t)v17);
}

- (void)_ensureSmartStyleRenderingInputEnqueued:(void *)result
{
  uint64_t v2;
  uint64_t v4;
  char v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  if (result)
  {
    v4 = (uint64_t)result;
    if (!_FigIsCurrentDispatchQueue())
    {
      v8 = v2;
      LODWORD(v7) = 0;
      FigDebugAssert3();
    }
    v5 = objc_msgSend(a2, "isEnqueued", v7, v8);
    result = 0;
    if (a2)
    {
      if ((v5 & 1) == 0)
      {
        result = (void *)-[BWPhotonicEngineNode _waitAndSafelyGetProcessorControllerForType:](v4, 16);
        if (result)
        {
          v6 = result;
          objc_msgSend(result, "updateSmartStyleProcessorConfigurationIfNeededForApplyOnly:", objc_msgSend(a2, "applyOnly"));
          result = (void *)objc_msgSend(v6, "enqueueInputForProcessing:delegate:", a2, v4);
          if (!(_DWORD)result)
          {
            objc_msgSend(a2, "setEnqueued:", 1);
            return 0;
          }
        }
      }
    }
  }
  return result;
}

void __103__BWPhotonicEngineNode__setupProcessingStateForStereoPhotoDeepZoomTransferWithSettings_processingPlan___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  CFStringRef *v11;
  uint64_t v12;
  uint64_t v13;
  CFTypeRef v14;
  CFTypeRef v15;
  uint64_t v16;
  void *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  CFTypeRef v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  CFTypeRef v35;
  uint64_t v36;
  uint64_t v37;
  CFTypeRef cf;
  _QWORD v39[25];

  v39[23] = *MEMORY[0x1E0C80C00];
  cf = 0;
  if (!_FigIsCurrentDispatchQueue())
    FigDebugAssert3();
  if (dword_1ECFE9AF0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v11 = (CFStringRef *)MEMORY[0x1E0D05CB0];
  if ((_DWORD)a5)
  {
    v15 = 0;
  }
  else if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 968))
  {
    v12 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "captureSettings"), "secondaryPortTypes"), "firstObject");
    if (objc_msgSend((id)objc_msgSend(a4, "portType"), "isEqualToString:", v12))
    {
      v13 = *(_QWORD *)(a1 + 32);
      v14 = *(CFTypeRef *)(v13 + 968);
      cf = v14;
      *(_QWORD *)(v13 + 968) = 0;
      if (a2)
        v15 = CFRetain(a2);
      else
        v15 = 0;
    }
    else
    {
      BWCMSampleBufferCreateCopyIncludingMetadata((CMSampleBufferRef)a2, (CMSampleBufferRef *)&cf);
      v22 = *(_QWORD *)(a1 + 32);
      v15 = *(CFTypeRef *)(v22 + 968);
      *(_QWORD *)(v22 + 968) = 0;
      v23 = *(_QWORD *)(a1 + 32);
      v24 = (void *)MEMORY[0x1E0CB3940];
      v25 = (void *)objc_msgSend(a4, "portType");
      v27 = BWPortTypeToDisplayString(v25, v26);
      v28 = objc_msgSend(v24, "stringWithFormat:", CFSTR("stereo photo buffer for '%@' of type '%@'"), v27, BWStillImageProcessorTypeToShortString(a3));
      -[BWPhotonicEngineNode _emitSampleBuffer:description:](v23, a2, v28);
      v14 = cf;
    }
    v30 = (void *)CMGetAttachment(v14, *v11, 0);
    v31 = *MEMORY[0x1E0D06118];
    v32 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", objc_msgSend(v30, "objectForKeyedSubscript:", *MEMORY[0x1E0D06118]));
    objc_msgSend(v32, "setObject:forKeyedSubscript:", &unk_1E4A021C8, *MEMORY[0x1E0D061E0]);
    objc_msgSend(v30, "setObject:forKeyedSubscript:", v32, v31);
    BWSampleBufferSetAttachedMedia(v15, 0x1E4951618, (uint64_t)cf);
    v33 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 696), "objectForKeyedSubscript:", v12);
    if (v33)
    {
      v34 = v33;
      a5 = -[BWPhotonicEngineNode _ensureDeepZoomInputEnqueued:](*(_QWORD *)(a1 + 32), v33);
      if (!(_DWORD)a5)
        objc_msgSend(v34, "addSampleBuffer:bufferType:", v15, a3);
    }
    else
    {
      a5 = 4294954516;
    }
  }
  else if (objc_msgSend((id)objc_msgSend(a4, "portType"), "isEqualToString:", objc_msgSend((id)objc_msgSend(a4, "captureSettings"), "masterPortType")))
  {
    BWCMSampleBufferCreateCopyIncludingMetadata((CMSampleBufferRef)a2, (CMSampleBufferRef *)(*(_QWORD *)(a1 + 32) + 968));
    v16 = *(_QWORD *)(a1 + 32);
    v17 = (void *)MEMORY[0x1E0CB3940];
    v18 = (void *)objc_msgSend(a4, "portType");
    v20 = BWPortTypeToDisplayString(v18, v19);
    v21 = objc_msgSend(v17, "stringWithFormat:", CFSTR("stereo photo buffer for '%@' of type '%@'"), v20, BWStillImageProcessorTypeToShortString(a3));
    -[BWPhotonicEngineNode _emitSampleBuffer:description:](v16, a2, v21);
    v15 = 0;
    a5 = 0;
  }
  else
  {
    if (a2)
      v29 = CFRetain(a2);
    else
      v29 = 0;
    v15 = 0;
    a5 = 0;
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 968) = v29;
  }
  if (cf)
  {
    CFRelease(cf);
    cf = 0;
  }
  if (v15)
    CFRelease(v15);
  if ((_DWORD)a5)
  {
    v39[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
    objc_msgSend(a4, "addBypassedProcessorType:forBufferTypes:", 10, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 1));
    v35 = CMGetAttachment(a2, *v11, 0);
    v36 = *(_QWORD *)(a1 + 32);
    v37 = objc_msgSend(a4, "stillImageSettings");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("type '%@' requested for '%@'"), BWStillImageProcessorTypeToShortString(a3), a4);
    -[BWPhotonicEngineNode _emitError:stillImageSettings:metadata:description:](v36, a5, v37, (uint64_t)v35);
  }
}

- (void)_clearPortraitSemaphoreWithError:(uint64_t)a1
{
  NSObject *v2;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  const void *v4;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 720));
    v2 = *(NSObject **)(a1 + 728);
    if (v2)
    {
      if (dword_1ECFE9AF0)
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        v2 = *(NSObject **)(a1 + 728);
      }
      dispatch_semaphore_signal(v2);
      v4 = *(const void **)(a1 + 728);
      if (v4)
      {
        CFRelease(v4);
        *(_QWORD *)(a1 + 728) = 0;
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 720));
  }
}

- (void)filterNodeDidReceiveStandardResolutionDeepFusionBuffer:(id)a3 error:(int)a4
{
  -[BWPhotonicEngineNode _clearPortraitSemaphoreWithError:]((uint64_t)self);
}

void __114__BWPhotonicEngineNode__setupProcessingStateForScalerIfNeededWithSettings_sequenceNumber_portType_processingPlan___block_invoke(uint64_t a1, CMAttachmentBearerRef target, uint64_t a3, void *a4, uint64_t a5)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  CFTypeRef v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (dword_1ECFE9AF0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if ((_DWORD)a5)
    goto LABEL_4;
  v14 = -[BWPhotonicEngineNode _applyingZoomBeforeDeepZoomAllowedWithSampleBuffer:bufferType:portType:](*(_QWORD *)(a1 + 32), (uint64_t)target, a3, *(_QWORD *)(a1 + 40));
  v15 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "requestedSettings"), "bravoConstituentImageDeliveryDeviceTypes"), "count");
  v16 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 744), "objectForKeyedSubscript:", objc_msgSend(a4, "portType"));
  if (!v16)
  {
    a5 = 4294954516;
LABEL_4:
    if (a3 != 14)
    {
      v11 = CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
      v12 = *(_QWORD *)(a1 + 32);
      v13 = objc_msgSend(a4, "stillImageSettings");
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("type '%@' requested for '%@'"), BWStillImageProcessorTypeToShortString(a3), a4);
      -[BWPhotonicEngineNode _emitError:stillImageSettings:metadata:description:](v12, a5, v13, (uint64_t)v11);
    }
    return;
  }
  v17 = v16;
  if (v15)
    v18 = 0;
  else
    v18 = v14;
  objc_msgSend(v16, "setApplyZoom:", v18, v19, v20);
  objc_msgSend(v17, "addFrame:bufferType:", target, a3);
}

void __110__BWPhotonicEngineNode__setupProcessingStateForSmartStyleWithSettings_sequenceNumber_portType_processingPlan___block_invoke(uint64_t a1, const void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  uint64_t v5;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  void *v12;
  void *v13;
  CFTypeRef v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[23];

  v19[22] = *MEMORY[0x1E0C80C00];
  if (_FigIsCurrentDispatchQueue())
  {
    if ((_DWORD)a5)
      goto LABEL_8;
  }
  else
  {
    v18 = v5;
    LODWORD(v17) = 0;
    FigDebugAssert3();
    if ((_DWORD)a5)
      goto LABEL_8;
  }
  if (!a2)
    goto LABEL_10;
  if (dword_1ECFE9AF0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v12 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 816), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40), v17, v18);
  if (v12)
  {
    v13 = v12;
    objc_msgSend(v12, "addSampleBuffer:bufferType:", a2, a3);
    a5 = (uint64_t)-[BWPhotonicEngineNode _ensureSmartStyleRenderingInputEnqueued:](*(void **)(a1 + 32), v13);
    if (!(_DWORD)a5)
      return;
  }
  else
  {
LABEL_10:
    a5 = 4294954516;
  }
LABEL_8:
  v19[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3, v17);
  objc_msgSend(a4, "addBypassedProcessorType:forBufferTypes:", 16, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1));
  v14 = CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  v15 = *(_QWORD *)(a1 + 32);
  v16 = objc_msgSend(a4, "stillImageSettings");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("type '%@' requested for '%@'"), BWStillImageProcessorTypeToShortString(a3), a4);
  -[BWPhotonicEngineNode _emitError:stillImageSettings:metadata:description:](v15, a5, v16, (uint64_t)v14);
}

uint64_t __104__BWPhotonicEngineNode__setupProcessingStateForInferenceWithSettings_portType_inferenceInputBufferType___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancelProcessing");
}

void __104__BWPhotonicEngineNode__setupProcessingStateForInferenceWithSettings_portType_inferenceInputBufferType___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  int *v3;

  v2 = *(_QWORD *)(a1 + 40);
  switch(v2)
  {
    case 15:
      v3 = &OBJC_IVAR___BWPhotonicEngineNode__inferences;
      break;
    case 39:
      v3 = &OBJC_IVAR___BWPhotonicEngineNode__stereoPhotoSecondaryInferences;
      break;
    case 36:
      v3 = &OBJC_IVAR___BWPhotonicEngineNode__quadraForEnhancedResolutionInferences;
      break;
    default:
      return;
  }

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + *v3) = 0;
}

void __104__BWPhotonicEngineNode__setupProcessingStateForInferenceWithSettings_portType_inferenceInputBufferType___block_invoke_3(uint64_t a1, const void *a2, uint64_t a3, void *a4, int a5)
{
  uint64_t v5;
  BWStillImageInferences *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const __CFString *v15;
  uint64_t i;
  uint64_t v17;
  opaqueCMSampleBuffer *v18;
  opaqueCMSampleBuffer *v19;
  CVImageBufferRef ImageBuffer;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *AttachedInference;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  void *v38;
  opaqueCMSampleBuffer *v39;
  const __CFString *v40;
  CFTypeRef v41;
  void *v42;
  void *v43;
  id v44;
  uint64_t v45;
  NSObject *v46;
  uint64_t v47;
  BWStillImageInferences *v48;
  uint64_t v49;
  uint64_t v50;
  CFTypeRef v51;
  uint64_t v52;
  NSObject *v53;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  _QWORD v59[7];
  _QWORD v60[6];
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  os_log_type_t type;
  _BYTE v70[128];
  _BYTE v71[128];
  __CFString *block;
  uint64_t v73;
  void (*v74)(uint64_t);
  __CFString *v75;
  __CFString *v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _QWORD v81[6];

  v81[3] = *MEMORY[0x1E0C80C00];
  if (!_FigIsCurrentDispatchQueue())
  {
    v56 = v5;
    LODWORD(v55) = 0;
    FigDebugAssert3();
  }
  if (a5)
  {
    LODWORD(v81[0]) = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    v10 = 0;
    goto LABEL_59;
  }
  v58 = a4;
  v10 = objc_alloc_init(BWStillImageInferences);
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v57 = a1;
  v11 = *(void **)(a1 + 40);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v65, v71, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v66;
    v15 = (const __CFString *)*MEMORY[0x1E0D05CB0];
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v66 != v14)
          objc_enumerationMutation(v11);
        v17 = *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * i);
        v18 = +[BWInferenceEngineController inferenceMaskSbufFromSbuf:attachedMediaKey:](BWInferenceEngineController, "inferenceMaskSbufFromSbuf:attachedMediaKey:", a2, v17, v55, v56);
        if (v18)
        {
          v19 = v18;
          ImageBuffer = CMSampleBufferGetImageBuffer(v18);
          -[BWStillImageInferences addInferenceBuffer:metadata:inferenceAttachedMediaKey:](v10, "addInferenceBuffer:metadata:inferenceAttachedMediaKey:", ImageBuffer, CMGetAttachment(v19, v15, 0), v17);
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v65, v71, 16);
    }
    while (v13);
  }
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  block = CFSTR("LowResPersonInstanceConfidences");
  v73 = 0x1E4951358;
  v74 = (void (*)(uint64_t))CFSTR("VisionExtendedFaceObservations");
  v75 = CFSTR("VisionFaceClassificationObservation");
  v76 = CFSTR("MattedMasksContainValidContent");
  v21 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &block, 5, v55);
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v62;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v62 != v24)
          objc_enumerationMutation(v21);
        v26 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * v25);
        v27 = BWInferenceTypeForInferenceAttachmentKey(v26);
        AttachedInference = (void *)BWInferenceGetAttachedInference(a2, v27, (uint64_t)v26);
        if (!objc_msgSend(v26, "isEqualToString:", 0x1E4951058)
          || objc_msgSend(AttachedInference, "count"))
        {
          if (!v10)
            goto LABEL_22;
LABEL_21:
          -[BWStillImageInferences addInference:inferenceAttachmentKey:](v10, "addInference:inferenceAttachmentKey:", AttachedInference, v26);
          goto LABEL_22;
        }
        v29 = BWInferenceTypeForInferenceAttachmentKey(v26);
        AttachedInference = (void *)BWInferenceGetAttachedInference(a2, v29, (uint64_t)CFSTR("VisionFaceDetectionObservations"));
        if (v10)
          goto LABEL_21;
LABEL_22:
        ++v25;
      }
      while (v23 != v25);
      v30 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
      v23 = v30;
    }
    while (v30);
  }
  v31 = (void *)-[BWPhotonicEngineNode _inferenceAttachedMediaRequiredForSettings:inferences:sampleBuffer:](*(_QWORD *)(v57 + 32), (void *)objc_msgSend(v58, "stillImageSettings"), v10);
  v32 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v81[0] = CFSTR("PersonSemanticsSkin");
  v81[1] = 0x1E495B0B8;
  v81[2] = 0x1E495AF38;
  v33 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v81, 3);
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v77, &block, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v78;
    do
    {
      for (j = 0; j != v35; ++j)
      {
        if (*(_QWORD *)v78 != v36)
          objc_enumerationMutation(v33);
        v38 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * j);
        if (objc_msgSend(v31, "containsObject:", v38))
        {
          v39 = +[BWInferenceEngineController inferenceMaskSbufFromSbuf:attachedMediaKey:](BWInferenceEngineController, "inferenceMaskSbufFromSbuf:attachedMediaKey:", a2, v38);
          v40 = (const __CFString *)BWMetadataAttachmentKeyForAttachedMediaKey(v38);
          v41 = CMGetAttachment(v39, v40, 0);
          if (v41)
            objc_msgSend(v32, "setObject:forKeyedSubscript:", v41, v38);
        }
      }
      v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v77, &block, 16);
    }
    while (v35);
  }
  if (objc_msgSend(v32, "count"))
    v42 = v32;
  else
    v42 = 0;
  -[BWStillImageInferences addInferenceAttachedMediaMetadata:](v10, "addInferenceAttachedMediaMetadata:", v42);
  v43 = (void *)objc_msgSend((id)CMGetAttachment(a2, CFSTR("StillSettings"), 0), "captureSettings");
  if (-[BWPhotonicEngineNodeConfiguration semanticStyleRenderingEnabled](*(_QWORD *)(*(_QWORD *)(v57 + 32) + 112))
    || (int)-[BWPhotonicEngineNodeConfiguration smartStyleRenderingVersion](*(_QWORD *)(*(_QWORD *)(v57 + 32) + 112)) >= 1)
  {
    v44 = (id)objc_msgSend((id)objc_msgSend(v43, "metadata"), "smartCamInferences");
    if (!v44)
      v44 = +[BWInferenceEngineController smartCameraClassificationsFromSbuf:](BWInferenceEngineController, "smartCameraClassificationsFromSbuf:", a2);
    objc_msgSend((id)objc_msgSend(v43, "metadata"), "setSmartCamInferences:", v44);
    if (objc_msgSend((id)objc_msgSend(v43, "metadata"), "smartCamInferences"))
      objc_msgSend((id)objc_msgSend(v43, "metadata"), "calculateSemanticStyleSceneType");
  }
  if (objc_msgSend(v58, "inferenceInputBufferType") == 15)
  {

    *(_QWORD *)(*(_QWORD *)(v57 + 32) + 528) = v10;
    v45 = *(_QWORD *)(v57 + 32);
    if (*(_QWORD *)(v45 + 408))
    {
      v46 = *(NSObject **)(v45 + 176);
      v60[0] = MEMORY[0x1E0C809B0];
      v60[1] = 3221225472;
      v60[2] = __104__BWPhotonicEngineNode__setupProcessingStateForInferenceWithSettings_portType_inferenceInputBufferType___block_invoke_240;
      v60[3] = &unk_1E491E748;
      v47 = *(_QWORD *)(v57 + 48);
      v60[4] = v45;
      v60[5] = v47;
      block = (__CFString *)MEMORY[0x1E0C809B0];
      v73 = 3221225472;
      v74 = __ubn_dispatch_async_block_invoke_0;
      v75 = (__CFString *)&unk_1E491ECB8;
      v76 = (__CFString *)v60;
      dispatch_async(v46, &block);
    }
    goto LABEL_54;
  }
  if (objc_msgSend(v58, "inferenceInputBufferType") == 36)
  {

    v48 = v10;
    v49 = *(_QWORD *)(v57 + 32);
    v50 = 536;
LABEL_53:
    *(_QWORD *)(v49 + v50) = v48;
    goto LABEL_54;
  }
  if (objc_msgSend(v58, "inferenceInputBufferType") == 39)
  {

    v48 = v10;
    v49 = *(_QWORD *)(v57 + 32);
    v50 = 544;
    goto LABEL_53;
  }
LABEL_54:
  if (*(_BYTE *)(v57 + 56) && !*(_BYTE *)(v57 + 57))
  {
    v51 = (CFTypeRef)objc_msgSend(v58, "propagationImage");
    if (v51)
      v51 = CFRetain(v51);
    v52 = *(_QWORD *)(v57 + 32);
    v53 = *(NSObject **)(v52 + 176);
    v59[0] = MEMORY[0x1E0C809B0];
    v59[1] = 3221225472;
    v59[2] = __104__BWPhotonicEngineNode__setupProcessingStateForInferenceWithSettings_portType_inferenceInputBufferType___block_invoke_2_241;
    v59[3] = &unk_1E491EC68;
    v59[5] = v58;
    v59[6] = v51;
    v59[4] = v52;
    block = (__CFString *)MEMORY[0x1E0C809B0];
    v73 = 3221225472;
    v74 = __ubn_dispatch_async_block_invoke_0;
    v75 = (__CFString *)&unk_1E491ECB8;
    v76 = (__CFString *)v59;
    dispatch_async(v53, &block);
  }
LABEL_59:

}

uint64_t __104__BWPhotonicEngineNode__setupProcessingStateForInferenceWithSettings_portType_inferenceInputBufferType___block_invoke_240(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40)), "allInferencesDelivered");
}

void __104__BWPhotonicEngineNode__setupProcessingStateForInferenceWithSettings_portType_inferenceInputBufferType___block_invoke_2_241(uint64_t a1)
{
  id v2;
  const void *v3;

  v2 = -[BWPhotonicEngineNode _ubRERRouter](*(id *)(a1 + 32));
  (*((void (**)(id, _QWORD, uint64_t, _QWORD, _QWORD))v2 + 2))(v2, *(_QWORD *)(a1 + 48), 1, *(_QWORD *)(a1 + 40), 0);
  v3 = *(const void **)(a1 + 48);
  if (v3)
    CFRelease(v3);
}

uint64_t __104__BWPhotonicEngineNode__setupProcessingStateForInferenceWithSettings_portType_inferenceInputBufferType___block_invoke_245(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "enqueueInputForProcessing:delegate:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = result;
  return result;
}

uint64_t __108__BWPhotonicEngineNode__setupProcessingStateForDisparityIfNeededWithSettings_sequenceNumber_processingPlan___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "enqueueInputForProcessing:delegate:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = result;
  return result;
}

uint64_t __99__BWPhotonicEngineNode__setupProcessingStateForJasperDisparityIfNeededWithSettings_processingPlan___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v4;
  uint64_t v10;
  uint64_t v11;

  if (_FigIsCurrentDispatchQueue())
  {
    if (a2)
      return objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 888), "objectForKeyedSubscript:", objc_msgSend(a4, "portType", v10, v11)), "setColorBuffer:type:", a2, a3);
  }
  else
  {
    v11 = v4;
    LODWORD(v10) = 0;
    FigDebugAssert3();
    if (a2)
      return objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 888), "objectForKeyedSubscript:", objc_msgSend(a4, "portType", v10, v11)), "setColorBuffer:type:", a2, a3);
  }
  return objc_msgSend(*(id *)(a1 + 40), "cancelProcessing");
}

uint64_t __99__BWPhotonicEngineNode__setupProcessingStateForPointCloudDepthIfNeededWithSettings_processingPlan___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v4;
  uint64_t v10;
  uint64_t v11;

  if (_FigIsCurrentDispatchQueue())
  {
    if (a2)
      return objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 872), "objectForKeyedSubscript:", objc_msgSend(a4, "portType", v10, v11)), "setColorBuffer:type:", a2, a3);
  }
  else
  {
    v11 = v4;
    LODWORD(v10) = 0;
    FigDebugAssert3();
    if (a2)
      return objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 872), "objectForKeyedSubscript:", objc_msgSend(a4, "portType", v10, v11)), "setColorBuffer:type:", a2, a3);
  }
  return objc_msgSend(*(id *)(a1 + 40), "cancelProcessing");
}

- (unint64_t)_softISPProcesingModeForSettings:(unsigned int)a3 captureFrameFlags:
{
  uint64_t v5;
  int v6;
  void *v7;

  if (result)
  {
    v5 = result;
    if (-[BWPhotonicEngineNode _isDeferredRawDeepFusionCapture:](result, a2))
    {
      return ((unint64_t)objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureFlags") >> 30) & 4;
    }
    else
    {
      v6 = -[BWPhotonicEngineNode _isDeferredRawLearnedNRCapture:](v5, a2);
      v7 = (void *)objc_msgSend(a2, "captureSettings");
      if (v6)
      {
        if ((objc_msgSend(v7, "captureFlags") & 0x100000000) != 0)
          return 5;
        else
          return 1;
      }
      else
      {
        return (objc_msgSend(v7, "captureType") == 11) & (a3 >> 5);
      }
    }
  }
  return result;
}

- (uint64_t)_serviceNextSoftISPInputWithSampleBuffer:(unint64_t)a3 processingMode:(unsigned int)a4 transferOwnership:
{
  uint64_t v4;
  void *v9;
  uint64_t PortType;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  char v18;
  unsigned int v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v26;
  uint64_t v27;
  unsigned int v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  if (_FigIsCurrentDispatchQueue())
  {
    if (a2)
      goto LABEL_4;
    return 4294954516;
  }
  v27 = v4;
  LODWORD(v26) = 0;
  FigDebugAssert3();
  if (!a2)
    return 4294954516;
LABEL_4:
  v9 = (void *)CMGetAttachment(a2, CFSTR("StillSettings"), 0);
  PortType = BWSampleBufferGetPortType(a2);
  if (!-[BWPhotonicEngineNode _processingNeededForSettings:portType:]((_BOOL8)a1, v9, PortType))
    return 0;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v11 = (void *)objc_msgSend(a1[33], "objectForKeyedSubscript:", PortType);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v12)
  {
    v13 = v12;
    v28 = a4;
    v14 = *(_QWORD *)v30;
LABEL_7:
    v15 = 0;
    while (1)
    {
      if (*(_QWORD *)v30 != v14)
        objc_enumerationMutation(v11);
      v16 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v15);
      if (!objc_msgSend(v16, "frame", v26, v27))
        break;
      if (v13 == ++v15)
      {
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
        if (v13)
          goto LABEL_7;
        v17 = 4294954516;
        v18 = v28;
        goto LABEL_23;
      }
    }
    if (!(_DWORD)a3)
    {
      v19 = BWStillImageCaptureFrameFlagsForSampleBuffer(a2);
      a3 = -[BWPhotonicEngineNode _softISPProcesingModeForSettings:captureFrameFlags:]((unint64_t)a1, v9, v19);
    }
    v18 = v28;
    objc_msgSend(v16, "addFrame:processingMode:transferOwnership:", a2, a3, v28);
    if (v16)
    {
      if ((unint64_t)objc_msgSend(a1[33], "count") < 2)
      {
        v33 = PortType;
        v20 = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
      }
      else
      {
        v20 = -[BWPhotonicEngineNode _processingOrderByPortTypeForSettings:](a1, v9);
      }
      v21 = v20;
      while (1)
      {
        v22 = -[BWPhotonicEngineNode _copyNextSoftISPInputUsingProcessingOrderByPortType:processingMode:]((uint64_t)a1, v21, a3);
        if (!v22)
          return 0;
        v23 = v22;
        v24 = (void *)MEMORY[0x1A858DD40]();
        v17 = -[BWPhotonicEngineNode _enqueueSoftISPInput:]((uint64_t)a1, v23);
        objc_autoreleasePoolPop(v24);

        if ((_DWORD)v17)
          goto LABEL_23;
      }
    }
    v17 = 4294954516;
LABEL_23:
    if ((v18 & 1) == 0)
      return v17;
  }
  else
  {
    v17 = 4294954516;
    if (!a4)
      return v17;
  }
  CFRelease(a2);
  return v17;
}

- (void)_copyNextSoftISPInputUsingProcessingOrderByPortType:(int)a3 processingMode:
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  const void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  const void *v21;
  id v22;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (!_FigIsCurrentDispatchQueue())
    {
      v25 = v3;
      LODWORD(v24) = 0;
      FigDebugAssert3();
    }
    if (objc_msgSend(a2, "count", v24, v25))
    {
      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      v7 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v27;
LABEL_7:
        v10 = 0;
        while (1)
        {
          if (*(_QWORD *)v27 != v9)
            objc_enumerationMutation(a2);
          v11 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v10);
          if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 264), "objectForKeyedSubscript:", v11), "count"))
            break;
          if (v8 == ++v10)
          {
            v8 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
            if (v8)
              goto LABEL_7;
            return 0;
          }
        }
        if (!v11)
          return 0;
        v12 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 264), "objectForKeyedSubscript:", v11), "firstObject");
        if (!objc_msgSend(v12, "frame"))
          return 0;
        if ((objc_msgSend((id)objc_msgSend(v12, "captureStreamSettings"), "captureFlags") & 0x8000000000) != 0)
        {
          if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 336), "objectForKeyedSubscript:", objc_msgSend(v12, "portType")), "count"))
          {
            v21 = (const void *)objc_msgSend(v12, "frame");
            objc_msgSend((id)CMGetAttachment(v21, (CFStringRef)*MEMORY[0x1E0D05CB0], 0), "addEntriesFromDictionary:", objc_msgSend(*(id *)(a1 + 336), "objectForKeyedSubscript:", v11));
          }
          else if (objc_msgSend((id)objc_msgSend(v12, "captureStreamSettings"), "captureType") != 1
                 && (objc_msgSend((id)objc_msgSend(v12, "captureStreamSettings"), "referenceFrameIndex") & 0x80000000) == 0
                 && (BWStillImageCaptureFrameFlagsForSampleBuffer((const void *)objc_msgSend(v12, "frame")) & 0x10) == 0)
          {
            if ((unint64_t)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 264), "objectForKeyedSubscript:", v11), "count") < 2)return 0;
            v14 = 1;
            while (1)
            {
              v12 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 264), "objectForKeyedSubscript:", v11), "objectAtIndexedSubscript:", v14);
              if ((BWStillImageCaptureFrameFlagsForSampleBuffer((const void *)objc_msgSend(v12, "frame")) & 0x10) != 0)break;
              ++v14;
              v12 = 0;
              if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 264), "objectForKeyedSubscript:", v11), "count") <= v14)
                return v12;
            }
            goto LABEL_34;
          }
        }
        else
        {
          v13 = objc_msgSend((id)objc_msgSend(v12, "captureSettings"), "learnedNRStereoPhotoFrameFlag");
          LODWORD(v14) = 0;
          if (a3 != 6 || !v13)
          {
LABEL_34:
            if (v12)
            {
              v22 = v12;
              objc_msgSend((id)objc_msgSend(*(id *)(a1 + 264), "objectForKeyedSubscript:", v11), "removeObjectAtIndex:", v14);
            }
            return v12;
          }
          v15 = objc_msgSend((id)objc_msgSend(v12, "captureSettings"), "masterPortType");
          if ((objc_msgSend(v11, "isEqualToString:", v15) & 1) == 0
            && objc_msgSend((id)objc_msgSend(*(id *)(a1 + 336), "objectForKeyedSubscript:", v15), "count"))
          {
            v16 = (const void *)objc_msgSend(v12, "frame");
            v17 = (void *)CMGetAttachment(v16, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
            v18 = *MEMORY[0x1E0D06118];
            v19 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x1E0D06118]));
            v20 = objc_msgSend(*(id *)(a1 + 336), "objectForKeyedSubscript:", v15);
            objc_msgSend(v19, "setObject:forKeyedSubscript:", v20, *MEMORY[0x1E0D061F0]);
            objc_msgSend(v17, "setObject:forKeyedSubscript:", v19, v18);
          }
        }
        LODWORD(v14) = 0;
        goto LABEL_34;
      }
    }
  }
  return 0;
}

- (uint64_t)_setStereoPhotoInverseHomograhiesOnDCProcessorInputsWithSettings:(uint64_t)result
{
  uint64_t v3;
  __int128 v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  BOOL v21;
  int v22;
  char v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  double v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  double v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  double v47[3];
  int v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = result;
    result = objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "learnedNRStereoPhotoFrameFlag");
    if (result)
    {
      v48 = 0;
      v4 = *(_OWORD *)(MEMORY[0x1E0C83FE8] + 16);
      v45 = *MEMORY[0x1E0C83FE8];
      v46 = v4;
      *(_OWORD *)v47 = *(_OWORD *)(MEMORY[0x1E0C83FE8] + 32);
      v42 = v45;
      v43 = v4;
      v44 = *(_OWORD *)v47;
      v5 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v38 = 0u;
      v39 = 0u;
      v40 = 0u;
      v41 = 0u;
      v6 = (void *)-[BWPhotonicEngineNodeConfiguration sensorConfigurationsByPortType](*(_QWORD *)(v3 + 112));
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v38, v49, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v39;
        do
        {
          v10 = 0;
          do
          {
            if (*(_QWORD *)v39 != v9)
              objc_enumerationMutation(v6);
            v11 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * v10);
            v12 = (void *)-[BWPhotonicEngineNodeConfiguration sensorConfigurationsByPortType](*(_QWORD *)(v3 + 112));
            objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend(v12, "objectForKeyedSubscript:", v11, (_QWORD)v38), "cameraInfo"), v11);
            ++v10;
          }
          while (v8 != v10);
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v38, v49, 16);
        }
        while (v8);
      }
      if (objc_msgSend(v5, "count", (_QWORD)v38)
        && objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "secondaryPortTypes"), "count") == 1)
      {
        v13 = (void *)objc_msgSend(*(id *)(v3 + 952), "objectForKeyedSubscript:", objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "masterPortType"));
        v14 = (void *)objc_msgSend(*(id *)(v3 + 952), "objectForKeyedSubscript:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "secondaryPortTypes"), "firstObject"));
        v15 = (double)(int)objc_msgSend(*(id *)(v3 + 112), "stereoPhotoOutputDimensions");
        v16 = (double)(int)((unint64_t)objc_msgSend(*(id *)(v3 + 112), "stereoPhotoOutputDimensions") >> 32);
        v17 = (void *)CMGetAttachment(v14, (CFStringRef)*MEMORY[0x1E0D08740], 0);
        v18 = (void *)objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("Primary"));
        v19 = (void *)objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("Secondary"));
        v20 = pen_validateDepthMetadata(v18, v13);
        if (v20)
          v20 = pen_validateDepthMetadata(v19, v14);
        if (v18)
          v21 = v19 == 0;
        else
          v21 = 1;
        v22 = !v21;
        v23 = v22 & v20;
        if ((v22 & v20) != 0)
          v24 = v19;
        else
          v24 = 0;
        if ((v22 & v20) != 0)
          v25 = v18;
        else
          v25 = 0;
        result = BWStereoUtilitiesComputeInverseRectificationHomographiesAndFOV((opaqueCMSampleBuffer *)v13, v14, v5, v25, v24, (uint64_t)&v45, (uint64_t)&v42, &v48, v15, v16);
        if (!(_DWORD)result)
        {
          v26 = (void *)objc_msgSend(*(id *)(v3 + 648), "objectForKeyedSubscript:", objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "masterPortType"));
          objc_msgSend(v26, "setApplyStereoRectificationHomography:", 1);
          objc_msgSend(v26, "setStereoRectificationInverseHomography:", *(double *)&v45, *(double *)&v46, v47[0]);
          if ((v23 & 1) != 0)
            pen_setDistortionCorrectionParametersOnDCInputUsingDepthMetadata(v26, v18);
          v27 = (void *)objc_msgSend(*(id *)(v3 + 648), "objectForKeyedSubscript:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "secondaryPortTypes"), "firstObject"));
          objc_msgSend(v27, "setApplyStereoRectificationHomography:", 1);
          objc_msgSend(v27, "setStereoRectificationInverseHomography:", *(double *)&v42, *(double *)&v43, *(double *)&v44);
          if ((v23 & 1) != 0)
            pen_setDistortionCorrectionParametersOnDCInputUsingDepthMetadata(v27, v19);
          v28 = (const __CFString *)*MEMORY[0x1E0D05CB0];
          v29 = (void *)CMGetAttachment(v13, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
          v30 = *MEMORY[0x1E0D06118];
          v31 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", objc_msgSend(v29, "objectForKeyedSubscript:", *MEMORY[0x1E0D06118]));
          LODWORD(v32) = v48;
          v33 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v32);
          v34 = *MEMORY[0x1E0D061E8];
          objc_msgSend(v31, "setObject:forKeyedSubscript:", v33, *MEMORY[0x1E0D061E8]);
          objc_msgSend(v29, "setObject:forKeyedSubscript:", v31, v30);
          v35 = (void *)CMGetAttachment(v14, v28, 0);
          v36 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", objc_msgSend(v35, "objectForKeyedSubscript:", v30));
          LODWORD(v37) = v48;
          objc_msgSend(v36, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v37), v34);
          objc_msgSend(v35, "setObject:forKeyedSubscript:", v36, v30);
          return 0;
        }
      }
      else
      {
        return 4294954516;
      }
    }
  }
  return result;
}

uint64_t __71__BWPhotonicEngineNode__beginStereoPhotoProcessingIfNeededForSettings___block_invoke(uint64_t a1)
{
  return -[BWPhotonicEngineNode _serviceNextSoftISPInputWithSampleBuffer:processingMode:transferOwnership:](*(id **)(a1 + 32), *(const void **)(a1 + 40), 6uLL, 1u);
}

void __61__BWPhotonicEngineNode__softISPFusionCaptureOutputSbufRouter__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v11;
  uint64_t v12;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  void *v14;
  id v15;
  int v16;
  CVImageBufferRef ImageBuffer;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  opaqueCMSampleBuffer *AttachedMedia;
  opaqueCMSampleBuffer *v27;
  CVImageBufferRef v28;
  CFTypeRef v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;

  if (!_FigIsCurrentDispatchQueue())
  {
    v33 = v5;
    LODWORD(v31) = 0;
    FigDebugAssert3();
  }
  v11 = (uint64_t)BWStillImageCaptureFrameFlagsForSampleBuffer(a2);
  v12 = objc_msgSend((id)objc_msgSend(a4, "captureSettings"), "captureFlags");
  if (a2)
  {
    v36 = v12;
    if (dword_1ECFE9AF0)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    -[BWPhotonicEngineNode _stashAWBMetadataIfNeededForSampleBuffer:processingMode:](*(_QWORD *)(a1 + 32), a2, objc_msgSend(a4, "processingMode", v31, v33));
    v15 = (id)objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 352), "objectForKeyedSubscript:", objc_msgSend(a4, "portType")), "firstObject");
    v14 = (void *)CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
    if (objc_msgSend((id)objc_msgSend(a4, "captureSettings"), "captureType") == 12)
    {
      v16 = -[BWPhotonicEngineNode _isDeferredRawDeepFusionCapture:](*(_QWORD *)(a1 + 32), (void *)objc_msgSend(a4, "stillImageSettings"));
      ImageBuffer = CMSampleBufferGetImageBuffer((CMSampleBufferRef)a2);
      if (objc_msgSend(a4, "processingMode") != 6)
      {
        if (!v16)
        {
          v35 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "objectForKeyedSubscript:", objc_msgSend(a4, "portType"));
          v22 = objc_msgSend((id)objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D20]), "intValue") == 1;
          v23 = 27;
          if ((v11 & 4) == 0)
            v23 = 24;
          if ((v11 & 0x10) != 0)
            v23 = 23;
          if ((v11 & 8) != 0)
            v23 = 22;
          v24 = !v22 || (v36 & 0x200000000) == 0;
          v25 = 25;
          if (v24)
            v25 = v23;
          v37 = v25;
          AttachedMedia = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a2, 0x1E495B158);
          if (AttachedMedia)
          {
            v27 = AttachedMedia;
            v28 = CMSampleBufferGetImageBuffer(AttachedMedia);
            v29 = CMGetAttachment(v27, (CFStringRef)*MEMORY[0x1E0D05C98], 0);
          }
          else
          {
            v30 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
            v28 = 0;
            v29 = 0;
          }
          objc_msgSend(v35, "addBuffer:metadata:bufferType:captureFrameFlags:lscGainMap:lscGainMapParameters:", ImageBuffer, v14, v37, v11, v28, v29, v32, v34);
LABEL_13:
          -[BWPhotonicEngineNode _checkIfProcessingCompletedForNRFProcessorInput:](*(_QWORD *)(a1 + 32), v15);
          if (!(_DWORD)a5)
            return;
          goto LABEL_14;
        }
        if ((v11 & 0x14) == 0)
          goto LABEL_13;
      }
    }
    objc_msgSend(v15, "addFrame:", a2);
    goto LABEL_13;
  }
  v14 = 0;
  if (!(_DWORD)a5)
    return;
LABEL_14:
  -[BWPhotonicEngineNode _resetProcessingState](*(_QWORD *)(a1 + 32));
  v18 = *(_QWORD *)(a1 + 32);
  v19 = objc_msgSend(a4, "stillImageSettings");
  v20 = (void *)MEMORY[0x1E0CB3940];
  v21 = BWStillImageProcessorTypeToShortString(a3);
  objc_msgSend(v20, "stringWithFormat:", CFSTR("type '%@' - '%@' requested for '%@'"), v21, BWStillImageCaptureFrameFlagsToShortString(v11), a4);
  -[BWPhotonicEngineNode _emitError:stillImageSettings:metadata:description:](v18, a5, v19, (uint64_t)v14);
}

void __44__BWPhotonicEngineNode__nrfOutputSbufRouter__block_invoke(uint64_t a1, const void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  int v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  uint64_t v20;
  CFTypeRef v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  os_log_type_t type;
  int v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (!_FigIsCurrentDispatchQueue())
  {
    v25 = v27;
    LODWORD(v24) = 0;
    FigDebugAssert3();
  }
  if (dword_1ECFE9AF0)
  {
    v33 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if ((_DWORD)a5)
  {
    v26 = v27;
    LODWORD(v24) = a5;
    goto LABEL_32;
  }
  if (a3 != 7)
  {
    v11 = objc_msgSend((id)objc_msgSend(a4, "captureSettings"), "deliverDeferredPhotoProxyImage");
    if (a3 != 14 || !v11)
    {
      if (objc_msgSend(a4, "isMaster", v24, v25))
      {
        if (a3 > 34)
        {
          if (a3 == 38)
            goto LABEL_29;
          if (a3 != 35)
          {
LABEL_28:
            -[BWPhotonicEngineNode _waitForAndMergeInferencesIfNeededForSampleBuffer:processorInput:](*(_BOOL8 **)(a1 + 32), a2, a4);
            goto LABEL_29;
          }
        }
        else if (a3 != 3 && a3 != 6)
        {
          goto LABEL_28;
        }
        v13 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 360), "objectForKeyedSubscript:", objc_msgSend(a4, "portType"));
        if (v13)
          objc_msgSend((id)CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E0D05CB0], 0), "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0D06EB0]);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 368), "setObject:forKeyedSubscript:", &unk_1E49FC6D8, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 152));
        -[BWPhotonicEngineNode _attemptDisparityReferenceFrameResolutionForSettings:portType:](*(_QWORD *)(a1 + 32), (void *)objc_msgSend(a4, "stillImageSettings"), (void *)objc_msgSend(a4, "portType"));
        -[BWPhotonicEngineNode _deferredCaptureAddSecondaryStereoPhotoCaptureSampleBufferIfReadyForSettings:](*(_QWORD *)(a1 + 32), (void *)objc_msgSend(a4, "stillImageSettings"));
        v30 = 0u;
        v31 = 0u;
        v28 = 0u;
        v29 = 0u;
        v14 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 352), "allValues");
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
        if (!v15)
          goto LABEL_28;
        v16 = v15;
        v17 = *(_QWORD *)v29;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v29 != v17)
              objc_enumerationMutation(v14);
            -[BWPhotonicEngineNode _checkIfProcessingCompletedForNRFProcessorInput:](*(_QWORD *)(a1 + 32), (void *)objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "firstObject"));
          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
        }
        while (v16);
      }
      if (a3 != 38)
        goto LABEL_28;
LABEL_29:
      v19 = *(_QWORD *)(a1 + 32);
      v20 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("buffer of type '%@' requested for '%@'"), BWStillImageProcessorTypeToShortString(a3), a4);
      -[BWPhotonicEngineNode _emitSampleBuffer:description:](v19, a2, v20);
      return;
    }
  }
  v12 = -[BWPhotonicEngineNode _handleDeferredCaptureProxyOrErrorRecoverySampleBuffer:bufferType:](*(_QWORD *)(a1 + 32), a2);
  if ((_DWORD)v12)
  {
    a5 = v12;
    v26 = v27;
    LODWORD(v24) = v12;
LABEL_32:
    FigDebugAssert3();
    v21 = CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
    v22 = *(_QWORD *)(a1 + 32);
    v23 = objc_msgSend(a4, "stillImageSettings", v24, v26);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("type '%@' requested for '%@'"), BWStillImageProcessorTypeToShortString(a3), a4);
    -[BWPhotonicEngineNode _emitError:stillImageSettings:metadata:description:](v22, a5, v23, (uint64_t)v21);
  }
}

void __47__BWPhotonicEngineNode__ubInferenceInputRouter__block_invoke(uint64_t a1, void *a2, unint64_t a3, void *a4)
{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  char v12;
  _BOOL4 v13;
  void *v14;
  int CGRectIfPresent;
  int v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  uint64_t v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v36;
  _QWORD v37[6];
  __int128 v38;
  __int128 v39;
  __int128 v40;
  CGFloat v41[3];
  _QWORD block[5];
  CGRect v43;

  if (!_FigIsCurrentDispatchQueue())
  {
    v35 = v4;
    LODWORD(v34) = 0;
    FigDebugAssert3();
  }
  v9 = objc_msgSend(a4, "portType", v34, v35);
  if (-[BWPhotonicEngineNode _setupProcessingStateForInferenceWithSettings:portType:inferenceInputBufferType:](*(_QWORD *)(a1 + 32), (void *)objc_msgSend(a4, "stillImageSettings"), v9, a3)|| (v10 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 480), "objectForKeyedSubscript:", v9)) == 0)
  {
    v33 = (void *)objc_msgSend((id)objc_msgSend(a4, "stillImageSettings"), "captureSettings");
    if (objc_msgSend(v33, "captureType") == 12)
      objc_msgSend(v33, "deliverDeferredPhotoProxyImage");
  }
  else
  {
    v11 = (void *)v10;
    v12 = -[BWPhotonicEngineNode _isSemanticRenderingCapture:](*(_QWORD *)(a1 + 32), (void *)objc_msgSend(a4, "stillImageSettings"));
    v13 = -[BWPhotonicEngineNode _isSemanticStylesCaptureNeedingInferencesWithSettings:](*(_QWORD *)(a1 + 32), (void *)objc_msgSend(a4, "stillImageSettings"));
    if (((v12 & 1) != 0 || v13)
      && !+[BWInferenceEngine isNeuralEngineSupported](BWInferenceEngine, "isNeuralEngineSupported")
      && (objc_msgSend((id)objc_msgSend((id)CMGetAttachment(a2, CFSTR("StillSettings"), 0), "captureSettings"), "captureFlags") & 0x2000) != 0&& (BWSampleBufferHasDetectedFaces(a2, 0, 0, 0, 1, 0) & 1) == 0)
    {
      objc_msgSend(v11, "setEnabledVisionInferences:", objc_msgSend(v11, "enabledVisionInferences") ^ 0x13);
    }
    v14 = (void *)CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
    v36 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
    v40 = *MEMORY[0x1E0C9D628];
    *(_OWORD *)v41 = v36;
    CGRectIfPresent = FigCFDictionaryGetCGRectIfPresent();
    v38 = v40;
    v39 = v36;
    v16 = CGRectIfPresent | FigCFDictionaryGetCGRectIfPresent();
    v17 = BWPixelBufferDimensionsFromSampleBuffer((opaqueCMSampleBuffer *)a2);
    if (v16)
    {
      v18 = v17;
      v19 = HIDWORD(v17);
      v20 = (int)(float)(-[BWPhotonicEngineNodeConfiguration inferenceMainImageDownscalingFactor](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 112))
                                     * (float)(int)v17);
      v21 = (int)(float)(-[BWPhotonicEngineNodeConfiguration inferenceMainImageDownscalingFactor](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 112))
                                     * (float)(int)v19);
      FigCaptureMetadataUtilitiesNormalizeCropRect(*(double *)&v38, *((double *)&v38 + 1), *(double *)&v39, *((double *)&v39 + 1));
      FigCaptureMetadataUtilitiesDenormalizeCropRect(v22, v23, v24, v25);
      FigCaptureMetadataUtilitiesUpdateMetadataForStillImageCrop(v14, v20 | (v21 << 32), v18, *(CGFloat *)&v40, *((CGFloat *)&v40 + 1), v41[0], v41[1], v26, v27, v28, v29);
    }
    v43.origin.x = FigCaptureMetadataUtilitiesGetFinalCropRect();
    CGRectIsNull(v43);
    if (a2)
      CFRetain(a2);
    v30 = *(_QWORD *)(a1 + 32);
    v31 = *(NSObject **)(v30 + 496);
    v32 = *(NSObject **)(v30 + 488);
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __47__BWPhotonicEngineNode__ubInferenceInputRouter__block_invoke_2;
    v37[3] = &unk_1E491F158;
    v37[4] = v11;
    v37[5] = a2;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __ubn_dispatch_group_async_block_invoke_0;
    block[3] = &unk_1E491ECB8;
    block[4] = v37;
    dispatch_group_async(v31, v32, block);
  }
}

void __47__BWPhotonicEngineNode__ubInferenceInputRouter__block_invoke_2(uint64_t a1)
{
  const void *v2;

  objc_msgSend(*(id *)(a1 + 32), "addInferenceImage:", *(_QWORD *)(a1 + 40));
  v2 = *(const void **)(a1 + 40);
  if (v2)
    CFRelease(v2);
}

void __36__BWPhotonicEngineNode__ubRERRouter__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
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
  v8 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 632), "objectForKeyedSubscript:", objc_msgSend(a4, "portType", v12, v14));
  v17 = 0;
  v18 = &v17;
  v19 = 0x3052000000;
  v20 = __Block_byref_object_copy__41;
  v21 = __Block_byref_object_dispose__41;
  v22 = 0;
  if (!objc_msgSend(v8, "faceObservations"))
  {
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(NSObject **)(v9 + 488);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __36__BWPhotonicEngineNode__ubRERRouter__block_invoke_2;
    v16[3] = &unk_1E491E9A8;
    v16[4] = v9;
    v16[5] = &v17;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __ubn_dispatch_sync_block_invoke_0;
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

id __36__BWPhotonicEngineNode__ubRERRouter__block_invoke_2(uint64_t a1)
{
  id result;

  result = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 528), "inferenceForAttachmentKey:", 0x1E4951058);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

void __65__BWPhotonicEngineNode__standardNROutputRouterWithExpectedQueue___block_invoke(uint64_t a1, const void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  _BOOL8 *v11;
  uint64_t v12;
  unsigned int v13;
  uint64_t v14;
  _BOOL4 v15;
  uint64_t v16;
  uint64_t v17;
  CFTypeRef v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
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
    v22 = v23;
    LODWORD(v21) = a5;
    goto LABEL_15;
  }
  v11 = *(_BOOL8 **)(a1 + 40);
  if (a3 == 29)
  {
    v12 = -[BWPhotonicEngineNode _handleDeferredCaptureProxyOrErrorRecoverySampleBuffer:bufferType:]((uint64_t)v11, a2);
    if ((_DWORD)v12)
    {
      a5 = v12;
      v22 = v23;
      LODWORD(v21) = v12;
LABEL_15:
      FigDebugAssert3();
      v18 = CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
      v19 = *(_QWORD *)(a1 + 40);
      v20 = objc_msgSend(a4, "stillImageSettings", v21, v22);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("type '%@' requested for '%@'"), BWStillImageProcessorTypeToShortString(a3), a4);
      -[BWPhotonicEngineNode _emitError:stillImageSettings:metadata:description:](v19, a5, v20, (uint64_t)v18);
    }
  }
  else
  {
    -[BWPhotonicEngineNode _waitForAndMergeInferencesIfNeededForSampleBuffer:processorInput:](v11, a2, a4);
    if (FigCaptureSushiRawDNGDictionaryCreatedInGraph())
    {
      if (FigCapturePixelFormatIsBayerRaw(objc_msgSend((id)objc_msgSend(a4, "settings"), "rawOutputFormat")))
      {
        v13 = objc_msgSend((id)objc_msgSend(a4, "settings"), "outputWidth");
        v14 = objc_msgSend((id)objc_msgSend(a4, "settings"), "outputHeight");
        v15 = objc_msgSend((id)objc_msgSend((id)CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E0D05CB0], 0), "objectForKeyedSubscript:", *MEMORY[0x1E0D05F18]), "intValue") != 0;
        -[BWPhotonicEngineNode _propagateSushiRawDNGDictionaryWithOutputSampleBuffer:requestedDimensions:requiresGDCInformation:](*(_QWORD *)(a1 + 40), a2, v13 | (unint64_t)(v14 << 32), v15);
      }
    }
    v16 = *(_QWORD *)(a1 + 40);
    v17 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("buffer of type '%@' requested for '%@'"), BWStillImageProcessorTypeToShortString(a3), a4);
    -[BWPhotonicEngineNode _emitSampleBuffer:description:](v16, a2, v17);
  }
}

uint64_t __78__BWPhotonicEngineNode__ensureProcessorCoordinatorSetupForPostponedProcessors__block_invoke(uint64_t a1)
{
  uint64_t result;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  result = objc_msgSend(*(id *)(a1 + 32), "inferenceEnginePrepared");
  if ((result & 1) == 0)
  {
    FigDebugIsInternalBuild();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), 12);
    mach_absolute_time();
    result = objc_msgSend(*(id *)(a1 + 32), "prepareWithPixelBufferPoolProvider:", *(_QWORD *)(a1 + 40));
    if (dword_1ECFE9AF0)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      return fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  return result;
}

- (unint64_t)_disparityProcessorInputDimensions
{
  unint64_t v2;
  unint64_t v3;

  if (!a1)
    return 0;
  LODWORD(v2) = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 8), "videoFormat"), "width");
  LODWORD(v3) = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 8), "videoFormat"), "height");
  if (objc_msgSend(*(id *)(a1 + 760), "stillImageDepthDataType") == 8)
  {
    v2 = (unint64_t)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 8), "videoFormat"), "width") >> 1;
    v3 = (unint64_t)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 8), "videoFormat"), "height") >> 1;
  }
  return v2 | ((unint64_t)v3 << 32);
}

- (void)_inferenceAttachedMediaRequiredForDemosaicedRawCaptureWithSettings:(void *)a3 inferences:
{
  uint64_t v3;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  if (!_FigIsCurrentDispatchQueue())
  {
    v18 = v3;
    LODWORD(v17) = 0;
    FigDebugAssert3();
  }
  if (!-[BWPhotonicEngineNode _isDemosaicedRawCaptureNeedingInferencesWithSettigs:](a1, a2))
    return 0;
  v7 = (void *)objc_msgSend((id)-[BWPhotonicEngineNodeConfiguration providedInferenceAttachedMediaByMode](*(_QWORD *)(a1 + 112)), "objectForKeyedSubscript:", &unk_1E49FC6D8);
  v8 = (void *)objc_msgSend(a3, "inferenceForAttachmentKey:", 0x1E4951178);
  v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v7);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v7);
        v14 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        v15 = (void *)objc_msgSend(v8, "objectForKeyedSubscript:", v14, v17, v18);
        if (!v15 || (objc_msgSend(v15, "BOOLValue") & 1) == 0)
          objc_msgSend(v9, "removeObject:", v14);
      }
      v11 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v11);
  }
  return v9;
}

- (uint64_t)_inferenceAttachedMediaRequiredForDepthProcessingWithSettings:(uint64_t)a1
{
  if (a1 && -[BWPhotonicEngineNode _isDepthCaptureNeedingPersonSegmentationMasksWithSettings:](a1, a2))
    return objc_msgSend((id)-[BWPhotonicEngineNodeConfiguration providedInferenceAttachedMediaByMode](*(_QWORD *)(a1 + 112)), "objectForKeyedSubscript:", &unk_1E49FC6A8);
  else
    return 0;
}

- (uint64_t)_inferenceAttachedMediaRequiredForSmartStyleWithSettings:(uint64_t)a1
{
  if (a1 && -[BWPhotonicEngineNode _isSmartStylesCaptureNeedingInferencesWithSettings:](a1, a2))
    return objc_msgSend((id)-[BWPhotonicEngineNodeConfiguration providedInferenceAttachedMediaByMode](*(_QWORD *)(a1 + 112)), "objectForKeyedSubscript:", &unk_1E49FC8E8);
  else
    return 0;
}

void __41__BWPhotonicEngineNode__releaseResources__block_invoke_2(uint64_t a1)
{
  -[BWPhotonicEngineNode _resetProcessingState](*(_QWORD *)(a1 + 32));

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136) = 0;
}

void __41__BWPhotonicEngineNode__releaseResources__block_invoke_3(uint64_t a1)
{

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 528) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 536) = 0;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 544) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 552) = 0;
}

- (BWPhotoEncoderController)photoEncoderController
{
  return self->_photoEncoderController;
}

- (void)setPhotoEncoderController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1000);
}

@end
