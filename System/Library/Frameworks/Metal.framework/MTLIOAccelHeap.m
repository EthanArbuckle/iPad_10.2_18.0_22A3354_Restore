@implementation MTLIOAccelHeap

- (MTLDevice)device
{
  return self->_device;
}

- (unint64_t)size
{
  return self->_size;
}

- (unint64_t)usedSize
{
  unint64_t v3;
  _opaque_pthread_mutex_t *p_mutex;
  unint64_t size;

  if (-[_MTLHeap type](self, "type"))
    return 0;
  p_mutex = &self->_mutex;
  pthread_mutex_lock(&self->_mutex);
  size = self->_size;
  v3 = size - MTLRangeAllocatorGetFreeSize((unsigned int *)&self->_allocator);
  pthread_mutex_unlock(p_mutex);
  return v3;
}

- (unint64_t)maxAvailableSizeWithAlignment:(unint64_t)a3
{
  unsigned int v3;
  unint64_t MaxFreeSize;

  v3 = a3;
  if (-[_MTLHeap type](self, "type"))
    return 0;
  pthread_mutex_lock(&self->_mutex);
  MaxFreeSize = MTLRangeAllocatorGetMaxFreeSize((unsigned int *)&self->_allocator, v3);
  pthread_mutex_unlock(&self->_mutex);
  return MaxFreeSize;
}

- (MTLIOAccelHeap)initWithDevice:(id)a3 size:(unint64_t)a4 options:(unint64_t)a5 args:(IOAccelNewResourceArgs *)a6 argsSize:(unsigned int)a7
{
  return -[MTLIOAccelHeap initWithDevice:size:options:args:argsSize:desc:](self, "initWithDevice:size:options:args:argsSize:desc:", a3, a4, a5, a6, *(_QWORD *)&a7, 0);
}

- (MTLIOAccelHeap)initWithDevice:(id)a3 size:(unint64_t)a4 options:(unint64_t)a5 args:(IOAccelNewResourceArgs *)a6 argsSize:(unsigned int)a7 desc:(id)a8
{
  uint64_t v9;
  unint64_t v14;
  uint64_t v15;
  MTLIOAccelHeap *v16;
  MTLIOAccelResource *v17;
  objc_super v19;
  objc_super v20;

  v9 = *(_QWORD *)&a7;
  if ((a5 & 0x300) != 0)
    v14 = a5;
  else
    v14 = a5 & 0xFFFFFFFFFFFFFCFFLL | 0x100;
  if (a8)
    v15 = objc_msgSend(a8, "type");
  else
    v15 = 0;
  v20.receiver = self;
  v20.super_class = (Class)MTLIOAccelHeap;
  v16 = -[_MTLHeap initWithType:options:](&v20, sel_initWithType_options_, v15, v14);
  if (a8 && objc_msgSend(a8, "pinnedGPUAddress"))
  {
    a6->var0.var14 = objc_msgSend(a8, "pinnedGPUAddress");
    a6->var0.var15 = objc_msgSend(a8, "size");
  }
  a6->var0.var13 = objc_msgSend(a8, "protectionOptions");
  if (v16)
  {
    v17 = -[MTLIOAccelResource initWithDevice:options:args:argsSize:]([MTLIOAccelResource alloc], "initWithDevice:options:args:argsSize:", a3, v14, a6, v9);
    v16->_resource = v17;
    if (v17)
    {
      v16->_device = (MTLDevice *)a3;
      v16->_size = a4;
      pthread_mutex_init(&v16->_mutex, 0);
      if (!-[_MTLHeap type](v16, "type"))
        MTLRangeAllocatorInit((uint64_t)&v16->_allocator, v16->_size - 1, 0, 0x80uLL);
    }
    else
    {
      v19.receiver = v16;
      v19.super_class = (Class)MTLIOAccelHeap;
      -[_MTLObjectWithLabel dealloc](&v19, sel_dealloc);
      return 0;
    }
  }
  return v16;
}

