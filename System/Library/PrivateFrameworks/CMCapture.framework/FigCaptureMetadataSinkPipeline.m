@implementation FigCaptureMetadataSinkPipeline

- (uint64_t)_buildFaceTrackingPipeline:(uint64_t)result graph:(uint64_t)a2 videoCaptureOutput:(void *)a3 pipelineStage:(void *)a4 captureDevice:(void *)a5
{
  _QWORD *v9;
  BWFaceTrackingNode *v10;
  uint64_t v11;
  uint64_t v12;
  BWFaceTrackingNode *v13;
  BWFaceTrackingNode *v14;
  void *v15;
  objc_super v16;
  id v17;

  if (result)
  {
    v9 = (_QWORD *)result;
    v17 = 0;
    objc_msgSend(a4, "setName:", CFSTR("FaceTracking"));
    v10 = [BWFaceTrackingNode alloc];
    v11 = objc_msgSend(a5, "priority");
    if (a2)
      v12 = *(unsigned int *)(a2 + 44);
    else
      v12 = 0;
    v13 = -[BWFaceTrackingNode initWithFigThreadPriority:pearlModuleType:useUnfilteredDepth:queueDepth:passthroughInputs:allowPixelTransfer:](v10, "initWithFigThreadPriority:pearlModuleType:useUnfilteredDepth:queueDepth:passthroughInputs:allowPixelTransfer:", v11, v12, 1, 2, 0, 0);
    if (v13)
    {
      v14 = v13;
      if (a2)
      {
        v15 = *(void **)(a2 + 8);
        a2 = *(_QWORD *)(a2 + 16);
      }
      else
      {
        v15 = 0;
      }
      -[BWFaceTrackingNode setFrontCamera:](v13, "setFrontCamera:", objc_msgSend((id)objc_msgSend(v15, "sourceConfiguration"), "sourcePosition") == 2);
      -[BWFaceTrackingNode setMirrored:](v14, "setMirrored:", objc_msgSend((id)a2, "mirroringEnabled"));
      -[BWFaceTrackingNode setOrientation:](v14, "setOrientation:", objc_msgSend((id)a2, "orientation"));
      -[BWFaceTrackingNode setMaxFaces:](v14, "setMaxFaces:", objc_msgSend(v15, "faceTrackingMaxFaces"));
      -[BWFaceTrackingNode setUsesFaceRecognition:](v14, "setUsesFaceRecognition:", objc_msgSend(v15, "faceTrackingUsesFaceRecognition"));
      -[BWFaceTrackingNode setFaceTrackingPlusEnabled:](v14, "setFaceTrackingPlusEnabled:", objc_msgSend(v15, "faceTrackingPlusEnabled"));
      objc_msgSend(v15, "faceTrackingNetworkFailureThresholdMultiplier");
      -[BWFaceTrackingNode setNetworkFailureThresholdMultiplier:](v14, "setNetworkFailureThresholdMultiplier:");
      objc_msgSend(v15, "faceTrackingFailureFieldOfViewModifier");
      -[BWFaceTrackingNode setTrackingFailureFieldOfViewModifier:](v14, "setTrackingFailureFieldOfViewModifier:");
      v16.receiver = v9;
      v16.super_class = (Class)FigCaptureMetadataSinkPipeline;
      if ((objc_msgSendSuper2(&v16, sel_addNode_error_, v14, &v17) & 1) == 0
        || (v9[11] = v14,
            (objc_msgSend(a3, "connectOutput:toInput:pipelineStage:", a4, -[BWNode input](v14, "input"), a5) & 1) == 0))
      {
        fig_log_get_emitter();
        FigDebugAssert3();
      }
      result = 0;
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      result = FigSignalErrorAt();
      if ((_DWORD)result)
        return result;
    }
    if (v17)
      return objc_msgSend(v17, "code");
  }
  return result;
}

- (uint64_t)setDiscardsFaceDetectionSampleData:(uint64_t)result
{
  if (result)
    return objc_msgSend((id)objc_msgSend(*(id *)(result + 96), "metadataObjectOutput"), "setDiscardsSampleData:", a2);
  return result;
}

- (uint64_t)setDiscardsMRCSampleData:(uint64_t)result
{
  if (result)
    return objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(result + 64), "input"), "connection"), "output"), "setDiscardsSampleData:", a2);
  return result;
}

- (uint64_t)setDiscardsFaceTrackingSampleData:(uint64_t)result
{
  if (result)
    return objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(result + 88), "input"), "connection"), "output"), "setDiscardsSampleData:", a2);
  return result;
}

