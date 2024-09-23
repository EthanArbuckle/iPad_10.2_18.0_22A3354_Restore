@implementation IOGPUMetalDevice

- (void)periodicUpdateResourcePoolPurgeability
{
  unint64_t v2;
  int v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 784));
    *(_BYTE *)(a1 + 789) = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 784));
    if (*(_DWORD *)(a1 + 648))
    {
      v2 = 0;
      v3 = 0;
      do
        v3 |= objc_msgSend(*(id *)(*(_QWORD *)(a1 + 640) + 8 * v2++), "updateResourcePurgeability");
      while (v2 < *(unsigned int *)(a1 + 648));
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 784));
      if ((v3 & 1) != 0)
        goto LABEL_10;
    }
    else
    {
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 784));
    }
    if (!*(_BYTE *)(a1 + 789))
    {
      dispatch_suspend(*(dispatch_object_t *)(a1 + 776));
      *(_BYTE *)(a1 + 788) = 0;
    }
LABEL_10:
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 784));
  }
}

- (id)allocBufferSubDataWithLength:(unint64_t)a3 options:(unint64_t)a4 alignment:(unint64_t)a5 heapIndex:(signed __int16 *)a6 bufferIndex:(signed __int16 *)a7 bufferOffset:(unint64_t *)a8
{
  return -[IOGPUMetalDevice allocBufferSubDataWithLength:options:alignment:heapIndex:bufferIndex:bufferOffset:parentAddress:parentLength:](self, "allocBufferSubDataWithLength:options:alignment:heapIndex:bufferIndex:bufferOffset:parentAddress:parentLength:", a3, a4, a5, a6, a7, a8, 0, 0);
}

- (id)allocBufferSubDataWithLength:(unint64_t)a3 options:(unint64_t)a4 alignment:(unint64_t)a5 heapIndex:(signed __int16 *)a6 bufferIndex:(signed __int16 *)a7 bufferOffset:(unint64_t *)a8 parentAddress:(unint64_t)a9 parentLength:(unint64_t)a10
{
  BOOL v14;
  IOGPUMetalSuballocator *buffer_suballocator;
  id v16;
  void *v17;
  uint64_t v18;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;

  v22 = 0;
  v23 = a4;
  v20 = a3;
  v21 = 0;
  if (a9)
    v14 = a10 == 0;
  else
    v14 = 1;
  if (!v14)
    v21 = *a8;
  buffer_suballocator = self->_buffer_suballocator;
  if (!buffer_suballocator)
    return 0;
  v16 = IOGPUMetalSuballocatorAllocate((uint64_t)buffer_suballocator, (uint64_t *)&v20, a5, &v23, a9, a10);
  v17 = v16;
  if (v16)
  {
    *a6 = WORD1(v22);
    *a7 = v22;
    *a8 = v21;
    if ((v23 & 0x90000) == 0)
    {
      v18 = objc_msgSend(v16, "virtualAddress", v20);
      bzero((void *)(v18 + v21), a3);
    }
  }
  return v17;
}

- (unint64_t)registryID
{
  return self->_registryID;
}

- (unint64_t)currentAllocatedSize
{
  uint64_t output;

  output = 0;
  if (IOGPUDeviceGetAllocatedSize((uint64_t)self->_deviceRef, &output))
    return 0;
  else
    return output;
}

- (__IOGPUDevice)deviceRef
{
  return self->_deviceRef;
}

- (void)deallocBufferSubData:(id)a3 heapIndex:(signed __int16)a4 bufferIndex:(signed __int16)a5 bufferOffset:(unint64_t)a6 length:(unint64_t)a7
{
  IOGPUMetalSuballocator *buffer_suballocator;
  _QWORD v8[2];
  signed __int16 v9;
  signed __int16 v10;
  int v11;

  v8[1] = a6;
  v11 = 0;
  v10 = a4;
  v9 = a5;
  v8[0] = a7;
  buffer_suballocator = self->_buffer_suballocator;
  if (!buffer_suballocator)
    -[IOGPUMetalDevice deallocBufferSubData:heapIndex:bufferIndex:bufferOffset:length:].cold.1();
  IOGPUMetalSuballocatorFree((uint64_t)buffer_suballocator, (uint64_t)v8);
}

- (void)kickCleanupQueue
{
  NSObject *v2;
  dispatch_time_t v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 784));
    *(_BYTE *)(a1 + 789) = 1;
    if (!*(_BYTE *)(a1 + 788))
    {
      *(_BYTE *)(a1 + 788) = 1;
      v2 = *(NSObject **)(a1 + 776);
      v3 = dispatch_time(0, 1000000000);
      dispatch_source_set_timer(v2, v3, 0x3B9ACA00uLL, 0x5F5E100uLL);
      dispatch_resume(*(dispatch_object_t *)(a1 + 776));
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 784));
  }
}

