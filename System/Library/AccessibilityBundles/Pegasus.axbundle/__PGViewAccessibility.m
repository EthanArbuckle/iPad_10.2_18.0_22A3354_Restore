@implementation __PGViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("__PGView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:", CFSTR("PGButtonView"));
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("pip.video.background.view.label"));
}

- (id)_accessibilitySupplementaryFooterViews
{
  return (id)-[__PGViewAccessibility _accessibilityFindSubviewDescendantsPassingTest:](self, "_accessibilityFindSubviewDescendantsPassingTest:", &__block_literal_global_0);
}

@end
