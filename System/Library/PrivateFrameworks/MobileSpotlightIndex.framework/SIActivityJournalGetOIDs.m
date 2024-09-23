@implementation SIActivityJournalGetOIDs

void ___SIActivityJournalGetOIDs_block_invoke(uint64_t a1, unsigned int *a2)
{
  uint64_t v2;
  int v5;
  unint64_t v6;
  unint64_t *Value;
  const void *v8;
  CFStringRef v9;
  CFStringRef v10;

  v2 = *a2;
  if (v2 > 0x36)
    return;
  if (((1 << v2) & 0xFE000F0007800) != 0)
  {
    v5 = 1;
    goto LABEL_4;
  }
  if (((1 << v2) & 0x40000000060000) != 0)
  {
    v5 = 0;
LABEL_4:
    v6 = *((_QWORD *)a2 + 3);
    if (v6)
    {
      Value = (unint64_t *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 40), (const void *)HIDWORD(v6));
      if (!Value)
      {
        v8 = (const void *)SIUINT64SetCreate();
        CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 40), (const void *)HIDWORD(v6), v8);
        CFRelease(v8);
        Value = (unint64_t *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 40), (const void *)HIDWORD(v6));
      }
      if (v5 == (*(_BYTE *)(a1 + 48) != 0))
        SIUINT64SetRemoveValue((uint64_t)Value, v6);
      else
        SIValueSet<unsigned long long>::SIValueSetInsert(Value + 2, v6);
    }
    return;
  }
  if (v2 == 23)
  {
    v9 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x1E0C9AE00], *((const char **)a2 + 4), 0x8000100u);
    if (v9)
    {
      v10 = v9;
      if (!CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 32), (const void *)(int)a2[7]))
        CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 32), (const void *)(int)a2[7], v10);
      CFRelease(v10);
    }
  }
}

@end
