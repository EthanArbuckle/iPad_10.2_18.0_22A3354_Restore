@implementation UIScrollViewAccessibility__Podcasts__UIKit

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIScrollView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityOnlyComparesByXAxis
{
  void *v3;
  char v4;
  objc_super v6;

  -[UIScrollViewAccessibility__Podcasts__UIKit accessibilityIdentifier](self, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("AXHorizontalShelfView"));

  if ((v4 & 1) != 0)
    return 1;
  v6.receiver = self;
  v6.super_class = (Class)UIScrollViewAccessibility__Podcasts__UIKit;
  return -[UIScrollViewAccessibility__Podcasts__UIKit _accessibilityOnlyComparesByXAxis](&v6, sel__accessibilityOnlyComparesByXAxis);
}

@end
