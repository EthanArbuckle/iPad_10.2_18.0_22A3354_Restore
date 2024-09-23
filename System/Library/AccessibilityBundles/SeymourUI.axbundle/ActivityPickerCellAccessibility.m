@implementation ActivityPickerCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SeymourUI.ActivityPickerCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:isKindOfClass:", CFSTR("SeymourUI.ActivityPickerCell"), CFSTR("UIView"));
}

- (id)accessibilityLabel
{
  return (id)-[ActivityPickerCellAccessibility _accessibilityTextForSubhierarchyIncludingHeaders:focusableItems:exclusions:](self, "_accessibilityTextForSubhierarchyIncludingHeaders:focusableItems:exclusions:", 0, 1, 0);
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ActivityPickerCellAccessibility;
  return *MEMORY[0x24BDF73B0] | -[ActivityPickerCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end