- (void)dealloc
{
  objc_super v3;

  if (!-[_MTLHeap type](self, "type"))
    MTLRangeAllocatorDestroy((void **)&self->_allocator.elements);

  self->_device = 0;
  v3.receiver = self;
  v3.super_class = (Class)MTLIOAccelHeap;
  -[_MTLObjectWithLabel dealloc](&v3, sel_dealloc);
}

- (id)newSubResourceWithLength:(unint64_t)a3 alignment:(unint64_t)a4 options:(unint64_t)a5 offset:(unint64_t *)a6
{
  MTLIOAccelResource *v6;
  unsigned __int8 v8;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  _opaque_pthread_mutex_t *p_mutex;
  const __CFString *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const __CFString *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  if (self->_size < a3)
    return 0;
  v8 = a5;
  v12 = *(_QWORD *)&self->_resource->_anon_50[96];
  v13 = v12 & 0xF;
  if ((a5 & 0xF) != v13)
  {
    v18 = MTLCPUCacheModeString(a5 & 0xF);
    MTLCPUCacheModeString(v13);
    MTLReportFailure(0, "-[MTLIOAccelHeap newSubResourceWithLength:alignment:options:offset:]", 175, (uint64_t)CFSTR("The requested CPU cache mode (%@) does not match the heap's mode (%@)"), v19, v20, v21, v22, (uint64_t)v18);
    v12 = *(_QWORD *)&self->_resource->_anon_50[96];
  }
  v14 = v8 >> 4;
  if (v14 != 3)
  {
    v15 = v12 >> 4;
    if (v14 != v15)
    {
      v23 = MTLStorageModeString(v14);
      MTLStorageModeString(v15);
      MTLReportFailure(0, "-[MTLIOAccelHeap newSubResourceWithLength:alignment:options:offset:]", 184, (uint64_t)CFSTR("The requested storage mode (%@) is not compatible with the heap's mode (%@)"), v24, v25, v26, v27, (uint64_t)v23);
    }
  }
  p_mutex = &self->_mutex;
  pthread_mutex_lock(&self->_mutex);
  if (MTLRangeAllocatorAllocate((uint64_t)&self->_allocator, a3, (uint64_t *)a6, a4))
    v6 = self->_resource;
  else
    v6 = 0;
  pthread_mutex_unlock(p_mutex);
  return v6;
}

- (void)unpinMemoryAtOffset:(unint64_t)a3 withLength:(unint64_t)a4
{
  _opaque_pthread_mutex_t *p_mutex;

  p_mutex = &self->_mutex;
  pthread_mutex_lock(&self->_mutex);
  MTLRangeAllocatorDeallocate(&self->_allocator.elements, a3, a4);
  pthread_mutex_unlock(p_mutex);
}

- (void)deallocHeapSubResource
{
  _opaque_pthread_mutex_t *p_mutex;

  p_mutex = &self->_mutex;
  pthread_mutex_lock(&self->_mutex);

  pthread_mutex_unlock(p_mutex);
}

- (unint64_t)setPurgeableState:(unint64_t)a3
{
  _opaque_pthread_mutex_t *p_mutex;
  unint64_t v6;

  p_mutex = &self->_mutex;
  pthread_mutex_lock(&self->_mutex);
  v6 = -[MTLIOAccelResource setPurgeableState:](self->_resource, "setPurgeableState:", a3);
  pthread_mutex_unlock(p_mutex);
  return v6;
}

- (unint64_t)currentAllocatedSize
{
  return -[MTLIOAccelResource allocatedSize](self->_resource, "allocatedSize");
}

