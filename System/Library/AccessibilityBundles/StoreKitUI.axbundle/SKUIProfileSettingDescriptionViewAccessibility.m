@implementation SKUIProfileSettingDescriptionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SKUIProfileSettingDescriptionView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SKUIProfileSettingDescriptionViewAccessibility;
  -[SKUIProfileSettingDescriptionViewAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[SKUIProfileSettingDescriptionViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_imageView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 0);

}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SKUIProfileSettingDescriptionViewAccessibility;
  -[SKUIProfileSettingDescriptionViewAccessibility layoutSubviews](&v3, sel_layoutSubviews);
  -[SKUIProfileSettingDescriptionViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
