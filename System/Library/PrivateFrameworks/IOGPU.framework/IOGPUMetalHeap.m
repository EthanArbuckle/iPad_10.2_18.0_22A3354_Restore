@implementation IOGPUMetalHeap

- (unint64_t)setPurgeableState:(unint64_t)a3
{
  _opaque_pthread_mutex_t *p_mutex;
  unint64_t v6;

  p_mutex = &self->_mutex;
  pthread_mutex_lock(&self->_mutex);
  v6 = -[IOGPUMetalResource setPurgeableState:](self->_resource, "setPurgeableState:", a3);
  pthread_mutex_unlock(p_mutex);
  return v6;
}

- (unint64_t)maxAvailableSizeWithAlignment:(unint64_t)a3
{
  unint64_t MaxFreeSize;

  if ((a3 & (a3 - 1)) != 0)
    -[IOGPUMetalHeap maxAvailableSizeWithAlignment:].cold.1();
  if (-[_MTLHeap type](self, "type"))
    return 0;
  pthread_mutex_lock(&self->_mutex);
  MaxFreeSize = MTLRangeAllocatorGetMaxFreeSize();
  pthread_mutex_unlock(&self->_mutex);
  return MaxFreeSize;
}

- (void)unpinMemoryAtOffset:(unint64_t)a3 withLength:(unint64_t)a4
{
  if (-[_MTLHeap type](self, "type"))
    -[IOGPUMetalHeap unpinMemoryAtOffset:withLength:].cold.1();
  pthread_mutex_lock(&self->_mutex);
  MTLRangeAllocatorDeallocate();
  pthread_mutex_unlock(&self->_mutex);
}

- (id)newSubResourceWithLength:(unint64_t)a3 alignment:(unint64_t)a4 options:(unint64_t)a5 offset:(unint64_t *)a6
{
  unsigned __int8 v6;
  IOGPUMetalResource *v9;
  uint64_t v10;
  uint64_t v11;
  _opaque_pthread_mutex_t *p_mutex;

  v6 = a5;
  if (-[_MTLHeap type](self, "type"))
    -[IOGPUMetalHeap newSubResourceWithLength:alignment:options:offset:].cold.1();
  if (self->_size < a3)
    return 0;
  v10 = *(_QWORD *)&self->_resource->_anon_50[88];
  if ((v6 & 0xF) != (unint64_t)(v10 & 0xF))
  {
    MTLCPUCacheModeString();
    MTLCPUCacheModeString();
    MTLReportFailure();
    v10 = *(_QWORD *)&self->_resource->_anon_50[88];
  }
  v11 = v6 >> 4;
  if (v11 != 3 && v11 != v10 >> 4)
  {
    MTLStorageModeString();
    MTLStorageModeString();
    MTLReportFailure();
  }
  p_mutex = &self->_mutex;
  pthread_mutex_lock(&self->_mutex);
  if (MTLRangeAllocatorAllocate())
    v9 = self->_resource;
  else
    v9 = 0;
  pthread_mutex_unlock(p_mutex);
  return v9;
}

- (void)deallocHeapSubResource
{
  _opaque_pthread_mutex_t *p_mutex;

  p_mutex = &self->_mutex;
  pthread_mutex_lock(&self->_mutex);

  pthread_mutex_unlock(p_mutex);
}

- (MTLDevice)device
{
  return self->_device;
}

- (unint64_t)size
{
  return self->_size;
}

- (unint64_t)protectionOptions
{
  return -[IOGPUMetalResource protectionOptions](self->_resource, "protectionOptions");
}