void __52__IOGPUMetalDevice_initWithAcceleratorPort_options___block_invoke(uint64_t a1)
{
  -[IOGPUMetalDevice periodicUpdateResourcePoolPurgeability](*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
}

- (id)newFence
{
  return -[IOGPUMetalFence initWithDevice:]([IOGPUMetalFence alloc], "initWithDevice:", self);
}

- (void)_purgeDevice
{
  unint64_t v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)IOGPUMetalDevice;
  -[_MTLDevice _purgeDevice](&v4, sel__purgeDevice);
  IOGPUMetalCommandBufferStoragePoolPurge((uint64_t)self->_commandBufferStoragePool);
  -[IOGPUMetalDeviceShmemPool purge](self->_storageCreateParams.kernelCommandShmemPool, "purge");
  -[IOGPUMetalDeviceShmemPool purge](self->_storageCreateParams.segmentListShmemPool, "purge");
  -[IOGPUMetalDeviceShmemPool purge](self->_storageCreateParams.sidebandPool, "purge");
  -[IOGPUMetalDeviceShmemPool purge](self->_storageCreateParams.debugBufferShmemPool, "purge");
  -[MTLResourceListPool purge](self->_storageCreateParams.akResourceListPool, "purge");
  -[MTLResourceListPool purge](self->_storageCreateParams.akPrivateResourceListPool, "purge");
  if (self->_storageCreateParams.var0)
  {
    v3 = 0;
    do
      -[hwResourcePoolCount purge](self->_storageCreateParams.hwResourcePools[v3++], "purge");
    while (v3 < self->_storageCreateParams.var0);
  }
  -[IOGPUMetalDeviceShmemPool purge](self->_ioKernelCommandListShmemPool, "purge");
  -[IOGPUMetalDevice kickCleanupQueue]((uint64_t)self);
}

