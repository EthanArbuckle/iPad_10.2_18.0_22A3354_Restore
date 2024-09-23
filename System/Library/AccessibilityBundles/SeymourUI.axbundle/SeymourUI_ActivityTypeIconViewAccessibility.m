@implementation SeymourUI_ActivityTypeIconViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SeymourUI.ActivityTypeIconView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SeymourUI.ActivityTypeIconView"), CFSTR("accessibilityActivityType"), "q", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  uint64_t v3;
  void *v4;
  objc_super v6;

  v3 = -[SeymourUI_ActivityTypeIconViewAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("accessibilityActivityType"));
  if (v3 < 1)
  {
    v6.receiver = self;
    v6.super_class = (Class)SeymourUI_ActivityTypeIconViewAccessibility;
    -[SeymourUI_ActivityTypeIconViewAccessibility accessibilityLabel](&v6, sel_accessibilityLabel);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _accessibilityStringForHealthKitWorkoutType(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

@end
