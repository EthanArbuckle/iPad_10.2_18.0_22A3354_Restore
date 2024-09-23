@implementation PreferredTrainerCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SeymourUI.PreferredTrainerCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SeymourUI.PreferredTrainerCell"), CFSTR("accessibilityApplyState:"), "v", "B", 0);
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PreferredTrainerCellAccessibility;
  return *MEMORY[0x24BDF73B0] | -[PreferredTrainerCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (void)accessibilityApplyState:(BOOL)a3
{
  _BOOL4 v3;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PreferredTrainerCellAccessibility;
  -[PreferredTrainerCellAccessibility accessibilityApplyState:](&v8, sel_accessibilityApplyState_);
  if (v3)
  {
    v5 = -[PreferredTrainerCellAccessibility accessibilityTraits](self, "accessibilityTraits");
    v6 = *MEMORY[0x24BDF7400] | v5;
  }
  else
  {
    v7 = *MEMORY[0x24BDF7400];
    v6 = -[PreferredTrainerCellAccessibility accessibilityTraits](self, "accessibilityTraits") & ~v7;
  }
  -[PreferredTrainerCellAccessibility setAccessibilityTraits:](self, "setAccessibilityTraits:", v6);
}

@end
