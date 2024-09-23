@implementation FigCaptureMovieFileSinkPipeline

- (uint64_t)videoSourceID
{
  if (result)
    return objc_msgSend(*(id *)(result + 56), "videoSourceID");
  return result;
}

- (uint64_t)videoSourceDeviceType
{
  if (result)
    return objc_msgSend(*(id *)(result + 56), "videoSourceDeviceType");
  return result;
}

- (uint64_t)irisStagingNode
{
  if (result)
    return objc_msgSend(*(id *)(result + 56), "irisStagingNode");
  return result;
}

- (uint64_t)setUpBackPressureForResolvedRetainedBufferCounts
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
    v2 = *(void **)(result + 72);
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
          -[FigCaptureMovieFileSinkTailPipeline setUpBackPressureSemaphoresWithIrisIntermediateJPEGPhotoDecompressorNode:videoDefringingNode:](*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5++), (void *)objc_msgSend(*(id *)(v1 + 56), "irisIntermediateJPEGPhotoDecompressorNode"), (void *)objc_msgSend(*(id *)(v1 + 56), "videoDefringingNode"));
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

- (uint64_t)setSemanticStyleSceneObserver:(uint64_t)result
{
  if (result)
    return objc_msgSend(*(id *)(result + 56), "setSemanticStyleSceneObserver:", a2);
  return result;
}

- (uint64_t)setMRCSceneObserver:(uint64_t)result
{
  if (result)
    return objc_msgSend(*(id *)(result + 56), "setMRCSceneObserver:", a2);
  return result;
}

