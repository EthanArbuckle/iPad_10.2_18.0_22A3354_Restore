@implementation CalendarDayCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MenstrualCyclesAppPlugin.CalendarDayCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (NSDate)accessibilityDate
{
  JUMPOUT(0x2349144C4);
}

- (void)setAccessibilityDate:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MenstrualCyclesAppPlugin.CalendarDayCell"), CFSTR("axDayShowsDayIndicator"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MenstrualCyclesAppPlugin.CalendarDayCell"), CFSTR("axDayLocalizedText"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[CalendarDayCellAccessibility accessibilityDate](self, "accessibilityDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _AXGetStringForDay(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)accessibilityTraits
{
  _BOOL4 v3;
  unint64_t v4;
  uint64_t v5;
  objc_super v7;

  v3 = -[CalendarDayCellAccessibility _axDayShowsDayIndicator](self, "_axDayShowsDayIndicator");
  v7.receiver = self;
  v7.super_class = (Class)CalendarDayCellAccessibility;
  v4 = -[CalendarDayCellAccessibility accessibilityTraits](&v7, sel_accessibilityTraits);
  v5 = *MEMORY[0x24BDF7400];
  if (!v3)
    v5 = 0;
  return v5 | v4 | *MEMORY[0x24BDF73B0];
}

- (BOOL)_axDayShowsDayIndicator
{
  return -[CalendarDayCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("axDayShowsDayIndicator"));
}

- (id)_axDayLocalizedText
{
  return (id)-[CalendarDayCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("axDayLocalizedText"));
}

@end
