@implementation FigCaptureVideoDataSinkPipeline

- (id)initWithConfiguration:(uint64_t)a3 sourceVideoOutput:(void *)a4 captureDevice:(void *)a5 graph:(uint64_t)a6 name:(uint64_t)a7 delegate:
{
  void *v13;
  id v14;
  objc_super v16;

  if (!a1)
    return 0;
  if (a2)
    v13 = *(void **)(a2 + 88);
  else
    v13 = 0;
  v16.receiver = a1;
  v16.super_class = (Class)FigCaptureVideoDataSinkPipeline;
  v14 = objc_msgSendSuper2(&v16, sel_initWithGraph_name_sinkID_, a5, a6, objc_msgSend((id)objc_msgSend(v13, "sinkConfiguration"), "sinkID"));
  if (v14)
  {
    if (!a2
      || (*((_QWORD *)v14 + 7) = a4,
          *((_QWORD *)v14 + 12) = (id)objc_msgSend(*(id *)(a2 + 64), "sourceID"),
          *((_DWORD *)v14 + 26) = *(_DWORD *)(a2 + 72),
          -[FigCaptureVideoDataSinkPipeline _buildVideoDataSinkPipelineWithConfiguration:sourceVideoOutput:captureDevice:graph:delegate:]((uint64_t)v14, a2, a3, a4, a5, a7)))
    {
      fig_log_get_emitter();
      FigDebugAssert3();

      return 0;
    }
  }
  objc_msgSend((id)objc_msgSend(a5, "memoryAnalyticsPayload"), "setGraphHasVideoDataOutput:", 1);
  return v14;
}

- (uint64_t)faceTrackingVideoCaptureOutput
{
  if (result)
    return *(_QWORD *)(result + 80);
  return result;
}

- (uint64_t)sourceID
{
  if (result)
    return *(_QWORD *)(result + 96);
  return result;
}

- (uint64_t)sourceDeviceType
{
  if (result)
    return *(unsigned int *)(result + 104);
  return result;
}

