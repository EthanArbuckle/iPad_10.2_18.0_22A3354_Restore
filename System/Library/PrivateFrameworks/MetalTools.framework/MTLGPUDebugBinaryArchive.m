@implementation MTLGPUDebugBinaryArchive

- (MTLGPUDebugBinaryArchive)initWithBinaryArchive:(id)a3 device:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTLGPUDebugBinaryArchive;
  return -[MTLToolsObject initWithBaseObject:parent:](&v5, sel_initWithBaseObject_parent_, a3, a4);
}

- (BOOL)addComputePipelineFunctionsWithDescriptor:(id)a3 error:(id *)a4
{
  uint64_t v6;
  uint64_t v8;
  id v9;

  v8 = 0x1000000;
  v9 = a3;
  v6 = -[MTLDevice unwrapAndModifyComputePipelineDescriptor:options:](-[MTLToolsBinaryArchive device](self, "device"), "unwrapAndModifyComputePipelineDescriptor:options:", &v9, &v8);
  return -[MTLToolsObject addComputePipelineFunctionsWithDescriptor:options:error:](self->super.super._baseObject, "addComputePipelineFunctionsWithDescriptor:options:error:", v6, v8, a4);
}

- (BOOL)addComputePipelineFunctionsWithDescriptor:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  uint64_t v7;
  unint64_t v9;
  id v10;

  v9 = a4;
  v10 = a3;
  v7 = -[MTLDevice unwrapAndModifyComputePipelineDescriptor:options:](-[MTLToolsBinaryArchive device](self, "device"), "unwrapAndModifyComputePipelineDescriptor:options:", &v10, &v9);
  return -[MTLToolsObject addComputePipelineFunctionsWithDescriptor:options:error:](self->super.super._baseObject, "addComputePipelineFunctionsWithDescriptor:options:error:", v7, v9 | 0x1000000, a5);
}

- (BOOL)addRenderPipelineFunctionsWithDescriptor:(id)a3 error:(id *)a4
{
  uint64_t v6;
  uint64_t v8;
  id v9;

  v8 = 0x1000000;
  v9 = a3;
  v6 = -[MTLDevice unwrapAndModifyRenderPipelineDescriptor:options:](-[MTLToolsBinaryArchive device](self, "device"), "unwrapAndModifyRenderPipelineDescriptor:options:", &v9, &v8);
  return -[MTLToolsObject addRenderPipelineFunctionsWithDescriptor:options:error:](self->super.super._baseObject, "addRenderPipelineFunctionsWithDescriptor:options:error:", v6, v8, a4);
}

- (BOOL)addRenderPipelineFunctionsWithDescriptor:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  uint64_t v7;
  unint64_t v9;
  id v10;

  v9 = a4;
  v10 = a3;
  v7 = -[MTLDevice unwrapAndModifyRenderPipelineDescriptor:options:](-[MTLToolsBinaryArchive device](self, "device"), "unwrapAndModifyRenderPipelineDescriptor:options:", &v10, &v9);
  return -[MTLToolsObject addRenderPipelineFunctionsWithDescriptor:options:error:](self->super.super._baseObject, "addRenderPipelineFunctionsWithDescriptor:options:error:", v7, v9 | 0x1000000, a5);
}

- (BOOL)addTileRenderPipelineFunctionsWithDescriptor:(id)a3 error:(id *)a4
{
  uint64_t v6;
  uint64_t v8;
  id v9;

  v8 = 0x1000000;
  v9 = a3;
  v6 = -[MTLDevice unwrapAndModifyTileRenderPipelineDescriptor:options:](-[MTLToolsBinaryArchive device](self, "device"), "unwrapAndModifyTileRenderPipelineDescriptor:options:", &v9, &v8);
  return -[MTLToolsObject addTileRenderPipelineFunctionsWithDescriptor:options:error:](self->super.super._baseObject, "addTileRenderPipelineFunctionsWithDescriptor:options:error:", v6, v8, a4);
}

- (BOOL)addTileRenderPipelineFunctionsWithDescriptor:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  uint64_t v7;
  unint64_t v9;
  id v10;

  v9 = a4;
  v10 = a3;
  v7 = -[MTLDevice unwrapAndModifyTileRenderPipelineDescriptor:options:](-[MTLToolsBinaryArchive device](self, "device"), "unwrapAndModifyTileRenderPipelineDescriptor:options:", &v10, &v9);
  return -[MTLToolsObject addTileRenderPipelineFunctionsWithDescriptor:options:error:](self->super.super._baseObject, "addTileRenderPipelineFunctionsWithDescriptor:options:error:", v7, v9 | 0x1000000, a5);
}

@end
