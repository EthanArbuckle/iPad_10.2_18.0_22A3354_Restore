@implementation MTLGPUDebugIndirectCommandBuffer

- (MTLGPUDebugIndirectCommandBuffer)initWithIndirectCommandBuffer:(id)a3 descriptor:(id)a4 maxCommandCount:(unint64_t)a5 resourceOptions:(unint64_t)a6 device:(id)a7
{
  MTLGPUDebugIndirectCommandBuffer *v12;
  __int16 v13;
  __int16 maxKernelBindings;
  __int16 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  _DWORD *v21;
  int maxThreadgroupBindings;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)MTLGPUDebugIndirectCommandBuffer;
  v12 = -[MTLToolsResource initWithBaseObject:parent:](&v24, sel_initWithBaseObject_parent_, a3, a7);
  if (v12)
  {
    v12->_hasRender = (objc_msgSend(a4, "commandTypes") & 0x18F) != 0;
    v12->_hasCompute = (objc_msgSend(a4, "commandTypes") & 0x60) != 0;
    v12->_inheritsBuffers = objc_msgSend(a4, "inheritBuffers");
    v12->_inheritsPipelineState = objc_msgSend(a4, "inheritPipelineState");
    v12->_maxCommands = a5;
    v12->_maxVertexBindings = objc_msgSend(a4, "maxVertexBufferBindCount");
    v12->_maxFragmentBindings = objc_msgSend(a4, "maxFragmentBufferBindCount");
    v12->_maxKernelBindings = objc_msgSend(a4, "maxKernelBufferBindCount");
    v12->_maxThreadgroupBindings = 32;
    v12->_maxObjectBindings = objc_msgSend(a4, "maxObjectBufferBindCount");
    v12->_maxMeshBindings = objc_msgSend(a4, "maxMeshBufferBindCount");
    v12->_mayContainDrawMeshes = (objc_msgSend(a4, "commandTypes") & 0x180) != 0;
    if (v12->_hasCompute)
    {
      v13 = v12->_maxKernelBindings + v12->_maxThreadgroupBindings + 2;
      v12->_commandByteStride = 8 * v13;
      maxKernelBindings = v12->_maxKernelBindings;
    }
    else
    {
      v15 = v12->_maxVertexBindings + v12->_maxFragmentBindings + 2;
      v12->_commandByteStride = 8 * v15;
      v13 = v15 + v12->_maxVertexBindings;
      v12->_commandByteStride = 8 * v13;
      maxKernelBindings = v12->_maxObjectBindings + v12->_maxMeshBindings;
    }
    v12->_commandByteStride = 8 * (v13 + maxKernelBindings);
    v12->_originalResourceOptions = a6;
    v16 = (void *)MEMORY[0x22E309364]();
    v17 = (void *)objc_opt_new();
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 1);
    objc_msgSend(v17, "setAccess:", 1);
    objc_msgSend(v17, "setIndex:", 0);
    objc_msgSend(v17, "setArrayLength:", 1);
    objc_msgSend(v17, "setDataType:", 80);
    objc_msgSend(v18, "addObject:", (id)objc_msgSend(v17, "copy"));
    v19 = (void *)objc_msgSend((id)objc_msgSend(a7, "baseObject"), "newArgumentEncoderWithArguments:", v18);

    v20 = objc_msgSend(a7, "newInternalBufferWithLength:options:", v12->_commandByteStride * a5 + 40, 0);
    v12->_argumentStorage = (MTLBuffer *)v20;
    objc_msgSend(v19, "setArgumentBuffer:offset:", v20, 0);
    objc_msgSend(v19, "setIndirectCommandBuffer:atIndex:", a3, 0);

    objc_autoreleasePoolPop(v16);
    v21 = (_DWORD *)-[MTLBuffer contents](v12->_argumentStorage, "contents");
    v21[2] = v12->_maxCommands;
    v21[3] = v12->_maxVertexBindings;
    v21[4] = v12->_maxFragmentBindings;
    v21[5] = v12->_maxKernelBindings;
    maxThreadgroupBindings = v12->_maxThreadgroupBindings;
    v21[6] = v12->_commandByteStride >> 3;
    v21[7] = maxThreadgroupBindings;
    if (!v12->_inheritsPipelineState)
    {
      v12->_vertexKernelDrawOrDispatchIDBuffer = (MTLBuffer *)objc_msgSend(a7, "newInternalBufferWithLength:options:", 24 * a5, 0);
      if (v12->_hasRender)
      {
        v12->_fragmentDrawIDBuffer = (MTLBuffer *)objc_msgSend(a7, "newInternalBufferWithLength:options:", 24 * a5, 0);
        v12->_meshDrawIDBuffer = (MTLBuffer *)objc_msgSend(a7, "newInternalBufferWithLength:options:", 24 * a5, 0);
        v12->_objectDrawIDBuffer = (MTLBuffer *)objc_msgSend(a7, "newInternalBufferWithLength:options:", 24 * a5, 0);
      }
    }
  }
  return v12;
}