- (uint64_t)videoOrientationMetadataNode
{
  if (result)
    return objc_msgSend(*(id *)(result + 56), "videoOrientationMetadataNode");
  return result;
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

- (id)initWithConfiguration:(uint64_t)a3 videoSourceCaptureOutput:(uint64_t)a4 audioSourceCaptureOutput:(uint64_t)a5 audioSourceCinematicAudioCaptureOutput:(void *)a6 detectedObjectBoxedMetadataOutputs:(uint64_t)a7 objectDetectionSourceOutput:(uint64_t)a8 metadataSourcePipelineOutputs:(uint64_t)a9 graph:(uint64_t)a10 name:(uint64_t)a11 inferenceScheduler:(void *)a12 captureDevice:(uint64_t)a13 audioSourceDelegate:(uint64_t)a14 fileCoordinatorStatusDelegate:(uint64_t)a15 recordingStatusDelegate:(uint64_t)a16 irisRequestDelegate:(uint64_t)a17 masterClock:(unsigned __int8)a18 delayedCompressorCleanupEnabled:
{
  id v18;
  void **v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  BWPipelineStage *v30;
  BWPipelineStage *v31;
  FigCaptureMovieFileSinkHeadPipelineConfiguration *v32;
  FigCaptureMovieFileSinkHeadPipeline *v33;
  BOOL v34;
  uint64_t v35;
  void *v36;
  BOOL v37;
  FigCaptureMovieFileSinkMiddlePipelineConfiguration *v38;
  uint64_t v39;
  BWPipelineStage *v40;
  FigCaptureMovieFileSinkTailPipelineConfiguration *v41;
  _BOOL8 v42;
  FigCaptureMovieFileSinkTailPipeline *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  BWIrisStillImageMovieMetadataCache *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t i;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t j;
  void *v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t k;
  void *v64;
  void *v65;
  uint64_t v67;
  uint64_t v68;
  int v69;
  uint64_t v70;
  void *v71;
  uint64_t v73;
  id obj;
  uint64_t v75;
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
  objc_super v88;
  _BYTE v89[128];
  _BYTE v90[128];
  _BYTE v91[128];
  uint64_t v92;

  v18 = a1;
  v92 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (a2)
    {
      v25 = (void **)(a2 + 16);
      if (!objc_msgSend(*(id *)(a2 + 16), "sinkConfiguration"))
      {
        v25 = (void **)(a2 + 24);
        if (!objc_msgSend(*(id *)(a2 + 24), "sinkConfiguration"))
          goto LABEL_95;
      }
      v26 = *v25;
    }
    else
    {
      v67 = objc_msgSend(0, "sinkConfiguration");
      v26 = 0;
      if (!v67)
      {
        v68 = objc_msgSend(0, "sinkConfiguration");
        v26 = 0;
        if (!v68)
          goto LABEL_95;
      }
    }
    if (objc_msgSend((id)objc_msgSend(v26, "sinkConfiguration"), "sinkID"))
    {
      v27 = objc_msgSend(a6, "count");
      if (!a7 || !v27)
      {
        v88.receiver = v18;
        v88.super_class = (Class)FigCaptureMovieFileSinkPipeline;
        v18 = objc_msgSendSuper2(&v88, sel_initWithGraph_name_sinkID_);
        if (!v18)
        {
LABEL_87:
          objc_msgSend((id)objc_msgSend((id)objc_msgSend(v18, "graph"), "memoryAnalyticsPayload"), "setGraphContainsMovieFilePipeline:", 1);
          return v18;
        }
        v28 = a2 ? *(void **)(a2 + 48) : 0;
        v73 = a2;
        v71 = a6;
        if ((objc_msgSend(v28, "enabled") & 1) != 0)
        {
          v29 = BWCreateWorkgroupWithName();
          *((_QWORD *)v18 + 16) = v29;
        }
        else
        {
          v29 = *((_QWORD *)v18 + 16);
        }
        v30 = +[BWPipelineStage pipelineStageWithName:priority:workgroup:](BWPipelineStage, "pipelineStageWithName:priority:workgroup:", CFSTR("com.apple.coremedia.capture.moviefile"), 14, v29);
        v31 = +[BWPipelineStage pipelineStageWithName:priority:workgroup:](BWPipelineStage, "pipelineStageWithName:priority:workgroup:", CFSTR("com.apple.coremedia.capture.moviefile.transfer"), 14, *((_QWORD *)v18 + 16));
        v32 = objc_alloc_init(FigCaptureMovieFileSinkHeadPipelineConfiguration);
        -[FigCaptureMovieFileSinkHeadPipelineConfiguration setMovieFileSinkPipelineConfiguration:](v32, "setMovieFileSinkPipelineConfiguration:", v73);
        -[FigCaptureMovieFileSinkHeadPipelineConfiguration setMovieFilePipelineStage:](v32, "setMovieFilePipelineStage:", v30);
        -[FigCaptureMovieFileSinkHeadPipelineConfiguration setTransferPipelineStage:](v32, "setTransferPipelineStage:", v31);
        v33 = [FigCaptureMovieFileSinkHeadPipeline alloc];
        v34 = v73 && *(_BYTE *)(v73 + 149) != 0;
        LOBYTE(v70) = v34;
        *((_QWORD *)v18 + 7) = -[FigCaptureMovieFileSinkHeadPipeline initWithConfiguration:videoSourceCaptureOutput:audioSourceCaptureOutput:audioSourceCinematicAudioCaptureOutput:detectedObjectBoxedMetadataOutputs:objectDetectionSourceOutput:metadataSourcePipelineOutputs:graph:parentPipeline:inferenceScheduler:captureDevice:audioSourceDelegate:fileCoordinatorStatusDelegate:irisRequestDelegate:masterClock:workgroup:videoGreenGhostMitigationEnabled:](v33, "initWithConfiguration:videoSourceCaptureOutput:audioSourceCaptureOutput:audioSourceCinematicAudioCaptureOutput:detectedObjectBoxedMetadataOutputs:objectDetectionSourceOutput:metadataSourcePipelineOutputs:graph:parentPipeline:inferenceScheduler:captureDevice:audioSourceDelegate:fileCoordinatorStatusDelegate:irisRequestDelegate:masterClock:workgroup:videoGreenGhostMitigationEnabled:", v32, a3, a4, a5, v71, a7, a8, a9, v18, a11, a12, a13, a14,
                                 a16,
                                 a17,
                                 *((_QWORD *)v18 + 16),
                                 v70);

        if (*((_QWORD *)v18 + 7))
        {
          *((_BYTE *)v18 + 114) = 0;
          if (v73)
          {
            v35 = 1;
            if (*(_BYTE *)(v73 + 138))
            {
              *((_BYTE *)v18 + 114) = 1;
              v35 = 2;
            }
            v36 = *(void **)(v73 + 16);
          }
          else
          {
            v36 = 0;
            v35 = 1;
          }
          *((_BYTE *)v18 + 115) = objc_msgSend(v36, "stereoVideoCaptureEnabled");
          if (v73)
          {
            *((_DWORD *)v18 + 29) = *(_DWORD *)(v73 + 160);
            v37 = *(_BYTE *)(v73 + 188) != 0;
          }
          else
          {
            v37 = 0;
            *((_DWORD *)v18 + 29) = 0;
          }
          *((_BYTE *)v18 + 120) = v37;
          v38 = objc_alloc_init(FigCaptureMovieFileSinkMiddlePipelineConfiguration);
          -[FigCaptureMovieFileSinkMiddlePipelineConfiguration setMovieFileSinkPipelineConfiguration:](v38, "setMovieFileSinkPipelineConfiguration:", v73);
          -[FigCaptureMovieFileSinkMiddlePipelineConfiguration setMovieFilePipelineStage:](v38, "setMovieFilePipelineStage:", v30);
          *((_QWORD *)v18 + 8) = -[FigCaptureMovieFileSinkMiddlePipeline initWithConfiguration:graph:parentPipeline:headPipeline:captureDevice:workgroup:]([FigCaptureMovieFileSinkMiddlePipeline alloc], "initWithConfiguration:graph:parentPipeline:headPipeline:captureDevice:workgroup:", v38, a9, v18, *((_QWORD *)v18 + 7), a12, *((_QWORD *)v18 + 16));

          if (*((_QWORD *)v18 + 8))
          {
            *((_QWORD *)v18 + 9) = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v35);
            *((_QWORD *)v18 + 10) = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v35);
            *((_QWORD *)v18 + 11) = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v35);
            v39 = 0;
            *((_QWORD *)v18 + 12) = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v35);
            do
            {
              v40 = v30;
              if (v39)
                v40 = +[BWPipelineStage pipelineStageWithName:priority:workgroup:](BWPipelineStage, "pipelineStageWithName:priority:workgroup:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.tail.%d"), -[BWPipelineStage name](v30, "name"), 1), 14, *((_QWORD *)v18 + 16));
              v41 = objc_alloc_init(FigCaptureMovieFileSinkTailPipelineConfiguration);
              -[FigCaptureMovieFileSinkTailPipelineConfiguration setMovieFileSinkPipelineConfiguration:](v41, "setMovieFileSinkPipelineConfiguration:", v73);
              -[FigCaptureMovieFileSinkTailPipelineConfiguration setMovieFilePipelineStage:](v41, "setMovieFilePipelineStage:", v40);
              -[FigCaptureMovieFileSinkTailPipelineConfiguration setIrisIntermediateJPEGPhotoDecompressorNode:](v41, "setIrisIntermediateJPEGPhotoDecompressorNode:", objc_msgSend(*((id *)v18 + 7), "irisIntermediateJPEGPhotoDecompressorNode"));
              -[FigCaptureMovieFileSinkTailPipelineConfiguration setVideoSourceOutput:](v41, "setVideoSourceOutput:", objc_msgSend(*((id *)v18 + 8), "videoOutputForTailIndex:", v39));
              -[FigCaptureMovieFileSinkTailPipelineConfiguration setAudioSourceOutput:](v41, "setAudioSourceOutput:", objc_msgSend(*((id *)v18 + 8), "audioOutputForTailIndex:", v39));
              -[FigCaptureMovieFileSinkTailPipelineConfiguration setCinematicAudioSourceOutput:](v41, "setCinematicAudioSourceOutput:", objc_msgSend(*((id *)v18 + 7), "cinematicAudioOutput"));
              -[FigCaptureMovieFileSinkTailPipelineConfiguration setMetadataSourceOutputs:](v41, "setMetadataSourceOutputs:", objc_msgSend(*((id *)v18 + 8), "metadataOutputsForTailIndex:", v39));
              -[FigCaptureMovieFileSinkTailPipelineConfiguration setIndexesOfDetectedObjectsInMetadataOutputs:](v41, "setIndexesOfDetectedObjectsInMetadataOutputs:", objc_msgSend(*((id *)v18 + 7), "indexesOfDetectedObjectsInMetadataOutputs"));
              -[FigCaptureMovieFileSinkTailPipelineConfiguration setIndexOfVideoOrientationInMetadataOutputs:](v41, "setIndexOfVideoOrientationInMetadataOutputs:", objc_msgSend(*((id *)v18 + 7), "indexOfVideoOrientationInMetadataOutputs"));
              v42 = 0;
              if (v73 && !v39)
                v42 = *(_BYTE *)(v73 + 136) != 0;
              -[FigCaptureMovieFileSinkTailPipelineConfiguration setVitalityScoringEnabled:](v41, "setVitalityScoringEnabled:", v42);
              -[FigCaptureMovieFileSinkTailPipelineConfiguration setDelayedCompressorCleanupEnabled:](v41, "setDelayedCompressorCleanupEnabled:", a18);
              v43 = -[FigCaptureMovieFileSinkTailPipeline initWithConfiguration:tailIndex:numTailPipelines:graph:parentPipeline:captureDevice:inferenceScheduler:recordingStatusDelegate:workgroup:]([FigCaptureMovieFileSinkTailPipeline alloc], "initWithConfiguration:tailIndex:numTailPipelines:graph:parentPipeline:captureDevice:inferenceScheduler:recordingStatusDelegate:workgroup:", v41, v39, v35, a9, v18, a12, a11, a15, *((_QWORD *)v18 + 16));

              if (!v43)
                goto LABEL_95;
              objc_msgSend(*((id *)v18 + 9), "addObject:", v43);
              objc_msgSend(*((id *)v18 + 10), "addObject:", -[FigCaptureMovieFileSinkTailPipeline movieFileSinkNode](v43, "movieFileSinkNode"));
              if (-[FigCaptureMovieFileSinkTailPipeline videoCompressorNode](v43, "videoCompressorNode"))
                objc_msgSend(*((id *)v18 + 11), "addObject:", -[FigCaptureMovieFileSinkTailPipeline videoCompressorNode](v43, "videoCompressorNode"));
              if (-[FigCaptureMovieFileSinkTailPipeline sdofCompressorNode](v43, "sdofCompressorNode"))
                objc_msgSend(*((id *)v18 + 12), "addObject:", -[FigCaptureMovieFileSinkTailPipeline sdofCompressorNode](v43, "sdofCompressorNode"));
              ++v39;
            }
            while (v35 != v39);
            if (v73)
            {
              if (objc_msgSend(*(id *)(v73 + 16), "irisVISEnabled"))
              {
                if (*(_BYTE *)(v73 + 138) && (FigCaptureMetadataUtilitiesShouldIncludeDiagnosticMetadata() & 1) == 0
                  || objc_msgSend(*(id *)(v73 + 16), "irisVISMethod") == 3)
                {
                  goto LABEL_44;
                }
                v44 = *(void **)(v73 + 16);
                goto LABEL_43;
              }
            }
            else if ((objc_msgSend(0, "irisVISEnabled") & 1) != 0)
            {
              v69 = objc_msgSend(0, "irisVISMethod");
              v44 = 0;
              if (v69 == 3)
                goto LABEL_44;
LABEL_43:
              if (objc_msgSend(v44, "irisVISMethod") == 5)
              {
LABEL_44:
                v45 = 0;
                do
                {
                  if (!objc_msgSend((id)objc_msgSend(*((id *)v18 + 9), "objectAtIndexedSubscript:", v45), "movieFileSinkNode"))continue;
                  if (v45 == 1)
                  {
                    if (!-[FigCaptureVISPipeline visNode](objc_msgSend(*((id *)v18 + 8), "overCaptureVISPipeline")))
                      goto LABEL_53;
                    v46 = objc_msgSend(*((id *)v18 + 8), "overCaptureVISPipeline");
                  }
                  else
                  {
                    if (v45 || !-[FigCaptureVISPipeline visNode](objc_msgSend(*((id *)v18 + 8), "visPipeline")))
                      goto LABEL_53;
                    v46 = objc_msgSend(*((id *)v18 + 8), "visPipeline");
                  }
                  v47 = (void *)-[FigCaptureVISPipeline visNode](v46);
                  if (v47)
                    goto LABEL_54;
LABEL_53:
                  v47 = (void *)-[FigCaptureVISPipeline visNode](objc_msgSend((id)objc_msgSend(*((id *)v18 + 9), "objectAtIndexedSubscript:", v45), "visPipeline"));
                  if (v47)
                  {
LABEL_54:
                    v48 = objc_alloc_init(BWIrisStillImageMovieMetadataCache);
                    objc_msgSend(v47, "setIrisStillImageMovieMetadataCache:", v48);
                    objc_msgSend((id)objc_msgSend((id)objc_msgSend(*((id *)v18 + 9), "objectAtIndexedSubscript:", v45), "movieFileSinkNode"), "setIrisStillImageMovieMetadataCache:", v48);
                  }
                }
                while (v35 != ++v45);
              }
            }
            v86 = 0u;
            v87 = 0u;
            v84 = 0u;
            v85 = 0u;
            obj = (id)objc_msgSend(v18, "nodes");
            v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v91, 16);
            if (v49)
            {
              v50 = v49;
              v75 = *(_QWORD *)v85;
              do
              {
                for (i = 0; i != v50; ++i)
                {
                  if (*(_QWORD *)v85 != v75)
                    objc_enumerationMutation(obj);
                  v52 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * i);
                  objc_msgSend(v52, "setDeferredPreparePriority:", 3);
                  v82 = 0u;
                  v83 = 0u;
                  v80 = 0u;
                  v81 = 0u;
                  v53 = (void *)objc_msgSend(v52, "inputs");
                  v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v80, v90, 16);
                  if (v54)
                  {
                    v55 = v54;
                    v56 = *(_QWORD *)v81;
                    do
                    {
                      for (j = 0; j != v55; ++j)
                      {
                        if (*(_QWORD *)v81 != v56)
                          objc_enumerationMutation(v53);
                        v58 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * j);
                        if ((objc_msgSend((id)objc_msgSend(*((id *)v18 + 7), "inferenceConnections"), "containsObject:", objc_msgSend(v58, "connection")) & 1) == 0)objc_msgSend((id)objc_msgSend(v58, "connection"), "setWantsMessageCachingWhileSuspended:", 1);
                      }
                      v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v80, v90, 16);
                    }
                    while (v55);
                  }
                }
                v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v91, 16);
              }
              while (v50);
            }
            v78 = 0u;
            v79 = 0u;
            v76 = 0u;
            v77 = 0u;
            v59 = (void *)objc_msgSend(*((id *)v18 + 7), "inferenceConnections");
            v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v76, v89, 16);
            if (v60)
            {
              v61 = v60;
              v62 = *(_QWORD *)v77;
              do
              {
                for (k = 0; k != v61; ++k)
                {
                  if (*(_QWORD *)v77 != v62)
                    objc_enumerationMutation(v59);
                  objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v76 + 1) + 8 * k), "input"), "node"), "setDeferredPreparePriority:", 0);
                }
                v61 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v76, v89, 16);
              }
              while (v61);
            }
            v64 = (void *)v73;
            if (!objc_msgSend(*((id *)v18 + 11), "count"))
            {

              *((_QWORD *)v18 + 11) = 0;
            }
            if (!objc_msgSend(*((id *)v18 + 12), "count"))
            {

              *((_QWORD *)v18 + 12) = 0;
            }
            *((_QWORD *)v18 + 6) = a12;
            if (v73)
              v64 = *(void **)(v73 + 16);
            *((_QWORD *)v18 + 13) = v64;
            v65 = (void *)objc_msgSend(v64, "irisSinkConfiguration");
            if (objc_msgSend(v65, "irisMovieCaptureEnabled"))
              *((_BYTE *)v18 + 112) = objc_msgSend(v65, "momentCaptureMovieRecordingEnabled");
            goto LABEL_87;
          }
        }
      }
    }
