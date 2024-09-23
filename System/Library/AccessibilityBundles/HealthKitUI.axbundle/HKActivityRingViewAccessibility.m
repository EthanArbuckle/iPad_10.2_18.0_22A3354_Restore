@implementation HKActivityRingViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HKActivityRingView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HKActivityRingView"), CFSTR("activitySummary"), "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilityHealthKitUILocalizedString(CFSTR("activity.rings"));
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;

  -[HKActivityRingViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("activitySummary"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
