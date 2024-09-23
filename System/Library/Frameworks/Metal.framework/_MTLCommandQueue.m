@implementation _MTLCommandQueue

- (unint64_t)getAndIncrementNumCommandBuffers
{
  return (int)MTLAtomicIncrement((unsigned int *)&self->_numCommandBuffers);
}

- (_MTLCommandQueue)initWithDevice:(id)a3 descriptor:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  dispatch_semaphore_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  id v23;
  void *v24;
  _QWORD *v25;
  id v26;
  dispatch_semaphore_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  char v34;
  const __CFString *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD handler[5];
  _QWORD v52[6];
  objc_super v53;
  _OWORD v54[3];
  uint64_t v55;

  v55 = 0;
  memset(v54, 0, sizeof(v54));
  _MTLMessageContextBegin_((uint64_t)v54, (uint64_t)"-[_MTLCommandQueue initWithDevice:descriptor:]", 141, (uint64_t)a3, 13, (uint64_t)"Command Queue Creation Validation");
  if (!a3)
  {
    v36 = CFSTR("device must not be nil.");
    v37 = 4;
LABEL_43:
    _MTLMessageContextPush_((uint64_t)v54, v37, (uint64_t)v36, v7, v8, v9, v10, v11, v50);
    goto LABEL_3;
  }
  if (MTLFailureTypeGetEnabled(1uLL) && (objc_msgSend(a3, "conformsToProtocol:", &unk_1EDCF1690) & 1) == 0)
  {
    v36 = CFSTR("device is not a MTLDevice.");
    v37 = 8;
    goto LABEL_43;
  }