LABEL_95:
    FigDebugAssert3();

    return 0;
  }
  return v18;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigCaptureMovieFileSinkPipeline;
  -[FigCaptureSinkPipeline dealloc](&v3, sel_dealloc);
}

- (id)middlePipeline
{
  return self->_middlePipeline;
}

- (uint64_t)videoConnectionID
{
  if (result)
    return objc_msgSend(*(id *)(result + 56), "videoConnectionID");
  return result;
}

- (uint64_t)fileCoordinatorNode
{
  if (result)
    return objc_msgSend(*(id *)(result + 56), "fileCoordinatorNode");
  return result;
}

- (uint64_t)movieFileVideoCaptureConnectionConfiguration
{
  if (result)
    return *(_QWORD *)(result + 104);
  return result;
}

- (double)irisVISCleanOutputRectForCLAP
{
  double result;

  if (!a1)
    return 0.0;
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 72), "objectAtIndexedSubscript:", 0), "irisVISCleanOutputRectForCLAP");
  return result;
}

- (uint64_t)setSceneClassifierSuspended:(uint64_t)result
{
  if (result)
    return objc_msgSend(*(id *)(result + 56), "setSceneClassifierSuspended:", a2);
  return result;
}

- (unint64_t)setRecording:(unint64_t)a3 forTailPipelineIndex:
{
  unint64_t v5;

  if (result)
  {
    v5 = result;
    result = objc_msgSend(*(id *)(result + 72), "count");
    if (result < a3)
      -[FigCaptureMovieFileSinkPipeline setRecording:forTailPipelineIndex:].cold.1();
    if (a3 != 1 || *(_BYTE *)(v5 + 113))
      return objc_msgSend((id)objc_msgSend(*(id *)(v5 + 72), "objectAtIndexedSubscript:", a3), "setRecording:", a2);
  }
  return result;
}

