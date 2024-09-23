@implementation UIWindow(BannerKitAdditions)

- (BOOL)_bn_isRotating
{
  uint64_t v2;

  v2 = objc_msgSend(a1, "_fromWindowOrientation");
  return v2 != objc_msgSend(a1, "_toWindowOrientation");
}

@end
