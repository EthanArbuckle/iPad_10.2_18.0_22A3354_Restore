@implementation AGXA10FamilyCommandQueue

- (id)commandBuffer
{
  return -[AGXA10FamilyCommandBuffer initWithQueue:retainedReferences:]([AGXA10FamilyCommandBuffer alloc], "initWithQueue:retainedReferences:", self, 1);
}

- (id)commandBufferWithUnretainedReferences
{
  return -[AGXA10FamilyCommandBuffer initWithQueue:retainedReferences:]([AGXA10FamilyCommandBuffer alloc], "initWithQueue:retainedReferences:", self, 0);
}

- (id)commandBufferWithDescriptor:(id)a3
{
  AGXA10FamilyCommandBuffer *v4;
  _DWORD *v5;
  int v6;
  objc_class *v7;
  _BYTE *impl;

  v4 = -[AGXA10FamilyCommandBuffer initWithQueue:retainedReferences:]([AGXA10FamilyCommandBuffer alloc], "initWithQueue:retainedReferences:", self, objc_msgSend(a3, "retainedReferences"));
  -[_MTLCommandBuffer setErrorOptions:](v4, "setErrorOptions:", objc_msgSend(a3, "errorOptions"));
  v5 = (_DWORD *)objc_msgSend(a3, "deadlineProfile");
  if (v5)
  {
    v6 = v5[8];
    v7 = v5;
    *(Class *)((char *)&v4->super.super.super.super.isa + (int)*MEMORY[0x24BDDD818]) = v7;
    *((_DWORD *)v4->_impl + 16) = v6;
  }
  v4->_captureProgramAddressTable = objc_msgSend(a3, "captureProgramAddressTable");
  v4->_cloneIntersectionFunctionTablesPerDispatch = objc_msgSend(a3, "cloneIntersectionFunctionTablesPerDispatch");
  impl = v4->_impl;
  impl[96] = objc_msgSend(a3, "disableFineGrainedComputePreemption");
  -[_MTLCommandBuffer configWithCommandBufferDescriptor:](v4, "configWithCommandBufferDescriptor:", a3);
  return v4;
}

- (void)setLabel:(id)a3
{
  uint64_t v5;
  int v6;
  objc_super v7;

  v5 = objc_msgSend(*(id *)(-[IOGPUMetalCommandQueue device](self, "device") + 856), "indexOfObject:", a3);
  v6 = 1 << v5;
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
    v6 = 0;
  *((_DWORD *)&self->super._resourceGroupsLock + 1) |= v6;
  v7.receiver = self;
  v7.super_class = (Class)AGXA10FamilyCommandQueue;
  -[IOGPUMetalCommandQueue setLabel:](&v7, sel_setLabel_, a3);
}

- (void)setCommandQueueConfig:(unsigned int)a3 crossQueueHazardTracking:(BOOL)a4 disableIOFencing:(BOOL)a5 enableLowLatencySignalSharedEvent:(BOOL)a6 enableLowLatencyWaitSharedEvent:(BOOL)a7 lockParameterBufferSizeToMax:(BOOL)a8
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  mach_port_t Connect;
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  if (a4)
    v8 = a3 | 0x100000000;
  v9 = 0x200000000;
  if (!a5)
    v9 = 0;
  v10 = 0x400000000;
  if (!a6)
    v10 = 0;
  v11 = v9 | v10;
  v12 = 0x800000000;
  if (!a7)
    v12 = 0;
  v13 = v8 | v11 | v12;
  v14 = 0x1000000000;
  if (!a8)
    v14 = 0;
  v15 = v13 | v14;
  input[0] = IOGPUCommandQueueGetID();
  input[1] = v15;
  Connect = IOGPUCommandQueueGetConnect();
  IOConnectCallScalarMethod(Connect, 0x108u, input, 2u, 0, 0);
}

- (unint64_t)resolveAndUpdateQueuePriority:(unint64_t)a3
{
  unsigned __int8 v4;
  unsigned __int8 v5;
  _BYTE *v6;
  unsigned __int8 v7;
  int v9;
  AGXA10FamilyCommandQueue *v10;
  int v11;
  int v12;
  _BYTE *v13;
  int v14;
  int v15;
  AGXA10FamilyCommandQueue *v16;
  AGXA10FamilyCommandQueue *v17;
  uint64_t v18;

  if ((v4 & 1) == 0)
  {
    v16 = self;
    self = v16;
    if (v9)
    {
      -[AGXA10FamilyCommandQueue resolveAndUpdateQueuePriority:]::isInternalInstall = *(_BYTE *)(*(_QWORD *)(-[IOGPUMetalCommandQueue device](v16, "device") + 808)
                                                                                               + 6681);
      self = v16;
    }
  }
  if (-[AGXA10FamilyCommandQueue resolveAndUpdateQueuePriority:]::isInternalInstall)
  {
    v6 = &unk_255FF8000;
    if ((v5 & 1) == 0)
    {
      v10 = self;
      v6 = &unk_255FF8000;
      v12 = v11;
      self = v10;
      if (v12)
      {
        -[AGXA10FamilyCommandQueue resolveAndUpdateQueuePriority:]::forceGPUPriorityHigh = 0;
        v6 = (_BYTE *)&unk_255FF8000;
        self = v10;
      }
    }
    v18 = 0;
    if ((v7 & 1) == 0)
    {
      v17 = self;
      v13 = v6;
      v6 = v13;
      v15 = v14;
      self = v17;
      if (v15)
      {
        -[AGXA10FamilyCommandQueue resolveAndUpdateQueuePriority:]::forceGPUPriorityEVIsSet = findEnvVarNum<unsigned long long>("AGX_FORCE_GPU_PRIORITY", &v18);
        v6 = v13;
        self = v17;
      }
    }
    if (v6[120])
      a3 = 0;
  }
  HIDWORD(self->_commandQueueBTInfo.callstack[63]) = a3;
  return a3;
}