- (unint64_t)setRecordingForAllTailPipelines:(unint64_t)result
{
  unint64_t v3;
  unint64_t i;
  BOOL v5;

  if (result)
  {
    v3 = result;
    result = objc_msgSend(*(id *)(result + 72), "count");
    if (result)
    {
      for (i = 0; i < result; ++i)
      {
        if (*(_BYTE *)(v3 + 113))
          v5 = 0;
        else
          v5 = i == 1;
        if (!v5)
          objc_msgSend((id)objc_msgSend(*(id *)(v3 + 72), "objectAtIndexedSubscript:", i), "setRecording:", a2);
        result = objc_msgSend(*(id *)(v3 + 72), "count");
      }
    }
  }
  return result;
}

- (uint64_t)atLeastOneTailIsRecording
{
  uint64_t v1;
  uint64_t v2;
  BOOL v3;

  if (result)
  {
    v1 = result;
    result = objc_msgSend(*(id *)(result + 72), "count");
    if (result)
    {
      v2 = 0;
      while (1)
      {
        v3 = !*(_BYTE *)(v1 + 113) && v2 == 1;
        if (!v3
          && (objc_msgSend((id)objc_msgSend(*(id *)(v1 + 72), "objectAtIndexedSubscript:", v2), "recording") & 1) != 0)
        {
          break;
        }
        if (++v2 >= (unint64_t)objc_msgSend(*(id *)(v1 + 72), "count"))
          return 0;
      }
      return 1;
    }
  }
  return result;
}

