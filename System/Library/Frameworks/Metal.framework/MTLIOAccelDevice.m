@implementation MTLIOAccelDevice

- (int)numCommandBuffers
{
  return atomic_load((unsigned int *)&self->_numCommandBuffers);
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *device_pool_cleanup_queue;
  uint64_t *commandBufferStoragePool;
  NSObject *device_dispatch_queue;
  __IOAccelShared *sharedRef;
  __IOAccelDevice *deviceRef;
  unint64_t v14;
  objc_super v15;
  _QWORD block[5];

  device_pool_cleanup_queue = self->_device_pool_cleanup_queue;
  if (device_pool_cleanup_queue)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __27__MTLIOAccelDevice_dealloc__block_invoke;
    block[3] = &unk_1E0FE2880;
    block[4] = self;
    dispatch_sync(device_pool_cleanup_queue, block);
    dispatch_release((dispatch_object_t)self->_device_pool_cleanup_queue);
  }
  commandBufferStoragePool = (uint64_t *)self->_commandBufferStoragePool;
  if (commandBufferStoragePool)
    MTLIOAccelCommandBufferStoragePoolDealloc(commandBufferStoragePool, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  device_dispatch_queue = self->_device_dispatch_queue;
  if (device_dispatch_queue)
    dispatch_release(device_dispatch_queue);
  sharedRef = self->_sharedRef;
  if (sharedRef)
    CFRelease(sharedRef);
  deviceRef = self->_deviceRef;
  if (deviceRef)
    CFRelease(deviceRef);

  self->_storageCreateParams.kernelCommandShmemPool = 0;
  self->_storageCreateParams.segmentListShmemPool = 0;
  if (self->_storageCreateParams.var0)
  {
    v14 = 0;
    do
    {

      self->_storageCreateParams.hwResourcePools[v14++] = 0;
    }
    while (v14 < self->_storageCreateParams.var0);
  }
  self->_storageCreateParams.var0 = 0;
  free(self->_storageCreateParams.hwResourcePools);
  self->_storageCreateParams.hwResourcePools = 0;

  IOObjectRelease(self->_acceleratorPort);
  v15.receiver = self;
  v15.super_class = (Class)MTLIOAccelDevice;
  -[_MTLDevice dealloc](&v15, sel_dealloc);
}

void __27__MTLIOAccelDevice_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 54120);
  if (*(_BYTE *)(v2 + 54128))
    dispatch_source_cancel(v3);
  else
    dispatch_resume(v3);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 54128) = 0;
  dispatch_activate(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 54120));
  dispatch_release(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 54120));
}

- (void)setSegmentListShmemSize:(unsigned int)a3
{
  MTLIOAccelDeviceShmemPool *v4;

  if (self->_storageCreateParams.segmentListShmemPool->_priv.shmemSize < a3)
  {
    v4 = -[MTLIOAccelDeviceShmemPool initWithDevice:resourceClass:shmemSize:options:]([MTLIOAccelDeviceShmemPool alloc], "initWithDevice:resourceClass:shmemSize:options:", self, objc_opt_class(), *(_QWORD *)&a3, 0);

    self->_storageCreateParams.segmentListShmemPool = v4;
  }
}

- (void)setComputePipelineStateCommandShmemSize:(unsigned int)a3
{
  $A63098BA9F8020D70792AE75CFB93BCA *p_storageCreateParams;
  MTLIOAccelDeviceShmemPool *v4;

  p_storageCreateParams = &self->_storageCreateParams;
  if (self->_storageCreateParams.kernelCommandShmemPool->_priv.shmemSize < a3)
  {
    v4 = -[MTLIOAccelDeviceShmemPool initWithDevice:resourceClass:shmemSize:options:]([MTLIOAccelDeviceShmemPool alloc], "initWithDevice:resourceClass:shmemSize:options:", self, objc_opt_class(), *(_QWORD *)&a3, 0);

    p_storageCreateParams->kernelCommandShmemPool = v4;
  }
}

