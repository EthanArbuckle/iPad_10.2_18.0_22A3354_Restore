@implementation MTLIOAccelCommandBuffer

- (MTLIOAccelCommandBuffer)initWithQueue:(id)a3 retainedReferences:(BOOL)a4 synchronousDebugMode:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  MTLIOAccelCommandBuffer *v8;
  unsigned int *v9;
  MTLIOAccelCommandBufferStorage *Storage;
  uint64_t NextGlobalTraceID;
  objc_super v13;

  v5 = a5;
  v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MTLIOAccelCommandBuffer;
  v8 = -[_MTLCommandBuffer initWithQueue:retainedReferences:synchronousDebugMode:](&v13, sel_initWithQueue_retainedReferences_synchronousDebugMode_);
  if (v8)
  {
    v9 = (unsigned int *)*((id *)a3 + 49);
    v8->_device = (MTLDevice *)v9;
    MTLAtomicIncrement(v9 + 179);
    Storage = (MTLIOAccelCommandBufferStorage *)MTLIOAccelCommandBufferStoragePoolCreateStorage(*((_QWORD *)v8->_device + 84), v6);
    v8->_storage = Storage;
    if (Storage)
    {
      if (v5)
        v8->_commitAndResetSem = (OS_dispatch_semaphore *)dispatch_semaphore_create(1);
      -[MTLDevice deviceRef](v8->_device, "deviceRef");
      NextGlobalTraceID = IOAccelDeviceGetNextGlobalTraceID();
      v8->super._globalTraceObjectID = NextGlobalTraceID;
      v8->_storage->var23 = NextGlobalTraceID;
      if (*(_DWORD *)*MEMORY[0x1E0D39EE0])
        IOAccelDeviceTraceEvent();
    }
    else
    {

      return 0;
    }
  }
  return v8;
}

- (MTLIOAccelCommandBuffer)initWithQueue:(id)a3 retainedReferences:(BOOL)a4
{
  return -[MTLIOAccelCommandBuffer initWithQueue:retainedReferences:synchronousDebugMode:](self, "initWithQueue:retainedReferences:synchronousDebugMode:", a3, a4, 0);
}

- (void)setLabel:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTLIOAccelCommandBuffer;
  -[_MTLObjectWithLabel setLabel:](&v5, sel_setLabel_);
  if (*(_DWORD *)*MEMORY[0x1E0D39EE0])
  {
    -[MTLDevice deviceRef](self->_device, "deviceRef");
    objc_msgSend(a3, "cStringUsingEncoding:", 1);
    self->super._labelTraceID = IOAccelDeviceTraceObjectLabel();
  }
}

- (void)dealloc
{
  MTLIOAccelCommandBufferStorage *storage;
  NSObject *commitAndResetSem;
  objc_super v5;

  MTLAtomicDecrement((unsigned int *)self->_device + 179);
  storage = self->_storage;
  if (storage)
    MTLIOAccelCommandBufferStorageDealloc((uint64_t)storage);
  commitAndResetSem = self->_commitAndResetSem;
  if (commitAndResetSem)
    dispatch_release(commitAndResetSem);

  self->_device = 0;
  self->_purgedResources = 0;
  v5.receiver = self;
  v5.super_class = (Class)MTLIOAccelCommandBuffer;
  -[_MTLCommandBuffer dealloc](&v5, sel_dealloc);
}

- (void)getCurrentKernelCommandBufferStart:(void *)a3 current:(void *)a4 end:(void *)a5
{
  MTLIOAccelCommandBufferStorage *storage;

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
  MTLIOAccelCommandBufferStorage *storage;

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
  MTLIOAccelCommandBufferStorageGrowKernelCommandBuffer((uint64_t)self->_storage, a3);
}

- (void)allocCommandBufferResourceAtIndex:(unsigned int)a3
{
  MTLIOAccelCommandBufferStorageAllocResourceAtIndex((uint64_t)self->_storage, *(uint64_t *)&a3);
}

