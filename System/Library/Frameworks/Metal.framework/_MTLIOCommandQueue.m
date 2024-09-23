@implementation _MTLIOCommandQueue

- (_MTLIOCommandQueue)initWithDevice:(id)a3 descriptor:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _MTLIOCommandQueue *v12;
  uint64_t v13;
  int v14;
  dispatch_qos_class_t v15;
  NSObject *v16;
  NSObject *v17;
  _MTLIOScratchBufferAllocator *v18;
  unint64_t v19;
  unint64_t v20;
  const __CFString *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  objc_super v31;
  _OWORD v32[3];
  uint64_t v33;

  v33 = 0;
  memset(v32, 0, sizeof(v32));
  _MTLMessageContextBegin_((uint64_t)v32, (uint64_t)"-[_MTLIOCommandQueue initWithDevice:descriptor:]", 1335, (uint64_t)a3, 33, (uint64_t)"IO Command Queue Creation Validation");
  if (!a3)
  {
    v22 = CFSTR("device must not be nil.");
    v23 = 4;
LABEL_23:
    _MTLMessageContextPush_((uint64_t)v32, v23, (uint64_t)v22, v7, v8, v9, v10, v11, v30);
    goto LABEL_3;
  }
  if (MTLFailureTypeGetEnabled(1uLL) && (objc_msgSend(a3, "conformsToProtocol:", &unk_1EDCF1690) & 1) == 0)
  {
    v22 = CFSTR("device is not a MTLDevice.");
    v23 = 8;
    goto LABEL_23;
  }
