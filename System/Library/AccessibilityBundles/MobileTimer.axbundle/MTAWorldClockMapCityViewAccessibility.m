@implementation MTAWorldClockMapCityViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MTAWorldClockMapCityView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("City"), CFSTR("temperature"), "@", 0);
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[MTAWorldClockMapCityViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_nameLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[MTAWorldClockMapCityViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_timeLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilityLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  __UIAXStringForVariables();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  return 0;
}

@end