- (void)didCompleteWithStartTime:(unint64_t)a3 endTime:(unint64_t)a4 error:(id)a5
{
  objc_super v6;

  if (self->super._profilingEnabled)
    self->super._submitToHardwareTime = *self->_submitToHardwareTimeStampPointer;
  v6.receiver = self;
  v6.super_class = (Class)MTLIOAccelCommandBuffer;
  -[_MTLCommandBuffer didCompleteWithStartTime:endTime:error:](&v6, sel_didCompleteWithStartTime_endTime_error_, a3, a4, a5);
  MTLIOAccelCommandBufferStorageDealloc((uint64_t)self->_storage);
  self->_storage = 0;
}

- (IOAccelResourceList)ioAccelResourceList
{
  return &self->_storage->var13;
}

- (IOAccelSegmentListHeader)getSegmentListHeader
{
  return self->_storage->var10;
}

- (void)getSegmentListPointerStart:(void *)a3 current:(void *)a4 end:(void *)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  MTLIOAccelCommandBufferStorageGetSegmentListPointers((uint64_t)self->_storage, a3, a4, a5, (uint64_t)a5, v5, v6, v7);
}

- (MTLIOAccelCommandBufferResourceInfo)commandBufferResourceInfo
{
  return self->_storage->var19;
}

- (void)setCurrentSegmentListPointer:(void *)a3
{
  MTLIOAccelCommandBufferStorage *storage;

  storage = self->_storage;
  storage->var11 = (IOAccelSegmentResourceListHeader *)a3;
  storage->var12 = (IOAccelSegmentResourceDescriptorGroup *)((char *)a3 + 24);
}

- (void)growSegmentList
{
  MTLIOAccelCommandBufferStorageGrowSegmentList((uint64_t)self->_storage);
}

- (void)beginSegment:(void *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  MTLIOAccelCommandBufferStorageBeginSegment((uint64_t)self->_storage, (uint64_t)a3, (uint64_t)a3, v3, v4, v5, v6, v7);
}

- (void)endCurrentSegment
{
  MTLIOAccelCommandBufferStorageEndSegment((uint64_t)self->_storage);
}

- (void)validate
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;

  if (self->super._status >= 2)
    MTLReportFailure(0, "-[MTLIOAccelCommandBuffer validate]", 207, (uint64_t)CFSTR("commit an already committed command buffer"), v2, v3, v4, v5, v7);
  if (self->super._currentCommandEncoder)
    MTLReportFailure(0, "-[MTLIOAccelCommandBuffer validate]", 208, (uint64_t)CFSTR("commit command buffer with uncommitted encoder"), v2, v3, v4, v5, v8);
}

- (void)commit
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v10;

  if (-[_MTLCommandBuffer isProfilingEnabled](self, "isProfilingEnabled"))
    -[MTLIOAccelCommandBuffer kernelCommandCollectTimeStamp](self, "kernelCommandCollectTimeStamp");
  if (self->_purgedResources)
    -[MTLIOAccelCommandBuffer _encodePurgedResources](self, "_encodePurgedResources");
  MTLIOAccelCommandBufferStorageFinalizeShmemHeader((uint64_t)self->_storage, v3, v4, v5, v6, v7, v8, v9);
  if (*(_DWORD *)*MEMORY[0x1E0D39EE0])
    IOAccelDeviceTraceEvent();
  v10.receiver = self;
  v10.super_class = (Class)MTLIOAccelCommandBuffer;
  -[_MTLCommandBuffer commit](&v10, sel_commit);
}

