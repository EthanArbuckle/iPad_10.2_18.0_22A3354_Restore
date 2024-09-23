@implementation AppStore_UIScrollViewAccessibility

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

  -[AppStore_UIScrollViewAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("AXHorizontalShelfView"));

  if ((v4 & 1) != 0)
    return 1;
  v6.receiver = self;
  v6.super_class = (Class)AppStore_UIScrollViewAccessibility;
  return -[AppStore_UIScrollViewAccessibility _accessibilityOnlyComparesByXAxis](&v6, sel__accessibilityOnlyComparesByXAxis);
}

@end
