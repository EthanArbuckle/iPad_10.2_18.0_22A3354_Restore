@implementation HUQuickControlSummaryNavigationBarTitleViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HUQuickControlSummaryNavigationBarTitleView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUQuickControlSummaryNavigationBarTitleView"), CFSTR("summaryView"), "@", 0);
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[HUQuickControlSummaryNavigationBarTitleViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("summaryView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;

  -[HUQuickControlSummaryNavigationBarTitleViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("summaryView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