- (void)commitAndReset
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  objc_super v12;
  objc_super v13;

  dispatch_semaphore_wait((dispatch_semaphore_t)self->_commitAndResetSem, 0xFFFFFFFFFFFFFFFFLL);
  if (-[_MTLCommandBuffer isProfilingEnabled](self, "isProfilingEnabled"))
    -[MTLIOAccelCommandBuffer kernelCommandCollectTimeStamp](self, "kernelCommandCollectTimeStamp");
  if (self->_purgedResources)
    -[MTLIOAccelCommandBuffer _encodePurgedResources](self, "_encodePurgedResources");
  MTLIOAccelCommandBufferStorageFinalizeShmemHeader((uint64_t)self->_storage, v3, v4, v5, v6, v7, v8, v9);
  v13.receiver = self;
  v13.super_class = (Class)MTLIOAccelCommandBuffer;
  -[_MTLCommandBuffer commitAndReset](&v13, sel_commitAndReset);
  v10 = *((_QWORD *)self->_device + 84);
  v12.receiver = self;
  v12.super_class = (Class)MTLIOAccelCommandBuffer;
  v11 = -[_MTLCommandBuffer retainedReferences](&v12, sel_retainedReferences);
  self->_storage = (MTLIOAccelCommandBufferStorage *)MTLIOAccelCommandBufferStoragePoolCreateStorage(v10, v11);
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_commitAndResetSem);
}

- (id)akResourceList
{
  return self->_storage->var14;
}

- (id)akPrivateResourceList
{
  return self->_storage->var15;
}

- (void)kernelCommandCollectTimeStamp
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  MTLIOAccelCommandBufferStorage *storage;
  uint64_t var5;

  storage = self->_storage;
  var5 = (uint64_t)storage->var5;
  if ((unint64_t)&storage->var6[-var5] <= 0xF)
  {
    MTLIOAccelCommandBufferStorageGrowKernelCommandBuffer((uint64_t)storage, 16);
    storage = self->_storage;
    var5 = (uint64_t)storage->var5;
  }
  MTLIOAccelCommandBufferStorageBeginSegment((uint64_t)storage, var5, v2, v3, v4, v5, v6, v7);
  *(_QWORD *)var5 = 0x1000000002;
  self->_submitToHardwareTimeStampPointer = (unint64_t *)(var5 + 8);
  self->_storage->var5 = (char *)(var5 + 16);
  MTLIOAccelCommandBufferStorageEndSegment((uint64_t)self->_storage);
}

- (void)setCurrentCommandEncoder:(id)a3
{
  MTLIOAccelCommandBufferStorage *storage;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTLIOAccelCommandBuffer;
  -[_MTLCommandBuffer setCurrentCommandEncoder:](&v6, sel_setCurrentCommandEncoder_);
  if (*(_DWORD *)*MEMORY[0x1E0D39EE0])
  {
    objc_msgSend(a3, "globalTraceObjectID");
    getpid();
    IOAccelDeviceTraceEvent();
  }
  storage = self->_storage;
  if (storage)
    storage->var20 = a3;
}

- (void)pushDebugGroup:(id)a3
{
  objc_super v5;

  if (*(_DWORD *)*MEMORY[0x1E0D39EE0])
  {
    -[MTLDevice deviceRef](self->_device, "deviceRef");
    -[_MTLCommandBuffer globalTraceObjectID](self, "globalTraceObjectID");
    objc_msgSend(a3, "cStringUsingEncoding:", 1);
    IOAccelDeviceTraceObjectLabel();
  }
  v5.receiver = self;
  v5.super_class = (Class)MTLIOAccelCommandBuffer;
  -[_MTLCommandBuffer pushDebugGroup:](&v5, sel_pushDebugGroup_, a3);
}

- (void)popDebugGroup
{
  objc_super v3;

  if (*(_DWORD *)*MEMORY[0x1E0D39EE0])
  {
    -[MTLDevice deviceRef](self->_device, "deviceRef");
    -[_MTLCommandBuffer globalTraceObjectID](self, "globalTraceObjectID");
    IOAccelDeviceTraceEvent();
  }
  v3.receiver = self;
  v3.super_class = (Class)MTLIOAccelCommandBuffer;
  -[_MTLCommandBuffer popDebugGroup](&v3, sel_popDebugGroup);
}

