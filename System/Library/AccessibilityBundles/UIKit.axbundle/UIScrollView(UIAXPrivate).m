@implementation UIScrollView(UIAXPrivate)

- (double)_accessibilityContentSize
{
  double v1;
  id v3;
  double v4;

  v3 = (id)objc_msgSend(a1, "safeValueForKey:", CFSTR("_contentSize"));
  objc_msgSend(v3, "sizeValue");
  v4 = v1;

  return v4;
}

@end
