@implementation IOGPUMemoryInfo

- (void)addResourceToList:(id)a3
{
  os_unfair_lock_s *p_memoryInfoLock;

  p_memoryInfoLock = &self->_memoryInfoLock;
  os_unfair_lock_lock(&self->_memoryInfoLock);
  *((_QWORD *)a3 + 32) = self->fResourceListHead;
  *((_QWORD *)a3 + 33) = self->fResourceListHead->prev;
  self->fResourceListHead->prev->next = (IOGPUMetalResource *)a3;
  self->fResourceListHead->prev = (IOGPUMetalResource *)a3;
  os_unfair_lock_unlock(p_memoryInfoLock);
}

- (void)removeResourceFromList:(id)a3
{
  os_unfair_lock_s *p_memoryInfoLock;

  p_memoryInfoLock = &self->_memoryInfoLock;
  os_unfair_lock_lock(&self->_memoryInfoLock);
  *(_QWORD *)(*((_QWORD *)a3 + 32) + 264) = *((_QWORD *)a3 + 33);
  *(_QWORD *)(*((_QWORD *)a3 + 33) + 256) = *((_QWORD *)a3 + 32);
  *((_QWORD *)a3 + 32) = 0;
  *((_QWORD *)a3 + 33) = 0;
  os_unfair_lock_unlock(p_memoryInfoLock);
}

+ (id)initialize
{
  if (initialize_been_here != -1)
    dispatch_once(&initialize_been_here, &__block_literal_global_2);
  return (id)_ioGPUMemoryInfo;
}

uint64_t __29__IOGPUMemoryInfo_initialize__block_invoke()
{
  uint64_t result;

  _ioGPUMemoryInfo = objc_alloc_init(IOGPUMemoryInfo);
  result = objc_msgSend((id)_ioGPUMemoryInfo, "addDataSource:", &__block_literal_global_2_0);
  *(_QWORD *)(_ioGPUMemoryInfo + 8) = result;
  return result;
}

- (IOGPUMemoryInfo)init
{
  IOGPUMemoryInfo *v2;
  IOGPUMemoryInfo *v3;
  IOGPUMetalResource *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IOGPUMemoryInfo;
  v2 = -[IOGPUMemoryInfo init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_memoryInfoLock._os_unfair_lock_opaque = 0;
    v4 = objc_alloc_init(IOGPUMetalResource);
    v3->fResourceListHead = v4;
    v4->next = v4;
    v3->fResourceListHead->prev = v3->fResourceListHead;
  }
  return v3;
}

- (void)addDataSource:(id)a3
{
  return (void *)IOAccelMemoryInfoRegisterAPICollectionBlock();
}

uint64_t __29__IOGPUMemoryInfo_initialize__block_invoke_2()
{
  return objc_msgSend((id)_ioGPUMemoryInfo, "annotationList");
}

- (__CFArray)annotationList
{
  __CFArray *Mutable;
  IOGPUMetalResource *fResourceListHead;
  const __CFArray *v5;
  const __CFArray *v6;
  CFRange v8;

  Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
  fResourceListHead = self->fResourceListHead;
  os_unfair_lock_lock(&self->_memoryInfoLock);
  while (1)
  {
    fResourceListHead = fResourceListHead->next;
    if (fResourceListHead == self->fResourceListHead)
      break;
    v5 = -[IOGPUMetalResource copyAnnotations](fResourceListHead, "copyAnnotations");
    if (v5)
    {
      v6 = v5;
      v8.length = CFArrayGetCount(v5);
      v8.location = 0;
      CFArrayAppendArray(Mutable, v6, v8);
      CFRelease(v6);
    }
  }
  os_unfair_lock_unlock(&self->_memoryInfoLock);
  return Mutable;
}

- (void)shutdown
{
  -[IOGPUMemoryInfo removeDataSource:](self, "removeDataSource:", self->memlist_key);
  -[IOGPUMemoryInfo dealloc](self, "dealloc");
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IOGPUMemoryInfo;
  -[IOGPUMemoryInfo dealloc](&v3, sel_dealloc);
}

- (void)removeDataSource:(void *)a3
{
  IOAccelMemoryInfoDeregisterAPICollectionBlock();
}

- (void)lock
{
  os_unfair_lock_lock(&self->_memoryInfoLock);
}

- (void)unlock
{
  os_unfair_lock_unlock(&self->_memoryInfoLock);
}

@end
