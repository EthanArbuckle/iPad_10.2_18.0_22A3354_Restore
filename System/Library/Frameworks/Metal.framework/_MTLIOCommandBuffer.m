@implementation _MTLIOCommandBuffer

- (_MTLIOCommandBuffer)initWithQueue:(id)a3
{
  _MTLIOCommandBuffer *v4;
  dispatch_semaphore_t *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_MTLIOCommandBuffer;
  v4 = -[_MTLObjectWithLabel init](&v7, sel_init);
  if (v4)
  {
    v5 = (dispatch_semaphore_t *)a3;
    v4->_queue = (_MTLIOCommandQueue *)v5;
    dispatch_semaphore_wait(v5[8], 0xFFFFFFFFFFFFFFFFLL);
    v4->_status = 0;
    v4->_currentStagingBuffer = 0;
    v4->_currentStagingBufferRemainingBytes = 0;
    v4->_currentStagingBufferOffset = 0;
    v4->commandList = 0;
  }
  return v4;
}

- (_MTLIOCommandBuffer)initWithQueue:(id)a3 resourceList:(id)a4 retained:(BOOL)a5
{
  _MTLIOCommandBuffer *v8;
  dispatch_semaphore_t *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)_MTLIOCommandBuffer;
  v8 = -[_MTLObjectWithLabel init](&v11, sel_init);
  if (v8)
  {
    v9 = (dispatch_semaphore_t *)a3;
    v8->_queue = (_MTLIOCommandQueue *)v9;
    dispatch_semaphore_wait(v9[8], 0xFFFFFFFFFFFFFFFFLL);
    v8->_status = 0;
    v8->_completedCallbacksDone = 0;
    v8->_mutex.__sig = 850045863;
    *(_QWORD *)&v8->_mutex.__opaque[48] = 0;
    *(_OWORD *)&v8->_mutex.__opaque[32] = 0u;
    *(_OWORD *)&v8->_mutex.__opaque[16] = 0u;
    *(_OWORD *)v8->_mutex.__opaque = 0u;
    v8->_cond.__sig = 1018212795;
    *(_OWORD *)v8->_cond.__opaque = 0u;
    *(_OWORD *)&v8->_cond.__opaque[16] = 0u;
    *(_QWORD *)&v8->_cond.__opaque[32] = 0;
    v8->_pendingCommands = 0;
    v8->_currentStagingBuffer = 0;
    v8->_currentStagingBufferRemainingBytes = 0;
    v8->_currentStagingBufferOffset = 0;
    -[_MTLIOCommandBuffer createCommandListWithResourcePool:](v8, "createCommandListWithResourcePool:", a4);
    v8->_resourceList = MTLResourceListPoolCreateResourceList((MTLResourceListPool *)a4);
    v8->_retained = a5;
    v8->_enqueued = 0;
    v8->_activeScratchBuffers.var0 = v8->_activeScratchBuffers.__begin_;
    v8->_poolScratchBuffers.var0 = v8->_poolScratchBuffers.__begin_;
    if (MTLTraceEnabled())
    {
      -[_MTLIOCommandBuffer globalTraceObjectID](v8, "globalTraceObjectID");
      objc_msgSend(a3, "globalTraceObjectID");
      objc_msgSend((id)objc_msgSend(a3, "device"), "registryID");
      kdebug_trace();
    }
  }
  return v8;
}

- (void)createCommandListWithResourcePool:(id)a3
{
  uint64_t v5;

  v5 = operator new();
  *(_QWORD *)v5 = malloc_type_malloc(0x980000uLL, 0x1082040126CB6D8uLL);
  *(_QWORD *)(v5 + 8) = 0x10000;
  *(_QWORD *)(v5 + 24) = 0;
  *(_QWORD *)(v5 + 32) = 0;
  *(_QWORD *)(v5 + 16) = 0;
  *(_DWORD *)(v5 + 39) = 0;
  *(_QWORD *)(v5 + 48) = 0;
  *(_QWORD *)(v5 + 56) = 0;
  *(_QWORD *)(v5 + 64) = a3;
  *(_QWORD *)(v5 + 72) = 0;
  self->commandList = (MTLIOCommandList *)v5;
}

- (BOOL)isCommitted
{
  MTLIOCommandList *commandList;

  commandList = self->commandList;
  return commandList && commandList->var7;
}