- (uint64_t)_buildVideoDataSinkPipelineWithConfiguration:(uint64_t)a3 sourceVideoOutput:(void *)a4 captureDevice:(void *)a5 graph:(uint64_t)a6 delegate:
{
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  unsigned int v14;
  _BOOL4 v15;
  int v16;
  int CFPreferenceNumberWithDefault;
  _BOOL4 v18;
  void *v19;
  uint64_t v20;
  BWPocketDetectionNode *v21;
  BWPocketDetectionNode *v22;
  char v23;
  int v24;
  uint64_t v25;
  int v26;
  BWSmartStyleApplyNode *v27;
  BWSmartStyleApplyNode *v28;
  int v29;
  uint64_t LossyCompressionLevel;
  BWPipelineStage *v31;
  uint64_t v32;
  void (*v33)(uint64_t, const __CFString *, _QWORD, id *);
  id v34;
  BWPreviewStabilizationNode *v35;
  BWPreviewStabilizationNode *v36;
  uint64_t v37;
  unsigned int v38;
  unsigned int v39;
  float v40;
  char v41;
  FigCaptureVISPipeline *v42;
  uint64_t v43;
  unsigned int v44;
  unsigned __int8 v45;
  unsigned __int8 v46;
  void *v47;
  char *v48;
  uint64_t v49;
  int v50;
  char v51;
  uint64_t v52;
  uint64_t v53;
  BOOL v54;
  char v55;
  int v56;
  int v57;
  char v58;
  unsigned __int8 v59;
  BWPixelTransferNode *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  int v65;
  int v66;
  uint64_t v67;
  uint64_t v68;
  _BOOL4 v69;
  char v70;
  int v71;
  _BOOL4 v72;
  uint64_t v73;
  BWFanOutNode *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  BWPixelTransferNode *v79;
  uint64_t v80;
  uint64_t v81;
  int v82;
  uint64_t v83;
  BWRemoteQueueSinkNode *v84;
  __int128 v85;
  BWRemoteQueueSinkNode *v86;
  void *v87;
  uint64_t v88;
  uint64_t v89;
  unsigned int v90;
  BOOL v91;
  uint64_t v92;
  unint64_t v93;
  unint64_t v94;
  _BOOL4 v95;
  _BOOL4 v96;
  uint64_t v97;
  void *v98;
  unsigned int v99;
  void *v100;
  _BOOL4 v101;
  unint64_t v102;
  _BOOL4 v103;
  uint64_t v104;
  uint64_t v105;
  _BOOL4 v107;
  BWPipelineStage *v109;
  objc_super v110;
  objc_super v111;
  objc_super v112;
  __int128 v113;
  __int128 v114;
  objc_super v115;
  objc_super v116;
  objc_super v117;
  objc_super v118;
  objc_super v119;
  objc_super v120;
  id v121;
  unsigned int v122;
  id v123[2];

  if (!result)
    return result;
  v9 = result;
  v122 = 0;
  v121 = 0;
  if (a2)
    v10 = *(void **)(a2 + 88);
  else
    v10 = 0;
  v109 = +[BWPipelineStage pipelineStageWithName:priority:](BWPipelineStage, "pipelineStageWithName:priority:", FigCaptureBuildPipelineStageName((uint64_t)CFSTR("com.apple.coremedia.capture.videodata"), (void *)objc_msgSend(v10, "sourceConfiguration")), 13);
  if (a2)
  {
    v104 = *(_QWORD *)(a2 + 16);
    v102 = *(_QWORD *)(a2 + 8);
    v93 = HIDWORD(v102);
    v11 = *(void **)(a2 + 88);
    v12 = *(void **)(a2 + 64);
    v13 = *(_DWORD *)(a2 + 28);
    v14 = *(_DWORD *)(a2 + 32);
    v87 = (void *)objc_msgSend(v12, "requiredFormat");
    v91 = *(_BYTE *)(a2 + 24) != 0;
  }
  else
  {
    v87 = (void *)objc_msgSend(0, "requiredFormat");
    v14 = 0;
    v11 = 0;
    LODWORD(v93) = 0;
    v102 = 0;
    v104 = 0;
    v13 = 0;
    v12 = 0;
    v91 = 0;
  }
  v99 = v13;
  v15 = +[FigCaptureVISPipeline visPipelineIsRequiredForFigCaptureVideoStabilizationType:]((uint64_t)FigCaptureVISPipeline, v13);
  v98 = v12;
  v16 = objc_msgSend(v12, "imageControlMode");
  CFPreferenceNumberWithDefault = FigGetCFPreferenceNumberWithDefault();
  if (a2)
  {
    v107 = *(_BYTE *)(a2 + 48) != 0;
    v103 = *(unsigned __int8 *)(a2 + 36) != 0;
    v95 = *(_BYTE *)(a2 + 60) != 0;
    if (*(_BYTE *)(a2 + 36))
      v18 = 0;
    else
      v18 = *(_BYTE *)(a2 + 60) != 0;
    v101 = v18;
  }
  else
  {
    v101 = 0;
    v107 = 0;
    v103 = 0;
    v95 = 0;
  }
  v19 = (void *)objc_msgSend(v11, "sinkConfiguration");
  v89 = a3;
  v90 = v14;
  if (objc_msgSend(v19, "sinkType") == 6)
  {
    if (!a2)
    {
      objc_msgSend(v19, "sinkType");
      v96 = 0;
      v20 = a3;
      goto LABEL_36;
    }
    v96 = *(_BYTE *)(a2 + 128) != 0;
    v20 = a3;
    if (objc_msgSend(v19, "sinkType") != 6)
      goto LABEL_25;
  }
  else
  {
    if (objc_msgSend(v19, "sinkType") != 6)
    {
      v96 = 0;
      v20 = a3;
      if (!a2)
        goto LABEL_36;
      goto LABEL_25;
    }
    v96 = 0;
    v20 = a3;
    if (!a2)
      goto LABEL_36;
  }
  if (*(_BYTE *)(a2 + 129))
  {
    -[BWPipelineStage priority](v109, "priority");
    v21 = -[BWPocketDetectionNode initWithMetalCommandQueue:clientApplicationID:]([BWPocketDetectionNode alloc], "initWithMetalCommandQueue:clientApplicationID:", -[FigCaptureMovieFileSinkTailPipeline _metalCommandQueueWithName:priority:](v9), *(_QWORD *)(a2 + 152));
    if (!v21)
    {
      fig_log_get_emitter();
      goto LABEL_92;
    }
    v22 = v21;
    -[BWNode setName:](v21, "setName:", CFSTR("Pocket Detection"));
    v120.receiver = (id)v9;
    v120.super_class = (Class)FigCaptureVideoDataSinkPipeline;
    if ((objc_msgSendSuper2(&v120, sel_addNode_error_, v22, &v121) & 1) == 0
      || (objc_msgSend(a5, "connectOutput:toInput:pipelineStage:", a3, -[BWNode input](v22, "input"), v109) & 1) == 0)
    {
      fig_log_get_emitter();
      goto LABEL_142;
    }
    v20 = -[BWNode output](v22, "output");
  }
  else
  {
    v20 = a3;
  }
LABEL_25:
  if (*(_BYTE *)(a2 + 160))
    v23 = v15;
  else
    v23 = 1;
  if ((v23 & 1) != 0)
    goto LABEL_36;
  v24 = v16;
  v25 = a6;
  v26 = CFPreferenceNumberWithDefault;
  v27 = -[BWSmartStyleApplyNode initWithMetalCommandQueue:renderingMethod:]([BWSmartStyleApplyNode alloc], "initWithMetalCommandQueue:renderingMethod:", 0, *(unsigned int *)(a2 + 164));
  if (!v27)
  {
    fig_log_get_emitter();
LABEL_92:
    FigDebugAssert3();
    return 4294954510;
  }
  v28 = v27;
  -[BWNode setName:](v27, "setName:", CFSTR("SmartStyle Video Data Output Apply"));
  v29 = *(_DWORD *)(a2 + 56);
  if (v29 <= (int)FigCapturePixelFormatGetLossyCompressionLevel(objc_msgSend(v11, "outputFormat")))
    LossyCompressionLevel = FigCapturePixelFormatGetLossyCompressionLevel(objc_msgSend(v11, "outputFormat"));
  else
    LossyCompressionLevel = *(unsigned int *)(a2 + 56);
  -[BWSmartStyleApplyNode setMaxLossyCompressionLevel:](v28, "setMaxLossyCompressionLevel:", LossyCompressionLevel);
  v119.receiver = (id)v9;
  v119.super_class = (Class)FigCaptureVideoDataSinkPipeline;
  if ((objc_msgSendSuper2(&v119, sel_addNode_error_, v28, &v121) & 1) == 0
    || (objc_msgSend(a5, "connectOutput:toInput:pipelineStage:", v20, -[BWNode input](v28, "input"), v109) & 1) == 0)
  {
    goto LABEL_86;
  }
  v20 = -[BWNode output](v28, "output");
  CFPreferenceNumberWithDefault = v26;
  a6 = v25;
  v16 = v24;
LABEL_36:
  v88 = a6;
  if (v15)
  {
    v31 = +[BWPipelineStage pipelineStageWithName:priority:](BWPipelineStage, "pipelineStageWithName:priority:", FigCaptureBuildPipelineStageName((uint64_t)CFSTR("com.apple.coremedia.capture.videodata-stabilization"), v98), 13);
    v123[0] = 0;
    v32 = objc_msgSend(v98, "source");
    v33 = *(void (**)(uint64_t, const __CFString *, _QWORD, id *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                           + 48);
    if (v33)
    {
      v33(v32, CFSTR("AttributesDictionary"), *MEMORY[0x1E0C9AE00], v123);
      v34 = v123[0];
    }
    else
    {
      v34 = 0;
    }
    v41 = objc_msgSend((id)objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("HEVC")), "BOOLValue");

    v42 = [FigCaptureVISPipeline alloc];
    if (a2)
    {
      v43 = *(_QWORD *)(a2 + 76);
      v44 = *(_DWORD *)(a2 + 56);
      v45 = *(_BYTE *)(a2 + 61) != 0;
      v46 = *(_BYTE *)(a2 + 160) != 0;
      v47 = *(void **)(a2 + 40);
    }
    else
    {
      v46 = 0;
      v44 = 0;
      v43 = 0;
      v45 = 0;
      v47 = 0;
    }
    v48 = -[FigCaptureVISPipeline initWithUpstreamOutput:graph:name:parentPipeline:videoCaptureConnectionConfiguration:pipelineStage:sdofPipelineStage:videoStabilizationType:motionAttachmentsSource:fillExtendedRowsOfOutputBuffer:overCaptureEnabled:stereoMode:videoStabilizationOverscanOverride:videoStabilizationStrength:motionMetadataPreloadingEnabled:visExecutionMode:pipelineTraceID:captureDevice:outputDimensions:P3ToBT2020ConversionEnabled:stabilizeDepthAttachments:outputDepthDimensions:maxLossyCompressionLevel:videoSTFEnabled:videoGreenGhostMitigationEnabled:lightSourceMaskAndKeypointDescriptorDataEnabled:personSegmentationRenderingEnabled:smartStyleRenderingEnabled:smartStyleReversibilityEnabled:lowResImageUsedByVideoEncoderEnabled:portTypesWithGeometricDistortionCorrectionInVISEnabled:](v42, v20, a5, 0.0, (uint64_t)CFSTR("Video Data Sink VIS Pipeline"), (void *)v9, v11, v31, 0, v99, v90, v41, 0, 0, 0, 0, 0, 0x5Au, a4,
            v43,
            v107,
            0,
            0,
            v44,
            v45,
            0,
            0,
            0,
            v46,
            0,
            0,
            v47);
    *(_QWORD *)(v9 + 64) = v48;
    if (v48)
    {
      objc_msgSend((id)-[FigCaptureVISPipeline motionAttachmentsNode]((uint64_t)v48), "setAdjustsValidBufferRectForDarkShade:", 1);
      v97 = objc_msgSend((id)-[FigCaptureVISPipeline visNode](*(_QWORD *)(v9 + 64)), "output");
      v49 = objc_msgSend((id)-[FigCaptureVISPipeline visNode](*(_QWORD *)(v9 + 64)), "outputDimensions");
      v50 = v93;
      v51 = v91;
      goto LABEL_55;
    }
LABEL_86:
    fig_log_get_emitter();
    goto LABEL_142;
  }
  if (v16 == 4 || CFPreferenceNumberWithDefault)
  {
    v38 = objc_msgSend(v87, "horizontalSensorBinningFactor");
    v39 = objc_msgSend(v87, "verticalSensorBinningFactor");
    objc_msgSend(v87, "maxSupportedFrameRate");
    v37 = FigCaptureBuildMotionAttachmentsNode((void *)v9, v20, v38, v39, v109, v90, objc_msgSend(a4, "sensorIDDictionaryByPortType"), objc_msgSend(a4, "cameraInfoByPortType"), v40, objc_msgSend(a4, "activePortTypes"), v16 == 4, objc_msgSend((id)objc_msgSend(v11, "irisSinkConfiguration"), "optimizesImagesForOfflineVideoStabilization"), 1, 0, &v122);
    if (v122)
      goto LABEL_86;
    goto LABEL_47;
  }
  if (!v96)
  {
    v97 = v20;
    goto LABEL_54;
  }
  v35 = -[BWPreviewStabilizationNode initWithCameraInfoByPortType:forStillImagePreview:updateFinalCropRectWithStabilizationShift:]([BWPreviewStabilizationNode alloc], "initWithCameraInfoByPortType:forStillImagePreview:updateFinalCropRectWithStabilizationShift:", objc_msgSend(a4, "cameraInfoByPortType"), objc_msgSend(a4, "autoImageControlMode") == 0, 1);
  if (!v35)
  {
    fig_log_get_emitter();
    goto LABEL_92;
  }
  v36 = v35;
  -[BWNode setName:](v35, "setName:", CFSTR("Preview Stabilization"));
  v118.receiver = (id)v9;
  v118.super_class = (Class)FigCaptureVideoDataSinkPipeline;
  if ((objc_msgSendSuper2(&v118, sel_addNode_error_, v36, &v121) & 1) == 0
    || (objc_msgSend(a5, "connectOutput:toInput:pipelineStage:", v20, -[BWNode input](v36, "input"), v109) & 1) == 0)
  {
    fig_log_get_emitter();
    goto LABEL_142;
  }
  v37 = -[BWNode output](v36, "output");
LABEL_47:
  v97 = v37;
LABEL_54:
  v50 = v93;
  v51 = v91;
  v49 = v104;
LABEL_55:
  objc_msgSend(v11, "outputFormat");
  v52 = objc_msgSend(v11, "transform");
  v92 = v53;
  v94 = v52;
  v54 = v50 != HIDWORD(v52);
  v55 = v52 ^ v102;
  v105 = v49;
  v56 = objc_msgSend(v11, "requiresScalingForInputTransForm:nodeName:");
  if (v99 == 2)
    v51 = 1;
  v100 = v11;
  v57 = objc_msgSend(v11, "deviceOrientationCorrectionEnabled");
  v58 = v54 | v55;
  v59 = v54 | v55 | v56;
  v60 = -[BWPixelTransferNode initWithfractionalSourceRectEnabled:]([BWPixelTransferNode alloc], "initWithfractionalSourceRectEnabled:", v96 | objc_msgSend(*(id *)(v9 + 56), "parallaxMitigationBasedOnZoomFactorEnabled"));
  -[BWPixelTransferNode setPassesBuffersThroughWhenPossible:](v60, "setPassesBuffersThroughWhenPossible:", ((v59 | (v101 || v107)) & 1) == 0);
  v61 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("Video Data Converter"));
  v62 = v61;
  if ((v58 & 1) != 0)
    objc_msgSend(v61, "appendString:", CFSTR("/Rotator"));
  if (v56)
    objc_msgSend(v62, "appendString:", CFSTR("/Scaler"));
  if ((v51 & 1) == 0)
    objc_msgSend(v62, "appendString:", CFSTR("/Zoomer"));
  if (v107)
    objc_msgSend(v62, "appendString:", CFSTR("/ColorConverter"));
  if (v101)
    objc_msgSend(v62, "appendString:", CFSTR("/Copier"));
  if (v57)
    objc_msgSend(v62, "appendString:", CFSTR("/DeviceOrientationCorrection"));
  -[BWNode setName:](v60, "setName:", v62);
  v63 = objc_msgSend(a4, "supportsWideColor");
  if (a2)
  {
    v65 = *(_DWORD *)(a2 + 52);
    v64 = *(unsigned int *)(a2 + 56);
  }
  else
  {
    v64 = 0;
    v65 = 0;
  }
  v66 = v103 && v95;
  FigCaptureConfigureVideoDataConverterRotatorNode(v60, v100, v102, v105, v63, v107, v64, v65);
  if (!((v107 | v57) & 1 | v59 & 1 | ((v51 & 1) == 0))
    || objc_msgSend(v98, "sourceDeviceType") == 8
    && ((objc_msgSend(v98, "manualCinematicFramingEnabled") & 1) != 0
     || objc_msgSend(v98, "cinematicFramingEnabled")))
  {
    -[BWPixelTransferNode setCropMode:](v60, "setCropMode:", 3);
  }
  if (v66)
    -[BWPixelTransferNode setOutputPixelFormat:](v60, "setOutputPixelFormat:", 0);
  v117.receiver = (id)v9;
  v117.super_class = (Class)FigCaptureVideoDataSinkPipeline;
  if ((objc_msgSendSuper2(&v117, sel_addNode_error_, v60, &v121) & 1) == 0
    || (*(_QWORD *)(v9 + 72) = v60,
        (objc_msgSend(a5, "connectOutput:toInput:pipelineStage:", v97, -[BWNode input](v60, "input"), v109) & 1) == 0))
  {
    fig_log_get_emitter();
    goto LABEL_142;
  }
  v67 = -[BWNode output](v60, "output");
  v68 = v67;
  if (a2)
  {
    v69 = *(_BYTE *)(a2 + 37) != 0;
    if (*(_QWORD *)(a2 + 88))
    {
      v70 = 0;
      v71 = 1;
      v72 = v103;
      goto LABEL_101;
    }
  }
  else
  {
    v69 = 0;
  }
  v72 = v103;
  v71 = 0;
  v70 = 1;
