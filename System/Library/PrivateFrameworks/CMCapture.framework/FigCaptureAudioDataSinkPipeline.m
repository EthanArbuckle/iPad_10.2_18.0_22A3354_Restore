@implementation FigCaptureAudioDataSinkPipeline

+ (void)initialize
{
  objc_opt_class();
}

- (void)initWithConfiguration:(void *)a3 graph:(uint64_t)a4 name:(uint64_t)a5 sourceAudioOutput:(_OWORD *)a6 clientAuditToken:(uint64_t)a7 renderDelegate:
{
  id v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  _OWORD v16[2];
  objc_super v17;

  if (!a1)
    return 0;
  v17.receiver = a1;
  v17.super_class = (Class)FigCaptureAudioDataSinkPipeline;
  v11 = objc_msgSendSuper2(&v17, sel_initWithGraph_name_sinkID_, a3, a4, objc_msgSend((id)objc_msgSend(a2, "sinkConfiguration"), "sinkID"));
  v13 = v11;
  if (v11)
  {
    v14 = a6[1];
    v16[0] = *a6;
    v16[1] = v14;
    if (-[FigCaptureAudioDataSinkPipeline _buildAudioDataSinkPipeline:graph:sourceAudioOutput:clientAuditToken:renderDelegate:](v11, v12, a3, a5, v16, a7))
    {
      fig_log_get_emitter();
      FigDebugAssert3();

      return 0;
    }
  }
  return v13;
}

- (id)_buildAudioDataSinkPipeline:(void *)a3 graph:(uint64_t)a4 sourceAudioOutput:(_OWORD *)a5 clientAuditToken:(uint64_t)a6 renderDelegate:
{
  void *v10;
  BWRemoteQueueSinkNode *v11;
  uint64_t v12;
  __int128 v13;
  BWRemoteQueueSinkNode *v14;
  objc_super v15;
  objc_super v16;
  _OWORD v17[2];
  objc_super v18;
  id v19;

  if (result)
  {
    v10 = result;
    v19 = 0;
    v18.receiver = result;
    v18.super_class = (Class)FigCaptureAudioDataSinkPipeline;
    objc_msgSendSuper2(&v18, sel_setUpstreamOutput_, a4);
    v11 = [BWRemoteQueueSinkNode alloc];
    v12 = objc_msgSend(v10, "sinkID");
    v13 = a5[1];
    v17[0] = *a5;
    v17[1] = v13;
    v14 = -[BWRemoteQueueSinkNode initWithMediaType:clientAuditToken:sinkID:](v11, "initWithMediaType:clientAuditToken:sinkID:", 1936684398, v17, v12);
    -[BWNode setName:](v14, "setName:", CFSTR("Audio Data Remote Queue Sink"));
    -[BWRemoteQueueSinkNode setDelegate:](v14, "setDelegate:", a6);
    v16.receiver = v10;
    v16.super_class = (Class)FigCaptureAudioDataSinkPipeline;
    if ((objc_msgSendSuper2(&v16, sel_addNode_error_, v14, &v19) & 1) != 0)
    {
      v15.receiver = v10;
      v15.super_class = (Class)FigCaptureAudioDataSinkPipeline;
      objc_msgSendSuper2(&v15, sel_setSinkNode_, v14);
      if ((objc_msgSend(a3, "connectOutput:toInput:pipelineStage:", a4, -[BWNode input](v14, "input"), 0) & 1) != 0)
        goto LABEL_4;
      fig_log_get_emitter();
    }
    else
    {
      fig_log_get_emitter();
    }
    FigDebugAssert3();
LABEL_4:
    result = v19;
    if (v19)
      return (id)objc_msgSend(v19, "code");
  }
  return result;
}

@end
