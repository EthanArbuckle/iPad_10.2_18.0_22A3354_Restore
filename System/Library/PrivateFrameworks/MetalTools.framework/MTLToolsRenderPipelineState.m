@implementation MTLToolsRenderPipelineState

- (MTLToolsRenderPipelineState)initWithBaseObject:(id)a3 parent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTLToolsRenderPipelineState;
  return -[MTLToolsObject initWithBaseObject:parent:](&v5, sel_initWithBaseObject_parent_, a3, a4);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)MTLToolsRenderPipelineState;
  -[MTLToolsObject dealloc](&v2, sel_dealloc);
}

- (NSString)label
{
  return (NSString *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "label");
}

- (MTLDevice)device
{
  char isKindOfClass;
  MTLToolsObject *parent;
  char v5;

  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  parent = self->super._parent;
  if ((isKindOfClass & 1) != 0)
    return -[MTLToolsObject device](parent, "device");
  objc_opt_class();
  v5 = objc_opt_isKindOfClass();
  parent = self->super._parent;
  if ((v5 & 1) != 0)
    return -[MTLToolsObject device](parent, "device");
  else
    return (MTLDevice *)self->super._parent;
}

- (unint64_t)maxTotalThreadsPerThreadgroup
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "maxTotalThreadsPerThreadgroup");
}

- (BOOL)threadgroupSizeMatchesTileSize
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "threadgroupSizeMatchesTileSize");
}

- (BOOL)supportIndirectCommandBuffers
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportIndirectCommandBuffers");
}

- (int64_t)textureWriteRoundingMode
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "textureWriteRoundingMode");
}

- (id)newVertexShaderDebugInfo
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newVertexShaderDebugInfo");
}

- (id)newFragmentShaderDebugInfo
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newFragmentShaderDebugInfo");
}

- (unsigned)getVertexShaderTelemetryID
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "getVertexShaderTelemetryID");
}

- (unsigned)getFragmentShaderTelemetryID
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "getFragmentShaderTelemetryID");
}

- (unint64_t)imageblockSampleLength
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "imageblockSampleLength");
}

- (unint64_t)imageblockMemoryLengthForDimensions:(id *)a3
{
  id v4;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v6;

  v4 = -[MTLToolsObject baseObject](self, "baseObject");
  v6 = *a3;
  return objc_msgSend(v4, "imageblockMemoryLengthForDimensions:", &v6);
}

- (unint64_t)resourceIndex
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "resourceIndex");
}

- (unsigned)explicitVisibilityGroupID
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "explicitVisibilityGroupID");
}

- (unint64_t)gpuAddress
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "gpuAddress");
}

- (unint64_t)uniqueIdentifier
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "uniqueIdentifier");
}

- (unint64_t)allocatedSize
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "allocatedSize");
}

- (MTLDebugInstrumentationData)vertexDebugInstrumentationData
{
  return (MTLDebugInstrumentationData *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "vertexDebugInstrumentationData");
}

- (MTLDebugInstrumentationData)fragmentDebugInstrumentationData
{
  return (MTLDebugInstrumentationData *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "fragmentDebugInstrumentationData");
}

- (MTLDebugInstrumentationData)tileDebugInstrumentationData
{
  return (MTLDebugInstrumentationData *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "tileDebugInstrumentationData");
}

- (MTLDebugInstrumentationData)objectDebugInstrumentationData
{
  return (MTLDebugInstrumentationData *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "objectDebugInstrumentationData");
}

- (MTLDebugInstrumentationData)meshDebugInstrumentationData
{
  return (MTLDebugInstrumentationData *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "meshDebugInstrumentationData");
}

- (unint64_t)maxTotalThreadsPerObjectThreadgroup
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "maxTotalThreadsPerObjectThreadgroup");
}

- (unint64_t)maxTotalThreadsPerMeshThreadgroup
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "maxTotalThreadsPerMeshThreadgroup");
}

- (unint64_t)objectThreadExecutionWidth
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "objectThreadExecutionWidth");
}

- (unint64_t)meshThreadExecutionWidth
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "meshThreadExecutionWidth");
}

- (unint64_t)maxTotalThreadgroupsPerMeshGrid
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "maxTotalThreadgroupsPerMeshGrid");
}

- (id)vertexFunctionHandleWithFunction:(id)a3
{
  return (id)MTLFunctionHandleToToolsFunctionHandle(objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "vertexFunctionHandleWithFunction:", objc_msgSend(a3, "baseObject")), a3, (uint64_t)self);
}