- (id)newSubResourceAtOffset:(unint64_t)a3 withLength:(unint64_t)a4 alignment:(unint64_t)a5 options:(unint64_t)a6
{
  unsigned __int8 v6;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  const __CFString *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const __CFString *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v6 = a6;
  v11 = *(_QWORD *)&self->_resource->_anon_50[96];
  v12 = v11 & 0xF;
  if ((a6 & 0xF) != v12)
  {
    v16 = MTLCPUCacheModeString(a6 & 0xF);
    MTLCPUCacheModeString(v12);
    MTLReportFailure(0, "-[MTLIOAccelHeap newSubResourceAtOffset:withLength:alignment:options:]", 255, (uint64_t)CFSTR("The requested CPU cache mode (%@) does not match the heap's mode (%@)"), v17, v18, v19, v20, (uint64_t)v16);
    v11 = *(_QWORD *)&self->_resource->_anon_50[96];
  }
  v13 = v6 >> 4;
  v14 = v11 >> 4;
  if (v13 != v14)
  {
    v21 = MTLStorageModeString(v13);
    MTLStorageModeString(v14);
    MTLReportFailure(0, "-[MTLIOAccelHeap newSubResourceAtOffset:withLength:alignment:options:]", 260, (uint64_t)CFSTR("The requested storage mode (%@) is not compatible with the heap's mode (%@)"), v22, v23, v24, v25, (uint64_t)v21);
  }
  if (__CFADD__(a3, a4) || a3 + a4 > self->_size || ((a5 | a3) & (a5 - 1)) != 0)
    return 0;
  else
    return self->_resource;
}

- (unint64_t)gpuAddress
{
  return -[MTLIOAccelResource gpuAddress](self->_resource, "gpuAddress");
}