- (_QWORD)_buildPreviewHistogramSinkPipeline:(_QWORD *)result graph:(uint64_t)a2 videoPreviewHistogramOutput:(void *)a3 captureDevice:(void *)a4
{
  _QWORD *v6;
  void *v7;
  BWPipelineStage *v8;
  BWPreviewHistogramNode *v9;
  BWPreviewHistogramNode *v10;
  objc_super v11;
  _QWORD *v12;

  if (result)
  {
    v6 = result;
    v12 = 0;
    if (a2)
      v7 = *(void **)(a2 + 8);
    else
      v7 = 0;
    v8 = +[BWPipelineStage pipelineStageWithName:priority:discardsLateSampleData:](BWPipelineStage, "pipelineStageWithName:priority:discardsLateSampleData:", FigCaptureBuildPipelineStageName((uint64_t)CFSTR("com.apple.coremedia.capture.video-preview-histogram"), (void *)objc_msgSend(v7, "sourceConfiguration")), 0, 1);
    objc_msgSend(a4, "setName:", CFSTR("Preview Histogram"));
    v9 = objc_alloc_init(BWPreviewHistogramNode);
    -[BWPreviewHistogramNode setMsrHistogramsEnabled:](v9, "setMsrHistogramsEnabled:", FigCaptureSessionIsLaunchPrewarmingEnabled());
    -[BWPreviewHistogramNode setIspHistogramsEnabled:](v9, "setIspHistogramsEnabled:", FigCaptureMetadataUtilitiesShouldIncludeDiagnosticMetadata());
    v11.receiver = v6;
    v11.super_class = (Class)FigCaptureMetadataSinkPipeline;
    if ((objc_msgSendSuper2(&v11, sel_addNode_error_, v9, &v12) & 1) == 0
      || (v10 = v9,
          v6[10] = v10,
          (objc_msgSend(a3, "connectOutput:toInput:pipelineStage:", a4, -[BWNode input](v10, "input"), v8) & 1) == 0))
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    result = v12;
    if (v12)
      return (_QWORD *)objc_msgSend(v12, "code");
  }
  return result;
}

