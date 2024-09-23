@implementation PXCMMAssetsViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PXCMMAssetsViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXCMMAssetsViewController"), CFSTR("_createAddButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXCMMTileReusableView"), CFSTR("view"), "@", 0);

}

- (id)_createAddButton
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXCMMAssetsViewControllerAccessibility;
  -[PXCMMAssetsViewControllerAccessibility _createAddButton](&v7, sel__createAddButton);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("view"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  accessibilityPhotosUICoreLocalizedString(CFSTR("add.photo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityLabel:", v5);

  return v2;
}

@end
