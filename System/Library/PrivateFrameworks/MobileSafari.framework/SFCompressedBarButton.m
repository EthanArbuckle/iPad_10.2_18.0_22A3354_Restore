@implementation SFCompressedBarButton

uint64_t __41___SFCompressedBarButton_setHighlighted___block_invoke(uint64_t a1)
{
  double v1;

  v1 = 0.05;
  if (!*(_BYTE *)(a1 + 40))
    v1 = 0.0;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 752), "setAlpha:", v1);
}

@end
