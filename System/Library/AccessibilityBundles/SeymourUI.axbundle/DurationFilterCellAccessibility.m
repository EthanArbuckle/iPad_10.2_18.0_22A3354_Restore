@implementation DurationFilterCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SeymourUI.DurationFilterCell");
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
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SeymourUI.DurationFilterCell"), CFSTR("durationLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SeymourUI.DurationFilterCell"), CFSTR("UICollectionViewCell"));

}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  -[DurationFilterCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("durationLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "text");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "intValue");

    v7 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("duration.format"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", v8, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DurationFilterCellAccessibility;
  return *MEMORY[0x24BDF73B0] | -[DurationFilterCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
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
  v11.super_class = (Class)DurationFilterCellAccessibility;
  -[DurationFilterCellAccessibility accessibilityApplyState:disabled:](&v11, sel_accessibilityApplyState_disabled_);
  if (!v5 || !v4)
  {
    if (v4)
    {
      v7 = -[DurationFilterCellAccessibility accessibilityTraits](self, "accessibilityTraits");
      -[DurationFilterCellAccessibility setAccessibilityTraits:](self, "setAccessibilityTraits:", *MEMORY[0x24BDF73E8] | v7);
    }
    else
    {
      -[DurationFilterCellAccessibility setAccessibilityTraits:](self, "setAccessibilityTraits:", -[DurationFilterCellAccessibility accessibilityTraits](self, "accessibilityTraits") & ~*MEMORY[0x24BDF73E8]);
      if (v5)
      {
        v8 = -[DurationFilterCellAccessibility accessibilityTraits](self, "accessibilityTraits");
        v9 = *MEMORY[0x24BDF7400] | v8;
LABEL_8:
        -[DurationFilterCellAccessibility setAccessibilityTraits:](self, "setAccessibilityTraits:", v9);
        return;
      }
    }
    v10 = *MEMORY[0x24BDF7400];
    v9 = -[DurationFilterCellAccessibility accessibilityTraits](self, "accessibilityTraits") & ~v10;
    goto LABEL_8;
  }
}

@end
