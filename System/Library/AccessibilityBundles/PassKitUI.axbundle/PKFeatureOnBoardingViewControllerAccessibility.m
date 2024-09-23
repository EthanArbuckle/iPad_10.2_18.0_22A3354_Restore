@implementation PKFeatureOnBoardingViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKFeatureOnBoardingViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKFeatureOnBoardingViewController"), CFSTR("viewDidLoad"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKFeatureOnBoardingViewController"), CFSTR("_featureIdentifier"), "Q");
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("PKFeatureOnBoardingViewController"), CFSTR("PKExplanationViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKExplanationViewController"), CFSTR("explanationView"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKFeatureOnBoardingViewControllerAccessibility;
  -[PKFeatureOnBoardingViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v6, sel__accessibilityLoadAccessibilityInformation);
  if (-[PKFeatureOnBoardingViewControllerAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("featureIdentifier")) == 2)
  {
    -[PKFeatureOnBoardingViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("explanationView"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "safeValueForKey:", CFSTR("titleImage"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    accessibilityLocalizedString(CFSTR("apple.card"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAccessibilityLabel:", v5);

  }
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKFeatureOnBoardingViewControllerAccessibility;
  -[PKFeatureOnBoardingViewControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[PKFeatureOnBoardingViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
