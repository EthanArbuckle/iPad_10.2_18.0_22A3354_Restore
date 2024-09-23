@implementation ARUIColorForCurrentContrastMode

id __ARUIColorForCurrentContrastMode_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = objc_msgSend(a2, "accessibilityContrast");
  v4 = 40;
  if (v3 == 1)
    v4 = 32;
  return *(id *)(a1 + v4);
}

@end
