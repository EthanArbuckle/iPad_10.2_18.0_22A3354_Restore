@implementation CFBundleCreateMutableArrayOfFallbackLanguages

void *___CFBundleCreateMutableArrayOfFallbackLanguages_block_invoke(int a1, CFArrayRef theArray, uint64_t a3)
{
  CFIndex Count;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  CFIndex v10;
  char *v11;
  UInt8 *v12;
  const __CFString *ValueAtIndex;
  CFTypeID v14;
  uint64_t Length;
  CFRange v16;
  UInt8 *v17;
  CFIndex usedBufLen[2];

  usedBufLen[1] = *MEMORY[0x1E0C80C00];
  Count = CFArrayGetCount(theArray);
  if (!Count)
    return 0;
  v6 = Count;
  v7 = 157 * Count;
  v8 = (char *)malloc_type_malloc(157 * Count, 0xA1D4934EuLL);
  v9 = v8;
  if (v8 && v6 >= 1)
  {
    v10 = 0;
    v11 = &v8[v7];
    v12 = (UInt8 *)v8;
    do
    {
      ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(theArray, v10);
      v14 = CFGetTypeID(ValueAtIndex);
      if (v14 == CFStringGetTypeID())
      {
        usedBufLen[0] = 0;
        Length = CFStringGetLength(ValueAtIndex);
        if (Length >= 156)
          v16.length = 156;
        else
          v16.length = Length;
        v16.location = 0;
        if (CFStringGetBytes(ValueAtIndex, v16, 0x600u, 0, 0, v12, (CFIndex)&v11[~(unint64_t)v12], usedBufLen) != Length)
        {
          free(v9);
          return 0;
        }
        *(_QWORD *)(a3 + 8 * v10) = v12;
        v17 = &v12[usedBufLen[0]];
        *v17 = 0;
        v12 = v17 + 1;
      }
      ++v10;
    }
    while (v6 != v10);
  }
  return v9;
}

@end