- (id)_buildMetadataObjectRemoteQueueSinkPipeline:(void *)a3 graph:(void *)a4 metadataNodeOutputs:(uint64_t)a5 videoPreviewEnabled:(int)a6 deferredPrepareEnabled:(uint64_t)a7 delegate:(_OWORD *)a8 clientAuditToken:
{
  void *v14;
  uint64_t v15;
  __objc2_class **v16;
  BWFunnelNode *v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  BWRemoteQueueSinkNode *v25;
  uint64_t v26;
  __int128 v27;
  BWRemoteQueueSinkNode *v28;
  objc_class *v29;
  objc_class *v30;
  void *v31;
  BWPipelineStage *v32;
  _OWORD *v33;
  uint64_t v34;
  int v35;
  objc_super v36;
  objc_super v37;
  _OWORD v38[2];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  objc_super v43;
  id v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v14 = result;
    v44 = 0;
    v15 = objc_msgSend(a4, "count");
    v16 = &classRef_BWStillImageCameraCalibrationDataNode;
    if ((int)v15 < 2)
    {
      v24 = objc_msgSend(a4, "firstObject");
    }
    else
    {
      v17 = -[BWFunnelNode initWithNumberOfInputs:mediaType:]([BWFunnelNode alloc], "initWithNumberOfInputs:mediaType:", v15, 1836016234);
      -[BWNode setName:](v17, "setName:", CFSTR("Metadata Funnel"));
      v43.receiver = v14;
      v43.super_class = (Class)FigCaptureMetadataSinkPipeline;
      if ((objc_msgSendSuper2(&v43, sel_addNode_error_, v17, &v44) & 1) == 0)
      {
        fig_log_get_emitter();
        goto LABEL_25;
      }
      v33 = a8;
      v34 = a7;
      v35 = a6;
      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      v18 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
      if (v18)
      {
        v19 = v18;
        v20 = 0;
        v21 = *(_QWORD *)v40;
        while (2)
        {
          v22 = 0;
          v23 = v20;
          do
          {
            if (*(_QWORD *)v40 != v21)
              objc_enumerationMutation(a4);
            if (!objc_msgSend(a3, "connectOutput:toInput:pipelineStage:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * v22), -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v17, "inputs"), "objectAtIndexedSubscript:", v23 + v22), 0))
            {
              fig_log_get_emitter();
              goto LABEL_25;
            }
            ++v22;
          }
          while (v19 != v22);
          v19 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
          v20 = v23 + v22;
          if (v19)
            continue;
          break;
        }
      }
      v24 = -[BWNode output](v17, "output");
      a6 = v35;
      a8 = v33;
      a7 = v34;
      v16 = &classRef_BWStillImageCameraCalibrationDataNode;
    }
    v25 = [BWRemoteQueueSinkNode alloc];
    v26 = objc_msgSend(v14, "sinkID");
    v27 = a8[1];
    v38[0] = *a8;
    v38[1] = v27;
    v28 = -[BWRemoteQueueSinkNode initWithMediaType:clientAuditToken:sinkID:](v25, "initWithMediaType:clientAuditToken:sinkID:", 1836016234, v38, v26);
    -[BWNode setName:](v28, "setName:", CFSTR("Metadata Remote Queue Sink"));
    -[BWRemoteQueueSinkNode setDelegate:](v28, "setDelegate:", a7);
    v29 = (objc_class *)v16[381];
    v37.receiver = v14;
    v37.super_class = v29;
    if ((objc_msgSendSuper2(&v37, sel_addNode_error_, v28, &v44) & 1) != 0)
    {
      v30 = (objc_class *)v16[381];
      v36.receiver = v14;
      v36.super_class = v30;
      objc_msgSendSuper2(&v36, sel_setSinkNode_, v28);
      if (a6)
      {
        if (a2)
          v31 = *(void **)(a2 + 8);
        else
          v31 = 0;
        v32 = +[BWPipelineStage pipelineStageWithName:priority:](BWPipelineStage, "pipelineStageWithName:priority:", FigCaptureBuildPipelineStageName((uint64_t)CFSTR("com.apple.coremedia.capture.metadata-object-remote-queue"), (void *)objc_msgSend(v31, "sourceConfiguration")), 0);
      }
      else
      {
        v32 = 0;
      }
      if ((objc_msgSend(a3, "connectOutput:toInput:pipelineStage:", v24, -[BWNode input](v28, "input"), v32) & 1) != 0)
        goto LABEL_21;
      fig_log_get_emitter();
    }
    else
    {
      fig_log_get_emitter();
    }
LABEL_25:
    FigDebugAssert3();
LABEL_21:
    result = v44;
    if (v44)
      return (id)objc_msgSend(v44, "code");
  }
  return result;
}

- (uint64_t)mrcSceneObserver
{
  if (result)
    return *(_QWORD *)(result + 56);
  return result;
}

+ (void)initialize
{
  objc_opt_class();
}

- (_QWORD)initWithConfiguration:(void *)a3 graph:(uint64_t)a4 name:(void *)a5 videoPreviewOutput:(void *)a6 offlineVISMotionDataSourceOutput:(uint64_t)a7 objectDetectionSourceOutput:(void *)a8 faceTrackingSourceOutput:(uint64_t)a9 eyeReliefStatusSourceOutput:(void *)a10 captureDevice:(BWPipelineStage *)a11 faceTrackingPipelineStage:(_OWORD *)a12 clientAuditToken:(uint64_t)a13 inferenceScheduler:(uint64_t)a14 delegate:
{
  void *v21;
  _QWORD *v22;
  void *v23;
  __int128 v24;
  id v26;
  _OWORD v27[2];
  objc_super v28;

  if (!a1)
    return 0;
  if (a2)
    v21 = *(void **)(a2 + 8);
  else
    v21 = 0;
  v28.receiver = a1;
  v28.super_class = (Class)FigCaptureMetadataSinkPipeline;
  v22 = objc_msgSendSuper2(&v28, sel_initWithGraph_name_sinkID_, a3, a4, objc_msgSend((id)objc_msgSend(v21, "sinkConfiguration"), "sinkID"));
  if (v22)
  {
    if (a2)
    {
      v22[13] = (id)objc_msgSend((id)objc_msgSend(*(id *)(a2 + 8), "sourceConfiguration"), "sourceID");
      v23 = *(void **)(a2 + 8);
    }
    else
    {
      v26 = (id)objc_msgSend((id)objc_msgSend(0, "sourceConfiguration"), "sourceID");
      v23 = 0;
      v22[13] = v26;
    }
    *((_DWORD *)v22 + 28) = objc_msgSend(v23, "underlyingDeviceType");
    v24 = a12[1];
    v27[0] = *a12;
    v27[1] = v24;
    if (-[FigCaptureMetadataSinkPipeline _buildMetadataSinkPipeline:graph:videoPreviewOutput:offlineVISMotionDataSourceOutput:objectDetectionSourceOutput:faceTrackingSourceOutput:eyeReliefStatusSourceOutput:captureDevice:faceTrackingPipelineStage:clientAuditToken:inferenceScheduler:delegate:]((uint64_t)v22, a2, a3, a5, a6, a7, a8, a9, a10, a11, v27, a13, a14))
    {
      fig_log_get_emitter();
      FigDebugAssert3();

      return 0;
    }
  }
  return v22;
}

- (uint64_t)_buildMetadataSinkPipeline:(void *)a3 graph:(id)a4 videoPreviewOutput:(void *)a5 offlineVISMotionDataSourceOutput:(uint64_t)a6 objectDetectionSourceOutput:(void *)a7 faceTrackingSourceOutput:(uint64_t)a8 eyeReliefStatusSourceOutput:(void *)a9 captureDevice:(BWPipelineStage *)a10 faceTrackingPipelineStage:(_OWORD *)a11 clientAuditToken:(uint64_t)a12 inferenceScheduler:(uint64_t)a13 delegate:
{
  id *v19;
  void *v20;
  unsigned int v21;
  void *v22;
  int v23;
  int v24;
  void *v25;
  BWPipelineStage *v26;
  BWFanOutNode *v27;
  uint64_t v28;
  BWPipelineStage *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  unsigned int v34;
  unsigned int v35;
  float v36;
  unsigned int v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t i;
  void *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  id v52;
  _BOOL4 v53;
  __int128 v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  _OWORD v59[2];
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  objc_super v64;
  id v65;
  unsigned int v66;
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  if (!result)
    return result;
  v19 = (id *)result;
  v66 = 0;
  v65 = 0;
  v20 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v56 = (uint64_t)a5;
  v57 = v20;
  if (!a4)
    goto LABEL_27;
  v55 = a8;
  if (a2)
  {
    v21 = FigCaptureMetadataObjectConfigurationRequiresMetadataDetectorPipeline(*(void **)(a2 + 8));
    v22 = *(void **)(a2 + 8);
  }
  else
  {
    v21 = FigCaptureMetadataObjectConfigurationRequiresMetadataDetectorPipeline(0);
    v22 = 0;
  }
  v23 = FigCaptureMetadataObjectConfigurationRequiresVideoPreviewHistogramPipeline(v22);
  v24 = v23;
  if (v23 + v21 < 2)
  {
    if ((v21 & 1) == 0)
    {
      a8 = v55;
      if ((v23 & 1) == 0)
        goto LABEL_27;
      goto LABEL_25;
    }
    v28 = 0;
    a8 = v55;
  }
  else
  {
    if (a2)
      v25 = *(void **)(a2 + 8);
    else
      v25 = 0;
    v26 = +[BWPipelineStage pipelineStageWithName:priority:discardsLateSampleData:](BWPipelineStage, "pipelineStageWithName:priority:discardsLateSampleData:", FigCaptureBuildPipelineStageName((uint64_t)CFSTR("com.apple.coremedia.capture.video-preview-metadata-fanout"), (void *)objc_msgSend(v25, "sourceConfiguration")), 0, 1);
    v27 = -[BWFanOutNode initWithFanOutCount:mediaType:]([BWFanOutNode alloc], "initWithFanOutCount:mediaType:", 2, 1986618469);
    -[BWNode setName:](v27, "setName:", CFSTR("Video Preview Metadata Fan Out"));
    v64.receiver = v19;
    v64.super_class = (Class)FigCaptureMetadataSinkPipeline;
    if ((objc_msgSendSuper2(&v64, sel_addNode_error_, v27, &v65) & 1) == 0
      || (objc_msgSend(a3, "connectOutput:toInput:pipelineStage:", a4, -[BWNode input](v27, "input"), v26) & 1) == 0)
    {
      fig_log_get_emitter();
      goto LABEL_72;
    }
    if (v21)
      a4 = -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v27, "outputs"), "objectAtIndexedSubscript:", 0);
    else
      a4 = 0;
    v20 = v57;
    if (v24)
      v28 = -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v27, "outputs"), "objectAtIndexedSubscript:", v21);
    else
      v28 = 0;
    a8 = v55;
    a5 = (void *)v56;
    if (!a4)
      goto LABEL_24;
  }
  *(_QWORD *)&v59[0] = 0;
  v66 = -[FigCaptureMetadataSinkPipeline _buildMetadataDetectorSinkPipeline:graph:mrcSourceOutput:captureDevice:mrcOutputsOut:inferenceScheduler:](v19, a2, a3, a4, a9, v59, a12);
  if (v66)
    goto LABEL_69;
  if (*(_QWORD *)&v59[0])
    objc_msgSend(v20, "addObjectsFromArray:");