- (unint64_t)maxCommands
{
  return self->_maxCommands;
}

- (unint64_t)maxVertexBindings
{
  return self->_maxVertexBindings;
}

- (unint64_t)maxFragmentBindings
{
  return self->_maxFragmentBindings;
}

- (unint64_t)maxKernelBindings
{
  return self->_maxKernelBindings;
}

- (unint64_t)maxObjectBindings
{
  return self->_maxObjectBindings;
}

- (unint64_t)maxMeshBindings
{
  return self->_maxMeshBindings;
}

- (BOOL)mayContainDrawMeshes
{
  return self->_mayContainDrawMeshes;
}

- (unint64_t)commandByteStride
{
  return self->_commandByteStride;
}

- (BOOL)inheritsBuffers
{
  return self->_inheritsBuffers;
}

- (BOOL)inheritsPipelineState
{
  return self->_inheritsPipelineState;
}

- (MTLBuffer)internalICBBuffer
{
  return self->_argumentStorage;
}

- (MTLBuffer)internalDispatchIDBuffer
{
  return self->_vertexKernelDrawOrDispatchIDBuffer;
}

- (MTLBuffer)internalVertexDrawIDBuffer
{
  return self->_vertexKernelDrawOrDispatchIDBuffer;
}

- (MTLBuffer)internalFragmentDrawIDBuffer
{
  return self->_fragmentDrawIDBuffer;
}

- (MTLBuffer)internalMeshDrawIDBuffer
{
  return self->_meshDrawIDBuffer;
}

- (MTLBuffer)internalObjectDrawIDBuffer
{
  return self->_objectDrawIDBuffer;
}

- (void)resetAtIndex:(unint64_t)a3
{
  int v3;
  int *v5;
  int v6;
  int *v7;
  int *v8;
  unint64_t v9;
  int *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;

  v3 = a3;
  v5 = (int *)-[MTLBuffer contents](self->_argumentStorage, "contents");
  v6 = v5[6] * v3;
  v7 = &v5[2 * v6];
  *((_QWORD *)v7 + 5) = 0;
  v8 = v7 + 10;
  if (self->_maxKernelBindings)
  {
    v9 = 0;
    v10 = v8 + 4;
    v11 = (uint64_t)&v5[2 * v5[3] + 14 + 2 * v5[5] + 2 * v6];
    do
    {
      *(_QWORD *)&v10[2 * v9] = 0;
      *(_QWORD *)(v11 + 8 * v9++) = -1;
    }
    while (v9 < self->_maxKernelBindings);
  }
  if (self->_maxThreadgroupBindings)
  {
    v12 = 0;
    v13 = (uint64_t)&v5[4 * v5[3] + 14 + 4 * v5[5] + 2 * v5[4] + 2 * v6];
    do
      *(_QWORD *)(v13 + 8 * v12++) = 0;
    while (v12 < self->_maxThreadgroupBindings);
  }
}

- (void)setBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5 forStage:(unint64_t)a6 commandIndex:(unint64_t)a7
{
  -[MTLGPUDebugIndirectCommandBuffer setBuffer:offset:attributeStride:atIndex:forStage:commandIndex:](self, "setBuffer:offset:attributeStride:atIndex:forStage:commandIndex:", a3, a4, -1, a5, a6, a7);
}