- (MTLIOAccelDevice)initWithAcceleratorPort:(unsigned int)a3
{
  MTLIOAccelDevice *v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTLIOAccelDevice;
  v4 = -[_MTLDevice init](&v7, sel_init);
  if (v4)
  {
    v5 = IOAccelDeviceCreateWithAPIProperty();
    v4->_deviceRef = (__IOAccelDevice *)v5;
    if (!v5)
    {
LABEL_7:

      return 0;
    }
    IORegistryEntryGetRegistryEntryID(a3, &v4->_registryID);
    v4->_acceleratorPort = a3;
    IOObjectRetain(a3);
    v4->_storageCreateParams.hwResourcePools = 0;
    v4->_storageCreateParams.var0 = 0;
    IOAccelDeviceGetConfig64();
    IOAccelDeviceGetSharedMemorySize();
    v4->_videoRam = 0;
    v4->_textureRam = 0;
    v4->super._globalTraceObjectID = IOAccelDeviceGetGlobalTraceObjectID();
    if (*(_DWORD *)*MEMORY[0x1E0D39EE0])
      IOAccelDeviceTraceEvent();
  }
  if (!-[MTLIOAccelDevice supportLazyInitialization](v4, "supportLazyInitialization")
    && !-[MTLIOAccelDevice lazyInitialize](v4, "lazyInitialize"))
  {
    goto LABEL_7;
  }
  return v4;
}

- (BOOL)lazyInitialize
{
  __IOAccelShared *v3;
  OS_dispatch_queue *v4;
  NSObject *device_pool_cleanup_source;
  _QWORD handler[5];
  _QWORD v8[6];

  v3 = (__IOAccelShared *)IOAccelSharedCreate();
  self->_sharedRef = v3;
  if (v3)
  {
    self->_storageCreateParams.akResourceListPool = -[MTLResourceListPool initWithResourceListCapacity:]([MTLResourceListPool alloc], "initWithResourceListCapacity:", 1024);
    self->_storageCreateParams.akPrivateResourceListPool = -[MTLResourceListPool initWithResourceListCapacity:]([MTLResourceListPool alloc], "initWithResourceListCapacity:", 256);
    self->_storageCreateParams.kernelCommandShmemPool = -[MTLIOAccelDeviceShmemPool initWithDevice:resourceClass:shmemSize:options:]([MTLIOAccelDeviceShmemPool alloc], "initWithDevice:resourceClass:shmemSize:options:", self, objc_opt_class(), -[MTLIOAccelDevice initialKernelCommandShmemSize](self, "initialKernelCommandShmemSize"), 0);
    self->_storageCreateParams.segmentListShmemPool = -[MTLIOAccelDeviceShmemPool initWithDevice:resourceClass:shmemSize:options:]([MTLIOAccelDeviceShmemPool alloc], "initWithDevice:resourceClass:shmemSize:options:", self, objc_opt_class(), -[MTLIOAccelDevice initialSegmentListShmemSize](self, "initialSegmentListShmemSize"), 0);
    self->_segmentByteThreshold = 0;
    self->_device_dispatch_queue = (OS_dispatch_queue *)dispatch_queue_create("com.Metal.DeviceDispatchQueue", 0);
    MTLIOAccelCommandBufferStoragePoolCreate((uint64_t)self);
    self->_commandBufferStoragePool = (MTLIOAccelCommandBufferStoragePool *)v3;
    if (v3)
    {
      v4 = (OS_dispatch_queue *)dispatch_queue_create("com.Metal.DeviceCleaupQueue", 0);
      self->_device_pool_cleanup_queue = v4;
      self->_device_pool_cleanup_source = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)v4);
      self->_device_pool_cleanup_scheduled = 0;
      v8[0] = 0;
      v8[1] = v8;
      v8[2] = 0x3052000000;
      v8[3] = __Block_byref_object_copy__5;
      v8[4] = __Block_byref_object_dispose__5;
      device_pool_cleanup_source = self->_device_pool_cleanup_source;
      v8[5] = self;
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __34__MTLIOAccelDevice_lazyInitialize__block_invoke;
      handler[3] = &unk_1E0FE3468;
      handler[4] = v8;
      dispatch_source_set_event_handler(device_pool_cleanup_source, handler);
      _Block_object_dispose(v8, 8);
      LOBYTE(v3) = 1;
    }
  }
  return (char)v3;
}

uint64_t __34__MTLIOAccelDevice_lazyInitialize__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "updateResourcePoolPurgeability");
}

- (BOOL)supportLazyInitialization
{
  return 0;
}

- (unsigned)initialKernelCommandShmemSize
{
  return 0x4000;
}

- (unsigned)initialSegmentListShmemSize
{
  return 0x4000;
}

- (void)setHwResourcePool:(id *)a3 count:(int)a4
{
  uint64_t v7;

  self->_storageCreateParams.hwResourcePools = (hwResourcePoolCount **)malloc_type_malloc(8 * a4, 0x80040B8603338uLL);
  if (a4 >= 1)
  {
    v7 = 0;
    do
    {
      self->_storageCreateParams.hwResourcePools[v7] = (hwResourcePoolCount *)a3[v7];
      ++v7;
    }
    while (a4 != v7);
  }
  self->_storageCreateParams.var0 = a4;
}