- (void)addCompletedHandler:(id)a3
{
  MTLIODispatch **p_completedDispatchListTail;
  objc_class *v6;
  void *v7;
  MTLIODispatch *v8;
  uint64_t v9;

  if (a3)
  {
    p_completedDispatchListTail = &self->_completedDispatchListTail;
    v6 = (objc_class *)malloc_type_malloc(0x10uLL, 0xA0040AFF93C70uLL);
    v7 = _Block_copy(a3);
    *(_QWORD *)v6 = 0;
    *((_QWORD *)v6 + 1) = v7;
    v8 = *p_completedDispatchListTail;
    if (*p_completedDispatchListTail)
    {
      v9 = 104;
    }
    else
    {
      v8 = (MTLIODispatch *)p_completedDispatchListTail;
      v9 = 96;
    }
    v8->var0 = (MTLIODispatch *)v6;
    *(Class *)((char *)&self->super.super.isa + v9) = v6;
  }
}

- (void)waitForEvent:(id)a3 value:(unint64_t)a4
{
  double v7;
  uint64_t v8;
  uint64_t v9;
  MTLSharedEventListener *v10;
  _QWORD v11[6];
  int v12;
  char v13;

  if (a3)
  {
    v12 = 2;
    v13 = 0;
    *(_QWORD *)&v7 = MTLIOCommandList::addCommand(self->commandList, (MTLIOCommand *)&v12).n128_u64[0];
    v9 = v8;
    v10 = -[_MTLIOCommandQueue eventSignalListener](self->_queue, "eventSignalListener", v7);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __42___MTLIOCommandBuffer_waitForEvent_value___block_invoke;
    v11[3] = &unk_1E0FE26D0;
    v11[4] = self;
    v11[5] = v9;
    objc_msgSend(a3, "notifyListener:atValue:block:", v10, a4, v11);
    if (self->_retained)
      MTLResourceListAddResource((int32x2_t *)self->_resourceList, (uint64_t)a3);
    if (MTLTraceEnabled())
    {
      -[_MTLIOCommandBuffer globalTraceObjectID](self, "globalTraceObjectID");
      kdebug_trace();
    }
  }
}

- (void)signalEvent:(id)a3 value:(unint64_t)a4
{
  int v6;
  id v7;
  unint64_t v8;

  v6 = 3;
  v7 = a3;
  v8 = a4;
  MTLIOCommandList::addCommand(self->commandList, (MTLIOCommand *)&v6);
  if (self->_retained)
    MTLResourceListAddResource((int32x2_t *)self->_resourceList, (uint64_t)a3);
  if (MTLTraceEnabled())
  {
    -[_MTLIOCommandBuffer globalTraceObjectID](self, "globalTraceObjectID");
    kdebug_trace();
  }
}