- (unint64_t)setOverCaptureTailPipelineRenderingEnabled:(unint64_t)result
{
  unint64_t v3;

  if (result)
  {
    v3 = result;
    result = objc_msgSend(*(id *)(result + 72), "count");
    if (result >= 2)
      *(_BYTE *)(v3 + 113) = a2;
  }
  return result;
}

- (uint64_t)movieFileSinkNodes
{
  if (result)
    return *(_QWORD *)(result + 80);
  return result;
}

- (uint64_t)videoCompressorNodes
{
  if (result)
    return *(_QWORD *)(result + 88);
  return result;
}

- (uint64_t)sdofCompressorNodes
{
  if (result)
    return *(_QWORD *)(result + 96);
  return result;
}

- (BOOL)overCaptureEnabled
{
  if (result)
    return *(_BYTE *)(result + 114) != 0;
  return result;
}

- (uint64_t)videoStabilizationStrength
{
  if (result)
    return *(unsigned int *)(result + 116);
  return result;
}

- (BOOL)smartStyleReversibilityEnabled
{
  if (result)
    return *(_BYTE *)(result + 120) != 0;
  return result;
}

- (uint64_t)captureDevice
{
  if (result)
    return *(_QWORD *)(result + 48);
  return result;
}

- (void)setRecording:forTailPipelineIndex:.cold.1()
{
  __assert_rtn("-[FigCaptureMovieFileSinkPipeline setRecording:forTailPipelineIndex:]", "FigCaptureMovieFileSinkPipeline.m", 4364, "tailIndex <= _tailPipelines.count");
}

@end