- (void)_purgeDevice
{
  $A63098BA9F8020D70792AE75CFB93BCA *p_storageCreateParams;
  unint64_t v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTLIOAccelDevice;
  -[_MTLDevice _purgeDevice](&v5, sel__purgeDevice);
  MTLIOAccelCommandBufferStoragePoolPurge((uint64_t)self->_commandBufferStoragePool);
  p_storageCreateParams = &self->_storageCreateParams;
  -[MTLIOAccelDeviceShmemPool purge](p_storageCreateParams->kernelCommandShmemPool, "purge");
  -[MTLIOAccelDeviceShmemPool purge](p_storageCreateParams->segmentListShmemPool, "purge");
  -[MTLResourceListPool purge](p_storageCreateParams->akResourceListPool, "purge");
  -[MTLResourceListPool purge](p_storageCreateParams->akPrivateResourceListPool, "purge");
  if (p_storageCreateParams->var0)
  {
    v4 = 0;
    do
      -[hwResourcePoolCount purge](p_storageCreateParams->hwResourcePools[v4++], "purge");
    while (v4 < p_storageCreateParams->var0);
  }
}

- (id)akResourceListPool
{
  return self->_storageCreateParams.akResourceListPool;
}

- (id)akPrivateResourceListPool
{
  return self->_storageCreateParams.akPrivateResourceListPool;
}

- (__IOAccelDevice)deviceRef
{
  return self->_deviceRef;
}

- (__IOAccelShared)sharedRef
{
  return self->_sharedRef;
}

- (unint64_t)registryID
{
  return self->_registryID;
}

- (id)hwResourcePools
{
  return (id *)self->_storageCreateParams.hwResourcePools;
}

- (unsigned)hwResourcePoolCount
{
  return self->_storageCreateParams.var0;
}

- (unint64_t)sharedMemorySize
{
  return self->_sharedMemorySize;
}

- (unint64_t)dedicatedMemorySize
{
  return self->_videoRam;
}

- (unint64_t)recommendedMaxWorkingSetSize
{
  unint64_t videoRam;

  videoRam = self->_videoRam;
  if (!videoRam)
    return self->_sharedMemorySize;
  return videoRam;
}

- (BOOL)hasUnifiedMemory
{
  return 1;
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
  result = -[MTLIOAccelDevice supportsVertexAmplification](self, "supportsVertexAmplification");
  if (a3 != 2)
    return 0;
  return result;
}

- (signed)heapIndexWithOptions:(unint64_t)a3
{
  return (a3 >> 3) & 0x1E | a3 & 0xF | (a3 >> 5) & 8;
}

- (id)allocBufferSubDataWithLength:(unint64_t)a3 options:(unint64_t)a4 alignment:(unint64_t)a5 heapIndex:(signed __int16 *)a6 bufferIndex:(signed __int16 *)a7 bufferOffset:(unint64_t *)a8
{
  unint64_t v12;
  int v15;
  signed __int16 v16;
  NSObject *device_dispatch_queue;
  uint64_t *v18;
  uint64_t v19;
  void *v20;
  _QWORD block[12];
  signed __int16 v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  void (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  uint64_t v41;

  v12 = a4;
  v36 = 0;
  v37 = &v36;
  v38 = 0x3052000000;
  v39 = __Block_byref_object_copy__5;
  v40 = __Block_byref_object_dispose__5;
  v41 = 0;
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v15 = -[MTLIOAccelDevice heapIndexWithOptions:](self, "heapIndexWithOptions:", a4);
  v16 = v15;
  if (v15 < 0)
  {
    v20 = 0;
  }
  else
  {
    v37[5] = 0;
    *((_WORD *)v29 + 12) = -1;
    device_dispatch_queue = self->_device_dispatch_queue;
    if ((v12 & 0xF0) == 0x20)
      v12 |= 0x20000uLL;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __102__MTLIOAccelDevice_allocBufferSubDataWithLength_options_alignment_heapIndex_bufferIndex_bufferOffset___block_invoke;
    block[3] = &unk_1E0FE3B58;
    v23 = v16;
    block[4] = self;
    block[5] = &v32;
    block[6] = &v24;
    block[7] = &v36;
    block[8] = &v28;
    block[9] = a3;
    block[10] = a5;
    block[11] = v12;
    dispatch_sync(device_dispatch_queue, block);
    v18 = v37;
    if (v37[5])
    {
      *a6 = v16;
      *a7 = *((_WORD *)v33 + 12);
      *a8 = v25[3];
      if ((v12 & 0x90000) == 0 && (__int16)v29[3] < 0)
      {
        v19 = objc_msgSend((id)v18[5], "virtualAddress");
        bzero((void *)(v19 + v25[3]), a3);
        v18 = v37;
      }
    }
    v20 = (void *)v18[5];
  }
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);
  return v20;
}