LABEL_3:
  if (!objc_msgSend(a4, "maxCommandBufferCount"))
  {
    v38 = objc_msgSend(a4, "maxCommandBufferCount");
    _MTLMessageContextPush_((uint64_t)v54, 4, (uint64_t)CFSTR("invalid descriptor.maxCommandBufferCount value %u"), v39, v40, v41, v42, v43, v38);
  }
  if (objc_msgSend(a4, "qosLevel")
    && objc_msgSend(a4, "qosLevel") != 1
    && objc_msgSend(a4, "qosLevel") != 2
    && objc_msgSend(a4, "qosLevel") != 3
    && objc_msgSend(a4, "qosLevel") != 4)
  {
    v44 = objc_msgSend(a4, "qosLevel");
    _MTLMessageContextPush_((uint64_t)v54, 4, (uint64_t)CFSTR("invalid descriptor.qosLevel value %u"), v45, v46, v47, v48, v49, v44);
  }
  if (objc_msgSend(a3, "_rateLimitQueueCreation")
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    -[_MTLCommandQueue initWithDevice:descriptor:].cold.1();
  }
  v53.receiver = self;
  v53.super_class = (Class)_MTLCommandQueue;
  v12 = -[_MTLObjectWithLabel init](&v53, sel_init);
  if (v12)
  {
    *((_DWORD *)v12 + 54) = getpid();
    *((_QWORD *)v12 + 4) = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    *((_QWORD *)v12 + 5) = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    pthread_mutex_init((pthread_mutex_t *)(v12 + 48), 0);
    pthread_mutex_init((pthread_mutex_t *)(v12 + 112), 0);
    *((_QWORD *)v12 + 22) = dispatch_group_create();
    v12[345] = 1;
    v13 = dispatch_semaphore_create(objc_msgSend(a4, "maxCommandBufferCount"));
    *((_QWORD *)v12 + 26) = v13;
    if (!v13)
      _MTLMessageContextPush_((uint64_t)v54, 4, (uint64_t)CFSTR("cannot create command-buffer counting semaphore"), v14, v15, v16, v17, v18, v50);
    *((_QWORD *)v12 + 38) = objc_msgSend(a4, "maxCommandBufferCount");
    *((_QWORD *)v12 + 39) = objc_msgSend(a4, "qosLevel");
    *((_QWORD *)v12 + 40) = objc_msgSend(a4, "commitQueue");
    v12[328] = objc_msgSend(a4, "commitSynchronously");
    *((_QWORD *)v12 + 42) = objc_msgSend(a4, "completionQueue");
    v12[344] = objc_msgSend(a4, "disableCrossQueueHazardTracking");
    v12[347] = objc_msgSend(a4, "isOpenGLQueue");
    if (objc_msgSend(a4, "commitQueue"))
    {
      v19 = objc_msgSend(a4, "commitQueue");
      *((_QWORD *)v12 + 23) = v19;
      dispatch_retain(v19);
    }
    if (objc_msgSend(a4, "completionQueue"))
    {
      v20 = objc_msgSend(a4, "completionQueue");
      *((_QWORD *)v12 + 24) = v20;
      dispatch_retain(v20);
    }
    v12[376] = objc_msgSend(a4, "commitsWithQoS");
    v21 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    if (!*((_QWORD *)v12 + 23))
      *((_QWORD *)v12 + 23) = dispatch_queue_create("com.Metal.CommandQueueDispatch", v21);
    if (!*((_QWORD *)v12 + 24))
      *((_QWORD *)v12 + 24) = dispatch_queue_create("com.Metal.CompletionQueueDispatch", v21);
    dispatch_release(v21);
    v22 = dispatch_source_create(MEMORY[0x1E0C80D70], 0, 0, *((dispatch_queue_t *)v12 + 23));
    *((_QWORD *)v12 + 25) = v22;
    v52[0] = 0;
    v52[1] = v52;
    v52[2] = 0x3052000000;
    v52[3] = __Block_byref_object_copy__13;
    v52[4] = __Block_byref_object_dispose__13;
    v52[5] = v12;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __46___MTLCommandQueue_initWithDevice_descriptor___block_invoke;
    handler[3] = &unk_1E0FE3468;
    handler[4] = v52;
    dispatch_source_set_event_handler(v22, handler);
    dispatch_resume(*((dispatch_object_t *)v12 + 25));
    v23 = a3;
    *((_QWORD *)v12 + 3) = v23;
    objc_msgSend(v23, "_incrementCommandQueueCount");
    v12[256] = 0;
    *((_QWORD *)v12 + 33) = 0;
    *((_QWORD *)v12 + 34) = 0;
    *((_QWORD *)v12 + 36) = 0;
    atomic_store(0, (unsigned int *)v12 + 70);
    if (objc_msgSend(a4, "logState"))
    {
      v24 = (void *)objc_msgSend(a4, "logState");
    }
    else
    {
      v25 = (_QWORD *)*((_QWORD *)v12 + 3);
      if (!v25[45])
      {
        v26 = 0;
        goto LABEL_32;
      }
      if (!objc_msgSend(v25, "defaultLogState"))
        objc_msgSend(*((id *)v12 + 3), "initDefaultLogState");
      v24 = (void *)objc_msgSend(*((id *)v12 + 3), "defaultLogState");
    }
    v26 = v24;
LABEL_32:
    *((_QWORD *)v12 + 31) = v26;
    *((_QWORD *)v12 + 37) = 0;
    v27 = dispatch_semaphore_create(0);
    *((_QWORD *)v12 + 44) = v27;
    if (!v27)
      _MTLMessageContextPush_((uint64_t)v54, 4, (uint64_t)CFSTR("cannot create presentation semaphore"), v28, v29, v30, v31, v32, v50);
    if (initWithDevice_descriptor__onceToken != -1)
      dispatch_once(&initWithDevice_descriptor__onceToken, &__block_literal_global_22);
    v33 = objc_msgSend(a4, "commitSynchronously");
    if (initWithDevice_descriptor__force_immediate_submission_on_commit_thread)
      v34 = 1;
    else
      v34 = v33;
    v12[360] = v34;
    *((_QWORD *)v12 + 46) = objc_alloc_init(MTLPrivateDataTable);
    _Block_object_dispose(v52, 8);
  }
  _MTLMessageContextEnd((uint64_t)v54);
  return (_MTLCommandQueue *)v12;
}

