@implementation WiFiSecurityCopyNonSyncablePasswordWithTimeout

intptr_t __WiFiSecurityCopyNonSyncablePasswordWithTimeout_block_invoke(uint64_t a1)
{
  const __CFAllocator *v2;
  __CFDictionary *Mutable;
  __CFDictionary *v4;
  const void *v5;
  BOOL v6;
  const void *v7;
  CFTypeRef result;

  result = 0;
  v2 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, 0);
  v4 = Mutable;
  if (!Mutable
    || ((CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0CD6C98], (const void *)*MEMORY[0x1E0CD6CA8]),
         CFDictionarySetValue(v4, (const void *)*MEMORY[0x1E0CD68F8], *(const void **)(a1 + 56)),
         CFDictionarySetValue(v4, (const void *)*MEMORY[0x1E0CD6B58], CFSTR("AirPort")),
         v5 = (const void *)*MEMORY[0x1E0C9AE50],
         CFDictionarySetValue(v4, (const void *)*MEMORY[0x1E0CD70C0], (const void *)*MEMORY[0x1E0C9AE50]),
         CFDictionarySetValue(v4, (const void *)*MEMORY[0x1E0CD7018], v5),
         !SecItemCopyMatching(v4, &result))
      ? (v6 = result == 0)
      : (v6 = 1),
        v6))
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = CFStringCreateFromExternalRepresentation(v2, (CFDataRef)result, 0x8000100u);
  }
  if (result)
  {
    CFRelease(result);
    result = 0;
  }
  if (v4)
    CFRelease(v4);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    v7 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    if (v7)
    {
      CFRelease(v7);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    }
  }
  CFRelease(*(CFTypeRef *)(a1 + 56));
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end
