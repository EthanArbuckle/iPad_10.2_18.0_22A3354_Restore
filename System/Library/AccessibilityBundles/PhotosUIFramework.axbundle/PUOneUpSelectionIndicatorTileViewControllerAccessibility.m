@implementation PUOneUpSelectionIndicatorTileViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PUOneUpSelectionIndicatorTileViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUOneUpSelectionIndicatorTileViewController"), CFSTR("_button"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUOneUpSelectionIndicatorTileViewController"), CFSTR("_updateIfNeeded"), "v", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PUOneUpSelectionIndicatorTileViewControllerAccessibility;
  -[PUOneUpSelectionIndicatorTileViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v6, sel__accessibilityLoadAccessibilityInformation);
  objc_opt_class();
  -[PUOneUpSelectionIndicatorTileViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_button"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  accessibilityPULocalizedString(CFSTR("use.photo.checkmark"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityLabel:", v5);

}

- (void)_updateIfNeeded
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUOneUpSelectionIndicatorTileViewControllerAccessibility;
  -[PUOneUpSelectionIndicatorTileViewControllerAccessibility _updateIfNeeded](&v3, sel__updateIfNeeded);
  -[PUOneUpSelectionIndicatorTileViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