- (IOGPUMetalHeap)initWithDevice:(id)a3 size:(unint64_t)a4 options:(unint64_t)a5 args:(IOGPUNewResourceArgs *)a6 argsSize:(unsigned int)a7 desc:(id)a8
{
  uint64_t v9;
  unint64_t v14;
  uint64_t v15;
  IOGPUMetalHeap *v16;
  uint64_t v17;
  void *v18;
  IOGPUMetalResource *v19;
  objc_super v21;
  objc_super v22;

  v9 = *(_QWORD *)&a7;
  if ((a5 & 0x300) != 0)
    v14 = a5;
  else
    v14 = a5 & 0xFFFFFFFFFFFFFCFFLL | 0x100;
  if (a8)
    v15 = objc_msgSend(a8, "type");
  else
    v15 = 0;
  v22.receiver = self;
  v22.super_class = (Class)IOGPUMetalHeap;
  v16 = -[_MTLHeap initWithType:options:](&v22, sel_initWithType_options_, v15, v14);
  a6->var0.var11 = objc_msgSend(a8, "protectionOptions");
  if ((a6->var0.var0 & 0xF) == 0 && objc_msgSend(a8, "memoryPoolId"))
  {
    a6->var0.var10 |= 0x100000u;
    a6->var0.var16.var0.var3.var1 = objc_msgSend(a8, "memoryPoolId");
  }
  v17 = objc_msgSend(a8, "addressRanges");
  if (v17)
  {
    v18 = (void *)v17;
    if (objc_msgSend(a8, "memoryPoolId"))
      MTLReportFailure();
    a6->var0.var0 = 128;
    a6->var0.var16.var0.var0 = objc_msgSend(v18, "ranges");
    a6->var0.var16.var0.var1 = objc_msgSend(v18, "count");
    a6->var0.var10 |= 0x200000u;
  }
  if (v16)
  {
    v19 = -[IOGPUMetalResource initWithDevice:options:args:argsSize:]([IOGPUMetalResource alloc], "initWithDevice:options:args:argsSize:", a3, v14, a6, v9);
    v16->_resource = v19;
    if (v19)
    {
      v16->_device = (MTLDevice *)a3;
      v16->_size = a4;
      -[IOGPUMetalResource setLabel:](v16->_resource, "setLabel:", CFSTR("IOGPUMetalHeap"));
      pthread_mutex_init(&v16->_mutex, 0);
      if (!-[_MTLHeap type](v16, "type"))
        MTLRangeAllocatorInit();
    }
    else
    {
      v21.receiver = v16;
      v21.super_class = (Class)IOGPUMetalHeap;
      -[_MTLObjectWithLabel dealloc](&v21, sel_dealloc);
      return 0;
    }
  }
  return v16;
}

- (id)newSubResourceAtOffset:(unint64_t)a3 withLength:(unint64_t)a4 alignment:(unint64_t)a5 options:(unint64_t)a6
{
  unsigned __int8 v6;
  uint64_t v11;

  v6 = a6;
  if (-[_MTLHeap type](self, "type") != 1)
    -[IOGPUMetalHeap newSubResourceAtOffset:withLength:alignment:options:].cold.1();
  v11 = *(_QWORD *)&self->_resource->_anon_50[88];
  if ((v6 & 0xF) != (unint64_t)(v11 & 0xF))
  {
    MTLCPUCacheModeString();
    MTLCPUCacheModeString();
    MTLReportFailure();
    v11 = *(_QWORD *)&self->_resource->_anon_50[88];
  }
  if (v6 >> 4 != (unint64_t)(v11 >> 4))
  {
    MTLStorageModeString();
    MTLStorageModeString();
    MTLReportFailure();
  }
  if (__CFADD__(a3, a4) || a3 + a4 > self->_size || ((a5 | a3) & (a5 - 1)) != 0)
    return 0;
  else
    return self->_resource;
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
  v3 = size - MTLRangeAllocatorGetFreeSize();
  pthread_mutex_unlock(p_mutex);
  return v3;
}

- (unint64_t)globalTraceObjectID
{
  return *(_QWORD *)&self->_resource->_anon_50[48];
}

- (IOGPUMetalHeap)initWithDevice:(id)a3 size:(unint64_t)a4 options:(unint64_t)a5 args:(IOGPUNewResourceArgs *)a6 argsSize:(unsigned int)a7
{
  return -[IOGPUMetalHeap initWithDevice:size:options:args:argsSize:desc:](self, "initWithDevice:size:options:args:argsSize:desc:", a3, a4, a5, a6, *(_QWORD *)&a7, 0);
}

