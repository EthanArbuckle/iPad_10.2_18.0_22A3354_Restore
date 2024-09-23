@implementation ScheduleOccurrenceCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SleepHealthAppPlugin.ScheduleOccurrenceCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:isKindOfClass:", CFSTR("SleepHealthAppPlugin.ScheduleOccurrenceCell"), CFSTR("UIView"));
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  void *v2;
  int v3;
  unint64_t *v4;
  unint64_t v5;

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isUserInteractionEnabled");
  v4 = (unint64_t *)MEMORY[0x24BDF73B0];
  if (!v3)
    v4 = (unint64_t *)MEMORY[0x24BDF73E0];
  v5 = *v4;

  return v5;
}

@end
