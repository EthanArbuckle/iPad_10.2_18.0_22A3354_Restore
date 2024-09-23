@implementation SKUIEditProfileSettingDescriptionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SKUIEditProfileSettingDescriptionView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SKUIEditProfileSettingDescriptionView"), CFSTR("_imageView"), "SKUIImageView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SKUIEditProfileSettingDescriptionView"), CFSTR("_editButton"), "UIButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SKUIEditProfileSettingDescriptionView"), CFSTR("_nameField"), "UITextField");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SKUIEditProfileSettingDescriptionView"), CFSTR("_handleField"), "UITextField");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SKUIEditProfileSettingDescriptionView"), CFSTR("reloadWithSettingDescription: width: context:"), "v", "@", "d", "@", 0);

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
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SKUIEditProfileSettingDescriptionViewAccessibility;
  -[SKUIEditProfileSettingDescriptionViewAccessibility _accessibilityLoadAccessibilityInformation](&v13, sel__accessibilityLoadAccessibilityInformation);
  -[SKUIEditProfileSettingDescriptionViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_imageView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilitySKUILocalizedString(CFSTR("music.account.photo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

  -[SKUIEditProfileSettingDescriptionViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_editButton"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilitySKUILocalizedString(CFSTR("music.account.edit.photo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityLabel:", v6);

  objc_opt_class();
  -[SKUIEditProfileSettingDescriptionViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_nameField"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "placeholder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAccessibilityLabel:", v9);

  objc_opt_class();
  -[SKUIEditProfileSettingDescriptionViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_handleField"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "placeholder");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAccessibilityLabel:", v12);

}

- (void)reloadWithSettingDescription:(id)a3 width:(double)a4 context:(id)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SKUIEditProfileSettingDescriptionViewAccessibility;
  -[SKUIEditProfileSettingDescriptionViewAccessibility reloadWithSettingDescription:width:context:](&v6, sel_reloadWithSettingDescription_width_context_, a3, a5, a4);
  -[SKUIEditProfileSettingDescriptionViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
