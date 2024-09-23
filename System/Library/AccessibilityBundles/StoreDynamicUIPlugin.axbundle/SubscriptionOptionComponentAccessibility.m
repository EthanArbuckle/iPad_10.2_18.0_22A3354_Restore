@implementation SubscriptionOptionComponentAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("StoreDynamicUIPlugin.SubscriptionOptionComponent");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("StoreDynamicUIPlugin.SubscriptionOptionComponent"), CFSTR("isOptionSelected"), "Bool");
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  int v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SubscriptionOptionComponentAccessibility;
  v3 = -[SubscriptionOptionComponentAccessibility accessibilityTraits](&v7, sel_accessibilityTraits);
  v4 = -[SubscriptionOptionComponentAccessibility safeSwiftBoolForKey:](self, "safeSwiftBoolForKey:", CFSTR("isOptionSelected"));
  v5 = *MEMORY[0x24BDF7400];
  if (!v4)
    v5 = 0;
  return v5 | v3;
}

@end
