@implementation IOGPUMetalCommandBuffer

- (IOGPUMetalCommandBufferStorage)commandBufferStorage
{
  return self->_storage;
}

- (unint64_t)protectionOptions
{
  return self->_protectionOptions;
}

- (IOGPUMetalCommandBuffer)initWithQueue:(id)a3 retainedReferences:(BOOL)a4
{
  return -[IOGPUMetalCommandBuffer initWithQueue:retainedReferences:synchronousDebugMode:](self, "initWithQueue:retainedReferences:synchronousDebugMode:", a3, a4, 0);
}

- (void)fillCommandBufferArgs:(IOGPUCommandQueueCommandBufferArgs *)a3 commandQueue:(id)a4
{
  IOGPUMetalCommandBufferStorage *storage;
  _DWORD *var0;
  _DWORD *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v13[6];
  _QWORD aBlock[5];

  storage = self->_storage;
  a3->var0 = *((_DWORD *)storage->var3 + 32);
  a3->var1 = *((_DWORD *)storage->var8 + 32);
  var0 = storage->var7.var0;
  if (var0)
    LODWORD(var0) = var0[32];
  a3->var2 = var0;
  v9 = storage->var38[1];
  if (v9)
    LODWORD(v9) = v9[32];
  v10 = MEMORY[0x24BDAC760];
  a3->var5 = v9;
  aBlock[0] = v10;
  aBlock[1] = 3221225472;
  aBlock[2] = __62__IOGPUMetalCommandBuffer_fillCommandBufferArgs_commandQueue___block_invoke;
  aBlock[3] = &unk_24CC3F720;
  aBlock[4] = self;
  v11 = _Block_copy(aBlock);
  a3->var3.var1 = (unint64_t)v11;
  self->_scheduledCallbackBlockPtr = v11;
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __62__IOGPUMetalCommandBuffer_fillCommandBufferArgs_commandQueue___block_invoke_2;
  v13[3] = &unk_24CC3F748;
  v13[4] = self;
  v13[5] = a4;
  v12 = _Block_copy(v13);
  a3->var4.var1 = (unint64_t)v12;
  self->_completedCallbackBlockPtr = v12;
}

void __62__IOGPUMetalCommandBuffer_fillCommandBufferArgs_commandQueue___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  id v8;

  if (*(_DWORD *)__globalGPUCommPage)
  {
    objc_msgSend(*(id *)(a1 + 32), "globalTraceObjectID");
    IOGPUDeviceTraceEvent();
  }
  if (a4)
  {
    v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithIOGPUError:", a4);
    objc_msgSend(*(id *)(a1 + 32), "didScheduleWithStartTime:endTime:error:", a2, a3, v8);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "didScheduleWithStartTime:endTime:error:", a2, a3, 0);
  }
}

void __62__IOGPUMetalCommandBuffer_fillCommandBufferArgs_commandQueue___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, uint64_t a5)
{
  id v10;

  if (*(_DWORD *)__globalGPUCommPage)
  {
    objc_msgSend(*(id *)(a1 + 32), "globalTraceObjectID");
    IOGPUDeviceTraceEvent();
  }
  if (a4)
  {
    v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithIOGPUError:", a4);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 640) = a5;
    objc_msgSend(*(id *)(a1 + 40), "commandBufferDidComplete:startTime:completionTime:error:", *(_QWORD *)(a1 + 32), a2, a3, v10);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "commandBufferDidComplete:startTime:completionTime:error:", *(_QWORD *)(a1 + 32), a2, a3, 0);
  }
}

- (void)setLabel:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)IOGPUMetalCommandBuffer;
  -[_MTLObjectWithLabel setLabel:](&v9, sel_setLabel_);
  if (*(_DWORD *)__globalGPUCommPage)
  {
    v5 = -[MTLDevice deviceRef](self->_device, "deviceRef");
    v6 = *(uint64_t *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x24BDDD820]);
    v7 = (int)*MEMORY[0x24BDDD828];
    v8 = *(uint64_t *)((char *)&self->super.super.super.isa + v7);
    objc_msgSend(a3, "cStringUsingEncoding:", 1);
    *(Class *)((char *)&self->super.super.super.isa + v7) = (Class)IOGPUDeviceTraceObjectLabel(v5, 8, 0, v6, v8);
  }
}

