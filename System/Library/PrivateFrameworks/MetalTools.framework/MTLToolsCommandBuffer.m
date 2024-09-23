@implementation MTLToolsCommandBuffer

- (MTLToolsCommandBuffer)initWithBaseObject:(id)a3 parent:(id)a4
{
  return -[MTLToolsCommandBuffer initWithCommandBuffer:parent:descriptor:](self, "initWithCommandBuffer:parent:descriptor:", a3, a4, 0);
}

- (MTLToolsCommandBuffer)initWithCommandBuffer:(id)a3 parent:(id)a4 descriptor:(id)a5
{
  MTLToolsCommandBuffer *v6;
  MTLToolsCommandBuffer *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MTLToolsCommandBuffer;
  v6 = -[MTLToolsObject initWithBaseObject:parent:](&v9, sel_initWithBaseObject_parent_, a3, a4);
  v7 = v6;
  if (v6)
  {
    if (-[MTLToolsCommandBuffer retainedReferences](v6, "retainedReferences"))
    {
      *((_QWORD *)v7 + 17) = objc_alloc_init(MEMORY[0x24BDBCEF0]);
      *((_DWORD *)v7 + 10) = 0;
    }
    *((_DWORD *)v7 + 12) = 0;
    *((_QWORD *)v7 + 14) = objc_msgSend(*((id *)v7 + 1), "snapshotPerfSampleHandlerAndStatEnabled:forCommandBuffer:", (char *)v7 + 120, -[MTLToolsObject originalObject](v7, "originalObject"));
    *((_QWORD *)v7 + 16) = (id)objc_msgSend(a5, "deadlineProfile");
  }
  return v7;
}

- (void)dealloc
{
  const void *v3;
  objc_super v4;

  v3 = (const void *)*((_QWORD *)self + 14);
  if (v3)
    _Block_release(v3);
  if (!*((_BYTE *)self + 104))
  {
    -[MTLToolsCommandBuffer invokeScheduledHandlers](self, "invokeScheduledHandlers");
    -[MTLToolsCommandBuffer invokeCompletedHandlers](self, "invokeCompletedHandlers");
  }

  v4.receiver = self;
  v4.super_class = (Class)MTLToolsCommandBuffer;
  -[MTLToolsObject dealloc](&v4, sel_dealloc);
}

- (void)invokeScheduledHandlers
{
  void (***v3)(_QWORD, _QWORD);
  void (***v4)(_QWORD, _QWORD);
  void (**v5)(_QWORD, _QWORD);

  -[MTLToolsCommandBuffer preScheduledHandlers](self, "preScheduledHandlers");
  os_unfair_lock_lock((os_unfair_lock_t)self + 12);
  v3 = (void (***)(_QWORD, _QWORD))*((_QWORD *)self + 7);
  v4 = (void (***)(_QWORD, _QWORD))*((_QWORD *)self + 8);
  if (v3 != v4)
  {
    do
    {
      v5 = *v3++;
      ((void (**)(_QWORD, MTLToolsCommandBuffer *))v5)[2](v5, self);
      _Block_release(v5);
    }
    while (v3 != v4);
    v3 = (void (***)(_QWORD, _QWORD))*((_QWORD *)self + 7);
  }
  *((_QWORD *)self + 8) = v3;
  os_unfair_lock_unlock((os_unfair_lock_t)self + 12);
  -[MTLToolsCommandBuffer postScheduledHandlers](self, "postScheduledHandlers");
}

- (void)invokeCompletedHandlers
{
  void (***v3)(_QWORD, _QWORD);
  void (***v4)(_QWORD, _QWORD);
  void (**v5)(_QWORD, _QWORD);

  -[MTLToolsCommandBuffer preCompletionHandlers](self, "preCompletionHandlers");
  os_unfair_lock_lock((os_unfair_lock_t)self + 12);
  v3 = (void (***)(_QWORD, _QWORD))*((_QWORD *)self + 10);
  v4 = (void (***)(_QWORD, _QWORD))*((_QWORD *)self + 11);
  if (v3 != v4)
  {
    do
    {
      v5 = *v3++;
      ((void (**)(_QWORD, MTLToolsCommandBuffer *))v5)[2](v5, self);
      _Block_release(v5);
    }
    while (v3 != v4);
    v3 = (void (***)(_QWORD, _QWORD))*((_QWORD *)self + 10);
  }
  *((_QWORD *)self + 11) = v3;
  os_unfair_lock_unlock((os_unfair_lock_t)self + 12);
  -[MTLToolsCommandBuffer postCompletionHandlers](self, "postCompletionHandlers");
}

- (BOOL)addRetainedObject:(id)a3
{
  void *v4;
  BOOL v5;
  BOOL v6;
  os_unfair_lock_s *v8;

  v4 = (void *)*((_QWORD *)self + 17);
  if (a3)
    v5 = v4 == 0;
  else
    v5 = 1;
  v6 = !v5;
  if (!v5)
  {
    if (*((_BYTE *)self + 44))
      v8 = (os_unfair_lock_s *)((char *)self + 40);
    else
      v8 = 0;
    if (*((_BYTE *)self + 44))
    {
      os_unfair_lock_lock((os_unfair_lock_t)self + 10);
      v4 = (void *)*((_QWORD *)self + 17);
    }
    objc_msgSend(v4, "addObject:", a3);
    if (v8)
      os_unfair_lock_unlock(v8);
  }
  return v6;
}

