@implementation HighlightCalendarViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HealthVisualization.HighlightCalendarView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HealthVisualization.HighlightCalendarView"), CFSTR("accessibilityWeekdayLabels"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HealthVisualization.HighlightCalendarView"), CFSTR("accessibilityMonthLabels"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HighlightCalendarViewAccessibility;
  -[HighlightCalendarViewAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  -[HighlightCalendarViewAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("accessibilityWeekdayLabels"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", &__block_literal_global_0);

  -[HighlightCalendarViewAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("accessibilityMonthLabels"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", &__block_literal_global_187);

}

uint64_t __80__HighlightCalendarViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setIsAccessibilityElement:", 0);
}

uint64_t __80__HighlightCalendarViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setIsAccessibilityElement:", 0);
}

@end
