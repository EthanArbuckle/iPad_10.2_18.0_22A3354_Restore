@implementation PKPaletteContentViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKPaletteContentView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPaletteContentView"), CFSTR("undoRedoView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPaletteContentView"), CFSTR("toolPickerView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPaletteContentView"), CFSTR("colorPickerView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPaletteContentView"), CFSTR("additionalOptionsView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPaletteContentView"), CFSTR("contextualEditingView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPaletteContentView"), CFSTR("toolAndColorPickerContainerView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPaletteToolPickerAndColorPickerView"), CFSTR("lassoToolEditingContainerView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPaletteContentView"), CFSTR("paletteInputAssistantView"), "@", 0);

}

- (id)accessibilityElements
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  if (AXDoesRequestingClientDeserveAutomation())
  {
    v23.receiver = self;
    v23.super_class = (Class)PKPaletteContentViewAccessibility;
    -[PKPaletteContentViewAccessibility accessibilityElements](&v23, sel_accessibilityElements);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PKPaletteContentViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("undoRedoView"));
    v4 = objc_claimAutoreleasedReturnValue();
    -[PKPaletteContentViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("toolPickerView"));
    v5 = objc_claimAutoreleasedReturnValue();
    -[PKPaletteContentViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("paletteInputAssistantView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteContentViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("colorPickerView"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteContentViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("additionalOptionsView"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteContentViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("contextualEditingView"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteContentViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("toolAndColorPickerContainerView"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "safeValueForKey:", CFSTR("lassoToolEditingContainerView"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)v5;
    v18 = (void *)v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "axArrayByIgnoringNilElementsWithCount:", 7, v4, v5, v9, v6, v7, v11, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v20;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v20 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v16++), "setShouldGroupAccessibilityChildren:", 1);
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v14);
    }

    return v12;
  }
}

@end
