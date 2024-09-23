@implementation CKSyndicationContentViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKSyndicationContentViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CKSyndicationContentViewController"), CFSTR("OBWelcomeController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKSyndicationContentViewController"), CFSTR("micropillView1"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKSyndicationContentViewController"), CFSTR("micropillView2"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKSyndicationContentViewControllerAccessibility;
  -[CKSyndicationContentViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  -[CKSyndicationContentViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("micropillView1"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSyndicationContentViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("micropillView2"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 0);
  objc_msgSend(v4, "setIsAccessibilityElement:", 0);

}

@end
