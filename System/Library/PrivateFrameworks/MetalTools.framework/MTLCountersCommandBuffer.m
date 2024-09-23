@implementation MTLCountersCommandBuffer

- (MTLCountersCommandBuffer)initWithCommandBuffer:(id)a3 commandQueue:(id)a4 descriptor:(id)a5
{
  unsigned __int8 v6;
  MTLCountersCommandBuffer *v7;
  id v9;
  id v10;
  int v11;
  int v12;
  char *v13;
  MTLCountersCommandBuffer *v14;
  objc_super v15;

  if ((v6 & 1) == 0)
  {
    v14 = self;
    v9 = a5;
    v10 = a4;
    a4 = v10;
    a5 = v9;
    v12 = v11;
    self = v14;
    if (v12)
    {
      v13 = getenv("MTL_XML_DUMP_EVENTS");
      if (!v13)
        v13 = "1";
      -[MTLCountersCommandBuffer initWithCommandBuffer:commandQueue:descriptor:]::dumpEvents = strtol(v13, 0, 0) != 0;
      self = v14;
      a4 = v10;
      a5 = v9;
    }
  }
  v15.receiver = self;
  v15.super_class = (Class)MTLCountersCommandBuffer;
  v7 = -[MTLToolsCommandBuffer initWithCommandBuffer:parent:descriptor:](&v15, sel_initWithCommandBuffer_parent_descriptor_, a3, a4, a5);
  if (v7)
  {
    v7->_traceBuffer = (MTLCountersTraceCommandBuffer *)-[MTLCountersTraceCommandBuffer init:]([MTLCountersTraceCommandBuffer alloc], "init:", objc_msgSend(a3, "retainedReferences"));
    if (-[MTLCountersCommandBuffer initWithCommandBuffer:commandQueue:descriptor:]::dumpEvents)
      -[MTLToolsCommandBuffer setProfilingEnabled:](v7, "setProfilingEnabled:", 1);
  }
  return v7;
}

- (void)dealloc
{
  MTLCountersTraceCommandBuffer *traceBuffer;
  uint64_t v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  NSObject *global_queue;
  objc_super v15;
  _QWORD block[8];

  traceBuffer = self->_traceBuffer;
  v4 = *(_QWORD *)&self->MTLToolsCommandBuffer_opaque[8];
  v5 = (void *)-[NSDictionary mutableCopy](-[MTLToolsCommandBuffer profilingResults](self, "profilingResults"), "mutableCopy");
  v6 = (void *)MEMORY[0x24BDD16E0];
  -[MTLToolsCommandBuffer kernelStartTime](self, "kernelStartTime");
  objc_msgSend(v5, "setObject:forKey:", objc_msgSend(v6, "numberWithUnsignedLongLong:", (unint64_t)(v7 * 1000000000.0)), CFSTR("MTLCommandBufferKernelStartTime"));
  v8 = (void *)MEMORY[0x24BDD16E0];
  -[MTLToolsCommandBuffer kernelEndTime](self, "kernelEndTime");
  objc_msgSend(v5, "setObject:forKey:", objc_msgSend(v8, "numberWithUnsignedLongLong:", (unint64_t)(v9 * 1000000000.0)), CFSTR("MTLCommandBufferKernelEndTime"));
  v10 = (void *)MEMORY[0x24BDD16E0];
  -[MTLToolsCommandBuffer GPUStartTime](self, "GPUStartTime");
  objc_msgSend(v5, "setObject:forKey:", objc_msgSend(v10, "numberWithUnsignedLongLong:", (unint64_t)(v11 * 1000000000.0)), CFSTR("MTLCommandBufferGPUStartTime"));
  v12 = (void *)MEMORY[0x24BDD16E0];
  -[MTLToolsCommandBuffer GPUEndTime](self, "GPUEndTime");
  objc_msgSend(v5, "setObject:forKey:", objc_msgSend(v12, "numberWithUnsignedLongLong:", (unint64_t)(v13 * 1000000000.0)), CFSTR("MTLCommandBufferGPUEndTime"));
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__MTLCountersCommandBuffer_dealloc__block_invoke;
  block[3] = &unk_24F7958D8;
  block[4] = traceBuffer;
  block[5] = v4;
  block[6] = v5;
  block[7] = self;
  dispatch_async(global_queue, block);

  v15.receiver = self;
  v15.super_class = (Class)MTLCountersCommandBuffer;
  -[MTLToolsCommandBuffer dealloc](&v15, sel_dealloc);
}

