@implementation CGImageMetadataSetValueMatchingImageProperty

void __CGImageMetadataSetValueMatchingImageProperty_block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  const __CFAllocator *v6;
  __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;

  if (CFStringCompare(*(CFStringRef *)(a1 + 40), **(CFStringRef **)a2, 0) == kCFCompareEqualTo
    && CFStringCompare(*(CFStringRef *)(a1 + 48), **(CFStringRef **)(a2 + 8), 0) == kCFCompareEqualTo)
  {
    v6 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v7 = CGImageMetadataDefaultPrefixForNamespace(**(const __CFString ***)(a2 + 24));
    v8 = CFStringCreateWithFormat(v6, 0, CFSTR("%@:%@"), v7, **(_QWORD **)(a2 + 32));
    if (v8)
    {
      v9 = v8;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = CGImageMetadataSetValueWithPath(*(CGMutableImageMetadataRef *)(a1 + 56), 0, v8, *(CFTypeRef *)(a1 + 64));
      CFRelease(v9);
    }
    *a3 = 1;
  }
}

@end
