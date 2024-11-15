@implementation IOGPUMetalIOCommandQueue

- (IOGPUMetalIOCommandQueue)initWithDevice:(id)a3 descriptor:(id)a4
{
  char *v6;
  mach_port_t *v7;
  uint64_t v8;
  _QWORD *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  dispatch_queue_t v12;
  NSObject *v13;
  dispatch_qos_class_t v14;
  NSObject *v15;
  NSObject *v16;
  _QWORD handler[5];
  _QWORD v19[6];
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)IOGPUMetalIOCommandQueue;
  v6 = -[_MTLIOCommandQueue initWithDevice:descriptor:](&v20, sel_initWithDevice_descriptor_);
  if (v6)
  {
    *((_QWORD *)v6 + 49) = a3;
    v7 = (mach_port_t *)objc_msgSend(a3, "deviceRef");
    v8 = objc_msgSend(a4, "maxCommandBufferCount");
    v9 = IOGPUIOCommandQueueCreate(v7, v8, *(_DWORD *)&v6[*MEMORY[0x24BDDD918]], *(_DWORD *)&v6[*MEMORY[0x24BDDD908]]);
    *((_QWORD *)v6 + 50) = v9;
    if (v9
      && (v10 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0),
          v11 = dispatch_queue_create("com.Metal.IOSubmissionQueueDispatch", v10),
          (*((_QWORD *)v6 + 70) = v11) != 0)
      && (v12 = dispatch_queue_create("com.Metal.IOCompletionQueueDispatch", v10), (*((_QWORD *)v6 + 71) = v12) != 0))
    {
      dispatch_release(v10);
      IOGPUIOCommandQueueSetDispatchQueue(*((dispatch_queue_t **)v6 + 50), *((NSObject **)v6 + 71));
      *((_QWORD *)v6 + 52) = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      *((_QWORD *)v6 + 53) = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      pthread_mutex_init((pthread_mutex_t *)(v6 + 432), 0);
      pthread_mutex_init((pthread_mutex_t *)(v6 + 496), 0);
      v13 = dispatch_source_create(MEMORY[0x24BDAC9C8], 0, 0, *((dispatch_queue_t *)v6 + 70));
      *((_QWORD *)v6 + 72) = v13;
      v19[0] = 0;
      v19[1] = v19;
      v19[2] = 0x3052000000;
      v19[3] = __Block_byref_object_copy_;
      v19[4] = __Block_byref_object_dispose_;
      v19[5] = v6;
      handler[0] = MEMORY[0x24BDAC760];
      handler[1] = 3221225472;
      handler[2] = __54__IOGPUMetalIOCommandQueue_initWithDevice_descriptor___block_invoke;
      handler[3] = &unk_24CC3F808;
      handler[4] = v19;
      dispatch_source_set_event_handler(v13, handler);
      dispatch_resume(*((dispatch_object_t *)v6 + 72));
      v14 = MTLIOQosClassForPriority();
      v15 = dispatch_queue_attr_make_with_qos_class(MEMORY[0x24BDAC9C0], v14, 0);
      *((_QWORD *)v6 + 73) = dispatch_queue_create("com.Metal.IOThreads", v15);
      dispatch_release(v15);
      if (*((_QWORD *)v6 + 73))
      {
        v16 = dispatch_queue_attr_make_with_qos_class(0, v14, 0);
        *((_QWORD *)v6 + 74) = dispatch_queue_create("com.Metal.IODecompressionQueueDispatch", v16);
        dispatch_release(v16);
        if (*((_QWORD *)v6 + 74))
        {
          objc_msgSend(v6, "launchIOGPUIOThreads");
          *((_QWORD *)v6 + 75) = IOGPUIOCommandQueueGetGlobalTraceObjectID(*((_QWORD **)v6 + 50));
          _Block_object_dispose(v19, 8);
          return (IOGPUMetalIOCommandQueue *)v6;
        }
      }

      _Block_object_dispose(v19, 8);
    }
    else
    {

    }
    return 0;
  }
  return (IOGPUMetalIOCommandQueue *)v6;
}

uint64_t __54__IOGPUMetalIOCommandQueue_initWithDevice_descriptor___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "submitAvailableCommands");
}