- (unint64_t)globalTraceObjectID
{
  return self->_globalTraceObjectID;
}

- (int)backgroundTrackingPID
{
  return self->_backgroundTrackingPID;
}

- (void)commandBufferDidComplete:(id)a3 startTime:(unint64_t)a4 completionTime:(unint64_t)a5 error:(id)a6
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v13;
  const __CFString *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  if (!a3)
  {
    v14 = CFSTR("commandBuffer must not be nil.");
    v15 = 0;
    v16 = 673;
LABEL_9:
    MTLReportFailure(v15, "-[_MTLCommandQueue commandBufferDidComplete:startTime:completionTime:error:]", v16, (uint64_t)v14, a5, (uint64_t)a6, v6, v7, v21);
    goto LABEL_4;
  }
  if (MTLFailureTypeGetEnabled(1uLL) && (objc_msgSend(a3, "conformsToProtocol:", &unk_1EDCF3B50) & 1) == 0)
    MTLReportFailure(1uLL, "-[_MTLCommandQueue commandBufferDidComplete:startTime:completionTime:error:]", 676, (uint64_t)CFSTR("commandBuffer is not a MTLCommandBuffer."), v17, v18, v19, v20, v21);
  v13 = -[_MTLCommandQueue device](self, "device");
  if (v13 != objc_msgSend(a3, "device"))
  {
    v14 = CFSTR("commandBuffer is associated with a different device");
    v15 = 1;
    v16 = 677;
    goto LABEL_9;
  }
LABEL_4:
  objc_msgSend(a3, "didCompleteWithStartTime:endTime:error:", a4, a5, a6);
  pthread_mutex_lock(&self->_submittedQueueLock);
  -[NSMutableArray removeObject:](self->_submittedQueue, "removeObject:", a3);
  pthread_mutex_unlock(&self->_submittedQueueLock);
  dispatch_group_leave((dispatch_group_t)self->_submittedGroup);
}

- (void)commitCommandBuffer:(id)a3 wake:(BOOL)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BOOL4 v8;
  uint64_t v11;
  _MTLCommandQueue *v12;
  _MTLCommandQueue *v13;
  const __CFString *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v8 = a4;
  if (!a3)
  {
    v14 = CFSTR("commandBuffer must not be nil.");
    v15 = 0;
    v16 = 630;
LABEL_15:
    MTLReportFailure(v15, "-[_MTLCommandQueue commitCommandBuffer:wake:]", v16, (uint64_t)v14, v4, v5, v6, v7, v21);
    goto LABEL_4;
  }
  if (MTLFailureTypeGetEnabled(1uLL) && (objc_msgSend(a3, "conformsToProtocol:", &unk_1EDCF3B50) & 1) == 0)
    MTLReportFailure(1uLL, "-[_MTLCommandQueue commitCommandBuffer:wake:]", 633, (uint64_t)CFSTR("commandBuffer is not a MTLCommandBuffer."), v17, v18, v19, v20, v21);
  v11 = -[_MTLCommandQueue device](self, "device");
  if (v11 != objc_msgSend(a3, "device"))
  {
    v14 = CFSTR("commandBuffer is associated with a different device");
    v15 = 1;
    v16 = 634;
    goto LABEL_15;
  }
LABEL_4:
  dispatch_group_enter((dispatch_group_t)self->_submittedGroup);
  objc_msgSend(a3, "setCommitted:", 1);
  if (v8)
  {
    if (self->_forceImmediateSubmissionOnCommitThread)
    {
      v12 = self;
      dispatch_sync_f((dispatch_queue_t)self->_commandQueueDispatch, self, (dispatch_function_t)_submitAvailableCommandBuffers);
    }
    else if (self->_commitsWithQoS)
    {
      v13 = self;
      dispatch_async_f((dispatch_queue_t)self->_commandQueueDispatch, self, (dispatch_function_t)_submitAvailableCommandBuffers);
    }
    else
    {
      dispatch_source_merge_data((dispatch_source_t)self->_commandQueueEventSource, 1uLL);
    }
  }
}

