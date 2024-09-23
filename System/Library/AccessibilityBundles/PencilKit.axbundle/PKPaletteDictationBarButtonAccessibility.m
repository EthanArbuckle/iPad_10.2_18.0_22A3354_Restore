@implementation PKPaletteDictationBarButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKPaletteDictationBarButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilityPencilKitLocalizedString(CFSTR("pkpalettebutton.dictate"));
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPaletteDictationBarButtonAccessibility;
  return *MEMORY[0x24BDF73B0] | -[PKPaletteDictationBarButtonAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
