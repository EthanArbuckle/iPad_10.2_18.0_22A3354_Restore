@implementation CardHeaderButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("Arcade.CardHeaderButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CardHeaderButtonAccessibility;
  return *MEMORY[0x24BDF73B0] | -[CardHeaderButtonAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (id)accessibilityLabel
{
  __CFString *v3;
  void *v4;
  objc_super v6;

  if (-[CardHeaderButtonAccessibility _axIsCloseButton](self, "_axIsCloseButton"))
  {
    v3 = CFSTR("popover.view.dismiss.article");
  }
  else
  {
    if (!-[CardHeaderButtonAccessibility _axIsBackButton](self, "_axIsBackButton"))
    {
      v6.receiver = self;
      v6.super_class = (Class)CardHeaderButtonAccessibility;
      -[CardHeaderButtonAccessibility accessibilityLabel](&v6, sel_accessibilityLabel);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      return v4;
    }
    v3 = CFSTR("back.button");
  }
  accessibilityAppStoreLocalizedString(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  return v4;
}

- (id)accessibilityHint
{
  void *v3;
  objc_super v5;

  if (-[CardHeaderButtonAccessibility _axIsCloseButton](self, "_axIsCloseButton"))
  {
    accessibilityAppStoreLocalizedString(CFSTR("popover.view.dismiss.article.hint"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)CardHeaderButtonAccessibility;
    -[CardHeaderButtonAccessibility accessibilityHint](&v5, sel_accessibilityHint);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)accessibilityUserInputLabels
{
  void *v3;
  void *v4;
  objc_super v6;

  if (-[CardHeaderButtonAccessibility _axIsCloseButton](self, "_axIsCloseButton"))
  {
    accessibilityAppStoreLocalizedString(CFSTR("popover.view.dismiss.article.user.input"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x234906688]();
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    return v4;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)CardHeaderButtonAccessibility;
    -[CardHeaderButtonAccessibility accessibilityUserInputLabels](&v6, sel_accessibilityUserInputLabels);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)_imageAsset
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_opt_class();
  -[CardHeaderButtonAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("vibrantImageView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeValueForKey:", CFSTR("_imageAsset"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeStringForKey:", CFSTR("assetName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)_axIsCloseButton
{
  void *v2;
  char v3;

  -[CardHeaderButtonAccessibility _imageAsset](self, "_imageAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("xmark"));

  return v3;
}

- (BOOL)_axIsBackButton
{
  void *v2;
  char v3;

  -[CardHeaderButtonAccessibility _imageAsset](self, "_imageAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("chevron.backward"));

  return v3;
}

@end
