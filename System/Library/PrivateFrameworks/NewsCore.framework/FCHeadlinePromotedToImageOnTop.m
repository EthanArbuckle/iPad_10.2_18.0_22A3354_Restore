@implementation FCHeadlinePromotedToImageOnTop

uint64_t __FCHeadlinePromotedToImageOnTop_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setUsesImageOnTopLayout:", 1);
}

@end