- (IOGPUMetalDevice)initWithAcceleratorPort:(unsigned int)a3 options:(unint64_t)a4
{
  char *v7;
  uint64_t v8;
  IOGPUMetalDeviceShmemPool *v9;
  IOGPUMetalDeviceShmemPool *v10;
  IOGPUMetalDeviceShmemPool *v11;
  IOGPUMetalDeviceShmemPool *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  _QWORD handler[5];
  _QWORD v18[6];
  objc_super v19;

  +[IOGPUMemoryInfo initialize](IOGPUMemoryInfo, "initialize");
  v19.receiver = self;
  v19.super_class = (Class)IOGPUMetalDevice;
  v7 = -[_MTLDevice init](&v19, sel_init);
  if (v7)
  {
    v7[744] = MTLGetEnvDefault() != 0;
    *((_DWORD *)v7 + 196) = 0;
    if ((objc_msgSend(v7, "conformsToProtocol:", &unk_254AE5998) & 1) == 0)
      -[IOGPUMetalDevice initWithAcceleratorPort:options:].cold.6();
    if (a4 >= 0x10000)
      -[IOGPUMetalDevice initWithAcceleratorPort:options:].cold.1();
    v8 = IOGPUDeviceCreateWithAPIProperty(a3, "Metal", a4);
    *((_QWORD *)v7 + 75) = v8;
    if (!v8)
      goto LABEL_15;
    IORegistryEntryGetRegistryEntryID(a3, (uint64_t *)v7 + 99);
    *((_DWORD *)v7 + 152) = a3;
    IOObjectRetain(a3);
    *((_QWORD *)v7 + 80) = 0;
    *((_DWORD *)v7 + 162) = 0;
    *((_QWORD *)v7 + 82) = objc_msgSend(objc_alloc(MEMORY[0x24BDDD6D8]), "initWithResourceListCapacity:", 1024);
    *((_QWORD *)v7 + 83) = objc_msgSend(objc_alloc(MEMORY[0x24BDDD6D8]), "initWithResourceListCapacity:", 256);
    IOGPUDeviceGetConfig64(*((_QWORD *)v7 + 75), (_DWORD *)v7 + 172, (_DWORD *)v7 + 173, (_QWORD *)v7 + 87, (_QWORD *)v7 + 88, (_DWORD *)v7 + 180);
    IOGPUDeviceGetSharedMemorySize(*((_QWORD **)v7 + 75), (_QWORD *)v7 + 89);
    *((_QWORD *)v7 + 88) = 0;
    *((_QWORD *)v7 + 87) = 0;
    v9 = -[IOGPUMetalDeviceShmemPool initWithDevice:resourceClass:shmemSize:shmemType:options:]([IOGPUMetalDeviceShmemPool alloc], "initWithDevice:resourceClass:shmemSize:shmemType:options:", v7, objc_opt_class(), objc_msgSend(v7, "initialKernelCommandShmemSize"), 1, 0);
    *((_QWORD *)v7 + 78) = v9;
    if (!v9)
      -[IOGPUMetalDevice initWithAcceleratorPort:options:].cold.2();
    v10 = -[IOGPUMetalDeviceShmemPool initWithDevice:resourceClass:shmemSize:shmemType:options:]([IOGPUMetalDeviceShmemPool alloc], "initWithDevice:resourceClass:shmemSize:shmemType:options:", v7, objc_opt_class(), objc_msgSend(v7, "initialSegmentListShmemSize"), 0, 0);
    *((_QWORD *)v7 + 77) = v10;
    if (!v10)
      -[IOGPUMetalDevice initWithAcceleratorPort:options:].cold.3();
    v11 = -[IOGPUMetalDeviceShmemPool initWithDevice:resourceClass:shmemSize:shmemType:options:]([IOGPUMetalDeviceShmemPool alloc], "initWithDevice:resourceClass:shmemSize:shmemType:options:", v7, objc_opt_class(), objc_msgSend(v7, "initialSidebandShmemSize"), 3, 0);
    *((_QWORD *)v7 + 79) = v11;
    if (!v11)
      -[IOGPUMetalDevice initWithAcceleratorPort:options:].cold.4();
    v12 = -[IOGPUMetalDeviceShmemPool initWithDevice:resourceClass:shmemSize:shmemType:options:]([IOGPUMetalDeviceShmemPool alloc], "initWithDevice:resourceClass:shmemSize:shmemType:options:", v7, objc_opt_class(), objc_msgSend(v7, "initialDebugBufferShmemSize"), 2, 0);
    *((_QWORD *)v7 + 84) = v12;
    if (!v12)
      -[IOGPUMetalDevice initWithAcceleratorPort:options:].cold.5();
    if (!v7[744])
      *((_QWORD *)v7 + 92) = -[IOGPUMetalDeviceShmemPool initWithDevice:resourceClass:shmemSize:shmemType:options:]([IOGPUMetalDeviceShmemPool alloc], "initWithDevice:resourceClass:shmemSize:shmemType:options:", v7, objc_opt_class(), objc_msgSend(v7, "initialIOKernelCommandListShmemSize"), 1, 0);
    *((_QWORD *)v7 + 91) = 0;
    *((_QWORD *)v7 + 95) = dispatch_queue_create("com.Metal.DeviceDispatchQueue", 0);
    IOGPUMetalSuballocatorCreate((IOGPUMetalDevice *)v7);
    *((_QWORD *)v7 + 94) = v13;
    IOGPUMetalCommandBufferStoragePoolCreate((uint64_t)v7);
    *((_QWORD *)v7 + 85) = v14;
    if (v14)
    {
      *(_QWORD *)&v7[*MEMORY[0x24BDDD8B0]] = IOGPUDeviceGetGlobalTraceObjectID(*((_QWORD *)v7 + 75));
      if (*(_DWORD *)__globalGPUCommPage)
      {
        IOGPUDeviceGetGlobalTraceObjectID(*((_QWORD *)v7 + 75));
        IOGPUDeviceTraceEvent();
      }
      *((_QWORD *)v7 + 96) = dispatch_queue_create("com.Metal.DeviceCleaupQueue", 0);
      *((_QWORD *)v7 + 97) = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, *((dispatch_queue_t *)v7 + 95));
      v7[788] = 0;
      v18[0] = 0;
      v18[1] = v18;
      v18[2] = 0x3052000000;
      v18[3] = __Block_byref_object_copy__0;
      v18[4] = __Block_byref_object_dispose__0;
      v18[5] = v7;
      v15 = *((_QWORD *)v7 + 97);
      handler[0] = MEMORY[0x24BDAC760];
      handler[1] = 3221225472;
      handler[2] = __52__IOGPUMetalDevice_initWithAcceleratorPort_options___block_invoke;
      handler[3] = &unk_24CC3F808;
      handler[4] = v18;
      dispatch_source_set_event_handler(v15, handler);
      _Block_object_dispose(v18, 8);
    }
    else
    {
LABEL_15:

      return 0;
    }
  }
  return (IOGPUMetalDevice *)v7;
}

- (unsigned)initialSidebandShmemSize
{
  return 0x4000;
}

- (unsigned)initialSegmentListShmemSize
{
  return 0x4000;
}

- (unsigned)initialKernelCommandShmemSize
{
  return 0x4000;
}

- (unsigned)initialIOKernelCommandListShmemSize
{
  return *MEMORY[0x24BDB03A8];
}

- (unsigned)initialDebugBufferShmemSize
{
  return *MEMORY[0x24BDB03C8];
}

- (unint64_t)maxBufferLength
{
  unint64_t v3;

  v3 = 0;
  IOGPUDeviceGetMaxResourceSize(&self->_deviceRef->var0.var0, &v3);
  return v3;
}

- (void)setHwResourcePool:(id *)a3 count:(int)a4
{
  $C9484C12C147121266AAD0ED7A1BB31F *p_storageCreateParams;
  uint64_t v7;

  p_storageCreateParams = &self->_storageCreateParams;
  if (self->_storageCreateParams.hwResourcePools)
    -[IOGPUMetalDevice setHwResourcePool:count:].cold.2();
  if (self->_storageCreateParams.var0)
    -[IOGPUMetalDevice setHwResourcePool:count:].cold.1();
  self->_storageCreateParams.hwResourcePools = (hwResourcePoolCount **)malloc_type_malloc(8 * a4, 0x80040B8603338uLL);
  if (a4 >= 1)
  {
    v7 = 0;
    do
    {
      p_storageCreateParams->hwResourcePools[v7] = (hwResourcePoolCount *)a3[v7];
      ++v7;
    }
    while (a4 != v7);
  }
  p_storageCreateParams->var0 = a4;
}

