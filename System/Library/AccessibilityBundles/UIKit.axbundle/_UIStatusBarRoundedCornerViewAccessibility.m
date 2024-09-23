@implementation _UIStatusBarRoundedCornerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIStatusBarRoundedCornerView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "validateClass:", CFSTR("_UIStatusBarPillView"));
  objc_storeStrong(location, 0);
}

- (BOOL)_accessibilityViewIsVisible
{
  objc_super v3;
  SEL v4;
  _UIStatusBarRoundedCornerViewAccessibility *v5;

  v5 = self;
  v4 = a2;
  NSClassFromString(CFSTR("_UIStatusBarPillView"));
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v3.receiver = v5;
  v3.super_class = (Class)_UIStatusBarRoundedCornerViewAccessibility;
  return -[_UIStatusBarRoundedCornerViewAccessibility _accessibilityViewIsVisible](&v3, sel__accessibilityViewIsVisible);
}

@end
