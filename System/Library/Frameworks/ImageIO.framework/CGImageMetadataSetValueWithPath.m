@implementation CGImageMetadataSetValueWithPath

uint64_t __CGImageMetadataSetValueWithPath_block_invoke(uint64_t result, CFTypeRef cf, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  CFTypeID v7;
  uint64_t Source;

  if (cf)
  {
    v6 = result;
    v7 = CFGetTypeID(cf);
    result = CGImageMetadataTagGetTypeID();
    if (v7 == result)
    {
      Source = CGImageSourceGetSource((uint64_t)cf);
      result = CFStringCompare(*(CFStringRef *)(Source + 24), *(CFStringRef *)(v6 + 48), 0);
      if (!result)
      {
        result = CFStringCompare(*(CFStringRef *)(Source + 32), *(CFStringRef *)(v6 + 56), 0);
        if (!result)
        {
          result = (uint64_t)CFRetain(cf);
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v6 + 32) + 8) + 24) = result;
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v6 + 40) + 8) + 24) = 1;
          *a4 = 1;
        }
      }
    }
  }
  return result;
}

@end
