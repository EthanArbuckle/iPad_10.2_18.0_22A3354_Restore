@implementation FigCapturePointCloudDataSinkPipeline

+ (void)initialize
{
  objc_opt_class();
}

- (_QWORD)initWithConfiguration:(uint64_t)a3 sourceOutput:(void *)a4 graph:(uint64_t)a5 name:(_OWORD *)a6 clientAuditToken:(uint64_t)a7 delegate:
{
  _QWORD *v12;
  __int128 v13;
  _OWORD v15[2];
  objc_super v16;

  if (!a1)
    return 0;
  v16.receiver = a1;
  v16.super_class = (Class)FigCapturePointCloudDataSinkPipeline;
  v12 = objc_msgSendSuper2(&v16, sel_initWithGraph_name_sinkID_, a4, a5, objc_msgSend((id)objc_msgSend(a2, "sinkConfiguration"), "sinkID"));
  if (v12)
  {
    v12[7] = (id)objc_msgSend((id)objc_msgSend(a2, "sourceConfiguration"), "sourceID");
    v13 = a6[1];
    v15[0] = *a6;
    v15[1] = v13;
    if (-[FigCapturePointCloudDataSinkPipeline _buildPointCloudDataSinkPipelineWithConfiguration:sourceOutput:graph:clientAuditToken:delegate:](v12, a2, a3, a4, v15, a7))
    {
      fig_log_get_emitter();
      FigDebugAssert3();

      return 0;
    }
  }
  return v12;
}

- (id)_buildPointCloudDataSinkPipelineWithConfiguration:(uint64_t)a3 sourceOutput:(void *)a4 graph:(_OWORD *)a5 clientAuditToken:(uint64_t)a6 delegate:
{
  void *v11;
  BWRemoteQueueSinkNode *v12;
  uint64_t v13;
  __int128 v14;
  BWRemoteQueueSinkNode *v15;
  objc_super v16;
  objc_super v17;
  _OWORD v18[2];
  objc_super v19;
  id v20;

  if (result)
  {
    v11 = result;
    v20 = 0;
    v19.receiver = result;
    v19.super_class = (Class)FigCapturePointCloudDataSinkPipeline;
    objc_msgSendSuper2(&v19, sel_setUpstreamOutput_);
    v12 = [BWRemoteQueueSinkNode alloc];
    v13 = objc_msgSend(v11, "sinkID");
    v14 = a5[1];
    v18[0] = *a5;
    v18[1] = v14;
    v15 = -[BWRemoteQueueSinkNode initWithMediaType:clientAuditToken:sinkID:](v12, "initWithMediaType:clientAuditToken:sinkID:", 1885564004, v18, v13);
    -[BWNode setName:](v15, "setName:", CFSTR("Point Cloud Data Remote Queue Sink"));
    -[BWRemoteQueueSinkNode setDelegate:](v15, "setDelegate:", a6);
    -[BWRemoteQueueSinkNode setDiscardsLateSampleBuffers:](v15, "setDiscardsLateSampleBuffers:", objc_msgSend((id)objc_msgSend(a2, "pointCloudDataSinkConfiguration"), "discardsLatePointCloudData"));
    -[BWRemoteQueueSinkNode setClientVideoRetainedBufferCount:](v15, "setClientVideoRetainedBufferCount:", objc_msgSend(a2, "retainedBufferCount"));
    v17.receiver = v11;
    v17.super_class = (Class)FigCapturePointCloudDataSinkPipeline;
    if ((objc_msgSendSuper2(&v17, sel_addNode_error_, v15, &v20) & 1) != 0)
    {
      v16.receiver = v11;
      v16.super_class = (Class)FigCapturePointCloudDataSinkPipeline;
      objc_msgSendSuper2(&v16, sel_setSinkNode_, v15);
      if ((objc_msgSend(a4, "connectOutput:toInput:pipelineStage:", a3, -[BWNode input](v15, "input"), 0) & 1) != 0)
        goto LABEL_4;
      fig_log_get_emitter();
    }
    else
    {
      fig_log_get_emitter();
    }
    FigDebugAssert3();
LABEL_4:
    result = v20;
    if (v20)
      return (id)objc_msgSend(v20, "code");
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigCapturePointCloudDataSinkPipeline;
  -[FigCaptureRemoteQueueSinkPipeline dealloc](&v3, sel_dealloc);
}

@end
