@implementation ContinuousReadingViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ContinuousReadingViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ContinuousReadingViewController"), CFSTR("_outerScrollView"), "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ContinuousReadingViewControllerAccessibility;
  -[ContinuousReadingViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  v3 = (id)-[ContinuousReadingViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_outerScrollView"));
}

- (id)_outerScrollView
{
  void *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ContinuousReadingViewControllerAccessibility;
  -[ContinuousReadingViewControllerAccessibility _outerScrollView](&v4, sel__outerScrollView);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFocusGroupIdentifier:", 0);
  return v2;
}

@end
