@implementation COSBuddyNavigationControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("COSBuddyNavigationController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("COSBuddyNavigationController"), CFSTR("_internalDashboardButton"), "UIButton");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("COSBuddyNavigationController"), CFSTR("addInternalDashboardButton"), "v", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)COSBuddyNavigationControllerAccessibility;
  -[COSBuddyNavigationControllerAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[COSBuddyNavigationControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_internalDashboardButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", CFSTR("Internal Settings"));

}

- (void)addInternalDashboardButton
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)COSBuddyNavigationControllerAccessibility;
  -[COSBuddyNavigationControllerAccessibility addInternalDashboardButton](&v3, sel_addInternalDashboardButton);
  -[COSBuddyNavigationControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
