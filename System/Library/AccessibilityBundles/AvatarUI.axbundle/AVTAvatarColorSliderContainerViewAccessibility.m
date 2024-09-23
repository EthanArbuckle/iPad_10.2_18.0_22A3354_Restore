@implementation AVTAvatarColorSliderContainerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AVTAvatarColorSliderContainerView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("AVTColorPreset"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTAvatarColorSliderContainerView"), CFSTR("slider"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTAvatarColorSliderContainerView"), CFSTR("sectionItem"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTAvatarAttributeEditorSectionColorItem"), CFSTR("color"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTCoreModelColor"), CFSTR("baseColorPreset"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTAvatarColorSliderContainerView"), CFSTR("setSectionItem:animated:"), "v", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTColorPreset"), CFSTR("colorPresetWithVariation:"), "@", "f", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTColorPreset"), CFSTR("previewColor"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  _QWORD v3[5];
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVTAvatarColorSliderContainerViewAccessibility;
  -[AVTAvatarColorSliderContainerViewAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  v3[0] = 0;
  v3[1] = v3;
  v3[2] = 0x3032000000;
  v3[3] = __Block_byref_object_copy_;
  v3[4] = __Block_byref_object_dispose_;
  -[AVTAvatarColorSliderContainerViewAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("sectionItem.color.baseColorPreset"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  MEMORY[0x23490761C](CFSTR("AVTColorPreset"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
    AXPerformSafeBlock();
  _Block_object_dispose(v3, 8);

}

void __92__AVTAvatarColorSliderContainerViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1, double a2)
{
  void *v3;
  double v4;
  void *v5;
  id v6;
  id v7;

  LODWORD(a2) = -1.0;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "colorPresetWithVariation:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = 1.0;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "colorPresetWithVariation:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v3;
    v7 = v5;
    AXPerformSafeBlock();

  }
}

void __92__AVTAvatarColorSliderContainerViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a1[4], "previewColor");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  AXColorStringForColor();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "previewColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  AXColorStringForColor();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[6], "safeValueForKey:", CFSTR("slider"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_accessibilitySetRetainedValue:forKey:", v2, CFSTR("AccessibilityMinColorNameKey"));
  objc_msgSend(v5, "_accessibilitySetRetainedValue:forKey:", v4, CFSTR("AccessibilityMaxColorNameKey"));

}

- (void)setSectionItem:(id)a3 animated:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVTAvatarColorSliderContainerViewAccessibility;
  -[AVTAvatarColorSliderContainerViewAccessibility setSectionItem:animated:](&v5, sel_setSectionItem_animated_, a3, a4);
  -[AVTAvatarColorSliderContainerViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
