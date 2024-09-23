@implementation ENUIRegionalDetailsHeaderCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ENUIRegionalDetailsHeaderCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ENUIRegionalDetailsHeaderCell"), CFSTR("subtitleText"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ENUIRegionalDetailsHeaderCell"), CFSTR("headerView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HealthExposureNotificationUI.OnboardingHeaderView"), CFSTR("imageView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HealthExposureNotificationUI.OnboardingHeaderView"), CFSTR("header"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HealthExposureNotificationUI.ENUIPublicHealthHeader"), CFSTR("title"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ENUIRegionalDetailsHeaderCell"), CFSTR("commonInit"), "v", 0);

}

- (id)accessibilityElements
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDBCE30];
  -[ENUIRegionalDetailsHeaderCellAccessibility _accessibilityImageView](self, "_accessibilityImageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENUIRegionalDetailsHeaderCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("subtitleText"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axArrayByIgnoringNilElementsWithCount:", 2, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ENUIRegionalDetailsHeaderCellAccessibility;
  -[ENUIRegionalDetailsHeaderCellAccessibility _accessibilityLoadAccessibilityInformation](&v6, sel__accessibilityLoadAccessibilityInformation);
  -[ENUIRegionalDetailsHeaderCellAccessibility _accessibilityImageView](self, "_accessibilityImageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENUIRegionalDetailsHeaderCellAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("headerView.header.title"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 1);
  objc_msgSend(v3, "setAccessibilityLabel:", v4);
  -[ENUIRegionalDetailsHeaderCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("subtitleText"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIsAccessibilityElement:", 1);

}

- (void)commonInit
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ENUIRegionalDetailsHeaderCellAccessibility;
  -[ENUIRegionalDetailsHeaderCellAccessibility commonInit](&v3, sel_commonInit);
  -[ENUIRegionalDetailsHeaderCellAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (id)_accessibilityImageView
{
  return (id)-[ENUIRegionalDetailsHeaderCellAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("headerView.imageView"));
}

@end