- (void)_reserveKernelCommandBufferSpace:(unint64_t)a3
{
  MTLIOAccelCommandBufferStorage *storage;
  void *result;
  char *var6;
  void *v8;

  storage = self->_storage;
  result = storage->var5;
  var6 = storage->var6;
  v8 = result;
  if (var6 - (_BYTE *)result < a3)
  {
    -[MTLIOAccelCommandBuffer growKernelCommandBuffer:](self, "growKernelCommandBuffer:", a3);
    -[MTLIOAccelCommandBuffer getCurrentKernelCommandBufferPointer:end:](self, "getCurrentKernelCommandBufferPointer:end:", &v8, &var6);
    result = v8;
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
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v9 = (a4 + 19) & 0xFFFFFFFC;
  v10 = -[MTLIOAccelCommandBuffer _reserveKernelCommandBufferSpace:](self, "_reserveKernelCommandBufferSpace:", (a4 + 19) & 0xFFFFFFFFFFFFFFFCLL);
  v11 = (int)v10;
  *v10 = 0;
  v10[1] = v9;
  v10[2] = a5;
  v10[3] = a4;
  memcpy(v10 + 4, a3, a4);
  MTLIOAccelCommandBufferStorageBeginKernelCommands((uint64_t)self->_storage, v11, v12, v13, v14, v15, v16, v17);
  MTLIOAccelCommandBufferStorageEndKernelCommands((uint64_t)self->_storage, v11 + v9);
}

- (void)kprintfBytes:(const char *)a3 length:(unint64_t)a4
{
  -[MTLIOAccelCommandBuffer commitEncoder](self, "commitEncoder");
  -[MTLIOAccelCommandBuffer _debugBytes:length:output_type:](self, "_debugBytes:length:output_type:", a3, a4, 0);
}

- (void)encodeSubmitSleepMS:(unsigned int)a3
{
  _DWORD *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  -[MTLIOAccelCommandBuffer commitEncoder](self, "commitEncoder");
  v5 = -[MTLIOAccelCommandBuffer _reserveKernelCommandBufferSpace:](self, "_reserveKernelCommandBufferSpace:", 16);
  v6 = (int)v5;
  *(_QWORD *)v5 = 0x1000000003;
  v5[2] = a3;
  v5[3] = 0;
  MTLIOAccelCommandBufferStorageBeginKernelCommands((uint64_t)self->_storage, (int)v5, v7, v8, v9, v10, v11, v12);
  MTLIOAccelCommandBufferStorageEndKernelCommands((uint64_t)self->_storage, v6 + 16);
}

- (void)encodeSignalEvent:(id)a3 value:(unint64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _DWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  if (self->super._currentCommandEncoder)
    MTLReportFailure(0, "-[MTLIOAccelCommandBuffer encodeSignalEvent:value:]", 414, (uint64_t)CFSTR("encodeSignalEvent:value: with uncommitted encoder"), v4, v5, v6, v7, v18);
  -[MTLIOAccelCommandBuffer commitEncoder](self, "commitEncoder");
  v11 = -[MTLIOAccelCommandBuffer _reserveKernelCommandBufferSpace:](self, "_reserveKernelCommandBufferSpace:", 24);
  *((_QWORD *)v11 + 2) = 0;
  *((_QWORD *)v11 + 1) = 0;
  *v11 = objc_msgSend(a3, "encodeKernelSignalEventCommandArgs:value:", v11 + 2, a4);
  v11[1] = 24;
  MTLIOAccelCommandBufferStorageBeginKernelCommands((uint64_t)self->_storage, (int)v11, v12, v13, v14, v15, v16, v17);
  MTLIOAccelCommandBufferStorageEndKernelCommands((uint64_t)self->_storage, (_DWORD)v11 + 24);
  if (self->super._retainedReferences)
    -[_MTLCommandBuffer _addRetainedObject:](self, "_addRetainedObject:", a3);
}

- (void)encodeWaitForEvent:(id)a3 value:(unint64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _DWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  if (self->super._currentCommandEncoder)
    MTLReportFailure(0, "-[MTLIOAccelCommandBuffer encodeWaitForEvent:value:]", 437, (uint64_t)CFSTR("encodeWaitForEvent:value: with uncommitted encoder"), v4, v5, v6, v7, v18);
  -[MTLIOAccelCommandBuffer commitEncoder](self, "commitEncoder");
  v11 = -[MTLIOAccelCommandBuffer _reserveKernelCommandBufferSpace:](self, "_reserveKernelCommandBufferSpace:", 24);
  *((_QWORD *)v11 + 2) = 0;
  *((_QWORD *)v11 + 1) = 0;
  *v11 = objc_msgSend(a3, "encodeKernelWaitEventCommandArgs:value:", v11 + 2, a4);
  v11[1] = 24;
  MTLIOAccelCommandBufferStorageBeginKernelCommands((uint64_t)self->_storage, (int)v11, v12, v13, v14, v15, v16, v17);
  MTLIOAccelCommandBufferStorageEndKernelCommands((uint64_t)self->_storage, (_DWORD)v11 + 24);
  if (self->super._retainedReferences)
    -[_MTLCommandBuffer _addRetainedObject:](self, "_addRetainedObject:", a3);
}

- (void)encodeWaitForEvent:(id)a3 value:(unint64_t)a4 timeout:(unsigned int)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _DWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v8 = *(_QWORD *)&a5;
  if (self->super._currentCommandEncoder)
    MTLReportFailure(0, "-[MTLIOAccelCommandBuffer encodeWaitForEvent:value:timeout:]", 459, (uint64_t)CFSTR("encodeWaitForEvent:value:timeout: with uncommitted encoder"), *(uint64_t *)&a5, v5, v6, v7, v19);
  -[MTLIOAccelCommandBuffer commitEncoder](self, "commitEncoder");
  v12 = -[MTLIOAccelCommandBuffer _reserveKernelCommandBufferSpace:](self, "_reserveKernelCommandBufferSpace:", 24);
  *((_QWORD *)v12 + 2) = 0;
  *((_QWORD *)v12 + 1) = 0;
  *v12 = objc_msgSend(a3, "encodeKernelWaitEventCommandArgs:value:timeout:", v12 + 2, a4, v8);
  v12[1] = 24;
  MTLIOAccelCommandBufferStorageBeginKernelCommands((uint64_t)self->_storage, (int)v12, v13, v14, v15, v16, v17, v18);
  MTLIOAccelCommandBufferStorageEndKernelCommands((uint64_t)self->_storage, (_DWORD)v12 + 24);
  if (self->super._retainedReferences)
    -[_MTLCommandBuffer _addRetainedObject:](self, "_addRetainedObject:", a3);
}

