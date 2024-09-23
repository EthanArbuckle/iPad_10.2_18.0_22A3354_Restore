@implementation MTLIOAccelIndirectCommandBuffer

- (MTLIOAccelIndirectCommandBuffer)initWithBuffer:(id)a3 descriptor:(id)a4 maxCommandCount:(unint64_t)a5
{
  MTLIOAccelIndirectCommandBuffer *v8;
  uint64_t v9;
  void *v10;
  char v11;
  MTLIOAccelBuffer *privateICBuffer;
  uint64_t v13;
  objc_super v15;

  if (a3)
  {
    v15.receiver = self;
    v15.super_class = (Class)MTLIOAccelIndirectCommandBuffer;
    v8 = -[MTLIOAccelResource initWithResource:](&v15, sel_initWithResource_);
    v8->_privateICBuffer = (MTLIOAccelBuffer *)a3;
    v8->_maxCommandCount = a5;
    v8->_privateIndirectRenderEncoder = 0;
    v8->_privateIndirectComputeEncoder = 0;
    v8->_descriptor = (MTLIndirectCommandBufferDescriptor *)objc_msgSend(a4, "copy");
    v8->_internalHeader.size = v8->_maxCommandCount;
    v8->_internalHeader.commandTypes = objc_msgSend(a4, "commandTypes");
    v8->_internalHeader.headerSize = 32;
    v8->_internalHeader.inheritBuffers = objc_msgSend(a4, "inheritBuffers");
    v8->_internalHeader.inheritPipelineState = objc_msgSend(a4, "inheritPipelineState");
    v8->_internalHeader.maxFragmentBufferBindCount = objc_msgSend(a4, "maxFragmentBufferBindCount");
    v8->_internalHeader.maxVertexBufferBindCount = objc_msgSend(a4, "maxVertexBufferBindCount");
    v8->_internalHeader.maxKernelBufferBindCount = objc_msgSend(a4, "maxKernelBufferBindCount");
    v8->_internalHeader.maxObjectBufferBindCount = objc_msgSend(a4, "maxObjectBufferBindCount");
    v8->_internalHeader.maxMeshBufferBindCount = objc_msgSend(a4, "maxMeshBufferBindCount");
    v8->_internalHeader.supportRayTracing = objc_msgSend(a4, "supportRayTracing");
    v8->_internalHeader.supportDynamicAttributeStride = objc_msgSend(a4, "supportDynamicAttributeStride");
    v8->_internalHeader.maxKernelThreadgroupMemoryBindCount = objc_msgSend(a4, "maxKernelThreadgroupMemoryBindCount");
    v8->_internalHeader.maxObjectThreadgroupMemoryBindCount = objc_msgSend(a4, "maxObjectThreadgroupMemoryBindCount");
    v9 = objc_msgSend(a3, "storageMode");
    v10 = 0;
    if (v9 != 2)
      v10 = *(void **)&v8->super._anon_50[32];
    v11 = objc_msgSend(a4, "commandTypes");
    privateICBuffer = v8->_privateICBuffer;
    if ((v11 & 0x60) != 0)
    {
      v8->_privateIndirectComputeEncoder = (MTLIndirectComputeCommandEncoder *)objc_msgSend(v10, "newIndirectComputeCommandEncoderWithBuffer:", privateICBuffer);
      v13 = 2;
    }
    else
    {
      v8->_privateIndirectRenderEncoder = (MTLIndirectRenderCommandEncoder *)objc_msgSend(v10, "newIndirectRenderCommandEncoderWithBuffer:", privateICBuffer);
      v13 = 1;
    }
    v8->_commandBufferType = v13;
  }
  else
  {

    return 0;
  }
  return v8;
}

- (MTLIndirectCommandBufferDescriptor)descriptor
{
  return self->_descriptor;
}

- (void)getHeader:(void *)a3 headerSize:(unint64_t *)a4
{
  if (a3)
    *a3 = &self->_internalHeader;
  if (a4)
    *a4 = 32;
}

- (unint64_t)storageMode
{
  return -[MTLIOAccelResource storageMode](self->_privateICBuffer, "storageMode");
}

