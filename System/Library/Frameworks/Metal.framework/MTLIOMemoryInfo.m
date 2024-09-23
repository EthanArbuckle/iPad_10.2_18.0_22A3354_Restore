@implementation MTLIOMemoryInfo

+ (id)initialize
{
  if (initialize_been_here != -1)
    dispatch_once(&initialize_been_here, &__block_literal_global_11);
  return (id)_memoryInfo;
}

uint64_t __29__MTLIOMemoryInfo_initialize__block_invoke()
{
  uint64_t result;

  _memoryInfo = objc_alloc_init(MTLIOMemoryInfo);
  result = objc_msgSend((id)_memoryInfo, "addDataSource:", &__block_literal_global_2);
  *(_QWORD *)(_memoryInfo + 8) = result;
  return result;
}

uint64_t __29__MTLIOMemoryInfo_initialize__block_invoke_2()
{
  return objc_msgSend((id)_memoryInfo, "annotationList");
}

- (__CFArray)annotationList
{
  __CFArray *Mutable;
  MTLIOAccelResource *fResourceListHead;
  const __CFArray *v5;
  const __CFArray *v6;
  CFRange v8;

  Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
  fResourceListHead = self->fResourceListHead;
  os_unfair_lock_lock(&self->_memoryInfoLock);
  while (1)
  {
    fResourceListHead = fResourceListHead->next;
    if (fResourceListHead == self->fResourceListHead)
      break;
    v5 = -[MTLIOAccelResource copyAnnotations](fResourceListHead, "copyAnnotations");
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
  -[MTLIOMemoryInfo removeDataSource:](self, "removeDataSource:", self->memlist_key);
  -[MTLIOMemoryInfo dealloc](self, "dealloc");
}

- (MTLIOMemoryInfo)init
{
  MTLIOMemoryInfo *v2;
  MTLIOMemoryInfo *v3;
  MTLIOAccelResource *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTLIOMemoryInfo;
  v2 = -[MTLIOMemoryInfo init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_memoryInfoLock._os_unfair_lock_opaque = 0;
    v4 = objc_alloc_init(MTLIOAccelResource);
    v3->fResourceListHead = v4;
    v4->next = v4;
    v3->fResourceListHead->prev = v3->fResourceListHead;
  }
  return v3;
}

- (void)addResourceToList:(id)a3
{
  os_unfair_lock_s *p_memoryInfoLock;

  p_memoryInfoLock = &self->_memoryInfoLock;
  os_unfair_lock_lock(&self->_memoryInfoLock);
  *((_QWORD *)a3 + 35) = self->fResourceListHead;
  *((_QWORD *)a3 + 36) = self->fResourceListHead->prev;
  self->fResourceListHead->prev->next = (MTLIOAccelResource *)a3;
  self->fResourceListHead->prev = (MTLIOAccelResource *)a3;
  os_unfair_lock_unlock(p_memoryInfoLock);
}

- (void)removeResourceFromList:(id)a3
{
  os_unfair_lock_s *p_memoryInfoLock;

  p_memoryInfoLock = &self->_memoryInfoLock;
  os_unfair_lock_lock(&self->_memoryInfoLock);
  *(_QWORD *)(*((_QWORD *)a3 + 35) + 288) = *((_QWORD *)a3 + 36);
  *(_QWORD *)(*((_QWORD *)a3 + 36) + 280) = *((_QWORD *)a3 + 35);
  *((_QWORD *)a3 + 35) = 0;
  *((_QWORD *)a3 + 36) = 0;
  os_unfair_lock_unlock(p_memoryInfoLock);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLIOMemoryInfo;
  -[MTLIOMemoryInfo dealloc](&v3, sel_dealloc);
}

- (void)addDataSource:(id)a3
{
  return (void *)IOAccelMemoryInfoRegisterAPICollectionBlock();
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
