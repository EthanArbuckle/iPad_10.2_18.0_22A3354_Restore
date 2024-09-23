@implementation NowPlayingViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("NowPlayingUI.NowPlayingViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NowPlayingUI.NowPlayingViewController"), CFSTR("accessibilityCollectionView"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("NowPlayingUI.TitleSectionHeaderView"));

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;
  char v6;

  v6 = 0;
  objc_opt_class();
  -[NowPlayingViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("view"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setAccessibilityIdentifier:", CFSTR("NowPlayingScreen"));
  objc_msgSend(v4, "setAccessibilityViewIsModal:", 0);
  v5.receiver = self;
  v5.super_class = (Class)NowPlayingViewControllerAccessibility;
  -[NowPlayingViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);

}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NowPlayingViewControllerAccessibility;
  -[NowPlayingViewControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[NowPlayingViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
