@implementation CAMSemanticStylePickerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CAMSemanticStylePicker");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("CAMViewfinderViewController"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CAMViewfinderViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMViewfinderViewController"), CFSTR("_semanticStyleForPreview"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMSemanticStylePicker"), CFSTR("numberOfStyles"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMSemanticStylePicker"), CFSTR("selectedStyleIndex"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMSemanticStyle"), CFSTR("displayName"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMSemanticStylePicker"), CFSTR("_setSelectedStyleIndex:shouldDelegate:shouldUpdateLayout:animated:"), "v", "Q", "B", "B", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMSemanticStylePicker"), CFSTR("pageControl"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("CAMSemanticStyleSettingsView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMSemanticStyleSettingsView"), CFSTR("_semanticStyleDetailView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMSemanticStyleDetailView"), CFSTR("semanticStyle"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilityCameraUID6xLocalizedString(CFSTR("semantic.style.picker"));
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CAMSemanticStylePickerAccessibility;
  return *MEMORY[0x24BDF73A0] | -[CAMSemanticStylePickerAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (void)accessibilityIncrement
{
  -[CAMSemanticStylePickerAccessibility _axChangeValueInDirection:](self, "_axChangeValueInDirection:", 2);
}

- (void)accessibilityDecrement
{
  -[CAMSemanticStylePickerAccessibility _axChangeValueInDirection:](self, "_axChangeValueInDirection:", 1);
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  unint64_t v3;
  void *v5;

  v3 = a3 - 1;
  if ((unint64_t)(a3 - 1) <= 1)
  {
    -[CAMSemanticStylePickerAccessibility _axChangeValueInDirection:](self, "_axChangeValueInDirection:");
    -[CAMSemanticStylePickerAccessibility _axAnnouncementValue](self, "_axAnnouncementValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilitySpeak();

  }
  return v3 < 2;
}

- (id)_axAnnouncementValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;

  -[CAMSemanticStylePickerAccessibility _axSemanticStyle](self, "_axSemanticStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("displayName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSemanticStylePickerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("pageControl"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilityValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_axChangeValueInDirection:(int64_t)a3
{
  -[CAMSemanticStylePickerAccessibility safeUnsignedIntegerForKey:](self, "safeUnsignedIntegerForKey:", CFSTR("numberOfStyles"));
  -[CAMSemanticStylePickerAccessibility safeUnsignedIntegerForKey:](self, "safeUnsignedIntegerForKey:", CFSTR("selectedStyleIndex"));
  AXPerformSafeBlock();
}

uint64_t __65__CAMSemanticStylePickerAccessibility__axChangeValueInDirection___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setSelectedStyleIndex:shouldDelegate:shouldUpdateLayout:animated:", *(_QWORD *)(a1 + 40), 1, 1, 0);
}

- (id)_axSemanticStyle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[CAMSemanticStylePickerAccessibility _accessibilityFindAncestor:startWithSelf:](self, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_accessibilityViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("_semanticStyleForPreview"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[CAMSemanticStylePickerAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", MEMORY[0x2348BFB60](CFSTR("CAMSemanticStyleSettingsView")));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safeValueForKey:", CFSTR("_semanticStyleDetailView"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "safeValueForKey:", CFSTR("semanticStyle"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

uint64_t __55__CAMSemanticStylePickerAccessibility__axSemanticStyle__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  char isKindOfClass;

  objc_msgSend(a2, "_accessibilityViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x2348BFB60](CFSTR("CAMViewfinderViewController"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end
