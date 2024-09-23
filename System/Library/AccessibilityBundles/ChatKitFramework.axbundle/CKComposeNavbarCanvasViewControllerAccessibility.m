@implementation CKComposeNavbarCanvasViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKComposeNavbarCanvasViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKComposeNavbarCanvasViewController"), CFSTR("cancelButton"), "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKComposeNavbarCanvasViewControllerAccessibility;
  -[CKComposeNavbarCanvasViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  -[CKComposeNavbarCanvasViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("cancelButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("compose.cancel.button"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

}

@end