void __102__MTLIOAccelDevice_allocBufferSubDataWithLength_options_alignment_heapIndex_bufferIndex_bufferOffset___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  if (!*(_DWORD *)(*(_QWORD *)(a1 + 32) + 728 + 3336 * *(__int16 *)(a1 + 96) + 3328))
  {
    *(_WORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
    goto LABEL_11;
  }
  *(_WORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  v2 = *(__int16 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v2 <= 63)
  {
    do
    {
      v3 = *(_QWORD *)(a1 + 32) + 728;
      v4 = *(void **)(v3 + 3336 * *(__int16 *)(a1 + 96) + 8 * (__int16)v2);
      if (v4)
      {
        if ((MTLRangeAllocatorAllocate(v3 + 3336 * *(__int16 *)(a1 + 96) + 40 * (__int16)v2 + 512, *(_QWORD *)(a1 + 72), (uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), *(_QWORD *)(a1 + 80)) & 1) != 0)
        {
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = v4;
          break;
        }
      }
      else
      {
        v5 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
        if (*(__int16 *)(v5 + 24) < 0)
          *(_WORD *)(v5 + 24) = v2;
      }
      v2 = (__int16)++*(_WORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    }
    while (v2 < 64);
  }
LABEL_11:
  if ((*(__int16 *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) & 0x80000000) == 0
    && !*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "newBufferWithLength:options:", 0x20000, *(_QWORD *)(a1 + 88));
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
    {
      *(_WORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(_WORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)
                                                                            + 24);
      *(_QWORD *)(*(_QWORD *)(a1 + 32)
                + 728
                + 3336 * *(__int16 *)(a1 + 96)
                + 8 * *(__int16 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24)) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)
                                                                                                  + 40);
      MTLRangeAllocatorInit(*(_QWORD *)(a1 + 32)+ 728+ 3336 * *(__int16 *)(a1 + 96)+ 40 * *(__int16 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24)+ 512, 0x1FFFFLL, 0, 0x80uLL);
      v7 = *(__int16 *)(a1 + 96);
      v8 = *(_QWORD *)(a1 + 32) + 728 + 3336 * *(__int16 *)(a1 + 96);
      ++*(_DWORD *)(v8 + 3328);
      if ((MTLRangeAllocatorAllocate(*(_QWORD *)(a1 + 32)+ 728+ 3336 * v7+ 40 * *(__int16 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24)+ 512, *(_QWORD *)(a1 + 72), (uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), *(_QWORD *)(a1 + 80)) & 1) == 0)
      {
        *(_QWORD *)(*(_QWORD *)(a1 + 32)
                  + 728
                  + 3336 * *(__int16 *)(a1 + 96)
                  + 8 * *(__int16 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24)) = 0;
        v9 = *(_QWORD *)(a1 + 32) + 728 + 3336 * *(__int16 *)(a1 + 96);
        --*(_DWORD *)(v9 + 3328);

        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = 0;
      }
    }
  }
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    v6 = *(_QWORD *)(a1 + 32)
       + 728
       + 3336 * *(__int16 *)(a1 + 96)
       + 4 * *(__int16 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    ++*(_DWORD *)(v6 + 3072);
  }
}

- (void)deallocBufferSubData:(id)a3 heapIndex:(signed __int16)a4 bufferIndex:(signed __int16)a5 bufferOffset:(unint64_t)a6 length:(unint64_t)a7
{
  NSObject *device_dispatch_queue;
  _QWORD block[8];
  signed __int16 v9;
  signed __int16 v10;

  device_dispatch_queue = self->_device_dispatch_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__MTLIOAccelDevice_deallocBufferSubData_heapIndex_bufferIndex_bufferOffset_length___block_invoke;
  block[3] = &unk_1E0FE3B80;
  block[4] = a3;
  block[5] = self;
  v9 = a4;
  v10 = a5;
  block[6] = a6;
  block[7] = a7;
  dispatch_sync(device_dispatch_queue, block);
}

