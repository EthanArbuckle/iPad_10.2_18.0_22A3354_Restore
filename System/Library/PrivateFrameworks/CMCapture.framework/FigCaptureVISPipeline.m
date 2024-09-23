@implementation FigCaptureVISPipeline

+ (BOOL)visPipelineIsRequiredForFigCaptureVideoStabilizationType:(uint64_t)a1
{
  objc_opt_self();
  return (a2 - 2) < 3;
}

- (uint64_t)visNode
{
  if (result)
    return *(_QWORD *)(result + 40);
  return result;
}

- (uint64_t)sdofVISNode
{
  if (result)
    return *(_QWORD *)(result + 48);
  return result;
}

+ (void)initialize
{
  objc_opt_class();
}

- (char)initWithUpstreamOutput:(void *)a3 graph:(float)a4 name:(uint64_t)a5 parentPipeline:(void *)a6 videoCaptureConnectionConfiguration:(void *)a7 pipelineStage:(void *)a8 sdofPipelineStage:(void *)a9 videoStabilizationType:(unsigned int)a10 motionAttachmentsSource:(unsigned int)a11 fillExtendedRowsOfOutputBuffer:(char)a12 overCaptureEnabled:(char)a13 stereoMode:(unsigned int)a14 videoStabilizationOverscanOverride:(unsigned int)a15 videoStabilizationStrength:(char)a16 motionMetadataPreloadingEnabled:(int)a17 visExecutionMode:(unsigned int)a18 pipelineTraceID:(void *)a19 captureDevice:(uint64_t)a20 outputDimensions:(char)a21 P3ToBT2020ConversionEnabled:(char)a22 stabilizeDepthAttachments:(uint64_t)a23 outputDepthDimensions:(unsigned int)a24 maxLossyCompressionLevel:(unsigned __int8)a25 videoSTFEnabled:(unsigned __int8)a26 videoGreenGhostMitigationEnabled:(char)a27 lightSourceMaskAndKeypointDescriptorDataEnabled:(unsigned __int8)a28 personSegmentationRenderingEnabled:(unsigned __int8)a29 smartStyleRenderingEnabled:(unsigned __int8)a30 smartStyleReversibilityEnabled:(unsigned __int8)a31 lowResImageUsedByVideoEncoderEnabled:(void *)a32 portTypesWithGeometricDistortionCorrectionInVISEnabled:
{
  char *v39;
  __int128 v40;
  objc_super v42;

  if (!a1)
    return 0;
  v42.receiver = a1;
  v42.super_class = (Class)FigCaptureVISPipeline;
  v39 = (char *)objc_msgSendSuper2(&v42, sel_initWithGraph_name_);
  if (v39)
  {
    v40 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
    *(_OWORD *)(v39 + 56) = *MEMORY[0x1E0C9D648];
    *(_OWORD *)(v39 + 72) = v40;
    -[FigCaptureVISPipeline _buildVISPipelineWithUpstreamOutput:graph:parentPipeline:videoCaptureConnectionConfiguration:pipelineStage:sdofPipelineStage:videoStabilizationType:motionAttachmentsSource:fillExtendedRowsOfOutputBuffer:overCaptureEnabled:stereoMode:videoStabilizationOverscanOverride:videoStabilizationStrength:motionMetadataPreloadingEnabled:visExecutionMode:pipelineTraceID:captureDevice:outputDimensions:P3ToBT2020ConversionEnabled:stabilizeDepthAttachments:outputDepthDimensions:maxLossyCompressionLevel:videoSTFEnabled:videoGreenGhostMitigationEnabled:lightSourceMaskAndKeypointDescriptorDataEnabled:personSegmentationRenderingEnabled:smartStyleRenderingEnabled:smartStyleReversibilityEnabled:lowResImageUsedByVideoEncoderEnabled:portTypesWithGeometricDistortionCorrectionInVISEnabled:]((BWVISNode *)v39, a2, a3, a6, a7, a8, a9, a10, a4, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20,
      a21,
      a22,
      a23,
      a24,
      a25,
      a26,
      a27,
      a28,
      a29,
      a30,
      a31,
      a32);
    if (!*((_QWORD *)v39 + 5) || objc_msgSend(a7, "irisSDOFEnabled") && !*((_QWORD *)v39 + 6))
    {
      fig_log_get_emitter();
      FigDebugAssert3();

      return 0;
    }
  }
  return v39;
}

