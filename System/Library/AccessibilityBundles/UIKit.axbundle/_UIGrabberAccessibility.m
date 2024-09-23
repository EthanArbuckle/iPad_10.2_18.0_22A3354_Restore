@implementation _UIGrabberAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIGrabber");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (CGPoint)_accessibilityVisiblePoint
{
  double v2;
  double v3;
  CGPoint result;

  -[_UIGrabberAccessibility accessibilityFrame](self, "accessibilityFrame");
  AX_CGRectGetCenter();
  result.y = v3;
  result.x = v2;
  return result;
}

- (id)accessibilityLabel
{
  id v2;
  id v3;
  id v5;
  objc_super v6;
  id v7[3];

  v7[2] = self;
  v7[1] = (id)a2;
  v6.receiver = self;
  v6.super_class = (Class)_UIGrabberAccessibility;
  v7[0] = -[_UIGrabberAccessibility accessibilityLabel](&v6, sel_accessibilityLabel);
  if (!objc_msgSend(v7[0], "length"))
  {
    v2 = accessibilityLocalizedString(CFSTR("sheet.grabber"));
    v3 = v7[0];
    v7[0] = v2;

  }
  v5 = v7[0];
  objc_storeStrong(v7, 0);
  return v5;
}

@end