- (BOOL)_submitAvailableCommandBuffers
{
  _opaque_pthread_mutex_t *p_pendingQueueLock;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  unint64_t v14;
  _MTLCommandQueue *v15;
  BOOL v16;
  _MTLCommandQueue *v18;
  unint64_t v19;
  uint64_t v20;
  pthread_mutex_t *v21;
  uint64_t v22;
  _BYTE v23[1024];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  p_pendingQueueLock = &self->_pendingQueueLock;
  pthread_mutex_lock(&self->_pendingQueueLock);
  v4 = -[NSMutableArray count](self->_pendingQueue, "count");
  if (!v4)
  {
    pthread_mutex_unlock(p_pendingQueueLock);
LABEL_30:
    v15 = 0;
    v14 = 0;
    goto LABEL_31;
  }
  v5 = 0;
  while (objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_pendingQueue, "objectAtIndex:", v5), "isCommitted"))
  {
    if (v4 == ++v5)
    {
      v5 = v4;
      break;
    }
  }
  pthread_mutex_unlock(p_pendingQueueLock);
  if (!v5)
    goto LABEL_30;
  v20 = v4;
  v18 = self;
  v19 = v5;
  v21 = p_pendingQueueLock;
  do
  {
    pthread_mutex_lock(p_pendingQueueLock);
    v6 = 0;
    while (1)
    {
      v7 = -[NSMutableArray objectAtIndex:](self->_pendingQueue, "objectAtIndex:", v6);
      if (*(_BYTE *)(v7 + 504))
        break;
      if (v5 == ++v6)
      {
        v8 = 0;
        v9 = v5;
        goto LABEL_13;
      }
    }
    v8 = *(_QWORD *)(v7 + 552);
    v9 = v6 + 1;
LABEL_13:
    pthread_mutex_lock(&self->_submittedQueueLock);
    v22 = -[NSMutableArray count](self->_submittedQueue, "count");
    if (v9 >= 0x81)
      v10 = malloc_type_malloc(8 * v9, 0x80040B8603338uLL);
    else
      v10 = v23;
    -[NSMutableArray getObjects:range:](self->_pendingQueue, "getObjects:range:", v10, 0, v9);
    v11 = 0;
    do
      v12 = *(id *)&v10[8 * v11++];
    while (v9 != v11);
    -[NSMutableArray replaceObjectsInRange:withObjectsFromArray:range:](self->_submittedQueue, "replaceObjectsInRange:withObjectsFromArray:range:", v22, 0, self->_pendingQueue, 0, v9);
    -[NSMutableArray removeObjectsInRange:](self->_pendingQueue, "removeObjectsInRange:", 0, v9);
    pthread_mutex_unlock(&self->_submittedQueueLock);
    p_pendingQueueLock = v21;
    pthread_mutex_unlock(v21);
    if (self->_executionEnabled)
      -[_MTLCommandQueue submitCommandBuffers:count:](self, "submitCommandBuffers:count:", v10, v9);
    else
      -[_MTLCommandQueue completeCommandBuffers:count:](self, "completeCommandBuffers:count:", v10, v9);
    v13 = 0;
    do

    while (v9 != v13);
    if (v10 != v23)
      free(v10);
    for (; v8; --v8)
      dispatch_semaphore_wait((dispatch_semaphore_t)self->_presentScheduledSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    v5 -= v9;
  }
  while (v5);
  v14 = v19;
  v4 = v20;
  v15 = v18;
LABEL_31:
  v16 = v14 == v4;

  return v16;
}

