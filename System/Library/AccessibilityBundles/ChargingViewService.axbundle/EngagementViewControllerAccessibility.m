@implementation EngagementViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("EngagementViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("EngagementViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("EngagementViewController"), CFSTR("engagementDismissButton"), "@", 0);

}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)EngagementViewControllerAccessibility;
  -[EngagementViewControllerAccessibility viewDidLoad](&v4, sel_viewDidLoad);
  -[EngagementViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("engagementDismissButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 0);

}

@end
