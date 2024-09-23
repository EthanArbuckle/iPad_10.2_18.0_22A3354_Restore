@implementation IMBTimeslotsContainerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("Business.IMBTimeslotsContainerView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Business.IMBTimeslotsContainerView"), CFSTR("timeslotViews"), "@", 0);
}

- (id)accessibilityElements
{
  void *v3;
  void *v4;

  objc_opt_class();
  -[IMBTimeslotsContainerViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("timeslotViews"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
