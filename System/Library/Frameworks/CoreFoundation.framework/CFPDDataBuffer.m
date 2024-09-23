@implementation CFPDDataBuffer

- (void)quicklyValidatePlistAndOnFailureInvokeBlock:(id)a3
{
  const char *v5;
  CFDataRef v6;
  NSObject *v7;

  if (-[CFPDDataBuffer length](self, "length") < 8
    || (v5 = -[CFPDDataBuffer bytes](self, "bytes"), strncmp(v5, "bplist00", 8uLL)) && strncmp(v5, "<?xml", 5uLL))
  {
    (*((void (**)(id))a3 + 2))(a3);
    v6 = CFDataCreateWithBytesNoCopy((CFAllocatorRef)&__kCFAllocatorSystemDefault, (const UInt8 *)-[CFPDDataBuffer bytes](self, "bytes"), -[CFPDDataBuffer length](self, "length"), (CFAllocatorRef)&__kCFAllocatorNull);
    if (os_variant_has_internal_diagnostics())
    {
      v7 = os_log_create("com.apple.defaults", "diagnostics");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[CFPDDataBuffer quicklyValidatePlistAndOnFailureInvokeBlock:].cold.1((uint64_t)v6, v7);

    }
    CFRelease(v6);
  }
}

- (id)copyXPCData
{
  return xpc_data_create(-[CFPDDataBuffer bytes](self, "bytes"), -[CFPDDataBuffer length](self, "length"));
}

+ (id)newBufferFromFile:(int)a3 allowMappingIfSafe:(BOOL)a4
{
  uint64_t v4;
  int v5;
  id result;
  CFPDPurgeableBuffer *v7;
  stat v8;
  uint64_t v9;

  v4 = *(_QWORD *)&a3;
  v9 = *MEMORY[0x1E0C80C00];
  memset(&v8, 0, sizeof(v8));
  v5 = fstat(a3, &v8);
  result = 0;
  if (!v5 && v8.st_size >= 1)
  {
    v7 = [CFPDPurgeableBuffer alloc];
    return -[CFPDPurgeableBuffer initWithFileDescriptor:size:](v7, "initWithFileDescriptor:size:", v4, v8.st_size);
  }
  return result;
}

+ (id)newBufferFromPropertyList:(void *)a3
{
  return -[CFPDPurgeableBuffer initWithPropertyList:]([CFPDPurgeableBuffer alloc], "initWithPropertyList:", a3);
}

- (void)copyPropertyListWithMutability:(unint64_t)a3 error:(__CFError *)a4
{
  const __CFData *v6;
  CFPropertyListRef v7;
  NSObject *v8;

  v6 = CFDataCreateWithBytesNoCopy((CFAllocatorRef)&__kCFAllocatorSystemDefault, (const UInt8 *)-[CFPDDataBuffer bytes](self, "bytes"), -[CFPDDataBuffer length](self, "length"), (CFAllocatorRef)&__kCFAllocatorNull);
  v7 = CFPropertyListCreateWithData((CFAllocatorRef)&__kCFAllocatorSystemDefault, v6, a3, 0, a4);
  CFRelease(v6);
  if (v7 && CFGetTypeID(v7) != 18)
  {
    v8 = _CFPrefsDaemonLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[CFPDDataBuffer copyPropertyListWithMutability:error:].cold.1(v8);
    CFRelease(v7);
    v7 = 0;
    if (a4)
      *a4 = 0;
  }
  return (void *)v7;
}

- (BOOL)validatePlist
{
  const __CFData *v2;
  char v3;
  BOOL v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v2 = CFDataCreateWithBytesNoCopy((CFAllocatorRef)&__kCFAllocatorSystemDefault, (const UInt8 *)-[CFPDDataBuffer bytes](self, "bytes"), -[CFPDDataBuffer length](self, "length"), (CFAllocatorRef)&__kCFAllocatorNull);
  v6[0] = 0;
  v3 = _CFPropertyListValidateData(v2, v6);
  if (v6[0] == 18)
    v4 = v3;
  else
    v4 = 0;
  CFRelease(v2);
  return v4;
}

+ (id)newBufferFromCFData:(__CFData *)a3
{
  return -[CFPDCFDataBuffer initWithCFData:]([CFPDCFDataBuffer alloc], "initWithCFData:", a3);
}

- (void)bytes
{
  abort();
}

- (unint64_t)length
{
  abort();
}

- (__CFData)copyCFData
{
  return CFDataCreate((CFAllocatorRef)&__kCFAllocatorSystemDefault, (const UInt8 *)-[CFPDDataBuffer bytes](self, "bytes"), -[CFPDDataBuffer length](self, "length"));
}

- (BOOL)beginAccessing
{
  return 1;
}

- (BOOL)purgable
{
  return 0;
}

- (void)copyPropertyListWithMutability:(os_log_t)log error:.cold.1(os_log_t log)
{
  uint8_t v1[8];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_182A8C000, log, OS_LOG_TYPE_ERROR, "Found non-dictionary property list, which is invalid for preferences. Ignoring it.", v1, 2u);
}

- (void)quicklyValidatePlistAndOnFailureInvokeBlock:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_182A8C000, a2, OS_LOG_TYPE_ERROR, "bad plist data: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