- (void)loadBytes:(void *)a3 size:(unint64_t)a4 sourceHandle:(id)a5 sourceHandleOffset:(unint64_t)a6
{
  unint64_t v11;
  unint64_t v12;
  MTLIOScratchBuffer *currentStagingBuffer;
  unint64_t currentStagingBufferOffset;
  MTLIOScratchBuffer *v15;
  MTLIOCommandList *commandList;
  int v17;
  id v18;
  unint64_t v19;
  unint64_t v20;
  MTLIOScratchBuffer *v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  __int128 v25;
  __int128 v26;

  v11 = objc_msgSend(a5, "stagingBufferSize:offset:", a4, a6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
          0,
          0,
          0,
          0);
  v12 = v11;
  if (self->_currentStagingBufferRemainingBytes >= v11)
  {
    if (!v11)
    {
      v21 = 0;
      goto LABEL_11;
    }
    currentStagingBuffer = self->_currentStagingBuffer;
  }
  else
  {
    currentStagingBuffer = -[_MTLIOCommandBuffer getReusableScratchBuffer:](self, "getReusableScratchBuffer:", v11);
    if (!currentStagingBuffer)
    {
      v15 = (MTLIOScratchBuffer *)-[MTLIOScratchBufferAllocator newScratchBufferWithMinimumSize:](-[_MTLIOCommandQueue scratchBufferAllocator](self->_queue, "scratchBufferAllocator"), "newScratchBufferWithMinimumSize:", v12);
      currentStagingBuffer = v15;
      if (!v15 || objc_msgSend((id)-[MTLIOScratchBuffer buffer](v15, "buffer"), "allocatedSize") < v12)
      {

        commandList = self->commandList;
        os_unfair_lock_lock(&commandList->var5);
        commandList->var6 = 1;
        os_unfair_lock_unlock(&commandList->var5);
        return;
      }
      MTLResourceListAddResource((int32x2_t *)self->_resourceList, (uint64_t)currentStagingBuffer);

    }
    self->_currentStagingBufferRemainingBytes = objc_msgSend((id)-[MTLIOScratchBuffer buffer](currentStagingBuffer, "buffer"), "allocatedSize");
    self->_currentStagingBufferOffset = 0;
    self->_currentStagingBuffer = currentStagingBuffer;
  }
  currentStagingBufferOffset = self->_currentStagingBufferOffset;
  v21 = currentStagingBuffer;
  v22 = currentStagingBufferOffset;
  v23 = objc_msgSend((id)-[MTLIOScratchBuffer buffer](currentStagingBuffer, "buffer"), "contents")
      + currentStagingBufferOffset;
LABEL_11:
  self->_currentStagingBufferOffset += v12;
  self->_currentStagingBufferRemainingBytes -= v12;
  v17 = 0;
  v18 = a5;
  v19 = a6;
  v24 = v12;
  v25 = (unint64_t)a3;
  v20 = a4;
  *(_QWORD *)&v26 = 0;
  MTLIOCommandList::addCommand(self->commandList, (MTLIOCommand *)&v17);
  if (self->_retained)
    MTLResourceListAddResource((int32x2_t *)self->_resourceList, (uint64_t)a5);
  if (MTLTraceEnabled())
  {
    -[_MTLIOCommandBuffer globalTraceObjectID](self, "globalTraceObjectID");
    objc_msgSend(a5, "globalTraceObjectID");
    kdebug_trace();
  }
}

- (void)loadBuffer:(id)a3 offset:(unint64_t)a4 size:(unint64_t)a5 sourceHandle:(id)a6 sourceHandleOffset:(unint64_t)a7
{
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  unint64_t v16;
  unint64_t v17;
  MTLIOScratchBuffer *currentStagingBuffer;
  unint64_t v19;
  unint64_t currentStagingBufferOffset;
  MTLIOScratchBuffer *v21;
  MTLIOCommandList *commandList;
  unint64_t v23;
  unint64_t v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;

  v35 = 0;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v26 = 0u;
  v13 = objc_msgSend(a3, "storageMode");
  v25 = a6;
  v14 = objc_msgSend(a6, "stagingBufferSize:offset:", a5, a7);
  v15 = v13 == 2;
  if (v13 == 2)
    v16 = a5;
  else
    v16 = 0;
  v17 = v16 + v14;
  if (self->_currentStagingBufferRemainingBytes >= v16 + v14)
  {
    v19 = a7;
    if (!v17)
    {
      *(_QWORD *)&v28 = 0;
      goto LABEL_14;
    }
    v23 = a4;
    currentStagingBuffer = self->_currentStagingBuffer;
  }
  else
  {
    v23 = a4;
    currentStagingBuffer = -[_MTLIOCommandBuffer getReusableScratchBuffer:](self, "getReusableScratchBuffer:", v17);
    if (!currentStagingBuffer)
    {
      v21 = (MTLIOScratchBuffer *)-[MTLIOScratchBufferAllocator newScratchBufferWithMinimumSize:](-[_MTLIOCommandQueue scratchBufferAllocator](self->_queue, "scratchBufferAllocator"), "newScratchBufferWithMinimumSize:", v17);
      currentStagingBuffer = v21;
      if (!v21 || objc_msgSend((id)-[MTLIOScratchBuffer buffer](v21, "buffer"), "allocatedSize") < v17)
      {

        commandList = self->commandList;
        os_unfair_lock_lock(&commandList->var5);
        commandList->var6 = 1;
        os_unfair_lock_unlock(&commandList->var5);
        return;
      }
      MTLResourceListAddResource((int32x2_t *)self->_resourceList, (uint64_t)currentStagingBuffer);

    }
    v19 = a7;
    self->_currentStagingBufferRemainingBytes = objc_msgSend((id)-[MTLIOScratchBuffer buffer](currentStagingBuffer, "buffer"), "allocatedSize");
    self->_currentStagingBufferOffset = 0;
    self->_currentStagingBuffer = currentStagingBuffer;
  }
  currentStagingBufferOffset = self->_currentStagingBufferOffset;
  *(_QWORD *)&v28 = currentStagingBuffer;
  *((_QWORD *)&v28 + 1) = currentStagingBufferOffset;
  *(_QWORD *)&v29 = objc_msgSend((id)-[MTLIOScratchBuffer buffer](currentStagingBuffer, "buffer", v23), "contents")
                  + currentStagingBufferOffset;
  a4 = v24;
LABEL_14:
  self->_currentStagingBufferOffset += v17;
  self->_currentStagingBufferRemainingBytes -= v17;
  LODWORD(v26) = 0;
  *((_QWORD *)&v26 + 1) = v25;
  *(_QWORD *)&v27 = v19;
  *((_QWORD *)&v29 + 1) = v17;
  *((_QWORD *)&v27 + 1) = a5;
  *(_QWORD *)&v30 = objc_msgSend(a3, "contents") + a4;
  *((_QWORD *)&v30 + 1) = a3;
  *(_QWORD *)&v31 = a4;
  BYTE9(v31) = v15;
  MTLIOCommandList::addCommand(self->commandList, (MTLIOCommand *)&v26);
  if (self->_retained)
  {
    MTLResourceListAddResource((int32x2_t *)self->_resourceList, (uint64_t)a3);
    MTLResourceListAddResource((int32x2_t *)self->_resourceList, (uint64_t)v25);
  }
  if (MTLTraceEnabled())
  {
    -[_MTLIOCommandBuffer globalTraceObjectID](self, "globalTraceObjectID");
    objc_msgSend(v25, "globalTraceObjectID");
    kdebug_trace();
  }
}

