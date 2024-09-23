@implementation AKShapesPickerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AKShapesPicker");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AKShapesPicker"), CFSTR("setShapes:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("AKShapesPicker"), CFSTR("AKModernToolbarPicker"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AKModernToolbarPicker"), CFSTR("stackview"), "@", 0);

}

- (void)setShapes:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AKShapesPickerAccessibility;
  -[AKShapesPickerAccessibility setShapes:](&v4, sel_setShapes_, a3);
  -[AKShapesPickerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  unint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  objc_super v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v16.receiver = self;
  v16.super_class = (Class)AKShapesPickerAccessibility;
  -[AKShapesPickerAccessibility _accessibilityLoadAccessibilityInformation](&v16, sel__accessibilityLoadAccessibilityInformation);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[AKShapesPickerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("stackview"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subviews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "tag") - 764000;
        if (v10 <= 7 && ((0xA5u >> v10) & 1) != 0)
        {
          accessibilityLocalizedString(off_25014EEB8[v10]);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setAccessibilityLabel:", v11);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    }
    while (v6);
  }

}

@end
