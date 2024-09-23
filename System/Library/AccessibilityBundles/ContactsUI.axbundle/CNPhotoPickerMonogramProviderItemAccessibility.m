@implementation CNPhotoPickerMonogramProviderItemAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CNPhotoPickerMonogramProviderItem");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasProperty:withType:", CFSTR("CNPhotoPickerMonogramProviderItem"), CFSTR("backgroundColor"), "@");
}

- (NSString)_axColorVariantName
{
  void *v3;
  void *v4;
  void *v5;

  objc_opt_class();
  -[CNPhotoPickerMonogramProviderItemAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("backgroundColor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    AXColorStringForColor();
  else
    accessibilityLocalizedString(CFSTR("default.background.color"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

@end