void __83__MTLIOAccelDevice_deallocBufferSubData_heapIndex_bufferIndex_bufferOffset_length___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void **v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = *(_QWORD *)(a1 + 40) + 728;
  if (*(_QWORD *)(a1 + 32) == *(_QWORD *)(v1 + 3336 * *(__int16 *)(a1 + 64) + 8 * *(__int16 *)(a1 + 66)))
  {
    v3 = (void **)(v1 + 3336 * *(__int16 *)(a1 + 64) + 40 * *(__int16 *)(a1 + 66) + 512);
    MTLRangeAllocatorDeallocate(v3, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    v4 = *(__int16 *)(a1 + 64);
    v5 = *(__int16 *)(a1 + 66);
    v6 = *(_QWORD *)(a1 + 40) + 728 + 3336 * *(__int16 *)(a1 + 64) + 4 * v5;
    --*(_DWORD *)(v6 + 3072);
    v7 = *(_QWORD *)(a1 + 40) + 728;
    if (!*(_DWORD *)(v7 + 3336 * v4 + 4 * v5 + 3072))
    {
      *(_QWORD *)(v7 + 3336 * v4 + 8 * v5) = 0;
      MTLRangeAllocatorDestroy(v3);
    }

  }
}

- (id)newCommandQueueWithDescriptor:(id)a3
{
  return -[_MTLDevice newCommandQueueWithMaxCommandBufferCount:](self, "newCommandQueueWithMaxCommandBufferCount:", objc_msgSend(a3, "maxCommandBufferCount"));
}

- (id)newFence
{
  NSObject *device_dispatch_queue;
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__5;
  v10 = __Block_byref_object_dispose__5;
  v11 = 0;
  device_dispatch_queue = self->_device_dispatch_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __28__MTLIOAccelDevice_newFence__block_invoke;
  v5[3] = &unk_1E0FE2C40;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(device_dispatch_queue, v5);
  v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

MTLIOAccelFence *__28__MTLIOAccelDevice_newFence__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  unsigned int v10;
  unsigned int v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  MTLIOAccelFence *result;
  const char *v21;
  uint64_t v22;
  uint64_t v23;

  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(_DWORD *)(v9 + 54132);
  v11 = *(_DWORD *)(v9 + 54136);
  if (v10 >= v11)
  {
    if (v11)
      v12 = 2 * v11;
    else
      v12 = 256;
    if (IOAccelSharedAllocateFenceMemory() != v12)
    {
      v21 = "gotFenceCount == newFenceCount";
      v22 = 1080;
LABEL_22:
      MTLReleaseAssertionFailure((uint64_t)"-[MTLIOAccelDevice newFence]_block_invoke", v22, (uint64_t)v21, 0, a5, a6, a7, a8, v23);
    }
    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(unsigned int *)(v13 + 54144);
    *(_QWORD *)(v13 + 54152) = malloc_type_realloc(*(void **)(v13 + 54152), 8 * (v12 >> 6), 0x100004000313F17uLL);
    bzero((void *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 54152) + 8 * v14), 8 * ((v12 >> 6) - v14));
    v15 = *(_QWORD *)(a1 + 32);
    if (!*(_DWORD *)(v15 + 54136))
    {
      **(_QWORD **)(v15 + 54152) |= 1uLL;
      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 54132) = 1;
      v15 = *(_QWORD *)(a1 + 32);
    }
    *(_DWORD *)(v15 + 54136) = v12;
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 54144) = v12 >> 6;
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(_DWORD *)(v9 + 54132);
    v11 = *(_DWORD *)(v9 + 54136);
  }
  if (v10 >= v11)
  {
    v21 = "_fenceAllocatedCount < _fenceMaximumCount";
    v22 = 1098;
    goto LABEL_22;
  }
  v16 = *(unsigned int *)(v9 + 54140);
  v17 = *(unsigned int *)(v9 + 54144);
  if (v16 >= v17)
  {
    v18 = 0;
  }
  else
  {
    while (1)
    {
      v18 = *(_QWORD *)(*(_QWORD *)(v9 + 54152) + 8 * v16);
      if (v18 != -1)
        break;
      if (v17 == ++v16)
      {
        v18 = -1;
        LODWORD(v16) = *(_DWORD *)(v9 + 54144);
        break;
      }
    }
  }
  if (v16 >= v11)
  {
    v21 = "searchIndex < _fenceMaximumCount";
    v22 = 1110;
    goto LABEL_22;
  }
  *(_DWORD *)(v9 + 54140) = v16;
  v19 = __clz(__rbit64(~v18));
  result = -[MTLIOAccelFence initWithDevice:fenceIndex:]([MTLIOAccelFence alloc], "initWithDevice:fenceIndex:", *(_QWORD *)(a1 + 32), (v19 + ((_DWORD)v16 << 6)));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 54152) + 8 * v16) = (1 << v19) | v18;
    ++*(_DWORD *)(*(_QWORD *)(a1 + 32) + 54132);
  }
  return result;
}

