@implementation _SFToolbarAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_SFToolbar");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:", CFSTR("_SFNavigationBar"));
}

- (BOOL)shouldGroupAccessibilityChildren
{
  void *v3;
  objc_super v5;

  -[_SFToolbarAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", MEMORY[0x23491BE1C](CFSTR("_SFNavigationBar"), a2));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    return 0;
  v5.receiver = self;
  v5.super_class = (Class)_SFToolbarAccessibility;
  return -[_SFToolbarAccessibility shouldGroupAccessibilityChildren](&v5, sel_shouldGroupAccessibilityChildren);
}

- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild
{
  void *v3;
  objc_super v5;

  -[_SFToolbarAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", MEMORY[0x23491BE1C](CFSTR("_SFNavigationBar"), a2));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    return 0;
  v5.receiver = self;
  v5.super_class = (Class)_SFToolbarAccessibility;
  return -[_SFToolbarAccessibility _accessibilityHitTestShouldFallbackToNearestChild](&v5, sel__accessibilityHitTestShouldFallbackToNearestChild);
}

- (unint64_t)accessibilityTraits
{
  void *v3;
  objc_super v5;

  -[_SFToolbarAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", MEMORY[0x23491BE1C](CFSTR("_SFNavigationBar"), a2));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    return *MEMORY[0x24BDF73E0];
  v5.receiver = self;
  v5.super_class = (Class)_SFToolbarAccessibility;
  return -[_SFToolbarAccessibility accessibilityTraits](&v5, sel_accessibilityTraits);
}

@end
