@implementation SUUICrossFadingTabBarAcccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SUUICrossFadingTabBar");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:isKindOfClass:", CFSTR("SUUICrossFadingTabBar"), CFSTR("UIView"));
}

- (int64_t)accessibilityContainerType
{
  return 4;
}

- (id)_accessibilityHitTestSubviews
{
  void *v2;
  void *v3;

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accessibleSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