- (BWVISNode)_buildVISPipelineWithUpstreamOutput:(void *)a3 graph:(void *)a4 parentPipeline:(void *)a5 videoCaptureConnectionConfiguration:(void *)a6 pipelineStage:(void *)a7 sdofPipelineStage:(unsigned int)a8 videoStabilizationType:(float)a9 motionAttachmentsSource:(unsigned int)a10 fillExtendedRowsOfOutputBuffer:(char)a11 overCaptureEnabled:(char)a12 stereoMode:(unsigned int)a13 videoStabilizationOverscanOverride:(unsigned int)a14 videoStabilizationStrength:(char)a15 motionMetadataPreloadingEnabled:(int)a16 visExecutionMode:(unsigned int)a17 pipelineTraceID:(void *)a18 captureDevice:(uint64_t)a19 outputDimensions:(char)a20 P3ToBT2020ConversionEnabled:(char)a21 stabilizeDepthAttachments:(uint64_t)a22 outputDepthDimensions:(unsigned int)a23 maxLossyCompressionLevel:(unsigned __int8)a24 videoSTFEnabled:(unsigned __int8)a25 videoGreenGhostMitigationEnabled:(char)a26 lightSourceMaskAndKeypointDescriptorDataEnabled:(unsigned __int8)a27 personSegmentationRenderingEnabled:(unsigned __int8)a28 smartStyleRenderingEnabled:(unsigned __int8)a29 smartStyleReversibilityEnabled:(unsigned __int8)a30 lowResImageUsedByVideoEncoderEnabled:(void *)a31 portTypesWithGeometricDistortionCorrectionInVISEnabled:
{
  BWVISNode *v35;
  int v36;
  void *v37;
  int v38;
  int v39;
  void *v40;
  char v41;
  char v42;
  unsigned int v43;
  void *v44;
  unsigned int v45;
  unsigned int v46;
  float v47;
  uint64_t v48;
  BWVideoSDOFSplitNode *v49;
  BWVISNode *v50;
  uint64_t v51;
  BOOL v52;
  unsigned __int8 v53;
  unsigned __int8 v54;
  BWVISNode *v55;
  char v56;
  BWVideoSDOFSplitNode *v57;
  unsigned __int8 v58;
  int v60;
  int v64;
  BWMotionAttachmentsNode *v65;
  uint64_t v66;

  if (!result)
    return result;
  v35 = result;
  v36 = a10;
  v66 = 0;
  v37 = (void *)objc_msgSend((id)objc_msgSend(a5, "sourceConfiguration"), "requiredFormat");
  v38 = objc_msgSend(a5, "irisSDOFEnabled");
  v39 = objc_msgSend((id)objc_msgSend(a5, "sourceConfiguration"), "imageControlMode");
  v60 = v38;
  if (a16 == 3)
  {
    v40 = a4;
  }
  else
  {
    v58 = v39 == 4;
    v65 = 0;
    v41 = objc_msgSend((id)objc_msgSend(a5, "irisSinkConfiguration"), "optimizesImagesForOfflineVideoStabilization");
    if (a16 == 5)
      v42 = 1;
    else
      v42 = v41;
    v64 = 0;
    v43 = objc_msgSend(v37, "horizontalSensorBinningFactor");
    v44 = a6;
    v45 = objc_msgSend(v37, "verticalSensorBinningFactor");
    objc_msgSend(v37, "maxSupportedFrameRate");
    v56 = v42;
    v36 = a10;
    v40 = a4;
    v46 = v45;
    a6 = v44;
    v48 = -[FigCaptureVISPipeline _buildMotionAttachmentsNodeWithUpstreamOutput:graph:parentPipeline:horizontalSensorBinningFactor:verticalSensorBinningFactor:maxSupportedFrameRate:pipelineStage:motionAttachmentsSource:captureDevice:isPanorama:optimizesImagesForOfflineVideoStabilization:provideSourceVideoWithMotionAttachmentsOutput:provideOfflineVISMotionDataOutput:maxLossyCompressionLevel:motionAttachmentsNodeOut:errOut:](v35, a2, a3, a4, v43, v46, v44, a10, v47, a18, v58, v56, 1, 0, &v65, &v64);
    if (v64)
      goto LABEL_27;
    a2 = v48;
    v35->super._outputs = (NSMutableArray *)v65;
    v38 = v60;
  }
  if (v38)
  {
    v49 = objc_alloc_init(BWVideoSDOFSplitNode);
    -[BWNode setName:](v49, "setName:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ Iris SDOF Split"), -[BWNode name](v35, "name")));
    if ((objc_msgSend(v40, "addNode:error:", v49, &v66) & 1) == 0
      || (objc_msgSend(a3, "connectOutput:toInput:pipelineStage:", a2, -[BWNode input](v49, "input"), a6) & 1) == 0)
    {
LABEL_27:
      fig_log_get_emitter();
      return (BWVISNode *)FigDebugAssert3();
    }
    v50 = v35;
    v57 = v49;
    v51 = -[BWVideoSDOFSplitNode originalOutput](v49, "originalOutput");
  }
  else
  {
    v50 = v35;
    v57 = 0;
    v51 = a2;
  }
  v52 = a16 == 3 || a16 == 0;
  if (v52)
    v53 = a28;
  else
    v53 = 0;
  if (v52)
    v54 = a29;
  else
    v54 = 0;
  v55 = -[FigCaptureVISPipeline _newVISNodeWithUpstreamOutput:graph:parentPipeline:videoCaptureConnectionConfiguration:videoStabilizationType:motionAttachmentsSource:fillExtendedRowsOfOutputBuffer:overCaptureEnabled:stereoMode:videoStabilizationOverscanOverride:videoStabilizationStrength:motionMetadataPreloadingEnabled:visExecutionMode:pipelineTraceID:pipelineStage:captureDevice:outputDimensions:irisVISCleanOutputRectOut:P3ToBT2020ConversionEnabled:stabilizeDepthAttachments:outputDepthDimensions:maxLossyCompressionLevel:videoSTFEnabled:videoGreenGhostMitigationEnabled:lightSourceMaskAndKeypointDescriptorDataEnabled:personSegmentationRenderingEnabled:smartStyleRenderingEnabled:smartStyleReversibilityEnabled:lowResImageUsedByVideoEncoderEnabled:portTypesWithGeometricDistortionCorrectionInVISEnabled:](v50, v51, a3, a4, a5, a8, v36, a11, a9, a12, a13, a14, a15, a16, a17, a6, a18, a19, (double *)&v50->super._supportsConcurrentLiveInputCallbacks,
          a20,
          a21,
          a22,
          a23,
          a24,
          a25,
          a26,
          a27,
          v53,
          v54,
          a30,
          a31);
  v50->super._name = (NSString *)&v55->super.super.isa;
  if (!v55)
    goto LABEL_27;
  result = -[BWNode output](v55, "output");
  if (v60)
  {
    result = -[FigCaptureVISPipeline _newVISNodeWithUpstreamOutput:graph:parentPipeline:videoCaptureConnectionConfiguration:videoStabilizationType:motionAttachmentsSource:fillExtendedRowsOfOutputBuffer:overCaptureEnabled:stereoMode:videoStabilizationOverscanOverride:videoStabilizationStrength:motionMetadataPreloadingEnabled:visExecutionMode:pipelineTraceID:pipelineStage:captureDevice:outputDimensions:irisVISCleanOutputRectOut:P3ToBT2020ConversionEnabled:stabilizeDepthAttachments:outputDepthDimensions:maxLossyCompressionLevel:videoSTFEnabled:videoGreenGhostMitigationEnabled:lightSourceMaskAndKeypointDescriptorDataEnabled:personSegmentationRenderingEnabled:smartStyleRenderingEnabled:smartStyleReversibilityEnabled:lowResImageUsedByVideoEncoderEnabled:portTypesWithGeometricDistortionCorrectionInVISEnabled:](v50, (uint64_t)-[BWVideoSDOFSplitNode sdofOutput](v57, "sdofOutput"), a3, a4, a5, a8, v36, a11, a9, a12, 0, a14, a15, a16, a17, a7, a18, a19, 0,
               a20,
               a21,
               a22,
               a23,
               a24,
               a25,
               a26,
               a27,
               a28,
               a29,
               a30,
               0);
    v50->super._subgraphName = (NSString *)&result->super.super.isa;
    if (!result)
      goto LABEL_27;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigCaptureVISPipeline;
  -[FigCapturePipeline dealloc](&v3, sel_dealloc);
}

