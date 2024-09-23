@implementation FULoadingViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("FULoadingView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  void *v2;
  int v3;

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_accessibilityViewIsVisible") ^ 1;

  return v3;
}

- (id)accessibilityLabel
{
  return 0;
}

@end
