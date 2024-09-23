@implementation _SFNavigationBarLabelsContainerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_SFNavigationBarLabelsContainer");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[_SFNavigationBarLabelsContainerAccessibility _accessibleSubviews:](self, "_accessibleSubviews:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x23491BE40]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
