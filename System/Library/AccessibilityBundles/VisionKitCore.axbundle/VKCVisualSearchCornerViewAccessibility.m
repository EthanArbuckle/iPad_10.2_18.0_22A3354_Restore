@implementation VKCVisualSearchCornerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VKCVisualSearchCornerView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VKCVisualSearchCornerView"), CFSTR("_showCornerLookupButtonsForResults:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VKCVisualSearchCornerView"), CFSTR("cornerButtons"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VKCVisualSearchCornerView"), CFSTR("analysis"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VKImageAnalysis"), CFSTR("imageAnalysisResult"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VKCImageAnalysisResult"), CFSTR("visualSearchResult"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VKCVisualSearchResult"), CFSTR("resultItems"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VKCVisualSearchResultItem"), CFSTR("shouldPlaceInCorner"), "B", 0);

}

- (int64_t)accessibilityContainerType
{
  if (-[VKCVisualSearchCornerViewAccessibility _axIsNotObscuredItemsContainer](self, "_axIsNotObscuredItemsContainer"))
    return 0;
  else
    return 4;
}

- (id)accessibilityLabel
{
  if (-[VKCVisualSearchCornerViewAccessibility _axIsNotObscuredItemsContainer](self, "_axIsNotObscuredItemsContainer"))
    return 0;
  accessibilityLocalizedString(CFSTR("out.of.focus.items"));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("items.count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCVisualSearchCornerViewAccessibility _axVisualSearchCornerButtons](self, "_axVisualSearchCornerButtons");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringWithFormat:", v4, objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)VKCVisualSearchCornerViewAccessibility;
  -[VKCVisualSearchCornerViewAccessibility _accessibilityLoadAccessibilityInformation](&v12, sel__accessibilityLoadAccessibilityInformation);
  -[VKCVisualSearchCornerViewAccessibility _axVisualSearchCornerButtons](self, "_axVisualSearchCornerButtons");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    do
    {
      objc_opt_class();
      objc_msgSend(v3, "objectAtIndexedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      __UIAccessibilityCastAsSafeCategory();
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = (void *)MEMORY[0x24BDD17C8];
      accessibilityLocalizedString(CFSTR("lookup.button.position"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "localizedStringWithFormat:", v10, ++v6, v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_axSetPositionInButtonsList:", v11);

    }
    while (v5 != v6);
  }

}

- (void)_showCornerLookupButtonsForResults:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VKCVisualSearchCornerViewAccessibility;
  -[VKCVisualSearchCornerViewAccessibility _showCornerLookupButtonsForResults:](&v4, sel__showCornerLookupButtonsForResults_, a3);
  -[VKCVisualSearchCornerViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (id)_axVisualSearchCornerButtons
{
  return (id)-[VKCVisualSearchCornerViewAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("cornerButtons"));
}

- (BOOL)_axIsNotObscuredItemsContainer
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[VKCVisualSearchCornerViewAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("analysis.imageAnalysisResult.visualSearchResult"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeArrayForKey:", CFSTR("resultItems"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "count") == 1)
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "safeBoolForKey:", CFSTR("shouldPlaceInCorner"));

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