- (void)clearRetainedObjects
{
  void *v3;
  os_unfair_lock_s *v4;

  v3 = (void *)*((_QWORD *)self + 17);
  if (v3)
  {
    if (*((_BYTE *)self + 44))
      v4 = (os_unfair_lock_s *)((char *)self + 40);
    else
      v4 = 0;
    if (*((_BYTE *)self + 44))
    {
      os_unfair_lock_lock((os_unfair_lock_t)self + 10);
      v3 = (void *)*((_QWORD *)self + 17);
    }
    objc_msgSend(v3, "removeAllObjects");
    if (v4)
      os_unfair_lock_unlock(v4);
  }
}

- (void)preCompletionHandlers
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;

  if (*((_BYTE *)self + 120) && -[MTLToolsCommandBuffer status](self, "status") >= 2)
  {
    v7 = 0;
    do
    {
      v3 = *((_QWORD *)self + 1);
      v6 = 0;
      v4 = (void *)objc_msgSend(*(id *)(v3 + 40), "extractDataAndNumSamples:forRequester:isLast:", &v6, *((_QWORD *)self + 2), &v7);
      v5 = *((_QWORD *)self + 14);
      if (v5)
        (*(void (**)(uint64_t, MTLToolsCommandBuffer *, void *, uint64_t))(v5 + 16))(v5, self, v4, v6);

    }
    while (!v7);
  }
}

- (void)preScheduledHandlers
{
  *((_BYTE *)self + 104) = 1;
}

- (void)preCommit
{
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];
  _QWORD v7[5];

  *((_DWORD *)self + 9) |= 1u;
  v3 = (void *)*((_QWORD *)self + 2);
  v4 = MEMORY[0x24BDAC760];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __34__MTLToolsCommandBuffer_preCommit__block_invoke;
  v7[3] = &unk_24F794518;
  v7[4] = self;
  objc_msgSend(v3, "addScheduledHandler:", v7);
  v5 = (void *)*((_QWORD *)self + 2);
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __34__MTLToolsCommandBuffer_preCommit__block_invoke_2;
  v6[3] = &unk_24F794518;
  v6[4] = self;
  objc_msgSend(v5, "addCompletedHandler:", v6);
}

uint64_t __34__MTLToolsCommandBuffer_preCommit__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invokeScheduledHandlers");
}

uint64_t __34__MTLToolsCommandBuffer_preCommit__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invokeCompletedHandlers");
}

- (void)commit
{
  -[MTLToolsCommandBuffer preCommit](self, "preCommit");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "commit");
}

- (void)commitAndHold
{
  -[MTLToolsCommandBuffer preCommit](self, "preCommit");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "commitAndHold");
}

- (BOOL)commitAndWaitUntilSubmitted
{
  -[MTLToolsCommandBuffer preCommit](self, "preCommit");
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "commitAndWaitUntilSubmitted");
}

- (id)debugCommandEncoder
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "debugCommandEncoder");
}

- (MTLLogContainer)logs
{
  return (MTLLogContainer *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "logs");
}

- (void)setLogs:(id)a3
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setLogs:", a3);
}

- (MTLCommandQueue)commandQueue
{
  return (MTLCommandQueue *)*((_QWORD *)self + 1);
}

- (BOOL)retainedReferences
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "retainedReferences");
}

- (double)GPUStartTime
{
  double result;

  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "GPUStartTime");
  return result;
}

- (double)GPUEndTime
{
  double result;

  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "GPUEndTime");
  return result;
}

- (unint64_t)globalTraceObjectID
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "globalTraceObjectID");
}

- (NSString)label
{
  return (NSString *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "label");
}

- (void)setLabel:(id)a3
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setLabel:", a3);
}

- (void)enqueue
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "enqueue");
}

- (void)presentDrawable:(id)a3
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "presentDrawable:", a3);
}

- (void)presentDrawable:(id)a3 atTime:(double)a4
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "presentDrawable:atTime:", a3, a4);
}

- (void)presentDrawable:(id)a3 afterMinimumDuration:(double)a4
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "presentDrawable:afterMinimumDuration:", a3, a4);
}

- (void)presentDrawable:(id)a3 options:(id)a4
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "presentDrawable:options:", a3, a4);
}

- (void)waitUntilScheduled
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "waitUntilScheduled");
}

- (void)waitUntilCompleted
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "waitUntilCompleted");
}

- (unint64_t)status
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "status");
}

- (NSError)error
{
  return (NSError *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "error");
}

- (id)blitCommandEncoder
{
  void *v3;
  uint64_t v4;
  MTLToolsBlitCommandEncoder *v5;

  v3 = (void *)MEMORY[0x22E309364](self, a2);
  v4 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "blitCommandEncoder");
  if (v4)
    v5 = -[MTLToolsBlitCommandEncoder initWithBaseObject:parent:]([MTLToolsBlitCommandEncoder alloc], "initWithBaseObject:parent:", v4, self);
  else
    v5 = 0;
  objc_autoreleasePoolPop(v3);
  return v5;
}

- (id)computeCommandEncoder
{
  void *v3;
  uint64_t v4;
  MTLToolsComputeCommandEncoder *v5;

  v3 = (void *)MEMORY[0x22E309364](self, a2);
  v4 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "computeCommandEncoder");
  if (v4)
    v5 = -[MTLToolsComputeCommandEncoder initWithBaseObject:parent:]([MTLToolsComputeCommandEncoder alloc], "initWithBaseObject:parent:", v4, self);
  else
    v5 = 0;
  objc_autoreleasePoolPop(v3);
  return v5;
}

