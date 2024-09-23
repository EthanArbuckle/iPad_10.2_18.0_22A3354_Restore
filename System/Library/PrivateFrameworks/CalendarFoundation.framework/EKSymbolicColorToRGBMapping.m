@implementation EKSymbolicColorToRGBMapping

CFIndex __EKSymbolicColorToRGBMapping_block_invoke()
{
  const __CFArray *v0;
  CFIndex result;
  CFIndex i;
  __CFDictionary *v3;
  const void *v4;
  const void *ValueAtIndex;

  EKSymbolicColorToRGBMapping___symbolicColorNamesToRGB = (uint64_t)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  v0 = (const __CFArray *)EKGetDefaultCalendarColors();
  result = CFArrayGetCount(v0);
  if (result >= 1)
  {
    for (i = 0; i < result; ++i)
    {
      v3 = (__CFDictionary *)EKSymbolicColorToRGBMapping___symbolicColorNamesToRGB;
      v4 = *(&off_1E2A84CA0 + i);
      ValueAtIndex = CFArrayGetValueAtIndex(v0, i);
      CFDictionarySetValue(v3, v4, ValueAtIndex);
      result = CFArrayGetCount(v0);
    }
  }
  return result;
}

@end
