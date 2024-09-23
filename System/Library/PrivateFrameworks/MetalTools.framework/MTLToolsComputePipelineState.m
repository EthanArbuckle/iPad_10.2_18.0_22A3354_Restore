@implementation MTLToolsComputePipelineState

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLToolsComputePipelineState;
  -[MTLToolsObject dealloc](&v3, sel_dealloc);
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

- (id)functionHandleWithFunction:(id)a3
{
  return (id)MTLFunctionHandleToToolsFunctionHandle(objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "functionHandleWithFunction:", objc_msgSend(a3, "baseObject")), a3, (uint64_t)self);
}

- (id)newComputePipelineStateWithAdditionalBinaryFunctions:(id)a3
{
  return -[MTLToolsComputePipelineState newComputePipelineStateWithAdditionalBinaryFunctions:error:](self, "newComputePipelineStateWithAdditionalBinaryFunctions:error:", a3, 0);
}

- (id)newComputePipelineStateWithAdditionalBinaryFunctions:(id)a3 error:(id *)a4
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  MTLToolsComputePipelineState *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v7 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(a3, "count"));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(a3);
        objc_msgSend(v7, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v11++), "baseObject"));
      }
      while (v9 != v11);
      v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }
  v12 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newComputePipelineStateWithAdditionalBinaryFunctions:error:", v7, a4);
  if (!v12)
    return 0;
  v13 = (void *)v12;
  v14 = -[MTLToolsObject initWithBaseObject:parent:]([MTLToolsComputePipelineState alloc], "initWithBaseObject:parent:", v12, self);

  return v14;
}

- (id)newVisibleFunctionTableWithDescriptor:(id)a3
{
  id result;
  id v5;
  MTLToolsVisibleFunctionTable *v6;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newVisibleFunctionTableWithDescriptor:", a3);
  if (result)
  {
    v5 = result;
    v6 = -[MTLToolsResource initWithBaseObject:parent:]([MTLToolsVisibleFunctionTable alloc], "initWithBaseObject:parent:", result, self);

    return v6;
  }
  return result;
}

- (id)newIntersectionFunctionTableWithDescriptor:(id)a3
{
  id result;
  id v5;
  MTLToolsIntersectionFunctionTable *v6;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newIntersectionFunctionTableWithDescriptor:", a3);
  if (result)
  {
    v5 = result;
    v6 = -[MTLToolsResource initWithBaseObject:parent:]([MTLToolsIntersectionFunctionTable alloc], "initWithBaseObject:parent:", result, self);

    return v6;
  }
  return result;
}

- (BOOL)supportIndirectCommandBuffers
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportIndirectCommandBuffers");
}

- (int64_t)textureWriteRoundingMode
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "textureWriteRoundingMode");
}

- (unint64_t)maxTotalThreadsPerThreadgroup
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "maxTotalThreadsPerThreadgroup");
}

- (unint64_t)threadExecutionWidth
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "threadExecutionWidth");
}

- (unint64_t)staticThreadgroupMemoryLength
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "staticThreadgroupMemoryLength");
}

- (unint64_t)imageblockMemoryLengthForDimensions:(id *)a3
{
  id v4;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v6;

  v4 = -[MTLToolsObject baseObject](self, "baseObject");
  v6 = *a3;
  return objc_msgSend(v4, "imageblockMemoryLengthForDimensions:", &v6);
}

- (unsigned)getComputeKernelTelemetryID
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "getComputeKernelTelemetryID");
}

- (unint64_t)resourceIndex
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "resourceIndex");
}

- (unint64_t)gpuAddress
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "gpuAddress");
}

- (unint64_t)allocatedSize
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "allocatedSize");
}

- (unint64_t)uniqueIdentifier
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "uniqueIdentifier");
}

- (MTLDebugInstrumentationData)debugInstrumentationData
{
  return (MTLDebugInstrumentationData *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "debugInstrumentationData");
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