- (id)accelerationStructureCommandEncoder
{
  void *v3;
  uint64_t v4;
  MTLToolsAccelerationStructureCommandEncoder *v5;

  v3 = (void *)MEMORY[0x22E309364](self, a2);
  v4 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "accelerationStructureCommandEncoder");
  if (v4)
    v5 = -[MTLToolsCommandEncoder initWithBaseObject:parent:]([MTLToolsAccelerationStructureCommandEncoder alloc], "initWithBaseObject:parent:", v4, self);
  else
    v5 = 0;
  objc_autoreleasePoolPop(v3);
  return v5;
}

- (id)resourceStateCommandEncoder
{
  void *v3;
  uint64_t v4;
  MTLToolsResourceStateCommandEncoder *v5;

  v3 = (void *)MEMORY[0x22E309364](self, a2);
  v4 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "resourceStateCommandEncoder");
  if (v4)
    v5 = -[MTLToolsResourceStateCommandEncoder initWithBaseObject:parent:]([MTLToolsResourceStateCommandEncoder alloc], "initWithBaseObject:parent:", v4, self);
  else
    v5 = 0;
  objc_autoreleasePoolPop(v3);
  return v5;
}

- (double)kernelStartTime
{
  double result;

  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "kernelStartTime");
  return result;
}

- (double)kernelEndTime
{
  double result;

  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "kernelEndTime");
  return result;
}

- (void)debugBufferContentsWithLength:(unint64_t *)a3
{
  return (void *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "debugBufferContentsWithLength:", a3);
}

- (void)pushDebugGroup:(id)a3
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "pushDebugGroup:", a3);
}

- (void)popDebugGroup
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "popDebugGroup");
}

- (void)encodeDashboardTagForResourceGroup:(id)a3
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "encodeDashboardTagForResourceGroup:", objc_msgSend(a3, "baseObject"));
}

- (void)encodeDashboardFinalizeForResourceGroup:(id)a3 dashboard:(unint64_t)a4 value:(unint64_t)a5 forIndex:(unint64_t)a6
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "encodeDashboardFinalizeForResourceGroup:dashboard:value:forIndex:", objc_msgSend(a3, "baseObject"), a4, a5, a6);
}

- (void)encodeDashboardFinalizeForResourceGroup:(id)a3 dashboard:(unint64_t)a4 values:(const unint64_t *)a5 indices:(const unint64_t *)a6 count:(unint64_t)a7
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "encodeDashboardFinalizeForResourceGroup:dashboard:values:indices:count:", objc_msgSend(a3, "baseObject"), a4, a5, a6, a7);
}

- (id)unwrapMTLRenderPassDescriptor:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v4 = (void *)objc_msgSend(a3, "copy");
  objc_msgSend(v4, "setVisibilityResultBuffer:", objc_msgSend((id)objc_msgSend(v4, "visibilityResultBuffer"), "baseObject"));
  v5 = objc_msgSend(a3, "_descriptorPrivate");
  v6 = 0;
  v7 = *(void **)v5;
  do
  {
    v8 = (void *)objc_msgSend(v7, "_descriptorAtIndex:", v6);
    if (v8)
    {
      v9 = v8;
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(v4, "colorAttachments"), "objectAtIndexedSubscript:", v6), "setTexture:", objc_msgSend((id)objc_msgSend(v8, "texture"), "baseObject"));
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(v4, "colorAttachments"), "objectAtIndexedSubscript:", v6), "setResolveTexture:", objc_msgSend((id)objc_msgSend(v9, "resolveTexture"), "baseObject"));
    }
    ++v6;
  }
  while (v6 != 8);
  v10 = (void *)objc_msgSend(v7, "_descriptorAtIndex:", 8);
  if (v10)
  {
    v11 = v10;
    objc_msgSend((id)objc_msgSend(v4, "depthAttachment"), "setTexture:", objc_msgSend((id)objc_msgSend(v10, "texture"), "baseObject"));
    objc_msgSend((id)objc_msgSend(v4, "depthAttachment"), "setResolveTexture:", objc_msgSend((id)objc_msgSend(v11, "resolveTexture"), "baseObject"));
  }
  v12 = (void *)objc_msgSend(v7, "_descriptorAtIndex:", 9);
  if (v12)
  {
    v13 = v12;
    objc_msgSend((id)objc_msgSend(v4, "stencilAttachment"), "setTexture:", objc_msgSend((id)objc_msgSend(v12, "texture"), "baseObject"));
    objc_msgSend((id)objc_msgSend(v4, "stencilAttachment"), "setResolveTexture:", objc_msgSend((id)objc_msgSend(v13, "resolveTexture"), "baseObject"));
  }
  v14 = 0;
  v15 = *(void **)(v5 + 144);
  do
  {
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(v4, "sampleBufferAttachments"), "objectAtIndexedSubscript:", v14), "setSampleBuffer:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v15, "objectAtIndexedSubscript:", v14), "sampleBuffer"), "baseObject"));
    ++v14;
  }
  while (v14 != 4);
  objc_msgSend(v4, "setRasterizationRateMap:", objc_msgSend(*(id *)(v5 + 136), "baseObject"));
  return v4;
}

+ (id)unwrapMTLComputePassDescriptorInternal:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v4 = (void *)objc_msgSend(a3, "copy");
  v5 = objc_msgSend(a3, "_descriptorPrivate");
  v6 = 0;
  v7 = *(void **)(v5 + 8);
  do
  {
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(v4, "sampleBufferAttachments"), "objectAtIndexedSubscript:", v6), "setSampleBuffer:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v7, "objectAtIndexedSubscript:", v6), "sampleBuffer"), "baseObject"));
    ++v6;
  }
  while (v6 != 4);
  return v4;
}

