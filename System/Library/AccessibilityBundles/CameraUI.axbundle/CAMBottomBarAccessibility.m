@implementation CAMBottomBarAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CAMBottomBar");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityOnlyComparesByXAxis
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  if ((AXDeviceIsPad() & 1) != 0 || (AXDeviceIsTallPhoneIdiom() & 1) != 0)
    return 0;
  if (!AXDeviceIsPhone())
    return 1;
  -[CAMBottomBarAccessibility _accessibilityWindow](self, "_accessibilityWindow");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "windowScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "interfaceOrientation");

  return (unint64_t)(v7 - 1) < 2;
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

@end