- (uint64_t)_buildMotionAttachmentsNodeWithUpstreamOutput:(void *)a1 graph:(uint64_t)a2 parentPipeline:(void *)a3 horizontalSensorBinningFactor:(void *)a4 verticalSensorBinningFactor:(unsigned int)a5 maxSupportedFrameRate:(unsigned int)a6 pipelineStage:(void *)a7 motionAttachmentsSource:(unsigned int)a8 captureDevice:(float)a9 isPanorama:(void *)a10 optimizesImagesForOfflineVideoStabilization:(unsigned __int8)a11 provideSourceVideoWithMotionAttachmentsOutput:(char)a12 provideOfflineVISMotionDataOutput:(char)a13 maxLossyCompressionLevel:(char)a14 motionAttachmentsNodeOut:(BWMotionAttachmentsNode *)a15 errOut:(_DWORD *)a16
{
  int v19;
  NSDictionary *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  BWMotionAttachmentsNode *v24;
  double v25;
  BWMotionAttachmentsNode *v26;
  BWMotionAttachmentsNode *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v31;
  int v38;
  uint64_t v39;

  if (!a1)
    return 0;
  v19 = a11;
  v39 = 0;
  v38 = 0;
  v20 = -[FigCaptureCameraParameters motionAttachmentsParameters](+[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance"), "motionAttachmentsParameters");
  v21 = objc_msgSend(a10, "sensorIDDictionaryByPortType");
  v22 = objc_msgSend(a10, "cameraInfoByPortType");
  v23 = objc_msgSend(a10, "activePortTypes");
  if (a12)
    v19 = 2;
  v24 = [BWMotionAttachmentsNode alloc];
  BYTE5(v31) = a14;
  BYTE4(v31) = a13;
  LODWORD(v31) = objc_msgSend(a7, "priority");
  *(float *)&v25 = a9;
  v26 = -[BWMotionAttachmentsNode initWithSensorIDDictionaryByPortType:cameraInfoByPortType:tuningParameters:activePortTypes:horizontalSensorBinningFactor:verticalSensorBinningFactor:maxSupportedFrameRate:motionAttachmentsMode:motionAttachmentsSource:motionCallbackThreadPriority:provideSourceVideoWithMotionAttachmentsOutput:provideOfflineVISMotionDataOutput:errorOut:](v24, "initWithSensorIDDictionaryByPortType:cameraInfoByPortType:tuningParameters:activePortTypes:horizontalSensorBinningFactor:verticalSensorBinningFactor:maxSupportedFrameRate:motionAttachmentsMode:motionAttachmentsSource:motionCallbackThreadPriority:provideSourceVideoWithMotionAttachmentsOutput:provideOfflineVISMotionDataOutput:errorOut:", v21, v22, v20, v23, a5, a6, v25, __PAIR64__(a8, v19), v31, &v38);
  if (v38)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v28 = 0;
  }
  else
  {
    v27 = v26;
    -[BWNode setName:](v26, "setName:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ Motion Attachments"), objc_msgSend(a1, "name")));
    if ((objc_msgSend(a4, "addNode:error:", v27, &v39) & 1) != 0)
    {
      v28 = a2;
      if ((objc_msgSend(a3, "connectOutput:toInput:pipelineStage:", a2, -[BWNode input](v27, "input"), a7) & 1) != 0)
      {
        if (a13)
          v29 = -[BWMotionAttachmentsNode sourceVideoWithMotionAttachmentsOutput](v27, "sourceVideoWithMotionAttachmentsOutput");
        else
          v29 = -[BWMotionAttachmentsNode offlineVISMotionDataOutput](v27, "offlineVISMotionDataOutput");
        v28 = v29;
        if (a15)
          *a15 = v27;
      }
      else
      {
        fig_log_get_emitter();
        FigDebugAssert3();
      }
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      v28 = a2;
    }
  }
  *a16 = v38;
  return v28;
}

