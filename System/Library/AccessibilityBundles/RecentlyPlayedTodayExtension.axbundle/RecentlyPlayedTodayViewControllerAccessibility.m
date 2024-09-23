@implementation RecentlyPlayedTodayViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("RecentlyPlayedTodayExtension.RecentlyPlayedTodayViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("RecentlyPlayedTodayExtension.RecentlyPlayedTodayViewController"), CFSTR("recentlyPlayedItems"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("RecentlyPlayedTodayExtension.RecentlyPlayedTodayViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("RecentlyPlayedTodayExtension.RecentlyPlayedTodayViewController"), CFSTR("viewWillAppear:"), "v", "B", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;
  char v8;

  v8 = 0;
  objc_opt_class();
  -[RecentlyPlayedTodayViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("recentlyPlayedItems"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[RecentlyPlayedTodayViewControllerAccessibility view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v5, "setIsAccessibilityElement:", 0);
  }
  else
  {
    objc_msgSend(v5, "setIsAccessibilityElement:", 1);
    accessibilityRecentlyPlayedTodayExtensionLocalizedString(CFSTR("no.recently.played.music"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAccessibilityLabel:", v6);

  }
  v7.receiver = self;
  v7.super_class = (Class)RecentlyPlayedTodayViewControllerAccessibility;
  -[RecentlyPlayedTodayViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v7, sel__accessibilityLoadAccessibilityInformation);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)RecentlyPlayedTodayViewControllerAccessibility;
  -[RecentlyPlayedTodayViewControllerAccessibility viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[RecentlyPlayedTodayViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