- (id)unwrapMTLComputePassDescriptor:(id)a3
{
  return +[MTLToolsCommandBuffer unwrapMTLComputePassDescriptorInternal:](MTLToolsCommandBuffer, "unwrapMTLComputePassDescriptorInternal:", a3);
}

- (id)unwrapMTLBlitPassDescriptor:(id)a3
{
  void *v4;
  void **v5;
  uint64_t v6;
  void *v7;

  v4 = (void *)objc_msgSend(a3, "copy");
  v5 = (void **)objc_msgSend(a3, "_descriptorPrivate");
  v6 = 0;
  v7 = *v5;
  do
  {
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(v4, "sampleBufferAttachments"), "objectAtIndexedSubscript:", v6), "setSampleBuffer:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v7, "objectAtIndexedSubscript:", v6), "sampleBuffer"), "baseObject"));
    ++v6;
  }
  while (v6 != 4);
  return v4;
}

- (id)unwrapMTLResourceStatePassDescriptor:(id)a3
{
  void *v4;
  void **v5;
  uint64_t v6;
  void *v7;

  v4 = (void *)objc_msgSend(a3, "copy");
  v5 = (void **)objc_msgSend(a3, "_descriptorPrivate");
  v6 = 0;
  v7 = *v5;
  do
  {
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(v4, "sampleBufferAttachments"), "objectAtIndexedSubscript:", v6), "setSampleBuffer:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v7, "objectAtIndexedSubscript:", v6), "sampleBuffer"), "baseObject"));
    ++v6;
  }
  while (v6 != 4);
  return v4;
}

- (void)addScheduledHandler:(id)a3
{
  void *v5;
  os_unfair_lock_s *v6;
  void **v7;
  _QWORD *v8;
  unint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  char *v19;
  uint64_t v20;

  *((_DWORD *)self + 9) |= 4u;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "addScheduledHandler:", &__block_literal_global);
  v5 = _Block_copy(a3);
  v6 = (os_unfair_lock_s *)((char *)self + 48);
  os_unfair_lock_lock((os_unfair_lock_t)self + 12);
  v7 = (void **)((char *)self + 56);
  v8 = v7[1];
  v9 = (unint64_t)v7[2];
  if ((unint64_t)v8 >= v9)
  {
    v11 = ((char *)v8 - (_BYTE *)*v7) >> 3;
    if ((unint64_t)(v11 + 1) >> 61)
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    v12 = v9 - (_QWORD)*v7;
    v13 = v12 >> 2;
    if (v12 >> 2 <= (unint64_t)(v11 + 1))
      v13 = v11 + 1;
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF8)
      v14 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v14 = v13;
    if (v14)
      v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)(v7 + 2), v14);
    else
      v15 = 0;
    v16 = &v15[8 * v11];
    v17 = &v15[8 * v14];
    *(_QWORD *)v16 = v5;
    v10 = v16 + 8;
    v19 = (char *)*v7;
    v18 = (char *)v7[1];
    if (v18 != *v7)
    {
      do
      {
        v20 = *((_QWORD *)v18 - 1);
        v18 -= 8;
        *((_QWORD *)v16 - 1) = v20;
        v16 -= 8;
      }
      while (v18 != v19);
      v18 = (char *)*v7;
    }
    *v7 = v16;
    v7[1] = v10;
    v7[2] = v17;
    if (v18)
      operator delete(v18);
  }
  else
  {
    *v8 = v5;
    v10 = v8 + 1;
  }
  v7[1] = v10;
  os_unfair_lock_unlock(v6);
}

- (void)addCompletedHandler:(id)a3
{
  void *v5;
  os_unfair_lock_s *v6;
  void **v7;
  _QWORD *v8;
  unint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  char *v19;
  uint64_t v20;

  *((_DWORD *)self + 9) |= 2u;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "addCompletedHandler:", &__block_literal_global_8);
  v5 = _Block_copy(a3);
  v6 = (os_unfair_lock_s *)((char *)self + 48);
  os_unfair_lock_lock((os_unfair_lock_t)self + 12);
  v7 = (void **)((char *)self + 80);
  v8 = v7[1];
  v9 = (unint64_t)v7[2];
  if ((unint64_t)v8 >= v9)
  {
    v11 = ((char *)v8 - (_BYTE *)*v7) >> 3;
    if ((unint64_t)(v11 + 1) >> 61)
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    v12 = v9 - (_QWORD)*v7;
    v13 = v12 >> 2;
    if (v12 >> 2 <= (unint64_t)(v11 + 1))
      v13 = v11 + 1;
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF8)
      v14 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v14 = v13;
    if (v14)
      v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)(v7 + 2), v14);
    else
      v15 = 0;
    v16 = &v15[8 * v11];
    v17 = &v15[8 * v14];
    *(_QWORD *)v16 = v5;
    v10 = v16 + 8;
    v19 = (char *)*v7;
    v18 = (char *)v7[1];
    if (v18 != *v7)
    {
      do
      {
        v20 = *((_QWORD *)v18 - 1);
        v18 -= 8;
        *((_QWORD *)v16 - 1) = v20;
        v16 -= 8;
      }
      while (v18 != v19);
      v18 = (char *)*v7;
    }
    *v7 = v16;
    v7[1] = v10;
    v7[2] = v17;
    if (v18)
      operator delete(v18);
  }
  else
  {
    *v8 = v5;
    v10 = v8 + 1;
  }
  v7[1] = v10;
  os_unfair_lock_unlock(v6);
}