- (void)dealloc
{
  IOGPUMetalCommandBufferStorage *storage;
  uint64_t var0;
  NSObject *commitAndResetSem;
  objc_super v6;

  iogpumetal_atomic_add((unsigned int *)self->_device + 181, -1);
  storage = self->_storage;
  if (storage)
  {
    var0 = (uint64_t)storage->var0;
    IOGPUMetalCommandBufferStorageDealloc(storage);
    if (!(*(_BYTE **)((char *)&self->super.super.super.isa + (int)*MEMORY[0x24BDDD838]))[400])
      -[IOGPUMetalDevice kickCleanupQueue](var0);
  }
  commitAndResetSem = self->_commitAndResetSem;
  if (commitAndResetSem)
    dispatch_release(commitAndResetSem);

  self->_device = 0;
  self->_purgedResources = 0;
  v6.receiver = self;
  v6.super_class = (Class)IOGPUMetalCommandBuffer;
  -[_MTLCommandBuffer dealloc](&v6, sel_dealloc);
}

- (IOGPUMetalCommandBuffer)initWithQueue:(id)a3 retainedReferences:(BOOL)a4 synchronousDebugMode:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  IOGPUMetalCommandBuffer *v9;
  unsigned int *v10;
  unint64_t NextGlobalTraceID;
  IOGPUMetalCommandBufferStorage *Storage;
  objc_super v14;

  v5 = a5;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    -[IOGPUMetalCommandBuffer initWithQueue:retainedReferences:synchronousDebugMode:].cold.1();
  v14.receiver = self;
  v14.super_class = (Class)IOGPUMetalCommandBuffer;
  v9 = -[_MTLCommandBuffer initWithQueue:retainedReferences:synchronousDebugMode:](&v14, sel_initWithQueue_retainedReferences_synchronousDebugMode_, a3, v6, v5);
  if (v9)
  {
    v10 = (unsigned int *)*((id *)a3 + 49);
    v9->_device = (MTLDevice *)v10;
    iogpumetal_atomic_add(v10 + 181, 1);
    NextGlobalTraceID = IOGPUDeviceGetNextGlobalTraceID(-[MTLDevice deviceRef](v9->_device, "deviceRef"));
    *(Class *)((char *)&v9->super.super.super.isa + (int)*MEMORY[0x24BDDD820]) = (Class)NextGlobalTraceID;
    Storage = (IOGPUMetalCommandBufferStorage *)IOGPUMetalCommandBufferStoragePoolCreateStorage(*((_QWORD *)v9->_device + 85), NextGlobalTraceID, v6);
    v9->_storage = Storage;
    if (Storage)
    {
      if (v5)
        v9->_commitAndResetSem = (OS_dispatch_semaphore *)dispatch_semaphore_create(1);
      if (*(_DWORD *)__globalGPUCommPage)
        IOGPUDeviceTraceEvent();
    }
    else
    {

      return 0;
    }
  }
  return v9;
}

- (MTLDevice)device
{
  return self->_device;
}

- (void)commit
{
  objc_super v3;
  objc_super v4;

  if (*((_BYTE *)&self->super.super.super.isa + (int)*MEMORY[0x24BDDD840]))
  {
    v4.receiver = self;
    v4.super_class = (Class)IOGPUMetalCommandBuffer;
    -[_MTLCommandBuffer bindLogState](&v4, sel_bindLogState);
  }
  if (-[_MTLCommandBuffer isProfilingEnabled](self, "isProfilingEnabled"))
    -[IOGPUMetalCommandBuffer kernelCommandCollectTimeStamp](self, "kernelCommandCollectTimeStamp");
  if (self->_purgedResources)
    -[IOGPUMetalCommandBuffer _encodePurgedResources](self, "_encodePurgedResources");
  IOGPUMetalCommandBufferStorageFinalizeShmemHeader((uint64_t)self->_storage);
  if (*(_DWORD *)__globalGPUCommPage)
    IOGPUDeviceTraceEvent();
  v3.receiver = self;
  v3.super_class = (Class)IOGPUMetalCommandBuffer;
  -[_MTLCommandBuffer commit](&v3, sel_commit);
}

