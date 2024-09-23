@implementation PKDiscoveryCardViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKDiscoveryCardView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKDiscoveryCardView"), CFSTR("_titleLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKDiscoveryCardView"), CFSTR("_headingLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:", CFSTR("PKContinuousButton"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKDiscoveryCardView"), CFSTR("_dismissButton"), "PKContinuousButton");
  objc_msgSend(v3, "validateClass:", CFSTR("PKDiscoveryCallToActionFooterView"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKDiscoveryCardView"), CFSTR("_ctaFooterView"), "PKDiscoveryCallToActionFooterView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKDiscoveryCardView"), CFSTR("_dismissButtonPressed"), "v", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKDiscoveryCardViewAccessibility;
  -[PKDiscoveryCardViewAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  -[PKDiscoveryCardViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_dismissButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("dismiss.button"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;

  -[PKDiscoveryCardViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_headingLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDiscoveryCardViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_titleLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilityLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_accessibilitySupplementaryHeaderViews
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCE30];
  -[PKDiscoveryCardViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_dismissButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "axArrayByIgnoringNilElementsWithCount:", 1, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_accessibilitySupplementaryFooterViews
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCE30];
  -[PKDiscoveryCardViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_ctaFooterView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "axArrayByIgnoringNilElementsWithCount:", 1, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)_accessibilityScrollToVisible
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  BOOL v11;
  objc_super v13;
  char v14;

  -[PKDiscoveryCardViewAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", NSClassFromString(CFSTR("PKDiscoveryGalleryView")));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_opt_class();
  -[PKDiscoveryCardViewAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[PKDiscoveryCardViewAccessibility frame](self, "frame");
    v7 = v6;
    objc_msgSend(v5, "contentOffset");
    if (v8 <= 0.0 || v8 >= v7 || v3 == 0)
    {
      v13.receiver = self;
      v13.super_class = (Class)PKDiscoveryCardViewAccessibility;
      v11 = -[PKDiscoveryCardViewAccessibility _accessibilityScrollToVisible](&v13, sel__accessibilityScrollToVisible);
    }
    else
    {
      objc_msgSend(v5, "setContentOffset:animated:", 0, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
      UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
      v11 = 1;
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)_dismissButtonPressed
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PKDiscoveryCardViewAccessibility;
  -[PKDiscoveryCardViewAccessibility _dismissButtonPressed](&v2, sel__dismissButtonPressed);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

@end
