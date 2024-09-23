@implementation PreferredMusicGenreCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SeymourUI.PreferredMusicGenreCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SeymourUI.PreferredMusicGenreCell"), CFSTR("accessibilityApplyState:"), "v", "B", 0);
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PreferredMusicGenreCellAccessibility;
  return *MEMORY[0x24BDF73B0] | -[PreferredMusicGenreCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
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
  v8.super_class = (Class)PreferredMusicGenreCellAccessibility;
  -[PreferredMusicGenreCellAccessibility accessibilityApplyState:](&v8, sel_accessibilityApplyState_);
  if (v3)
  {
    v5 = -[PreferredMusicGenreCellAccessibility accessibilityTraits](self, "accessibilityTraits");
    v6 = *MEMORY[0x24BDF7400] | v5;
  }
  else
  {
    v7 = *MEMORY[0x24BDF7400];
    v6 = -[PreferredMusicGenreCellAccessibility accessibilityTraits](self, "accessibilityTraits") & ~v7;
  }
  -[PreferredMusicGenreCellAccessibility setAccessibilityTraits:](self, "setAccessibilityTraits:", v6);
}

@end
