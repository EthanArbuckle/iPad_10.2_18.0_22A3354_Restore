@implementation SyncedLyricsViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MusicCoreUI.SyncedLyricsViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("MusicCoreUI.SyncedLyricsViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("MusicCoreUI.SyncedLyricsViewController"), CFSTR("scrollView"), "UIScrollView");

}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SyncedLyricsViewControllerAccessibility;
  -[SyncedLyricsViewControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[SyncedLyricsViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SyncedLyricsViewControllerAccessibility;
  -[SyncedLyricsViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[SyncedLyricsViewControllerAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("scrollView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("AXSyncedLyricsScrollView"));

}

@end
