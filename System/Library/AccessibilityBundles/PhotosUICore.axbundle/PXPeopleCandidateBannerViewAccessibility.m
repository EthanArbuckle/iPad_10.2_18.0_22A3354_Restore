@implementation PXPeopleCandidateBannerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PXPeopleCandidateBannerView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceVariable:withType:", CFSTR("PXPeopleCandidateBannerView"), CFSTR("_notNowButton"), "UIButton");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXPeopleCandidateBannerViewAccessibility;
  -[PXPeopleCandidateBannerViewAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  -[PXPeopleCandidateBannerViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_notNowButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityPhotosUICoreLocalizedString(CFSTR("review.later.button.label"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

}

@end
