@implementation BRShareSettingsButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("BRShareSettingsButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BRShareSettingsButton"), CFSTR("titleLabel"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BRShareSettingsButton"), CFSTR("detailLabel"), "v", 0);

}

- (id)accessibilityLabel
{
  return (id)-[BRShareSettingsButtonAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("titleLabel, detailLabel"));
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

@end
