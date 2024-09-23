@implementation MFAACreateMatchingHashForCertChainFromHashLSB

uint64_t __MFAACreateMatchingHashForCertChainFromHashLSB_block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  size_t v4;
  CFStringRef *v5;
  const __CFAllocator *v6;
  const __CFString *v7;
  _QWORD v8[2];
  CFRange v9;

  v8[1] = *MEMORY[0x24BDAC8D0];
  result = CFDictionaryGetCount(*(CFDictionaryRef *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) + 64));
  if (result >= 1)
  {
    v3 = result;
    MEMORY[0x24BDAC7A8](result);
    v5 = (CFStringRef *)((char *)v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
    memset(v5, 170, v4);
    CFDictionaryGetKeysAndValues(*(CFDictionaryRef *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) + 64), (const void **)v5, 0);
    v6 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    while (1)
    {
      v7 = *v5;
      result = CFStringGetLength(*v5);
      if (result >= 2)
      {
        v9.length = 2;
        v9.location = result - 2;
        result = (uint64_t)CFStringCreateWithSubstring(v6, v7, v9);
        if (result)
        {
          result = CFStringCompare((CFStringRef)result, *(CFStringRef *)(a1 + 48), 1uLL);
          if (!result)
            break;
        }
      }
      ++v5;
      if (!--v3)
        return result;
    }
    result = (uint64_t)CFStringCreateCopy(v6, v7);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  }
  return result;
}

@end