- (id)renderCommandEncoderWithDescriptor:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  MTLToolsRenderCommandEncoder *v8;

  v5 = -[MTLToolsCommandBuffer unwrapMTLRenderPassDescriptor:](self, "unwrapMTLRenderPassDescriptor:");
  v6 = (void *)MEMORY[0x22E309364]();
  v7 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "renderCommandEncoderWithDescriptor:", v5);
  if (v7)
  {
    v8 = -[MTLToolsRenderCommandEncoder initWithRenderCommandEncoder:parent:descriptor:]([MTLToolsRenderCommandEncoder alloc], "initWithRenderCommandEncoder:parent:descriptor:", v7, self, a3);
    objc_autoreleasePoolPop(v6);
    return v8;
  }
  else
  {
    objc_autoreleasePoolPop(v6);
    return 0;
  }
}

- (id)parallelRenderCommandEncoderWithDescriptor:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  MTLToolsParallelRenderCommandEncoder *v8;

  v5 = -[MTLToolsCommandBuffer unwrapMTLRenderPassDescriptor:](self, "unwrapMTLRenderPassDescriptor:");
  v6 = (void *)MEMORY[0x22E309364]();
  v7 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "parallelRenderCommandEncoderWithDescriptor:", v5);
  if (v7)
  {
    v8 = -[MTLToolsParallelRenderCommandEncoder initWithParallelRenderCommandEncoder:parent:descriptor:]([MTLToolsParallelRenderCommandEncoder alloc], "initWithParallelRenderCommandEncoder:parent:descriptor:", v7, self, a3);
    objc_autoreleasePoolPop(v6);
    return v8;
  }
  else
  {
    objc_autoreleasePoolPop(v6);
    return 0;
  }
}

- (id)sampledRenderCommandEncoderWithDescriptor:(id)a3 programInfoBuffer:(id *)a4 capacity:(unint64_t)a5
{
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  MTLToolsRenderCommandEncoder *v13;

  v9 = -[MTLToolsObject baseObject](self, "baseObject");
  v10 = -[MTLToolsCommandBuffer unwrapMTLRenderPassDescriptor:](self, "unwrapMTLRenderPassDescriptor:", a3);
  v11 = (void *)MEMORY[0x22E309364]();
  v12 = objc_msgSend(v9, "sampledRenderCommandEncoderWithDescriptor:programInfoBuffer:capacity:", v10, a4, a5);
  if (v12)
  {
    v13 = -[MTLToolsRenderCommandEncoder initWithRenderCommandEncoder:parent:descriptor:]([MTLToolsRenderCommandEncoder alloc], "initWithRenderCommandEncoder:parent:descriptor:", v12, self, a3);
    objc_autoreleasePoolPop(v11);
    return v13;
  }
  else
  {
    objc_autoreleasePoolPop(v11);
    return 0;
  }
}

- (id)sampledComputeCommandEncoderWithProgramInfoBuffer:(id *)a3 capacity:(unint64_t)a4
{
  id v7;
  void *v8;
  uint64_t v9;
  MTLToolsComputeCommandEncoder *v10;

  v7 = -[MTLToolsObject baseObject](self, "baseObject");
  v8 = (void *)MEMORY[0x22E309364]();
  v9 = objc_msgSend(v7, "sampledComputeCommandEncoderWithProgramInfoBuffer:capacity:", a3, a4);
  if (v9)
  {
    v10 = -[MTLToolsComputeCommandEncoder initWithComputeCommandEncoder:parent:descriptor:]([MTLToolsComputeCommandEncoder alloc], "initWithComputeCommandEncoder:parent:descriptor:", v9, self, 0);
    objc_autoreleasePoolPop(v8);
    return v10;
  }
  else
  {
    objc_autoreleasePoolPop(v8);
    return 0;
  }
}

- (id)computeCommandEncoderWithDispatchType:(unint64_t)a3
{
  id v5;
  void *v6;
  MTLToolsComputeCommandEncoder *v7;

  v5 = -[MTLToolsObject baseObject](self, "baseObject");
  v6 = (void *)MEMORY[0x22E309364]();
  v7 = -[MTLToolsComputeCommandEncoder initWithComputeCommandEncoder:parent:descriptor:]([MTLToolsComputeCommandEncoder alloc], "initWithComputeCommandEncoder:parent:descriptor:", objc_msgSend(v5, "computeCommandEncoderWithDispatchType:", a3), self, 0);
  objc_autoreleasePoolPop(v6);
  return v7;
}

- (id)computeCommandEncoderWithDescriptor:(id)a3
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  MTLToolsComputeCommandEncoder *v9;

  v5 = -[MTLToolsCommandBuffer unwrapMTLComputePassDescriptor:](self, "unwrapMTLComputePassDescriptor:");
  v6 = -[MTLToolsObject baseObject](self, "baseObject");
  v7 = (void *)MEMORY[0x22E309364]();
  v8 = objc_msgSend(v6, "computeCommandEncoderWithDescriptor:", v5);
  if (v8)
  {
    v9 = -[MTLToolsComputeCommandEncoder initWithComputeCommandEncoder:parent:descriptor:]([MTLToolsComputeCommandEncoder alloc], "initWithComputeCommandEncoder:parent:descriptor:", v8, self, a3);
    objc_autoreleasePoolPop(v7);
    return v9;
  }
  else
  {
    objc_autoreleasePoolPop(v7);
    return 0;
  }
}

