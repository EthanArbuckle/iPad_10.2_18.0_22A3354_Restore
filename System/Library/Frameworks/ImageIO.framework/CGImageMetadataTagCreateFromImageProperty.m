@implementation CGImageMetadataTagCreateFromImageProperty

uint64_t __CGImageMetadataTagCreateFromImageProperty_block_invoke(uint64_t a1, CFStringRef **a2, _BYTE *a3)
{
  uint64_t result;

  result = CFStringCompare(*(CFStringRef *)(a1 + 40), **a2, 0);
  if (!result)
  {
    result = CFStringCompare(*(CFStringRef *)(a1 + 48), *a2[1], 0);
    if (!result)
    {
      result = (uint64_t)CGImageMetadataTagCreate(*a2[3], 0, *a2[4], kCGImageMetadataTypeDefault, *(CFTypeRef *)(a1 + 56));
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
      *a3 = 1;
    }
  }
  return result;
}

@end
