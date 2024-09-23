@implementation HKMonthDayCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HKMonthDayCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("HKMonthDayCell"), CFSTR("HKCalendarDayCell"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HKCalendarDayCell"), CFSTR("date"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HKCalendarDayCell"), CFSTR("representsToday"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HKCalendarDayCell"), CFSTR("circle"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[HKMonthDayCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("date"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    AXDateStringForFormat();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[HKMonthDayCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("representsToday")))
    {
      accessibilityLocalizedString(CFSTR("today.button"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      __AXStringForVariables();
      v6 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v6 = v4;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HKMonthDayCellAccessibility;
  v3 = -[HKMonthDayCellAccessibility accessibilityTraits](&v7, sel_accessibilityTraits);
  objc_opt_class();
  -[HKMonthDayCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("circle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && (objc_msgSend(v5, "isHidden") & 1) == 0)
    v3 |= *MEMORY[0x24BDF7400];

  return v3;
}

@end