- (void)setCurrentCommandEncoder:(id)a3
{
  IOGPUMetalCommandBufferStorage *storage;
  objc_super v6;

  if (*(Class *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x24BDDD850]) >= (Class)2)
  {
    MTLReleaseAssertionFailure();
    IOGPUDeviceTraceEvent();
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)IOGPUMetalCommandBuffer;
    -[_MTLCommandBuffer setCurrentCommandEncoder:](&v6, sel_setCurrentCommandEncoder_);
    if (*(_DWORD *)__globalGPUCommPage)
    {
      objc_msgSend(a3, "globalTraceObjectID");
      getpid();
      IOGPUDeviceTraceEvent();
    }
    storage = self->_storage;
    if (storage)
      storage->var26 = (IOGPUSegmentKernelCommmandListHeader *)a3;
  }
}

- (void)didCompleteWithStartTime:(unint64_t)a3 endTime:(unint64_t)a4 error:(id)a5
{
  IOGPUMetalCommandBufferStorage *storage;
  uint64_t var0;
  objc_super v11;

  if (*((_BYTE *)&self->super.super.super.isa + (int)*MEMORY[0x24BDDD808]))
  {
    MTLReleaseAssertionFailure();
    goto LABEL_9;
  }
  if (*((_BYTE *)&self->super.super.super.isa + (int)*MEMORY[0x24BDDD830]))
    *(Class *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x24BDDD858]) = (Class)(*self->_submitToHardwareTimeStampPointer
                                                                                         * *(unsigned int *)algn_253CFB4B4
                                                                                         / _iogpuTimebaseInfo);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
LABEL_9:
    -[IOGPUMetalCommandBuffer didCompleteWithStartTime:endTime:error:].cold.1();
  v11.receiver = self;
  v11.super_class = (Class)IOGPUMetalCommandBuffer;
  -[_MTLCommandBuffer didCompleteWithStartTime:endTime:error:](&v11, sel_didCompleteWithStartTime_endTime_error_, a3, a4, a5);
  storage = self->_storage;
  var0 = (uint64_t)storage->var0;
  IOGPUMetalCommandBufferStorageDealloc(storage);
  if (!(*(_BYTE **)((char *)&self->super.super.super.isa + (int)*MEMORY[0x24BDDD838]))[400])
    -[IOGPUMetalDevice kickCleanupQueue](var0);
  self->_storage = 0;
}

- (void)validate
{
  if (*(Class *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x24BDDD850]) >= (Class)2)
    MTLReportFailure();
  if (*(Class *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x24BDDD810]))
    MTLReportFailure();
}

- (void)setProtectionOptions:(unint64_t)a3
{
  _QWORD *v5;
  int v6;

  if (*(Class *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x24BDDD810]))
    MTLReportFailure();
  if (self->_protectionOptions != a3)
  {
    -[IOGPUMetalCommandBuffer commitEncoder](self, "commitEncoder");
    self->_protectionOptions = a3;
    v5 = -[IOGPUMetalCommandBuffer _reserveKernelCommandBufferSpace:](self, "_reserveKernelCommandBufferSpace:", 16);
    v6 = (int)v5;
    *v5 = 0x1000000009;
    v5[1] = a3;
    IOGPUMetalCommandBufferStorageBeginKernelCommands((uint64_t)self->_storage, (int)v5);
    IOGPUMetalCommandBufferStorageEndKernelCommands((uint64_t)self->_storage, v6 + 16);
  }
}

- (void)allocDebugBuffer
{
  IOGPUMetalCommandBufferStorageAllocDebugBuffer(&self->_storage->var0);
}

- (void)getDebugBufferPointerStart:(void *)a3 end:(void *)a4
{
  IOGPUMetalCommandBufferStorageGetDebugBufferPointers((uint64_t)self->_storage, a3, a4);
}

- (void)popDebugGroup
{
  objc_super v3;

  if (*(_DWORD *)__globalGPUCommPage)
  {
    -[MTLDevice deviceRef](self->_device, "deviceRef");
    -[_MTLCommandBuffer globalTraceObjectID](self, "globalTraceObjectID");
    IOGPUDeviceTraceEvent();
  }
  v3.receiver = self;
  v3.super_class = (Class)IOGPUMetalCommandBuffer;
  -[_MTLCommandBuffer popDebugGroup](&v3, sel_popDebugGroup);
}

