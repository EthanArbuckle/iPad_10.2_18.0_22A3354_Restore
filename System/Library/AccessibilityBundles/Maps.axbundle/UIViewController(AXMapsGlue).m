@implementation UIViewController(AXMapsGlue)

- (id)_accessibilityFirstNonGrabberElement
{
  void *v2;
  void *v3;
  void *v4;

  if (_accessibilityFirstNonGrabberElement_onceToken != -1)
    dispatch_once(&_accessibilityFirstNonGrabberElement_onceToken, &__block_literal_global_284);
  objc_msgSend(a1, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accessibilityLeafDescendantsWithCount:options:", 1, _accessibilityFirstNonGrabberElement_Options);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