- (BOOL)hasUnifiedMemory
{
  return 1;
}

- (unint64_t)sharedMemorySize
{
  return self->_sharedMemorySize;
}

- (unint64_t)dedicatedMemorySize
{
  return self->_videoRam;
}

- (void)deallocBufferSubData:heapIndex:bufferIndex:bufferOffset:length:.cold.1()
{
  __assert_rtn("-[IOGPUMetalDevice deallocBufferSubData:heapIndex:bufferIndex:bufferOffset:length:]", "IOGPUMetalDevice.m", 1129, "_buffer_suballocator");
}

+ (void)registerService:(unsigned int)a3
{
  uint64_t v3;
  CFTypeRef CFProperty;
  const void *v5;
  CFTypeID v6;
  uint64_t v7;
  void *v8;
  CFTypeRef v9;
  const void *v10;
  CFTypeID v11;
  objc_class *v12;
  void *v13;

  v3 = *(_QWORD *)&a3;
  CFProperty = IORegistryEntryCreateCFProperty(a3, CFSTR("MetalPluginName"), 0, 0);
  if (CFProperty)
  {
    v5 = CFProperty;
    v6 = CFGetTypeID(CFProperty);
    if (v6 != CFStringGetTypeID()
      || (v7 = objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", objc_msgSend((id)objc_msgSend(CFSTR("/System/Library/Extensions"), "stringByAppendingPathComponent:", v5), "stringByAppendingString:", CFSTR(".bundle")))) == 0)
    {
LABEL_15:
      CFRelease(v5);
      return;
    }
    v8 = (void *)v7;
    v9 = IORegistryEntryCreateCFProperty(v3, CFSTR("MetalPluginClassName"), 0, 0);
    if (v9)
    {
      v10 = v9;
      v11 = CFGetTypeID(v9);
      if (v11 == CFStringGetTypeID())
      {
        v12 = (objc_class *)objc_msgSend(v8, "classNamed:", v10);
        CFRelease(v10);
        if (v12)
          goto LABEL_11;
      }
      else
      {
        CFRelease(v10);
      }
    }
    v12 = (objc_class *)objc_msgSend(v8, "principalClass");
LABEL_11:
    if (-[objc_class isSubclassOfClass:](v12, "isSubclassOfClass:", objc_opt_class()))
    {
      v13 = (void *)objc_msgSend([v12 alloc], "initWithAcceleratorPort:", v3);
      if (v13)
        MTLAddDevice();

    }
    goto LABEL_15;
  }
}

- (void)dealloc
{
  NSObject *device_pool_cleanup_queue;
  IOGPUMetalCommandBufferStoragePool *commandBufferStoragePool;
  IOGPUMetalSuballocator *buffer_suballocator;
  NSObject *device_dispatch_queue;
  __IOGPUDevice *deviceRef;
  unint64_t v8;
  objc_super v9;
  _QWORD block[5];

  device_pool_cleanup_queue = self->_device_pool_cleanup_queue;
  if (device_pool_cleanup_queue)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __27__IOGPUMetalDevice_dealloc__block_invoke;
    block[3] = &unk_24CC3F880;
    block[4] = self;
    dispatch_sync(device_pool_cleanup_queue, block);
    dispatch_release((dispatch_object_t)self->_device_pool_cleanup_queue);
  }
  commandBufferStoragePool = self->_commandBufferStoragePool;
  if (commandBufferStoragePool)
    IOGPUMetalCommandBufferStoragePoolDealloc(commandBufferStoragePool);
  buffer_suballocator = self->_buffer_suballocator;
  if (buffer_suballocator)
    IOGPUMetalSuballocatorDestroy(buffer_suballocator);
  device_dispatch_queue = self->_device_dispatch_queue;
  if (device_dispatch_queue)
    dispatch_release(device_dispatch_queue);
  deviceRef = self->_deviceRef;
  if (deviceRef)
    CFRelease(deviceRef);

  self->_ioKernelCommandListShmemPool = 0;
  self->_storageCreateParams.kernelCommandShmemPool = 0;

  self->_storageCreateParams.segmentListShmemPool = 0;
  self->_storageCreateParams.sidebandPool = 0;

  self->_storageCreateParams.debugBufferShmemPool = 0;
  if (self->_storageCreateParams.var0)
  {
    v8 = 0;
    do
    {

      self->_storageCreateParams.hwResourcePools[v8++] = 0;
    }
    while (v8 < self->_storageCreateParams.var0);
  }
  self->_storageCreateParams.var0 = 0;
  free(self->_storageCreateParams.hwResourcePools);
  self->_storageCreateParams.hwResourcePools = 0;

  IOObjectRelease(self->_acceleratorPort);
  v9.receiver = self;
  v9.super_class = (Class)IOGPUMetalDevice;
  -[_MTLDevice dealloc](&v9, sel_dealloc);
}

void __27__IOGPUMetalDevice_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 776);
  if (*(_BYTE *)(v2 + 788))
    dispatch_source_cancel(v3);
  else
    dispatch_resume(v3);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 788) = 0;
  dispatch_activate(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 776));
  dispatch_release(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 776));
}