- (void)dealloc
{
  NSObject *ioThreadDispatch;
  NSObject *decompressionQueue;
  NSObject *commandQueueEventSource;
  NSObject *completionQueueDispatch;
  NSObject *submissionQueueDispatch;
  objc_super v8;

  ioThreadDispatch = self->_ioThreadDispatch;
  if (ioThreadDispatch)
  {
    dispatch_release(ioThreadDispatch);
    self->_ioThreadDispatch = 0;
  }
  decompressionQueue = self->_decompressionQueue;
  if (decompressionQueue)
  {
    dispatch_release(decompressionQueue);
    self->_decompressionQueue = 0;
  }

  self->_pendingQueue = 0;
  self->_submittedQueue = 0;
  commandQueueEventSource = self->_commandQueueEventSource;
  if (commandQueueEventSource)
  {
    dispatch_source_cancel(commandQueueEventSource);
    dispatch_release((dispatch_object_t)self->_commandQueueEventSource);
    self->_commandQueueEventSource = 0;
  }
  completionQueueDispatch = self->_completionQueueDispatch;
  if (completionQueueDispatch)
  {
    dispatch_release(completionQueueDispatch);
    self->_completionQueueDispatch = 0;
  }
  submissionQueueDispatch = self->_submissionQueueDispatch;
  if (submissionQueueDispatch)
  {
    dispatch_release(submissionQueueDispatch);
    self->_submissionQueueDispatch = 0;
  }
  IOGPUIOCommandQueueRelease(self->_ioCommandQueueRef);

  self->_gpuQueue = 0;
  self->_device = 0;
  v8.receiver = self;
  v8.super_class = (Class)IOGPUMetalIOCommandQueue;
  -[_MTLIOCommandQueue dealloc](&v8, sel_dealloc);
}

- (int64_t)getPriority
{
  return *(int64_t *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x24BDDD908]);
}

- (id)commandBuffer
{
  IOGPUMetalIOCommandBuffer *v3;

  v3 = [IOGPUMetalIOCommandBuffer alloc];
  return -[IOGPUMetalIOCommandBuffer initWithQueue:resourceList:retained:](v3, "initWithQueue:resourceList:retained:", self, *(Class *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x24BDDD910]), 1);
}

- (id)commandBufferWithUnretainedReferences
{
  IOGPUMetalIOCommandBuffer *v3;

  v3 = [IOGPUMetalIOCommandBuffer alloc];
  return -[IOGPUMetalIOCommandBuffer initWithQueue:resourceList:retained:](v3, "initWithQueue:resourceList:retained:", self, *(Class *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x24BDDD910]), 0);
}

- (void)enqueueCommandBuffer:(id)a3
{
  _opaque_pthread_mutex_t *p_pendingQueueLock;

  p_pendingQueueLock = &self->_pendingQueueLock;
  pthread_mutex_lock(&self->_pendingQueueLock);
  -[NSMutableArray addObject:](self->_pendingQueue, "addObject:", a3);
  pthread_mutex_unlock(p_pendingQueueLock);
  if (*(Class *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x24BDDD918]) == (Class)1)
    -[IOGPUMetalIOCommandQueue enqueueBarrier](self, "enqueueBarrier");
}

- (void)commitCommandBuffer:(id)a3
{
  dispatch_source_merge_data((dispatch_source_t)self->_commandQueueEventSource, 1uLL);
}

- (void)enqueueBarrier
{
  _opaque_pthread_mutex_t *p_pendingQueueLock;

  p_pendingQueueLock = &self->_pendingQueueLock;
  pthread_mutex_lock(&self->_pendingQueueLock);
  -[NSMutableArray lastObject](self->_pendingQueue, "lastObject");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    -[NSMutableArray addObject:](self->_pendingQueue, "addObject:", CFSTR("Barrier"));
  pthread_mutex_unlock(p_pendingQueueLock);
  -[_MTLIOCommandQueue returnActiveScratchBuffersToPool](self, "returnActiveScratchBuffersToPool");
}

