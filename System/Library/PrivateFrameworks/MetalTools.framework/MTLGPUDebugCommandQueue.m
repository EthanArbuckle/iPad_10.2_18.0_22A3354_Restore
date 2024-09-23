@implementation MTLGPUDebugCommandQueue

- (MTLGPUDebugCommandQueue)initWithCommandQueue:(id)a3 device:(id)a4
{
  MTLGPUDebugCommandQueue *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTLGPUDebugCommandQueue;
  result = -[MTLToolsCommandQueue initWithBaseObject:parent:](&v6, sel_initWithBaseObject_parent_, a3);
  if (result)
    result->_deviceOptions = (GPUDebugDeviceOptions *)((char *)a4 + 292);
  return result;
}

- (id)commandBuffer
{
  return -[MTLGPUDebugCommandBuffer initWithCommandBuffer:commandQueue:descriptor:]([MTLGPUDebugCommandBuffer alloc], "initWithCommandBuffer:commandQueue:descriptor:", objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "commandBuffer"), self, 0);
}

- (id)commandBufferWithDescriptor:(id)a3
{
  void *v5;
  id v6;
  uint64_t v7;
  MTLGPUDebugCommandBuffer *v8;

  v5 = (void *)MEMORY[0x22E309364](self, a2);
  v6 = -[MTLToolsDevice unwrapMTLCommandBufferDescriptor:alwaysCopy:](self->super.super._device, "unwrapMTLCommandBufferDescriptor:alwaysCopy:", a3, 1);
  objc_msgSend(v6, "setRetainedReferences:", 1);
  v7 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "commandBufferWithDescriptor:", v6);
  if (v7)
  {
    v8 = -[MTLGPUDebugCommandBuffer initWithCommandBuffer:commandQueue:descriptor:]([MTLGPUDebugCommandBuffer alloc], "initWithCommandBuffer:commandQueue:descriptor:", v7, self, a3);
    objc_autoreleasePoolPop(v5);
    return v8;
  }
  else
  {
    objc_autoreleasePoolPop(v5);
    return 0;
  }
}

- (NSString)tracePath
{
  return self->_tracePath;
}

@end
