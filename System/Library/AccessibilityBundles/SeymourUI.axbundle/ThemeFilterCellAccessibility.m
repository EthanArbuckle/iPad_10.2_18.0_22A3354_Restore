@implementation ThemeFilterCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SeymourUI.ThemeFilterCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SeymourUI.DurationFilterCell"), CFSTR("accessibilityApplyState:disabled:"), "v", "B", "B", 0);
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("SeymourUI.ThemeFilterCell"), CFSTR("themeLabel"), "UILabel");

}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[ThemeFilterCellAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("themeLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ThemeFilterCellAccessibility;
  return *MEMORY[0x24BDF73B0] | -[ThemeFilterCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
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
  v11.super_class = (Class)ThemeFilterCellAccessibility;
  -[ThemeFilterCellAccessibility accessibilityApplyState:disabled:](&v11, sel_accessibilityApplyState_disabled_);
  if (!v5 || !v4)
  {
    if (v4)
    {
      v7 = -[ThemeFilterCellAccessibility accessibilityTraits](self, "accessibilityTraits");
      -[ThemeFilterCellAccessibility setAccessibilityTraits:](self, "setAccessibilityTraits:", *MEMORY[0x24BDF73E8] | v7);
    }
    else
    {
      -[ThemeFilterCellAccessibility setAccessibilityTraits:](self, "setAccessibilityTraits:", -[ThemeFilterCellAccessibility accessibilityTraits](self, "accessibilityTraits") & ~*MEMORY[0x24BDF73E8]);
      if (v5)
      {
        v8 = -[ThemeFilterCellAccessibility accessibilityTraits](self, "accessibilityTraits");
        v9 = *MEMORY[0x24BDF7400] | v8;
LABEL_8:
        -[ThemeFilterCellAccessibility setAccessibilityTraits:](self, "setAccessibilityTraits:", v9);
        return;
      }
    }
    v10 = *MEMORY[0x24BDF7400];
    v9 = -[ThemeFilterCellAccessibility accessibilityTraits](self, "accessibilityTraits") & ~v10;
    goto LABEL_8;
  }
}

@end