LABEL_3:
  if (!objc_msgSend(a4, "maxCommandBufferCount"))
  {
    v24 = objc_msgSend(a4, "maxCommandBufferCount");
    _MTLMessageContextPush_((uint64_t)v32, 4, (uint64_t)CFSTR("invalid descriptor.maxCommandBufferCount value %u"), v25, v26, v27, v28, v29, v24);
  }
  v31.receiver = self;
  v31.super_class = (Class)_MTLIOCommandQueue;
  v12 = -[_MTLObjectWithLabel init](&v31, sel_init);
  if (v12)
  {
    v12->_device = (MTLDevice *)a3;
    v12->_gpuEvent = (MTLSharedEvent *)objc_msgSend(a3, "newSharedEvent");
    v12->_gpuQueue = (MTLCommandQueue *)objc_msgSend(a3, "newCommandQueueWithMaxCommandBufferCount:", 0x7FFFFFFFFFFFFF80);
    v12->_eventSignalListener = (MTLSharedEventListener *)objc_opt_new();
    v13 = objc_msgSend(a4, "priority");
    if (v13 == 1)
      v14 = 17;
    else
      v14 = 33;
    if (v13 == 2)
      v15 = QOS_CLASS_BACKGROUND;
    else
      v15 = v14;
    v16 = dispatch_queue_attr_make_with_qos_class(MEMORY[0x1E0C80D50], v15, 0);
    v12->_commitQueue = (OS_dispatch_queue *)dispatch_queue_create("com.Metal.IOCommandQueueDispatch", v16);
    v17 = dispatch_queue_attr_make_with_qos_class(0, v15, 0);
    v12->_followonQueue = (OS_dispatch_queue *)dispatch_queue_create("com.Metal.IOCommandQueueFollowon", v17);
    dispatch_release(v16);
    dispatch_release(v17);
    v12->_commandBufferSemaphore = (OS_dispatch_semaphore *)dispatch_semaphore_create(objc_msgSend(a4, "maxCommandBufferCount"));
    v12->_completeQueueMutex.__sig = 850045863;
    *(_OWORD *)v12->_completeQueueMutex.__opaque = 0u;
    *(_OWORD *)&v12->_completeQueueMutex.__opaque[16] = 0u;
    *(_OWORD *)&v12->_completeQueueMutex.__opaque[32] = 0u;
    *(_QWORD *)&v12->_completeQueueMutex.__opaque[48] = 0;
    v12->_completeQueue = (NSMutableArray *)objc_opt_new();
    if (objc_msgSend(a4, "scratchBufferAllocator"))
      v18 = (_MTLIOScratchBufferAllocator *)(id)objc_msgSend(a4, "scratchBufferAllocator");
    else
      v18 = -[_MTLIOScratchBufferAllocator initWithDevice:]([_MTLIOScratchBufferAllocator alloc], "initWithDevice:", v12->_device);
    v12->_scratchBufferAllocator = (MTLIOScratchBufferAllocator *)v18;
    v12->_usesPooledScratchBufferAllocator = objc_msgSend(a4, "scratchBufferAllocator") == 0;
    v12->cmdCvar.__sig = 1018212795;
    *(_OWORD *)v12->cmdCvar.__opaque = 0u;
    *(_OWORD *)&v12->cmdCvar.__opaque[16] = 0u;
    *(_QWORD *)&v12->cmdCvar.__opaque[32] = 0;
    v12->cmdMutex.__sig = 850045863;
    *(_OWORD *)v12->cmdMutex.__opaque = 0u;
    *(_OWORD *)&v12->cmdMutex.__opaque[16] = 0u;
    *(_OWORD *)&v12->cmdMutex.__opaque[32] = 0u;
    *(_QWORD *)&v12->cmdMutex.__opaque[48] = 0;
    v12->_type = objc_msgSend(a4, "type");
    if (objc_msgSend(a4, "maxCommandsInFlight"))
    {
      v19 = objc_msgSend(a4, "maxCommandsInFlight");
      if (v19 >= objc_msgSend(a3, "maxIOCommandsInFlight"))
        v20 = objc_msgSend(a3, "maxIOCommandsInFlight");
      else
        v20 = objc_msgSend(a4, "maxCommandsInFlight");
    }
    else
    {
      v20 = (unint64_t)objc_msgSend(a3, "maxIOCommandsInFlight") >> 1;
    }
    v12->_maxWorkerThreads = v20;
    v12->_resourceListPool = (MTLResourceListPool *)objc_msgSend(a3, "akIOResourceListPool");
    v12->_priority = objc_msgSend(a4, "priority");
    v12->_commandList.activeq.tqh_first = 0;
    v12->_commandList.activeq.tqh_last = &v12->_commandList.activeq.tqh_first;
    v12->_commandList.cond = &v12->cmdCvar;
    v12->_commandList.queue = v12;
    v12->_commandList.lock = &v12->cmdMutex;
    v12->_commandList.exit = 0;
    -[_MTLIOCommandQueue launchIOWorkerThreads](v12, "launchIOWorkerThreads");
  }
  _MTLMessageContextEnd((uint64_t)v32);
  return v12;
}

- (void)launchIOWorkerThreads
{
  unsigned int v3;
  uint64_t v4;
  NSObject *commitQueue;
  _QWORD block[5];

  if (self->_maxWorkerThreads)
  {
    v3 = 1;
    v4 = MEMORY[0x1E0C809B0];
    do
    {
      commitQueue = self->_commitQueue;
      block[0] = v4;
      block[1] = 3221225472;
      block[2] = __43___MTLIOCommandQueue_launchIOWorkerThreads__block_invoke;
      block[3] = &unk_1E0FE2880;
      block[4] = self;
      dispatch_async(commitQueue, block);
    }
    while (self->_maxWorkerThreads > v3++);
  }
}

- (void)didComplete:(id)a3 withStatus:(int64_t)a4
{
  objc_msgSend(a3, "didCompleteWithStatus:", a4);
  pthread_mutex_lock(&self->_completeQueueMutex);
  -[NSMutableArray removeObject:](self->_completeQueue, "removeObject:", a3);
  pthread_mutex_unlock(&self->_completeQueueMutex);
}

- (id)commandBuffer
{
  return -[_MTLIOCommandBuffer initWithQueue:resourceList:retained:]([_MTLIOCommandBuffer alloc], "initWithQueue:resourceList:retained:", self, self->_resourceListPool, 1);
}

