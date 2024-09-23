@implementation HUCalendarScrubberContainerViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HUCalendarScrubberContainerViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("HUCalendarScrubberContainerViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUCalendarScrubberContainerViewController"), CFSTR("prevWeekButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUCalendarScrubberContainerViewController"), CFSTR("nextWeekButton"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HUCalendarScrubberContainerViewControllerAccessibility;
  -[HUCalendarScrubberContainerViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v7, sel__accessibilityLoadAccessibilityInformation);
  -[HUCalendarScrubberContainerViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("prevWeekButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityHomeUILocalizedString(CFSTR("camera.calendar.previous.week"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

  -[HUCalendarScrubberContainerViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("nextWeekButton"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityHomeUILocalizedString(CFSTR("camera.calendar.next.week"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityLabel:", v6);

}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUCalendarScrubberContainerViewControllerAccessibility;
  -[HUCalendarScrubberContainerViewControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[HUCalendarScrubberContainerViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
