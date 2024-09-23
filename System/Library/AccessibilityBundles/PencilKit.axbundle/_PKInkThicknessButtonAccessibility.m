@implementation _PKInkThicknessButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_PKInkThicknessButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("PKPaletteErasingAttributesView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPaletteErasingAttributesView"), CFSTR("eraserType"), "q", 0);

}

- (BOOL)isAccessibilityElement
{
  void *v2;
  BOOL v3;

  -[_PKInkThicknessButtonAccessibility _axPKPaletteErasingAttributesView](self, "_axPKPaletteErasingAttributesView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeIntegerForKey:", CFSTR("eraserType")) == 0;

  return v3;
}

- (id)accessibilityLabel
{
  return accessibilityPencilKitLocalizedString(CFSTR("tool.weight"));
}

- (id)_axPKPaletteErasingAttributesView
{
  return (id)-[_PKInkThicknessButtonAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", MEMORY[0x2349193BC](CFSTR("PKPaletteErasingAttributesView"), a2));
}

@end
