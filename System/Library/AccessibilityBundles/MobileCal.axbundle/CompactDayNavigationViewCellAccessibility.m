@implementation CompactDayNavigationViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CompactDayNavigationViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceVariable:withType:", CFSTR("CompactDayNavigationViewCell"), CFSTR("_displayString"), "NSString");
}

- (id)accessibilityUserInputLabels
{
  void *v2;
  void *v3;

  -[CompactDayNavigationViewCellAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("_displayString"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x2349148F4]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
