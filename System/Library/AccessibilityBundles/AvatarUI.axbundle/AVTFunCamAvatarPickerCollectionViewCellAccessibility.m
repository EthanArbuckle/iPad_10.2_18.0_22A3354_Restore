@implementation AVTFunCamAvatarPickerCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AVTFunCamAvatarPickerCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTFunCamAvatarPickerCollectionViewCell"), CFSTR("accessoryButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTFunCamAvatarPickerCollectionViewCell"), CFSTR("selectionVisible"), "B", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVTFunCamAvatarPickerCollectionViewCellAccessibility;
  -[AVTFunCamAvatarPickerCollectionViewCellAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  -[AVTFunCamAvatarPickerCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessoryButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 0);

  -[AVTFunCamAvatarPickerCollectionViewCellAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("accessoryButton.titleLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsAccessibilityElement:", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVTFunCamAvatarPickerCollectionViewCellAccessibility;
  -[AVTFunCamAvatarPickerCollectionViewCellAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[AVTFunCamAvatarPickerCollectionViewCellAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
