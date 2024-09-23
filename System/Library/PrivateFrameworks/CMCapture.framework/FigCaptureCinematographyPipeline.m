@implementation FigCaptureCinematographyPipeline

+ (void)initialize
{
  objc_opt_class();
}

- (void)initWithConfiguration:(uint64_t)a3 videoSourceCaptureOutput:(uint64_t)a4 sourceSemanticMasksOutput:(uint64_t)a5 previewOutput:(uint64_t)a6 auxiliaryOutput:(void *)a7 graph:(uint64_t)a8 name:(void *)a9 sourceID:(void *)a10 captureDevice:(uint64_t)a11 inferenceScheduler:(_DWORD *)a12 errorOut:
{
  id v18;
  void *v19;
  int v20;
  int v22;
  objc_super v23;

  if (!a1)
    return 0;
  v23.receiver = a1;
  v23.super_class = (Class)FigCaptureCinematographyPipeline;
  v18 = objc_msgSendSuper2(&v23, sel_initWithGraph_name_, a7, a8);
  v19 = v18;
  if (v18)
  {
    v20 = -[FigCaptureCinematographyPipeline _buildCinematographyPipeline:videoSourceCaptureOutput:sourceSemanticMasksOutput:previewOutput:auxiliaryOutput:sourceID:graph:captureDevice:inferenceScheduler:]((uint64_t)v18, a2, a3, a4, a5, a6, a9, a7, a10, a11);
    if (v20)
    {
      v22 = v20;
      fig_log_get_emitter();
      FigDebugAssert3();
      if (a12)
        *a12 = v22;

      return 0;
    }
  }
  return v19;
}