- (BOOL)submitCommandBuffer:(id)a3
{
  NSObject *commandQueueDispatch;
  char v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  commandQueueDispatch = self->_commandQueueDispatch;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40___MTLCommandQueue_submitCommandBuffer___block_invoke;
  v6[3] = &unk_1E0FE32E0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(commandQueueDispatch, v6);
  v4 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (_MTLCommandQueue)initWithDevice:(id)a3
{
  return -[_MTLCommandQueue initWithDevice:maxCommandBufferCount:](self, "initWithDevice:maxCommandBufferCount:", a3, 64);
}

- (void)enqueueCommandBuffer:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  if (a3)
  {
    if (MTLFailureTypeGetEnabled(1uLL) && (objc_msgSend(a3, "conformsToProtocol:", &unk_1EDCF3B50) & 1) == 0)
      MTLReportFailure(1uLL, "-[_MTLCommandQueue enqueueCommandBuffer:]", 470, (uint64_t)CFSTR("commandBuffer is not a MTLCommandBuffer."), v14, v15, v16, v17, v18);
    v9 = -[_MTLCommandQueue device](self, "device");
    if (v9 != objc_msgSend(a3, "device"))
      MTLReportFailure(1uLL, "-[_MTLCommandQueue enqueueCommandBuffer:]", 471, (uint64_t)CFSTR("commandBuffer is associated with a different device"), v10, v11, v12, v13, v18);
    pthread_mutex_lock(&self->_pendingQueueLock);
    -[NSMutableArray addObject:](self->_pendingQueue, "addObject:", a3);
    pthread_mutex_unlock(&self->_pendingQueueLock);
  }
  else
  {
    MTLReportFailure(0, "-[_MTLCommandQueue enqueueCommandBuffer:]", 467, (uint64_t)CFSTR("commandBuffer must not be nil."), v3, v4, v5, v6, v19);
  }
}

- (_MTLCommandQueue)initWithDevice:(id)a3 maxCommandBufferCount:(unint64_t)a4
{
  MTLCommandQueueDescriptor *v7;

  v7 = objc_alloc_init(MTLCommandQueueDescriptor);
  -[MTLCommandQueueDescriptor setMaxCommandBufferCount:](v7, "setMaxCommandBufferCount:", a4);
  return -[_MTLCommandQueue initWithDevice:descriptor:](self, "initWithDevice:descriptor:", a3, v7);
}

- (void)setLabel:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_MTLCommandQueue;
  -[_MTLObjectWithLabel setLabel:](&v3, sel_setLabel_, a3);
}

- (void)dealloc
{
  NSObject *commandQueueEventSource;
  NSObject *commandQueueDispatch;
  NSObject *completionQueueDispatch;
  id perfSampleHandlerBlock;
  NSObject *presentScheduledSemaphore;
  MTLPrivateDataTable *privateDataTable;
  objc_super v9;

  commandQueueEventSource = self->_commandQueueEventSource;
  if (commandQueueEventSource)
  {
    dispatch_source_cancel(commandQueueEventSource);
    dispatch_release((dispatch_object_t)self->_commandQueueEventSource);
  }
  commandQueueDispatch = self->_commandQueueDispatch;
  if (commandQueueDispatch)
    dispatch_release(commandQueueDispatch);
  self->_commandQueueDispatch = 0;
  completionQueueDispatch = self->_completionQueueDispatch;
  if (completionQueueDispatch)
    dispatch_release(completionQueueDispatch);
  self->_completionQueueDispatch = 0;

  self->_pendingQueue = 0;
  self->_submittedQueue = 0;
  dispatch_release((dispatch_object_t)self->_submittedGroup);
  dispatch_release((dispatch_object_t)self->_commandBufferSemaphore);
  pthread_mutex_destroy(&self->_submittedQueueLock);
  pthread_mutex_destroy(&self->_pendingQueueLock);
  -[_MTLDevice _decrementCommandQueueCount](self->_dev, "_decrementCommandQueueCount");

  self->_dev = 0;
  perfSampleHandlerBlock = self->_perfSampleHandlerBlock;
  if (perfSampleHandlerBlock)
    _Block_release(perfSampleHandlerBlock);
  presentScheduledSemaphore = self->_presentScheduledSemaphore;
  if (presentScheduledSemaphore)
  {
    dispatch_release(presentScheduledSemaphore);
    self->_presentScheduledSemaphore = 0;
  }
  privateDataTable = self->_privateDataTable;
  if (privateDataTable)
  {

    self->_privateDataTable = 0;
  }

  v9.receiver = self;
  v9.super_class = (Class)_MTLCommandQueue;
  -[_MTLObjectWithLabel dealloc](&v9, sel_dealloc);
}

