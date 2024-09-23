@implementation SKUIReviewInAppRatingButtonViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SKUIReviewInAppRatingButtonViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SKUIReviewInAppRatingButtonViewController"), CFSTR("titleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SKUIReviewInAppRatingButtonViewController"), CFSTR("isEnabled"), "B", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SKUIReviewInAppRatingButtonViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SKUIReviewInAppRatingButtonViewController"), CFSTR("setEnabled:"), "v", "B", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[6];
  char v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SKUIReviewInAppRatingButtonViewControllerAccessibility;
  -[SKUIReviewInAppRatingButtonViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v8, sel__accessibilityLoadAccessibilityInformation);
  v7 = 0;
  objc_opt_class();
  -[SKUIReviewInAppRatingButtonViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "accessibilityTraits");
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __100__SKUIReviewInAppRatingButtonViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v6[3] = &unk_24FF2C148;
  v6[4] = self;
  v6[5] = v5;
  objc_msgSend(v4, "_setAccessibilityTraitsBlock:", v6);

}

uint64_t __100__SKUIReviewInAppRatingButtonViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  uint64_t v1;
  int v2;
  uint64_t v3;

  v1 = *MEMORY[0x24BDF73B0] | *(_QWORD *)(a1 + 40);
  v2 = objc_msgSend(*(id *)(a1 + 32), "safeBoolForKey:", CFSTR("isEnabled"));
  v3 = *MEMORY[0x24BDF73E8];
  if (v2)
    v3 = 0;
  return v1 | v3;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SKUIReviewInAppRatingButtonViewControllerAccessibility;
  -[SKUIReviewInAppRatingButtonViewControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[SKUIReviewInAppRatingButtonViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)setEnabled:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SKUIReviewInAppRatingButtonViewControllerAccessibility;
  -[SKUIReviewInAppRatingButtonViewControllerAccessibility setEnabled:](&v4, sel_setEnabled_, a3);
  -[SKUIReviewInAppRatingButtonViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
