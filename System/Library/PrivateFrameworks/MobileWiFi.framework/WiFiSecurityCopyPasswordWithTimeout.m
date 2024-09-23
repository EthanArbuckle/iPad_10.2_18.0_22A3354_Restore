@implementation WiFiSecurityCopyPasswordWithTimeout

intptr_t __WiFiSecurityCopyPasswordWithTimeout_block_invoke(uint64_t a1)
{
  __CFDictionary *Query;
  __CFDictionary *v3;
  BOOL v4;
  const void *v5;
  CFTypeRef result;

  result = 0;
  Query = __WiFiSecurityCreateQuery(*(const void **)(a1 + 56), 0, 0, 0, 0, 1);
  v3 = Query;
  if (!Query || (!SecItemCopyMatching(Query, &result) ? (v4 = result == 0) : (v4 = 1), v4))
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
  else
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = CFStringCreateFromExternalRepresentation((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFDataRef)result, 0x8000100u);
  if (result)
  {
    CFRelease(result);
    result = 0;
  }
  if (v3)
    CFRelease(v3);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    v5 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    if (v5)
    {
      CFRelease(v5);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    }
  }
  CFRelease(*(CFTypeRef *)(a1 + 56));
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end
