@implementation PKPaletteViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKPaletteView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPaletteView"), CFSTR("dismissPalettePopoverWithCompletion:"), "v", "@?", 0);
}

- (void)dismissPalettePopoverWithCompletion:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  if ((objc_msgSend((id)*MEMORY[0x24BDF74F8], "_accessibilityBoolValueForKey:", CFSTR("AXIsHitTestingPKPaletteHostViewKey")) & 1) == 0)
  {
    v5.receiver = self;
    v5.super_class = (Class)PKPaletteViewAccessibility;
    -[PKPaletteViewAccessibility dismissPalettePopoverWithCompletion:](&v5, sel_dismissPalettePopoverWithCompletion_, v4);
  }

}

@end
