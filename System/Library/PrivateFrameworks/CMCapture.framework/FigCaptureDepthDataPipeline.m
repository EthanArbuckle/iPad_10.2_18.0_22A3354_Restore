@implementation FigCaptureDepthDataPipeline

- (uint64_t)_buildDepthConversionPipelineWithConfiguration:(uint64_t)a3 sourceOutput:(void *)a4 graph:(uint64_t *)a5 convertedDepthOutputsOut:
{
  _QWORD *v9;
  void *v10;
  BOOL v11;
  uint64_t v12;
  BWPipelineStage *v13;
  BOOL v14;
  int v15;
  uint64_t v16;
  BWPipelineStage *v17;
  char v18;
  _BOOL8 v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  _BOOL4 v25;
  BWDepthConverterNode *v26;
  BWDepthConverterNode *v27;
  BWFanOutNode *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  objc_super v32;
  objc_super v33;
  id v34;
  unsigned int v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  if (!result)
    return result;
  v9 = (_QWORD *)result;
  v35 = 0;
  v34 = 0;
  if (a2)
  {
    v10 = *(void **)(a2 + 8);
    v11 = *(_BYTE *)(a2 + 34) != 0;
  }
  else
  {
    v10 = 0;
    v11 = 0;
  }
  v12 = FigCaptureBuildPipelineStageName((uint64_t)CFSTR("com.apple.coremedia.capture.depthdata"), (void *)objc_msgSend(v10, "sourceConfiguration"));
  if (a2)
  {
    v13 = *(BWPipelineStage **)(a2 + 40);
    if (v13)
    {
      v14 = !v11;
      if (v10)
        v14 = 0;
      if (!v14)
      {
        v15 = v10 != 0 && v11;
        if (v15)
          v16 = 2;
        else
          v16 = 1;
        goto LABEL_20;
      }
LABEL_47:
      fig_log_get_emitter();
      goto LABEL_52;
    }
  }
  v17 = +[BWPipelineStage pipelineStageWithName:priority:](BWPipelineStage, "pipelineStageWithName:priority:", v12, 13);
  if (v10)
    v18 = 1;
  else
    v18 = v11;
  if ((v18 & 1) == 0)
    goto LABEL_47;
  v13 = v17;
  v15 = v10 != 0 && v11;
  if (v15)
    v16 = 2;
  else
    v16 = 1;
  if (!a2)
  {
    FigCaptureMetadataObjectConfigurationRequiresFaceTracking(0);
    v24 = 0;
    v22 = 0;
    v20 = 0;
    v19 = 0;
    v21 = 0;
    v23 = 0;
    v25 = 0;
    goto LABEL_27;
  }
LABEL_20:
  if (FigCaptureMetadataObjectConfigurationRequiresFaceTracking(*(void **)(a2 + 24)))
    v19 = *(_DWORD *)(a2 + 104) == 2;
  else
    v19 = 0;
  if (!*(_BYTE *)(a2 + 32))
  {
    v20 = *(void **)(a2 + 16);
    v21 = *(void **)(a2 + 24);
    v23 = *(_QWORD *)(a2 + 88);
    v22 = *(void **)(a2 + 96);
    v24 = *(unsigned int *)(a2 + 80);
    v25 = *(_BYTE *)(a2 + 33) != 0;
LABEL_27:
    v26 = FigCaptureCreateAndConfigureDepthConverterNode(v10, v20, v21, v22, v23, v24, v25, v19, &v35);
    if (v35)
    {
      fig_log_get_emitter();
      goto LABEL_54;
    }
    v27 = v26;
    if (v26)
    {
      v33.receiver = v9;
      v33.super_class = (Class)FigCaptureDepthDataPipeline;
      if ((objc_msgSendSuper2(&v33, sel_addNode_error_, v26, &v34) & 1) == 0
        || (objc_msgSend(a4, "connectOutput:toInput:pipelineStage:", a3, -[BWNode input](v27, "input"), v13) & 1) == 0)
      {
        fig_log_get_emitter();
        goto LABEL_54;
      }
      v9[7] = v27;
      a3 = -[BWNode output](v27, "output");
      if ((v15 & 1) != 0)
        goto LABEL_32;
      goto LABEL_38;
    }
    fig_log_get_emitter();
LABEL_52:
    FigDebugAssert3();
    v35 = -12780;
    goto LABEL_43;
  }
  if ((v15 & 1) != 0)
  {
LABEL_32:
    v28 = -[BWFanOutNode initWithFanOutCount:mediaType:]([BWFanOutNode alloc], "initWithFanOutCount:mediaType:", v16, 1986618469);
    -[BWNode setName:](v28, "setName:", CFSTR("Depth Splitter"));
    v32.receiver = v9;
    v32.super_class = (Class)FigCaptureDepthDataPipeline;
    if ((objc_msgSendSuper2(&v32, sel_addNode_error_, v28, &v34) & 1) != 0)
    {
      v29 = -[BWNode input](v28, "input");
      v30 = a2 ? *(_QWORD *)(a2 + 40) : 0;
      if ((objc_msgSend(a4, "connectOutput:toInput:pipelineStage:", a3, v29, v30) & 1) != 0)
      {
        v31 = -[BWNode outputs](v28, "outputs");
        if (!a5)
          goto LABEL_43;
        goto LABEL_42;
      }
    }
    fig_log_get_emitter();
LABEL_54:
    FigDebugAssert3();
    goto LABEL_43;
  }
LABEL_38:
  if (!a3)
  {
    v31 = 0;
    if (!a5)
      goto LABEL_43;
    goto LABEL_42;
  }
  v36[0] = a3;
  v31 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 1);
  if (a5)