- (id)sampledComputeCommandEncoderWithDescriptor:(id)a3 programInfoBuffer:(id *)a4 capacity:(unint64_t)a5
{
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  MTLToolsComputeCommandEncoder *v13;

  v9 = -[MTLToolsObject baseObject](self, "baseObject");
  v10 = -[MTLToolsCommandBuffer unwrapMTLComputePassDescriptor:](self, "unwrapMTLComputePassDescriptor:", a3);
  v11 = (void *)MEMORY[0x22E309364]();
  v12 = objc_msgSend(v9, "sampledComputeCommandEncoderWithDescriptor:programInfoBuffer:capacity:", v10, a4, a5);
  if (v12)
  {
    v13 = -[MTLToolsComputeCommandEncoder initWithComputeCommandEncoder:parent:descriptor:]([MTLToolsComputeCommandEncoder alloc], "initWithComputeCommandEncoder:parent:descriptor:", v12, self, a3);
    objc_autoreleasePoolPop(v11);
    return v13;
  }
  else
  {
    objc_autoreleasePoolPop(v11);
    return 0;
  }
}

- (id)blitCommandEncoderWithDescriptor:(id)a3
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  MTLToolsBlitCommandEncoder *v9;

  v5 = -[MTLToolsObject baseObject](self, "baseObject");
  v6 = -[MTLToolsCommandBuffer unwrapMTLBlitPassDescriptor:](self, "unwrapMTLBlitPassDescriptor:", a3);
  v7 = (void *)MEMORY[0x22E309364]();
  v8 = objc_msgSend(v5, "blitCommandEncoderWithDescriptor:", v6);
  if (v8)
  {
    v9 = -[MTLToolsBlitCommandEncoder initWithBlitCommandEncoder:parent:descriptor:]([MTLToolsBlitCommandEncoder alloc], "initWithBlitCommandEncoder:parent:descriptor:", v8, self, a3);
    objc_autoreleasePoolPop(v7);
    return v9;
  }
  else
  {
    objc_autoreleasePoolPop(v7);
    return 0;
  }
}

- (id)resourceStateCommandEncoderWithDescriptor:(id)a3
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  MTLToolsResourceStateCommandEncoder *v9;

  v5 = -[MTLToolsObject baseObject](self, "baseObject");
  v6 = -[MTLToolsCommandBuffer unwrapMTLResourceStatePassDescriptor:](self, "unwrapMTLResourceStatePassDescriptor:", a3);
  v7 = (void *)MEMORY[0x22E309364]();
  v8 = objc_msgSend(v5, "resourceStateCommandEncoderWithDescriptor:", v6);
  if (v8)
  {
    v9 = -[MTLToolsResourceStateCommandEncoder initWithResourceStateCommandEncoder:parent:descriptor:]([MTLToolsResourceStateCommandEncoder alloc], "initWithResourceStateCommandEncoder:parent:descriptor:", v8, self, a3);
    objc_autoreleasePoolPop(v7);
    return v9;
  }
  else
  {
    objc_autoreleasePoolPop(v7);
    return 0;
  }
}

- (void)encodeSignalEvent:(id)a3 value:(unint64_t)a4
{
  -[MTLToolsCommandBuffer addRetainedObject:](self, "addRetainedObject:");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "encodeSignalEvent:value:", objc_msgSend(a3, "baseObject"), a4);
}

- (void)encodeWaitForEvent:(id)a3 value:(unint64_t)a4
{
  -[MTLToolsCommandBuffer addRetainedObject:](self, "addRetainedObject:");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "encodeWaitForEvent:value:", objc_msgSend(a3, "baseObject"), a4);
}

- (void)encodeWaitForEvent:(id)a3 value:(unint64_t)a4 timeout:(unsigned int)a5
{
  uint64_t v5;

  v5 = *(_QWORD *)&a5;
  -[MTLToolsCommandBuffer addRetainedObject:](self, "addRetainedObject:");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "encodeWaitForEvent:value:timeout:", objc_msgSend(a3, "baseObject"), a4, v5);
}

- (void)encodeSignalEvent:(id)a3 value:(unint64_t)a4 agentMask:(unint64_t)a5
{
  -[MTLToolsCommandBuffer addRetainedObject:](self, "addRetainedObject:");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "encodeSignalEvent:value:agentMask:", objc_msgSend(a3, "baseObject"), a4, a5);
}

- (void)encodeConditionalAbortEvent:(id)a3
{
  -[MTLToolsCommandBuffer addRetainedObject:](self, "addRetainedObject:");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "encodeConditionalAbortEvent:", objc_msgSend(a3, "baseObject"));
}

- (void)encodeSignalEventScheduled:(id)a3 value:(unint64_t)a4
{
  -[MTLToolsCommandBuffer addRetainedObject:](self, "addRetainedObject:");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "encodeSignalEventScheduled:value:", objc_msgSend(a3, "baseObject"), a4);
}

- (BOOL)respondsToSelector:(SEL)a3
{
  unsigned __int8 v3;
  objc_super v5;

  if (sel_encodeSignalEventScheduled_value_ == a3)
  {
    -[MTLToolsObject baseObject](self, "baseObject");
    v3 = objc_opt_respondsToSelector();
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)MTLToolsCommandBuffer;
    v3 = -[MTLToolsCommandBuffer respondsToSelector:](&v5, sel_respondsToSelector_, a3);
  }
  return v3 & 1;
}

- (void)addPurgedResource:(id)a3
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "addPurgedResource:", objc_msgSend(a3, "baseObject"));
}

- (void)addPurgedHeap:(id)a3
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "addPurgedHeap:", objc_msgSend(a3, "baseObject"));
}

