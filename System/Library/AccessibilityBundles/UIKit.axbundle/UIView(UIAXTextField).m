@implementation UIView(UIAXTextField)

- (double)_accessibilityFontSize
{
  double v1;
  id v3;
  double v4;

  v3 = (id)objc_msgSend(a1, "font");
  objc_msgSend(v3, "pointSize");
  v4 = v1;

  return v4;
}

@end
