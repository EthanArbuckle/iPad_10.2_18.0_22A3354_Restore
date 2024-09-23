@implementation UINavigationController(MobileSafariFrameworkExtras)

- (uint64_t)safari_prefersHalfHeightSheetPresentationWithLoweredBar
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "viewControllers");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safari_prefersHalfHeightSheetPresentationWithLoweredBar");

  return v3;
}

@end
