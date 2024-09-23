@implementation CNPhotoPickerAnimojiProviderItemAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CNPhotoPickerAnimojiProviderItem");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNPhotoPickerAnimojiProviderItem"), CFSTR("backgroundColorVariant"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("CNPhotoPickerColorVariant"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNPhotoPickerColorVariant"), CFSTR("color"), "@", 0);

}

- (NSString)_axColorVariantName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_opt_class();
  -[CNPhotoPickerAnimojiProviderItemAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("backgroundColorVariant"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("color"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    AXColorStringForColor();
  else
    accessibilityLocalizedString(CFSTR("default.background.color"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

@end
