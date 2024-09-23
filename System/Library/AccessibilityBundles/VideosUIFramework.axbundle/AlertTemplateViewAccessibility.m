@implementation AlertTemplateViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VideosUI.AlertTemplateView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("VideosUI.AlertTemplateView"), CFSTR("collectionView"), "VUILegacyCollectionView");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("VideosUI.AlertTemplateView"), CFSTR("aboveCollectionComponents"), "Array<(UIView, ViewLayout)>");

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _QWORD v15[5];
  objc_super v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v16.receiver = self;
  v16.super_class = (Class)AlertTemplateViewAccessibility;
  -[AlertTemplateViewAccessibility _accessibilityLoadAccessibilityInformation](&v16, sel__accessibilityLoadAccessibilityInformation);
  -[AlertTemplateViewAccessibility safeSwiftArrayForKey:](self, "safeSwiftArrayForKey:", CFSTR("aboveCollectionComponents"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __76__AlertTemplateViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v15[3] = &unk_2503D2930;
  v15[4] = self;
  objc_msgSend(v3, "axMapObjectsUsingBlock:", v15);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    v9 = *MEMORY[0x24BDF73C0];
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10), "setAccessibilityTraits:", v9 | objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10), "accessibilityTraits", (_QWORD)v11));
        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
    }
    while (v7);
  }

}

id __76__AlertTemplateViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;

  v3 = a2;
  objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "safeSwiftValueForKey:", CFSTR("obj"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AlertTemplateViewAccessibility;
  -[AlertTemplateViewAccessibility layoutSubviews](&v3, sel_layoutSubviews);
  -[AlertTemplateViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
