@implementation MSVDYLDHandle

void ___MSVDYLDHandle_block_invoke_2(uint64_t a1)
{
  const void *v2;
  uint64_t v3;
  char *v4;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = CFDictionaryGetValue((CFDictionaryRef)__dlHandles, *(const void **)(a1 + 32));
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = dlopen((const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "fileSystemRepresentation"), 2);
    v2 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    if (v2)
    {
      CFDictionarySetValue((CFMutableDictionaryRef)__dlHandles, *(const void **)(a1 + 32), v2);
    }
    else
    {
      v3 = *(_QWORD *)(a1 + 32);
      v4 = dlerror();
      NSLog(CFSTR("Could not weak link for framework %@\n%s"), v3, v4);
    }
  }
}

void ___MSVDYLDHandle_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  __dlHandles = (uint64_t)CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9AEB8], 0);
  v0 = dispatch_queue_create(0, 0);
  v1 = (void *)__handlesQueue;
  __handlesQueue = (uint64_t)v0;

}

@end