- (void)pushDebugGroup:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  objc_super v7;

  if (*(_DWORD *)__globalGPUCommPage)
  {
    v5 = -[MTLDevice deviceRef](self->_device, "deviceRef");
    v6 = -[_MTLCommandBuffer globalTraceObjectID](self, "globalTraceObjectID");
    objc_msgSend(a3, "cStringUsingEncoding:", 1);
    IOGPUDeviceTraceObjectLabel(v5, 48, 5, v6, 0);
  }
  v7.receiver = self;
  v7.super_class = (Class)IOGPUMetalCommandBuffer;
  -[_MTLCommandBuffer pushDebugGroup:](&v7, sel_pushDebugGroup_, a3);
}

- (void)getCurrentKernelCommandBufferStart:(void *)a3 current:(void *)a4 end:(void *)a5
{
  IOGPUMetalCommandBufferStorage *storage;

  storage = self->_storage;
  if (a3)
    *a3 = storage->var4;
  if (a4)
    *a4 = storage->var5;
  if (a5)
    *a5 = storage->var6;
}

- (void)getCurrentKernelCommandBufferPointer:(void *)a3 end:(void *)a4
{
  IOGPUMetalCommandBufferStorage *storage;

  storage = self->_storage;
  if (a3)
    *a3 = storage->var5;
  if (a4)
    *a4 = storage->var6;
}

- (void)setCurrentKernelCommandBufferPointer:(void *)a3
{
  self->_storage->var5 = (char *)a3;
}

- (void)growKernelCommandBuffer:(unint64_t)a3
{
  IOGPUMetalCommandBufferStorageGrowKernelCommandBuffer(&self->_storage->var0, a3);
}

- (void)allocCommandBufferResourceAtIndex:(unsigned int)a3
{
  IOGPUMetalCommandBufferStorageAllocResourceAtIndex((uint64_t)self->_storage, *(uint64_t *)&a3);
}

- (IOGPUResourceList)ioGPUResourceList
{
  return &self->_storage->var14;
}

- (IOGPUSegmentListHeader)getSegmentListHeader
{
  return self->_storage->var11;
}

- (void)getSegmentListPointerStart:(void *)a3 current:(void *)a4 end:(void *)a5
{
  IOGPUMetalCommandBufferStorageGetSegmentListPointers((uint64_t)self->_storage, a3, a4, a5);
}

- (IOGPUMetalCommandBufferResourceInfo)commandBufferResourceInfo
{
  return (IOGPUMetalCommandBufferResourceInfo *)self->_storage->var25;
}

- (void)setCurrentSegmentListPointer:(void *)a3
{
  IOGPUMetalCommandBufferStorage *storage;

  storage = self->_storage;
  storage->var12 = (IOGPUSegmentResourceListHeader *)a3;
  storage->var13 = (IOGPUSegmentResourceDescriptorGroup *)((char *)a3 + 32);
}

- (void)growSegmentList
{
  IOGPUMetalCommandBufferStorageGrowSegmentList((uint64_t)self->_storage);
}

- (void)beginSegment:(void *)a3
{
  IOGPUMetalCommandBufferStorageBeginSegment((uint64_t)self->_storage, (int)a3);
}

- (void)endCurrentSegment
{
  IOGPUMetalCommandBufferStorageEndSegment((uint64_t)self->_storage);
}

- (void)commitAndReset
{
  __assert_rtn("-[IOGPUMetalCommandBuffer commitAndReset]", "IOGPUMetalCommandBuffer.m", 274, "!_storage");
}

- (id)akResourceList
{
  return self->_storage->var20;
}

- (id)akPrivateResourceList
{
  return self->_storage->var21;
}