- (void)loadTexture:(id)a3 slice:(unint64_t)a4 level:(unint64_t)a5 size:(id *)a6 bytesPerRow:(unint64_t)a7 bytesPerImage:(unint64_t)a8 dstOrigin:(id *)a9 handle:(id)a10 handleOffset:(unint64_t)a11
{
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v11;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v12;

  v12 = *a6;
  v11 = *a9;
  -[_MTLIOCommandBuffer loadTexture:slice:level:size:sourceBytesPerRow:sourceBytesPerImage:destinationOrigin:sourceHandle:sourceHandleOffset:](self, "loadTexture:slice:level:size:sourceBytesPerRow:sourceBytesPerImage:destinationOrigin:sourceHandle:sourceHandleOffset:", a3, a4, a5, &v12, a7, a8, &v11, a10, a11);
}

- (void)loadTexture:(id)a3 slice:(unint64_t)a4 level:(unint64_t)a5 size:(id *)a6 sourceBytesPerRow:(unint64_t)a7 sourceBytesPerImage:(unint64_t)a8 destinationOrigin:(id *)a9 sourceHandle:(id)a10 sourceHandleOffset:(unint64_t)a11
{
  id v13;
  unint64_t v14;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  MTLIOScratchBuffer *currentStagingBuffer;
  MTLIOScratchBuffer *v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  MTLIOCommandList *commandList;
  id v25;
  __int128 v27;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _OWORD v34[2];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  unint64_t v38;
  __int128 v39;
  uint64_t v40;
  __int128 v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;

  v13 = a10;
  v43 = 0;
  v44 = 0;
  v41 = *(_OWORD *)&a9->var0;
  v42 = 0;
  v39 = *(_OWORD *)&a6->var0;
  v40 = 1;
  *(_QWORD *)&v27 = a5;
  *((_QWORD *)&v27 + 1) = a7;
  MTLCalculateSourceBufferSizeAndAlignment(a3, &v41, (unint64_t *)&v39, a5, a7, &v44, (uint64_t *)&v43);
  if (a6->var2)
  {
    v14 = 0;
    v25 = a10;
    do
    {
      v38 = 0;
      v36 = 0u;
      v37 = 0u;
      v35 = 0u;
      v33 = 0u;
      memset(v34, 0, sizeof(v34));
      v31 = 0u;
      v32 = 0u;
      v30 = 0u;
      v16 = objc_msgSend(v13, "stagingBufferSize:offset:", v44, a11, v25);
      v17 = v44 + v16;
      v18 = v44 + v16 + v43;
      if (self->_currentStagingBufferRemainingBytes >= v18)
      {
        currentStagingBuffer = self->_currentStagingBuffer;
        if (v17)
          goto LABEL_11;
      }
      else
      {
        currentStagingBuffer = -[_MTLIOCommandBuffer getReusableScratchBuffer:](self, "getReusableScratchBuffer:", v17 + v43);
        if (!currentStagingBuffer)
        {
          v20 = (MTLIOScratchBuffer *)-[MTLIOScratchBufferAllocator newScratchBufferWithMinimumSize:](-[_MTLIOCommandQueue scratchBufferAllocator](self->_queue, "scratchBufferAllocator"), "newScratchBufferWithMinimumSize:", v18);
          currentStagingBuffer = v20;
          if (!v20 || objc_msgSend((id)-[MTLIOScratchBuffer buffer](v20, "buffer"), "allocatedSize") < v18)
          {

            commandList = self->commandList;
            os_unfair_lock_lock(&commandList->var5);
            commandList->var6 = 1;
            os_unfair_lock_unlock(&commandList->var5);
            return;
          }
          MTLResourceListAddResource((int32x2_t *)self->_resourceList, (uint64_t)currentStagingBuffer);

        }
        self->_currentStagingBufferRemainingBytes = objc_msgSend((id)-[MTLIOScratchBuffer buffer](currentStagingBuffer, "buffer"), "allocatedSize");
        self->_currentStagingBufferOffset = 0;
        self->_currentStagingBuffer = currentStagingBuffer;
        if (v17)
        {
LABEL_11:
          v21 = (self->_currentStagingBufferOffset + v43 - 1) / v43 * v43;
          *(_QWORD *)&v32 = currentStagingBuffer;
          *((_QWORD *)&v32 + 1) = v21;
          v22 = objc_msgSend((id)-[MTLIOScratchBuffer buffer](currentStagingBuffer, "buffer"), "contents");
          *(_QWORD *)&v33 = v22 + *((_QWORD *)&v32 + 1);
          goto LABEL_12;
        }
      }
      *(_QWORD *)&v32 = 0;
LABEL_12:
      self->_currentStagingBufferOffset += v18;
      self->_currentStagingBufferRemainingBytes -= v18;
      LODWORD(v30) = 1;
      v13 = v25;
      *((_QWORD *)&v30 + 1) = v25;
      *(_QWORD *)&v31 = a11;
      *((_QWORD *)&v31 + 1) = v44;
      *((_QWORD *)&v33 + 1) = v17;
      *(_QWORD *)&v34[0] = a3;
      v23 = v14 + a9->var2;
      *(_OWORD *)((char *)v34 + 8) = *(_OWORD *)&a9->var0;
      *((_QWORD *)&v34[1] + 1) = v23;
      v37 = v27;
      v38 = a8;
      v35 = *(_OWORD *)&a6->var0;
      *(_QWORD *)&v36 = 1;
      *((_QWORD *)&v36 + 1) = a4;
      MTLIOCommandList::addCommand(self->commandList, (MTLIOCommand *)&v30);
      a11 += a8;
      ++v14;
    }
    while (v14 < a6->var2);
  }
  if (self->_retained)
  {
    MTLResourceListAddResource((int32x2_t *)self->_resourceList, (uint64_t)a3);
    MTLResourceListAddResource((int32x2_t *)self->_resourceList, (uint64_t)v13);
  }
  if (MTLTraceEnabled())
  {
    -[_MTLIOCommandBuffer globalTraceObjectID](self, "globalTraceObjectID");
    objc_msgSend(v13, "globalTraceObjectID");
    kdebug_trace();
  }
}

