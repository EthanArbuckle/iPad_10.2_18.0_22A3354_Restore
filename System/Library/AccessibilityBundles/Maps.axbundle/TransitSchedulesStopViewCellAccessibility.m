@implementation TransitSchedulesStopViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("TransitSchedulesStopViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TransitSchedulesStopViewCell"), CFSTR("departureTimeColor"), "@", 0);
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
  void *v8;

  -[TransitSchedulesStopViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("departureTimeColor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TransitSchedulesStopViewCellAccessibility _accessibilityTextForSubhierarchyIncludingHeaders:focusableItems:exclusions:](self, "_accessibilityTextForSubhierarchyIncludingHeaders:focusableItems:exclusions:", 0, 1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "systemRedColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 == v5)
  {
    AXMapKitLocString(CFSTR("DELAYED_TRANSIT"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = v4;
  }

  return v6;
}

@end
