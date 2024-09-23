@implementation AVTFunCamAvatarPickerTitleCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AVTFunCamAvatarPickerTitleCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTFunCamAvatarPickerTitleCell"), CFSTR("titleLabel"), "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AVTFunCamAvatarPickerTitleCellAccessibility;
  -[AVTFunCamAvatarPickerTitleCellAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[AVTFunCamAvatarPickerTitleCellAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 0);

}

- (BOOL)isAccessibilityElement
{
  return 0;
}

@end