- (void)encodeConditionalAbortEvent:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _DWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  if (self->super._currentCommandEncoder)
    MTLReportFailure(0, "-[MTLIOAccelCommandBuffer encodeConditionalAbortEvent:]", 486, (uint64_t)CFSTR("encodeConditionalAbortEvent:value: with uncommitted encoder"), v3, v4, v5, v6, v16);
  -[MTLIOAccelCommandBuffer commitEncoder](self, "commitEncoder");
  v9 = -[MTLIOAccelCommandBuffer _reserveKernelCommandBufferSpace:](self, "_reserveKernelCommandBufferSpace:", 24);
  *((_QWORD *)v9 + 2) = 0;
  *((_QWORD *)v9 + 1) = 0;
  *v9 = objc_msgSend(a3, "encodeConditionalEventAbortCommandArgs:", v9 + 2);
  v9[1] = 24;
  MTLIOAccelCommandBufferStorageBeginKernelCommands((uint64_t)self->_storage, (int)v9, v10, v11, v12, v13, v14, v15);
  MTLIOAccelCommandBufferStorageEndKernelCommands((uint64_t)self->_storage, (_DWORD)v9 + 24);
  if (self->super._retainedReferences)
    -[_MTLCommandBuffer _addRetainedObject:](self, "_addRetainedObject:", a3);
}

- (unint64_t)protectionOptions
{
  return self->_protectionOptions;
}