- (id)sampledComputeCommandEncoderWithDispatchType:(unint64_t)a3 programInfoBuffer:(id *)a4 capacity:(unint64_t)a5
{
  id v9;
  void *v10;
  uint64_t v11;
  MTLToolsComputeCommandEncoder *v12;

  v9 = -[MTLToolsObject baseObject](self, "baseObject");
  v10 = (void *)MEMORY[0x22E309364]();
  v11 = objc_msgSend(v9, "sampledComputeCommandEncoderWithDispatchType:programInfoBuffer:capacity:", a3, a4, a5);
  if (v11)
  {
    v12 = -[MTLToolsComputeCommandEncoder initWithComputeCommandEncoder:parent:descriptor:]([MTLToolsComputeCommandEncoder alloc], "initWithComputeCommandEncoder:parent:descriptor:", v11, self, 0);
    objc_autoreleasePoolPop(v10);
    return v12;
  }
  else
  {
    objc_autoreleasePoolPop(v10);
    return 0;
  }
}

- (BOOL)isProfilingEnabled
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "isProfilingEnabled");
}

- (void)setProfilingEnabled:(BOOL)a3
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setProfilingEnabled:", a3);
}

- (NSDictionary)profilingResults
{
  return (NSDictionary *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "profilingResults");
}

- (NSMutableDictionary)userDictionary
{
  return (NSMutableDictionary *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "userDictionary");
}

- (unint64_t)getListIndex
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "getListIndex");
}

- (void)addSynchronizationNotification:(id)a3
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "addSynchronizationNotification:", a3);
}

- (void)executeSynchronizationNotifications:(int)a3
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "executeSynchronizationNotifications:", *(_QWORD *)&a3);
}

- (void)executeSynchronizationNotifications:(int)a3 scope:(unint64_t)a4 resources:(const void *)a5 count:(unint64_t)a6
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "executeSynchronizationNotifications:scope:resources:count:", *(_QWORD *)&a3, a4, a5, a6);
}

- (void)setResourceGroups:(const void *)a3 count:(unint64_t)a4
{
  char *v6;
  const void **v7;
  unint64_t v8;
  _QWORD *v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v6 = (char *)v11 - ((8 * a4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    v7 = a3;
    v8 = a4;
    v9 = (_QWORD *)((char *)v11 - ((8 * a4 + 15) & 0xFFFFFFFFFFFFFFF0));
    do
    {
      v10 = (void *)*v7++;
      *v9++ = objc_msgSend(v10, "baseObject");
      --v8;
    }
    while (v8);
  }
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", a3), "setResourceGroups:count:", v6, a4);
}

- (void)dropResourceGroups:(const void *)a3 count:(unint64_t)a4
{
  char *v6;
  const void **v7;
  unint64_t v8;
  _QWORD *v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v6 = (char *)v11 - ((8 * a4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    v7 = a3;
    v8 = a4;
    v9 = (_QWORD *)((char *)v11 - ((8 * a4 + 15) & 0xFFFFFFFFFFFFFFF0));
    do
    {
      v10 = (void *)*v7++;
      *v9++ = objc_msgSend(v10, "baseObject");
      --v8;
    }
    while (v8);
  }
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", a3), "dropResourceGroups:count:", v6, a4);
}

- (void)encodeCacheHintTag:(unint64_t)a3 resourceGroups:(const void *)a4 count:(unint64_t)a5
{
  char *v8;
  const void **v9;
  unint64_t v10;
  _QWORD *v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v8 = (char *)v13 - ((8 * a5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a5)
  {
    v9 = a4;
    v10 = a5;
    v11 = (_QWORD *)((char *)v13 - ((8 * a5 + 15) & 0xFFFFFFFFFFFFFFF0));
    do
    {
      v12 = (void *)*v9++;
      *v11++ = objc_msgSend(v12, "baseObject");
      --v10;
    }
    while (v10);
  }
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", a3, a4), "encodeCacheHintTag:resourceGroups:count:", a3, v8, a5);
}

- (void)encodeCacheHintFinalize:(unint64_t)a3 resourceGroups:(const void *)a4 count:(unint64_t)a5
{
  char *v8;
  const void **v9;
  unint64_t v10;
  _QWORD *v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v8 = (char *)v13 - ((8 * a5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a5)
  {
    v9 = a4;
    v10 = a5;
    v11 = (_QWORD *)((char *)v13 - ((8 * a5 + 15) & 0xFFFFFFFFFFFFFFF0));
    do
    {
      v12 = (void *)*v9++;
      *v11++ = objc_msgSend(v12, "baseObject");
      --v10;
    }
    while (v10);
  }
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", a3, a4), "encodeCacheHintFinalize:resourceGroups:count:", a3, v8, a5);
}

- (void)setProtectionOptions:(unint64_t)a3
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setProtectionOptions:", a3);
}

- (unint64_t)protectionOptions
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "protectionOptions");
}

- (unint64_t)errorOptions
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "errorOptions");
}

