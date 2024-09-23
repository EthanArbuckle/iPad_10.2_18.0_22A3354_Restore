@implementation SBUIViewControllerWrapperViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIViewControllerWrapperView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:", CFSTR("SBTodayViewController"));
}

- (BOOL)_accessibilityInTodayViewController
{
  void *v2;
  BOOL v3;

  -[SBUIViewControllerWrapperViewAccessibility subviews](self, "subviews");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "indexOfObjectPassingTest:", &__block_literal_global_20) != 0x7FFFFFFFFFFFFFFFLL;

  return v3;
}

uint64_t __81__SBUIViewControllerWrapperViewAccessibility__accessibilityInTodayViewController__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  char isKindOfClass;

  objc_msgSend(a2, "_accessibilityViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("SBTodayViewController"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)shouldGroupAccessibilityChildren
{
  objc_super v4;

  if (-[SBUIViewControllerWrapperViewAccessibility _accessibilityInTodayViewController](self, "_accessibilityInTodayViewController"))
  {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)SBUIViewControllerWrapperViewAccessibility;
  return -[SBUIViewControllerWrapperViewAccessibility shouldGroupAccessibilityChildren](&v4, sel_shouldGroupAccessibilityChildren);
}

@end