- (BOOL)setGPUPriority:(unint64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AGXA10FamilyCommandQueue;
  return -[IOGPUMetalCommandQueue setGPUPriority:](&v4, sel_setGPUPriority_, -[AGXA10FamilyCommandQueue resolveAndUpdateQueuePriority:](self, "resolveAndUpdateQueuePriority:", a3));
}

- (BOOL)setGPUPriority:(unint64_t)a3 offset:(unsigned __int16)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AGXA10FamilyCommandQueue;
  return -[IOGPUMetalCommandQueue setGPUPriority:offset:](&v5, sel_setGPUPriority_offset_, -[AGXA10FamilyCommandQueue resolveAndUpdateQueuePriority:](self, "resolveAndUpdateQueuePriority:", a3), a4);
}

- (AGXA10FamilyCommandQueue)initWithDevice:(id)a3 descriptor:(id)a4
{
  id v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  unsigned __int8 v9;
  unsigned int v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)AGXA10FamilyCommandQueue;
  v5 = -[IOGPUMetalCommandQueue initWithDevice:descriptor:](&v12, sel_initWithDevice_descriptor_, a3);
  if (v5)
  {
    v6 = objc_msgSend(a4, "devicePartition");
    if (v6 == 2)
      v7 = 1;
    else
      v7 = -1;
    if (v6 == 1)
      v8 = 0;
    else
      v8 = v7;
    objc_msgSend(v5, "setCommandQueueConfig:crossQueueHazardTracking:disableIOFencing:enableLowLatencySignalSharedEvent:enableLowLatencyWaitSharedEvent:lockParameterBufferSizeToMax:", v8, objc_msgSend(a4, "disableCrossQueueHazardTracking") ^ 1, objc_msgSend(a4, "disableIOFencing"), objc_msgSend(a4, "enableLowLatencySignalSharedEvent"), objc_msgSend(a4, "enableLowLatencyWaitSharedEvent"), objc_msgSend(a4, "lockParameterBufferSizeToMax"));
    if ((v9 & 1) == 0
    {
      -[AGXA10FamilyCommandQueue initWithDevice:descriptor:]::isInternalInstall = *(_BYTE *)(*(_QWORD *)(objc_msgSend(v5, "device") + 808)
                                                                                           + 6681);
    }
    if (-[AGXA10FamilyCommandQueue initWithDevice:descriptor:]::isInternalInstall)
      objc_msgSend(v5, "setGPUPriority:", 1);
    objc_msgSend(v5, "device");
    if (AGXATelemetry::shouldCaptureTelemetryData(void)::onceToken[0] != -1)
      dispatch_once(AGXATelemetry::shouldCaptureTelemetryData(void)::onceToken, &__block_literal_global_5209);
    if (AGXATelemetry::shouldCaptureTelemetryData(void)::shouldCapture)
    {
      v10 = atomic_load(AGXATelemetry::backtracesCaptured);
      if (v10 <= 9)
      {
        *((_DWORD *)v5 + 112) = backtrace((void **)v5 + 57, 64);
        *((_BYTE *)v5 + 968) = 0;
      }
    }
  }
  return (AGXA10FamilyCommandQueue *)v5;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[16];

  if (*(_BYTE *)(*(_QWORD *)(-[IOGPUMetalCommandQueue device](self, "device") + 808) + 6733))
  {
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_232C19000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CommandQueueLifetime", "CommandQueue is deallocated!", buf, 2u);
    }
  }
  v4.receiver = self;
  v4.super_class = (Class)AGXA10FamilyCommandQueue;
  -[IOGPUMetalCommandQueue dealloc](&v4, sel_dealloc);
}

- (id)availableCounters
{
  return 0;
}

- (int)requestCounters:(id)a3
{
  return -1;
}

- (id)getRequestedCounters
{
  return 0;
}

- (id)counterInfo
{
  return 0;
}

- (id)subdivideCounterList:(id)a3
{
  return 0;
}

@end
