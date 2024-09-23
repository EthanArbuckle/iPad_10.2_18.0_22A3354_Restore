@implementation UITraitCollection(HUAdditions)

- (BOOL)hu_hasExtendedWidth
{
  return objc_msgSend(a1, "horizontalSizeClass") == 2 || objc_msgSend(a1, "verticalSizeClass") == 1;
}

@end
