@implementation IOGPUMetalCommandQueue

- (MTLDevice)device
{
  return self->_device;
}

- (void)setCompletionQueue:(id)a3
{
  uint64_t v5;
  NSObject *v6;

  if (!a3)
    -[IOGPUMetalCommandQueue setCompletionQueue:].cold.1();
  v5 = (int)*MEMORY[0x24BDDD888];
  v6 = *(NSObject **)((char *)&self->super.super.super.isa + v5);
  if (v6)
    dispatch_release(v6);
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)a3;
  dispatch_retain((dispatch_object_t)a3);
  IOGPUCommandQueueSetDispatchQueue((uint64_t)self->_commandQueue, *(NSObject **)((char *)&self->super.super.super.isa + v5));
}

- (IOGPUMetalCommandQueue)initWithDevice:(id)a3 descriptor:(id)a4
{
  char *v6;
  mach_port_t *v7;
  mach_port_t *v8;
  char v9;
  NSObject *v10;
  void *v11;
  id v12;
  io_object_t v13;
  io_registry_entry_t v14;
  void *v15;
  CFTypeRef CFProperty;
  void *v17;
  CFTypeRef v18;
  void *v19;
  void *v21;
  io_iterator_t iterator;
  objc_super v23;
  uint8_t buf[4];
  id v25;
  _QWORD v26[2];
  _QWORD v27[3];

  v27[2] = *MEMORY[0x24BDAC8D0];
  v23.receiver = self;
  v23.super_class = (Class)IOGPUMetalCommandQueue;
  v6 = -[_MTLCommandQueue initWithDevice:descriptor:](&v23, sel_initWithDevice_descriptor_);
  if (v6)
  {
    *((_QWORD *)v6 + 49) = a3;
    v7 = (mach_port_t *)objc_msgSend(a3, "deviceRef");
    v8 = IOGPUCommandQueueCreateWithQoS(v7, *(_DWORD *)&v6[*MEMORY[0x24BDDD8A8]], v6[*MEMORY[0x24BDDD8A0]]);
    *((_QWORD *)v6 + 48) = v8;
    if (v8)
    {
      *((_DWORD *)v6 + 110) = 0;
      v9 = objc_msgSend(a4, "disableAsyncCompletionDispatch");
      v6[400] = v9;
      if ((v9 & 1) == 0)
      {
        v10 = *(NSObject **)&v6[*MEMORY[0x24BDDD888]];
        if (!v10)
          -[IOGPUMetalCommandQueue initWithDevice:descriptor:].cold.2();
        IOGPUCommandQueueSetDispatchQueue(*((_QWORD *)v6 + 48), v10);
      }
      *((_QWORD *)v6 + 51) = 1;
      *((_QWORD *)v6 + 52) = 3;
      *(_QWORD *)&v6[*MEMORY[0x24BDDD890]] = IOGPUCommandQueueGetGlobalTraceObjectID(*((_QWORD *)v6 + 48));
    }
    else
    {
      v11 = (void *)MEMORY[0x212BDF02C]();
      v12 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      iterator = 0;
      if (!MEMORY[0x212BDE9F0](objc_msgSend(a3, "acceleratorPort"), "IOService", 0, &iterator))
      {
        v21 = v11;
        v13 = IOIteratorNext(iterator);
        if (v13)
        {
          v14 = v13;
          do
          {
            v15 = (void *)MEMORY[0x212BDF02C]();
            CFProperty = IORegistryEntryCreateCFProperty(v14, CFSTR("CommandQueueCount"), 0, 0);
            if (CFProperty)
            {
              v17 = (void *)CFProperty;
              v18 = IORegistryEntryCreateCFProperty(v14, CFSTR("IOUserClientCreator"), 0, 0);
              if (v18)
              {
                v19 = (void *)v18;
                v26[0] = CFSTR("Count");
                v26[1] = CFSTR("Process");
                v27[0] = v17;
                v27[1] = v18;
                objc_msgSend(v12, "addObject:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, v26, 2));

              }
            }
            objc_autoreleasePoolPop(v15);
            IOObjectRelease(v14);
            v14 = IOIteratorNext(iterator);
          }
          while (v14);
        }
        IOObjectRelease(iterator);
      }
      objc_msgSend(v12, "sortUsingComparator:", &__block_literal_global, v21);
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v25 = v12;
        _os_log_impl(&dword_211652000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Command queue creation failed.  Worst processes %@", buf, 0xCu);
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
        -[IOGPUMetalCommandQueue initWithDevice:descriptor:].cold.1((uint64_t)v12);

      objc_autoreleasePoolPop(v11);
      return 0;
    }
  }
  return (IOGPUMetalCommandQueue *)v6;
}

- (void)submitCommandBuffers:(id *)a3 count:(unint64_t)a4
{
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;

  if (a4)
  {
    v7 = 0;
    v8 = a4;
    do
    {
      v9 = v8 - 32;
      if (v8 >= 0x20)
        v10 = 32;
      else
        v10 = v8;
      -[IOGPUMetalCommandQueue _submitCommandBuffers:count:](self, "_submitCommandBuffers:count:", a3, v10);
      v7 += 32;
      a3 += 32;
      v8 = v9;
    }
    while (v7 < a4);
  }
}

- (void)_submitCommandBuffers:(id *)a3 count:(unint64_t)a4
{
  unsigned int v7;
  uintptr_t v8;
  uint64_t v9;
  size_t v10;
  char *v11;
  unint64_t v12;
  id v13;
  int v14;
  int v15;
  int v16;
  uint64_t v17;
  __int128 *v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  char *v22;
  _QWORD block[4];
  __int128 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v7 = -[MTLDevice cmdBufArgsSize](self->_device, "cmdBufArgsSize");
  if (HIDWORD(a4))
    -[IOGPUMetalCommandQueue _submitCommandBuffers:count:].cold.1();
  v8 = v7;
  MEMORY[0x24BDAC7A8]();
  v22 = (char *)&v21 - v9;
  bzero((char *)&v21 - v9, v10);
  if (a4)
  {
    v11 = v22;
    v12 = a4;
    do
    {
      v13 = *a3;
      objc_msgSend(*a3, "fillCommandBufferArgs:commandQueue:", v11, self);
      if (objc_msgSend(v13, "isProfilingEnabled"))
        objc_msgSend(v13, "kernelSubmitTime");
      if (*(_DWORD *)__globalGPUCommPage)
      {
        objc_msgSend((id)objc_msgSend(v13, "commandQueue"), "backgroundTrackingPID");
        objc_msgSend((id)objc_msgSend(v13, "device"), "globalTraceObjectID");
        objc_msgSend((id)objc_msgSend(v13, "commandQueue"), "globalTraceObjectID");
        objc_msgSend(v13, "globalTraceObjectID");
        IOGPUDeviceTraceEvent();
      }
      v11 += v8;
      ++a3;
      --v12;
    }
    while (v12);
  }
  v14 = IOGPUCommandQueueSubmitCommandBuffers((uint64_t)self->_commandQueue, 0, a4, v22, v8);
  if (v14)
  {
    if (v14 == 268435459)
      v15 = 15;
    else
      v15 = 1;
    if (v14 == -536870174)
      v16 = 7;
    else
      v16 = v15;
    if (a4)
    {
      v17 = (int)*MEMORY[0x24BDDD880];
      v18 = (__int128 *)(v22 + 16);
      v19 = MEMORY[0x24BDAC760];
      do
      {
        v20 = *(NSObject **)((char *)&self->super.super.super.isa + v17);
        block[0] = v19;
        block[1] = 3221225472;
        block[2] = __54__IOGPUMetalCommandQueue__submitCommandBuffers_count___block_invoke;
        block[3] = &unk_24CC3F7B8;
        v24 = *v18;
        v25 = v16;
        dispatch_async(v20, block);
        v18 = (__int128 *)((char *)v18 + v8);
        --a4;
      }
      while (a4);
    }
  }
}

- (BOOL)setGPUPriority:(unint64_t)a3
{
  validateGPUPriority(a3, 0);
  return -[IOGPUMetalCommandQueue _setGPUPriority:backgroundPriority:](self, "_setGPUPriority:backgroundPriority:", a3, self->_backgroundPriority);
}

- (BOOL)_setGPUPriority:(unint64_t)a3 backgroundPriority:(unint64_t)a4
{
  int v6;
  unsigned int v8;
  _DWORD inputStruct[3];

  inputStruct[0] = a3;
  inputStruct[1] = a4;
  inputStruct[2] = 0;
  v8 = 3;
  v6 = IOGPUCommandQueueSetPriorityAndBackground((uint64_t)self->_commandQueue, inputStruct, &v8);
  if (!v6)
  {
    self->_priority = v8;
    self->_backgroundPriority = a4;
  }
  return v6 == 0;
}

- (void)dealloc
{
  NSCountedSet **resourceGroups;
  objc_super v4;

  resourceGroups = self->_resourceGroups;

  IOGPUCommandQueueRelease(self->_commandQueue);
  v4.receiver = self;
  v4.super_class = (Class)IOGPUMetalCommandQueue;
  -[_MTLCommandQueue dealloc](&v4, sel_dealloc);
}

- (BOOL)setBackgroundGPUPriority:(unint64_t)a3
{
  if (a3 >= 6)
    MTLReportFailure();
  return -[IOGPUMetalCommandQueue _setGPUPriority:backgroundPriority:](self, "_setGPUPriority:backgroundPriority:", self->_priority, a3);
}

- (void)setLabel:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)IOGPUMetalCommandQueue;
  -[_MTLCommandQueue setLabel:](&v9, sel_setLabel_);
  if (*(_DWORD *)__globalGPUCommPage)
  {
    v5 = -[MTLDevice deviceRef](self->_device, "deviceRef");
    v6 = *(uint64_t *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x24BDDD890]);
    v7 = (int)*MEMORY[0x24BDDD898];
    v8 = *(uint64_t *)((char *)&self->super.super.super.isa + v7);
    objc_msgSend(a3, "cStringUsingEncoding:", 1);
    *(Class *)((char *)&self->super.super.super.isa + v7) = (Class)IOGPUDeviceTraceObjectLabel(v5, 8, 0, v6, v8);
  }
}

