@implementation STStorageSystemCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("STStorageSystemCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("STStorageSystemCell"), CFSTR("_titleLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("STStorageSystemCell"), CFSTR("_sizeLabel"), "UILabel");

}

- (id)accessibilityLabel
{
  return (id)-[STStorageSystemCellAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("_titleLabel, _sizeLabel"));
}

@end
