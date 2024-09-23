@implementation MTLToolsCommandQueue

- (MTLToolsCommandQueue)initWithBaseObject:(id)a3 parent:(id)a4
{
  MTLToolsCommandQueue *v4;
  MTLToolsCommandQueue *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTLToolsCommandQueue;
  v4 = -[MTLToolsObject initWithBaseObject:parent:](&v7, sel_initWithBaseObject_parent_, a3, a4);
  v5 = v4;
  if (v4)
  {
    v4->_perfHandlerLock._os_unfair_lock_opaque = 0;
    v4->_residencySetsLock._os_unfair_lock_opaque = 0;
    v4->_residencySets = (NSCountedSet *)objc_opt_new();
    v5->_internalResidencySets = (NSCountedSet *)objc_opt_new();
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  _Block_release(self->_perfSampleHandlerBlock);

  v3.receiver = self;
  v3.super_class = (Class)MTLToolsCommandQueue;
  -[MTLToolsObject dealloc](&v3, sel_dealloc);
}

- (NSString)label
{
  return (NSString *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "label");
}

- (void)setLabel:(id)a3
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setLabel:", a3);
}

- (id)commandBuffer
{
  void *v3;
  uint64_t v4;
  MTLToolsCommandBuffer *v5;

  v3 = (void *)MEMORY[0x22E309364](self, a2);
  v4 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "commandBuffer");
  if (v4)
    v5 = -[MTLToolsCommandBuffer initWithBaseObject:parent:]([MTLToolsCommandBuffer alloc], "initWithBaseObject:parent:", v4, self);
  else
    v5 = 0;
  objc_autoreleasePoolPop(v3);
  return v5;
}

- (id)commandBufferWithUnretainedReferences
{
  void *v3;
  uint64_t v4;
  MTLToolsCommandBuffer *v5;

  v3 = (void *)MEMORY[0x22E309364](self, a2);
  v4 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "commandBufferWithUnretainedReferences");
  if (v4)
    v5 = -[MTLToolsCommandBuffer initWithBaseObject:parent:]([MTLToolsCommandBuffer alloc], "initWithBaseObject:parent:", v4, self);
  else
    v5 = 0;
  objc_autoreleasePoolPop(v3);
  return v5;
}

- (id)commandBufferWithDescriptor:(id)a3
{
  void *v5;
  MTLToolsCommandBuffer *v6;
  MTLToolsCommandBuffer *v7;

  v5 = (void *)MEMORY[0x22E309364](self, a2);
  v6 = (MTLToolsCommandBuffer *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "commandBufferWithDescriptor:", -[MTLToolsDevice unwrapMTLCommandBufferDescriptor:alwaysCopy:](self->super._device, "unwrapMTLCommandBufferDescriptor:alwaysCopy:", a3, 0));
  if (v6)
    v6 = -[MTLToolsCommandBuffer initWithCommandBuffer:parent:descriptor:]([MTLToolsCommandBuffer alloc], "initWithCommandBuffer:parent:descriptor:", v6, self, a3);
  v7 = v6;
  objc_autoreleasePoolPop(v5);
  return v7;
}

- (void)insertDebugCaptureBoundary
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "insertDebugCaptureBoundary");
}

- (void)dispatchAvailableCompletionNotifications
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "dispatchAvailableCompletionNotifications");
}

- (unint64_t)getGPUPriority
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "getGPUPriority");
}

- (BOOL)setGPUPriority:(unint64_t)a3
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setGPUPriority:", a3);
}

- (BOOL)setGPUPriority:(unint64_t)a3 offset:(unsigned __int16)a4
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setGPUPriority:offset:", a3, a4);
}

- (unint64_t)getBackgroundGPUPriority
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "getBackgroundGPUPriority");
}

- (BOOL)setBackgroundGPUPriority:(unint64_t)a3
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setBackgroundGPUPriority:", a3);
}

- (BOOL)setBackgroundGPUPriority:(unint64_t)a3 offset:(unsigned __int16)a4
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setBackgroundGPUPriority:offset:", a3, a4);
}

- (unint64_t)maxCommandBufferCount
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "maxCommandBufferCount");
}

- (int)backgroundTrackingPID
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "backgroundTrackingPID");
}

- (void)setBackgroundTrackingPID:(int)a3
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setBackgroundTrackingPID:", *(_QWORD *)&a3);
}

- (void)finish
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "finish");
}

- (BOOL)skipRender
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "skipRender");
}

- (void)setSkipRender:(BOOL)a3
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setSkipRender:", a3);
}

- (BOOL)executionEnabled
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "executionEnabled");
}

- (void)setExecutionEnabled:(BOOL)a3
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setExecutionEnabled:", a3);
}

- (BOOL)isProfilingEnabled
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "isProfilingEnabled");
}