LABEL_24:
  a4 = (id)v28;
  if (!v28)
    goto LABEL_27;
LABEL_25:
  v66 = -[FigCaptureMetadataSinkPipeline _buildPreviewHistogramSinkPipeline:graph:videoPreviewHistogramOutput:captureDevice:](v19, a2, a3, a4);
  if (v66)
    goto LABEL_69;
  objc_msgSend(v20, "addObject:", objc_msgSend(v19[10], "output"));
LABEL_27:
  if (objc_msgSend(a7, "mediaType") == 1986618469)
  {
    v29 = a10;
    if (!a10)
    {
      if (a2)
        v30 = *(void **)(a2 + 8);
      else
        v30 = 0;
      v29 = +[BWPipelineStage pipelineStageWithName:priority:](BWPipelineStage, "pipelineStageWithName:priority:", FigCaptureBuildPipelineStageName((uint64_t)CFSTR("com.apple.coremedia.capture.facetracking"), (void *)objc_msgSend(v30, "sourceConfiguration")), 13);
    }
    v66 = -[FigCaptureMetadataSinkPipeline _buildFaceTrackingPipeline:graph:videoCaptureOutput:pipelineStage:captureDevice:]((uint64_t)v19, a2, a3, a7, v29);
    if (v66)
      goto LABEL_69;
    a7 = (void *)objc_msgSend(v19[11], "output");
    goto LABEL_35;
  }
  if (objc_msgSend(a7, "mediaType") == 1835365473)