LABEL_101:
  v73 = (v69 + v72 + v71);
  if (v73 < 2)
  {
    if (!v72)
    {
      v78 = v100;
      if (v69)
        *(_QWORD *)(v9 + 88) = v67;
      v77 = v89;
      if ((v70 & 1) != 0)
        goto LABEL_133;
      goto LABEL_126;
    }
    *(_QWORD *)(v9 + 80) = v67;
    v77 = v89;
    goto LABEL_125;
  }
  v74 = -[BWFanOutNode initWithFanOutCount:mediaType:]([BWFanOutNode alloc], "initWithFanOutCount:mediaType:", v73, 1986618469);
  -[BWNode setName:](v74, "setName:", CFSTR("Video Splitter"));
  v116.receiver = (id)v9;
  v116.super_class = (Class)FigCaptureVideoDataSinkPipeline;
  if ((objc_msgSendSuper2(&v116, sel_addNode_error_, v74, &v121) & 1) == 0
    || (objc_msgSend(a5, "connectOutput:toInput:pipelineStage:", v68, -[BWNode input](v74, "input"), v109) & 1) == 0)
  {
    fig_log_get_emitter();
    goto LABEL_142;
  }
  if ((v70 & 1) != 0)
  {
    v75 = 0;
    v76 = 0;
  }
  else
  {
    v75 = -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v74, "outputs"), "objectAtIndexedSubscript:", 0);
    v76 = 1;
  }
  if (v103)
  {
    *(_QWORD *)(v9 + 80) = -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v74, "outputs"), "objectAtIndexedSubscript:", v76++);
    if (!v69)
      goto LABEL_115;
