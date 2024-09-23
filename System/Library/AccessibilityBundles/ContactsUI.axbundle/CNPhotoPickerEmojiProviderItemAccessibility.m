@implementation CNPhotoPickerEmojiProviderItemAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CNPhotoPickerEmojiProviderItem");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("CNPhotoPickerEmojiProviderItem"), CFSTR("stringRepresentation"), "@");
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("CNPhotoPickerEmojiProviderItem"), CFSTR("backgroundColorVariant"), "@");

}

- (NSString)_axStringRepresentation
{
  void *v2;
  void *v3;
  id v4;

  -[CNPhotoPickerEmojiProviderItemAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("stringRepresentation"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = v2;

  return (NSString *)v3;
}

- (NSString)_axColorVariantName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_opt_class();
  -[CNPhotoPickerEmojiProviderItemAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("backgroundColorVariant"));
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
