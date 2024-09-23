@implementation FMSettingRowViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("FindMy.FMSettingRowView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("FindMy.FMSettingRowView"), CFSTR("accessibilityChevronImage"), "@", 0);
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FMSettingRowViewAccessibility;
  v3 = *MEMORY[0x24BDF73B0] | -[FMSettingRowViewAccessibility accessibilityTraits](&v7, sel_accessibilityTraits);
  -[FMSettingRowViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityChevronImage"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = *MEMORY[0x24BDF7400] | v3;
  else
    v5 = v3 & ~*MEMORY[0x24BDF7400];

  return v5;
}

@end
