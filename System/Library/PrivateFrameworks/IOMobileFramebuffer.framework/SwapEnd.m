@implementation SwapEnd

void __benchmark_SwapEnd_block_invoke(uint64_t a1)
{
  const __CFAllocator *v2;
  CFMutableDictionaryRef Mutable;
  __CFDictionary *v4;
  uint64_t v5;
  unint64_t v6;
  CFStringRef v7;
  CFNumberRef v8;
  __CFDictionary *v9;
  uint64_t valuePtr;

  if (*(_QWORD *)(a1 + 32))
  {
    v2 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    if (Mutable)
    {
      v4 = Mutable;
      v5 = *(_QWORD *)(a1 + 40);
      if (!*(_DWORD *)(v5 + 1828))
      {
LABEL_10:
        (*(void (**)(void))(a1 + 32))();
        v9 = v4;
LABEL_14:
        CFRelease(v9);
        return;
      }
      v6 = 0;
      while (1)
      {
        v7 = CFStringCreateWithCString(v2, *(const char **)(*(_QWORD *)(v5 + 1816) + 8 * v6), 0x600u);
        valuePtr = 0;
        v8 = CFNumberCreate(v2, kCFNumberLongLongType, &valuePtr);
        v9 = v8;
        if (!v7 || v8 == 0)
          break;
        CFDictionarySetValue(v4, v7, v8);
        CFRelease(v9);
        CFRelease(v7);
        ++v6;
        v5 = *(_QWORD *)(a1 + 40);
        if (v6 >= *(unsigned int *)(v5 + 1828))
          goto LABEL_10;
      }
      CFRelease(v4);
      if (v7)
        CFRelease(v7);
      if (v9)
        goto LABEL_14;
    }
  }
}

@end