- (unint64_t)getGPUPriority
{
  return self->_priority;
}

- (unint64_t)getBackgroundGPUPriority
{
  return self->_backgroundPriority;
}

uint64_t __52__IOGPUMetalCommandQueue_initWithDevice_descriptor___block_invoke(uint64_t a1, void *a2, void *a3)
{
  int v4;

  v4 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("Count")), "intValue");
  return (int)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("Count")), "intValue") - (uint64_t)v4;
}

- (BOOL)setGPUPriority:(unint64_t)a3 offset:(unsigned __int16)a4
{
  validateGPUPriority(a3, 0);
  return -[IOGPUMetalCommandQueue _setGPUPriority:backgroundPriority:](self, "_setGPUPriority:backgroundPriority:", a3, self->_backgroundPriority);
}

- (BOOL)setBackgroundGPUPriority:(unint64_t)a3 offset:(unsigned __int16)a4
{
  if (a3 >= 6)
    MTLReportFailure();
  return -[IOGPUMetalCommandQueue _setGPUPriority:backgroundPriority:](self, "_setGPUPriority:backgroundPriority:", self->_priority, a3);
}

void __54__IOGPUMetalCommandQueue__submitCommandBuffers_count___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  _Block_release(*(const void **)(a1 + 32));
  _Block_release(*(const void **)(a1 + 40));
}