- (id)indirectRenderCommandAtIndex:(unint64_t)a3
{
  return (id)-[MTLIndirectRenderCommandEncoder objectAtIndexedSubscript:](self->_privateIndirectRenderEncoder, "objectAtIndexedSubscript:", a3);
}

- (id)indirectComputeCommandAtIndex:(unint64_t)a3
{
  return (id)-[MTLIndirectComputeCommandEncoder objectAtIndexedSubscript:](self->_privateIndirectComputeEncoder, "objectAtIndexedSubscript:", a3);
}

- (void)resetWithRange:(_NSRange)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSUInteger length;
  NSUInteger location;
  MTLIndirectRenderCommandEncoder *privateIndirectRenderEncoder;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  if (a3.location < a3.location + a3.length)
  {
    v15 = v8;
    v16 = v7;
    v17 = v6;
    v18 = v5;
    v19 = v4;
    v20 = v3;
    v21 = v9;
    v22 = v10;
    length = a3.length;
    location = a3.location;
    do
    {
      privateIndirectRenderEncoder = self->_privateIndirectRenderEncoder;
      if (!privateIndirectRenderEncoder)
        privateIndirectRenderEncoder = self->_privateIndirectComputeEncoder;
      objc_msgSend((id)-[MTLIndirectRenderCommandEncoder objectAtIndexedSubscript:](privateIndirectRenderEncoder, "objectAtIndexedSubscript:", location++, v15, v16, v17, v18, v19, v20, v21, v22), "reset");
      --length;
    }
    while (length);
  }
}

- (unint64_t)size
{
  return self->_maxCommandCount;
}

- (unint64_t)commandBufferType
{
  return self->_commandBufferType;
}

- (void)dealloc
{
  MTLIndirectComputeCommandEncoder *privateIndirectComputeEncoder;
  MTLIndirectRenderCommandEncoder *privateIndirectRenderEncoder;
  objc_super v5;

  privateIndirectComputeEncoder = self->_privateIndirectComputeEncoder;
  if (privateIndirectComputeEncoder)

  privateIndirectRenderEncoder = self->_privateIndirectRenderEncoder;
  if (privateIndirectRenderEncoder)

  v5.receiver = self;
  v5.super_class = (Class)MTLIOAccelIndirectCommandBuffer;
  -[MTLIOAccelResource dealloc](&v5, sel_dealloc);
}

- (unint64_t)uniqueIdentifier
{
  return -[MTLIOAccelResource gpuAddress](self->_privateICBuffer, "gpuAddress");
}

- (MTLIOAccelBuffer)privateICBuffer
{
  return self->_privateICBuffer;
}

- (BOOL)isAliasable
{
  return 0;
}

- (void)makeAliasable
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  MTLReportFailure(0, "-[MTLIOAccelIndirectCommandBuffer makeAliasable]", 190, (uint64_t)CFSTR("Cannot call makeAliasable on an IndirectCommandBuffer"), v2, v3, v4, v5, v6);
}

- (unint64_t)setPurgeableState:(unint64_t)a3
{
  return -[MTLIOAccelResource setPurgeableState:](self->_privateICBuffer, "setPurgeableState:", a3);
}

- (BOOL)doesAliasAllResources:(const void *)a3 count:(unint64_t)a4
{
  return -[MTLIOAccelResource doesAliasAllResources:count:](self->_privateICBuffer, "doesAliasAllResources:count:", a3, a4);
}

- (BOOL)doesAliasAnyResources:(const void *)a3 count:(unint64_t)a4
{
  return -[MTLIOAccelResource doesAliasAnyResources:count:](self->_privateICBuffer, "doesAliasAnyResources:count:", a3, a4);
}

- (BOOL)doesAliasResource:(id)a3
{
  return -[MTLIOAccelResource doesAliasResource:](self->_privateICBuffer, "doesAliasResource:", a3);
}

- (BOOL)isComplete
{
  return -[MTLIOAccelResource isComplete](self->_privateICBuffer, "isComplete");
}

- (void)waitUntilComplete
{
  -[MTLIOAccelResource waitUntilComplete](self->_privateICBuffer, "waitUntilComplete");
}

@end
