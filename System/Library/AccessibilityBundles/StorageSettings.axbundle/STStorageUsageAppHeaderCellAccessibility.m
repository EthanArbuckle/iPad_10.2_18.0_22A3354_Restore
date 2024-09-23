@implementation STStorageUsageAppHeaderCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("STStorageUsageAppHeaderCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("STStorageUsageAppHeaderCell"), CFSTR("_titleLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("STStorageUsageAppHeaderCell"), CFSTR("_infoLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("STStorageUsageAppHeaderCell"), CFSTR("_vendorLabel"), "UILabel");

}

- (id)accessibilityLabel
{
  return (id)-[STStorageUsageAppHeaderCellAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("_titleLabel, _infoLabel, _vendorLabel"));
}

@end