- (void)setSubmissionQueue:(id)a3
{
  NSObject *commandQueueEventSource;
  NSObject *commandQueueDispatch;
  OS_dispatch_source *v7;
  _QWORD handler[5];
  _QWORD v9[6];

  commandQueueEventSource = self->_commandQueueEventSource;
  if (commandQueueEventSource)
  {
    dispatch_source_cancel(commandQueueEventSource);
    dispatch_release((dispatch_object_t)self->_commandQueueEventSource);
  }
  commandQueueDispatch = self->_commandQueueDispatch;
  if (commandQueueDispatch)
    dispatch_release(commandQueueDispatch);
  dispatch_retain((dispatch_object_t)a3);
  self->_commandQueueDispatch = (OS_dispatch_queue *)a3;
  v7 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80D70], 0, 0, (dispatch_queue_t)a3);
  self->_commandQueueEventSource = v7;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3052000000;
  v9[3] = __Block_byref_object_copy__13;
  v9[4] = __Block_byref_object_dispose__13;
  v9[5] = self;
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __39___MTLCommandQueue_setSubmissionQueue___block_invoke;
  handler[3] = &unk_1E0FE3468;
  handler[4] = v9;
  dispatch_source_set_event_handler((dispatch_source_t)v7, handler);
  dispatch_resume((dispatch_object_t)self->_commandQueueEventSource);
  _Block_object_dispose(v9, 8);
}

- (unint64_t)numCommandBuffers
{
  return (int)atomic_load((unsigned int *)&self->_numCommandBuffers);
}

- (id)formattedDescription:(unint64_t)a3
{
  unint64_t v4;
  uint64_t v5;
  __CFString *v6;
  void *v7;
  id v8;
  const __CFString *v9;
  uint64_t v10;
  const __CFString *v11;
  void *v12;
  objc_super v14;
  _QWORD v15[7];

  v15[6] = *MEMORY[0x1E0C80C00];
  v4 = a3 + 4;
  v5 = objc_msgSend(CFSTR("\n"), "stringByPaddingToLength:withString:startingAtIndex:", a3 + 4, CFSTR(" "), 0);
  v6 = -[_MTLObjectWithLabel retainedLabel](self, "retainedLabel");
  v7 = (void *)MEMORY[0x1E0CB3940];
  v14.receiver = self;
  v14.super_class = (Class)_MTLCommandQueue;
  v8 = -[_MTLCommandQueue description](&v14, sel_description);
  v15[0] = v5;
  v15[1] = CFSTR("label =");
  v9 = CFSTR("<none>");
  if (v6)
    v9 = v6;
  v15[2] = v9;
  v15[3] = v5;
  v15[4] = CFSTR("device =");
  v10 = objc_msgSend((id)-[_MTLCommandQueue device](self, "device"), "formattedDescription:", v4);
  v11 = CFSTR("<null>");
  if (v10)
    v11 = (const __CFString *)v10;
  v15[5] = v11;
  v12 = (void *)objc_msgSend(v7, "stringWithFormat:", CFSTR("%@%@"), v8, objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 6), "componentsJoinedByString:", CFSTR(" ")));

  return v12;
}

