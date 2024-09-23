@implementation STStorageTipInfoCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("STStorageTipInfoCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceVariable:withType:", CFSTR("STStorageTipInfoCell"), CFSTR("_infoLabel"), "UILabel");
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73E0];
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[STStorageTipInfoCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_infoLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end