- (void)setSegmentListShmemSize:(unsigned int)a3
{
  IOGPUMetalDeviceShmemPool *v4;

  if (self->_storageCreateParams.segmentListShmemPool->_priv.shmemSize < a3)
  {
    v4 = -[IOGPUMetalDeviceShmemPool initWithDevice:resourceClass:shmemSize:shmemType:options:]([IOGPUMetalDeviceShmemPool alloc], "initWithDevice:resourceClass:shmemSize:shmemType:options:", self, objc_opt_class(), *(_QWORD *)&a3, 0, 0);

    self->_storageCreateParams.segmentListShmemPool = v4;
  }
}

- (void)setComputePipelineStateCommandShmemSize:(unsigned int)a3
{
  $C9484C12C147121266AAD0ED7A1BB31F *p_storageCreateParams;
  IOGPUMetalDeviceShmemPool *v4;

  p_storageCreateParams = &self->_storageCreateParams;
  if (self->_storageCreateParams.kernelCommandShmemPool->_priv.shmemSize < a3)
  {
    v4 = -[IOGPUMetalDeviceShmemPool initWithDevice:resourceClass:shmemSize:shmemType:options:]([IOGPUMetalDeviceShmemPool alloc], "initWithDevice:resourceClass:shmemSize:shmemType:options:", self, objc_opt_class(), *(_QWORD *)&a3, 1, 0);

    p_storageCreateParams->kernelCommandShmemPool = v4;
  }
}

- (IOGPUMetalDevice)initWithAcceleratorPort:(unsigned int)a3
{
  return -[IOGPUMetalDevice initWithAcceleratorPort:options:](self, "initWithAcceleratorPort:options:", *(_QWORD *)&a3, 0);
}

- (unsigned)cmdBufArgsSize
{
  return 40;
}

- (id)akResourceListPool
{
  return self->_storageCreateParams.akResourceListPool;
}

- (id)akPrivateResourceListPool
{
  return self->_storageCreateParams.akPrivateResourceListPool;
}

- (id)hwResourcePools
{
  return (id *)self->_storageCreateParams.hwResourcePools;
}

- (unsigned)hwResourcePoolCount
{
  return self->_storageCreateParams.var0;
}

- (unint64_t)recommendedMaxWorkingSetSize
{
  unint64_t videoRam;

  videoRam = self->_videoRam;
  if (!videoRam)
    return self->_sharedMemorySize;
  return videoRam;
}

- (BOOL)supportsVertexAmplification
{
  return 0;
}

- (BOOL)supportsVertexAmplificationCount:(unint64_t)a3
{
  BOOL result;

  if (a3 == 1)
    return 1;
  result = -[IOGPUMetalDevice supportsVertexAmplification](self, "supportsVertexAmplification");
  if (a3 != 2)
    return 0;
  return result;
}

- (id)newCommandQueueWithDescriptor:(id)a3
{
  return -[_MTLDevice newCommandQueueWithMaxCommandBufferCount:](self, "newCommandQueueWithMaxCommandBufferCount:", objc_msgSend(a3, "maxCommandBufferCount"));
}

- (id)newIndirectArgumentBufferLayoutWithStructType:(id)a3
{
  return 0;
}

- (id)newIndirectArgumentEncoderWithLayout:(id)a3
{
  abort();
}

- (id)newIndirectCommandBufferWithDescriptor:(id)a3 maxCommandCount:(unint64_t)a4 options:(unint64_t)a5
{
  void *v7;
  IOGPUMetalIndirectCommandBuffer *v8;

  v7 = (void *)-[IOGPUMetalDevice newIndirectCommandBufferWithDescriptor:maxCount:options:](self, "newIndirectCommandBufferWithDescriptor:maxCount:options:", a3, a4, a5);
  v8 = -[IOGPUMetalIndirectCommandBuffer initWithBuffer:descriptor:maxCommandCount:]([IOGPUMetalIndirectCommandBuffer alloc], "initWithBuffer:descriptor:maxCommandCount:", v7, a3, a4);

  return v8;
}

- (id)indirectArgumentBufferDecodingData
{
  return 0;
}

- (BOOL)supportPriorityBand
{
  return (LOBYTE(self->_configBits) >> 6) & 1;
}

- (id)newEvent
{
  objc_super v3;

  if ((self->_configBits & 0x4000) != 0)
    return -[_IOGPUMetalMTLEvent initWithDevice:]([_IOGPUMetalMTLEvent alloc], "initWithDevice:", self);
  v3.receiver = self;
  v3.super_class = (Class)IOGPUMetalDevice;
  return -[_MTLDevice newEvent](&v3, sel_newEvent);
}

