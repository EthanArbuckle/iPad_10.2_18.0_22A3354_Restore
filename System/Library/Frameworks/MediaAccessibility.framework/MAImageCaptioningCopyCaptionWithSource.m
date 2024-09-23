@implementation MAImageCaptioningCopyCaptionWithSource

BOOL __MAImageCaptioningCopyCaptionWithSource_block_invoke(uint64_t a1, CFTypeRef cf1, uint64_t a3)
{
  int v5;

  v5 = CFEqual(cf1, *(CFTypeRef *)(a1 + 40));
  if (v5)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a3;
    CFRetain(*(CFTypeRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
  }
  return v5 == 0;
}

@end