LABEL_42:
    *a5 = v31;
LABEL_43:
  result = v35;
  if (!v35)
  {
    if (v34)
      return objc_msgSend(v34, "code");
  }
  return result;
}

- (FigCaptureDepthDataPipeline)initWithConfiguration:(id)a3 sourceOutput:(id)a4 graph:(id)a5 name:(id)a6 delegate:(id)a7
{
  void *v12;
  FigCaptureDepthDataPipeline *v13;
  void *v14;
  objc_super v16;

  if (a3)
    v12 = (void *)*((_QWORD *)a3 + 1);
  else
    v12 = 0;
  v16.receiver = self;
  v16.super_class = (Class)FigCaptureDepthDataPipeline;
  v13 = -[FigCaptureSinkPipeline initWithGraph:name:sinkID:](&v16, sel_initWithGraph_name_sinkID_, a5, a6, objc_msgSend((id)objc_msgSend(v12, "sinkConfiguration"), "sinkID"));
  if (!v13)
    goto LABEL_9;
  if (a3)
  {
    v14 = (void *)*((_QWORD *)a3 + 1);
    if (!v14)
    {
      v14 = (void *)*((_QWORD *)a3 + 2);
      if (!v14)
        v14 = (void *)*((_QWORD *)a3 + 3);
    }
  }
  else
  {
    v14 = 0;
  }
  v13->_sourceID = (NSString *)(id)objc_msgSend((id)objc_msgSend(v14, "sourceConfiguration"), "sourceID");
  v13->_sourceDeviceType = objc_msgSend(v14, "underlyingDeviceType");
  if (-[FigCaptureDepthDataPipeline _buildDepthPipelineWithConfiguration:sourceOutput:graph:delegate:](v13, (uint64_t)a3, (uint64_t)a4, a5, (uint64_t)a7))
  {
    fig_log_get_emitter();
    FigDebugAssert3();

    return 0;
  }
  else
  {
LABEL_9:
    objc_msgSend((id)objc_msgSend(a5, "memoryAnalyticsPayload"), "setGraphContainsDepthDataPipeline:", 1);
  }
  return v13;
}

- (id)_buildDepthPipelineWithConfiguration:(uint64_t)a3 sourceOutput:(void *)a4 graph:(uint64_t)a5 delegate:
{
  void *v10;
  uint64_t v11;
  __int128 v12;
  id v13;
  uint64_t v14;
  id v15;
  _OWORD v17[2];
  id v18;

  if (!a1)
    return 0;
  v18 = 0;
  if (!a2)
  {
    a1[9] = 0;
    -[FigCaptureDepthDataPipeline _buildDepthConversionPipelineWithConfiguration:sourceOutput:graph:convertedDepthOutputsOut:]((uint64_t)a1, 0, a3, a4, (uint64_t *)&v18);
    return 0;
  }
  a1[9] = *(id *)(a2 + 40);
  -[FigCaptureDepthDataPipeline _buildDepthConversionPipelineWithConfiguration:sourceOutput:graph:convertedDepthOutputsOut:]((uint64_t)a1, a2, a3, a4, (uint64_t *)&v18);
  v10 = *(void **)(a2 + 8);
  if (v10)
  {
    v11 = objc_msgSend(v18, "objectAtIndexedSubscript:", 0);
    v12 = *(_OWORD *)(a2 + 64);
    v17[0] = *(_OWORD *)(a2 + 48);
    v17[1] = v12;
    v13 = -[FigCaptureDepthDataPipeline _buildDepthDataSinkPipeline:sourceOutput:graph:clientAuditToken:delegate:insertCopier:](a1, v10, v11, a4, v17, a5, (unint64_t)objc_msgSend(v18, "count") > 1);
    if ((_DWORD)v13)
    {
      v15 = v13;
      fig_log_get_emitter();
      FigDebugAssert3();
      return v15;
    }
    v14 = 1;
  }
  else
  {
    v14 = 0;
  }
  if (!*(_BYTE *)(a2 + 34))
    return 0;
  v15 = 0;
  a1[8] = (id)objc_msgSend(v18, "objectAtIndexedSubscript:", v14);
  return v15;
}