- (void)releaseFenceIndex:(unsigned int)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *device_dispatch_queue;
  uint64_t v8[5];
  unsigned int v9;

  if (!a3 || self->_fenceMaximumCount <= a3)
    MTLReleaseAssertionFailure((uint64_t)"-[MTLIOAccelDevice releaseFenceIndex:]", 1132, (uint64_t)"fenceIndex != 0 && fenceIndex < _fenceMaximumCount", 0, v3, v4, v5, v6, v8[0]);
  device_dispatch_queue = self->_device_dispatch_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = (uint64_t)__38__MTLIOAccelDevice_releaseFenceIndex___block_invoke;
  v8[3] = (uint64_t)&unk_1E0FE3BA8;
  v9 = a3;
  v8[4] = (uint64_t)self;
  dispatch_sync(device_dispatch_queue, v8);
}

uint64_t __38__MTLIOAccelDevice_releaseFenceIndex___block_invoke(uint64_t result)
{
  unint64_t v1;
  unint64_t v2;
  uint64_t v3;

  v1 = *(unsigned int *)(result + 40);
  v2 = v1 >> 6;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 54152) + 8 * v2) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32)
                                                                                                + 54152)
                                                                                    + 8 * (v1 >> 6)) & ~(1 << v1);
  --*(_DWORD *)(*(_QWORD *)(result + 32) + 54132);
  v3 = *(_QWORD *)(result + 32);
  if (v2 < *(_DWORD *)(v3 + 54140))
    *(_DWORD *)(v3 + 54140) = v2;
  return result;
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
  id result;
  id v8;
  MTLIOAccelIndirectCommandBuffer *v9;

  result = (id)-[MTLIOAccelDevice newIndirectCommandBufferWithDescriptor:maxCount:options:](self, "newIndirectCommandBufferWithDescriptor:maxCount:options:", a3, a4, a5);
  if (result)
  {
    v8 = result;
    v9 = -[MTLIOAccelIndirectCommandBuffer initWithBuffer:descriptor:maxCommandCount:]([MTLIOAccelIndirectCommandBuffer alloc], "initWithBuffer:descriptor:maxCommandCount:", result, a3, a4);

    return v9;
  }
  return result;
}

- (id)indirectArgumentBufferDecodingData
{
  return 0;
}

- (BOOL)supportPriorityBand
{
  return (LOBYTE(self->_configBits) >> 6) & 1;
}

- (unint64_t)currentAllocatedSize
{
  if (IOAccelSharedGetAllocatedSize())
    return 0;
  else
    return 0;
}

- (id)newEvent
{
  objc_super v3;

  if ((self->_configBits & 0x4000) != 0)
    return -[_MTLIOAccelMTLEvent initWithDevice:]([_MTLIOAccelMTLEvent alloc], "initWithDevice:", self);
  v3.receiver = self;
  v3.super_class = (Class)MTLIOAccelDevice;
  return -[_MTLDevice newEvent](&v3, sel_newEvent);
}

- (id)newEventWithOptions:(int64_t)a3
{
  return -[_MTLIOAccelMTLEvent initWithDevice:options:]([_MTLIOAccelMTLEvent alloc], "initWithDevice:options:", self, a3);
}

- (unint64_t)maxBufferLength
{
  IOAccelDeviceGetMaxResourceSize();
  return 0;
}

- (void)kickCleanupQueue
{
  NSObject *device_pool_cleanup_queue;
  _QWORD block[5];

  device_pool_cleanup_queue = self->_device_pool_cleanup_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__MTLIOAccelDevice_kickCleanupQueue__block_invoke;
  block[3] = &unk_1E0FE2880;
  block[4] = self;
  dispatch_async(device_pool_cleanup_queue, block);
}

void __36__MTLIOAccelDevice_kickCleanupQueue__block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v3;
  dispatch_time_t v4;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 54128))
  {
    *(_BYTE *)(v1 + 54128) = 1;
    v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 54120);
    v4 = dispatch_time(0, 1000000000);
    dispatch_source_set_timer(v3, v4, 0x3B9ACA00uLL, 0x5F5E100uLL);
    dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 54120));
  }
}

