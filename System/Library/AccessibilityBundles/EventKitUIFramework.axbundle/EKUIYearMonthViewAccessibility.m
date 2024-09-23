@implementation EKUIYearMonthViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("EKUIYearMonthView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("EKUIYearMonthView"), CFSTR("_todayIndex"), "q");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("EKUIYearMonthView"), CFSTR("_calendarDate"), "EKCalendarDate");

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

- (BOOL)_axIsCurrentMonth
{
  void *v2;
  BOOL v3;

  -[EKUIYearMonthViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_todayIndex"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue") != -1;

  return v3;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  objc_opt_class();
  -[EKUIYearMonthViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_calendarDate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x23490DE3C]();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[EKUIYearMonthViewAccessibility _axIsCurrentMonth](self, "_axIsCurrentMonth"))
  {
    accessibilityLocalizedString(CFSTR("current.month.indicator"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v8 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v8;
  }

  return v6;
}

- (id)accessibilityUserInputLabels
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_opt_class();
  -[EKUIYearMonthViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_calendarDate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  MEMORY[0x23490DE30](objc_msgSend(v4, "month"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x23490DE60]();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(CFSTR("year.month.hint"));
}

@end