- (void)didComplete:(id)a3 withStatus:(int64_t)a4
{
  objc_msgSend(a3, "didCompleteWithStatus:", a4);
  pthread_mutex_lock(&self->_submittedQueueLock);
  -[NSMutableArray removeObject:](self->_submittedQueue, "removeObject:", a3);
  pthread_mutex_unlock(&self->_submittedQueueLock);
}

- (void)_submitAvailableCommands:(void *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _DWORD *v8;
  size_t v9;
  _DWORD *v10;
  uint64_t v11;
  unsigned int v12;
  _DWORD *v13;
  uint64_t v14;
  unsigned int v15;
  BOOL v16;
  uint64_t *v17;
  uint64_t v18;
  NSObject *completionQueueDispatch;
  uint64_t v20;
  _DWORD *v21;
  _QWORD block[5];
  _QWORD aBlock[7];

  aBlock[6] = *MEMORY[0x24BDAC8D0];
  v5 = (uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 3;
  v6 = v5;
  MEMORY[0x24BDAC7A8](self, 24 * v5 + 8);
  v8 = (_DWORD *)((char *)&v20 - v7);
  bzero((char *)&v20 - v7, v9);
  *v8 = v5;
  v21 = v8;
  if ((_DWORD)v5)
  {
    v10 = v8;
    v11 = 0;
    v12 = 0;
    v13 = v10 + 3;
    do
    {
      v14 = *(_QWORD *)(*(_QWORD *)a3 + v11);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        *(_QWORD *)(v13 + 1) = 0;
        *(_QWORD *)(v13 - 1) = 0;
      }
      else
      {
        if ((objc_msgSend((id)v14, "isCommitted") & 1) == 0)
          -[IOGPUMetalIOCommandQueue _submitAvailableCommands:].cold.1();
        *(v13 - 1) = *(_DWORD *)(v14 + 392);
        *v13 = *(_DWORD *)(*(_QWORD *)(v14 + 312) + 128);
        aBlock[0] = MEMORY[0x24BDAC760];
        aBlock[1] = 3221225472;
        aBlock[2] = __53__IOGPUMetalIOCommandQueue__submitAvailableCommands___block_invoke;
        aBlock[3] = &unk_24CC3F830;
        aBlock[4] = self;
        aBlock[5] = v14;
        *(_QWORD *)(v13 + 1) = _Block_copy(aBlock);
        *((_BYTE *)v13 + 12) = objc_msgSend((id)v14, "hasFollowOnWork");
        v15 = atomic_load((unsigned int *)(v14 + 384));
        pthread_mutex_lock(&self->_submittedQueueLock);
        -[NSMutableArray addObject:](self->_submittedQueue, "addObject:", v14);
        pthread_mutex_unlock(&self->_submittedQueueLock);
        objc_msgSend((id)v14, "globalTraceObjectID");
        v12 += v15 + 1;
        if (*(_DWORD *)__globalGPUCommPage)
        {
          -[MTLDevice globalTraceObjectID](self->_device, "globalTraceObjectID");
          IOGPUDeviceTraceEvent();
        }
      }

      v13 += 6;
      v11 += 8;
    }
    while (8 * v5 != v11);
  }
  else
  {
    v12 = 0;
  }
  if (IOGPUIOCommandQueueSubmitIOCommands((uint64_t)self->_ioCommandQueueRef, v21, v12))
    v16 = v5 == 0;
  else
    v16 = 1;
  if (!v16)
  {
    v17 = (uint64_t *)(v21 + 4);
    do
    {
      v18 = *v17;
      if (*v17)
      {
        completionQueueDispatch = self->_completionQueueDispatch;
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __53__IOGPUMetalIOCommandQueue__submitAvailableCommands___block_invoke_2;
        block[3] = &unk_24CC3F858;
        block[4] = v18;
        dispatch_async(completionQueueDispatch, block);
      }
      v17 += 3;
      --v6;
    }
    while (v6);
  }
  *((_QWORD *)a3 + 1) = *(_QWORD *)a3;
}

uint64_t __53__IOGPUMetalIOCommandQueue__submitAvailableCommands___block_invoke(uint64_t a1, unsigned int a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "didComplete:withStatus:", *(_QWORD *)(a1 + 40), a2);
}