- (id)newEventWithOptions:(int64_t)a3
{
  return -[_IOGPUMetalMTLEvent initWithDevice:options:]([_IOGPUMetalMTLEvent alloc], "initWithDevice:options:", self, a3);
}

- (id)newLateEvalEvent
{
  return -[_IOGPUMetalMTLLateEvalEvent initWithDevice:]([_IOGPUMetalMTLLateEvalEvent alloc], "initWithDevice:", self);
}

- (uint64_t)updateResourcePoolPurgeability
{
  unint64_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  if (a1 && *(_DWORD *)(a1 + 648))
  {
    v1 = 0;
    v2 = 0;
    v3 = a1 + 24;
    v4 = a1 + 32;
    do
      v2 |= objc_msgSend(*(id *)(*(_QWORD *)(v3 + 616) + 8 * v1++), "updateResourcePurgeability");
    while (v1 < *(unsigned int *)(v4 + 616));
  }
  else
  {
    LOBYTE(v2) = 0;
  }
  return v2 & 1;
}

- (void)cancelPeriodicUpdateResourcePoolPurgeability
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 784));
    if (!*(_BYTE *)(a1 + 789))
    {
      dispatch_suspend(*(dispatch_object_t *)(a1 + 776));
      *(_BYTE *)(a1 + 788) = 0;
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 784));
  }
}

- (void)_setDeviceWrapper:(id)a3
{
  objc_storeWeak((id *)&self->_deviceWrapper, a3);
}

- (id)_deviceWrapper
{
  MTLDeviceSPI **p_deviceWrapper;

  p_deviceWrapper = &self->_deviceWrapper;
  if (objc_loadWeak((id *)&self->_deviceWrapper))
    return (id)objc_msgSend(objc_loadWeak((id *)p_deviceWrapper), "_deviceWrapper");
  else
    return self;
}

- (IOGPUMemoryInfo)memoryInfo
{
  return (IOGPUMemoryInfo *)_ioGPUMemoryInfo;
}

