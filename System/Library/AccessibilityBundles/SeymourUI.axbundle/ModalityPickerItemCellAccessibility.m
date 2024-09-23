@implementation ModalityPickerItemCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SeymourUI.ModalityPickerItemCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SeymourUI.ModalityPickerItemCell"), CFSTR("accessibilityApplyState:disabled:"), "v", "B", "B", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ModalityPickerItemCellAccessibility;
  return *MEMORY[0x24BDF73B0] | -[ModalityPickerItemCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (void)accessibilityApplyState:(BOOL)a3 disabled:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  objc_super v11;

  v4 = a4;
  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ModalityPickerItemCellAccessibility;
  -[ModalityPickerItemCellAccessibility accessibilityApplyState:disabled:](&v11, sel_accessibilityApplyState_disabled_);
  if (!v5 || !v4)
  {
    if (v4)
    {
      v7 = -[ModalityPickerItemCellAccessibility accessibilityTraits](self, "accessibilityTraits");
      -[ModalityPickerItemCellAccessibility setAccessibilityTraits:](self, "setAccessibilityTraits:", *MEMORY[0x24BDF73E8] | v7);
    }
    else
    {
      -[ModalityPickerItemCellAccessibility setAccessibilityTraits:](self, "setAccessibilityTraits:", -[ModalityPickerItemCellAccessibility accessibilityTraits](self, "accessibilityTraits") & ~*MEMORY[0x24BDF73E8]);
      if (v5)
      {
        v8 = -[ModalityPickerItemCellAccessibility accessibilityTraits](self, "accessibilityTraits");
        v9 = *MEMORY[0x24BDF7400] | v8;
LABEL_8:
        -[ModalityPickerItemCellAccessibility setAccessibilityTraits:](self, "setAccessibilityTraits:", v9);
        return;
      }
    }
    v10 = *MEMORY[0x24BDF7400];
    v9 = -[ModalityPickerItemCellAccessibility accessibilityTraits](self, "accessibilityTraits") & ~v10;
    goto LABEL_8;
  }
}

@end
