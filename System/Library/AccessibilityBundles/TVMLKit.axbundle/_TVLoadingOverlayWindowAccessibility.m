@implementation _TVLoadingOverlayWindowAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_TVLoadingOverlayWindow");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityCanBeConsideredAsMainWindow
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  objc_opt_class();
  -[_TVLoadingOverlayWindowAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("subviews"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "count") != 1)
    _AXAssert();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_accessibilityViewIsVisible");

  return v6;
}

@end
