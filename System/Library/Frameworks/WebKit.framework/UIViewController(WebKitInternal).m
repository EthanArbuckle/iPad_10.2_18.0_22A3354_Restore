@implementation UIViewController(WebKitInternal)

- (uint64_t)_wk_isInFullscreenPresentation
{
  uint64_t result;

  result = objc_msgSend(a1, "activePresentationController");
  if (result)
    return objc_msgSend(a1, "modalPresentationStyle") == 0;
  return result;
}

@end