- (void)kernelCommandCollectTimeStamp
{
  IOGPUMetalCommandBufferStorage *storage;
  char *var5;

  storage = self->_storage;
  var5 = storage->var5;
  if ((char *)(storage->var6 - var5) <= (char *)0xF)
  {
    IOGPUMetalCommandBufferStorageGrowKernelCommandBuffer(storage, 16);
    storage = self->_storage;
    var5 = storage->var5;
  }
  IOGPUMetalCommandBufferStorageBeginSegment((uint64_t)storage, (int)var5);
  *(_QWORD *)var5 = 0x1000000001;
  self->_submitToHardwareTimeStampPointer = (unint64_t *)(var5 + 8);
  self->_storage->var5 = var5 + 16;
  IOGPUMetalCommandBufferStorageEndSegment((uint64_t)self->_storage);
}

- (void)_reserveKernelCommandBufferSpace:(unint64_t)a3
{
  IOGPUMetalCommandBufferStorage *storage;
  void *result;
  char *var6;
  void *v8;

  storage = self->_storage;
  result = storage->var5;
  var6 = storage->var6;
  v8 = result;
  if (var6 - (_BYTE *)result < a3)
  {
    -[IOGPUMetalCommandBuffer growKernelCommandBuffer:](self, "growKernelCommandBuffer:", a3);
    -[IOGPUMetalCommandBuffer getCurrentKernelCommandBufferPointer:end:](self, "getCurrentKernelCommandBufferPointer:end:", &v8, &var6);
    result = v8;
    if (var6 - (_BYTE *)v8 < a3)
      -[IOGPUMetalCommandBuffer _reserveKernelCommandBufferSpace:].cold.1();
    storage = self->_storage;
  }
  storage->var5 = (char *)result + a3;
  return result;
}

- (void)_debugBytes:(const char *)a3 length:(unint64_t)a4 output_type:(unsigned int)a5
{
  int v9;
  _DWORD *v10;
  int v11;

  v9 = (a4 + 19) & 0xFFFFFFFC;
  v10 = -[IOGPUMetalCommandBuffer _reserveKernelCommandBufferSpace:](self, "_reserveKernelCommandBufferSpace:", (a4 + 19) & 0xFFFFFFFFFFFFFFFCLL);
  v11 = (int)v10;
  *v10 = 0;
  v10[1] = v9;
  v10[2] = a5;
  v10[3] = a4;
  memcpy(v10 + 4, a3, a4);
  IOGPUMetalCommandBufferStorageBeginKernelCommands((uint64_t)self->_storage, v11);
  IOGPUMetalCommandBufferStorageEndKernelCommands((uint64_t)self->_storage, v11 + v9);
}

- (void)kprintfBytes:(const char *)a3 length:(unint64_t)a4
{
  -[IOGPUMetalCommandBuffer commitEncoder](self, "commitEncoder");
  -[IOGPUMetalCommandBuffer _debugBytes:length:output_type:](self, "_debugBytes:length:output_type:", a3, a4, 0);
}

- (void)encodeSubmitSleepMS:(unsigned int)a3
{
  _DWORD *v5;
  int v6;

  -[IOGPUMetalCommandBuffer commitEncoder](self, "commitEncoder");
  v5 = -[IOGPUMetalCommandBuffer _reserveKernelCommandBufferSpace:](self, "_reserveKernelCommandBufferSpace:", 16);
  v6 = (int)v5;
  *(_QWORD *)v5 = 0x1000000002;
  v5[2] = a3;
  v5[3] = 0;
  IOGPUMetalCommandBufferStorageBeginKernelCommands((uint64_t)self->_storage, (int)v5);
  IOGPUMetalCommandBufferStorageEndKernelCommands((uint64_t)self->_storage, v6 + 16);
}

- (void)encodeSignalEvent:(id)a3 value:(unint64_t)a4
{
  _DWORD *v7;

  if (*(Class *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x24BDDD810]))
    MTLReportFailure();
  -[IOGPUMetalCommandBuffer commitEncoder](self, "commitEncoder");
  v7 = -[IOGPUMetalCommandBuffer _reserveKernelCommandBufferSpace:](self, "_reserveKernelCommandBufferSpace:", 24);
  *v7 = objc_msgSend(a3, "_encodeIOGPUKernelSignalEventCommandArgs:value:", v7 + 2, a4);
  v7[1] = 24;
  IOGPUMetalCommandBufferStorageBeginKernelCommands((uint64_t)self->_storage, (int)v7);
  IOGPUMetalCommandBufferStorageEndKernelCommands((uint64_t)self->_storage, (_DWORD)v7 + 24);
  if (*((_BYTE *)&self->super.super.super.isa + (int)*MEMORY[0x24BDDD848]))
    -[_MTLCommandBuffer _addRetainedObject:](self, "_addRetainedObject:", a3);
}

