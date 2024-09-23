@implementation CFHTTPServerRequestCopyBodyStream

void *___CFHTTPServerRequestCopyBodyStream_block_invoke(uint64_t a1, uint64_t a2)
{
  const void *v3;
  void *result;

  v3 = *(const void **)(a2 + 128);
  if (v3)
    result = (void *)CFRetain(v3);
  else
    result = CFReadStreamCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const UInt8 *)"", 0, (CFAllocatorRef)*MEMORY[0x1E0C9AE20]);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
