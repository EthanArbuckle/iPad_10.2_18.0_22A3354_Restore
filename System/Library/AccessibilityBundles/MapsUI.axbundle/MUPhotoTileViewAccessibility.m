@implementation MUPhotoTileViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MUPhotoTileView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceVariable:withType:", CFSTR("MUPhotoTileView"), CFSTR("_titleLabel"), "UILabel");
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)-[MUPhotoTileViewAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("_titleLabel"));
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MUPhotoTileViewAccessibility;
  return *MEMORY[0x24BDF73B0] | -[MUPhotoTileViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits) | *MEMORY[0x24BDF73C8];
}

@end
