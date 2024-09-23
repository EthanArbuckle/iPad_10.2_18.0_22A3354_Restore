@implementation PKGSVWalletHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKGSVWalletHeaderView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKGSVWalletHeaderView"), CFSTR("_titleView"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKGSVWalletHeaderView"), CFSTR("_actionButton"), "PKContinuousButton");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKGSVWalletHeaderView"), CFSTR("setShowActivityIndicator:"), "v", "B", 0);

}

- (void)setShowActivityIndicator:(BOOL)a3
{
  _BOOL4 v3;
  UIAccessibilityNotifications v4;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)PKGSVWalletHeaderViewAccessibility;
  -[PKGSVWalletHeaderViewAccessibility setShowActivityIndicator:](&v6, sel_setShowActivityIndicator_);
  if (v3)
  {
    v4 = *MEMORY[0x24BDF71E8];
    accessibilityLocalizedString(CFSTR("loading"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilityPostNotification(v4, v5);

  }
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKGSVWalletHeaderViewAccessibility;
  -[PKGSVWalletHeaderViewAccessibility _accessibilityLoadAccessibilityInformation](&v7, sel__accessibilityLoadAccessibilityInformation);
  -[PKGSVWalletHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_actionButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("add.card.button"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

  v5 = *MEMORY[0x24BDF73C0];
  -[PKGSVWalletHeaderViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_titleView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityTraits:", v5);

}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKGSVWalletHeaderViewAccessibility;
  -[PKGSVWalletHeaderViewAccessibility didMoveToWindow](&v3, sel_didMoveToWindow);
  -[PKGSVWalletHeaderViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
