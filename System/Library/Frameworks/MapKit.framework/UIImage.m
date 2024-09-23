@implementation UIImage

uint64_t __60__UIImage_MapKitExtras___mapkit_templateImageWithTintColor___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFill");
  UIRectFill(*(CGRect *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 40), "drawInRect:blendMode:alpha:", 22, *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), 1.0);
}

@end