LABEL_35:
    objc_msgSend(v20, "addObject:", a7);
  if (a8)
    objc_msgSend(v20, "addObject:", a8);
  if (!a5)
    goto LABEL_45;
  objc_msgSend(a5, "setName:", CFSTR("OfflineVISMotionData"));
  if (a2)
    v31 = *(void **)(a2 + 16);
  else
    v31 = 0;
  v32 = (void *)objc_msgSend((id)objc_msgSend(v31, "sourceConfiguration"), "requiredFormat");
  v33 = objc_msgSend((id)objc_msgSend(v31, "sourceConfiguration"), "imageControlMode");
  v34 = objc_msgSend(v32, "horizontalSensorBinningFactor");
  v35 = objc_msgSend(v32, "verticalSensorBinningFactor");
  objc_msgSend(v32, "maxSupportedFrameRate");
  if (a2)
    v37 = *(_DWORD *)(a2 + 36);
  else
    v37 = 0;
  v38 = FigCaptureBuildMotionAttachmentsNode(v19, v56, v34, v35, 0, v37, objc_msgSend(a9, "sensorIDDictionaryByPortType"), objc_msgSend(a9, "cameraInfoByPortType"), v36, objc_msgSend(a9, "activePortTypes"), v33 == 4, objc_msgSend((id)objc_msgSend(v31, "irisSinkConfiguration"), "optimizesImagesForOfflineVideoStabilization"), 0, 1, &v66);
  if (!v66)
  {
    v20 = v57;
    objc_msgSend(v57, "addObject:", v38);
LABEL_45:
    v39 = a6;
    if (!a6)
    {
LABEL_62:
      if (a2)
        v53 = *(_BYTE *)(a2 + 32) != 0;
      else
        v53 = 0;
      v54 = a11[1];
      v59[0] = *a11;
      v59[1] = v54;
      v66 = -[FigCaptureMetadataSinkPipeline _buildMetadataObjectRemoteQueueSinkPipeline:graph:metadataNodeOutputs:videoPreviewEnabled:deferredPrepareEnabled:delegate:clientAuditToken:](v19, a2, a3, v20, 0, v53, a13, v59);
      goto LABEL_65;
    }
    if (a2)
    {
      v40 = (void *)objc_msgSend(*(id *)(a2 + 8), "metadataIdentifiers");
      if (objc_msgSend(*(id *)(a2 + 48), "count") && *(_BYTE *)(a2 + 40))
      {
        v41 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v60 = 0u;
        v61 = 0u;
        v62 = 0u;
        v63 = 0u;
        v42 = *(void **)(a2 + 48);
        v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v60, v67, 16);
        if (v43)
        {
          v44 = v43;
          v45 = *(_QWORD *)v61;
          do
          {
            for (i = 0; i != v44; ++i)
            {
              if (*(_QWORD *)v61 != v45)
                objc_enumerationMutation(v42);
              objc_msgSend(v41, "addObject:", CMMetadataFormatDescriptionGetIdentifiers((CMMetadataFormatDescriptionRef)objc_msgSend(*(id *)(*((_QWORD *)&v60 + 1)+ 8 * i), "formatDescription")));
            }
            v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v60, v67, 16);
          }
          while (v44);
          v20 = v57;
          v39 = a6;
        }
      }
      else
      {
        v41 = 0;
      }
      *(_QWORD *)&v59[0] = 0;
      v47 = *(void **)(a2 + 8);
    }
    else
    {
      v40 = (void *)objc_msgSend(0, "metadataIdentifiers");
      objc_msgSend(0, "count");
      v41 = 0;
      v47 = 0;
      *(_QWORD *)&v59[0] = 0;
    }
    objc_msgSend(v47, "metadataRectOfInterest");
    v66 = FigCaptureBuildObjectDetectionPipeline(v19, v40, v41, v39, (BWFaceDetectionNode **)v59, v48, v49, v50, v51);
    if (!v66)
    {
      v52 = *(id *)&v59[0];
      v19[12] = v52;
      if (objc_msgSend(v52, "metadataObjectOutputEnabled"))
        objc_msgSend(v20, "addObject:", objc_msgSend(v19[12], "output"));
      goto LABEL_62;
    }
  }
