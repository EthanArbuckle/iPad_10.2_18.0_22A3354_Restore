@implementation SBSwitcherAppSuggestionViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBSwitcherAppSuggestionViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBSwitcherAppSuggestionViewController"), CFSTR("_animateOutAndRemoveCurrentBottomBannerWithCompletion:"), "v", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBSwitcherAppSuggestionViewController"), CFSTR("_bannerView"), "SBSwitcherAppSuggestionBannerView");

}

- (void)_animateOutAndRemoveCurrentBottomBannerWithCompletion:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  -[SBSwitcherAppSuggestionViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_bannerView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_accessibilityViewIsVisible");

  v8.receiver = self;
  v8.super_class = (Class)SBSwitcherAppSuggestionViewControllerAccessibility;
  -[SBSwitcherAppSuggestionViewControllerAccessibility _animateOutAndRemoveCurrentBottomBannerWithCompletion:](&v8, sel__animateOutAndRemoveCurrentBottomBannerWithCompletion_, v4);

  -[SBSwitcherAppSuggestionViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_bannerView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v7, "_accessibilityViewIsVisible");

  if (v6 != (_DWORD)v4)
    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

@end