- (BWVISNode)_newVISNodeWithUpstreamOutput:(void *)a3 graph:(void *)a4 parentPipeline:(void *)a5 videoCaptureConnectionConfiguration:(unsigned int)a6 videoStabilizationType:(int)a7 motionAttachmentsSource:(char)a8 fillExtendedRowsOfOutputBuffer:(float)a9 overCaptureEnabled:(char)a10 stereoMode:(unsigned int)a11 videoStabilizationOverscanOverride:(unsigned int)a12 videoStabilizationStrength:(char)a13 motionMetadataPreloadingEnabled:(int)a14 visExecutionMode:(unsigned int)a15 pipelineTraceID:(void *)a16 pipelineStage:(void *)a17 captureDevice:(uint64_t)a18 outputDimensions:(double *)a19 irisVISCleanOutputRectOut:(char)a20 P3ToBT2020ConversionEnabled:(char)a21 stabilizeDepthAttachments:(uint64_t)a22 outputDepthDimensions:(unsigned int)a23 maxLossyCompressionLevel:(unsigned __int8)a24 videoSTFEnabled:(unsigned __int8)a25 videoGreenGhostMitigationEnabled:(char)a26 lightSourceMaskAndKeypointDescriptorDataEnabled:(unsigned __int8)a27 personSegmentationRenderingEnabled:(unsigned __int8)a28 smartStyleRenderingEnabled:(unsigned __int8)a29 smartStyleReversibilityEnabled:(unsigned __int8)a30 lowResImageUsedByVideoEncoderEnabled:(void *)a31 portTypesWithGeometricDistortionCorrectionInVISEnabled:
{
  void *v39;
  int v40;
  void *v41;
  void *v42;
  float v43;
  float v44;
  unsigned int v45;
  unsigned int v46;
  int v47;
  int v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, const __CFString *, _QWORD, id *);
  float v51;
  float v52;
  uint64_t v53;
  BWVISNode *v54;
  float v55;
  int v56;
  float v57;
  int v58;
  int v59;
  double v60;
  int v61;
  double v62;
  double v63;
  double v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  void *v72;
  int v73;
  float v74;
  float v75;
  int v76;
  BWVISNode *v77;
  int v78;
  int v79;
  uint64_t v80;
  double v81;
  double v82;
  double v83;
  double v84;
  const void *v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  char v89;
  uint64_t v90;
  uint64_t v91;
  BOOL v92;
  uint64_t v93;
  char v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  uint64_t v98;
  const __CFString *v99;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  unsigned int v104;
  int v105;
  void *v106;
  void *v107;
  uint64_t v108;
  uint64_t v109;
  char v110;
  unsigned int v111;
  int v112;
  void *v113;
  uint64_t v114;
  unsigned int v116;
  CFTypeRef cf;
  void *v118;
  void *v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  int v128;
  id v129;
  CMTime time;
  _BYTE v131[128];
  _QWORD v132[4];
  __int128 v133;
  __int128 v134;
  uint64_t v135;
  _BYTE v136[128];
  uint64_t v137;

  v137 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v114 = objc_msgSend((id)objc_msgSend(a17, "captureStream"), "sensorIDDictionary");
  v39 = (void *)objc_msgSend((id)objc_msgSend(a5, "sourceConfiguration"), "requiredFormat");
  v40 = objc_msgSend(a5, "irisVISEnabled");
  v113 = a3;
  if (v40)
  {
    v41 = (void *)objc_msgSend(a5, "irisSinkConfiguration");
    v42 = a4;
    if (v41)
      objc_msgSend(v41, "irisMovieVideoFrameDuration");
    else
      memset(&time, 0, sizeof(time));
    v44 = 1.0 / CMTimeGetSeconds(&time);
    v45 = objc_msgSend(a5, "irisVISMethod");
  }
  else
  {
    v42 = a4;
    objc_msgSend((id)objc_msgSend(a5, "sourceConfiguration"), "requiredMaxFrameRate");
    v44 = v43;
    v45 = objc_msgSend(a5, "videoStabilizationMethod");
  }
  v46 = v45;
  if (v45 == 5 || (v47 = 0, v45 == 3))
  {
    objc_msgSend(v39, "cinematicStabilizationExtendedLookAheadDuration");
    v47 = v48;
  }
  if (!a2)
  {
    fig_log_get_emitter();
    goto LABEL_20;
  }
  v112 = a7;
  v129 = 0;
  v49 = objc_msgSend((id)objc_msgSend(a5, "sourceConfiguration"), "source");
  v50 = *(uint64_t (**)(uint64_t, const __CFString *, _QWORD, id *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                            + 48);
  if (!v50)
  {
    v128 = -12782;
LABEL_19:
    fig_log_get_emitter();
LABEL_20:
    FigDebugAssert3();
    v54 = 0;
LABEL_21:

    return 0;
  }
  v128 = v50(v49, CFSTR("AttributesDictionary"), *MEMORY[0x1E0C9AE00], &v129);
  if (v128)
    goto LABEL_19;
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(v129, "objectForKeyedSubscript:", 0x1E49529B8), "objectForKeyedSubscript:", 0x1E49529D8), "floatValue");
  v52 = v51;

  if (a6 == 4)
  {
    v53 = objc_msgSend(a17, "copyISPProcessingSessionWithType:error:", 6, 0);
    if (!v53)
      goto LABEL_19;
  }
  else if (a6 == 3)
  {
    v53 = objc_msgSend(a17, "copyISPProcessingSessionWithType:error:", 1, 0);
    if (!v53)
      goto LABEL_19;
  }
  else
  {
    v53 = 0;
  }
  v119 = a5;
  v111 = v46;
  v107 = v42;
  v108 = a2;
  v116 = a6;
  v106 = a1;
  cf = (CFTypeRef)v53;
  if (v40)
  {
    v55 = (double)(int)a18 / 1.1;
    v56 = FigCaptureRoundFloatToMultipleOf(4, v55);
    v57 = (double)SHIDWORD(a18) / 1.1;
    v58 = FigCaptureRoundFloatToMultipleOf(4, v57);
    v59 = a18 - v56;
    if ((int)a18 < v56)
      ++v59;
    v60 = (double)(v59 >> 1);
    v61 = HIDWORD(a18) - v58;
    if (SHIDWORD(a18) < v58)
      ++v61;
    v62 = (double)(v61 >> 1);
    v63 = (double)v56;
    v64 = (double)v58;
    if (a19)
    {
      *a19 = v60;
      a19[1] = v62;
      a19[2] = v63;
      a19[3] = v64;
    }
  }
  else
  {
    v60 = *MEMORY[0x1E0C9D648];
    v62 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v63 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v64 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  if ((objc_msgSend((id)objc_msgSend(a5, "irisSinkConfiguration"), "irisApplyPreviewShift") & 1) != 0
    || (objc_msgSend(a17, "parallaxMitigationBasedOnZoomFactorEnabled") & 1) != 0)
  {
    v110 = 1;
  }
  else
  {
    v110 = objc_msgSend(a17, "adaptiveOverscanEnabled");
  }
  v109 = objc_msgSend(a17, "cameraInfoByPortType");
  v118 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v124 = 0u;
  v125 = 0u;
  v126 = 0u;
  v127 = 0u;
  v65 = (void *)objc_msgSend(a17, "activePortTypes");
  v66 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v124, v136, 16);
  if (v66)
  {
    v67 = v66;
    v68 = *(_QWORD *)v125;
LABEL_41:
    v69 = 0;
    while (1)
    {
      if (*(_QWORD *)v125 != v68)
        objc_enumerationMutation(v65);
      v70 = *(_QWORD *)(*((_QWORD *)&v124 + 1) + 8 * v69);
      v71 = (void *)FigVideoCaptureSourceCopyUnderlyingSourceFormatForFormatAndPortType(objc_msgSend((id)objc_msgSend(v119, "sourceConfiguration"), "source"), v39, v70, &v128);
      if (v128)
        break;
      v72 = v71;
      if (!v71)
        break;
      v73 = objc_msgSend(v71, "distortionCompensationSupported");
      if (a14 != 5 && !a11 && v73 && (objc_msgSend(a31, "containsObject:", v70) & 1) == 0)
        objc_msgSend(v118, "addObject:", v70);

      if (v67 == ++v69)
      {
        v67 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v124, v136, 16);
        if (v67)
          goto LABEL_41;
        goto LABEL_53;
      }
    }
    fig_log_get_emitter();
    FigDebugAssert3();
    v54 = 0;
    v85 = (const void *)v53;
    if (!v53)
      goto LABEL_21;
