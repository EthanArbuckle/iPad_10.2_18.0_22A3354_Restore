@implementation STStorageMediaItemCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("STStorageMediaItemCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("STStorageMediaItemCell"), CFSTR("_titleLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("STStorageMediaItemCell"), CFSTR("_infoLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("STStorageMediaItemCell"), CFSTR("_sizeLabel"), "UILabel");

}

- (id)accessibilityLabel
{
  return (id)-[STStorageMediaItemCellAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("_titleLabel, _infoLabel"));
}

- (id)accessibilityValue
{
  return (id)-[STStorageMediaItemCellAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("_sizeLabel"));
}

@end
