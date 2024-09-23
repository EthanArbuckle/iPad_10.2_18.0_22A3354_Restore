@implementation MTLToolsBinaryArchive

- (NSString)label
{
  return (NSString *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "label");
}

- (void)setLabel:(id)a3
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setLabel:", a3);
}

- (MTLDevice)device
{
  return (MTLDevice *)self->super._parent;
}

- (unint64_t)options
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "options");
}

- (BOOL)addComputePipelineFunctionsWithDescriptor:(id)a3 error:(id *)a4
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "addComputePipelineFunctionsWithDescriptor:error:", -[MTLDevice unwrapMTLComputePipelineDescriptor:](-[MTLToolsBinaryArchive device](self, "device"), "unwrapMTLComputePipelineDescriptor:", a3), a4);
}

- (BOOL)addComputePipelineFunctionsWithDescriptor:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "addComputePipelineFunctionsWithDescriptor:options:error:", -[MTLDevice unwrapMTLComputePipelineDescriptor:](-[MTLToolsBinaryArchive device](self, "device"), "unwrapMTLComputePipelineDescriptor:", a3), a4, a5);
}

- (BOOL)addRenderPipelineFunctionsWithDescriptor:(id)a3 error:(id *)a4
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "addRenderPipelineFunctionsWithDescriptor:error:", -[MTLDevice unwrapMTLRenderPipelineDescriptor:](-[MTLToolsBinaryArchive device](self, "device"), "unwrapMTLRenderPipelineDescriptor:", a3), a4);
}

- (BOOL)addRenderPipelineFunctionsWithDescriptor:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "addRenderPipelineFunctionsWithDescriptor:options:error:", -[MTLDevice unwrapMTLRenderPipelineDescriptor:](-[MTLToolsBinaryArchive device](self, "device"), "unwrapMTLRenderPipelineDescriptor:", a3), a4, a5);
}

- (BOOL)addTileRenderPipelineFunctionsWithDescriptor:(id)a3 error:(id *)a4
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "addTileRenderPipelineFunctionsWithDescriptor:error:", -[MTLDevice unwrapMTLTileRenderPipelineDescriptor:](-[MTLToolsBinaryArchive device](self, "device"), "unwrapMTLTileRenderPipelineDescriptor:", a3), a4);
}

- (BOOL)addTileRenderPipelineFunctionsWithDescriptor:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "addTileRenderPipelineFunctionsWithDescriptor:options:error:", -[MTLDevice unwrapMTLTileRenderPipelineDescriptor:](-[MTLToolsBinaryArchive device](self, "device"), "unwrapMTLTileRenderPipelineDescriptor:", a3), a4, a5);
}

- (BOOL)addMeshRenderPipelineFunctionsWithDescriptor:(id)a3 error:(id *)a4
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "addMeshRenderPipelineFunctionsWithDescriptor:error:", -[MTLDevice unwrapMTLMeshRenderPipelineDescriptor:](-[MTLToolsBinaryArchive device](self, "device"), "unwrapMTLMeshRenderPipelineDescriptor:", a3), a4);
}

- (BOOL)addMeshRenderPipelineFunctionsWithDescriptor:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "addMeshRenderPipelineFunctionsWithDescriptor:options:error:", -[MTLDevice unwrapMTLMeshRenderPipelineDescriptor:](-[MTLToolsBinaryArchive device](self, "device"), "unwrapMTLMeshRenderPipelineDescriptor:", a3), a4, a5);
}

- (BOOL)addLibraryWithDescriptor:(id)a3 error:(id *)a4
{
  void *v6;

  v6 = (void *)-[MTLDevice unwrapMTLStitchedLibraryDescriptor:](-[MTLToolsBinaryArchive device](self, "device"), "unwrapMTLStitchedLibraryDescriptor:", a3);
  LOBYTE(a4) = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "addLibraryWithDescriptor:error:", v6, a4);

  return (char)a4;
}

- (BOOL)serializeToURL:(id)a3 error:(id *)a4
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "serializeToURL:error:", a3, a4);
}

- (BOOL)serializeToURL:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "serializeToURL:options:error:", a3, a4, a5);
}

- (NSArray)keys
{
  return (NSArray *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "keys");
}

- (id)formattedDescription:(unint64_t)a3
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "formattedDescription:", a3);
}

- (MTLPipelineCollection)pipelineCollection
{
  return (MTLPipelineCollection *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "pipelineCollection");
}

- (BOOL)enumerateArchivesFromBackingFile:(id)a3
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "enumerateArchivesFromBackingFile:", a3);
}

- (BOOL)enumerateArchivesFromPipelineCollection:(id)a3
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "enumerateArchivesFromPipelineCollection:", a3);
}

- (BOOL)storeComputePipelineDescriptor:(id)a3
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "storeComputePipelineDescriptor:", a3);
}

- (BOOL)storeRenderPipelineDescriptor:(id)a3
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "storeRenderPipelineDescriptor:", a3);
}

- (BOOL)storeTileRenderPipelineDescriptor:(id)a3
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "storeTileRenderPipelineDescriptor:", a3);
}

- (BOOL)storeMeshRenderPipelineDescriptor:(id)a3
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "storeMeshRenderPipelineDescriptor:", a3);
}

- (id)archiveFunctionIds
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "archiveFunctionIds");
}

- (BOOL)recompileToArchiveWithURL:(id)a3 error:(id *)a4
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "recompileToArchiveWithURL:error:", a3, a4);
}

- (BOOL)addFunctionWithDescriptor:(id)a3 library:(id)a4 error:(id *)a5
{
  void *v8;

  v8 = (void *)-[MTLDevice unwrapMTLFunctionDescriptor:](-[MTLToolsBinaryArchive device](self, "device"), "unwrapMTLFunctionDescriptor:", a3);
  LOBYTE(a5) = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "addFunctionWithDescriptor:library:error:", v8, objc_msgSend(a4, "baseObject"), a5);

  return (char)a5;
}

@end
