@implementation MKPlaceHoursViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MKPlaceHoursViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MKPlaceHoursViewController"), CFSTR("_toggleShowAllHours"), "v", 0);
}

- (void)_toggleShowAllHours
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)MKPlaceHoursViewControllerAccessibility;
  -[MKPlaceHoursViewControllerAccessibility _toggleShowAllHours](&v2, sel__toggleShowAllHours);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

@end
