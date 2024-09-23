@implementation HUIconCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HUIconCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUIconCell"), CFSTR("isDisabled"), "B", 0);
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  int v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HUIconCellAccessibility;
  v3 = -[HUIconCellAccessibility accessibilityTraits](&v7, sel_accessibilityTraits);
  v4 = -[HUIconCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isDisabled"));
  v5 = *MEMORY[0x24BDF73E8];
  if (!v4)
    v5 = 0;
  return v5 | v3;
}

@end
