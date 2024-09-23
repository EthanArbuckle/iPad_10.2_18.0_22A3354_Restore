@implementation HUQuickControlStepperSegmentViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HUQuickControlStepperSegmentView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUQuickControlStepperSegmentView"), CFSTR("isSegmentViewHighlighted"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUQuickControlStepperSegmentView"), CFSTR("titleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("HUQuickControlContainerView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUQuickControlContainerView"), CFSTR("delegate"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUQuickControlContainerView"), CFSTR("summaryView"), "@", 0);

}

- (unint64_t)accessibilityTraits
{
  int v2;
  uint64_t v3;

  v2 = -[HUQuickControlStepperSegmentViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isSegmentViewHighlighted"));
  v3 = *MEMORY[0x24BDF7400];
  if (!v2)
    v3 = 0;
  return *MEMORY[0x24BDF7408] | *MEMORY[0x24BDF73B0] | v3;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[HUQuickControlStepperSegmentViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("titleLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  objc_super v6;

  if (-[HUQuickControlStepperSegmentViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isHighlighted")))
  {
    -[HUQuickControlStepperSegmentViewAccessibility _accessibilitySummaryView](self, "_accessibilitySummaryView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "accessibilityValue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    return v4;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)HUQuickControlStepperSegmentViewAccessibility;
    -[HUQuickControlStepperSegmentViewAccessibility accessibilityValue](&v6, sel_accessibilityValue);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)_accessibilityContainerView
{
  return (id)-[HUQuickControlStepperSegmentViewAccessibility _accessibilityFindAncestor:startWithSelf:](self, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_9, 0);
}

uint64_t __76__HUQuickControlStepperSegmentViewAccessibility__accessibilityContainerView__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  MEMORY[0x234911848](CFSTR("HUQuickControlContainerView"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)_accessibilitySummaryView
{
  void *v2;
  void *v3;

  -[HUQuickControlStepperSegmentViewAccessibility _accessibilityContainerView](self, "_accessibilityContainerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("summaryView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