- (uint64_t)_buildCinematographyPipeline:(uint64_t)a3 videoSourceCaptureOutput:(uint64_t)a4 sourceSemanticMasksOutput:(uint64_t)a5 previewOutput:(uint64_t)a6 auxiliaryOutput:(void *)a7 sourceID:(void *)a8 graph:(void *)a9 captureDevice:(uint64_t)a10 inferenceScheduler:
{
  uint64_t v15;
  uint64_t v16;
  BWPipelineStage *v17;
  FigVideoCaptureConnectionConfiguration *v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  BWSlaveFrameSynchronizerNode *v25;
  BWSmartStyleLearningNode *v26;
  BWSmartStyleLearningNode *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t i;
  void *v41;
  void *v42;
  char v43;
  double v44;
  uint64_t v45;
  uint64_t v46;
  BWRealtimeCinematographyNode *v47;
  void *v48;
  uint64_t v49;
  _BOOL8 v50;
  uint64_t v51;
  __int128 v52;
  void *v53;
  BWPipelineStage *v54;
  BWPipelineStage *v56;
  uint64_t v57;
  FigCaptureCameraParameters *v59;
  uint64_t v60;
  char v61;
  id *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  uint64_t v66;
  BWPipelineStage *v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  objc_super v72;
  id v73;
  unsigned int v74;
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  if (!result)
    return result;
  v15 = result;
  v74 = 0;
  v73 = 0;
  if (a5)
    v16 = a5;
  else
    v16 = a3;
  v17 = +[BWPipelineStage pipelineStageWithName:priority:](BWPipelineStage, "pipelineStageWithName:priority:", CFSTR("com.apple.coremedia.capture.cinematic_video.color_inferences"), 14);
  v54 = +[BWPipelineStage pipelineStageWithName:priority:](BWPipelineStage, "pipelineStageWithName:priority:", CFSTR("com.apple.coremedia.capture.cinematic_video.depth"), 14);
  v66 = a2;
  v67 = +[BWPipelineStage pipelineStageWithName:priority:](BWPipelineStage, "pipelineStageWithName:priority:", CFSTR("com.apple.coremedia.capture.cinematic_video.cinematography"), 14);
  v63 = a5;
  v64 = a7;
  if (a2 && *(_DWORD *)(a2 + 44) == 3)
  {
    v56 = v17;
    v18 = objc_alloc_init(FigVideoCaptureConnectionConfiguration);
    -[FigCaptureConnectionConfiguration setSourceConfiguration:](v18, "setSourceConfiguration:", objc_msgSend(*(id *)(a2 + 16), "sourceConfiguration"));
    -[FigVideoCaptureConnectionConfiguration setVideoStabilizationMethod:](v18, "setVideoStabilizationMethod:", 3);
    v19 = objc_autorelease(-[FigCaptureVISPipeline initWithUpstreamOutput:graph:name:parentPipeline:videoCaptureConnectionConfiguration:pipelineStage:sdofPipelineStage:videoStabilizationType:motionAttachmentsSource:fillExtendedRowsOfOutputBuffer:overCaptureEnabled:stereoMode:videoStabilizationOverscanOverride:videoStabilizationStrength:motionMetadataPreloadingEnabled:visExecutionMode:pipelineTraceID:captureDevice:outputDimensions:P3ToBT2020ConversionEnabled:stabilizeDepthAttachments:outputDepthDimensions:maxLossyCompressionLevel:videoSTFEnabled:videoGreenGhostMitigationEnabled:lightSourceMaskAndKeypointDescriptorDataEnabled:personSegmentationRenderingEnabled:smartStyleRenderingEnabled:smartStyleReversibilityEnabled:lowResImageUsedByVideoEncoderEnabled:portTypesWithGeometricDistortionCorrectionInVISEnabled:]([FigCaptureVISPipeline alloc], v16, a8, 0.0, (uint64_t)CFSTR("FSDNet REF RSC"), (void *)v15, v18, 0, 0, 2u, 2u, 1, 0, 0, 0, 0, 5, 0x50u,
              a9,
              0,
              0,
              0,
              0,
              3u,
              0,
              0,
              0,
              0,
              0,
              0,
              0,
              0));
    if (!v19
      || (v20 = objc_msgSend((id)-[FigCaptureVISPipeline visNode]((uint64_t)v19), "output"),
          (v21 = objc_autorelease(-[FigCaptureVISPipeline initWithUpstreamOutput:graph:name:parentPipeline:videoCaptureConnectionConfiguration:pipelineStage:sdofPipelineStage:videoStabilizationType:motionAttachmentsSource:fillExtendedRowsOfOutputBuffer:overCaptureEnabled:stereoMode:videoStabilizationOverscanOverride:videoStabilizationStrength:motionMetadataPreloadingEnabled:visExecutionMode:pipelineTraceID:captureDevice:outputDimensions:P3ToBT2020ConversionEnabled:stabilizeDepthAttachments:outputDepthDimensions:maxLossyCompressionLevel:videoSTFEnabled:videoGreenGhostMitigationEnabled:lightSourceMaskAndKeypointDescriptorDataEnabled:personSegmentationRenderingEnabled:smartStyleRenderingEnabled:smartStyleReversibilityEnabled:lowResImageUsedByVideoEncoderEnabled:portTypesWithGeometricDistortionCorrectionInVISEnabled:]([FigCaptureVISPipeline alloc], a6, a8, 0.0, (uint64_t)CFSTR("FSDNet AUX RSC"), (void *)v15, v18, 0, 0, 2u, 2u, 1, 0, 0, 0, 0, 5, 0x50u,
                     a9,
                     0,
                     0,
                     0,
                     0,
                     3u,
                     0,
                     0,
                     0,
                     0,
                     0,
                     0,
                     0,
                     0))) == 0))
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      goto LABEL_73;
    }
    v22 = objc_msgSend((id)-[FigCaptureVISPipeline visNode]((uint64_t)v21), "output");
    if (*(_BYTE *)(a2 + 40))
      v23 = &unk_1E4A01EE0;
    else
      v23 = 0;
    if (*(_BYTE *)(a2 + 41))
      v24 = &unk_1E4A01EF8;
    else
      v24 = 0;
    BYTE12(v52) = 0;
    *(_QWORD *)((char *)&v52 + 4) = 1;
    LOBYTE(v52) = 1;
    v25 = -[BWSlaveFrameSynchronizerNode initWithDepthEnabled:numberOfInputs:syncSlaveForMasterPortTypes:separateDepthComponentsEnabled:preLTMThumbnailEnabledInputs:postColorProcessingThumbnailEnabledInputs:differentInputFormatsSupported:bufferSize:numberOfSlaveFramesToSkip:startEmittingMasterFramesBeforeSlaveStreamStarts:]([BWSlaveFrameSynchronizerNode alloc], "initWithDepthEnabled:numberOfInputs:syncSlaveForMasterPortTypes:separateDepthComponentsEnabled:preLTMThumbnailEnabledInputs:postColorProcessingThumbnailEnabledInputs:differentInputFormatsSupported:bufferSize:numberOfSlaveFramesToSkip:startEmittingMasterFramesBeforeSlaveStreamStarts:", 0, 2, 0, 0, v23, v24, v52);
    -[BWNode setName:](v25, "setName:", CFSTR("REF/AUX sync node"));
    if ((objc_msgSend((id)v15, "addNode:error:", v25, &v73) & 1) == 0
      || (objc_msgSend(a8, "connectOutput:toInput:pipelineStage:", v20, -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v25, "inputs"), "objectAtIndexedSubscript:", 1), 0) & 1) == 0|| (objc_msgSend(a8, "connectOutput:toInput:pipelineStage:", v22, -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v25, "inputs"), "objectAtIndexedSubscript:", 0), 0) & 1) == 0)
    {
      fig_log_get_emitter();
LABEL_79:
      FigDebugAssert3();
      goto LABEL_63;
    }
    v16 = -[BWNode output](v25, "output");
    v60 = v22;
    if (*(_BYTE *)(a2 + 24))
    {
      v26 = -[BWSmartStyleLearningNode initWithOutputs:masksRefinerEnabled:propagateMasks:]([BWSmartStyleLearningNode alloc], "initWithOutputs:masksRefinerEnabled:propagateMasks:", 1, 0, 0);
      v17 = v56;
      if (!v26)
        goto LABEL_63;
      v27 = v26;
      -[BWNode setName:](v26, "setName:", CFSTR("Cinematic SmartStyle Learning"));
      -[BWSmartStyleLearningNode setDisableWaitForCoefficientsOnFirstFrame:](v27, "setDisableWaitForCoefficientsOnFirstFrame:", 0);
      -[BWSmartStyleLearningNode setSubjectRelightingEnabled:](v27, "setSubjectRelightingEnabled:", 0);
      -[BWSmartStyleLearningNode setCameraInfoByPortType:](v27, "setCameraInfoByPortType:", objc_msgSend(a9, "cameraInfoByPortType"));
      -[BWSmartStyleLearningNode setSmartStyle:](v27, "setSmartStyle:", *(_QWORD *)(a2 + 32));
      v72.receiver = (id)v15;
      v72.super_class = (Class)FigCaptureCinematographyPipeline;
      if ((objc_msgSendSuper2(&v72, sel_addNode_error_, v27, &v73) & 1) == 0
        || (objc_msgSend(a8, "connectOutput:toInput:pipelineStage:", v16, -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v27, "inputs"), "objectAtIndexedSubscript:", 0), 0) & 1) == 0|| a4&& (objc_msgSend(a8, "connectOutput:toInput:pipelineStage:", a4, -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v27, "inputs"), "objectAtIndexedSubscript:", 1), 0) & 1) == 0)
      {
        goto LABEL_78;
      }
      v16 = -[BWNode output](v27, "output");
      *(_QWORD *)(v15 + 56) = v27;
      v28 = 1;
    }
    else
    {
      v28 = 1;
      v17 = v56;
    }
  }
  else
  {
    v60 = a6;
    v28 = 0;
  }
  *(_QWORD *)(v15 + 64) = v64;
  *(_QWORD *)(v15 + 40) = -[BWCinematicPerceptionNode initWithConvEngineSupportWithCaptureDevice:scheduler:priority:depthInferenceEnabled:]([BWCinematicPerceptionNode alloc], "initWithConvEngineSupportWithCaptureDevice:scheduler:priority:depthInferenceEnabled:", a9, a10, 6, v28);
  objc_msgSend(*(id *)(v15 + 40), "setName:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), objc_msgSend((id)v15, "name"), CFSTR("FusionTracker")));
  if ((objc_msgSend((id)v15, "addNode:error:", *(_QWORD *)(v15 + 40), &v73) & 1) == 0)
  {
LABEL_78:
    fig_log_get_emitter();
    goto LABEL_79;
  }
  if ((objc_msgSend(a8, "connectOutput:toInput:pipelineStage:", v16, objc_msgSend(*(id *)(v15 + 40), "input"), v17) & 1) == 0)
  {
    fig_log_get_emitter();
LABEL_71:
    FigDebugAssert3();
LABEL_73:
    v74 = FigSignalErrorAt();
    goto LABEL_63;
  }
  v29 = objc_msgSend(*(id *)(v15 + 40), "output");
  v30 = v29;
  v62 = (id *)v15;
  if ((v28 & 1) == 0)
  {
    v31 = -[BWDepthSynchronizerNode initForStreaming:separateDepthComponentsEnabled:]([BWDepthSynchronizerNode alloc], "initForStreaming:separateDepthComponentsEnabled:", 1, 0);
    objc_msgSend(v31, "setName:", CFSTR("Cinematography Depth Synchronizer"));
    objc_msgSend(v31, "setFlushOnDepthEOD:", 1);
    if ((objc_msgSend((id)v15, "addNode:error:", v31, &v73) & 1) != 0
      && (objc_msgSend(a8, "connectOutput:toInput:pipelineStage:", v30, objc_msgSend(v31, "imageInput"), 0) & 1) != 0
      && (objc_msgSend(a8, "connectOutput:toInput:pipelineStage:", v60, objc_msgSend(v31, "depthInput"), 0) & 1) != 0)
    {
      v57 = objc_msgSend(v31, "output");
      goto LABEL_35;
    }
    goto LABEL_78;
  }
  v57 = v29;
LABEL_35:
  v61 = v28;
  v65 = a8;
  v59 = +[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance");
  v32 = (void *)*MEMORY[0x1E0D05A18];
  v33 = objc_msgSend((id)objc_msgSend(a9, "captureStream"), "sensorIDString");
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v34 = (void *)objc_msgSend(a9, "activePortTypes");
  v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v68, v75, 16);
  v36 = *MEMORY[0x1E0D05A40];
  v53 = v32;
  if (!v35)
    goto LABEL_47;
  v37 = v35;
  v38 = *(_QWORD *)v69;
  v39 = *MEMORY[0x1E0D05A30];
  do
  {
    for (i = 0; i != v37; ++i)
    {
      if (*(_QWORD *)v69 != v38)
        objc_enumerationMutation(v34);
      v41 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * i);
      if (objc_msgSend(v41, "isEqualToString:", v39))
      {
        v42 = (void *)objc_msgSend(a9, "bravoTelephotoCaptureStream");
      }
      else
      {
        if (!objc_msgSend(v41, "isEqualToString:", v36))
          continue;
        v42 = (void *)objc_msgSend(a9, "pearlInfraredCaptureStream");
      }
      v33 = objc_msgSend(v42, "sensorIDString");
      v32 = v41;
    }
    v37 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v68, v75, 16);
  }
  while (v37);