- (id)_buildDepthDataSinkPipeline:(uint64_t)a3 sourceOutput:(void *)a4 graph:(_OWORD *)a5 clientAuditToken:(uint64_t)a6 delegate:(int)a7 insertCopier:
{
  void *v13;
  BWAttachedMediaSplitNode *v14;
  BWAttachedMediaSplitNode *v15;
  uint64_t v16;
  BWPixelTransferNode *v17;
  BWRemoteQueueSinkNode *v18;
  uint64_t v19;
  __int128 v20;
  BWRemoteQueueSinkNode *v21;
  objc_super v22;
  objc_super v23;
  _OWORD v24[2];
  objc_super v25;
  objc_super v26;
  objc_super v27;
  id v28;
  _QWORD v29[3];

  v29[1] = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v13 = result;
    v28 = 0;
    v27.receiver = result;
    v27.super_class = (Class)FigCaptureDepthDataPipeline;
    objc_msgSendSuper2(&v27, sel_setUpstreamOutput_);
    v14 = [BWAttachedMediaSplitNode alloc];
    v29[0] = CFSTR("Depth");
    v15 = -[BWAttachedMediaSplitNode initWithAttachedMediaKeys:](v14, "initWithAttachedMediaKeys:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1));
    -[BWNode setName:](v15, "setName:", CFSTR("Depth Splitter"));
    v26.receiver = v13;
    v26.super_class = (Class)FigCaptureDepthDataPipeline;
    if ((objc_msgSendSuper2(&v26, sel_addNode_error_, v15, &v28) & 1) != 0
      && (objc_msgSend(a4, "connectOutput:toInput:pipelineStage:", a3, -[BWNode input](v15, "input"), 0) & 1) != 0)
    {
      v16 = -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v15, "outputs"), "objectAtIndexedSubscript:", 0);
      if (a7)
      {
        v17 = -[BWPixelTransferNode initWithfractionalSourceRectEnabled:]([BWPixelTransferNode alloc], "initWithfractionalSourceRectEnabled:", 0);
        -[BWNode setName:](v17, "setName:", CFSTR("Depth Data Copier"));
        -[BWPixelTransferNode setOutputPixelFormat:](v17, "setOutputPixelFormat:", objc_msgSend(a2, "outputFormat"));
        v25.receiver = v13;
        v25.super_class = (Class)FigCaptureDepthDataPipeline;
        if ((objc_msgSendSuper2(&v25, sel_addNode_error_, v17, &v28) & 1) == 0
          || (objc_msgSend(a4, "connectOutput:toInput:pipelineStage:", v16, -[BWNode input](v17, "input"), 0) & 1) == 0)
        {
          fig_log_get_emitter();
          goto LABEL_18;
        }
        v16 = -[BWNode output](v17, "output");
      }
      v18 = [BWRemoteQueueSinkNode alloc];
      v19 = objc_msgSend(v13, "sinkID");
      v20 = a5[1];
      v24[0] = *a5;
      v24[1] = v20;
      v21 = -[BWRemoteQueueSinkNode initWithMediaType:clientAuditToken:sinkID:](v18, "initWithMediaType:clientAuditToken:sinkID:", 1986618469, v24, v19);
      -[BWNode setName:](v21, "setName:", CFSTR("Depth Data Remote Queue Sink"));
      -[BWRemoteQueueSinkNode setDelegate:](v21, "setDelegate:", a6);
      -[BWRemoteQueueSinkNode setDiscardsLateSampleBuffers:](v21, "setDiscardsLateSampleBuffers:", objc_msgSend((id)objc_msgSend(a2, "depthDataSinkConfiguration"), "discardsLateDepthData"));
      -[BWRemoteQueueSinkNode setClientVideoRetainedBufferCount:](v21, "setClientVideoRetainedBufferCount:", objc_msgSend(a2, "retainedBufferCount"));
      v23.receiver = v13;
      v23.super_class = (Class)FigCaptureDepthDataPipeline;
      if ((objc_msgSendSuper2(&v23, sel_addNode_error_, v21, &v28) & 1) != 0)
      {
        v22.receiver = v13;
        v22.super_class = (Class)FigCaptureDepthDataPipeline;
        objc_msgSendSuper2(&v22, sel_setSinkNode_, v21);
        if ((objc_msgSend(a4, "connectOutput:toInput:pipelineStage:", v16, -[BWNode input](v21, "input"), 0) & 1) != 0)
          goto LABEL_10;
        fig_log_get_emitter();
      }
      else
      {
        fig_log_get_emitter();
      }
    }
    else
    {
      fig_log_get_emitter();
    }
LABEL_18:
    FigDebugAssert3();
LABEL_10:
    result = v28;
    if (v28)
      return (id)objc_msgSend(v28, "code");
  }
  return result;
}

- (BWNodeOutput)videoAndConvertedDepthDataOutput
{
  return self->_videoAndConvertedDepthDataOutput;
}

- (NSString)sourceID
{
  return self->_sourceID;
}

- (int)sourceDeviceType
{
  return self->_sourceDeviceType;
}

- (BWPipelineStage)pipelineStage
{
  return self->_pipelineStage;
}

+ (void)initialize
{
  objc_opt_class();
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigCaptureDepthDataPipeline;
  -[FigCaptureRemoteQueueSinkPipeline dealloc](&v3, sel_dealloc);
}

@end
