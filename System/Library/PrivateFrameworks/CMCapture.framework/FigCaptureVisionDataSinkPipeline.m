@implementation FigCaptureVisionDataSinkPipeline

+ (void)initialize
{
  objc_opt_class();
}

- (_QWORD)initWithVisionDataConnectionConfiguration:(uint64_t)a3 videoDataConnectionConfiguration:(void *)a4 graph:(uint64_t)a5 name:(uint64_t)a6 visionCaptureOutput:(void *)a7 captureDevice:(_OWORD *)a8 clientAuditToken:(uint64_t)a9 delegate:
{
  _QWORD *v14;
  void *v15;
  uint64_t v16;
  int *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  __int128 v27;
  uint64_t v28;
  _OWORD *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _OWORD v37[2];
  objc_super v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  objc_super v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v43.receiver = a1;
  v43.super_class = (Class)FigCaptureVisionDataSinkPipeline;
  v14 = objc_msgSendSuper2(&v43, sel_initWithGraph_name_sinkID_, a4, a5, objc_msgSend((id)objc_msgSend(a2, "sinkConfiguration"), "sinkID"));
  if (v14)
  {
    v30 = a8;
    v31 = a4;
    v32 = a6;
    v14[8] = (id)objc_msgSend((id)objc_msgSend(a2, "sourceConfiguration"), "sourceID");
    *((_DWORD *)v14 + 18) = objc_msgSend(a2, "underlyingDeviceType");
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v15 = (void *)objc_msgSend(a7, "captureStreams");
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    v17 = &OBJC_IVAR___BWQuickTimeMovieFileSinkNode__stereoVideoCaptureDuration;
    if (!v16)
      goto LABEL_21;
    v18 = v16;
    v19 = *(_QWORD *)v40;
    v20 = *MEMORY[0x1E0D05A50];
    v36 = *MEMORY[0x1E0D05A28];
    v35 = *MEMORY[0x1E0D05A30];
    v34 = *MEMORY[0x1E0D05A18];
    v33 = *MEMORY[0x1E0D05A38];
LABEL_5:
    v21 = 0;
    while (2)
    {
      if (*(_QWORD *)v40 != v19)
        objc_enumerationMutation(v15);
      v22 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v21);
      v23 = (void *)objc_msgSend(v22, "portType");
      v24 = v23;
      switch(*((_DWORD *)v14 + 18))
      {
        case 2:
          if ((objc_msgSend(v23, "isEqualToString:", v34) & 1) != 0)
            goto LABEL_20;
          v23 = v24;
          v25 = v33;
          goto LABEL_14;
        case 3:
          v25 = v35;
          goto LABEL_14;
        case 7:
          if ((objc_msgSend(v23, "isEqualToString:", v36) & 1) != 0)
            goto LABEL_20;
          v23 = v24;
          v25 = v20;
LABEL_14:
          if ((objc_msgSend(v23, "isEqualToString:", v25) & 1) != 0)
          {
LABEL_20:
            v26 = v22;
            v17 = &OBJC_IVAR___BWQuickTimeMovieFileSinkNode__stereoVideoCaptureDuration;
            v14[7] = v26;
            goto LABEL_21;
          }
LABEL_17:
          if (v18 != ++v21)
            continue;
          v18 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
          v17 = &OBJC_IVAR___BWQuickTimeMovieFileSinkNode__stereoVideoCaptureDuration;
          if (v18)
            goto LABEL_5;
LABEL_21:
          if (*(_QWORD *)((char *)v14 + v17[94]))
          {
            v38.receiver = v14;
            v38.super_class = (Class)FigCaptureVisionDataSinkPipeline;
            objc_msgSendSuper2(&v38, sel_setUpstreamOutput_, v32);
            v27 = v30[1];
            v37[0] = *v30;
            v37[1] = v27;
            if (!-[FigCaptureVisionDataSinkPipeline _buildVisionDataSinkPipeline:videoDataConnectionConfiguration:graph:visionCaptureOutput:clientAuditToken:delegate:](v14, a2, v28, v31, v32, v37, a9))return v14;
            fig_log_get_emitter();
          }
          else
          {
            fig_log_get_emitter();
          }
          FigDebugAssert3();

          break;
        case 0xB:
          if (!objc_msgSend(v23, "isEqualToString:", v20))
            goto LABEL_17;
          goto LABEL_20;
        default:
          goto LABEL_17;
      }
      return 0;
    }
  }
  return v14;
}