void __53__IOGPUMetalIOCommandQueue__submitAvailableCommands___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  _Block_release(*(const void **)(a1 + 32));
}

- (void)submitAvailableCommands
{
  _opaque_pthread_mutex_t *p_pendingQueueLock;
  unsigned int v4;
  uint64_t v5;
  int v6;
  BOOL v7;
  unsigned int *v8;
  unsigned int *v9;
  char *v10;
  char *v11;
  unsigned int v12;
  unsigned int *v13;
  char *v14;
  char *v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  char *v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char *v23;
  unsigned int **v24;
  char *v25;
  char *v26;
  unsigned int *v27;
  unsigned int **v28;
  char *v29;
  char *v30;
  unsigned int *v31;
  IOGPUMetalIOCommandQueue *v32;
  pthread_mutex_t *v33;
  void *__p;
  char *v35;
  char *v36;

  __p = 0;
  v35 = 0;
  v36 = 0;
  p_pendingQueueLock = &self->_pendingQueueLock;
  v32 = self;
  v33 = p_pendingQueueLock;
  do
  {
    pthread_mutex_lock(p_pendingQueueLock);
    v4 = -[NSMutableArray count](self->_pendingQueue, "count");
    v5 = 0;
    if (v4)
    {
      v6 = 0;
      v7 = 1;
      do
      {
        v8 = (unsigned int *)-[NSMutableArray objectAtIndex:](self->_pendingQueue, "objectAtIndex:", v5, v32);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v9 = v8;
          v10 = v35;
          if (v35 >= v36)
          {
            v16 = (v35 - (_BYTE *)__p) >> 3;
            if ((unint64_t)(v16 + 1) >> 61)
              std::vector<NSObject *>::__throw_length_error[abi:ne180100]();
            v17 = (v36 - (_BYTE *)__p) >> 2;
            if (v17 <= v16 + 1)
              v17 = v16 + 1;
            if ((unint64_t)(v36 - (_BYTE *)__p) >= 0x7FFFFFFFFFFFFFF8)
              v18 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v18 = v17;
            if (v18)
              v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<NSObject *>>((uint64_t)&v36, v18);
            else
              v19 = 0;
            v24 = (unsigned int **)&v19[8 * v16];
            *v24 = v8;
            v11 = (char *)(v24 + 1);
            v26 = (char *)__p;
            v25 = v35;
            if (v35 != __p)
            {
              do
              {
                v27 = (unsigned int *)*((_QWORD *)v25 - 1);
                v25 -= 8;
                *--v24 = v27;
              }
              while (v25 != v26);
              v25 = (char *)__p;
            }
            __p = v24;
            v35 = v11;
            v36 = &v19[8 * v18];
            if (v25)
              operator delete(v25);
          }
          else
          {
            *(_QWORD *)v35 = v8;
            v11 = v10 + 8;
          }
          v35 = v11;
        }
        else
        {
          if (!objc_msgSend(v8, "isCommitted"))
            goto LABEL_45;
          v12 = atomic_load(v8 + 96);
          if (objc_msgSend(v8, "validateNotificationCount"))
          {
            if ((v12 + v6) >> 13)
              goto LABEL_45;
            v13 = v8;
            v14 = v35;
            if (v35 >= v36)
            {
              v20 = (v35 - (_BYTE *)__p) >> 3;
              if ((unint64_t)(v20 + 1) >> 61)
                std::vector<NSObject *>::__throw_length_error[abi:ne180100]();
              v21 = (v36 - (_BYTE *)__p) >> 2;
              if (v21 <= v20 + 1)
                v21 = v20 + 1;
              if ((unint64_t)(v36 - (_BYTE *)__p) >= 0x7FFFFFFFFFFFFFF8)
                v22 = 0x1FFFFFFFFFFFFFFFLL;
              else
                v22 = v21;
              if (v22)
                v23 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<NSObject *>>((uint64_t)&v36, v22);
              else
                v23 = 0;
              v28 = (unsigned int **)&v23[8 * v20];
              *v28 = v8;
              v15 = (char *)(v28 + 1);
              v30 = (char *)__p;
              v29 = v35;
              if (v35 != __p)
              {
                do
                {
                  v31 = (unsigned int *)*((_QWORD *)v29 - 1);
                  v29 -= 8;
                  *--v28 = v31;
                }
                while (v29 != v30);
                v29 = (char *)__p;
              }
              __p = v28;
              v35 = v15;
              v36 = &v23[8 * v22];
              if (v29)
                operator delete(v29);
            }
            else
            {
              *(_QWORD *)v35 = v8;
              v15 = v14 + 8;
            }
            v35 = v15;
            v6 += v12 + 1;
          }
        }
        v7 = ++v5 < (unint64_t)v4;
      }
      while (v5 != v4);
      LODWORD(v5) = v4;
    }
    else
    {
      v7 = 0;
    }
LABEL_45:
    -[NSMutableArray removeObjectsInRange:](self->_pendingQueue, "removeObjectsInRange:", 0, v5, v32);
    p_pendingQueueLock = v33;
    pthread_mutex_unlock(v33);
    if (__p == v35)
      break;
    -[IOGPUMetalIOCommandQueue _submitAvailableCommands:](self, "_submitAvailableCommands:", &__p);
    if (__p != v35)
      __assert_rtn("-[IOGPUMetalIOCommandQueue submitAvailableCommands]", "IOGPUMetalIOCommandQueue.mm", 550, "submitCommands.empty()");
  }
  while (v7);

  if (__p)
  {
    v35 = (char *)__p;
    operator delete(__p);
  }
}

