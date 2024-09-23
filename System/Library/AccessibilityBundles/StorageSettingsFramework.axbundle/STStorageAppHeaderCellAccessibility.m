@implementation STStorageAppHeaderCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("STStorageAppHeaderCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("STStorageAppHeaderCell"), CFSTR("_titleLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("STStorageAppHeaderCell"), CFSTR("_vendorLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("STStorageAppHeaderCell"), CFSTR("_infoLabel"), "UILabel");

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)-[STStorageAppHeaderCellAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("_titleLabel, _infoLabel, _vendorLabel"));
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73E0];
}

@end