- (void)dispatchAvailableCompletionNotifications
{
  IOGPUCommandQueueDispatchAvailableCompletionNotifications((uint64_t)self->_commandQueue);
  -[IOGPUMetalDevice cancelPeriodicUpdateResourcePoolPurgeability]((uint64_t)self->_device);
  -[IOGPUMetalDevice updateResourcePoolPurgeability]((uint64_t)self->_device);
}

- (void)addResidencySet:(id)a3
{
  id v3;

  v3 = a3;
  _addResidencySets((os_unfair_lock_s *)self, &v3, 1, 0);
}

- (void)addResidencySets:(id *)a3 count:(unint64_t)a4
{
  _addResidencySets((os_unfair_lock_s *)self, a3, a4, 0);
}

- (void)addInternalResidencySet:(id)a3
{
  id v3;

  v3 = a3;
  _addResidencySets((os_unfair_lock_s *)self, &v3, 1, 1);
}

- (void)addInternalResidencySets:(id *)a3 count:(unint64_t)a4
{
  _addResidencySets((os_unfair_lock_s *)self, a3, a4, 1);
}

- (void)removeResidencySet:(id)a3
{
  id v3;

  v3 = a3;
  _removeResidencySets((os_unfair_lock_s *)self, &v3, 1, 0);
}

- (void)removeResidencySets:(id *)a3 count:(unint64_t)a4
{
  _removeResidencySets((os_unfair_lock_s *)self, a3, a4, 0);
}

- (void)removeInternalResidencySet:(id)a3
{
  id v3;

  v3 = a3;
  _removeResidencySets((os_unfair_lock_s *)self, &v3, 1, 1);
}

- (void)removeInternalResidencySets:(id *)a3 count:(unint64_t)a4
{
  _removeResidencySets((os_unfair_lock_s *)self, a3, a4, 1);
}

- (void)initWithDevice:(uint64_t)a1 descriptor:.cold.1(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 138412290;
  v2 = a1;
  _os_log_fault_impl(&dword_211652000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "Command queue creation failed.  Worst processes %@", (uint8_t *)&v1, 0xCu);
}

- (void)initWithDevice:descriptor:.cold.2()
{
  __assert_rtn("-[IOGPUMetalCommandQueue initWithDevice:descriptor:]", "IOGPUMetalCommandQueue.m", 98, "_completionQueueDispatch");
}

- (void)setCompletionQueue:.cold.1()
{
  __assert_rtn("-[IOGPUMetalCommandQueue setCompletionQueue:]", "IOGPUMetalCommandQueue.m", 142, "queue");
}

- (void)_submitCommandBuffers:count:.cold.1()
{
  __assert_rtn("-[IOGPUMetalCommandQueue _submitCommandBuffers:count:]", "IOGPUMetalCommandQueue.m", 266, "count <= UINT_MAX");
}

@end