uint64_t __35__MTLCountersCommandBuffer_dealloc__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "saveCommandBuffer:queue:profilingResults:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (id)blitCommandEncoder
{
  void *v3;
  uint64_t v4;
  MTLCountersBlitCommandEncoder *v5;

  v3 = (void *)MEMORY[0x22E309364](self, a2);
  v4 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "blitCommandEncoder");
  if (v4)
  {
    v5 = -[MTLCountersBlitCommandEncoder initWithBlitCommandEncoder:commandBuffer:descriptor:]([MTLCountersBlitCommandEncoder alloc], "initWithBlitCommandEncoder:commandBuffer:descriptor:", v4, self, 0);
    objc_autoreleasePoolPop(v3);
    return v5;
  }
  else
  {
    objc_autoreleasePoolPop(v3);
    return 0;
  }
}

- (id)renderCommandEncoderWithDescriptor:(id)a3
{
  void *v5;
  uint64_t v6;
  MTLCountersRenderCommandEncoder *v7;

  v5 = (void *)MEMORY[0x22E309364](self, a2);
  v6 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "renderCommandEncoderWithDescriptor:", a3);
  if (v6)
  {
    v7 = -[MTLCountersRenderCommandEncoder initWithRenderCommandEncoder:parent:descriptor:]([MTLCountersRenderCommandEncoder alloc], "initWithRenderCommandEncoder:parent:descriptor:", v6, self, a3);
    objc_autoreleasePoolPop(v5);
    return v7;
  }
  else
  {
    objc_autoreleasePoolPop(v5);
    return 0;
  }
}

- (id)computeCommandEncoder
{
  void *v3;
  uint64_t v4;
  MTLCountersComputeCommandEncoder *v5;

  v3 = (void *)MEMORY[0x22E309364](self, a2);
  v4 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "computeCommandEncoder");
  if (v4)
  {
    v5 = -[MTLCountersComputeCommandEncoder initWithComputeCommandEncoder:commandBuffer:descriptor:]([MTLCountersComputeCommandEncoder alloc], "initWithComputeCommandEncoder:commandBuffer:descriptor:", v4, self, 0);
    objc_autoreleasePoolPop(v3);
    return v5;
  }
  else
  {
    objc_autoreleasePoolPop(v3);
    return 0;
  }
}

- (id)computeCommandEncoderWithDescriptor:(id)a3
{
  void *v5;
  uint64_t v6;
  MTLCountersComputeCommandEncoder *v7;

  v5 = (void *)MEMORY[0x22E309364](self, a2);
  v6 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "computeCommandEncoderWithDescriptor:", a3);
  if (v6)
  {
    v7 = -[MTLCountersComputeCommandEncoder initWithComputeCommandEncoder:commandBuffer:descriptor:]([MTLCountersComputeCommandEncoder alloc], "initWithComputeCommandEncoder:commandBuffer:descriptor:", v6, self, a3);
    objc_autoreleasePoolPop(v5);
    return v7;
  }
  else
  {
    objc_autoreleasePoolPop(v5);
    return 0;
  }
}

- (id)blitCommandEncoderWithDescriptor:(id)a3
{
  void *v5;
  uint64_t v6;
  MTLCountersBlitCommandEncoder *v7;

  v5 = (void *)MEMORY[0x22E309364](self, a2);
  v6 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "blitCommandEncoderWithDescriptor:", a3);
  if (v6)
  {
    v7 = -[MTLCountersBlitCommandEncoder initWithBlitCommandEncoder:commandBuffer:descriptor:]([MTLCountersBlitCommandEncoder alloc], "initWithBlitCommandEncoder:commandBuffer:descriptor:", v6, self, a3);
    objc_autoreleasePoolPop(v5);
    return v7;
  }
  else
  {
    objc_autoreleasePoolPop(v5);
    return 0;
  }
}

