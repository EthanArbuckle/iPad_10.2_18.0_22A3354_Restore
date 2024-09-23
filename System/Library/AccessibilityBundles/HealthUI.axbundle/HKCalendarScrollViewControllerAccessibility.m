@implementation HKCalendarScrollViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HKCalendarScrollViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HKCalendarScrollViewController"), CFSTR("viewDidAppear:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HKCalendarScrollViewController"), CFSTR("scrollView"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HKCalendarScrollViewControllerAccessibility;
  -[HKCalendarScrollViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[HKCalendarScrollViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("scrollView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityOpaqueElementProvider:", 1);

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HKCalendarScrollViewControllerAccessibility;
  -[HKCalendarScrollViewControllerAccessibility viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[HKCalendarScrollViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
