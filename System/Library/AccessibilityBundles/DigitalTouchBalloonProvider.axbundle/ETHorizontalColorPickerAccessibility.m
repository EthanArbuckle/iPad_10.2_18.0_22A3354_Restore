@implementation ETHorizontalColorPickerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ETHorizontalColorPicker");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("ETHorizontalColorPicker"), CFSTR("paletteCircles"), "@");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ETHorizontalColorPicker"), CFSTR("setDimmed:excludeSelectedColor:animated:"), "v", "B", "B", "B", 0);

}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

- (int64_t)accessibilityNavigationStyle
{
  return 2;
}

- (void)setDimmed:(BOOL)a3 excludeSelectedColor:(BOOL)a4 animated:(BOOL)a5
{
  _BOOL4 v5;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BOOL8 v13;
  uint64_t i;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  char v19;
  objc_super v20;
  _BYTE v21[128];
  uint64_t v22;

  v5 = a3;
  v22 = *MEMORY[0x24BDAC8D0];
  v20.receiver = self;
  v20.super_class = (Class)ETHorizontalColorPickerAccessibility;
  -[ETHorizontalColorPickerAccessibility setDimmed:excludeSelectedColor:animated:](&v20, sel_setDimmed_excludeSelectedColor_animated_, a3, a4, a5);
  v19 = 0;
  objc_opt_class();
  -[ETHorizontalColorPickerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("paletteCircles"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    v13 = !v5;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "setIsAccessibilityElement:", v13, (_QWORD)v15);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
    }
    while (v11);
  }

}

@end
