@implementation CFBinaryPlistCreateObjectFiltered

BOOL ____CFBinaryPlistCreateObjectFiltered_block_invoke(uint64_t a1, int8x16_t *a2, CFIndex a3)
{
  _QWORD *v4;
  uint64_t v5;
  const __CFAllocator *v6;
  const __CFString *v8;
  CFStringRef v9;
  CFMutableStringRef MutableCopy;
  CFStringRef v12;
  uint64_t v13;
  const __CFString *v14;
  __CFDictionary *v15;

  v4 = *(_QWORD **)(a1 + 32);
  if (v4)
    *v4 = 7;
  if (!*(_QWORD *)(a1 + 40))
    return 1;
  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(const __CFAllocator **)(a1 + 64);
  if (v5 != 2 && *(_QWORD *)(a1 + 56) >> 31 == 0)
  {
    v12 = CFStringCreateWithBytes(v6, (const UInt8 *)a2, a3, 0x600u, 0);
    v9 = v12;
    if (v12)
    {
      if (*(_QWORD *)(a1 + 72))
      {
        if (malloc_size(v12))
        {
          v13 = __NSCreateBPlistMappedString();
          if (v13)
          {
            v14 = (const __CFString *)v13;
            CFRelease(v9);
            v9 = v14;
          }
        }
      }
      v15 = *(__CFDictionary **)(a1 + 88);
      if (v15)
        CFDictionarySetValue(v15, *(const void **)(a1 + 96), v9);
    }
  }
  else
  {
    v8 = (const __CFString *)_CFStringCreateWithBytesNoCopyDisallowROM((__objc2_class **)v6, a2, a3, 1536, 0, (const __CFAllocator *)&__kCFAllocatorNull);
    v9 = v8;
    if (v5 == 2)
    {
      if (v8)
      {
        MutableCopy = CFStringCreateMutableCopy(*(CFAllocatorRef *)(a1 + 64), 0, v8);
        CFRelease(v9);
        v9 = MutableCopy;
      }
    }
  }
  **(_QWORD **)(a1 + 40) = v9;
  return v9 != 0;
}

BOOL ____CFBinaryPlistCreateObjectFiltered_block_invoke_2(uint64_t a1, int8x16_t *a2, CFIndex a3)
{
  _QWORD *v4;
  uint64_t v5;
  const __CFAllocator *v6;
  const __CFString *v8;
  CFStringRef v9;
  CFMutableStringRef MutableCopy;
  CFStringRef v12;
  uint64_t v13;
  const __CFString *v14;
  __CFDictionary *v15;

  v4 = *(_QWORD **)(a1 + 32);
  if (v4)
    *v4 = 7;
  if (!*(_QWORD *)(a1 + 40))
    return 1;
  if (a3)
  {
    if (a3 < 0)
      return 0;
    a3 *= 2;
  }
  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(const __CFAllocator **)(a1 + 64);
  if (v5 != 2 && *(_QWORD *)(a1 + 56) >> 31 == 0)
  {
    v12 = CFStringCreateWithBytes(v6, (const UInt8 *)a2, a3, 0x10000100u, 0);
    v9 = v12;
    if (v12)
    {
      if (*(_QWORD *)(a1 + 72))
      {
        if (malloc_size(v12))
        {
          v13 = __NSCreateBPlistMappedString();
          if (v13)
          {
            v14 = (const __CFString *)v13;
            CFRelease(v9);
            v9 = v14;
          }
        }
      }
      v15 = *(__CFDictionary **)(a1 + 88);
      if (v15)
        CFDictionarySetValue(v15, *(const void **)(a1 + 96), v9);
    }
  }
  else
  {
    v8 = (const __CFString *)_CFStringCreateWithBytesNoCopyDisallowROM((__objc2_class **)v6, a2, a3, 268435712, 0, (const __CFAllocator *)&__kCFAllocatorNull);
    v9 = v8;
    if (v5 == 2)
    {
      if (v8)
      {
        MutableCopy = CFStringCreateMutableCopy(*(CFAllocatorRef *)(a1 + 64), 0, v8);
        CFRelease(v9);
        v9 = MutableCopy;
      }
    }
  }
  **(_QWORD **)(a1 + 40) = v9;
  return v9 != 0;
}

@end
