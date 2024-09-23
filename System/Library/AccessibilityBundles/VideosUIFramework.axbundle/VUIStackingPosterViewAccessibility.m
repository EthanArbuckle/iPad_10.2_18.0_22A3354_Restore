@implementation VUIStackingPosterViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VUIStackingPosterView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("VideosUI.EditorialCollectionViewCell"));
  objc_msgSend(v3, "validateClass:", CFSTR("VUILabel"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VUIStackingPosterView"), CFSTR("animatedLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VUIStackingPosterView"), CFSTR("mainImageComponent"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VUIStackingPosterView"), CFSTR("filteredComponents"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  const __CFString *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  uint64_t v20;
  id obj;
  VUIStackingPosterViewAccessibility *v22;
  _QWORD v23[4];
  id v24;
  char v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  objc_super v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v30.receiver = self;
  v30.super_class = (Class)VUIStackingPosterViewAccessibility;
  -[VUIStackingPosterViewAccessibility _accessibilityLoadAccessibilityInformation](&v30, sel__accessibilityLoadAccessibilityInformation);
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v25 = 0;
  objc_opt_class();
  v22 = self;
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subviews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v4;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v5)
  {
    v6 = v5;
    v7 = CFSTR("VUIStackedImageView");
    v8 = *(_QWORD *)v27;
    do
    {
      v9 = 0;
      v20 = v6;
      do
      {
        if (*(_QWORD *)v27 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v9);
        MEMORY[0x2349244BC](v7);
        if ((objc_opt_isKindOfClass() & 1) != 0
          || (MEMORY[0x2349244BC](CFSTR("VUILayeredImageContainerView")), (objc_opt_isKindOfClass() & 1) != 0))
        {
          -[VUIStackingPosterViewAccessibility _accessibilityAncestorIsKindOf:](v22, "_accessibilityAncestorIsKindOf:", MEMORY[0x2349244BC](CFSTR("VideosUI.EditorialCollectionViewCell")));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            objc_msgSend(v10, "accessibilityLabel");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v23[0] = MEMORY[0x24BDAC760];
            v23[1] = 3221225472;
            v23[2] = __80__VUIStackingPosterViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
            v23[3] = &unk_2503D2D90;
            v24 = v12;
            v13 = v12;
            objc_msgSend(v11, "_accessibilityFindSubviewDescendantsPassingTest:", v23);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = (void *)MEMORY[0x24BDBCE30];
            AXLabelForElements();
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "axArrayByIgnoringNilElementsWithCount:", 2, v13, v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            AXLabelForElements();
            v18 = v7;
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "setAccessibilityLabel:", v19);

            v7 = v18;
            v6 = v20;

          }
        }
        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v6);
  }

}

uint64_t __80__VUIStackingPosterViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  MEMORY[0x2349244BC](CFSTR("VUILabel"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "accessibilityLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "length"))
    {
      v5 = *(void **)(a1 + 32);
      objc_msgSend(v3, "accessibilityLabel");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "axContainsString:", v6) ^ 1;

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v16;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  -[VUIStackingPosterViewAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("filteredComponents"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIStackingPosterViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("animatedLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIStackingPosterViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("mainImageComponent"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessibilityLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilityLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityExpandTVEpisodeNumber(v7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = v3;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16, v18, CFSTR("__AXStringForVariablesSentinel"));
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v21;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v13);
        if (v14 != v4 && v14 != v5)
        {
          objc_msgSend(v14, "accessibilityLabel");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          __UIAXStringForVariables();
          v16 = objc_claimAutoreleasedReturnValue();

          v8 = (void *)v16;
        }
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v11);
  }

  return v8;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VUIStackingPosterViewAccessibility;
  -[VUIStackingPosterViewAccessibility layoutSubviews](&v3, sel_layoutSubviews);
  -[VUIStackingPosterViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
