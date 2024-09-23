@implementation PKSqueezePaletteButtonFactoryAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKSqueezePaletteButtonFactory");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKSqueezePaletteButtonFactory"), CFSTR("makeBackButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKSqueezePaletteButtonFactory"), CFSTR("makeTextBoxButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKSqueezePaletteButtonFactory"), CFSTR("makeSignatureButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKSqueezePaletteButtonFactory"), CFSTR("makeShapesButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKSqueezePaletteButtonFactory"), CFSTR("makeStickersButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKSqueezePaletteButtonFactory"), CFSTR("makeGearButton"), "@", 0);

}

- (id)makeBackButton
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKSqueezePaletteButtonFactoryAccessibility;
  -[PKSqueezePaletteButtonFactoryAccessibility makeBackButton](&v5, sel_makeBackButton);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityPencilKitLocalizedString(CFSTR("back"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAccessibilityLabel:", v3);

  return v2;
}

- (id)makeTextBoxButton
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKSqueezePaletteButtonFactoryAccessibility;
  -[PKSqueezePaletteButtonFactoryAccessibility makeTextBoxButton](&v5, sel_makeTextBoxButton);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityPencilKitLocalizedString(CFSTR("squeeze.add.textbox"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAccessibilityLabel:", v3);

  return v2;
}

- (id)makeSignatureButton
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKSqueezePaletteButtonFactoryAccessibility;
  -[PKSqueezePaletteButtonFactoryAccessibility makeSignatureButton](&v5, sel_makeSignatureButton);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityPencilKitLocalizedString(CFSTR("squeeze.add.signature"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAccessibilityLabel:", v3);

  return v2;
}

- (id)makeShapesButton
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKSqueezePaletteButtonFactoryAccessibility;
  -[PKSqueezePaletteButtonFactoryAccessibility makeShapesButton](&v5, sel_makeShapesButton);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityPencilKitLocalizedString(CFSTR("squeeze.add.shape"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAccessibilityLabel:", v3);

  return v2;
}

- (id)makeStickersButton
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKSqueezePaletteButtonFactoryAccessibility;
  -[PKSqueezePaletteButtonFactoryAccessibility makeStickersButton](&v5, sel_makeStickersButton);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityPencilKitLocalizedString(CFSTR("squeeze.add.sticker"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAccessibilityLabel:", v3);

  return v2;
}

- (id)makeGearButton
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKSqueezePaletteButtonFactoryAccessibility;
  -[PKSqueezePaletteButtonFactoryAccessibility makeGearButton](&v5, sel_makeGearButton);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityPencilKitLocalizedString(CFSTR("settings"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAccessibilityLabel:", v3);

  return v2;
}

@end