- (void)setProfilingEnabled:(BOOL)a3
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setProfilingEnabled:", a3);
}

- (void)setCompletionQueue:(id)a3
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setCompletionQueue:", a3);
}

- (void)setSubmissionQueue:(id)a3
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setSubmissionQueue:", a3);
}

- (BOOL)isOpenGLQueue
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "isOpenGLQueue");
}

- (id)getSPIStats
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "getSPIStats");
}

- (int)requestCounters:(id)a3
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "requestCounters:", a3);
}

- (void)addPerfSampleHandler:(id)a3
{
  void *v4;
  MTLToolsPerfCounterMailbox *v5;
  MTLToolsObject *baseObject;
  id perfSampleHandlerBlock;
  _QWORD v8[5];

  v4 = _Block_copy(a3);
  os_unfair_lock_lock(&self->_perfHandlerLock);
  if (!self->_perfSampleMailbox)
  {
    v5 = (MTLToolsPerfCounterMailbox *)objc_opt_new();
    self->_perfSampleMailbox = v5;
    baseObject = self->super._baseObject;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __45__MTLToolsCommandQueue_addPerfSampleHandler___block_invoke;
    v8[3] = &unk_24F794580;
    v8[4] = v5;
    -[MTLToolsObject addPerfSampleHandler:](baseObject, "addPerfSampleHandler:", v8);
  }
  perfSampleHandlerBlock = self->_perfSampleHandlerBlock;
  self->_perfSampleHandlerBlock = v4;
  os_unfair_lock_unlock(&self->_perfHandlerLock);
  _Block_release(perfSampleHandlerBlock);
}

uint64_t __45__MTLToolsCommandQueue_addPerfSampleHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "insertData:andNumSamples:forRequester:", a3, a4, a2);
}

- (id)snapshotPerfSampleHandlerAndStatEnabled:(BOOL *)a3 forCommandBuffer:(id)a4
{
  os_unfair_lock_s *p_perfHandlerLock;
  void *v8;

  p_perfHandlerLock = &self->_perfHandlerLock;
  os_unfair_lock_lock(&self->_perfHandlerLock);
  if (objc_msgSend(a4, "isStatEnabled"))
  {
    *a3 = 1;
    v8 = _Block_copy(self->_perfSampleHandlerBlock);
  }
  else
  {
    v8 = 0;
    *a3 = 0;
  }
  os_unfair_lock_unlock(p_perfHandlerLock);
  return v8;
}

- (int)requestCounters:(id)a3 withIndex:(unint64_t)a4
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "requestCounters:withIndex:", a3, a4);
}

- (id)subdivideCounterList:(id)a3
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "subdivideCounterList:", a3);
}

- (unint64_t)qosLevel
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "qosLevel");
}

- (OS_dispatch_queue)commitQueue
{
  return (OS_dispatch_queue *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "commitQueue");
}

- (BOOL)commitSynchronously
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "commitSynchronously");
}

- (OS_dispatch_queue)completionQueue
{
  return (OS_dispatch_queue *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "completionQueue");
}

- (BOOL)disableCrossQueueHazardTracking
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "disableCrossQueueHazardTracking");
}

- (id)availableCounters
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "availableCounters");
}

- (id)getRequestedCounters
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "getRequestedCounters");
}

- (BOOL)isStatEnabled
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "isStatEnabled");
}

- (void)setStatEnabled:(BOOL)a3
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setStatEnabled:", a3);
}

- (unint64_t)getStatOptions
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "getStatOptions");
}

- (void)setStatOptions:(unint64_t)a3
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setStatOptions:", a3);
}

- (unint64_t)getStatLocations
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "getStatLocations");
}

- (void)setStatLocations:(unint64_t)a3
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setStatLocations:", a3);
}

- (id)counterInfo
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "counterInfo");
}

- (BOOL)commitsWithQoS
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "commitsWithQoS");
}

- (void)addResidencySet:(id)a3
{
  os_unfair_lock_s *p_residencySetsLock;

  p_residencySetsLock = &self->_residencySetsLock;
  os_unfair_lock_lock(&self->_residencySetsLock);
  -[NSCountedSet addObject:](self->_residencySets, "addObject:", a3);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "addResidencySet:", objc_msgSend(a3, "baseObject"));
  os_unfair_lock_unlock(p_residencySetsLock);
}

- (void)addResidencySets:(const void *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_residencySetsLock;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *__p[3];

  p_residencySetsLock = &self->_residencySetsLock;
  os_unfair_lock_lock(&self->_residencySetsLock);
  std::vector<objc_object  {objcproto15MTLResidencySet}*>::vector(__p, a4);
  if (a4)
  {
    v8 = 0;
    do
    {
      -[NSCountedSet addObject:](self->_residencySets, "addObject:", a3[v8]);
      v9 = objc_msgSend((id)a3[v8], "baseObject");
      *((_QWORD *)__p[0] + v8++) = v9;
    }
    while (a4 != v8);
  }
  v10 = -[MTLToolsObject baseObject](self, "baseObject");
  objc_msgSend(v10, "addResidencySets:count:", __p[0], a4);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  os_unfair_lock_unlock(p_residencySetsLock);
}

