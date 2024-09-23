@implementation UIButton

uint64_t __54__UIButton_Camera__selectedByAccessibilityHUDManager___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isTracking");
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "setHighlighted:", 0);
  return result;
}

@end