LABEL_87:
    CFRelease(v85);
    goto LABEL_21;
  }
LABEL_53:
  v105 = v47;
  v74 = a9;
  v75 = v52 * 10.0;
  if (objc_msgSend(v39, "isHighPhotoQualitySupported"))
    v76 = 2;
  else
    v76 = 1;
  v104 = v76;
  v77 = [BWVISNode alloc];
  objc_msgSend(v39, "maxSupportedFrameRate");
  v79 = v78;
  v80 = objc_msgSend(a16, "priority");
  BYTE5(v103) = a11 == 1;
  BYTE4(v103) = a26;
  *(float *)&v103 = v75;
  HIDWORD(v102) = a14;
  BYTE2(v102) = a13;
  BYTE1(v102) = v110;
  LOBYTE(v102) = objc_msgSend(v119, "zoomSmoothingEnabled");
  BYTE5(v101) = a10;
  BYTE4(v101) = a8;
  LODWORD(v101) = v112;
  LODWORD(v81) = v79;
  *(float *)&v82 = v44;
  *(float *)&v83 = v74;
  LODWORD(v84) = v105;
  v85 = (const void *)v53;
  v54 = -[BWVISNode initWithSensorIDDict:stabilizationMethod:stabilizationType:ispProcessingSession:maxSupportedFrameRate:activeMaxFrameRate:gpuPriority:metalSubmissionAndCompletionQueuePriority:motionAttachmentsSource:fillExtendedRowsOfOutputBuffer:overCaptureEnabled:stereoMode:videoStabilizationOverscanOverride:videoStabilizationStrength:zoomSmoothingEnabled:applyFrameCropOffset:motionMetadataPreloadingEnabled:visExecutionMode:livePhotoCleanOutputRect:cameraInfoByPortType:cvisExtendedLookAheadDuration:distortionCorrectionEnabledPortTypes:distortionCompensationEnabledPortTypes:minDistanceForBravoParallaxShift:lightSourceMaskAndKeypointDescriptorDataEnabled:attachStabilizedOutputCameraTrajectory:](v77, "initWithSensorIDDict:stabilizationMethod:stabilizationType:ispProcessingSession:maxSupportedFrameRate:activeMaxFrameRate:gpuPriority:metalSubmissionAndCompletionQueuePriority:motionAttachmentsSource:fillExtendedRowsOfOutputBuffer:overCaptureEnabled:stereoMode:videoStabilizationOverscanOverride:videoStabilizationStrength:zoomSmoothingEnabled:applyFrameCropOffset:motionMetadataPreloadingEnabled:visExecutionMode:livePhotoCleanOutputRect:cameraInfoByPortType:cvisExtendedLookAheadDuration:distortionCorrectionEnabledPortTypes:distortionCompensationEnabledPortTypes:minDistanceForBravoParallaxShift:lightSourceMaskAndKeypointDescriptorDataEnabled:attachStabilizedOutputCameraTrajectory:", v114, v111, v116, v53, v104, v80, v81, v82, v83, v60, v62,
          v63,
          v64,
          v84,
          v101,
          __PAIR64__(a12, a11),
          v102,
          v109,
          a31,
          v118,
          v103);
  if (objc_msgSend(a17, "position") == 2
    && (FigCaptureCameraRequires180DegreesRotation(objc_msgSend(a17, "position") == 2, 0) & 1) == 0)
  {
    v132[0] = 0;
    v132[2] = 0;
    v133 = 0u;
    v134 = 0u;
    v132[1] = 0x3FF0000000000000;
    v132[3] = 0xBFF0000000000000;
    v135 = 0x3FF0000000000000;
    -[BWVISNode setCameraExtrinsicMatrix:](v54, "setCameraExtrinsicMatrix:", objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v132, 72));
  }
  if (!v54)
  {
    fig_log_get_emitter();
    goto LABEL_91;
  }
  v122 = 0u;
  v123 = 0u;
  v120 = 0u;
  v121 = 0u;
  v86 = (void *)objc_msgSend(a17, "captureStreams");
  v87 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v120, v131, 16);
  if (v87)
  {
    v88 = v87;
    v89 = 0;
    v90 = *(_QWORD *)v121;
    do
    {
      v91 = 0;
      do
      {
        if (*(_QWORD *)v121 != v90)
          objc_enumerationMutation(v86);
        objc_msgSend(*(id *)(*((_QWORD *)&v120 + 1) + 8 * v91), "currentNonLowPowerSphereMode");
        v92 = FigCFEqual() || FigCFEqual() || FigCFEqual() != 0;
        v89 |= v92;
        ++v91;
      }
      while (v88 != v91);
      v93 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v120, v131, 16);
      v88 = v93;
    }
    while (v93);
  }
  else
  {
    v89 = 0;
  }
  v94 = v89 | a10;
  v95 = objc_msgSend(a17, "variableFrameRateControlEnabled");
  -[BWVISNode setOutputDimensions:](v54, "setOutputDimensions:", a18);
  -[BWVISNode setSphereVideoEnabled:](v54, "setSphereVideoEnabled:", v94 & 1);
  -[BWVISNode setFrameRateConversionEnabled:](v54, "setFrameRateConversionEnabled:", v95);
  if (a20)
    -[BWVISNode setOutputColorSpaceProperties:](v54, "setOutputColorSpaceProperties:", 6);
  v96 = a15;
  if (a21)
  {
    -[BWVISNode setStabilizeDepthAttachments:](v54, "setStabilizeDepthAttachments:", 1);
    v96 = a15;
    -[BWVISNode setOutputDepthDimensions:](v54, "setOutputDepthDimensions:", a22);
  }
  -[BWVISNode setMaxLossyCompressionLevel:](v54, "setMaxLossyCompressionLevel:", a23);
  -[BWVISNode setFlipHorizontalExcludingIris:](v54, "setFlipHorizontalExcludingIris:", objc_msgSend(v119, "physicalMirroringForMovieRecordingEnabled"));
  -[BWVISNode setVideoSTFEnabled:](v54, "setVideoSTFEnabled:", a24);
  -[BWVISNode setVideoGreenGhostMitigationEnabled:](v54, "setVideoGreenGhostMitigationEnabled:", a25);
  -[BWVISNode setSmartStyleRenderingEnabled:](v54, "setSmartStyleRenderingEnabled:", a28);
  -[BWVISNode setSmartStyleReversibilityEnabled:](v54, "setSmartStyleReversibilityEnabled:", a29);
  -[BWVISNode setLowResImageUsedByVideoEncoderEnabled:](v54, "setLowResImageUsedByVideoEncoderEnabled:", a30);
  -[BWVISNode setPersonSegmentationRenderingEnabled:](v54, "setPersonSegmentationRenderingEnabled:", a27);
  v97 = (void *)MEMORY[0x1E0CB3940];
  v98 = objc_msgSend(v106, "name");
  if (v116 - 1 > 3)
    v99 = CFSTR("None");
  else
    v99 = off_1E4923EF0[v116 - 1];
  v85 = cf;
  -[BWNode setName:](v54, "setName:", objc_msgSend(v97, "stringWithFormat:", CFSTR("%@ Stabilizer (%@)"), v98, v99));
  -[BWVISNode setPipelineTraceID:](v54, "setPipelineTraceID:", v96);
  if ((objc_msgSend(v107, "addNode:error:", v54, 0) & 1) == 0
    || (objc_msgSend(v113, "connectOutput:toInput:pipelineStage:", v108, -[BWNode input](v54, "input"), a16) & 1) == 0)
  {
    fig_log_get_emitter();
LABEL_91:
    FigDebugAssert3();
    if (!v85)
      goto LABEL_21;
    goto LABEL_87;
  }
  if (cf)
    CFRelease(cf);
  return v54;
}

- (uint64_t)motionAttachmentsNode
{
  if (result)
    return *(_QWORD *)(result + 32);
  return result;
}

- (double)irisVISCleanOutputRect
{
  if (a1)
    return *(double *)(a1 + 56);
  else
    return 0.0;
}

@end