LABEL_69:
  fig_log_get_emitter();
LABEL_72:
  FigDebugAssert3();
LABEL_65:
  result = v66;
  if (!v66)
  {
    if (v65)
      return objc_msgSend(v65, "code");
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigCaptureMetadataSinkPipeline;
  -[FigCaptureRemoteQueueSinkPipeline dealloc](&v3, sel_dealloc);
}

- (uint64_t)detectedObjectBoxedMetadataOutputs
{
  if (result)
    return objc_msgSend(*(id *)(result + 96), "boxedMetadataOutputs");
  return result;
}

- (uint64_t)mrcLowPowerModeEnabled
{
  if (result)
    return objc_msgSend(*(id *)(result + 64), "lowPowerModeEnabled");
  return result;
}

- (uint64_t)setRectOfInterest:(double)a3
{
  uint64_t v9;

  if (result)
  {
    v9 = result;
    objc_msgSend(*(id *)(result + 64), "setRectOfInterest:");
    return objc_msgSend(*(id *)(v9 + 96), "setRectOfInterest:", a2, a3, a4, a5);
  }
  return result;
}

- (id)_buildMetadataDetectorSinkPipeline:(void *)a3 graph:(void *)a4 mrcSourceOutput:(void *)a5 captureDevice:(_QWORD *)a6 mrcOutputsOut:(uint64_t)a7 inferenceScheduler:
{
  id *v9;
  void *v10;
  double v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  _BOOL8 v17;
  BWMetadataDetectorGatingNode *v18;
  BWMetadataDetectorGatingNode *v19;
  _BOOL8 v20;
  BWMetadataDetectorGatingNode *v21;
  uint64_t v22;
  void *v23;
  BWMRCNode *v24;
  void *v25;
  _BOOL8 v26;
  void *v27;
  BWAppClipCodeNode *v28;
  BWInferenceNode *v29;
  int v30;
  int v31;
  _BOOL8 v32;
  BWMetadataDetectedResultsObserver *v33;
  id v34;
  void *v35;
  BWPipelineStage *v39;
  objc_super v41;
  objc_super v42;
  objc_super v43;
  objc_super v44;
  id *v45;
  _QWORD v46[5];
  id v47;
  id v48;
  _QWORD v49[4];
  id from;
  id location[2];

  if (result)
  {
    v9 = result;
    v45 = 0;
    if (a2)
      v10 = *(void **)(a2 + 8);
    else
      v10 = 0;
    v39 = +[BWPipelineStage pipelineStageWithName:priority:discardsLateSampleData:](BWPipelineStage, "pipelineStageWithName:priority:discardsLateSampleData:", FigCaptureBuildPipelineStageName((uint64_t)CFSTR("com.apple.coremedia.capture.mrc"), (void *)objc_msgSend(v10, "sourceConfiguration")), 0, 1);
    objc_msgSend(a4, "setName:", CFSTR("MRC"));
    LODWORD(v11) = 30.0;
    objc_msgSend(a4, "setMaxSampleDataOutputRate:", v11);
    if (a2)
    {
      v12 = *(unsigned __int8 *)(a2 + 25);
      v13 = FigCaptureMetadataObjectConfigurationRequiresMRCNode(*(void **)(a2 + 8));
      v14 = FigCaptureMetadataObjectConfigurationRequiresAppClipCodeNode(*(void **)(a2 + 8));
      v15 = FigCaptureMetadataObjectConfigurationRequiresTextLocalization(*(void **)(a2 + 8));
      v16 = *(unsigned __int8 *)(a2 + 41);
      v17 = *(_BYTE *)(a2 + 41) != 0;
      v18 = [BWMetadataDetectorGatingNode alloc];
      if (v12)
      {
        v19 = -[BWMetadataDetectorGatingNode initWithSceneClassifierVersion:mrcEnabled:appClipCodeEnabled:textLocalizationEnabled:lowPowerModeEnabled:compressed8BitInputEnabled:](v18, "initWithSceneClassifierVersion:mrcEnabled:appClipCodeEnabled:textLocalizationEnabled:lowPowerModeEnabled:compressed8BitInputEnabled:", *(unsigned int *)(a2 + 26) | ((unint64_t)*(unsigned __int16 *)(a2 + 30) << 32), v13, v14, v15, *(unsigned __int8 *)(a2 + 24), v16 != 0);
LABEL_9:
        v21 = v19;
        v44.receiver = v9;
        v44.super_class = (Class)FigCaptureMetadataSinkPipeline;
        if ((objc_msgSendSuper2(&v44, sel_addNode_error_, v21, &v45) & 1) == 0
          || (objc_msgSend(a3, "connectOutput:toInput:pipelineStage:", a4, -[BWNode input](v21, "input"), v39) & 1) == 0)
        {
          fig_log_get_emitter();
          goto LABEL_51;
        }
        v9[7] = v21;
        v22 = objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](-[BWNode outputs](v21, "outputs"), "count"));
        v23 = (void *)v22;
        if ((_DWORD)v13)
        {
          v35 = (void *)v22;
          v24 = objc_alloc_init(BWMRCNode);
          if (a2)
          {
            v25 = *(void **)(a2 + 8);
            v26 = *(_BYTE *)(a2 + 24) != 0;
          }
          else
          {
            v25 = 0;
            v26 = 0;
          }
          -[BWMRCNode setMrcIdentifiers:](v24, "setMrcIdentifiers:", objc_msgSend(v25, "metadataIdentifiers"));
          objc_msgSend(v25, "metadataRectOfInterest");
          -[BWMRCNode setRectOfInterest:](v24, "setRectOfInterest:");
          -[BWMRCNode setLowPowerModeEnabled:](v24, "setLowPowerModeEnabled:", v26);
          -[BWMRCNode setDetectedResultsObserver:](v24, "setDetectedResultsObserver:", -[BWMetadataDetectorGatingNode mrcResultsObserver](v21, "mrcResultsObserver"));
          v43.receiver = v9;
          v43.super_class = (Class)FigCaptureMetadataSinkPipeline;
          if ((objc_msgSendSuper2(&v43, sel_addNode_error_, v24, &v45) & 1) == 0
            || (v9[8] = v24,
                (objc_msgSend(a3, "connectOutput:toInput:pipelineStage:", -[BWMetadataDetectorGatingNode mrcOutput](v21, "mrcOutput"), objc_msgSend(v9[8], "input"), +[BWPipelineStage pipelineStageWithName:priority:discardsLateSampleData:](BWPipelineStage, "pipelineStageWithName:priority:discardsLateSampleData:", CFSTR("com.apple.coremedia.capture.mrc.barcode"), 0, 0)) & 1) == 0))
          {
            fig_log_get_emitter();
            goto LABEL_51;
          }
          v23 = v35;
          objc_msgSend(v35, "addObject:", -[BWNode output](v24, "output"));
        }
        v27 = a5;
        if ((_DWORD)v14)
        {
          v28 = -[BWAppClipCodeNode initWithProcessingQueuePriority:]([BWAppClipCodeNode alloc], "initWithProcessingQueuePriority:", -[BWPipelineStage priority](v39, "priority"));
          -[BWAppClipCodeNode setDetectedResultsObserver:](v28, "setDetectedResultsObserver:", -[BWMetadataDetectorGatingNode appClipCodeResultsObserver](v21, "appClipCodeResultsObserver"));
          v42.receiver = v9;
          v42.super_class = (Class)FigCaptureMetadataSinkPipeline;
          if ((objc_msgSendSuper2(&v42, sel_addNode_error_, v28, &v45) & 1) == 0
            || (objc_msgSend(a3, "connectOutput:toInput:pipelineStage:", -[BWMetadataDetectorGatingNode appClipCodeOutput](v21, "appClipCodeOutput"), -[BWNode input](v28, "input"), +[BWPipelineStage pipelineStageWithName:priority:discardsLateSampleData:](BWPipelineStage, "pipelineStageWithName:priority:discardsLateSampleData:", CFSTR("com.apple.coremedia.capture.mrc.app-clip-code"), 0, 0)) & 1) == 0)
          {
            fig_log_get_emitter();
            goto LABEL_51;
          }
          objc_msgSend(v23, "addObject:", -[BWNode output](v28, "output"));
        }
        if (!(_DWORD)v15)
        {
LABEL_44:
          if (a6)
            *a6 = v23;
          objc_msgSend(v27, "registerForAEMatrixMetadata");
          goto LABEL_47;
        }
        v29 = -[BWInferenceNode initWithConvEngineSupportWithCaptureDevice:scheduler:priority:]([BWInferenceNode alloc], "initWithConvEngineSupportWithCaptureDevice:scheduler:priority:", a5, a7, 6);
        -[BWNode setName:](v29, "setName:", CFSTR("Text Localization"));
        if (a2)
        {
          v30 = *(_DWORD *)(a2 + 56);
          if (v30 >= 0)
            v31 = *(_DWORD *)(a2 + 56);
          else
            v31 = -v30;
          if (v31 == 90)
          {
            v32 = 1;
LABEL_41:
            v33 = -[BWMetadataDetectorGatingNode textLocalizationResultsObserver](v21, "textLocalizationResultsObserver");
            -[BWInferenceNode setPassthroughInputSampleBuffer:](v29, "setPassthroughInputSampleBuffer:", 0);
            objc_initWeak(location, v29);
            objc_initWeak(&from, v33);
            v49[0] = 0;
            v49[1] = v49;
            v49[2] = 0x2020000000;
            v49[3] = 0;
            v46[0] = MEMORY[0x1E0C809B0];
            v46[1] = 3221225472;
            v46[2] = __msp_configureTextLocalizationNode_block_invoke;
            v46[3] = &unk_1E4926A18;
            objc_copyWeak(&v47, &from);
            v46[4] = v49;
            objc_copyWeak(&v48, location);
            -[BWInferenceNode setPostprocessFilter:](v29, "setPostprocessFilter:", v46);
            v34 = +[BWTextLocalizationInferenceConfiguration configuration](BWTextLocalizationInferenceConfiguration, "configuration");
            objc_msgSend(v34, "setLogger:", objc_msgSend(objc_loadWeak(&from), "logger"));
            objc_msgSend(v34, "setInferenceInputUsesPortraitOrientation:", v32);
            -[BWInferenceNode addInferenceOfType:version:configuration:](v29, "addInferenceOfType:version:configuration:", 116, objc_msgSend(v34, "version") & 0xFFFFFFFFFFFFLL, v34);
            objc_destroyWeak(&v48);
            objc_destroyWeak(&v47);
            _Block_object_dispose(v49, 8);
            objc_destroyWeak(&from);
            objc_destroyWeak(location);
            v41.receiver = v9;
            v41.super_class = (Class)FigCaptureMetadataSinkPipeline;
            if ((objc_msgSendSuper2(&v41, sel_addNode_error_, v29, &v45) & 1) != 0
              && (objc_msgSend(a3, "connectOutput:toInput:pipelineStage:", -[BWMetadataDetectorGatingNode textLocalizationOutput](v21, "textLocalizationOutput"), -[BWNode input](v29, "input"), +[BWPipelineStage pipelineStageWithName:priority:discardsLateSampleData:](BWPipelineStage, "pipelineStageWithName:priority:discardsLateSampleData:", CFSTR("com.apple.coremedia.capture.mrc.text-localization"), 0, 0)) & 1) != 0)
            {
              objc_msgSend(v23, "addObject:", -[BWNode output](v29, "output"));
              v27 = a5;
              goto LABEL_44;
            }
            fig_log_get_emitter();
LABEL_51:
            FigDebugAssert3();
LABEL_47:
            result = v45;
            if (v45)
              return (id *)objc_msgSend(v45, "code");
            return result;
          }
        }
        else
        {
          v30 = 0;
        }
        if (v30 < 0)
          v30 = -v30;
        v32 = v30 == 270;
        goto LABEL_41;
      }
      v20 = *(_BYTE *)(a2 + 24) != 0;
    }
    else
    {
      v13 = FigCaptureMetadataObjectConfigurationRequiresMRCNode(0);
      v14 = FigCaptureMetadataObjectConfigurationRequiresAppClipCodeNode(0);
      v15 = FigCaptureMetadataObjectConfigurationRequiresTextLocalization(0);
      v18 = [BWMetadataDetectorGatingNode alloc];
      v17 = 0;
      v20 = 0;
    }
    v19 = -[BWMetadataDetectorGatingNode initWithMRCEnabled:appClipCodeEnabled:textLocalizationEnabled:lowPowerModeEnabled:compressed8BitInputEnabled:](v18, "initWithMRCEnabled:appClipCodeEnabled:textLocalizationEnabled:lowPowerModeEnabled:compressed8BitInputEnabled:", v13, v14, v15, v20, v17);
    goto LABEL_9;
  }
  return result;
}

- (uint64_t)sourceID
{
  if (result)
    return *(_QWORD *)(result + 104);
  return result;
}

- (uint64_t)sourceDeviceType
{
  if (result)
    return *(unsigned int *)(result + 112);
  return result;
}

- (uint64_t)setMrcSuspended:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 72) = a2;
  return result;
}

@end
