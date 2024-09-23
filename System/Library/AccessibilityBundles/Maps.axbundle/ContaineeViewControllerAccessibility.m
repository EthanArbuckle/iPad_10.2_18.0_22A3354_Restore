@implementation ContaineeViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ContaineeViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("ContaineeViewController"), CFSTR("_cardPresentationController"), "CardPresentationController");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CardPresentationController"), CFSTR("_cardView"), "CardView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ContaineeViewController"), CFSTR("willBecomeCurrent:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ContaineeViewController"), CFSTR("willResignCurrent:"), "v", "B", 0);

}

- (void)setContainerViewController:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ContaineeViewControllerAccessibility;
  -[ContaineeViewControllerAccessibility setContainerViewController:](&v4, sel_setContainerViewController_, a3);
  -[ContaineeViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ContaineeViewControllerAccessibility;
  -[ContaineeViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v6, sel__accessibilityLoadAccessibilityInformation);
  -[ContaineeViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_cardPresentationController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("_cardView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_accessibilityLoadAccessibilityInformation");

  -[ContaineeViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityElementsHidden:", 0);

}

- (void)willBecomeCurrent:(BOOL)a3
{
  id v3;

  -[ContaineeViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("view"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityElementsHidden:", 0);

}

- (void)willResignCurrent:(BOOL)a3
{
  id v3;

  -[ContaineeViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("view"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityElementsHidden:", 1);

}

@end