- (void)retainObjectsFromRenderPassDescriptor:(id)a3
{
  uint64_t i;
  void *v6;
  void *v7;
  uint64_t j;

  for (i = 0; i != 10; ++i)
  {
    v6 = (void *)objc_msgSend((id)objc_msgSend(a3, "colorAttachments"), "_descriptorAtIndex:", i);
    if (v6)
    {
      v7 = v6;
      -[MTLToolsCommandBuffer addRetainedObject:](self, "addRetainedObject:", objc_msgSend(v6, "texture"));
      -[MTLToolsCommandBuffer addRetainedObject:](self, "addRetainedObject:", objc_msgSend(v7, "resolveTexture"));
    }
  }
  -[MTLToolsCommandBuffer addRetainedObject:](self, "addRetainedObject:", objc_msgSend(a3, "visibilityResultBuffer"));
  -[MTLToolsCommandBuffer addRetainedObject:](self, "addRetainedObject:", objc_msgSend(a3, "rasterizationRateMap"));
  for (j = 0; j != 4; ++j)
    -[MTLToolsCommandBuffer addRetainedObject:](self, "addRetainedObject:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "sampleBufferAttachments"), "objectAtIndexedSubscript:", j), "sampleBuffer"));
}

- (MTLDeadlineProfile)deadlineProfile
{
  return (MTLDeadlineProfile *)*((_QWORD *)self + 16);
}

- (void)commitWithDeadline:(unint64_t)a3
{
  -[MTLToolsCommandBuffer preCommit](self, "preCommit");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "commitWithDeadline:", a3);
}

- (BOOL)commitAndWaitUntilSubmittedWithDeadline:(unint64_t)a3
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "commitAndWaitUntilSubmittedWithDeadline:", a3);
}

- (id)unwrapMTLAccelerationStructurePassDescriptor:(id)a3
{
  void *v4;
  uint64_t i;

  v4 = (void *)objc_msgSend(a3, "copy");
  for (i = 0; i != 4; ++i)
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(v4, "sampleBufferAttachments"), "objectAtIndexedSubscript:", i), "setSampleBuffer:", objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "sampleBufferAttachments"), "objectAtIndexedSubscript:", i), "sampleBuffer"), "baseObject"));
  return v4;
}

- (id)accelerationStructureCommandEncoderWithDescriptor:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  MTLToolsAccelerationStructureCommandEncoder *v8;

  v5 = -[MTLToolsCommandBuffer unwrapMTLAccelerationStructurePassDescriptor:](self, "unwrapMTLAccelerationStructurePassDescriptor:");
  v6 = (void *)MEMORY[0x22E309364]();
  v7 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "accelerationStructureCommandEncoderWithDescriptor:", v5);
  if (v7)
  {
    v8 = -[MTLToolsAccelerationStructureCommandEncoder initWithAccelerationStructureCommandEncoder:parent:descriptor:]([MTLToolsAccelerationStructureCommandEncoder alloc], "initWithAccelerationStructureCommandEncoder:parent:descriptor:", v7, self, a3);
    objc_autoreleasePoolPop(v6);
    return v8;
  }
  else
  {
    objc_autoreleasePoolPop(v6);
    return 0;
  }
}

- (void)setResponsibleTaskIDs:(const unsigned int *)a3 count:(unsigned int)a4
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setResponsibleTaskIDs:count:", a3, *(_QWORD *)&a4);
}

- (void)useResidencySet:(id)a3
{
  -[MTLToolsCommandBuffer addRetainedObject:](self, "addRetainedObject:");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "useResidencySet:", objc_msgSend(a3, "baseObject"));
}

- (void)useResidencySets:(const void *)a3 count:(unint64_t)a4
{
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *__p[3];

  std::vector<objc_object  {objcproto15MTLResidencySet}*>::vector(__p, a4);
  if (a4)
  {
    v7 = 0;
    do
    {
      -[MTLToolsCommandBuffer addRetainedObject:](self, "addRetainedObject:", a3[v7]);
      v8 = objc_msgSend((id)a3[v7], "baseObject");
      *((_QWORD *)__p[0] + v7++) = v8;
    }
    while (a4 != v7);
  }
  v9 = -[MTLToolsObject baseObject](self, "baseObject");
  objc_msgSend(v9, "useResidencySets:count:", __p[0], a4);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

- (void)useInternalResidencySet:(id)a3
{
  -[MTLToolsCommandBuffer addRetainedObject:](self, "addRetainedObject:");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "useInternalResidencySet:", objc_msgSend(a3, "baseObject"));
}

- (void)useInternalResidencySets:(const void *)a3 count:(unint64_t)a4
{
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *__p[3];

  std::vector<objc_object  {objcproto15MTLResidencySet}*>::vector(__p, a4);
  if (a4)
  {
    v7 = 0;
    do
    {
      -[MTLToolsCommandBuffer addRetainedObject:](self, "addRetainedObject:", a3[v7]);
      v8 = objc_msgSend((id)a3[v7], "baseObject");
      *((_QWORD *)__p[0] + v7++) = v8;
    }
    while (a4 != v7);
  }
  v9 = -[MTLToolsObject baseObject](self, "baseObject");
  objc_msgSend(v9, "useInternalResidencySets:count:", __p[0], a4);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

- (NSMutableSet)retainedObjects
{
  return (NSMutableSet *)*((_QWORD *)self + 17);
}

- (BOOL)useRetainedObjectsLock
{
  return *((_BYTE *)self + 44) & 1;
}

- (void)setUseRetainedObjectsLock:(BOOL)a3
{
  *((_BYTE *)self + 44) = a3;
}

- (void).cxx_destruct
{
  char *v3;
  void *v4;
  void *v5;

  v3 = (char *)self + 80;
  v4 = (void *)*((_QWORD *)self + 10);
  if (v4)
  {
    *((_QWORD *)v3 + 1) = v4;
    operator delete(v4);
  }
  v5 = (void *)*((_QWORD *)self + 7);
  if (v5)
  {
    *((_QWORD *)self + 8) = v5;
    operator delete(v5);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 8) = 0;
  *((_QWORD *)self + 9) = 0;
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 11) = 0;
  *((_QWORD *)self + 12) = 0;
  *((_QWORD *)self + 10) = 0;
  return self;
}

@end