- (void)copyStatusToBuffer:(id)a3 offset:(unint64_t)a4
{
  uint64_t v7;
  MTLIODispatch *v8;
  void *v9;
  MTLIODispatch *completedDispatchListTail;
  uint64_t v11;
  _QWORD v12[6];

  v7 = objc_msgSend(a3, "contents");
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __49___MTLIOCommandBuffer_copyStatusToBuffer_offset___block_invoke;
  v12[3] = &unk_1E0FE26F8;
  v12[4] = self;
  v12[5] = v7 + a4;
  v8 = (MTLIODispatch *)malloc_type_malloc(0x10uLL, 0xA0040AFF93C70uLL);
  v9 = _Block_copy(v12);
  v8->var0 = 0;
  v8->var1 = v9;
  completedDispatchListTail = self->_completedDispatchListTail;
  if (completedDispatchListTail)
  {
    v11 = 104;
  }
  else
  {
    completedDispatchListTail = (MTLIODispatch *)&self->_completedDispatchListTail;
    v11 = 96;
  }
  completedDispatchListTail->var0 = v8;
  *(Class *)((char *)&self->super.super.isa + v11) = (Class)v8;
  if (self->_retained)
    MTLResourceListAddResource((int32x2_t *)self->_resourceList, (uint64_t)a3);
}