LABEL_123:
    *(_QWORD *)(v9 + 88) = -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v74, "outputs"), "objectAtIndexedSubscript:", v76);
    if (v66)
      goto LABEL_116;
    goto LABEL_124;
  }
  if (v69)
    goto LABEL_123;
LABEL_115:
  if (!v66)
  {
LABEL_124:
    v77 = v75;
    v68 = v75;
LABEL_125:
    v78 = v100;
    if ((v70 & 1) != 0)
      goto LABEL_133;
    goto LABEL_126;
  }
LABEL_116:
  v79 = -[BWPixelTransferNode initWithfractionalSourceRectEnabled:]([BWPixelTransferNode alloc], "initWithfractionalSourceRectEnabled:", 0);
  -[BWNode setName:](v79, "setName:", CFSTR("Video Data Copier"));
  v80 = objc_msgSend(a4, "supportsWideColor");
  v77 = v75;
  if (a2)
  {
    v82 = *(_DWORD *)(a2 + 52);
    v81 = *(unsigned int *)(a2 + 56);
  }
  else
  {
    v81 = 0;
    v82 = 0;
  }
  v78 = v100;
  FigCaptureConfigureVideoDataConverterRotatorNode(v79, v100, v94, v92, v80, 0, v81, v82);
  v115.receiver = (id)v9;
  v115.super_class = (Class)FigCaptureVideoDataSinkPipeline;
  if ((objc_msgSendSuper2(&v115, sel_addNode_error_, v79, &v121) & 1) == 0
    || (objc_msgSend(a5, "connectOutput:toInput:pipelineStage:", v75, -[BWNode input](v79, "input"), v109) & 1) == 0)
  {
    fig_log_get_emitter();
LABEL_142:
    FigDebugAssert3();
    if (v122)
      return v122;
    else
      return 4294954516;
  }
  v83 = -[BWNode output](v79, "output");
  if ((v70 & 1) != 0)
    goto LABEL_133;
  v68 = v83;
