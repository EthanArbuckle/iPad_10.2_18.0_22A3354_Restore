@implementation CKSyndicationPageViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKSyndicationPageViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKSyndicationPageViewController"), CFSTR("pageControl"), "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKSyndicationPageViewControllerAccessibility;
  -[CKSyndicationPageViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[CKSyndicationPageViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("pageControl"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 1);

}

@end
