@implementation _HKTimeScopeControlBarAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_HKTimeScopeControlBar");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("HKTimeScopeControl"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("_HKTimeScopeControlBar"), CFSTR("HKTimeScopeControl"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HKTimeScopeControl"), CFSTR("_timeScopeForIndex:"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("_HKTimeScopeControlBar"), CFSTR("_segments"), "UISegmentedControl");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("UISegmentedControl"), CFSTR("_segments"), "NSMutableArray");

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  unint64_t v5;
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_HKTimeScopeControlBarAccessibility;
  -[_HKTimeScopeControlBarAccessibility _accessibilityLoadAccessibilityInformation](&v7, sel__accessibilityLoadAccessibilityInformation);
  -[_HKTimeScopeControlBarAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_segments"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeArrayForKey:", CFSTR("_segments"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v5 = 0;
    do
    {
      v6 = v4;
      AXPerformSafeBlock();

      ++v5;
    }
    while (v5 < objc_msgSend(v6, "count"));
  }

}

@end