- (void)setLabel:(id)a3
{
  void *v5;
  objc_super v6;

  v5 = (void *)MEMORY[0x212BDF02C](self, a2);
  -[IOGPUMetalResource setLabel:](self->_resource, "setLabel:", objc_msgSend(CFSTR("IOGPUMetalHeap"), "stringByAppendingFormat:", CFSTR(", \"%@\"), a3));
  objc_autoreleasePoolPop(v5);
  v6.receiver = self;
  v6.super_class = (Class)IOGPUMetalHeap;
  -[_MTLObjectWithLabel setLabel:](&v6, sel_setLabel_, a3);
}

- (void)dealloc
{
  objc_super v3;

  if (!-[_MTLHeap type](self, "type"))
    MTLRangeAllocatorDestroy();

  self->_device = 0;
  v3.receiver = self;
  v3.super_class = (Class)IOGPUMetalHeap;
  -[_MTLObjectWithLabel dealloc](&v3, sel_dealloc);
}

- (unint64_t)currentAllocatedSize
{
  return -[IOGPUMetalResource allocatedSize](self->_resource, "allocatedSize");
}

- (unint64_t)gpuAddress
{
  return -[IOGPUMetalResource gpuAddress](self->_resource, "gpuAddress");
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3
{
  uint64_t v6;
  void *v7;
  void *v8;

  if ((-[MTLDevice requiresRaytracingEmulation](self->_device, "requiresRaytracingEmulation") & 1) != 0)
  {
    if (-[_MTLHeap storageMode](self, "storageMode") != 2)
      MTLReportFailure();
    v6 = -[IOGPUMetalHeap newBufferWithLength:options:](self, "newBufferWithLength:options:", a3, -[_MTLHeap resourceOptions](self, "resourceOptions"));
    if (v6)
    {
      v7 = (void *)v6;
      v8 = (void *)-[MTLDevice newAccelerationStructureWithBuffer:offset:](self->_device, "newAccelerationStructureWithBuffer:offset:", v6, 0);

      return v8;
    }
  }
  else
  {
    -[IOGPUMetalHeap doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  }
  return 0;
}

- (id)newAccelerationStructureWithDescriptor:(id)a3
{
  if ((-[MTLDevice requiresRaytracingEmulation](self->_device, "requiresRaytracingEmulation") & 1) != 0)
  {
    if (-[_MTLHeap storageMode](self, "storageMode") != 2)
      MTLReportFailure();
    return -[IOGPUMetalHeap newAccelerationStructureWithSize:](self, "newAccelerationStructureWithSize:", -[MTLDevice heapAccelerationStructureSizeAndAlignWithDescriptor:](self->_device, "heapAccelerationStructureSizeAndAlignWithDescriptor:", a3));
  }
  else
  {
    -[IOGPUMetalHeap doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
    return 0;
  }
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3 offset:(unint64_t)a4
{
  id v8;
  void *v9;
  void *v10;

  if ((-[MTLDevice requiresRaytracingEmulation](self->_device, "requiresRaytracingEmulation") & 1) != 0)
  {
    if (-[_MTLHeap storageMode](self, "storageMode") != 2)
      MTLReportFailure();
    v8 = -[_MTLHeap newBufferWithLength:options:offset:](self, "newBufferWithLength:options:offset:", a3, -[_MTLHeap resourceOptions](self, "resourceOptions"), a4);
    if (v8)
    {
      v9 = v8;
      v10 = (void *)-[MTLDevice newAccelerationStructureWithBuffer:offset:](self->_device, "newAccelerationStructureWithBuffer:offset:", v8, 0);

      return v10;
    }
  }
  else
  {
    -[IOGPUMetalHeap doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  }
  return 0;
}

- (id)newAccelerationStructureWithDescriptor:(id)a3 offset:(unint64_t)a4
{
  if ((-[MTLDevice requiresRaytracingEmulation](self->_device, "requiresRaytracingEmulation") & 1) != 0)
  {
    if (-[_MTLHeap storageMode](self, "storageMode") != 2)
      MTLReportFailure();
    return -[IOGPUMetalHeap newAccelerationStructureWithSize:offset:](self, "newAccelerationStructureWithSize:offset:", -[MTLDevice heapAccelerationStructureSizeAndAlignWithDescriptor:](self->_device, "heapAccelerationStructureSizeAndAlignWithDescriptor:", a3), a4);
  }
  else
  {
    -[IOGPUMetalHeap doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
    return 0;
  }
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3 resourceIndex:(unint64_t)a4
{
  uint64_t v8;
  void *v9;
  void *v10;

  if ((-[MTLDevice requiresRaytracingEmulation](self->_device, "requiresRaytracingEmulation") & 1) != 0)
  {
    if (-[_MTLHeap storageMode](self, "storageMode") != 2)
      MTLReportFailure();
    v8 = -[IOGPUMetalHeap newBufferWithLength:options:](self, "newBufferWithLength:options:", a3, -[_MTLHeap resourceOptions](self, "resourceOptions"));
    if (v8)
    {
      v9 = (void *)v8;
      v10 = (void *)-[MTLDevice newAccelerationStructureWithBuffer:offset:resourceIndex:](self->_device, "newAccelerationStructureWithBuffer:offset:resourceIndex:", v8, 0, a4);

      return v10;
    }
  }
  else
  {
    -[IOGPUMetalHeap doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  }
  return 0;
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3 offset:(unint64_t)a4 resourceIndex:(unint64_t)a5
{
  id v10;
  void *v11;
  void *v12;

  if ((-[MTLDevice requiresRaytracingEmulation](self->_device, "requiresRaytracingEmulation") & 1) != 0)
  {
    if (-[_MTLHeap storageMode](self, "storageMode") != 2)
      MTLReportFailure();
    v10 = -[_MTLHeap newBufferWithLength:options:offset:](self, "newBufferWithLength:options:offset:", a3, -[_MTLHeap resourceOptions](self, "resourceOptions"), a4);
    if (v10)
    {
      v11 = v10;
      v12 = (void *)-[MTLDevice newAccelerationStructureWithBuffer:offset:resourceIndex:](self->_device, "newAccelerationStructureWithBuffer:offset:resourceIndex:", v10, 0, a5);

      return v12;
    }
  }
  else
  {
    -[IOGPUMetalHeap doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  }
  return 0;
}

- (BOOL)detachBacking
{
  return IOGPUResourceDetachBacking((uint64_t)-[IOGPUMetalResource resourceRef](self->_resource, "resourceRef")) == 0;
}

- (BOOL)replaceBackingWithRanges:(id)a3 readOnly:(BOOL)a4
{
  return IOGPUResourceReplaceBackingWithRanges((uint64_t)-[IOGPUMetalResource resourceRef](self->_resource, "resourceRef"), objc_msgSend(a3, "ranges"), objc_msgSend(a3, "count"), a4, 0, 0) == 0;
}

- (void)maxAvailableSizeWithAlignment:.cold.1()
{
  __assert_rtn("-[IOGPUMetalHeap maxAvailableSizeWithAlignment:]", "IOGPUMetalHeap.m", 62, "!(alignment & (alignment - 1))");
}

- (void)newSubResourceWithLength:alignment:options:offset:.cold.1()
{
  __assert_rtn("-[IOGPUMetalHeap newSubResourceWithLength:alignment:options:offset:]", "IOGPUMetalHeap.m", 195, "self.type == MTLHeapTypeAutomatic && \"Automatic suballocation only supported on automatic heap type\");
}

- (void)unpinMemoryAtOffset:withLength:.cold.1()
{
  __assert_rtn("-[IOGPUMetalHeap unpinMemoryAtOffset:withLength:]", "IOGPUMetalHeap.m", 238, "self.type == MTLHeapTypeAutomatic && \"Automatic suballocation only supported on automatic heap type\");
}

- (void)newSubResourceAtOffset:withLength:alignment:options:.cold.1()
{
  __assert_rtn("-[IOGPUMetalHeap newSubResourceAtOffset:withLength:alignment:options:]", "IOGPUMetalHeap.m", 278, "self.type == MTLHeapTypePlacement && \"Placement suballocation only supported on placement heap type\");
}

@end