- (void)commit
{
  _opaque_pthread_cond_t *p_cmdCvar;

  -[_MTLIOCommandBuffer clearScratchBufferLists](self, "clearScratchBufferLists");
  if (self->_enqueued)
    p_cmdCvar = &self->_queue->cmdCvar;
  else
    p_cmdCvar = 0;
  MTLIOCommandList::commit(self->commandList, p_cmdCvar);
  if (!self->_enqueued)
    -[_MTLIOCommandQueue commit:](self->_queue, "commit:", self);
  if (MTLTraceEnabled())
  {
    -[_MTLIOCommandBuffer globalTraceObjectID](self, "globalTraceObjectID");
    kdebug_trace();
  }
}

- (void)enqueue
{
  if (!self->_enqueued)
  {
    self->_enqueued = 1;
    -[_MTLIOCommandQueue commit:](self->_queue, "commit:", self);
  }
}

- (void)waitUntilCompleted
{
  _opaque_pthread_mutex_t *p_mutex;

  p_mutex = &self->_mutex;
  pthread_mutex_lock(&self->_mutex);
  while (!self->_completedCallbacksDone)
    pthread_cond_wait(&self->_cond, p_mutex);
  pthread_mutex_unlock(p_mutex);
}

- (MTLIOCommandList)getCommandList
{
  return self->commandList;
}

- (void)didCompleteWithStatus:(int64_t)a3
{
  MTLIODispatch *completedDispatchList;
  MTLIODispatch *var0;
  MTLIOCommandList *commandList;
  MTLResourceList *resourceList;

  dispatch_semaphore_signal((dispatch_semaphore_t)self->_queue->_commandBufferSemaphore);
  self->_status = a3;
  completedDispatchList = self->_completedDispatchList;
  if (completedDispatchList)
  {
    do
    {
      var0 = completedDispatchList->var0;
      (*((void (**)(void))completedDispatchList->var1 + 2))();
      _Block_release(completedDispatchList->var1);
      free(completedDispatchList);
      completedDispatchList = var0;
    }
    while (var0);
  }
  self->_completedDispatchList = 0;
  self->_completedDispatchListTail = 0;
  pthread_mutex_lock(&self->_mutex);
  self->_completedCallbacksDone = 1;
  pthread_cond_broadcast(&self->_cond);
  pthread_mutex_unlock(&self->_mutex);
  commandList = self->commandList;
  if (commandList)
  {
    MTLIOCommandList::~MTLIOCommandList(commandList);
    MEMORY[0x186DABFBC]();
  }
  self->commandList = 0;
  resourceList = self->_resourceList;
  if (resourceList)
  {
    -[MTLResourceList releaseAllObjectsAndReset](resourceList, "releaseAllObjectsAndReset");
    MTLResourceListRelease(&self->_resourceList->super.isa);
    self->_resourceList = 0;
  }
  -[_MTLIOCommandQueue kickAllocatorCleanupQueue](self->_queue, "kickAllocatorCleanupQueue");
  if (MTLTraceEnabled())
  {
    -[_MTLIOCommandBuffer globalTraceObjectID](self, "globalTraceObjectID");
    kdebug_trace();
  }
}

- (void)tryCancel
{
  MTLIOCommandList *commandList;

  commandList = self->commandList;
  os_unfair_lock_lock(&commandList->var5);
  commandList->var6 = 1;
  os_unfair_lock_unlock(&commandList->var5);
}

