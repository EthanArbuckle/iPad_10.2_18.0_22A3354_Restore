@implementation SeymourUI_StandardFilterCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SeymourUI.StandardFilterCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SeymourUI.StandardFilterCell"), CFSTR("accessibilityApplyState:disabled:"), "v", "B", "B", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SeymourUI.StandardFilterCell"), CFSTR("UICollectionViewCell"));

}

- (id)accessibilityLabel
{
  return (id)-[SeymourUI_StandardFilterCellAccessibility _accessibilityTextForSubhierarchyIncludingHeaders:focusableItems:exclusions:](self, "_accessibilityTextForSubhierarchyIncludingHeaders:focusableItems:exclusions:", 0, 1, 0);
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SeymourUI_StandardFilterCellAccessibility;
  return *MEMORY[0x24BDF73B0] | -[SeymourUI_StandardFilterCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (BOOL)isAccessibilityElement
{
  return 1;
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
  v11.super_class = (Class)SeymourUI_StandardFilterCellAccessibility;
  -[SeymourUI_StandardFilterCellAccessibility accessibilityApplyState:disabled:](&v11, sel_accessibilityApplyState_disabled_);
  if (!v5 || !v4)
  {
    if (v4)
    {
      v7 = -[SeymourUI_StandardFilterCellAccessibility accessibilityTraits](self, "accessibilityTraits");
      -[SeymourUI_StandardFilterCellAccessibility setAccessibilityTraits:](self, "setAccessibilityTraits:", *MEMORY[0x24BDF73E8] | v7);
    }
    else
    {
      -[SeymourUI_StandardFilterCellAccessibility setAccessibilityTraits:](self, "setAccessibilityTraits:", -[SeymourUI_StandardFilterCellAccessibility accessibilityTraits](self, "accessibilityTraits") & ~*MEMORY[0x24BDF73E8]);
      if (v5)
      {
        v8 = -[SeymourUI_StandardFilterCellAccessibility accessibilityTraits](self, "accessibilityTraits");
        v9 = *MEMORY[0x24BDF7400] | v8;
LABEL_8:
        -[SeymourUI_StandardFilterCellAccessibility setAccessibilityTraits:](self, "setAccessibilityTraits:", v9);
        return;
      }
    }
    v10 = *MEMORY[0x24BDF7400];
    v9 = -[SeymourUI_StandardFilterCellAccessibility accessibilityTraits](self, "accessibilityTraits") & ~v10;
    goto LABEL_8;
  }
}

@end
