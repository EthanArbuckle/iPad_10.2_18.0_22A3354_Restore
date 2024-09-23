@implementation VKCImageVisualSearchViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VKCImageVisualSearchView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VKCImageVisualSearchView"), CFSTR("resultViews"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VKCImageVisualSearchView"), CFSTR("updateUIForVisualSearchResultsClearExistingResults:includeNotVisibleItems:"), "v", "B", "B", 0);

}

- (int64_t)accessibilityContainerType
{
  if (-[VKCImageVisualSearchViewAccessibility _axIsItemsInFocusContainer](self, "_axIsItemsInFocusContainer"))
    return 4;
  else
    return 0;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("in.focus.items"));
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
  -[VKCImageVisualSearchViewAccessibility _axVisualSearchResultViews](self, "_axVisualSearchResultViews");
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
  v12.super_class = (Class)VKCImageVisualSearchViewAccessibility;
  -[VKCImageVisualSearchViewAccessibility _accessibilityLoadAccessibilityInformation](&v12, sel__accessibilityLoadAccessibilityInformation);
  -[VKCImageVisualSearchViewAccessibility _axVisualSearchResultViews](self, "_axVisualSearchResultViews");
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

- (BOOL)_accessibilityShouldIncludeParentCustomContent
{
  return 0;
}

- (void)updateUIForVisualSearchResultsClearExistingResults:(BOOL)a3 includeNotVisibleItems:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VKCImageVisualSearchViewAccessibility;
  -[VKCImageVisualSearchViewAccessibility updateUIForVisualSearchResultsClearExistingResults:includeNotVisibleItems:](&v5, sel_updateUIForVisualSearchResultsClearExistingResults_includeNotVisibleItems_, a3, a4);
  -[VKCImageVisualSearchViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (id)_axVisualSearchResultViews
{
  return (id)-[VKCImageVisualSearchViewAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("resultViews"));
}

- (BOOL)_axIsItemsInFocusContainer
{
  void *v2;
  BOOL v3;

  -[VKCImageVisualSearchViewAccessibility _axVisualSearchResultViews](self, "_axVisualSearchResultViews");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

@end
