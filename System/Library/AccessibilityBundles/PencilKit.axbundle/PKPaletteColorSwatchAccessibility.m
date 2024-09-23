@implementation PKPaletteColorSwatchAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKPaletteColorSwatch");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("PKPaletteMulticolorSwatch"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPaletteColorSwatch"), CFSTR("isSelected"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPaletteColorSwatch"), CFSTR("swatchColor"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKSwatchColor"), CFSTR("identifier"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKSwatchColor"), CFSTR("color"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  int v3;
  unint64_t v4;
  _QWORD *v5;
  objc_super v7;

  v3 = -[PKPaletteColorSwatchAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isSelected"));
  v7.receiver = self;
  v7.super_class = (Class)PKPaletteColorSwatchAccessibility;
  v4 = -[PKPaletteColorSwatchAccessibility accessibilityTraits](&v7, sel_accessibilityTraits);
  v5 = (_QWORD *)MEMORY[0x24BDF7400];
  if (!v3)
    v5 = (_QWORD *)MEMORY[0x24BDF73E0];
  return *MEMORY[0x24BDF73B0] | v4 | *v5;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;

  MEMORY[0x2349193BC](CFSTR("PKPaletteMulticolorSwatch"), a2);
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    -[PKPaletteColorSwatchAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("swatchColor"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safeStringForKey:", CFSTR("identifier"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("blue")) & 1) != 0)
    {
      v6 = CFSTR("blue.color");
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("red")) & 1) != 0)
    {
      v6 = CFSTR("red.color");
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("yellow")) & 1) != 0)
    {
      v6 = CFSTR("yellow.color");
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("black")) & 1) != 0)
    {
      v6 = CFSTR("black.color");
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("white")) & 1) != 0)
    {
      v6 = CFSTR("white.color");
    }
    else
    {
      if (!objc_msgSend(v5, "isEqualToString:", CFSTR("green")))
      {
        v3 = 0;
        goto LABEL_16;
      }
      v6 = CFSTR("green.color");
    }
    accessibilityPencilKitLocalizedString(v6);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:

    return v3;
  }
  accessibilityPencilKitLocalizedString(CFSTR("color.picker"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  return v3;
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;
  char v12;

  MEMORY[0x2349193BC](CFSTR("PKPaletteMulticolorSwatch"), a2);
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_7;
  -[PKPaletteColorSwatchAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("swatchColor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("color"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
LABEL_6:

LABEL_7:
    v11.receiver = self;
    v11.super_class = (Class)PKPaletteColorSwatchAccessibility;
    -[PKPaletteColorSwatchAccessibility accessibilityValue](&v11, sel_accessibilityValue);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    return v9;
  }
  v12 = 0;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  AXColorStringForColor();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "length"))
  {

    goto LABEL_6;
  }
  v7 = (void *)MEMORY[0x24BDD17C8];
  accessibilityPencilKitLocalizedString(CFSTR("color.picker.current"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