- (id)computeCommandEncoderWithDispatchType:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  MTLCountersComputeCommandEncoder *v7;

  v5 = (void *)MEMORY[0x22E309364](self, a2);
  v6 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "computeCommandEncoderWithDispatchType:", a3);
  if (v6)
  {
    v7 = -[MTLCountersComputeCommandEncoder initWithComputeCommandEncoder:commandBuffer:descriptor:]([MTLCountersComputeCommandEncoder alloc], "initWithComputeCommandEncoder:commandBuffer:descriptor:", v6, self, 0);
    objc_autoreleasePoolPop(v5);
    return v7;
  }
  else
  {
    objc_autoreleasePoolPop(v5);
    return 0;
  }
}

- (id)parallelRenderCommandEncoderWithDescriptor:(id)a3
{
  void *v5;
  uint64_t v6;
  MTLCountersParallelRenderCommandEncoder *v7;

  v5 = (void *)MEMORY[0x22E309364](self, a2);
  v6 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "parallelRenderCommandEncoderWithDescriptor:", a3);
  if (v6)
  {
    v7 = -[MTLCountersParallelRenderCommandEncoder initWithBaseRenderPass:commandBuffer:descriptor:]([MTLCountersParallelRenderCommandEncoder alloc], "initWithBaseRenderPass:commandBuffer:descriptor:", v6, self, a3);
    objc_autoreleasePoolPop(v5);
    return v7;
  }
  else
  {
    objc_autoreleasePoolPop(v5);
    return 0;
  }
}

- (id)sampledRenderCommandEncoderWithDescriptor:(id)a3 programInfoBuffer:(id *)a4 capacity:(unint64_t)a5
{
  void *v9;
  uint64_t v10;
  MTLCountersRenderCommandEncoder *v11;

  v9 = (void *)MEMORY[0x22E309364](self, a2);
  v10 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "sampledRenderCommandEncoderWithDescriptor:programInfoBuffer:capacity:", a3, a4, a5);
  if (v10)
  {
    v11 = -[MTLCountersRenderCommandEncoder initWithRenderCommandEncoder:parent:descriptor:]([MTLCountersRenderCommandEncoder alloc], "initWithRenderCommandEncoder:parent:descriptor:", v10, self, a3);
    objc_autoreleasePoolPop(v9);
    return v11;
  }
  else
  {
    objc_autoreleasePoolPop(v9);
    return 0;
  }
}

- (id)sampledComputeCommandEncoderWithProgramInfoBuffer:(id *)a3 capacity:(unint64_t)a4
{
  void *v7;
  uint64_t v8;
  MTLCountersComputeCommandEncoder *v9;

  v7 = (void *)MEMORY[0x22E309364](self, a2);
  v8 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "sampledComputeCommandEncoderWithProgramInfoBuffer:capacity:", a3, a4);
  if (v8)
  {
    v9 = -[MTLCountersComputeCommandEncoder initWithComputeCommandEncoder:commandBuffer:descriptor:]([MTLCountersComputeCommandEncoder alloc], "initWithComputeCommandEncoder:commandBuffer:descriptor:", v8, self, 0);
    objc_autoreleasePoolPop(v7);
    return v9;
  }
  else
  {
    objc_autoreleasePoolPop(v7);
    return 0;
  }
}

- (id)sampledComputeCommandEncoderWithDispatchType:(unint64_t)a3 programInfoBuffer:(id *)a4 capacity:(unint64_t)a5
{
  void *v9;
  uint64_t v10;
  MTLCountersComputeCommandEncoder *v11;

  v9 = (void *)MEMORY[0x22E309364](self, a2);
  v10 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "sampledComputeCommandEncoderWithDispatchType:programInfoBuffer:capacity:", a3, a4, a5);
  if (v10)
  {
    v11 = -[MTLCountersComputeCommandEncoder initWithComputeCommandEncoder:commandBuffer:descriptor:]([MTLCountersComputeCommandEncoder alloc], "initWithComputeCommandEncoder:commandBuffer:descriptor:", v10, self, 0);
    objc_autoreleasePoolPop(v9);
    return v11;
  }
  else
  {
    objc_autoreleasePoolPop(v9);
    return 0;
  }
}

