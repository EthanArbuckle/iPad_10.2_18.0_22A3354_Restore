@implementation MTLDebugIndirectComputeCommand

- (MTLDebugIndirectComputeCommand)initWithBaseObject:(id)a3 descriptor:(id)a4 indexCount:(unint64_t)a5 indirectCommandBuffer:(id)a6
{
  MTLDebugIndirectComputeCommand *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MTLDebugIndirectComputeCommand;
  v9 = -[MTLToolsObject initWithBaseObject:parent:](&v11, sel_initWithBaseObject_parent_, a3, a6);
  if (v9)
  {
    v9->_iCB = (MTLIndirectCommandBufferSPI *)a6;
    v9->_desc = (MTLIndirectCommandBufferDescriptor *)a4;
    v9->_index = a5;
  }
  return v9;
}

- (unint64_t)index
{
  return self->_index;
}

- (MTLIndirectCommandBuffer)indirectCommandBuffer
{
  return self->_iCB;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLDebugIndirectComputeCommand;
  -[MTLToolsObject dealloc](&v3, sel_dealloc);
}

- (void)setComputePipelineState:(id)a3
{
  if (-[MTLIndirectCommandBufferDescriptor inheritPipelineState](self->_desc, "inheritPipelineState"))
    MTLReportFailure();
  if ((objc_msgSend((id)objc_msgSend(a3, "baseObject"), "supportIndirectCommandBuffers") & 1) == 0)
    MTLReportFailure();
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setComputePipelineState:", objc_msgSend(a3, "baseObject"));
}

- (void)setKernelBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  -[MTLDebugIndirectComputeCommand setKernelBuffer:offset:attributeStride:atIndex:](self, "setKernelBuffer:offset:attributeStride:atIndex:", a3, a4, -1, a5);
}

- (void)setKernelBuffer:(id)a3 offset:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6
{
  unint64_t v11;
  NSUInteger v12;

  if (-[MTLIndirectCommandBufferDescriptor maxKernelBufferBindCount](self->_desc, "maxKernelBufferBindCount") <= a6)
  {
    v11 = a6;
    v12 = -[MTLIndirectCommandBufferDescriptor maxKernelBufferBindCount](self->_desc, "maxKernelBufferBindCount");
    MTLReportFailure();
  }
  if (-[MTLIndirectCommandBufferDescriptor inheritBuffers](self->_desc, "inheritBuffers", v11, v12))
    MTLReportFailure();
  if (a5 != -1
    && !-[MTLIndirectCommandBufferDescriptor supportDynamicAttributeStride](self->_desc, "supportDynamicAttributeStride"))
  {
    MTLReportFailure();
  }
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setKernelBuffer:offset:attributeStride:atIndex:", objc_msgSend(a3, "baseObject"), a4, a5, a6);
}

- (void)concurrentDispatchThreadgroups:(id *)a3 threadsPerThreadgroup:(id *)a4
{
  id v7;
  __int128 v8;
  unint64_t v9;
  __int128 v10;
  unint64_t var2;

  if ((-[MTLIndirectCommandBufferDescriptor commandTypes](self->_desc, "commandTypes") & 0x20) == 0)
    MTLReportFailure();
  v7 = -[MTLToolsObject baseObject](self, "baseObject");
  v10 = *(_OWORD *)&a3->var0;
  var2 = a3->var2;
  v8 = *(_OWORD *)&a4->var0;
  v9 = a4->var2;
  objc_msgSend(v7, "concurrentDispatchThreadgroups:threadsPerThreadgroup:", &v10, &v8);
}

- (void)concurrentDispatchThreads:(id *)a3 threadsPerThreadgroup:(id *)a4
{
  id v7;
  __int128 v8;
  unint64_t v9;
  __int128 v10;
  unint64_t var2;

  if ((-[MTLIndirectCommandBufferDescriptor commandTypes](self->_desc, "commandTypes") & 0x40) == 0)
    MTLReportFailure();
  v7 = -[MTLToolsObject baseObject](self, "baseObject");
  v10 = *(_OWORD *)&a3->var0;
  var2 = a3->var2;
  v8 = *(_OWORD *)&a4->var0;
  v9 = a4->var2;
  objc_msgSend(v7, "concurrentDispatchThreads:threadsPerThreadgroup:", &v10, &v8);
}

- (void)setThreadgroupMemoryLength:(unint64_t)a3 atIndex:(unint64_t)a4
{
  unint64_t v7;
  NSUInteger v8;
  objc_super v9;

  if (-[MTLIndirectCommandBufferDescriptor maxKernelThreadgroupMemoryBindCount](self->_desc, "maxKernelThreadgroupMemoryBindCount") <= a4)
  {
    v7 = a4;
    v8 = -[MTLIndirectCommandBufferDescriptor maxKernelThreadgroupMemoryBindCount](self->_desc, "maxKernelThreadgroupMemoryBindCount");
    MTLReportFailure();
  }
  v9.receiver = self;
  v9.super_class = (Class)MTLDebugIndirectComputeCommand;
  -[MTLToolsIndirectComputeCommand setThreadgroupMemoryLength:atIndex:](&v9, sel_setThreadgroupMemoryLength_atIndex_, a3, a4, v7, v8);
}

@end
