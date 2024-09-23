@implementation SocialOnboardingNetworkCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MusicApplication.SocialOnboardingNetworkCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.SocialOnboardingNetworkCell"), CFSTR("title"), "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)-[SocialOnboardingNetworkCellAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("title"));
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SocialOnboardingNetworkCellAccessibility;
  return *MEMORY[0x24BDF73B0] | -[SocialOnboardingNetworkCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
