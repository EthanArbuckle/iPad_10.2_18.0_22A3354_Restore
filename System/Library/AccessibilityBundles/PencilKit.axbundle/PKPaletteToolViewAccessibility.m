@implementation PKPaletteToolViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKPaletteToolView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPaletteView"), CFSTR("delegate"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKToolPicker"), CFSTR("isRulerActive"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPaletteToolView"), CFSTR("toolIdentifier"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIControl"), CFSTR("isSelected"), "B", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("PKPaletteToolView"), CFSTR("UIControl"));

}

- (id)_axToolPicker
{
  void *v2;
  void *v3;

  -[PKPaletteToolViewAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", MEMORY[0x2349193BC](CFSTR("PKPaletteView"), a2));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("delegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PKPaletteToolViewAccessibility;
  -[PKPaletteToolViewAccessibility accessibilityLabel](&v9, sel_accessibilityLabel);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteToolViewAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("toolIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityNameForInkIdentifier(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    v5 = v3;
  v7 = v5;

  return v7;
}

- (unint64_t)accessibilityTraits
{
  void *v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  objc_super v8;

  -[PKPaletteToolViewAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("toolIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)PKPaletteToolViewAccessibility;
  v4 = -[PKPaletteToolViewAccessibility accessibilityTraits](&v8, sel_accessibilityTraits);
  if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDE3460]))
    v5 = ~*MEMORY[0x24BDF7400];
  else
    v5 = -1;
  v6 = v5 & v4 | *MEMORY[0x24BDF73B0];

  return v6;
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  objc_super v9;

  -[PKPaletteToolViewAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("toolIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDE3420]) & 1) != 0)
  {
    v4 = 0;
  }
  else if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDE3460]))
  {
    -[PKPaletteToolViewAccessibility _axToolPicker](self, "_axToolPicker");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      if (objc_msgSend(v5, "safeBoolForKey:", CFSTR("isRulerActive")))
        v7 = CFSTR("ruler.active");
      else
        v7 = CFSTR("ruler.inactive");
      accessibilityPencilKitLocalizedString(v7);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }

  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)PKPaletteToolViewAccessibility;
    -[PKPaletteToolViewAccessibility accessibilityValue](&v9, sel_accessibilityValue);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (id)accessibilityHint
{
  void *v3;
  void *v4;

  -[PKPaletteToolViewAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("toolIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDE3418]) & 1) != 0
     || objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDE3430]))
    && -[PKPaletteToolViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isSelected")))
  {
    accessibilityPencilKitLocalizedString(CFSTR("object.eraser.tool.hint"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
