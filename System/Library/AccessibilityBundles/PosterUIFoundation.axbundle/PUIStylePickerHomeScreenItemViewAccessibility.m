@implementation PUIStylePickerHomeScreenItemViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PUIStylePickerHomeScreenItemView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUIStylePickerHomeScreenItemView"), CFSTR("label"), "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)-[PUIStylePickerHomeScreenItemViewAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("label"));
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUIStylePickerHomeScreenItemViewAccessibility;
  return *MEMORY[0x24BDF73B0] | -[PUIStylePickerHomeScreenItemViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
