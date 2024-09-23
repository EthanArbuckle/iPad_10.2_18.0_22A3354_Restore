@implementation CMPhotoDecompressionUtilityGetNativePixelFormatFromFormatDescription

uint64_t __CMPhotoDecompressionUtilityGetNativePixelFormatFromFormatDescription_block_invoke(uint64_t a1, _QWORD *a2)
{
  CFTypeRef v3;

  v3 = *(CFTypeRef *)(a1 + 32);
  if (v3)
    v3 = CFRetain(v3);
  *a2 = v3;
  return 0;
}

@end
