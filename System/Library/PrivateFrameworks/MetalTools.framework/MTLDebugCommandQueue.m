@implementation MTLDebugCommandQueue

- (void)insertDebugCaptureBoundary
{
  objc_super v3;

  if (_MTLIsInsideCompletionHandler())
    MTLReportFailure();
  v3.receiver = self;
  v3.super_class = (Class)MTLDebugCommandQueue;
  -[MTLToolsCommandQueue insertDebugCaptureBoundary](&v3, sel_insertDebugCaptureBoundary);
}

- (id)commandBuffer
{
  void *v3;
  uint64_t v4;
  MTLDebugCommandBuffer *v5;

  v3 = (void *)MEMORY[0x22E309364](self, a2);
  v4 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "commandBuffer");
  if (v4)
  {
    v5 = -[MTLDebugCommandBuffer initWithCommandBuffer:commandQueue:descriptor:]([MTLDebugCommandBuffer alloc], "initWithCommandBuffer:commandQueue:descriptor:", v4, self, 0);
    objc_autoreleasePoolPop(v3);
    return v5;
  }
  else
  {
    objc_autoreleasePoolPop(v3);
    return 0;
  }
}

- (id)commandBufferWithUnretainedReferences
{
  void *v3;
  uint64_t v4;
  MTLDebugCommandBuffer *v5;

  v3 = (void *)MEMORY[0x22E309364](self, a2);
  v4 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "commandBufferWithUnretainedReferences");
  if (v4)
  {
    v5 = -[MTLDebugCommandBuffer initWithCommandBuffer:commandQueue:descriptor:]([MTLDebugCommandBuffer alloc], "initWithCommandBuffer:commandQueue:descriptor:", v4, self, 0);
    objc_autoreleasePoolPop(v3);
    return v5;
  }
  else
  {
    objc_autoreleasePoolPop(v3);
    return 0;
  }
}

- (id)commandBufferWithDescriptor:(id)a3
{
  void *v5;
  uint64_t v6;
  MTLDebugCommandBuffer *v7;

  v5 = (void *)MEMORY[0x22E309364](self, a2);
  v6 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "commandBufferWithDescriptor:", -[MTLToolsDevice unwrapMTLCommandBufferDescriptor:alwaysCopy:](self->super.super._device, "unwrapMTLCommandBufferDescriptor:alwaysCopy:", a3, 0));
  if (v6)
  {
    v7 = -[MTLDebugCommandBuffer initWithCommandBuffer:commandQueue:descriptor:]([MTLDebugCommandBuffer alloc], "initWithCommandBuffer:commandQueue:descriptor:", v6, self, a3);
    -[MTLDeadlineProfile validateCommandQueue:](-[MTLToolsCommandBuffer deadlineProfile](v7, "deadlineProfile"), "validateCommandQueue:", self);
    objc_autoreleasePoolPop(v5);
    return v7;
  }
  else
  {
    objc_autoreleasePoolPop(v5);
    return 0;
  }
}

- (void)validateDeadlineAwareness:(id)a3
{
  int *p_deadlineAwareState;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;

  p_deadlineAwareState = &self->_deadlineAwareState;
  v5 = atomic_load((unsigned int *)&self->_deadlineAwareState);
  v6 = objc_msgSend(a3, "deadlineProfile");
  v7 = v6;
  if (v6)
    v8 = 1;
  else
    v8 = 2;
  if (v5)
  {
    if (v5 != v8)
      goto LABEL_16;
LABEL_12:
    if (!v6)
      return;
    goto LABEL_13;
  }
  while (1)
  {
    v9 = __ldaxr((unsigned int *)p_deadlineAwareState);
    if (v9)
      break;
    if (!__stlxr(v8, (unsigned int *)p_deadlineAwareState))
      goto LABEL_12;
  }
  __clrex();
  if (v9 == v8)
    goto LABEL_12;
LABEL_16:
  MTLReportFailure();
  if (!v7)
    return;
LABEL_13:
  if (-[MTLToolsCommandQueue getGPUPriority](self, "getGPUPriority") != 5)
    MTLReportFailure();
}

- (void)addResidencySet:(id)a3
{
  objc_super v5;

  if (!a3)
    MTLReportFailure();
  v5.receiver = self;
  v5.super_class = (Class)MTLDebugCommandQueue;
  -[MTLToolsCommandQueue addResidencySet:](&v5, sel_addResidencySet_, a3);
}

- (void)addResidencySets:(const void *)a3 count:(unint64_t)a4
{
  uint64_t i;
  uint64_t v8;
  objc_super v9;

  if (a4)
  {
    for (i = 0; i != a4; ++i)
    {
      if (!a3[i])
      {
        v8 = i;
        MTLReportFailure();
      }
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)MTLDebugCommandQueue;
  -[MTLToolsCommandQueue addResidencySets:count:](&v9, sel_addResidencySets_count_, a3, a4, v8);
}

- (void)removeResidencySet:(id)a3
{
  objc_super v5;

  if (!a3)
    MTLReportFailure();
  v5.receiver = self;
  v5.super_class = (Class)MTLDebugCommandQueue;
  -[MTLToolsCommandQueue removeResidencySet:](&v5, sel_removeResidencySet_, a3);
}

- (void)removeResidencySets:(const void *)a3 count:(unint64_t)a4
{
  uint64_t i;
  uint64_t v8;
  objc_super v9;

  if (a4)
  {
    for (i = 0; i != a4; ++i)
    {
      if (!a3[i])
      {
        v8 = i;
        MTLReportFailure();
      }
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)MTLDebugCommandQueue;
  -[MTLToolsCommandQueue removeResidencySets:count:](&v9, sel_removeResidencySets_count_, a3, a4, v8);
}

- (void)addInternalResidencySet:(id)a3
{
  objc_super v5;

  if (!a3)
    MTLReportFailure();
  v5.receiver = self;
  v5.super_class = (Class)MTLDebugCommandQueue;
  -[MTLToolsCommandQueue addInternalResidencySet:](&v5, sel_addInternalResidencySet_, a3);
}

- (void)addInternalResidencySets:(const void *)a3 count:(unint64_t)a4
{
  uint64_t i;
  uint64_t v8;
  objc_super v9;

  if (a4)
  {
    for (i = 0; i != a4; ++i)
    {
      if (!a3[i])
      {
        v8 = i;
        MTLReportFailure();
      }
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)MTLDebugCommandQueue;
  -[MTLToolsCommandQueue addInternalResidencySets:count:](&v9, sel_addInternalResidencySets_count_, a3, a4, v8);
}

- (void)removeInternalResidencySet:(id)a3
{
  objc_super v5;

  if (!a3)
    MTLReportFailure();
  v5.receiver = self;
  v5.super_class = (Class)MTLDebugCommandQueue;
  -[MTLToolsCommandQueue removeInternalResidencySet:](&v5, sel_removeInternalResidencySet_, a3);
}

- (void)removeInternalResidencySets:(const void *)a3 count:(unint64_t)a4
{
  uint64_t i;
  uint64_t v8;
  objc_super v9;

  if (a4)
  {
    for (i = 0; i != a4; ++i)
    {
      if (!a3[i])
      {
        v8 = i;
        MTLReportFailure();
      }
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)MTLDebugCommandQueue;
  -[MTLToolsCommandQueue removeInternalResidencySets:count:](&v9, sel_removeInternalResidencySets_count_, a3, a4, v8);
}

@end