- (void)encodeSignalEvent:(id)a3 value:(unint64_t)a4 agentMask:(unint64_t)a5
{
  _DWORD *v9;

  if (*(Class *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x24BDDD810]))
    MTLReportFailure();
  -[IOGPUMetalCommandBuffer commitEncoder](self, "commitEncoder");
  v9 = -[IOGPUMetalCommandBuffer _reserveKernelCommandBufferSpace:](self, "_reserveKernelCommandBufferSpace:", 32);
  *v9 = objc_msgSend(a3, "_encodeIOGPUKernelSignalEventAgentCommandArgs:value:agentMask:", v9 + 2, a4, a5);
  v9[1] = 32;
  IOGPUMetalCommandBufferStorageBeginKernelCommands((uint64_t)self->_storage, (int)v9);
  IOGPUMetalCommandBufferStorageEndKernelCommands((uint64_t)self->_storage, (_DWORD)v9 + 32);
  if (*((_BYTE *)&self->super.super.super.isa + (int)*MEMORY[0x24BDDD848]))
    -[_MTLCommandBuffer _addRetainedObject:](self, "_addRetainedObject:", a3);
}

- (void)encodeSignalEventScheduled:(id)a3 value:(unint64_t)a4
{
  _DWORD *v7;

  if (*(Class *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x24BDDD810]))
    MTLReportFailure();
  -[IOGPUMetalCommandBuffer commitEncoder](self, "commitEncoder");
  v7 = -[IOGPUMetalCommandBuffer _reserveKernelCommandBufferSpace:](self, "_reserveKernelCommandBufferSpace:", 24);
  *v7 = objc_msgSend(a3, "_encodeIOGPUKernelSignalEventScheduledCommandArgs:value:", v7 + 2, a4);
  v7[1] = 24;
  IOGPUMetalCommandBufferStorageBeginKernelCommands((uint64_t)self->_storage, (int)v7);
  IOGPUMetalCommandBufferStorageEndKernelCommands((uint64_t)self->_storage, (_DWORD)v7 + 24);
  if (*((_BYTE *)&self->super.super.super.isa + (int)*MEMORY[0x24BDDD848]))
    -[_MTLCommandBuffer _addRetainedObject:](self, "_addRetainedObject:", a3);
}

- (void)encodeWaitForEvent:(id)a3 value:(unint64_t)a4
{
  -[IOGPUMetalCommandBuffer encodeWaitForEvent:value:timeout:](self, "encodeWaitForEvent:value:timeout:", a3, a4, 5);
}

- (void)encodeWaitForEvent:(id)a3 value:(unint64_t)a4 timeout:(unsigned int)a5
{
  uint64_t v5;
  _DWORD *v9;

  v5 = *(_QWORD *)&a5;
  if (*(Class *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x24BDDD810]))
    MTLReportFailure();
  -[IOGPUMetalCommandBuffer commitEncoder](self, "commitEncoder");
  v9 = -[IOGPUMetalCommandBuffer _reserveKernelCommandBufferSpace:](self, "_reserveKernelCommandBufferSpace:", 24);
  *v9 = objc_msgSend(a3, "_encodeIOGPUKernelWaitEventCommandArgs:value:timeout:", v9 + 2, a4, v5);
  v9[1] = 24;
  IOGPUMetalCommandBufferStorageBeginKernelCommands((uint64_t)self->_storage, (int)v9);
  IOGPUMetalCommandBufferStorageEndKernelCommands((uint64_t)self->_storage, (_DWORD)v9 + 24);
  if (*((_BYTE *)&self->super.super.super.isa + (int)*MEMORY[0x24BDDD848]))
    -[_MTLCommandBuffer _addRetainedObject:](self, "_addRetainedObject:", a3);
}