- (id)_buildVisionDataSinkPipeline:(uint64_t)a3 videoDataConnectionConfiguration:(void *)a4 graph:(uint64_t)a5 visionCaptureOutput:(_OWORD *)a6 clientAuditToken:(uint64_t)a7 delegate:
{
  void *v12;
  BWPipelineStage *v13;
  BWRemoteQueueSinkNode *v14;
  uint64_t v15;
  __int128 v16;
  BWRemoteQueueSinkNode *v17;
  objc_super v18;
  objc_super v19;
  _OWORD v20[2];
  id v21;

  if (result)
  {
    v12 = result;
    v21 = 0;
    v13 = +[BWPipelineStage pipelineStageWithName:priority:](BWPipelineStage, "pipelineStageWithName:priority:", FigCaptureBuildPipelineStageName((uint64_t)CFSTR("com.apple.coremedia.capture.visiondata"), (void *)objc_msgSend(a2, "sourceConfiguration")), 13);
    v14 = [BWRemoteQueueSinkNode alloc];
    v15 = objc_msgSend(v12, "sinkID");
    v16 = a6[1];
    v20[0] = *a6;
    v20[1] = v16;
    v17 = -[BWRemoteQueueSinkNode initWithMediaType:clientAuditToken:sinkID:](v14, "initWithMediaType:clientAuditToken:sinkID:", 1986618469, v20, v15);
    -[BWNode setName:](v17, "setName:", CFSTR("Vision Data Remote Queue Sink"));
    -[BWRemoteQueueSinkNode setDelegate:](v17, "setDelegate:", a7);
    -[BWRemoteQueueSinkNode setDiscardsLateSampleBuffers:](v17, "setDiscardsLateSampleBuffers:", 0);
    -[BWRemoteQueueSinkNode setClientVideoRetainedBufferCount:](v17, "setClientVideoRetainedBufferCount:", objc_msgSend(a2, "retainedBufferCount"));
    v19.receiver = v12;
    v19.super_class = (Class)FigCaptureVisionDataSinkPipeline;
    if ((objc_msgSendSuper2(&v19, sel_addNode_error_, v17, &v21) & 1) != 0
      && (objc_msgSend(a4, "connectOutput:toInput:pipelineStage:", a5, -[BWNode input](v17, "input"), v13) & 1) != 0)
    {
      v18.receiver = v12;
      v18.super_class = (Class)FigCaptureVisionDataSinkPipeline;
      objc_msgSendSuper2(&v18, sel_setSinkNode_, v17);
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    result = v21;
    if (v21)
      return (id)objc_msgSend(v21, "code");
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigCaptureVisionDataSinkPipeline;
  -[FigCaptureRemoteQueueSinkPipeline dealloc](&v3, sel_dealloc);
}

- (uint64_t)triggerVisionDataBurst
{
  if (result)
    return objc_msgSend(*(id *)(result + 56), "triggerVisionDataBurst");
  return result;
}

- (uint64_t)setRuntimeUpdates:(uint64_t)result
{
  if (result)
    return objc_msgSend(*(id *)(result + 56), "setRuntimeUpdates:", a2);
  return result;
}

- (uint64_t)setKeypointDetectionThreshold:(uint64_t)result
{
  if (result)
    return objc_msgSend(*(id *)(result + 56), "setVisionDataKeypointDetectionThreshold:");
  return result;
}

@end