- (void)setBuffer:(id)a3 offset:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6 forStage:(unint64_t)a7 commandIndex:(unint64_t)a8
{
  int v8;
  int *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v8 = a8;
  v14 = (int *)-[MTLBuffer contents](self->_argumentStorage, "contents");
  switch(a7)
  {
    case 1uLL:
    case 3uLL:
      v15 = objc_msgSend(a3, "handleForOffset:", a4);
      v16 = v14[5];
      v17 = (uint64_t)&v14[2 * v14[6] * v8 + 14];
      *(_QWORD *)(v17 + 8 * a6) = v15;
      v18 = v17 + 8 * v14[3] + 8 * v16;
      goto LABEL_8;
    case 2uLL:
      a5 = objc_msgSend(a3, "handleForOffset:", a4);
      v19 = v14[5];
      v20 = (uint64_t)&v14[2 * v14[6] * v8 + 2 * v14[3] + 2 * v19 + 2 * v14[3]];
      goto LABEL_6;
    case 7uLL:
      a5 = objc_msgSend(a3, "handleForOffset:", a4);
      v21 = (uint64_t)&v14[2 * v14[6] * v8
                        + 2 * v14[3]
                        + 2 * v14[5]
                        + 2 * v14[3]
                        + 2 * v14[5]
                        + 2 * v14[4]
                        + 2 * v14[7]
                        + 2 * v14[8]];
      goto LABEL_7;
    case 8uLL:
      a5 = objc_msgSend(a3, "handleForOffset:", a4);
      v20 = (uint64_t)&v14[2 * v14[6] * v8 + 2 * v14[3] + 2 * v14[5] + 2 * v14[3] + 2 * v14[5] + 2 * v14[4]];
      v19 = v14[7];
LABEL_6:
      v21 = v20 + 8 * v19;
LABEL_7:
      v18 = v21 + 56;
LABEL_8:
      *(_QWORD *)(v18 + 8 * a6) = a5;
      break;
    default:
      return;
  }
}

- (void)setTessellationControlPointIndexBuffer:(id)a3 offset:(unint64_t)a4 commandIndex:(unint64_t)a5
{
  int v5;
  uint64_t v8;

  v5 = a5;
  v8 = -[MTLBuffer contents](self->_argumentStorage, "contents");
  *(_QWORD *)(v8 + 8 * *(_DWORD *)(v8 + 24) * v5 + 48) = objc_msgSend(a3, "handleForOffset:", a4);
}

- (void)setRenderPipelineStateBuffers:(id)a3 commandIndex:(unint64_t)a4
{
  int v4;
  uint64_t v6;
  uint64_t v7;

  v4 = a4;
  v6 = -[MTLBuffer contents](self->_argumentStorage, "contents");
  if (a3)
    v7 = objc_msgSend((id)objc_msgSend(a3, "indirectStateBuffer"), "underlyingGPUAddress");
  else
    v7 = 0;
  *(_QWORD *)(v6 + 8 * *(_DWORD *)(v6 + 24) * v4 + 40) = v7;
}

- (void)setComputePipelineStateBuffers:(id)a3 commandIndex:(unint64_t)a4
{
  int v4;
  uint64_t v6;
  uint64_t v7;

  v4 = a4;
  v6 = -[MTLBuffer contents](self->_argumentStorage, "contents");
  if (a3)
    v7 = objc_msgSend((id)objc_msgSend(a3, "indirectStateBuffer"), "underlyingGPUAddress");
  else
    v7 = 0;
  *(_QWORD *)(v6 + 8 * *(_DWORD *)(v6 + 24) * v4 + 40) = v7;
}

- (void)setThreadgroupMemoryLength:(unint64_t)a3 atIndex:(unint64_t)a4 commandIndex:(unint64_t)a5
{
  int v5;
  int v7;
  int *v8;

  v5 = a5;
  v7 = a3;
  v8 = (int *)-[MTLBuffer contents](self->_argumentStorage, "contents");
  v8[2 * v8[6] * v5 + 15 + 2 * v8[3] + 2 * v8[5] + 2 * v8[3] + 2 * v8[5] + 2 * v8[4] + 2 * a4] = v7;
}

- (id)indirectRenderCommandAtIndex:(unint64_t)a3
{
  return -[MTLGPUDebugIndirectRenderCommand initWithIndirectRenderCommand:commandIndex:indirectCommandBuffer:]([MTLGPUDebugIndirectRenderCommand alloc], "initWithIndirectRenderCommand:commandIndex:indirectCommandBuffer:", -[MTLToolsObject indirectRenderCommandAtIndex:](self->super.super.super._baseObject, "indirectRenderCommandAtIndex:"), a3, self);
}

