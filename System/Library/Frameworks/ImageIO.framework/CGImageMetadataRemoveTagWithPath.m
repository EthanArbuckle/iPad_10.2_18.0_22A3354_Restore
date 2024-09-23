@implementation CGImageMetadataRemoveTagWithPath

void __CGImageMetadataRemoveTagWithPath_block_invoke(int a1, CFTypeRef cf, uint64_t a3)
{
  CFTypeID v5;
  const __CFString *v6;
  const __CFString *v7;

  if (cf)
  {
    v5 = CFGetTypeID(cf);
    if (v5 == CGImageMetadataTagGetTypeID())
    {
      v6 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("[%ld]"), a3);
      if (v6)
      {
        v7 = v6;
        CGImageMetadataTagSetName((uint64_t)cf, v6);
        CFRelease(v7);
      }
    }
  }
}

uint64_t __CGImageMetadataRemoveTagWithPath_block_invoke_2(uint64_t result, CFTypeRef cf, uint64_t a3, _BYTE *a4)
{
  uint64_t v7;
  CFTypeID v8;
  uint64_t v9;
  __int128 v10;
  _QWORD v11[4];
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;

  if (cf)
  {
    v7 = result;
    v8 = CFGetTypeID(cf);
    result = CGImageMetadataTagGetTypeID();
    if (v8 == result)
    {
      result = *(_QWORD *)(CGImageSourceGetSource((uint64_t)cf) + 56);
      if (result)
      {
        v11[0] = MEMORY[0x1E0C809B0];
        v11[1] = 0x40000000;
        v11[2] = __CGImageMetadataRemoveTagWithPath_block_invoke_3;
        v11[3] = &unk_1E1BC4DE8;
        v9 = *(_QWORD *)(v7 + 64);
        v14 = a3;
        v15 = v9;
        v10 = *(_OWORD *)(v7 + 48);
        v12 = *(_OWORD *)(v7 + 32);
        v13 = v10;
        result = IIOArrayEnumerateUsingBlock(result, (uint64_t)v11);
        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v7 + 40) + 8) + 24))
          *a4 = 1;
      }
    }
  }
  return result;
}

void __CGImageMetadataRemoveTagWithPath_block_invoke_3(uint64_t a1, const void *a2, uint64_t a3, _BYTE *a4)
{
  const __CFString *DefaultString;
  const __CFAllocator *v7;
  CFIndex Count;
  __CFArray *MutableCopy;
  const __CFString *v10;

  DefaultString = (const __CFString *)CGImageMetadataGetDefaultString(a2);
  if (CFStringCompare(DefaultString, *(CFStringRef *)(a1 + 48), 0) == kCFCompareEqualTo)
  {
    v7 = CFGetAllocator(*(CFTypeRef *)(a1 + 56));
    Count = CFArrayGetCount(*(CFArrayRef *)(a1 + 56));
    MutableCopy = CFArrayCreateMutableCopy(v7, Count, *(CFArrayRef *)(a1 + 56));
    if (MutableCopy)
    {
      v10 = (const __CFString *)MutableCopy;
      CFArrayRemoveValueAtIndex(MutableCopy, *(_QWORD *)(a1 + 64));
      IIOMetadata_Tag::setValue(*(IIOMetadata_Tag **)(a1 + 72), v10);
      CFRelease(*(CFTypeRef *)(a1 + 56));
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

void __CGImageMetadataRemoveTagWithPath_block_invoke_4(uint64_t a1, CFTypeRef cf, CFIndex a3)
{
  CFTypeID v6;
  uint64_t Source;

  if (cf)
  {
    v6 = CFGetTypeID(cf);
    if (v6 == CGImageMetadataTagGetTypeID())
    {
      Source = CGImageSourceGetSource((uint64_t)cf);
      if (CFStringCompare(*(CFStringRef *)(Source + 24), *(CFStringRef *)(a1 + 40), 0) == kCFCompareEqualTo
        && CFStringCompare(*(CFStringRef *)(Source + 32), *(CFStringRef *)(a1 + 48), 0) == kCFCompareEqualTo)
      {
        CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(a1 + 56), a3);
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
      }
    }
  }
}

@end
