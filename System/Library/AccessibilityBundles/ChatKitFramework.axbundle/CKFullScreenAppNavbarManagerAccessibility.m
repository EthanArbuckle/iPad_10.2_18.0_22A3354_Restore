@implementation CKFullScreenAppNavbarManagerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKFullScreenAppNavbarManager");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKFullScreenAppNavbarManager"), CFSTR("dismissButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKFullScreenAppNavbarManager"), CFSTR("_updateDismissButton"), "v", 0);

}

- (void)_updateDismissButton
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKFullScreenAppNavbarManagerAccessibility;
  -[CKFullScreenAppNavbarManagerAccessibility _updateDismissButton](&v5, sel__updateDismissButton);
  -[CKFullScreenAppNavbarManagerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("dismissButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("dismiss.button.label"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

}

@end