- (unint64_t)globalTraceObjectID
{
  return self->_globalTraceObjectID;
}

- (void)setLabel:(id)a3
{
  uint64_t v5;
  unint64_t globalTraceObjectID;
  uint64_t v7;
  uint64_t v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)IOGPUMetalIOCommandQueue;
  -[_MTLObjectWithLabel setLabel:](&v9, sel_setLabel_);
  if (*(_DWORD *)__globalGPUCommPage)
  {
    v5 = -[MTLDevice deviceRef](self->_device, "deviceRef");
    globalTraceObjectID = self->_globalTraceObjectID;
    v7 = (int)*MEMORY[0x24BDDD8F8];
    v8 = *(uint64_t *)((char *)&self->super.super.super.isa + v7);
    objc_msgSend(a3, "cStringUsingEncoding:", 1);
    *(Class *)((char *)&self->super.super.super.isa + v7) = (Class)IOGPUDeviceTraceObjectLabel(v5, 8, 0, globalTraceObjectID, v8);
  }
}

- (void)launchIOGPUIOThreads
{
  uint64_t v2;
  objc_class *v4;
  uint64_t v5;
  NSObject *ioThreadDispatch;
  _QWORD block[5];

  v2 = (int)*MEMORY[0x24BDDD900];
  if (*(Class *)((char *)&self->super.super.super.isa + v2))
  {
    v4 = 0;
    v5 = MEMORY[0x24BDAC760];
    do
    {
      ioThreadDispatch = self->_ioThreadDispatch;
      block[0] = v5;
      block[1] = 3221225472;
      block[2] = __48__IOGPUMetalIOCommandQueue_launchIOGPUIOThreads__block_invoke;
      block[3] = &unk_24CC3F880;
      block[4] = self;
      dispatch_async(ioThreadDispatch, block);
      v4 = (objc_class *)((char *)v4 + 1);
    }
    while (v4 < *(Class *)((char *)&self->super.super.super.isa + v2));
  }
}

uint64_t __48__IOGPUMetalIOCommandQueue_launchIOGPUIOThreads__block_invoke(uint64_t a1)
{
  uint64_t result;

  do
    result = IOGPUIOCommandQueuePerformIO(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 400));
  while ((_DWORD)result != -536870165);
  return result;
}

- (id)getDecompressionQueue
{
  return self->_decompressionQueue;
}

- (void)commandBufferComplete
{
  IOGPUIOCommandQueueIOCommandBufferComplete((uint64_t)self->_ioCommandQueueRef);
}

- (void)_submitAvailableCommands:.cold.1()
{
  __assert_rtn("-[IOGPUMetalIOCommandQueue _submitAvailableCommands:]", "IOGPUMetalIOCommandQueue.mm", 431, "[commandBuffer isCommitted]");
}

@end
