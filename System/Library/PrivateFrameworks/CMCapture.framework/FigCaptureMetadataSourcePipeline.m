@implementation FigCaptureMetadataSourcePipeline

+ (void)initialize
{
  objc_opt_class();
}

- (void)initWithConfiguration:(void *)a3 graph:(uint64_t)a4 name:(_DWORD *)a5 errorOut:
{
  id v8;
  void *v9;
  int v10;
  int v12;
  objc_super v13;

  if (!a1)
    return 0;
  v13.receiver = a1;
  v13.super_class = (Class)FigCaptureMetadataSourcePipeline;
  v8 = objc_msgSendSuper2(&v13, sel_initWithGraph_name_sourceID_, a3, a4, objc_msgSend((id)objc_msgSend(a2, "sourceConfiguration"), "sourceID"));
  v9 = v8;
  if (v8)
  {
    if (a2)
    {
      v10 = -[FigCaptureMetadataSourcePipeline _buildMetadataSourcePipeline:graph:]((uint64_t)v8, a2, a3);
      if (!v10)
        return v9;
      v12 = v10;
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      v12 = 0;
    }
    if (a5)
      *a5 = v12;

    return 0;
  }
  return v9;
}

- (uint64_t)_buildMetadataSourcePipeline:(void *)a3 graph:
{
  id *v5;
  BWSynchronizerNode *v6;
  objc_super v7;
  objc_super v8;
  id v9;

  if (result)
  {
    v5 = (id *)result;
    v9 = 0;
    if (objc_msgSend(a2, "sourceSubType") != 1)
      goto LABEL_13;
    v5[5] = -[BWMetadataSourceNode initWithFormatDescription:clock:]([BWMetadataSourceNode alloc], "initWithFormatDescription:clock:", objc_msgSend(a2, "formatDescription"), objc_msgSend(a2, "clock"));
    v8.receiver = v5;
    v8.super_class = (Class)FigCaptureMetadataSourcePipeline;
    if ((objc_msgSendSuper2(&v8, sel_addNode_error_) & 1) != 0)
    {
      v6 = -[BWSynchronizerNode initWithMediaType:]([BWSynchronizerNode alloc], "initWithMediaType:", 1835365473);
      v5[6] = v6;
      v7.receiver = v5;
      v7.super_class = (Class)FigCaptureMetadataSourcePipeline;
      if ((objc_msgSendSuper2(&v7, sel_addNode_error_, v6, &v9) & 1) != 0)
      {
        if (objc_msgSend(a2, "sourceSubType") == 1)
          objc_msgSend(v5[6], "setSourceClock:", objc_msgSend(v5[5], "clock"));
        if ((objc_msgSend(a3, "connectOutput:toInput:pipelineStage:", objc_msgSend(v5[5], "output"), objc_msgSend(v5[6], "input"), 0) & 1) != 0)goto LABEL_8;
        fig_log_get_emitter();
        FigDebugAssert3();
LABEL_13:
        result = FigSignalErrorAt();
        if ((_DWORD)result)
          return result;
        goto LABEL_14;
      }
      fig_log_get_emitter();
    }
    else
    {
      fig_log_get_emitter();
    }
    FigDebugAssert3();
LABEL_8:
    result = 0;
LABEL_14:
    if (v9)
      return objc_msgSend(v9, "code");
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigCaptureMetadataSourcePipeline;
  -[FigCaptureSourcePipeline dealloc](&v3, sel_dealloc);
}

- (uint64_t)setMasterClock:(uint64_t)result
{
  if (result)
    return objc_msgSend(*(id *)(result + 48), "setMasterClock:", a2);
  return result;
}

- (uint64_t)sourceFormatDescription
{
  if (a1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    return objc_msgSend(*(id *)(a1 + 40), "formatDescription");
  else
    return 0;
}

- (uint64_t)output
{
  if (result)
    return objc_msgSend(*(id *)(result + 48), "output");
  return result;
}

- (uint64_t)appendSampleBuffer:(uint64_t)result
{
  uint64_t v3;

  if (result)
  {
    v3 = result;
    objc_opt_class();
    result = objc_opt_isKindOfClass();
    if ((result & 1) != 0)
      return objc_msgSend(*(id *)(v3 + 40), "appendMetadataSampleBuffer:", a2);
  }
  return result;
}

@end