- (void)addBarrier
{
  int v3[38];

  v3[0] = 4;
  -[_MTLIOCommandBuffer reuseActiveScratchBuffers](self, "reuseActiveScratchBuffers", MTLIOCommandList::addCommand(self->commandList, (MTLIOCommand *)v3).n128_f64[0]);
  if (MTLTraceEnabled())
  {
    -[_MTLIOCommandBuffer globalTraceObjectID](self, "globalTraceObjectID");
    kdebug_trace();
  }
}

- (void)pushDebugGroup:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const __CFString *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (!a3)
  {
    v7 = CFSTR("string must not be nil.");
    v8 = 0;
    v9 = 973;
LABEL_5:
    MTLReportFailure(v8, "-[_MTLIOCommandBuffer pushDebugGroup:]", v9, (uint64_t)v7, v3, v4, v5, v6, v10);
    return;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v7 = CFSTR("string is not a NSString.");
    v8 = 1;
    v9 = 976;
    goto LABEL_5;
  }
}

- (void)dealloc
{
  MTLIOCommandList *commandList;
  MTLResourceList *resourceList;
  objc_super v5;

  commandList = self->commandList;
  if (commandList)
  {
    MTLIOCommandList::~MTLIOCommandList(commandList);
    MEMORY[0x186DABFBC]();
  }
  pthread_cond_destroy(&self->_cond);
  pthread_mutex_destroy(&self->_mutex);

  -[_MTLIOCommandBuffer clearScratchBufferLists](self, "clearScratchBufferLists");
  resourceList = self->_resourceList;
  if (resourceList)
  {
    -[MTLResourceList releaseAllObjectsAndReset](resourceList, "releaseAllObjectsAndReset");
    MTLResourceListRelease(&self->_resourceList->super.isa);
    self->_resourceList = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)_MTLIOCommandBuffer;
  -[_MTLObjectWithLabel dealloc](&v5, sel_dealloc);
}

- (id)getReusableScratchBuffer:(unint64_t)a3
{
  MTLIOScratchBuffer *currentStagingBuffer;
  vector<id<MTLIOScratchBuffer>, std::allocator<id<MTLIOScratchBuffer>>> *p_activeScratchBuffers;
  __end_cap_ **var0;
  __compressed_pair<id<MTLIOScratchBuffer> *, std::allocator<id<MTLIOScratchBuffer>>> *p_var1;
  id *value;
  __end_cap_ **v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char *v15;
  MTLIOScratchBuffer **v16;
  id *v17;
  __end_cap_ **v18;
  __end_ **begin;
  MTLIOScratchBuffer *v20;
  vector<id<MTLIOScratchBuffer>, std::allocator<id<MTLIOScratchBuffer>>> *p_poolScratchBuffers;
  int64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  void *v26;
  void **v27;
  void **v28;
  unint64_t v29;
  unint64_t v30;

  currentStagingBuffer = self->_currentStagingBuffer;
  if (currentStagingBuffer)
  {
    p_activeScratchBuffers = &self->_activeScratchBuffers;
    var0 = self->_activeScratchBuffers.var0;
    p_var1 = &self->_activeScratchBuffers.var1;
    value = self->_activeScratchBuffers.var1.__value_;
    if (var0 >= (__end_cap_ **)value)
    {
      v11 = var0 - p_activeScratchBuffers->__begin_;
      if ((unint64_t)(v11 + 1) >> 61)
        std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
      v12 = (char *)value - (char *)p_activeScratchBuffers->__begin_;
      v13 = v12 >> 2;
      if (v12 >> 2 <= (unint64_t)(v11 + 1))
        v13 = v11 + 1;
      if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF8)
        v14 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v14 = v13;
      if (v14)
      {
        v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)p_var1, v14);
        currentStagingBuffer = self->_currentStagingBuffer;
      }
      else
      {
        v15 = 0;
      }
      v16 = (MTLIOScratchBuffer **)&v15[8 * v11];
      v17 = (id *)&v15[8 * v14];
      *v16 = currentStagingBuffer;
      v10 = v16 + 1;
      begin = p_activeScratchBuffers->__begin_;
      v18 = self->_activeScratchBuffers.var0;
      if (v18 != p_activeScratchBuffers->__begin_)
      {
        do
        {
          v20 = *--v18;
          *--v16 = v20;
        }
        while (v18 != begin);
        v18 = p_activeScratchBuffers->__begin_;
      }
      p_activeScratchBuffers->__begin_ = v16;
      self->_activeScratchBuffers.var0 = v10;
      self->_activeScratchBuffers.var1.__value_ = v17;
      if (v18)
        operator delete(v18);
    }
    else
    {
      *var0 = currentStagingBuffer;
      v10 = var0 + 1;
    }
    self->_activeScratchBuffers.var0 = v10;
  }
  p_poolScratchBuffers = &self->_poolScratchBuffers;
  v22 = (char *)self->_poolScratchBuffers.var0 - (char *)self->_poolScratchBuffers.__begin_;
  if (!v22)
    return 0;
  v23 = 0;
  v24 = v22 >> 3;
  if (v24 <= 1)
    v25 = 1;
  else
    v25 = v24;
  while (objc_msgSend((id)-[__end_ buffer](p_poolScratchBuffers->__begin_[v23], "buffer"), "allocatedSize") < a3)
  {
    ++v23;
    if (!--v25)
      return 0;
  }
  v27 = (void **)p_poolScratchBuffers->var0;
  v28 = (void **)&p_poolScratchBuffers->__begin_[v23];
  v26 = *v28;
  v29 = (char *)v27 - (char *)p_poolScratchBuffers->__begin_ - v23 * 8;
  v30 = v29 - 8;
  if (v28 + 1 != v27)
    memmove(v28, v28 + 1, v29 - 8);
  p_poolScratchBuffers->var0 = (__end_cap_ **)((char *)v28 + (v30 & 0xFFFFFFFFFFFFFFF8));
  return v26;
}