- (id)sampledComputeCommandEncoderWithDescriptor:(id)a3 programInfoBuffer:(id *)a4 capacity:(unint64_t)a5
{
  void *v9;
  uint64_t v10;
  MTLCountersComputeCommandEncoder *v11;

  v9 = (void *)MEMORY[0x22E309364](self, a2);
  v10 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "sampledComputeCommandEncoderWithDescriptor:programInfoBuffer:capacity:", a3, a4, a5);
  if (v10)
  {
    v11 = -[MTLCountersComputeCommandEncoder initWithComputeCommandEncoder:commandBuffer:descriptor:]([MTLCountersComputeCommandEncoder alloc], "initWithComputeCommandEncoder:commandBuffer:descriptor:", v10, self, a3);
    objc_autoreleasePoolPop(v9);
    return v11;
  }
  else
  {
    objc_autoreleasePoolPop(v9);
    return 0;
  }
}

- (id)resourceStateCommandEncoderWithDescriptor:(id)a3
{
  void *v5;
  uint64_t v6;
  MTLCountersResourceStateCommandEncoder *v7;

  v5 = (void *)MEMORY[0x22E309364](self, a2);
  v6 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "resourceStateCommandEncoderWithDescriptor:", a3);
  if (v6)
  {
    v7 = -[MTLCountersResourceStateCommandEncoder initWithResourceStateCommandEncoder:commandBuffer:descriptor:]([MTLCountersResourceStateCommandEncoder alloc], "initWithResourceStateCommandEncoder:commandBuffer:descriptor:", v6, self, a3);
    objc_autoreleasePoolPop(v5);
    return v7;
  }
  else
  {
    objc_autoreleasePoolPop(v5);
    return 0;
  }
}

- (id)resourceStateCommandEncoder
{
  void *v3;
  uint64_t v4;
  MTLCountersResourceStateCommandEncoder *v5;

  v3 = (void *)MEMORY[0x22E309364](self, a2);
  v4 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "resourceStateCommandEncoder");
  if (v4)
  {
    v5 = -[MTLCountersResourceStateCommandEncoder initWithResourceStateCommandEncoder:commandBuffer:descriptor:]([MTLCountersResourceStateCommandEncoder alloc], "initWithResourceStateCommandEncoder:commandBuffer:descriptor:", v4, self, 0);
    objc_autoreleasePoolPop(v3);
    return v5;
  }
  else
  {
    objc_autoreleasePoolPop(v3);
    return 0;
  }
}

- (void)addPurgedResource:(id)a3
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "addPurgedResource:", a3);
}

- (void)addPurgedHeap:(id)a3
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "addPurgedHeap:", a3);
}

- (void)waitUntilScheduled
{
  -[MTLCountersTraceCommandBuffer waitUntilScheduled](self->_traceBuffer, "waitUntilScheduled");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "waitUntilScheduled");
}

- (void)waitUntilCompleted
{
  -[MTLCountersTraceCommandBuffer waitUntilCompleted](self->_traceBuffer, "waitUntilCompleted");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "waitUntilCompleted");
}

- (void)presentDrawable:(id)a3
{
  -[MTLCountersTraceCommandBuffer presentDrawable:](self->_traceBuffer, "presentDrawable:");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "presentDrawable:", a3);
}

- (void)presentDrawable:(id)a3 atTime:(double)a4
{
  -[MTLCountersTraceCommandBuffer presentDrawable:atTime:](self->_traceBuffer, "presentDrawable:atTime:");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "presentDrawable:atTime:", a3, a4);
}

- (MTLCountersTraceCommandBuffer)traceBuffer
{
  return self->_traceBuffer;
}

@end
