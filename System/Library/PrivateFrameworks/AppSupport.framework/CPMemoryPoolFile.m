@implementation CPMemoryPoolFile

- (CPMemoryPoolFile)initWithLabel:(const char *)a3 slotCount:(unint64_t)a4 slotLength:(unint64_t)a5
{
  CPMemoryPoolFile *v8;
  CPMemoryPoolFile *v9;
  unint64_t v10;
  const __CFAllocator *v11;
  __CFBitVector *Mutable;
  char *v13;
  const char *v14;
  int v15;
  int v16;
  int v17;
  int fd;
  char *v19;
  CFAllocatorContext context;
  objc_super v22;
  char __str[1024];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v22.receiver = self;
  v22.super_class = (Class)CPMemoryPoolFile;
  v8 = -[CPMemoryPoolFile init](&v22, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_fd = -1;
    v10 = (*MEMORY[0x1E0C85AD8] + a5 * a4 - 1) & -*MEMORY[0x1E0C85AD8];
    pthread_mutex_init(&v8->_mutex, 0);
    v9->_slots = (char *)-1;
    v9->_slotCount = a4;
    v9->_slotLength = a5;
    v11 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    Mutable = CFBitVectorCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a4);
    v9->_usedSlots = Mutable;
    CFBitVectorSetCount(Mutable, a4);
    context.version = 0;
    memset(&context.retain, 0, 40);
    context.info = v9;
    context.deallocate = (CFAllocatorDeallocateCallBack)__deallocatorCallback;
    context.preferredSize = 0;
    v9->_deallocator = CFAllocatorCreate(v11, &context);
    bzero(__str, 0x400uLL);
    v13 = getenv("TMPDIR");
    v14 = "/tmp";
    if (v13)
      v14 = v13;
    if (snprintf(__str, 0x400uLL, "%s/%s.XXXXXX", v14, a3) != -1)
    {
      v15 = mkstemp(__str);
      v9->_fd = v15;
      if ((v15 & 0x80000000) == 0)
      {
        if (ftruncate(v15, v10) == -1)
        {
          close(v9->_fd);
          v9->_fd = -1;
        }
        else
        {
          v16 = open(__str, 0);
          if (v16 != -1)
          {
            v17 = v16;
            v9->_slots = (char *)mmap(0, v10, 1, 1, v16, 0);
            close(v17);
          }
        }
        unlink(__str);
      }
    }
    if (v9->_slots == (char *)-1)
    {
      fd = v9->_fd;
      if (fd)
      {
        close(fd);
        v9->_fd = -1;
      }
      v19 = (char *)mmap(0, v10, 3, 4098, -1, 0);
      v9->_slots = v19;
      if (v19 == (char *)-1)
      {

        return 0;
      }
    }
  }
  return v9;
}

- (void)dealloc
{
  int fd;
  char *slots;
  __CFBitVector *usedSlots;
  __CFAllocator *deallocator;
  objc_super v7;

  pthread_mutex_destroy(&self->_mutex);
  fd = self->_fd;
  if (fd != -1)
    close(fd);
  slots = self->_slots;
  if ((unint64_t)(slots + 1) >= 2)
    munmap(slots, (*MEMORY[0x1E0C85AD8] + self->_slotLength * self->_slotCount - 1) & -*MEMORY[0x1E0C85AD8]);
  usedSlots = self->_usedSlots;
  if (usedSlots)
    CFRelease(usedSlots);
  deallocator = self->_deallocator;
  if (deallocator)
    CFRelease(deallocator);
  v7.receiver = self;
  v7.super_class = (Class)CPMemoryPoolFile;
  -[CPMemoryPoolFile dealloc](&v7, sel_dealloc);
}

- (id)nextSlotWithBytes:(const void *)a3 length:(unint64_t)a4
{
  __CFBitVector *usedSlots;
  CFIndex FirstIndexOfBit;
  CFIndex v9;
  unint64_t slotLength;
  char *slots;
  BOOL v12;
  void *v13;
  off_t v14;
  int fd;
  BOOL v16;
  CFDataRef v17;
  const __CFData *v18;
  CPMemoryPoolFile *v19;
  CFRange v21;

  if (self->_slotLength < a4)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CPMemoryPool.m"), 146, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("length <= _slotLength"));
  pthread_mutex_lock(&self->_mutex);
  usedSlots = self->_usedSlots;
  v21.length = CFBitVectorGetCount(usedSlots);
  v21.location = 0;
  FirstIndexOfBit = CFBitVectorGetFirstIndexOfBit(usedSlots, v21, 0);
  if (FirstIndexOfBit == -1)
    goto LABEL_19;
  v9 = FirstIndexOfBit;
  slotLength = self->_slotLength;
  CFBitVectorSetBitAtIndex(self->_usedSlots, FirstIndexOfBit, 1u);
  slots = self->_slots;
  v12 = &slots[(*MEMORY[0x1E0C85AD8] + self->_slotLength * self->_slotCount - 1) & -*MEMORY[0x1E0C85AD8]] > a3
     && (char *)a3 + a4 > slots;
  v13 = (void *)a3;
  if (v12)
  {
    v13 = malloc_type_malloc(a4, 0x1209CACCuLL);
    memcpy(v13, a3, a4);
  }
  v14 = slotLength * v9;
  fd = self->_fd;
  if (fd == -1)
  {
    memcpy(&self->_slots[v14], v13, a4);
    v16 = 1;
  }
  else
  {
    v16 = pwrite(fd, v13, a4, v14) >= 0;
  }
  if (v13 != a3)
    free(v13);
  if (!v16)
  {
    CFBitVectorSetBitAtIndex(self->_usedSlots, v9, 0);
    goto LABEL_19;
  }
  v17 = CFDataCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const UInt8 *)&self->_slots[v14], self->_slotLength, self->_deallocator);
  if (!v17)
  {
LABEL_19:
    v18 = 0;
    goto LABEL_20;
  }
  v18 = v17;
  v19 = self;
LABEL_20:
  pthread_mutex_unlock(&self->_mutex);
  return v18;
}

- (void)returnSlot:(void *)a3
{
  _opaque_pthread_mutex_t *p_mutex;

  p_mutex = &self->_mutex;
  pthread_mutex_lock(&self->_mutex);
  CFBitVectorSetBitAtIndex(self->_usedSlots, ((unint64_t)a3 - (unint64_t)self->_slots) / self->_slotLength, 0);
  pthread_mutex_unlock(p_mutex);

}

@end