LABEL_47:
  v43 = objc_msgSend(v32, "isEqualToString:", v36);
  LODWORD(v44) = 1.0;
  if ((v43 & 1) == 0)
    objc_msgSend(a9, "requestedZoomFactorRelativeToPortType:", v53, v44);
  v45 = -[FigCaptureCameraParameters portraitSceneMonitoringParametersForPortType:sensorIDString:zoomFactorRelativeToWidePortType:](v59, "portraitSceneMonitoringParametersForPortType:sensorIDString:zoomFactorRelativeToWidePortType:", v32, v33, v44);
  v46 = objc_msgSend(v62[5], "videoDepthConfiguration");
  v47 = [BWRealtimeCinematographyNode alloc];
  if (v66)
  {
    v49 = *(_QWORD *)(v66 + 8);
    v48 = *(void **)(v66 + 16);
  }
  else
  {
    v49 = 0;
    v48 = 0;
  }
  objc_msgSend((id)objc_msgSend(v48, "videoPreviewSinkConfiguration"), "simulatedAperture");
  if (v66)
    v50 = *(_BYTE *)(v66 + 24) != 0;
  else
    v50 = 0;
  v62[6] = -[BWRealtimeCinematographyNode initWithObjectMetadataIdentifiers:cachedSimulatedAperture:captureDevice:tuningParameters:videoDepthConfiguration:smartStyleLearningEnabled:captureInputEnabled:](v47, "initWithObjectMetadataIdentifiers:cachedSimulatedAperture:captureDevice:tuningParameters:videoDepthConfiguration:smartStyleLearningEnabled:captureInputEnabled:", v49, a9, v45, v46, v50, v63 != 0);
  objc_msgSend(v62[6], "setName:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), objc_msgSend(v62, "name"), CFSTR("Cinematography")));
  if ((objc_msgSend(v62, "addNode:error:", v62[6], &v73) & 1) == 0)
  {
LABEL_77:
    fig_log_get_emitter();
    goto LABEL_79;
  }
  if ((v61 & 1) == 0)
  {
    v62[4] = -[BWVideoDepthNode initWithInferenceScheduler:captureDevice:videoDepthConfiguration:extraDepthOutputRetainedBufferCount:error:]([BWVideoDepthNode alloc], "initWithInferenceScheduler:captureDevice:videoDepthConfiguration:extraDepthOutputRetainedBufferCount:error:", a10, a9, v46, 0, &v74);
    if (!v74)
    {
      objc_msgSend(v62[4], "setName:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), objc_msgSend(v62, "name"), CFSTR("Video Depth Node")));
      if ((objc_msgSend(v62, "addNode:error:", v62[4], &v73) & 1) != 0
        && (objc_msgSend(v65, "connectOutput:toInput:pipelineStage:", v57, objc_msgSend(v62[4], "input"), v54) & 1) != 0)
      {
        v51 = objc_msgSend(v62[4], "output");
        goto LABEL_60;
      }
    }
    goto LABEL_77;
  }
  v51 = v57;
LABEL_60:
  if ((objc_msgSend(v65, "connectOutput:toInput:pipelineStage:", v51, objc_msgSend(v62[6], "input"), v67) & 1) == 0
    || v63
    && (objc_msgSend(v65, "connectOutput:toInput:pipelineStage:", a3, objc_msgSend((id)objc_msgSend(v62[6], "inputs"), "objectAtIndexedSubscript:", 1), v67) & 1) == 0)
  {
    fig_log_get_emitter();
    goto LABEL_71;
  }
LABEL_63:
  result = v74;
  if (!v74)
  {
    if (v73)
      return objc_msgSend(v73, "code");
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigCaptureCinematographyPipeline;
  -[FigCapturePipeline dealloc](&v3, sel_dealloc);
}

- (uint64_t)previewOutput
{
  if (result)
    return objc_msgSend(*(id *)(result + 48), "previewOutput");
  return result;
}

- (uint64_t)videoCaptureOutput
{
  if (result)
    return objc_msgSend(*(id *)(result + 48), "movieFileOutput");
  return result;
}

- (uint64_t)cinematicVideoFocusDetectionsProvider
{
  if (result)
    return *(_QWORD *)(result + 48);
  return result;
}

- (uint64_t)depthOutputDimensions
{
  if (result)
    return objc_msgSend((id)objc_msgSend(*(id *)(result + 40), "videoDepthConfiguration"), "outputDimensions");
  return result;
}

- (uint64_t)detectedObjectsOutput
{
  if (result)
    return objc_msgSend(*(id *)(result + 48), "detectedObjectsOutput");
  return result;
}

- (uint64_t)setSimulatedAperture:(uint64_t)result
{
  if (result)
    return objc_msgSend(*(id *)(result + 48), "setSimulatedAperture:");
  return result;
}

- (float)simulatedAperture
{
  float result;

  if (!a1)
    return 0.0;
  objc_msgSend(*(id *)(a1 + 48), "simulatedAperture");
  return result;
}

- (uint64_t)globalMetadata
{
  if (result)
    return objc_msgSend(*(id *)(result + 48), "globalMetadata");
  return result;
}

- (uint64_t)setSmartStyle:(uint64_t)result
{
  if (result)
    return objc_msgSend(*(id *)(result + 56), "setSmartStyle:", a2);
  return result;
}

- (uint64_t)getSmartStyle
{
  if (result)
    return objc_msgSend(*(id *)(result + 56), "smartStyle");
  return result;
}

- (uint64_t)semanticStyleSceneObserver
{
  if (result)
    return *(_QWORD *)(result + 56);
  return result;
}

- (uint64_t)sourceID
{
  if (result)
    return *(_QWORD *)(result + 64);
  return result;
}

@end
