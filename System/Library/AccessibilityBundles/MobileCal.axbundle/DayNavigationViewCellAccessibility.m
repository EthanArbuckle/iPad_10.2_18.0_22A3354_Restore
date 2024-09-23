@implementation DayNavigationViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("DayNavigationViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("DayNavigationViewCell"), CFSTR("date"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("DayNavigationViewCell"), CFSTR("circled"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("DayNavigationViewCell"), CFSTR("isToday"), "B", 0);

}

- (BOOL)_axIsCircled
{
  return -[DayNavigationViewCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("circled"));
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  -[DayNavigationViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("date"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _AXGetStringsForDate(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[DayNavigationViewCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isToday")))
  {
    accessibilityLocalizedString(CFSTR("today.indicator"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v6;
  }
  return v4;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DayNavigationViewCellAccessibility;
  v3 = -[DayNavigationViewCellAccessibility accessibilityTraits](&v5, sel_accessibilityTraits);
  if (-[DayNavigationViewCellAccessibility _axIsCircled](self, "_axIsCircled"))
    return (*MEMORY[0x24BDF7400] | v3) & ~*MEMORY[0x24BDF73E8];
  else
    return *MEMORY[0x24BDF73B0] | v3;
}

- (id)accessibilityHint
{
  void *v3;
  void *v4;
  uint64_t v5;

  accessibilityLocalizedString(CFSTR("month.day.scroll.hint"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[DayNavigationViewCellAccessibility _axIsCircled](self, "_axIsCircled"))
  {
    accessibilityLocalizedString(CFSTR("month.day.hint"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v5;
  }
  return v3;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (BOOL)_accessibilityScrollToVisible
{
  return 1;
}

@end