- (unint64_t)protectionOptions
{
  return -[MTLIOAccelResource protectionOptions](self->_resource, "protectionOptions");
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v14;

  if ((-[MTLDevice requiresRaytracingEmulation](self->_device, "requiresRaytracingEmulation") & 1) != 0)
  {
    if (-[_MTLHeap storageMode](self, "storageMode") != 2)
      MTLReportFailure(0, "-[MTLIOAccelHeap newAccelerationStructureWithSize:]", 294, (uint64_t)CFSTR("newAccelerationStructureWithSize: Acceleration structure allocation requires MTLResourceStorageModePrivate storage mode"), v6, v7, v8, v9, v14);
    v10 = -[MTLIOAccelHeap newBufferWithLength:options:](self, "newBufferWithLength:options:", a3, -[_MTLHeap resourceOptions](self, "resourceOptions"));
    if (v10)
    {
      v11 = (void *)v10;
      v12 = (void *)-[MTLDevice newAccelerationStructureWithBuffer:offset:](self->_device, "newAccelerationStructureWithBuffer:offset:", v10, 0);

      return v12;
    }
  }
  else
  {
    -[MTLIOAccelHeap doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  }
  return 0;
}

- (id)newAccelerationStructureWithDescriptor:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  if (-[_MTLHeap storageMode](self, "storageMode") != 2)
    MTLReportFailure(0, "-[MTLIOAccelHeap newAccelerationStructureWithDescriptor:]", 306, (uint64_t)CFSTR("newAccelerationStructureWithDescriptor: Acceleration structure allocation requires MTLResourceStorageModePrivate storage mode"), v5, v6, v7, v8, v10);
  return -[MTLIOAccelHeap newAccelerationStructureWithSize:](self, "newAccelerationStructureWithSize:", -[MTLDevice heapAccelerationStructureSizeAndAlignWithDescriptor:](self->_device, "heapAccelerationStructureSizeAndAlignWithDescriptor:", a3));
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3 offset:(unint64_t)a4
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v16;

  if ((-[MTLDevice requiresRaytracingEmulation](self->_device, "requiresRaytracingEmulation") & 1) != 0)
  {
    if (-[_MTLHeap storageMode](self, "storageMode") != 2)
      MTLReportFailure(0, "-[MTLIOAccelHeap newAccelerationStructureWithSize:offset:]", 320, (uint64_t)CFSTR("newAccelerationStructureWithSize:offset: Acceleration structure allocation requires MTLResourceStorageModePrivate storage mode"), v8, v9, v10, v11, v16);
    v12 = -[_MTLHeap newBufferWithLength:options:offset:](self, "newBufferWithLength:options:offset:", a3, -[_MTLHeap resourceOptions](self, "resourceOptions"), a4);
    if (v12)
    {
      v13 = v12;
      v14 = (void *)-[MTLDevice newAccelerationStructureWithBuffer:offset:](self->_device, "newAccelerationStructureWithBuffer:offset:", v12, 0);

      return v14;
    }
  }
  else
  {
    -[MTLIOAccelHeap doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  }
  return 0;
}

- (id)newAccelerationStructureWithDescriptor:(id)a3 offset:(unint64_t)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  if (-[_MTLHeap storageMode](self, "storageMode") != 2)
    MTLReportFailure(0, "-[MTLIOAccelHeap newAccelerationStructureWithDescriptor:offset:]", 332, (uint64_t)CFSTR("newAccelerationStructureWithDescriptor:offset: Acceleration structure allocation requires MTLResourceStorageModePrivate storage mode"), v7, v8, v9, v10, v12);
  return -[MTLIOAccelHeap newAccelerationStructureWithSize:offset:](self, "newAccelerationStructureWithSize:offset:", -[MTLDevice heapAccelerationStructureSizeAndAlignWithDescriptor:](self->_device, "heapAccelerationStructureSizeAndAlignWithDescriptor:", a3), a4);
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3 resourceIndex:(unint64_t)a4
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v16;

  if ((-[MTLDevice requiresRaytracingEmulation](self->_device, "requiresRaytracingEmulation") & 1) != 0)
  {
    if (-[_MTLHeap storageMode](self, "storageMode") != 2)
      MTLReportFailure(0, "-[MTLIOAccelHeap newAccelerationStructureWithSize:resourceIndex:]", 346, (uint64_t)CFSTR("newAccelerationStructureWithSize:offset:resourceIndex: Acceleration structure allocation requires MTLResourceStorageModePrivate storage mode"), v8, v9, v10, v11, v16);
    v12 = -[MTLIOAccelHeap newBufferWithLength:options:](self, "newBufferWithLength:options:", a3, -[_MTLHeap resourceOptions](self, "resourceOptions"));
    if (v12)
    {
      v13 = (void *)v12;
      v14 = (void *)-[MTLDevice newAccelerationStructureWithBuffer:offset:resourceIndex:](self->_device, "newAccelerationStructureWithBuffer:offset:resourceIndex:", v12, 0, a4);

      return v14;
    }
  }
  else
  {
    -[MTLIOAccelHeap doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  }
  return 0;
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3 offset:(unint64_t)a4 resourceIndex:(unint64_t)a5
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v18;

  if ((-[MTLDevice requiresRaytracingEmulation](self->_device, "requiresRaytracingEmulation") & 1) != 0)
  {
    if (-[_MTLHeap storageMode](self, "storageMode") != 2)
      MTLReportFailure(0, "-[MTLIOAccelHeap newAccelerationStructureWithSize:offset:resourceIndex:]", 364, (uint64_t)CFSTR("newAccelerationStructureWithDescriptor:offset:resourceIndex: Acceleration structure allocation requires MTLResourceStorageModePrivate storage mode"), v10, v11, v12, v13, v18);
    v14 = -[_MTLHeap newBufferWithLength:options:offset:](self, "newBufferWithLength:options:offset:", a3, -[_MTLHeap resourceOptions](self, "resourceOptions"), a4);
    if (v14)
    {
      v15 = v14;
      v16 = (void *)-[MTLDevice newAccelerationStructureWithBuffer:offset:resourceIndex:](self->_device, "newAccelerationStructureWithBuffer:offset:resourceIndex:", v14, 0, a5);

      return v16;
    }
  }
  else
  {
    -[MTLIOAccelHeap doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  }
  return 0;
}

@end
