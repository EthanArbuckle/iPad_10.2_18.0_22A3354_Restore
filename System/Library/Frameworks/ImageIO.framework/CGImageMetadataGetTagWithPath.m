@implementation CGImageMetadataGetTagWithPath

uint64_t __CGImageMetadataGetTagWithPath_block_invoke(uint64_t result, CFTypeRef cf, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  CFTypeID v7;
  const __CFArray *v8;
  uint64_t v9;
  CFIndex v10;
  const void *ValueAtIndex;
  const __CFString *DefaultString;

  if (cf)
  {
    v6 = result;
    v7 = CFGetTypeID(cf);
    result = CGImageMetadataTagGetTypeID();
    if (v7 == result)
    {
      result = CGImageSourceGetSource((uint64_t)cf);
      v8 = *(const __CFArray **)(result + 56);
      if (v8)
      {
        result = CFArrayGetCount(*(CFArrayRef *)(result + 56));
        if (result >= 1)
        {
          v9 = result;
          v10 = 0;
          while (1)
          {
            ValueAtIndex = CFArrayGetValueAtIndex(v8, v10);
            DefaultString = (const __CFString *)CGImageMetadataGetDefaultString(ValueAtIndex);
            result = CFStringCompare(DefaultString, *(CFStringRef *)(v6 + 48), 0);
            if (!result)
              break;
            if (v9 == ++v10)
              goto LABEL_10;
          }
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v6 + 32) + 8) + 24) = cf;
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v6 + 40) + 8) + 24) = 1;
        }
LABEL_10:
        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v6 + 40) + 8) + 24))
          *a4 = 1;
      }
    }
  }
  return result;
}

uint64_t __CGImageMetadataGetTagWithPath_block_invoke_2(uint64_t result, CFTypeRef cf)
{
  uint64_t v3;
  CFTypeID v4;
  uint64_t Source;

  if (cf)
  {
    v3 = result;
    v4 = CFGetTypeID(cf);
    result = CGImageMetadataTagGetTypeID();
    if (v4 == result)
    {
      Source = CGImageSourceGetSource((uint64_t)cf);
      result = CFStringCompare(*(CFStringRef *)(Source + 24), *(CFStringRef *)(v3 + 40), 0);
      if (!result)
      {
        result = CFStringCompare(*(CFStringRef *)(Source + 32), *(CFStringRef *)(v3 + 48), 0);
        if (!result)
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v3 + 32) + 8) + 24) = cf;
      }
    }
  }
  return result;
}

@end