- (id)fragmentFunctionHandleWithFunction:(id)a3
{
  return (id)MTLFunctionHandleToToolsFunctionHandle(objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "fragmentFunctionHandleWithFunction:", objc_msgSend(a3, "baseObject")), a3, (uint64_t)self);
}

- (id)tileFunctionHandleWithFunction:(id)a3
{
  return (id)MTLFunctionHandleToToolsFunctionHandle(objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "tileFunctionHandleWithFunction:", objc_msgSend(a3, "baseObject")), a3, (uint64_t)self);
}

- (id)objectFunctionHandleWithFunction:(id)a3
{
  return (id)MTLFunctionHandleToToolsFunctionHandle(objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "objectFunctionHandleWithFunction:", objc_msgSend(a3, "baseObject")), a3, (uint64_t)self);
}

- (id)meshFunctionHandleWithFunction:(id)a3
{
  return (id)MTLFunctionHandleToToolsFunctionHandle(objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "meshFunctionHandleWithFunction:", objc_msgSend(a3, "baseObject")), a3, (uint64_t)self);
}

- (id)functionHandleWithFunction:(id)a3 stage:(unint64_t)a4
{
  return (id)MTLFunctionHandleToToolsFunctionHandle(objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "functionHandleWithFunction:stage:", objc_msgSend(a3, "baseObject"), a4), a3, (uint64_t)self);
}

- (id)newVisibleFunctionTableWithDescriptor:(id)a3 selector:(SEL)a4
{
  id result;
  id v6;
  MTLToolsVisibleFunctionTable *v7;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "performSelector:withObject:", a4, a3);
  if (result)
  {
    v6 = result;
    v7 = -[MTLToolsResource initWithBaseObject:parent:]([MTLToolsVisibleFunctionTable alloc], "initWithBaseObject:parent:", result, self);

    return v7;
  }
  return result;
}

- (id)newVisibleFunctionTableFromVertexStageWithDescriptor:(id)a3
{
  return -[MTLToolsRenderPipelineState newVisibleFunctionTableWithDescriptor:selector:](self, "newVisibleFunctionTableWithDescriptor:selector:", a3, a2);
}

- (id)newVisibleFunctionTableFromFragmentStageWithDescriptor:(id)a3
{
  return -[MTLToolsRenderPipelineState newVisibleFunctionTableWithDescriptor:selector:](self, "newVisibleFunctionTableWithDescriptor:selector:", a3, a2);
}

- (id)newVisibleFunctionTableFromTileStageWithDescriptor:(id)a3
{
  return -[MTLToolsRenderPipelineState newVisibleFunctionTableWithDescriptor:selector:](self, "newVisibleFunctionTableWithDescriptor:selector:", a3, a2);
}

- (id)newVisibleFunctionTableFromObjectStageWithDescriptor:(id)a3
{
  return -[MTLToolsRenderPipelineState newVisibleFunctionTableWithDescriptor:selector:](self, "newVisibleFunctionTableWithDescriptor:selector:", a3, a2);
}

- (id)newVisibleFunctionTableFromMeshStageWithDescriptor:(id)a3
{
  return -[MTLToolsRenderPipelineState newVisibleFunctionTableWithDescriptor:selector:](self, "newVisibleFunctionTableWithDescriptor:selector:", a3, a2);
}

- (id)newVisibleFunctionTableWithDescriptor:(id)a3 stage:(unint64_t)a4
{
  id result;
  id v6;
  MTLToolsVisibleFunctionTable *v7;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newVisibleFunctionTableWithDescriptor:stage:", a3, a4);
  if (result)
  {
    v6 = result;
    v7 = -[MTLToolsResource initWithBaseObject:parent:]([MTLToolsVisibleFunctionTable alloc], "initWithBaseObject:parent:", result, self);

    return v7;
  }
  return result;
}

- (id)newRenderPipelineStateWithAdditionalBinaryFunctions:(id)a3 fragmentAdditionalBinaryFunctions:(id)a4 error:(id *)a5
{
  void *v8;
  id result;
  id v10;
  MTLToolsRenderPipelineState *v11;

  v8 = unwrapArray((NSArray *)a3);
  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newRenderPipelineStateWithAdditionalBinaryFunctions:fragmentAdditionalBinaryFunctions:error:", v8, unwrapArray((NSArray *)a4), a5);
  if (result)
  {
    v10 = result;
    v11 = -[MTLToolsRenderPipelineState initWithBaseObject:parent:]([MTLToolsRenderPipelineState alloc], "initWithBaseObject:parent:", result, self);

    return v11;
  }
  return result;
}