- (void)updateResourcePoolPurgeability
{
  $A63098BA9F8020D70792AE75CFB93BCA *p_storageCreateParams;
  unint64_t v4;
  int v5;

  if (self->_device_pool_cleanup_scheduled)
  {
    p_storageCreateParams = &self->_storageCreateParams;
    if (!self->_storageCreateParams.var0)
      goto LABEL_6;
    v4 = 0;
    v5 = 0;
    do
      v5 |= -[hwResourcePoolCount updateResourcePurgeability](p_storageCreateParams->hwResourcePools[v4++], "updateResourcePurgeability");
    while (v4 < p_storageCreateParams->var0);
    if ((v5 & 1) == 0)
    {
LABEL_6:
      dispatch_suspend((dispatch_object_t)self->_device_pool_cleanup_source);
      self->_device_pool_cleanup_scheduled = 0;
    }
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

- (MTLIOMemoryInfo)memoryInfo
{
  return (MTLIOMemoryInfo *)_memoryInfo;
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3
{
  uint64_t v6;
  void *v7;
  MTLIOAccelAccelerationStructure *v8;

  if (-[_MTLDevice requiresRaytracingEmulation](self, "requiresRaytracingEmulation"))
  {
    v6 = -[MTLIOAccelDevice newBufferWithLength:options:](self, "newBufferWithLength:options:", a3, 32);
    if (v6)
    {
      v7 = (void *)v6;
      v8 = -[MTLIOAccelAccelerationStructure initWithBuffer:offset:]([MTLIOAccelAccelerationStructure alloc], "initWithBuffer:offset:", v6, 0);

      return v8;
    }
  }
  else
  {
    -[MTLIOAccelDevice doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  }
  return 0;
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3 withDescriptor:(id)a4
{
  uint64_t v8;
  void *v9;
  int v10;
  MTLIOAccelAccelerationStructure *v11;
  uint64_t v12;
  void *v13;

  if (!-[_MTLDevice requiresRaytracingEmulation](self, "requiresRaytracingEmulation"))
  {
    -[MTLIOAccelDevice doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
    return 0;
  }
  v8 = -[MTLIOAccelDevice newBufferWithLength:options:](self, "newBufferWithLength:options:", a3, 16 * (objc_msgSend(a4, "storageMode") & 0xF));
  if (!v8)
    return 0;
  v9 = (void *)v8;
  v10 = objc_msgSend(a4, "forceResourceIndex");
  v11 = [MTLIOAccelAccelerationStructure alloc];
  if (v10)
    v12 = -[MTLIOAccelAccelerationStructure initWithBuffer:offset:resourceIndex:](v11, "initWithBuffer:offset:resourceIndex:", v9, 0, objc_msgSend(a4, "resourceIndex"));
  else
    v12 = -[MTLIOAccelAccelerationStructure initWithBuffer:offset:](v11, "initWithBuffer:offset:", v9, 0);
  v13 = (void *)v12;

  return v13;
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3 resourceIndex:(unint64_t)a4
{
  uint64_t v8;
  void *v9;
  MTLIOAccelAccelerationStructure *v10;

  if (-[_MTLDevice requiresRaytracingEmulation](self, "requiresRaytracingEmulation"))
  {
    v8 = -[MTLIOAccelDevice newBufferWithLength:options:](self, "newBufferWithLength:options:", a3, 32);
    if (v8)
    {
      v9 = (void *)v8;
      v10 = -[MTLIOAccelAccelerationStructure initWithBuffer:offset:resourceIndex:]([MTLIOAccelAccelerationStructure alloc], "initWithBuffer:offset:resourceIndex:", v8, 0, a4);

      return v10;
    }
  }
  else
  {
    -[MTLIOAccelDevice doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  }
  return 0;
}

- (id)newAccelerationStructureWithBuffer:(id)a3 offset:(unint64_t)a4
{
  if (-[_MTLDevice requiresRaytracingEmulation](self, "requiresRaytracingEmulation"))
  {
    if (a3)
      return -[MTLIOAccelAccelerationStructure initWithBuffer:offset:]([MTLIOAccelAccelerationStructure alloc], "initWithBuffer:offset:", a3, a4);
  }
  else
  {
    -[MTLIOAccelDevice doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  }
  return 0;
}

- (id)newAccelerationStructureWithBuffer:(id)a3 offset:(unint64_t)a4 resourceIndex:(unint64_t)a5
{
  if (-[_MTLDevice requiresRaytracingEmulation](self, "requiresRaytracingEmulation"))
  {
    if (a3)
      return -[MTLIOAccelAccelerationStructure initWithBuffer:offset:resourceIndex:]([MTLIOAccelAccelerationStructure alloc], "initWithBuffer:offset:resourceIndex:", a3, a4, a5);
  }
  else
  {
    -[MTLIOAccelDevice doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  }
  return 0;
}

- (id)newIntersectionFunctionTableWithDescriptor:(id)a3
{
  MTLVisibleFunctionTableDescriptor *v6;
  void *v7;
  MTLIOAccelIntersectionFunctionTable *v8;

  if (-[_MTLDevice requiresRaytracingEmulation](self, "requiresRaytracingEmulation"))
  {
    v6 = objc_alloc_init(MTLVisibleFunctionTableDescriptor);
    -[MTLVisibleFunctionTableDescriptor setFunctionCount:](v6, "setFunctionCount:", objc_msgSend(a3, "functionCount"));
    -[MTLVisibleFunctionTableDescriptor setResourceIndex:](v6, "setResourceIndex:", objc_msgSend(a3, "resourceIndex"));
    -[MTLVisibleFunctionTableDescriptor setForceResourceIndex:](v6, "setForceResourceIndex:", objc_msgSend(a3, "forceResourceIndex"));
    v7 = (void *)-[MTLIOAccelDevice newVisibleFunctionTableWithDescriptor:](self, "newVisibleFunctionTableWithDescriptor:", v6);

    v8 = -[MTLIOAccelIntersectionFunctionTable initWithVisibleFunctionTable:]([MTLIOAccelIntersectionFunctionTable alloc], "initWithVisibleFunctionTable:", v7);
    return v8;
  }
  else
  {
    -[MTLIOAccelDevice doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
    return 0;
  }
}

- (id)newIOCommandQueueWithDescriptor:(id)a3 error:(id *)a4
{
  return -[MTLIOAccelIOCommandQueue initWithDevice:descriptor:]([MTLIOAccelIOCommandQueue alloc], "initWithDevice:descriptor:", self, a3);
}

- (id)newIOHandleWithURL:(id)a3 compressionMethod:(int64_t)a4 error:(id *)a5
{
  uint64_t v10;

  if (objc_msgSend(a3, "isFileURL"))
  {
    if (objc_msgSend(a3, "checkResourceIsReachableAndReturnError:", a5))
      return -[MTLIOAccelIOHandleCompressed initWithDevice:path:compressionType:error:uncached:]([MTLIOAccelIOHandleCompressed alloc], "initWithDevice:path:compressionType:error:uncached:", self, objc_msgSend(a3, "fileSystemRepresentation"), a4, a5, 0);
  }
  else if (a5)
  {
    v10 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", CFSTR("URL is not a file"), *MEMORY[0x1E0CB2D50]);
    *a5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("MTLIOError"), 1, v10);
  }
  return 0;
}

- (id)newIOHandleWithURL:(id)a3 error:(id *)a4
{
  uint64_t v8;

  if (objc_msgSend(a3, "isFileURL"))
  {
    if (objc_msgSend(a3, "checkResourceIsReachableAndReturnError:", a4))
      return -[MTLIOAccelIOHandleRaw initWithDevice:path:error:uncached:]([MTLIOAccelIOHandleRaw alloc], "initWithDevice:path:error:uncached:", self, objc_msgSend(a3, "fileSystemRepresentation"), a4, 0);
  }
  else if (a4)
  {
    v8 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", CFSTR("URL is not a file"), *MEMORY[0x1E0CB2D50]);
    *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("MTLIOError"), 1, v8);
  }
  return 0;
}

- (id)newUncachedIOHandleWithURL:(id)a3 compressionType:(int64_t)a4 error:(id *)a5
{
  uint64_t v10;

  if (objc_msgSend(a3, "isFileURL"))
  {
    if (objc_msgSend(a3, "checkResourceIsReachableAndReturnError:", a5))
      return -[MTLIOAccelIOHandleCompressed initWithDevice:path:compressionType:error:uncached:]([MTLIOAccelIOHandleCompressed alloc], "initWithDevice:path:compressionType:error:uncached:", self, objc_msgSend(a3, "fileSystemRepresentation"), a4, a5, 1);
  }
  else if (a5)
  {
    v10 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", CFSTR("URL is not a file"), *MEMORY[0x1E0CB2D50]);
    *a5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("MTLIOError"), 1, v10);
  }
  return 0;
}

- (id)newUncachedIOHandleWithURL:(id)a3 error:(id *)a4
{
  uint64_t v8;

  if (objc_msgSend(a3, "isFileURL"))
  {
    if (objc_msgSend(a3, "checkResourceIsReachableAndReturnError:", a4))
      return -[MTLIOAccelIOHandleRaw initWithDevice:path:error:uncached:]([MTLIOAccelIOHandleRaw alloc], "initWithDevice:path:error:uncached:", self, objc_msgSend(a3, "fileSystemRepresentation"), a4, 1);
  }
  else if (a4)
  {
    v8 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", CFSTR("URL is not a file"), *MEMORY[0x1E0CB2D50]);
    *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("MTLIOError"), 1, v8);
  }
  return 0;
}

- (unsigned)acceleratorPort
{
  return self->_acceleratorPort;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_deviceWrapper);
}

@end