- (void)reuseActiveScratchBuffers
{
  _MTLIOCommandBuffer *v2;
  uint64_t p_poolScratchBuffers;
  uint64_t var0;

  v2 = self;
  self->_currentStagingBufferRemainingBytes = objc_msgSend((id)-[MTLIOScratchBuffer buffer](self->_currentStagingBuffer, "buffer"), "allocatedSize");
  v2->_currentStagingBufferOffset = 0;
  p_poolScratchBuffers = (uint64_t)&v2->_poolScratchBuffers;
  var0 = (uint64_t)v2->_poolScratchBuffers.var0;
  v2 = (_MTLIOCommandBuffer *)((char *)v2 + 240);
  std::vector<objc_object  {objcproto18MTLIOScratchBuffer}*>::__insert_with_size[abi:ne180100]<std::__wrap_iter<objc_object  {objcproto18MTLIOScratchBuffer}*>,objc_object  {objcproto18MTLIOScratchBuffer}*>(p_poolScratchBuffers, var0, (char *)v2->super.super.isa, (char *)v2->super._label, ((char *)v2->super._label - (char *)v2->super.super.isa) >> 3);
  v2->super._label = (NSString *)v2->super.super.isa;
}

- (void)clearScratchBufferLists
{
  self->_activeScratchBuffers.var0 = self->_activeScratchBuffers.__begin_;
  self->_poolScratchBuffers.var0 = self->_poolScratchBuffers.__begin_;
}

- (int64_t)status
{
  return self->_status;
}

- (NSError)error
{
  return self->error;
}

- (void).cxx_destruct
{
  vector<id<MTLIOScratchBuffer>, std::allocator<id<MTLIOScratchBuffer>>> *p_poolScratchBuffers;
  __end_ **begin;
  __end_ **v5;

  p_poolScratchBuffers = &self->_poolScratchBuffers;
  begin = self->_poolScratchBuffers.__begin_;
  if (begin)
  {
    p_poolScratchBuffers->var0 = begin;
    operator delete(begin);
  }
  v5 = self->_activeScratchBuffers.__begin_;
  if (v5)
  {
    self->_activeScratchBuffers.var0 = v5;
    operator delete(v5);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 31) = 0;
  *((_QWORD *)self + 32) = 0;
  *((_QWORD *)self + 30) = 0;
  *((_QWORD *)self + 34) = 0;
  *((_QWORD *)self + 35) = 0;
  *((_QWORD *)self + 33) = 0;
  return self;
}

@end
