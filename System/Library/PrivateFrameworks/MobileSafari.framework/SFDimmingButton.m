@implementation SFDimmingButton

uint64_t __35___SFDimmingButton_setHighlighted___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_updateImageAlpha");
  return objc_msgSend(*(id *)(a1 + 32), "_updateBackgroundColor");
}

@end