- (id)commandBufferWithUnretainedReferences
{
  return -[_MTLIOCommandBuffer initWithQueue:resourceList:retained:]([_MTLIOCommandBuffer alloc], "initWithQueue:resourceList:retained:", self, self->_resourceListPool, 0);
}

- (void)commit:(id)a3
{
  _opaque_pthread_mutex_t *p_completeQueueMutex;
  MTLIOCommandQueueCommand *v6;

  p_completeQueueMutex = &self->_completeQueueMutex;
  pthread_mutex_lock(&self->_completeQueueMutex);
  -[NSMutableArray addObject:](self->_completeQueue, "addObject:", a3);
  pthread_mutex_unlock(p_completeQueueMutex);
  v6 = (MTLIOCommandQueueCommand *)malloc_type_malloc(0x20uLL, 0x10A00406D7A97B0uLL);
  *((_QWORD *)v6 + 1) = a3;
  *(_DWORD *)v6 = 0;
  MTLIOCommandQueueCommandListEnqueueCommand(&self->_commandList, v6);
  if (self->_type == 1)
    -[_MTLIOCommandQueue enqueueBarrier](self, "enqueueBarrier");
}

- (void)enqueueBarrier
{
  MTLIOCommandQueueCommand *v3;

  v3 = (MTLIOCommandQueueCommand *)malloc_type_malloc(0x20uLL, 0x10A00406D7A97B0uLL);
  *((_QWORD *)v3 + 1) = 0;
  *(_DWORD *)v3 = 1;
  MTLIOCommandQueueCommandListEnqueueCommand(&self->_commandList, v3);
  -[_MTLIOCommandQueue returnActiveScratchBuffersToPool](self, "returnActiveScratchBuffersToPool");
}

- (void)returnActiveScratchBuffersToPool
{
  if (self->_usesPooledScratchBufferAllocator)
    -[MTLIOScratchBufferAllocator returnActiveScratchBuffersToPool](self->_scratchBufferAllocator, "returnActiveScratchBuffersToPool");
}

- (void)kickAllocatorCleanupQueue
{
  if (self->_usesPooledScratchBufferAllocator)
    -[MTLIOScratchBufferAllocator kickCleanupQueue](self->_scratchBufferAllocator, "kickCleanupQueue");
}

- (void)dealloc
{
  NSObject *commitQueue;
  objc_super v4;
  _QWORD block[5];

  MTLIOCommandQueueCommandListDestroy(&self->_commandList);
  commitQueue = self->_commitQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29___MTLIOCommandQueue_dealloc__block_invoke;
  block[3] = &unk_1E0FE2880;
  block[4] = self;
  dispatch_barrier_sync(commitQueue, block);
  dispatch_barrier_sync((dispatch_queue_t)self->_followonQueue, &__block_literal_global_15);

  dispatch_release((dispatch_object_t)self->_commitQueue);
  dispatch_release((dispatch_object_t)self->_followonQueue);
  dispatch_release((dispatch_object_t)self->_commandBufferSemaphore);
  pthread_mutex_destroy(&self->_completeQueueMutex);

  v4.receiver = self;
  v4.super_class = (Class)_MTLIOCommandQueue;
  -[_MTLObjectWithLabel dealloc](&v4, sel_dealloc);
}

- (NSString)description
{
  return (NSString *)objc_getProperty(self, a2, 368, 1);
}

- (Class)superclass
{
  return self->superclass;
}

- (unint64_t)hash
{
  return self->hash;
}

- (MTLDevice)device
{
  return self->_device;
}

- (MTLCommandQueue)gpuQueue
{
  return self->_gpuQueue;
}

- (MTLSharedEvent)gpuEvent
{
  return self->_gpuEvent;
}

- (MTLSharedEventListener)eventSignalListener
{
  return self->_eventSignalListener;
}

- (MTLIOScratchBufferAllocator)scratchBufferAllocator
{
  return self->_scratchBufferAllocator;
}

@end
