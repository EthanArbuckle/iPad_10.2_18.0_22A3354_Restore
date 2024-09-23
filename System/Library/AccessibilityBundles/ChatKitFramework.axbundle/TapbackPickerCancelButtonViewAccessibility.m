@implementation TapbackPickerCancelButtonViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ChatKit.TapbackPickerCancelButtonView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("close.custom.emoji.picker"));
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TapbackPickerCancelButtonViewAccessibility;
  return *MEMORY[0x24BDF73B0] | -[TapbackPickerCancelButtonViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