- (void)setProtectionOptions:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  if (self->super._currentCommandEncoder)
    MTLReportFailure(0, "-[MTLIOAccelCommandBuffer setProtectionOptions:]", 543, (uint64_t)CFSTR("setProtectionOptions: with uncommitted encoder"), v3, v4, v5, v6, v17);
  -[MTLIOAccelCommandBuffer commitEncoder](self, "commitEncoder");
  self->_protectionOptions = a3;
  v9 = -[MTLIOAccelCommandBuffer _reserveKernelCommandBufferSpace:](self, "_reserveKernelCommandBufferSpace:", 16);
  v10 = (int)v9;
  *v9 = 0x100000000ALL;
  v9[1] = a3;
  MTLIOAccelCommandBufferStorageBeginKernelCommands((uint64_t)self->_storage, (int)v9, v11, v12, v13, v14, v15, v16);
  MTLIOAccelCommandBufferStorageEndKernelCommands((uint64_t)self->_storage, v10 + 16);
}

- (void)addPurgedResource:(id)a3
{
  NSMutableSet *purgedResources;

  purgedResources = self->_purgedResources;
  if (!purgedResources)
  {
    purgedResources = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
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
      purgedResources = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
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
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  int v18;
  int v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = 4 * -[NSMutableSet count](self->_purgedResources, "count") + 12;
  v4 = -[MTLIOAccelCommandBuffer _reserveKernelCommandBufferSpace:](self, "_reserveKernelCommandBufferSpace:", v3);
  *v4 = 9;
  v4[1] = v3;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  purgedResources = self->_purgedResources;
  v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](purgedResources, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v6)
  {
    v13 = v6;
    v19 = v3;
    v14 = 0;
    v15 = *(_QWORD *)v21;
    do
    {
      v16 = 0;
      v17 = v14;
      do
      {
        if (*(_QWORD *)v21 != v15)
          objc_enumerationMutation(purgedResources);
        v4[(v17 + v16) + 3] = *(_DWORD *)(*(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v16) + 80);
        ++v16;
      }
      while (v13 != v16);
      v13 = -[NSMutableSet countByEnumeratingWithState:objects:count:](purgedResources, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      v14 = v17 + v16;
    }
    while (v13);
    v18 = v17 + v16;
    LODWORD(v3) = v19;
  }
  else
  {
    v18 = 0;
  }
  v4[2] = v18;
  MTLIOAccelCommandBufferStorageBeginKernelCommands((uint64_t)self->_storage, (int)v4, v7, v8, v9, v10, v11, v12);
  MTLIOAccelCommandBufferStorageEndKernelCommands((uint64_t)self->_storage, (_DWORD)v4 + v3);

  self->_purgedResources = 0;
}

- (void)setResponsibleTaskIDs:(const unsigned int *)a3 count:(unsigned int)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v11;
  int v12;
  _DWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  _DWORD *v21;
  int v22;
  uint64_t v23;

  if (self->super._currentCommandEncoder)
    MTLReportFailure(0, "-[MTLIOAccelCommandBuffer setResponsibleTaskIDs:count:]", 656, (uint64_t)CFSTR("setResponsibleTaskIDs: with uncommitted encoder"), v4, v5, v6, v7, v23);
  -[MTLIOAccelCommandBuffer commitEncoder](self, "commitEncoder");
  if (a3)
    v11 = a4;
  else
    v11 = 0;
  v12 = (4 * v11 + 15) & 0xFFFFFFFC;
  v13 = -[MTLIOAccelCommandBuffer _reserveKernelCommandBufferSpace:](self, "_reserveKernelCommandBufferSpace:", (4 * v11 + 15) & 0x7FFFFFFFCLL);
  v20 = (int)v13;
  *v13 = 14;
  v13[1] = v12;
  v13[2] = v11;
  if ((_DWORD)v11)
  {
    v21 = v13 + 3;
    do
    {
      v22 = *a3++;
      *v21++ = v22;
      --v11;
    }
    while (v11);
  }
  MTLIOAccelCommandBufferStorageBeginKernelCommands((uint64_t)self->_storage, (int)v13, v14, v15, v16, v17, v18, v19);
  MTLIOAccelCommandBufferStorageEndKernelCommands((uint64_t)self->_storage, v20 + v12);
}

- (MTLIOAccelCommandBufferStorage)commandBufferStorage
{
  return self->_storage;
}

- (MTLDevice)device
{
  return self->_device;
}

@end
