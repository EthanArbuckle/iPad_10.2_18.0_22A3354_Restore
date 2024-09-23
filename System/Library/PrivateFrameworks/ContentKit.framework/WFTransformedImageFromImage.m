@implementation WFTransformedImageFromImage

uint64_t __WFTransformedImageFromImage_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "drawInContext:inRect:");
}

@end
