@implementation AVTColorWheelViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AVTColorWheelView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("editor.color.expand"));
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVTColorWheelViewAccessibility;
  return *MEMORY[0x24BDF73B0] | -[AVTColorWheelViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
