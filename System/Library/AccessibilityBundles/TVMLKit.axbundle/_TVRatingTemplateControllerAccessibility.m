@implementation _TVRatingTemplateControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_TVRatingTemplateController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceVariable:withType:", CFSTR("_TVRatingTemplateController"), CFSTR("_titleView"), "UIView");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_TVRatingTemplateControllerAccessibility;
  -[_TVRatingTemplateControllerAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[_TVRatingTemplateControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_titleView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityTraits:", *MEMORY[0x24BDF73C0]);

}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_TVRatingTemplateControllerAccessibility;
  -[_TVRatingTemplateControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[_TVRatingTemplateControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