- (id)description
{
  return -[_MTLCommandQueue formattedDescription:](self, "formattedDescription:", 0);
}

- (id)commandBufferWithDescriptor:(id)a3
{
  void *v5;
  void *v6;

  if (objc_msgSend(a3, "retainedReferences"))
    v5 = (void *)-[_MTLCommandQueue commandBuffer](self, "commandBuffer");
  else
    v5 = (void *)-[_MTLCommandQueue commandBufferWithUnretainedReferences](self, "commandBufferWithUnretainedReferences");
  v6 = v5;
  objc_msgSend(v5, "setErrorOptions:", objc_msgSend(a3, "errorOptions"));
  return v6;
}

- (BOOL)getPrivateDataAndOffset:(id *)a3 privateDataOffset:(unint64_t *)a4
{
  return -[MTLPrivateDataTable getPrivateDataAndOffset:privateData:privateDataOffset:](self->_privateDataTable, "getPrivateDataAndOffset:privateData:privateDataOffset:", -[_MTLCommandQueue device](self, "device"), a3, a4);
}

- (void)releasePrivateData:(id *)a3 privateDataOffset:(unint64_t)a4
{
  -[MTLPrivateDataTable releasePrivateData:privateDataOffset:](self->_privateDataTable, "releasePrivateData:privateDataOffset:", a3, a4);
}

- (void)setPrivateData:(id)a3 privateDataOffset:(unint64_t)a4 logState:(id)a5
{
  -[MTLPrivateDataTable setPrivateData:privateDataOffset:logState:](self->_privateDataTable, "setPrivateData:privateDataOffset:logState:", a3, a4, a5);
}

- (void)completeCommandBuffers:(id *)a3 count:(unint64_t)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  NSObject *commandQueueDispatch;
  NSObject *v17;
  unint64_t v18;
  uint64_t v19;
  const __CFString *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[7];
  _QWORD block[6];

  v7 = mach_absolute_time();
  if (a4)
  {
    v12 = v7;
    v13 = MEMORY[0x1E0C809B0];
    do
    {
      v14 = *a3;
      if (*a3)
      {
        if (MTLFailureTypeGetEnabled(1uLL) && (objc_msgSend(v14, "conformsToProtocol:", &unk_1EDCF3B50) & 1) == 0)
          MTLReportFailure(1uLL, "-[_MTLCommandQueue completeCommandBuffers:count:]", 601, (uint64_t)CFSTR("commandBuffer is not a MTLCommandBuffer."), v21, v22, v23, v24, v25);
        v15 = -[_MTLCommandQueue device](self, "device");
        if (v15 == objc_msgSend(v14, "device"))
          goto LABEL_6;
        v18 = 1;
        v19 = 602;
        v20 = CFSTR("commandBuffer is associated with a different device");
      }
      else
      {
        v18 = 0;
        v19 = 598;
        v20 = CFSTR("commandBuffer must not be nil.");
      }
      MTLReportFailure(v18, "-[_MTLCommandQueue completeCommandBuffers:count:]", v19, (uint64_t)v20, v8, v9, v10, v11, v25);
LABEL_6:
      commandQueueDispatch = self->_commandQueueDispatch;
      block[0] = v13;
      block[1] = 3221225472;
      block[2] = __49___MTLCommandQueue_completeCommandBuffers_count___block_invoke;
      block[3] = &unk_1E0FE3128;
      block[4] = v14;
      block[5] = v12;
      dispatch_async(commandQueueDispatch, block);
      v17 = self->_commandQueueDispatch;
      v26[0] = v13;
      v26[1] = 3221225472;
      v26[2] = __49___MTLCommandQueue_completeCommandBuffers_count___block_invoke_2;
      v26[3] = &unk_1E0FE2C68;
      v26[4] = self;
      v26[5] = v14;
      v26[6] = v12;
      dispatch_async(v17, v26);
      ++a3;
      --a4;
    }
    while (a4);
  }
}