- (void)encodeConditionalAbortEvent:(id)a3
{
  _DWORD *v5;

  if (*(Class *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x24BDDD810]))
    MTLReportFailure();
  -[IOGPUMetalCommandBuffer commitEncoder](self, "commitEncoder");
  v5 = -[IOGPUMetalCommandBuffer _reserveKernelCommandBufferSpace:](self, "_reserveKernelCommandBufferSpace:", 24);
  *((_QWORD *)v5 + 2) = 0;
  *((_QWORD *)v5 + 1) = 0;
  *v5 = objc_msgSend(a3, "_encodeIOGPUKernelConditionalEventAbortCommandArgs:", v5 + 2);
  v5[1] = 24;
  IOGPUMetalCommandBufferStorageBeginKernelCommands((uint64_t)self->_storage, (int)v5);
  IOGPUMetalCommandBufferStorageEndKernelCommands((uint64_t)self->_storage, (_DWORD)v5 + 24);
  if (*((_BYTE *)&self->super.super.super.isa + (int)*MEMORY[0x24BDDD848]))
    -[_MTLCommandBuffer _addRetainedObject:](self, "_addRetainedObject:", a3);
}

- (void)addPurgedResource:(id)a3
{
  NSMutableSet *purgedResources;

  purgedResources = self->_purgedResources;
  if (!purgedResources)
  {
    purgedResources = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    self->_purgedResources = purgedResources;
  }
  -[NSMutableSet addObject:](purgedResources, "addObject:", a3);
}

- (void)addPurgedHeap:(id)a3
{
  NSMutableSet *purgedResources;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    purgedResources = self->_purgedResources;
    if (!purgedResources)
    {
      purgedResources = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
      self->_purgedResources = purgedResources;
    }
    -[NSMutableSet addObject:](purgedResources, "addObject:", *((_QWORD *)a3 + 7));
  }
}

- (void)_encodePurgedResources
{
  uint64_t v3;
  _DWORD *v4;
  NSMutableSet *purgedResources;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  int v12;
  int v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = 4 * -[NSMutableSet count](self->_purgedResources, "count") + 12;
  v4 = -[IOGPUMetalCommandBuffer _reserveKernelCommandBufferSpace:](self, "_reserveKernelCommandBufferSpace:", v3);
  *v4 = 8;
  v4[1] = v3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  purgedResources = self->_purgedResources;
  v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](purgedResources, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v13 = v3;
    v8 = 0;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      v11 = v8;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(purgedResources);
        v4[(v11 + v10) + 3] = *(_DWORD *)(*(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10) + 80);
        ++v10;
      }
      while (v7 != v10);
      v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](purgedResources, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      v8 = v11 + v10;
    }
    while (v7);
    v12 = v11 + v10;
    LODWORD(v3) = v13;
  }
  else
  {
    v12 = 0;
  }
  v4[2] = v12;
  IOGPUMetalCommandBufferStorageBeginKernelCommands((uint64_t)self->_storage, (int)v4);
  IOGPUMetalCommandBufferStorageEndKernelCommands((uint64_t)self->_storage, (_DWORD)v4 + v3);

  self->_purgedResources = 0;
}

- (void)growDebugBuffer:(unsigned int)a3
{
  IOGPUMetalCommandBufferStorageGrowDebugBuffer((uint64_t)self->_storage, a3);
}

- (void)allocateSidebandBuffer:(unsigned int)a3
{
  IOGPUMetalCommandBufferStorageAllocSidebandBuffer(&self->_storage->var0, a3);
}

- (void)growSidebandBuffer:(unsigned int)a3
{
  IOGPUMetalCommandBufferStorageGrowSidebandBuffer((uint64_t)self->_storage, a3);
}