- (void)removeResidencySet:(id)a3
{
  os_unfair_lock_s *p_residencySetsLock;

  p_residencySetsLock = &self->_residencySetsLock;
  os_unfair_lock_lock(&self->_residencySetsLock);
  -[NSCountedSet removeObject:](self->_residencySets, "removeObject:", a3);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "removeResidencySet:", objc_msgSend(a3, "baseObject"));
  os_unfair_lock_unlock(p_residencySetsLock);
}

- (void)removeResidencySets:(const void *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_residencySetsLock;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *__p[3];

  p_residencySetsLock = &self->_residencySetsLock;
  os_unfair_lock_lock(&self->_residencySetsLock);
  std::vector<objc_object  {objcproto15MTLResidencySet}*>::vector(__p, a4);
  if (a4)
  {
    v8 = 0;
    do
    {
      -[NSCountedSet removeObject:](self->_residencySets, "removeObject:", a3[v8]);
      v9 = objc_msgSend((id)a3[v8], "baseObject");
      *((_QWORD *)__p[0] + v8++) = v9;
    }
    while (a4 != v8);
  }
  v10 = -[MTLToolsObject baseObject](self, "baseObject");
  objc_msgSend(v10, "removeResidencySets:count:", __p[0], a4);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  os_unfair_lock_unlock(p_residencySetsLock);
}

- (id)residencySetsArray
{
  return (id)-[NSCountedSet allObjects](self->_residencySets, "allObjects");
}

- (void)addInternalResidencySet:(id)a3
{
  os_unfair_lock_s *p_residencySetsLock;

  p_residencySetsLock = &self->_residencySetsLock;
  os_unfair_lock_lock(&self->_residencySetsLock);
  -[NSCountedSet addObject:](self->_internalResidencySets, "addObject:", a3);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "addInternalResidencySet:", objc_msgSend(a3, "baseObject"));
  os_unfair_lock_unlock(p_residencySetsLock);
}

- (void)addInternalResidencySets:(const void *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_residencySetsLock;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *__p[3];

  p_residencySetsLock = &self->_residencySetsLock;
  os_unfair_lock_lock(&self->_residencySetsLock);
  std::vector<objc_object  {objcproto15MTLResidencySet}*>::vector(__p, a4);
  if (a4)
  {
    v8 = 0;
    do
    {
      -[NSCountedSet addObject:](self->_internalResidencySets, "addObject:", a3[v8]);
      v9 = objc_msgSend((id)a3[v8], "baseObject");
      *((_QWORD *)__p[0] + v8++) = v9;
    }
    while (a4 != v8);
  }
  v10 = -[MTLToolsObject baseObject](self, "baseObject");
  objc_msgSend(v10, "addInternalResidencySets:count:", __p[0], a4);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  os_unfair_lock_unlock(p_residencySetsLock);
}

- (void)removeInternalResidencySet:(id)a3
{
  os_unfair_lock_s *p_residencySetsLock;

  p_residencySetsLock = &self->_residencySetsLock;
  os_unfair_lock_lock(&self->_residencySetsLock);
  -[NSCountedSet removeObject:](self->_internalResidencySets, "removeObject:", a3);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "removeInternalResidencySet:", objc_msgSend(a3, "baseObject"));
  os_unfair_lock_unlock(p_residencySetsLock);
}

- (void)removeInternalResidencySets:(const void *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_residencySetsLock;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *__p[3];

  p_residencySetsLock = &self->_residencySetsLock;
  os_unfair_lock_lock(&self->_residencySetsLock);
  std::vector<objc_object  {objcproto15MTLResidencySet}*>::vector(__p, a4);
  if (a4)
  {
    v8 = 0;
    do
    {
      -[NSCountedSet removeObject:](self->_internalResidencySets, "removeObject:", a3[v8]);
      v9 = objc_msgSend((id)a3[v8], "baseObject");
      *((_QWORD *)__p[0] + v8++) = v9;
    }
    while (a4 != v8);
  }
  v10 = -[MTLToolsObject baseObject](self, "baseObject");
  objc_msgSend(v10, "removeInternalResidencySets:count:", __p[0], a4);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  os_unfair_lock_unlock(p_residencySetsLock);
}

- (id)internalResidencySetsArray
{
  return (id)-[NSCountedSet allObjects](self->_internalResidencySets, "allObjects");
}

@end