- (void)finish
{
  dispatch_group_wait((dispatch_group_t)self->_submittedGroup, 0xFFFFFFFFFFFFFFFFLL);
}

- (id)availableCounters
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t vars0;

  MTLReleaseAssertionFailure((uint64_t)"-[_MTLCommandQueue availableCounters]", 725, (uint64_t)"false", (uint64_t)"Metal Vendor Statistics not implemented", v2, v3, v4, v5, vars0);
}

- (int)requestCounters:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t vars0;

  MTLReleaseAssertionFailure((uint64_t)"-[_MTLCommandQueue requestCounters:]", 731, (uint64_t)"false", (uint64_t)"Metal Vendor Statistics not implemented", v3, v4, v5, v6, vars0);
}

- (void)addPerfSampleHandler:(id)a3
{
  void *v4;

  v4 = _Block_copy(a3);
  _Block_release(self->_perfSampleHandlerBlock);
  self->_perfSampleHandlerBlock = v4;
}

- (int)requestCounters:(id)a3 withIndex:(unint64_t)a4
{
  self->_listIndex = a4;
  return -[_MTLCommandQueue requestCounters:](self, "requestCounters:", a3);
}

- (void)addResidencySet:(id)a3
{
  -[_MTLCommandQueue doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)addResidencySets:(id *)a3 count:(unint64_t)a4
{
  -[_MTLCommandQueue doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
}

- (void)removeResidencySet:(id)a3
{
  -[_MTLCommandQueue doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)removeResidencySets:(id *)a3 count:(unint64_t)a4
{
  -[_MTLCommandQueue doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
}

- (BOOL)skipRender
{
  return self->_skipRender;
}

- (void)setSkipRender:(BOOL)a3
{
  self->_skipRender = a3;
}

- (BOOL)isProfilingEnabled
{
  return self->_profilingEnabled;
}

- (void)setProfilingEnabled:(BOOL)a3
{
  self->_profilingEnabled = a3;
}

- (BOOL)isStatEnabled
{
  return self->_StatEnabled;
}

- (void)setStatEnabled:(BOOL)a3
{
  self->_StatEnabled = a3;
}

- (unint64_t)getStatOptions
{
  return self->_StatOptions;
}

- (void)setStatOptions:(unint64_t)a3
{
  self->_StatOptions = a3;
}

- (unint64_t)getStatLocations
{
  return self->_StatLocations;
}

- (void)setStatLocations:(unint64_t)a3
{
  self->_StatLocations = a3;
}

- (unint64_t)getListIndex
{
  return self->_listIndex;
}

- (void)setListIndex:(unint64_t)a3
{
  self->_listIndex = a3;
}

- (unint64_t)maxCommandBufferCount
{
  return self->_maxCommandBufferCount;
}

- (unint64_t)qosLevel
{
  return self->_qosLevel;
}

- (OS_dispatch_queue)commitQueue
{
  return self->_commitQueue;
}

- (BOOL)commitSynchronously
{
  return self->_commitSynchronously;
}

- (OS_dispatch_queue)completionQueue
{
  return self->_completionQueue;
}

- (BOOL)disableCrossQueueHazardTracking
{
  return self->_disableCrossQueueHazardTracking;
}

- (BOOL)executionEnabled
{
  return self->_executionEnabled;
}

- (void)setExecutionEnabled:(BOOL)a3
{
  self->_executionEnabled = a3;
}

- (void)setBackgroundTrackingPID:(int)a3
{
  self->_backgroundTrackingPID = a3;
}

- (BOOL)isOpenGLQueue
{
  return self->_openGLQueue;
}

- (BOOL)commitsWithQoS
{
  return self->_commitsWithQoS;
}

- (void)initWithDevice:descriptor:.cold.1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_182636000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Command queue creation delayed, queues are being created too quickly.", v0, 2u);
}

@end