- (void)setResponsibleTaskIDs:(const unsigned int *)a3 count:(unsigned int)a4
{
  uint64_t v7;
  int v8;
  _DWORD *v9;
  int v10;
  _DWORD *v11;
  int v12;

  if (*(Class *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x24BDDD810]))
    MTLReportFailure();
  -[IOGPUMetalCommandBuffer commitEncoder](self, "commitEncoder");
  if (a3)
    v7 = a4;
  else
    v7 = 0;
  v8 = (4 * v7 + 15) & 0xFFFFFFFC;
  v9 = -[IOGPUMetalCommandBuffer _reserveKernelCommandBufferSpace:](self, "_reserveKernelCommandBufferSpace:", (4 * v7 + 15) & 0x7FFFFFFFCLL);
  v10 = (int)v9;
  *v9 = 14;
  v9[1] = v8;
  v9[2] = v7;
  if ((_DWORD)v7)
  {
    v11 = v9 + 3;
    do
    {
      v12 = *a3++;
      *v11++ = v12;
      --v7;
    }
    while (v7);
  }
  IOGPUMetalCommandBufferStorageBeginKernelCommands((uint64_t)self->_storage, (int)v9);
  IOGPUMetalCommandBufferStorageEndKernelCommands((uint64_t)self->_storage, v10 + v8);
}

- (void)useResidencySet:(id)a3
{
  id v3;

  v3 = a3;
  IOGPUMetalCommandBufferStorageAddResidencySets((uint64_t)self->_storage, (uint64_t *)&v3, 1, 0);
  if (*(_DWORD *)__globalGPUCommPage)
    IOGPUDeviceTraceEvent();
}

- (void)useResidencySets:(const void *)a3 count:(unint64_t)a4
{
  unint64_t v4;
  const void **v5;
  _DWORD *v6;
  BOOL v7;

  v4 = a4;
  v5 = a3;
  IOGPUMetalCommandBufferStorageAddResidencySets((uint64_t)self->_storage, (uint64_t *)a3, a4, 0);
  v6 = (_DWORD *)__globalGPUCommPage;
  if (*(_DWORD *)__globalGPUCommPage)
    v7 = v4 == 0;
  else
    v7 = 1;
  if (!v7)
  {
    do
    {
      if (*v6)
      {
        IOGPUDeviceTraceEvent();
        v6 = (_DWORD *)__globalGPUCommPage;
      }
      ++v5;
      --v4;
    }
    while (v4);
  }
}

- (void)useInternalResidencySet:(id)a3
{
  id v3;

  v3 = a3;
  IOGPUMetalCommandBufferStorageAddResidencySets((uint64_t)self->_storage, (uint64_t *)&v3, 1, 1u);
  if (*(_DWORD *)__globalGPUCommPage)
    IOGPUDeviceTraceEvent();
}

- (void)useInternalResidencySets:(const void *)a3 count:(unint64_t)a4
{
  unint64_t v4;
  const void **v5;
  _DWORD *v6;
  BOOL v7;

  v4 = a4;
  v5 = a3;
  IOGPUMetalCommandBufferStorageAddResidencySets((uint64_t)self->_storage, (uint64_t *)a3, a4, 1u);
  v6 = (_DWORD *)__globalGPUCommPage;
  if (*(_DWORD *)__globalGPUCommPage)
    v7 = v4 == 0;
  else
    v7 = 1;
  if (!v7)
  {
    do
    {
      if (*v6)
      {
        IOGPUDeviceTraceEvent();
        v6 = (_DWORD *)__globalGPUCommPage;
      }
      ++v5;
      --v4;
    }
    while (v4);
  }
}

- (unint64_t)gpuFaultAddress
{
  return self->_gpuFaultAddress;
}

- (void)initWithQueue:retainedReferences:synchronousDebugMode:.cold.1()
{
  __assert_rtn("-[IOGPUMetalCommandBuffer initWithQueue:retainedReferences:synchronousDebugMode:]", "IOGPUMetalCommandBuffer.m", 39, "[queue isKindOfClass:[IOGPUMetalCommandQueue class]]");
}

- (void)didCompleteWithStartTime:endTime:error:.cold.1()
{
  __assert_rtn("-[IOGPUMetalCommandBuffer didCompleteWithStartTime:endTime:error:]", "IOGPUMetalCommandBuffer.m", 153, "[_device isKindOfClass:[IOGPUMetalDevice class]]");
}

- (void)_reserveKernelCommandBufferSpace:.cold.1()
{
  __assert_rtn("-[IOGPUMetalCommandBuffer _reserveKernelCommandBufferSpace:]", "IOGPUMetalCommandBuffer.m", 367, "((uintptr_t)_kernelCommandBufferEnd - (uintptr_t)_kernelCommandBufferCurrent) >= commandSize");
}

@end