- (id)newTileRenderPipelineStateWithAdditionalBinaryFunctions:(id)a3 error:(id *)a4
{
  id result;
  id v6;
  MTLToolsRenderPipelineState *v7;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newTileRenderPipelineStateWithAdditionalBinaryFunctions:error:", unwrapArray((NSArray *)a3), a4);
  if (result)
  {
    v6 = result;
    v7 = -[MTLToolsRenderPipelineState initWithBaseObject:parent:]([MTLToolsRenderPipelineState alloc], "initWithBaseObject:parent:", result, self);

    return v7;
  }
  return result;
}

- (id)newRenderPipelineStateWithAdditionalBinaryFunctions:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  MTLToolsRenderPipelineState *v9;

  v7 = objc_alloc_init(MEMORY[0x24BDDD6C8]);
  objc_msgSend(v7, "setVertexAdditionalBinaryFunctions:", unwrapArray((NSArray *)objc_msgSend(a3, "vertexAdditionalBinaryFunctions")));
  objc_msgSend(v7, "setFragmentAdditionalBinaryFunctions:", unwrapArray((NSArray *)objc_msgSend(a3, "fragmentAdditionalBinaryFunctions")));
  objc_msgSend(v7, "setTileAdditionalBinaryFunctions:", unwrapArray((NSArray *)objc_msgSend(a3, "tileAdditionalBinaryFunctions")));
  objc_msgSend(v7, "setObjectAdditionalBinaryFunctions:", unwrapArray((NSArray *)objc_msgSend(a3, "objectAdditionalBinaryFunctions")));
  objc_msgSend(v7, "setMeshAdditionalBinaryFunctions:", unwrapArray((NSArray *)objc_msgSend(a3, "meshAdditionalBinaryFunctions")));
  v8 = (void *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newRenderPipelineStateWithAdditionalBinaryFunctions:error:", v7, a4);

  if (!v8)
    return 0;
  v9 = -[MTLToolsRenderPipelineState initWithBaseObject:parent:]([MTLToolsRenderPipelineState alloc], "initWithBaseObject:parent:", v8, self);

  return v9;
}

- (id)newIntersectionFunctionTableWithDescriptor:(id)a3 selector:(SEL)a4
{
  id result;
  id v6;
  MTLToolsIntersectionFunctionTable *v7;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "performSelector:withObject:", a4, a3);
  if (result)
  {
    v6 = result;
    v7 = -[MTLToolsResource initWithBaseObject:parent:]([MTLToolsIntersectionFunctionTable alloc], "initWithBaseObject:parent:", result, self);

    return v7;
  }
  return result;
}

- (id)newVertexIntersectionFunctionTableWithDescriptor:(id)a3
{
  return -[MTLToolsRenderPipelineState newIntersectionFunctionTableWithDescriptor:selector:](self, "newIntersectionFunctionTableWithDescriptor:selector:", a3, a2);
}

- (id)newFragmentIntersectionFunctionTableWithDescriptor:(id)a3
{
  return -[MTLToolsRenderPipelineState newIntersectionFunctionTableWithDescriptor:selector:](self, "newIntersectionFunctionTableWithDescriptor:selector:", a3, a2);
}

- (id)newTileIntersectionFunctionTableWithDescriptor:(id)a3
{
  return -[MTLToolsRenderPipelineState newIntersectionFunctionTableWithDescriptor:selector:](self, "newIntersectionFunctionTableWithDescriptor:selector:", a3, a2);
}

- (id)newObjectIntersectionFunctionTableWithDescriptor:(id)a3
{
  return -[MTLToolsRenderPipelineState newIntersectionFunctionTableWithDescriptor:selector:](self, "newIntersectionFunctionTableWithDescriptor:selector:", a3, a2);
}

- (id)newMeshIntersectionFunctionTableWithDescriptor:(id)a3
{
  return -[MTLToolsRenderPipelineState newIntersectionFunctionTableWithDescriptor:selector:](self, "newIntersectionFunctionTableWithDescriptor:selector:", a3, a2);
}

- (id)newIntersectionFunctionTableWithDescriptor:(id)a3 stage:(unint64_t)a4
{
  id result;
  id v6;
  MTLToolsIntersectionFunctionTable *v7;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newIntersectionFunctionTableWithDescriptor:stage:", a3, a4);
  if (result)
  {
    v6 = result;
    v7 = -[MTLToolsResource initWithBaseObject:parent:]([MTLToolsIntersectionFunctionTable alloc], "initWithBaseObject:parent:", result, self);

    return v7;
  }
  return result;
}

- (id)pipelineBinaries
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "pipelineBinaries");
}

- (unint64_t)gpuHandle
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "gpuHandle");
}

- (MTLResourceID)gpuResourceID
{
  return (MTLResourceID)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "gpuResourceID");
}

@end
