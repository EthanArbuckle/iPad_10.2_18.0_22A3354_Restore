@implementation CFPDPurgeableBuffer

- (unint64_t)length
{
  return CFDataGetLength(self->handle);
}

- (void)bytes
{
  __assert_rtn("-[CFPDPurgeableBuffer bytes]", "CFPrefsBuffers.m", 450, "safe");
}

- (BOOL)purgable
{
  return !self->safe;
}

- (BOOL)beginAccessing
{
  BOOL result;
  uint64_t v4;
  const UInt8 *BytePtr;
  int v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (self->usedMalloc)
    return 1;
  if (self->safe)
    -[CFPDPurgeableBuffer beginAccessing].cold.1();
  v7 = 0;
  v4 = *MEMORY[0x1E0C83DA0];
  BytePtr = CFDataGetBytePtr(self->handle);
  v6 = MEMORY[0x186DB1338](v4, BytePtr, 0, &v7);
  result = (v6 | v7) == 0;
  self->safe = result;
  return result;
}

- (CFPDPurgeableBuffer)initWithFileDescriptor:(int)a3 size:(unint64_t)a4
{
  CFPDPurgeableBuffer *v6;
  CFPDPurgeableBuffer *v7;
  const void *v8;
  const UInt8 *Typed;
  UInt8 *v10;
  unint64_t *FixedMutableWithBuffer;
  __CFData *v12;
  UInt8 *MutableBytePtr;
  uint64_t v14;
  size_t v15;
  ssize_t v16;
  ssize_t v17;
  NSObject *v19;
  int v20;
  NSObject *v21;
  objc_super v22;
  CFAllocatorContext context;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (a3 < 0 || !a4)
  {

    return 0;
  }
  v22.receiver = self;
  v22.super_class = (Class)CFPDPurgeableBuffer;
  v6 = -[CFPDPurgeableBuffer init](&v22, sel_init);
  v7 = v6;
  if (v6)
  {
    if (a4 >= *MEMORY[0x1E0C85AD8] >> 2)
    {
      context.version = 0;
      context.info = v6;
      memset(&context.retain, 0, 24);
      context.allocate = (CFAllocatorAllocateCallBack)allocatePurgeable;
      context.reallocate = 0;
      context.deallocate = (CFAllocatorDeallocateCallBack)deallocatePurgeable;
      context.preferredSize = 0;
      v8 = CFAllocatorCreate((CFAllocatorRef)&__kCFAllocatorSystemDefault, &context);
      if (!v8)
        goto LABEL_20;
    }
    else
    {
      v8 = CFRetain(&__kCFAllocatorSystemDefault);
      v7->usedMalloc = 1;
      if (!v8)
        goto LABEL_20;
    }
    Typed = (const UInt8 *)CFAllocatorAllocateTyped(v8, a4, 4179223152, 0);
    if (Typed)
    {
      v10 = (UInt8 *)Typed;
      FixedMutableWithBuffer = _CFDataCreateFixedMutableWithBuffer(&__kCFAllocatorSystemDefault, a4, Typed, v8);
      if (FixedMutableWithBuffer)
      {
        v12 = (__CFData *)FixedMutableWithBuffer;
        CFRelease(v8);
        CFDataSetLength(v12, a4);
        MutableBytePtr = CFDataGetMutableBytePtr(v12);
        v14 = 0;
        v15 = a4;
        do
        {
          v16 = read(a3, &MutableBytePtr[v14], v15);
          v17 = v16;
          if (v16 == -1)
          {
            if (*__error() != 4)
            {
              v20 = *__error();
              bzero(&context, 0x400uLL);
              fcntl(a3, 50, &context);
              v21 = _CFPrefsDaemonLog();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
                -[CFPDPurgeableBuffer initWithFileDescriptor:size:].cold.2((uint64_t)&context, v20, v21);
              v7->handle = v12;
              goto LABEL_20;
            }
          }
          else
          {
            v14 += v16;
            v15 -= v16;
          }
        }
        while (v17);
        v7->handle = v12;
        if (v14 == a4)
        {
          v7->safe = 1;
          return v7;
        }
        bzero(&context, 0x400uLL);
        fcntl(a3, 50, &context);
        v19 = _CFPrefsDaemonLog();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
          -[CFPDPurgeableBuffer initWithFileDescriptor:size:].cold.1((uint64_t)&context, v19);
        goto LABEL_20;
      }
      CFAllocatorDeallocate((CFAllocatorRef)v8, v10);
    }
    CFRelease(v8);
LABEL_20:

    return 0;
  }
  return v7;
}

