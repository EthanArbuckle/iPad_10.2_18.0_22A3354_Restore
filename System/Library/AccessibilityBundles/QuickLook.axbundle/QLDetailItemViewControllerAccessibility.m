@implementation QLDetailItemViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("QLDetailItemViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("QLDetailItemViewController"), CFSTR("_setActionButtonView:animated:actionButtonLabel:informationVisible:"), "v", "@", "B", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("QLDetailItemViewController"), CFSTR("_actionIconButton"), "UIButton");

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)QLDetailItemViewControllerAccessibility;
  -[QLDetailItemViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v6, sel__accessibilityLoadAccessibilityInformation);
  -[QLDetailItemViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_actionIconButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLDetailItemViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_actionIconButton"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setIsAccessibilityElement:", objc_msgSend(v5, "isEnabled"));
}

- (void)_setActionButtonView:(id)a3 animated:(BOOL)a4 actionButtonLabel:(id)a5 informationVisible:(BOOL)a6
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)QLDetailItemViewControllerAccessibility;
  -[QLDetailItemViewControllerAccessibility _setActionButtonView:animated:actionButtonLabel:informationVisible:](&v7, sel__setActionButtonView_animated_actionButtonLabel_informationVisible_, a3, a4, a5, a6);
  -[QLDetailItemViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
