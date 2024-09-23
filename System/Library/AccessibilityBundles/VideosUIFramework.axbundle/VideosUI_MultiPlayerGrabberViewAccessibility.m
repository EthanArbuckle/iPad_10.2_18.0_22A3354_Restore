@implementation VideosUI_MultiPlayerGrabberViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VideosUI.MultiPlayerGrabberView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("VideosUI.MultiPlayerViewController"), CFSTR("isDetailsViewControllerVisible"), "Bool");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VideosUI.MultiPlayerViewController"), CFSTR("setDetailsViewControllerVisible:animated:completion:"), "v", "B", "B", "@?", 0);

}

- (id)_axMultiviewController
{
  void *v2;
  void *v3;

  -[VideosUI_MultiPlayerGrabberViewAccessibility _accessibilityFindAncestor:startWithSelf:](self, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_15, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accessibilityViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  int v3;
  __CFString *v4;

  -[VideosUI_MultiPlayerGrabberViewAccessibility _axMultiviewController](self, "_axMultiviewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeSwiftBoolForKey:", CFSTR("isDetailsViewControllerVisible"));

  if (v3)
    v4 = CFSTR("multiview.addMoreGames.grabber.hide");
  else
    v4 = CFSTR("multiview.addMoreGames.grabber.show");
  accessibilityLocalizedString(v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VideosUI_MultiPlayerGrabberViewAccessibility;
  return *MEMORY[0x24BDF73B0] | -[VideosUI_MultiPlayerGrabberViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (BOOL)accessibilityActivate
{
  void *v2;
  id v3;
  void *v5;

  -[VideosUI_MultiPlayerGrabberViewAccessibility _axMultiviewController](self, "_axMultiviewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeSwiftBoolForKey:", CFSTR("isDetailsViewControllerVisible"));
  v5 = v2;
  v3 = v2;
  AXPerformSafeBlock();

  return 1;
}

- (void)setHidden:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;
  objc_super v6;

  v3 = a3;
  if (UIAccessibilityIsVoiceOverRunning()
    || UIAccessibilityIsSwitchControlRunning()
    || (_UIAccessibilityFullKeyboardAccessEnabled() & 1) != 0)
  {
    v6.receiver = self;
    v6.super_class = (Class)VideosUI_MultiPlayerGrabberViewAccessibility;
    -[VideosUI_MultiPlayerGrabberViewAccessibility setHidden:](&v6, sel_setHidden_, 0);
  }
  v5.receiver = self;
  v5.super_class = (Class)VideosUI_MultiPlayerGrabberViewAccessibility;
  -[VideosUI_MultiPlayerGrabberViewAccessibility setHidden:](&v5, sel_setHidden_, v3);
}

- (void)setAlpha:(double)a3
{
  objc_super v5;
  objc_super v6;

  if (UIAccessibilityIsVoiceOverRunning()
    || UIAccessibilityIsSwitchControlRunning()
    || (_UIAccessibilityFullKeyboardAccessEnabled() & 1) != 0)
  {
    v6.receiver = self;
    v6.super_class = (Class)VideosUI_MultiPlayerGrabberViewAccessibility;
    -[VideosUI_MultiPlayerGrabberViewAccessibility setAlpha:](&v6, sel_setAlpha_, 1.0);
  }
  v5.receiver = self;
  v5.super_class = (Class)VideosUI_MultiPlayerGrabberViewAccessibility;
  -[VideosUI_MultiPlayerGrabberViewAccessibility setAlpha:](&v5, sel_setAlpha_, a3);
}

@end