- (void)dealloc
{
  __CFData *handle;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  handle = self->handle;
  if (handle)
    CFRelease(handle);
  v4.receiver = self;
  v4.super_class = (Class)CFPDPurgeableBuffer;
  -[CFPDPurgeableBuffer dealloc](&v4, sel_dealloc);
}

- (CFPDPurgeableBuffer)initWithPropertyList:(void *)a3
{
  CFPDPurgeableBuffer *v4;
  CFPDPurgeableBuffer *v5;
  unint64_t *DataUsingExternalBufferAllocator;
  _QWORD v8[5];
  objc_super v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)CFPDPurgeableBuffer;
  v4 = -[CFPDPurgeableBuffer init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __44__CFPDPurgeableBuffer_initWithPropertyList___block_invoke;
    v8[3] = &unk_1E12E1678;
    v8[4] = v4;
    DataUsingExternalBufferAllocator = __CFBinaryPlistCreateDataUsingExternalBufferAllocator(a3, 0, 0, (uint64_t)v8, 0);
    if (DataUsingExternalBufferAllocator)
    {
      v5->handle = (__CFData *)DataUsingExternalBufferAllocator;
      v5->safe = 1;
    }
    else
    {

      return 0;
    }
  }
  return v5;
}

CFAllocatorRef __44__CFPDPurgeableBuffer_initWithPropertyList___block_invoke(uint64_t a1, unint64_t a2)
{
  void *v3;
  CFAllocatorContext v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (a2 >= *MEMORY[0x1E0C85AD8] >> 2)
  {
    v3 = *(void **)(a1 + 32);
    v4.version = 0;
    v4.info = v3;
    memset(&v4.retain, 0, 24);
    v4.allocate = (CFAllocatorAllocateCallBack)allocatePurgeable;
    v4.reallocate = 0;
    v4.deallocate = (CFAllocatorDeallocateCallBack)deallocatePurgeable;
    v4.preferredSize = 0;
    return CFAllocatorCreate((CFAllocatorRef)&__kCFAllocatorSystemDefault, &v4);
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 25) = 1;
    return (CFAllocatorRef)CFRetain(&__kCFAllocatorSystemDefault);
  }
}

- (void)endAccessing
{
  uint64_t v3;
  const UInt8 *BytePtr;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (!self->usedMalloc && self->safe)
  {
    v5 = 1;
    v3 = *MEMORY[0x1E0C83DA0];
    BytePtr = CFDataGetBytePtr(self->handle);
    MEMORY[0x186DB1338](v3, BytePtr, 0, &v5);
    self->safe = 0;
  }
}

- (void)initWithFileDescriptor:(uint64_t)a1 size:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 136380675;
  v3 = a1;
  _os_log_fault_impl(&dword_182A8C000, a2, OS_LOG_TYPE_FAULT, "read an unexpected amount of data from %{private}s. This likely means that someone wrote directly to that file behind cfprefsd's back, which is unsupported.", (uint8_t *)&v2, 0xCu);
}

- (void)initWithFileDescriptor:(NSObject *)a3 size:.cold.2(uint64_t a1, int __errnum, NSObject *a3)
{
  int v4;
  uint64_t v5;
  __int16 v6;
  char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = 136446466;
  v5 = a1;
  v6 = 2082;
  v7 = strerror(__errnum);
  _os_log_fault_impl(&dword_182A8C000, a3, OS_LOG_TYPE_FAULT, "couldn't read preferences file %{public}s due to %{public}s", (uint8_t *)&v4, 0x16u);
}

- (void)beginAccessing
{
  __assert_rtn("-[CFPDPurgeableBuffer beginAccessing]", "CFPrefsBuffers.m", 462, "!safe");
}

@end
