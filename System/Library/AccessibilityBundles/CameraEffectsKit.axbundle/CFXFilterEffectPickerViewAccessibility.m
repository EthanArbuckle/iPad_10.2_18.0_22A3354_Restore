@implementation CFXFilterEffectPickerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CFXFilterEffectPickerView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CFXFilterEffectPickerView"), CFSTR("isDisplayingExpandedLayout"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CFXFilterEffectPickerView"), CFSTR("cachedEffectCount"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CFXFilterEffectPickerView"), CFSTR("selectedIndex"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CFXFilterEffectPickerView"), CFSTR("indexPathForCenterOfCollectionView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CFXFilterEffectPickerView"), CFSTR("delegate"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CFXFilterEffectPickerView"), CFSTR("collectionView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CFXFilterEffectPickerView"), CFSTR("compactSelectedTitleView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CFXEffectPickerView"), CFSTR("effectIndexForCellIndex:"), "Q", "Q", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CFXFilterEffectPickerView"), CFSTR("CFXEffectPickerView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CFXEffectPickerViewController"), CFSTR("effectPickerView:effectAtIndex:"), "@", "@", "q", 0);

}

- (id)_axFunCamFilterCarousel
{
  JUMPOUT(0x234909C58);
}

- (void)_setAXFunCamFilterCarousel:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (void)_accessibilityLoadAccessibilityInformation
{
  AX_FunCamFilterCarousel *v3;
  void *v4;
  void *v5;
  objc_super v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v6.receiver = self;
  v6.super_class = (Class)CFXFilterEffectPickerViewAccessibility;
  -[CFXFilterEffectPickerViewAccessibility _accessibilityLoadAccessibilityInformation](&v6, sel__accessibilityLoadAccessibilityInformation);
  -[CFXFilterEffectPickerViewAccessibility _axFunCamFilterCarousel](self, "_axFunCamFilterCarousel");
  v3 = (AX_FunCamFilterCarousel *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v3 = -[AX_FunCamFilterCarousel initWithAccessibilityContainer:]([AX_FunCamFilterCarousel alloc], "initWithAccessibilityContainer:", self);
    -[CFXFilterEffectPickerViewAccessibility _setAXFunCamFilterCarousel:](self, "_setAXFunCamFilterCarousel:", v3);
  }
  v7[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXFilterEffectPickerViewAccessibility _accessibilitySetAdditionalElements:](self, "_accessibilitySetAdditionalElements:", v4);

  -[CFXFilterEffectPickerViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("compactSelectedTitleView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIsAccessibilityElement:", 0);

}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CFXFilterEffectPickerViewAccessibility;
  -[CFXFilterEffectPickerViewAccessibility layoutSubviews](&v3, sel_layoutSubviews);
  -[CFXFilterEffectPickerViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)subviewsDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CFXFilterEffectPickerViewAccessibility;
  -[CFXFilterEffectPickerViewAccessibility subviewsDidLoad](&v3, sel_subviewsDidLoad);
  -[CFXFilterEffectPickerViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