+ (void)registerDevices
{
  abort();
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3
{
  uint64_t v6;
  void *v7;
  IOGPUMetalAccelerationStructure *v8;

  if (-[_MTLDevice requiresRaytracingEmulation](self, "requiresRaytracingEmulation"))
  {
    v6 = -[IOGPUMetalDevice newBufferWithLength:options:](self, "newBufferWithLength:options:", a3, 32);
    if (v6)
    {
      v7 = (void *)v6;
      v8 = -[IOGPUMetalAccelerationStructure initWithBuffer:offset:]([IOGPUMetalAccelerationStructure alloc], "initWithBuffer:offset:", v6, 0);

      return v8;
    }
  }
  else
  {
    -[IOGPUMetalDevice doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  }
  return 0;
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3 resourceIndex:(unint64_t)a4
{
  uint64_t v8;
  void *v9;
  IOGPUMetalAccelerationStructure *v10;

  if (-[_MTLDevice requiresRaytracingEmulation](self, "requiresRaytracingEmulation"))
  {
    v8 = -[IOGPUMetalDevice newBufferWithLength:options:](self, "newBufferWithLength:options:", a3, 32);
    if (v8)
    {
      v9 = (void *)v8;
      v10 = -[IOGPUMetalAccelerationStructure initWithBuffer:offset:resourceIndex:]([IOGPUMetalAccelerationStructure alloc], "initWithBuffer:offset:resourceIndex:", v8, 0, a4);

      return v10;
    }
  }
  else
  {
    -[IOGPUMetalDevice doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  }
  return 0;
}

- (id)newAccelerationStructureWithBuffer:(id)a3 offset:(unint64_t)a4
{
  if (-[_MTLDevice requiresRaytracingEmulation](self, "requiresRaytracingEmulation"))
  {
    if (!a3)
      -[IOGPUMetalDevice newAccelerationStructureWithBuffer:offset:].cold.1();
    return -[IOGPUMetalAccelerationStructure initWithBuffer:offset:]([IOGPUMetalAccelerationStructure alloc], "initWithBuffer:offset:", a3, a4);
  }
  else
  {
    -[IOGPUMetalDevice doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
    return 0;
  }
}

- (id)newAccelerationStructureWithBuffer:(id)a3 offset:(unint64_t)a4 resourceIndex:(unint64_t)a5
{
  if (-[_MTLDevice requiresRaytracingEmulation](self, "requiresRaytracingEmulation"))
  {
    if (!a3)
      -[IOGPUMetalDevice newAccelerationStructureWithBuffer:offset:resourceIndex:].cold.1();
    return -[IOGPUMetalAccelerationStructure initWithBuffer:offset:resourceIndex:]([IOGPUMetalAccelerationStructure alloc], "initWithBuffer:offset:resourceIndex:", a3, a4, a5);
  }
  else
  {
    -[IOGPUMetalDevice doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
    return 0;
  }
}

- (id)newIntersectionFunctionTableWithDescriptor:(id)a3
{
  id v6;
  void *v7;
  IOGPUMetalIntersectionFunctionTable *v8;

  if (-[_MTLDevice requiresRaytracingEmulation](self, "requiresRaytracingEmulation"))
  {
    v6 = objc_alloc_init(MEMORY[0x24BDDD778]);
    objc_msgSend(v6, "setFunctionCount:", objc_msgSend(a3, "functionCount"));
    objc_msgSend(v6, "setResourceIndex:", objc_msgSend(a3, "resourceIndex"));
    objc_msgSend(v6, "setForceResourceIndex:", objc_msgSend(a3, "forceResourceIndex"));
    v7 = (void *)-[IOGPUMetalDevice newVisibleFunctionTableWithDescriptor:](self, "newVisibleFunctionTableWithDescriptor:", v6);

    v8 = -[IOGPUMetalIntersectionFunctionTable initWithVisibleFunctionTable:]([IOGPUMetalIntersectionFunctionTable alloc], "initWithVisibleFunctionTable:", v7);
    return v8;
  }
  else
  {
    -[IOGPUMetalDevice doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
    return 0;
  }
}

- (id)newIOCommandQueueWithDescriptor:(id)a3 error:(id *)a4
{
  objc_super v5;

  if (!self->_disableGPUIO)
    return -[IOGPUMetalIOCommandQueue initWithDevice:descriptor:]([IOGPUMetalIOCommandQueue alloc], "initWithDevice:descriptor:", self, a3);
  v5.receiver = self;
  v5.super_class = (Class)IOGPUMetalDevice;
  return -[_MTLDevice newIOCommandQueueWithDescriptor:error:](&v5, sel_newIOCommandQueueWithDescriptor_error_, a3, a4);
}

- (id)newIOHandleWithURL:(id)a3 compressionType:(int64_t)a4 error:(id *)a5
{
  id result;
  uint64_t v10;
  id v11;
  void *v12;
  objc_super v13;

  if (self->_disableGPUIO)
  {
    v13.receiver = self;
    v13.super_class = (Class)IOGPUMetalDevice;
    return -[_MTLDevice newIOFileHandleWithURL:compressionMethod:error:](&v13, sel_newIOFileHandleWithURL_compressionMethod_error_, a3, a4, a5);
  }
  if (objc_msgSend(a3, "isFileURL"))
  {
    if (objc_msgSend(a3, "checkResourceIsReachableAndReturnError:", a5))
      return -[IOGPUMetalIOHandleCompressed initWithDevice:path:compressionType:error:uncached:]([IOGPUMetalIOHandleCompressed alloc], "initWithDevice:path:compressionType:error:uncached:", self, objc_msgSend(a3, "fileSystemRepresentation"), a4, a5, 0);
  }
  else if (a5)
  {
    v10 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", CFSTR("URL is not a file"), *MEMORY[0x24BDD0FC8]);
    v11 = objc_alloc(MEMORY[0x24BDD1540]);
    v12 = (void *)objc_msgSend(v11, "initWithDomain:code:userInfo:", *MEMORY[0x24BDDD280], 1, v10);
    result = 0;
    *a5 = v12;
    return result;
  }
  return 0;
}

- (id)newIOHandleWithURL:(id)a3 error:(id *)a4
{
  id result;
  uint64_t v8;
  id v9;
  void *v10;
  objc_super v11;

  if (self->_disableGPUIO)
  {
    v11.receiver = self;
    v11.super_class = (Class)IOGPUMetalDevice;
    return -[_MTLDevice newIOFileHandleWithURL:error:](&v11, sel_newIOFileHandleWithURL_error_, a3, a4);
  }
  if (objc_msgSend(a3, "isFileURL"))
  {
    if (objc_msgSend(a3, "checkResourceIsReachableAndReturnError:", a4))
      return -[IOGPUMetalIOHandleRaw initWithDevice:path:error:uncached:]([IOGPUMetalIOHandleRaw alloc], "initWithDevice:path:error:uncached:", self, objc_msgSend(a3, "fileSystemRepresentation"), a4, 0);
  }
  else if (a4)
  {
    v8 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", CFSTR("URL is not a file"), *MEMORY[0x24BDD0FC8]);
    v9 = objc_alloc(MEMORY[0x24BDD1540]);
    v10 = (void *)objc_msgSend(v9, "initWithDomain:code:userInfo:", *MEMORY[0x24BDDD280], 1, v8);
    result = 0;
    *a4 = v10;
    return result;
  }
  return 0;
}

- (id)newUncachedIOHandleWithURL:(id)a3 compressionType:(int64_t)a4 error:(id *)a5
{
  id result;
  uint64_t v10;
  id v11;
  void *v12;
  objc_super v13;

  if (self->_disableGPUIO)
  {
    v13.receiver = self;
    v13.super_class = (Class)IOGPUMetalDevice;
    return -[_MTLDevice newUncachedIOFileHandleWithURL:compressionMethod:error:](&v13, sel_newUncachedIOFileHandleWithURL_compressionMethod_error_, a3, a4, a5);
  }
  if (objc_msgSend(a3, "isFileURL"))
  {
    if (objc_msgSend(a3, "checkResourceIsReachableAndReturnError:", a5))
      return -[IOGPUMetalIOHandleCompressed initWithDevice:path:compressionType:error:uncached:]([IOGPUMetalIOHandleCompressed alloc], "initWithDevice:path:compressionType:error:uncached:", self, objc_msgSend(a3, "fileSystemRepresentation"), a4, a5, 1);
  }
  else if (a5)
  {
    v10 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", CFSTR("URL is not a file"), *MEMORY[0x24BDD0FC8]);
    v11 = objc_alloc(MEMORY[0x24BDD1540]);
    v12 = (void *)objc_msgSend(v11, "initWithDomain:code:userInfo:", *MEMORY[0x24BDDD280], 1, v10);
    result = 0;
    *a5 = v12;
    return result;
  }
  return 0;
}

- (id)newUncachedIOHandleWithURL:(id)a3 error:(id *)a4
{
  id result;
  uint64_t v8;
  id v9;
  void *v10;
  objc_super v11;

  if (self->_disableGPUIO)
  {
    v11.receiver = self;
    v11.super_class = (Class)IOGPUMetalDevice;
    return -[_MTLDevice newUncachedIOFileHandleWithURL:error:](&v11, sel_newUncachedIOFileHandleWithURL_error_, a3, a4);
  }
  if (objc_msgSend(a3, "isFileURL"))
  {
    if (objc_msgSend(a3, "checkResourceIsReachableAndReturnError:", a4))
      return -[IOGPUMetalIOHandleRaw initWithDevice:path:error:uncached:]([IOGPUMetalIOHandleRaw alloc], "initWithDevice:path:error:uncached:", self, objc_msgSend(a3, "fileSystemRepresentation"), a4, 1);
  }
  else if (a4)
  {
    v8 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", CFSTR("URL is not a file"), *MEMORY[0x24BDD0FC8]);
    v9 = objc_alloc(MEMORY[0x24BDD1540]);
    v10 = (void *)objc_msgSend(v9, "initWithDomain:code:userInfo:", *MEMORY[0x24BDDD280], 1, v8);
    result = 0;
    *a4 = v10;
    return result;
  }
  return 0;
}

- (BOOL)supportsResourceDetachBacking
{
  return 1;
}

- (int)numCommandBuffers
{
  return self->_numCommandBuffers;
}

- (unsigned)acceleratorPort
{
  return self->_acceleratorPort;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_deviceWrapper);
}

- (void)initWithAcceleratorPort:options:.cold.1()
{
  __assert_rtn("-[IOGPUMetalDevice initWithAcceleratorPort:options:]", "IOGPUMetalDevice.m", 325, "(options & 0xffffULL) == options");
}

- (void)initWithAcceleratorPort:options:.cold.2()
{
  __assert_rtn("-[IOGPUMetalDevice initWithAcceleratorPort:options:]", "IOGPUMetalDevice.m", 395, "nil != _storageCreateParams.kernelCommandShmemPool");
}

- (void)initWithAcceleratorPort:options:.cold.3()
{
  __assert_rtn("-[IOGPUMetalDevice initWithAcceleratorPort:options:]", "IOGPUMetalDevice.m", 398, "nil != _storageCreateParams.segmentListShmemPool");
}

- (void)initWithAcceleratorPort:options:.cold.4()
{
  __assert_rtn("-[IOGPUMetalDevice initWithAcceleratorPort:options:]", "IOGPUMetalDevice.m", 401, "nil != _storageCreateParams.sidebandPool");
}

- (void)initWithAcceleratorPort:options:.cold.5()
{
  __assert_rtn("-[IOGPUMetalDevice initWithAcceleratorPort:options:]", "IOGPUMetalDevice.m", 404, "nil != _storageCreateParams.debugBufferShmemPool");
}

- (void)initWithAcceleratorPort:options:.cold.6()
{
  __assert_rtn("-[IOGPUMetalDevice initWithAcceleratorPort:options:]", "IOGPUMetalDevice.m", 323, "[self conformsToProtocol:@protocol(MTLDeviceSPI)]");
}

- (void)setHwResourcePool:count:.cold.1()
{
  __assert_rtn("-[IOGPUMetalDevice setHwResourcePool:count:]", "IOGPUMetalDevice.m", 488, "!_storageCreateParams.hwResourcePoolCount");
}

- (void)setHwResourcePool:count:.cold.2()
{
  __assert_rtn("-[IOGPUMetalDevice setHwResourcePool:count:]", "IOGPUMetalDevice.m", 487, "!_storageCreateParams.hwResourcePools");
}

- (void)newAccelerationStructureWithBuffer:offset:.cold.1()
{
  __assert_rtn("-[IOGPUMetalDevice newAccelerationStructureWithBuffer:offset:]", "IOGPUMetalDevice.m", 1522, "buffer");
}

- (void)newAccelerationStructureWithBuffer:offset:resourceIndex:.cold.1()
{
  __assert_rtn("-[IOGPUMetalDevice newAccelerationStructureWithBuffer:offset:resourceIndex:]", "IOGPUMetalDevice.m", 1543, "buffer");
}

@end