- (id)indirectComputeCommandAtIndex:(unint64_t)a3
{
  return -[MTLGPUDebugIndirectComputeCommand initWithIndirectComputeCommand:commandIndex:indirectCommandBuffer:]([MTLGPUDebugIndirectComputeCommand alloc], "initWithIndirectComputeCommand:commandIndex:indirectCommandBuffer:", -[MTLToolsObject indirectComputeCommandAtIndex:](self->super.super.super._baseObject, "indirectComputeCommandAtIndex:"), a3, self);
}

- (void)useWithComputeEncoder:(id)a3 usage:(unint64_t)a4
{
  MTLBuffer *vertexKernelDrawOrDispatchIDBuffer;

  objc_msgSend(a3, "useResourceInternal:usage:", self->super.super.super._baseObject);
  objc_msgSend(a3, "useResourceInternal:usage:", self->_argumentStorage, a4);
  vertexKernelDrawOrDispatchIDBuffer = self->_vertexKernelDrawOrDispatchIDBuffer;
  if (vertexKernelDrawOrDispatchIDBuffer)
    objc_msgSend(a3, "useResourceInternal:usage:", vertexKernelDrawOrDispatchIDBuffer, a4);
}

- (void)useWithRenderEncoder:(id)a3 usage:(unint64_t)a4 stages:(optional<unsigned long>)a5
{
  uint64_t v5;
  unint64_t var1;
  BOOL v10;
  BOOL v12;
  BOOL v14;
  BOOL v16;

  v5 = *(_QWORD *)&a5.var1;
  var1 = a5.var0.var1;
  objc_msgSend(a3, "useResourceInternal:usage:stages:", self->super.super.super._baseObject);
  objc_msgSend(a3, "useResourceInternal:usage:stages:", self->_argumentStorage, a4, var1, v5);
  if ((_BYTE)v5)
    v10 = 1;
  else
    v10 = self->_vertexKernelDrawOrDispatchIDBuffer == 0;
  if (!v10 || (var1 & 1) != 0)
    objc_msgSend(a3, "useResourceInternal:usage:stages:");
  if ((_BYTE)v5)
    v12 = 1;
  else
    v12 = self->_fragmentDrawIDBuffer == 0;
  if (!v12 || (var1 & 2) != 0)
    objc_msgSend(a3, "useResourceInternal:usage:stages:");
  if ((_BYTE)v5)
    v14 = 1;
  else
    v14 = self->_meshDrawIDBuffer == 0;
  if (!v14 || (var1 & 0x10) != 0)
    objc_msgSend(a3, "useResourceInternal:usage:stages:");
  if ((_BYTE)v5)
    v16 = 1;
  else
    v16 = self->_objectDrawIDBuffer == 0;
  if (!v16 || (var1 & 8) != 0)
    objc_msgSend(a3, "useResourceInternal:usage:stages:");
}

- (unint64_t)handleForOffset:(unint64_t)a3
{
  return -[MTLToolsObject gpuResourceID](self->super.super.super._baseObject, "gpuResourceID", a3);
}

- (unint64_t)gpuAddress
{
  return -[MTLToolsObject gpuAddress](self->super.super.super._baseObject, "gpuAddress");
}

- (MTLResourceID)gpuResourceID
{
  return (MTLResourceID)-[MTLBuffer gpuAddress](-[MTLGPUDebugIndirectCommandBuffer internalICBBuffer](self, "internalICBBuffer"), "gpuAddress");
}

- (unint64_t)length
{
  return 0;
}

- (unint64_t)storageMode
{
  return self->_originalResourceOptions >> 4;
}

- (unint64_t)cpuCacheMode
{
  return self->_originalResourceOptions & 0xF;
}

- (unint64_t)hazardTrackingMode
{
  return (self->_originalResourceOptions >> 8) & 3;
}

- (unint64_t)resourceOptions
{
  return self->_originalResourceOptions;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLGPUDebugIndirectCommandBuffer;
  -[MTLToolsResource dealloc](&v3, sel_dealloc);
}

@end