LABEL_126:
  v84 = [BWRemoteQueueSinkNode alloc];
  if (a2)
  {
    v85 = *(_OWORD *)(a2 + 112);
    v113 = *(_OWORD *)(a2 + 96);
    v114 = v85;
  }
  else
  {
    v113 = 0u;
    v114 = 0u;
  }
  v86 = -[BWRemoteQueueSinkNode initWithMediaType:clientAuditToken:sinkID:](v84, "initWithMediaType:clientAuditToken:sinkID:", 1986618469, &v113, objc_msgSend((id)v9, "sinkID"));
  -[BWNode setName:](v86, "setName:", CFSTR("Video Data Remote Queue Sink"));
  -[BWRemoteQueueSinkNode setDelegate:](v86, "setDelegate:", v88);
  -[BWRemoteQueueSinkNode setFrameSenderSupportEnabled:](v86, "setFrameSenderSupportEnabled:", 1);
  if (objc_msgSend((id)objc_msgSend(v78, "videoDataSinkConfiguration"), "sceneStabilityMetadataEnabled"))
    objc_msgSend(a4, "registerForAEMatrixMetadata");
  -[BWRemoteQueueSinkNode setDiscardsLateSampleBuffers:](v86, "setDiscardsLateSampleBuffers:", objc_msgSend((id)objc_msgSend(v78, "videoDataSinkConfiguration"), "discardsLateVideoFrames"));
  -[BWRemoteQueueSinkNode setClientVideoRetainedBufferCount:](v86, "setClientVideoRetainedBufferCount:", objc_msgSend(v78, "retainedBufferCount"));
  -[BWRemoteQueueSinkNode setAttachPanoramaMetadata:](v86, "setAttachPanoramaMetadata:", objc_msgSend((id)objc_msgSend(v78, "sourceConfiguration"), "imageControlMode") == 4);
  -[BWRemoteQueueSinkNode setCameraSupportsFlash:](v86, "setCameraSupportsFlash:", objc_msgSend(a4, "hasFlash"));
  -[BWRemoteQueueSinkNode setRemoveCameraIntrinsicMatrixAttachment:](v86, "setRemoveCameraIntrinsicMatrixAttachment:", objc_msgSend(v78, "cameraIntrinsicMatrixDeliveryEnabled") ^ 1);
  -[BWRemoteQueueSinkNode setPanoramaRequiresLTMLocking:](v86, "setPanoramaRequiresLTMLocking:", -[FigCaptureCameraParameters panoramaRequiresLTMLockingForPortType:sensorIDString:](+[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance"), "panoramaRequiresLTMLockingForPortType:sensorIDString:", objc_msgSend((id)objc_msgSend(a4, "captureStream"), "portType"), objc_msgSend((id)objc_msgSend(a4, "captureStream"), "sensorIDString")));
  -[BWRemoteQueueSinkNode setSceneStabilityMetadataEnabled:](v86, "setSceneStabilityMetadataEnabled:", objc_msgSend((id)objc_msgSend(v78, "videoDataSinkConfiguration"), "sceneStabilityMetadataEnabled"));
  -[BWRemoteQueueSinkNode setRequestedBufferAttachmentsTrie:](v86, "setRequestedBufferAttachmentsTrie:", objc_msgSend((id)objc_msgSend(v78, "videoDataSinkConfiguration"), "requestedBufferAttachmentsTrie"));
  v112.receiver = (id)v9;
  v112.super_class = (Class)FigCaptureVideoDataSinkPipeline;
  if ((objc_msgSendSuper2(&v112, sel_addNode_error_, v86, &v121) & 1) == 0
    || (objc_msgSend(a5, "connectOutput:toInput:pipelineStage:", v68, -[BWNode input](v86, "input"), v109) & 1) == 0)
  {
    fig_log_get_emitter();
    goto LABEL_142;
  }
  v111.receiver = (id)v9;
  v111.super_class = (Class)FigCaptureVideoDataSinkPipeline;
  objc_msgSendSuper2(&v111, sel_setSinkNode_, v86);
LABEL_133:
  *(_BYTE *)(v9 + 108) = objc_msgSend((id)objc_msgSend(v78, "videoDataSinkConfiguration"), "optimizedForPreview");
  v110.receiver = (id)v9;
  v110.super_class = (Class)FigCaptureVideoDataSinkPipeline;
  objc_msgSendSuper2(&v110, sel_setUpstreamOutput_, v77);
  result = v122;
  if (!v122)
  {
    if (v121)
      return objc_msgSend(v121, "code");
  }
  return result;
}

- (uint64_t)offlineVISMotionDataCaptureOutput
{
  if (result)
    return *(_QWORD *)(result + 88);
  return result;
}

+ (void)initialize
{
  objc_opt_class();
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigCaptureVideoDataSinkPipeline;
  -[FigCaptureRemoteQueueSinkPipeline dealloc](&v3, sel_dealloc);
}

- (void)setDiscardsSampleData:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigCaptureVideoDataSinkPipeline;
  -[FigCaptureSinkPipeline setDiscardsSampleData:](&v3, sel_setDiscardsSampleData_, a3);
}

- (BOOL)optimizedForPreview
{
  if (result)
    return *(_BYTE *)(result + 108) != 0;
  return result;
}

@end
