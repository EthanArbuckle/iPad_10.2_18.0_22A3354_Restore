@implementation AVTAvatarAttributeEditorViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AVTAvatarAttributeEditorViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTAvatarAttributeEditorViewController"), CFSTR("alphaAssetsLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTAvatarAttributeEditorViewController"), CFSTR("avtViewSession"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTAvatarAttributeEditorViewController"), CFSTR("attributesCollectionView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTViewSession"), CFSTR("avtView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTAvatarAttributeEditorViewController"), CFSTR("viewDidLoad"), "v", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AVTAvatarAttributeEditorViewControllerAccessibility;
  -[AVTAvatarAttributeEditorViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v10, sel__accessibilityLoadAccessibilityInformation);
  objc_opt_class();
  -[AVTAvatarAttributeEditorViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("alphaAssetsLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setIsAccessibilityElement:", 0);
  -[AVTAvatarAttributeEditorViewControllerAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("avtViewSession.avtView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("editor.puppet"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityLabel:", v6);

  objc_opt_class();
  -[AVTAvatarAttributeEditorViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("attributesCollectionView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "indexPathsForVisibleItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "reloadItemsAtIndexPaths:", v9);

}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVTAvatarAttributeEditorViewControllerAccessibility;
  -[AVTAvatarAttributeEditorViewControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[AVTAvatarAttributeEditorViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
