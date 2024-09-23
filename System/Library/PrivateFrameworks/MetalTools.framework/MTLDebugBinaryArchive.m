@implementation MTLDebugBinaryArchive

- (BOOL)addComputePipelineFunctionsWithDescriptor:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  if (!a3)
    MTLReportFailure();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    MTLReportFailure();
  if (!objc_msgSend(a3, "computeFunction"))
    MTLReportFailure();
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "addComputePipelineFunctionsWithDescriptor:options:error:", -[MTLDevice unwrapMTLComputePipelineDescriptor:](-[MTLToolsBinaryArchive device](self, "device"), "unwrapMTLComputePipelineDescriptor:", a3), -[MTLDevice debugPipelineOptions:includePipelinePerfStats:](-[MTLToolsBinaryArchive device](self, "device"), "debugPipelineOptions:includePipelinePerfStats:", a4, 0), a5);
}

- (BOOL)addComputePipelineFunctionsWithDescriptor:(id)a3 error:(id *)a4
{
  return -[MTLDebugBinaryArchive addComputePipelineFunctionsWithDescriptor:options:error:](self, "addComputePipelineFunctionsWithDescriptor:options:error:", a3, 0, a4);
}

- (BOOL)addRenderPipelineFunctionsWithDescriptor:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  if (!a3)
    MTLReportFailure();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    MTLReportFailure();
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "addRenderPipelineFunctionsWithDescriptor:options:error:", -[MTLDevice unwrapMTLRenderPipelineDescriptor:](-[MTLToolsBinaryArchive device](self, "device"), "unwrapMTLRenderPipelineDescriptor:", a3), -[MTLDevice debugPipelineOptions:includePipelinePerfStats:](-[MTLToolsBinaryArchive device](self, "device"), "debugPipelineOptions:includePipelinePerfStats:", a4, 0), a5);
}

- (BOOL)addRenderPipelineFunctionsWithDescriptor:(id)a3 error:(id *)a4
{
  return -[MTLDebugBinaryArchive addRenderPipelineFunctionsWithDescriptor:options:error:](self, "addRenderPipelineFunctionsWithDescriptor:options:error:", a3, 0, a4);
}

- (BOOL)addMeshRenderPipelineFunctionsWithDescriptor:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  if (!a3)
    MTLReportFailure();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    MTLReportFailure();
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "addMeshRenderPipelineFunctionsWithDescriptor:options:error:", -[MTLDevice unwrapMTLMeshRenderPipelineDescriptor:](-[MTLToolsBinaryArchive device](self, "device"), "unwrapMTLMeshRenderPipelineDescriptor:", a3), -[MTLDevice debugPipelineOptions:includePipelinePerfStats:](-[MTLToolsBinaryArchive device](self, "device"), "debugPipelineOptions:includePipelinePerfStats:", a4, 0), a5);
}

- (BOOL)addMeshRenderPipelineFunctionsWithDescriptor:(id)a3 error:(id *)a4
{
  return -[MTLDebugBinaryArchive addMeshRenderPipelineFunctionsWithDescriptor:options:error:](self, "addMeshRenderPipelineFunctionsWithDescriptor:options:error:", a3, 0, a4);
}

- (BOOL)addTileRenderPipelineFunctionsWithDescriptor:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  if ((-[MTLDevice supportsTileShaders](-[MTLToolsBinaryArchive device](self, "device"), "supportsTileShaders") & 1) != 0)
  {
    if (a3)
      goto LABEL_3;
  }
  else
  {
    MTLReportFailure();
    if (a3)
      goto LABEL_3;
  }
  MTLReportFailure();
LABEL_3:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    MTLReportFailure();
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "addTileRenderPipelineFunctionsWithDescriptor:options:error:", -[MTLDevice unwrapMTLTileRenderPipelineDescriptor:](-[MTLToolsBinaryArchive device](self, "device"), "unwrapMTLTileRenderPipelineDescriptor:", a3), -[MTLDevice debugPipelineOptions:includePipelinePerfStats:](-[MTLToolsBinaryArchive device](self, "device"), "debugPipelineOptions:includePipelinePerfStats:", a4, 0), a5);
}

- (BOOL)addTileRenderPipelineFunctionsWithDescriptor:(id)a3 error:(id *)a4
{
  return -[MTLDebugBinaryArchive addTileRenderPipelineFunctionsWithDescriptor:options:error:](self, "addTileRenderPipelineFunctionsWithDescriptor:options:error:", a3, 0, a4);
}

- (BOOL)serializeToURL:(id)a3 error:(id *)a4
{
  objc_super v8;

  if (!a3)
    MTLReportFailure();
  if ((objc_msgSend(a3, "isFileURL") & 1) == 0)
    MTLReportFailure();
  v8.receiver = self;
  v8.super_class = (Class)MTLDebugBinaryArchive;
  return -[MTLToolsBinaryArchive serializeToURL:error:](&v8, sel_serializeToURL_error_, a3, a4);
}

- (BOOL)serializeToURL:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  objc_super v10;

  if (!a3)
    MTLReportFailure();
  if ((objc_msgSend(a3, "isFileURL") & 1) == 0)
    MTLReportFailure();
  v10.receiver = self;
  v10.super_class = (Class)MTLDebugBinaryArchive;
  return -[MTLToolsBinaryArchive serializeToURL:options:error:](&v10, sel_serializeToURL_options_error_, a3, a4, a5);
}

@end
