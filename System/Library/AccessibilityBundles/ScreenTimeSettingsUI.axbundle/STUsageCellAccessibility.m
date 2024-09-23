@implementation STUsageCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("STUsageCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("STUsageCell"), CFSTR("_itemNameLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("STUsageCell"), CFSTR("_usageLabel"), "UILabel");

}

- (id)accessibilityLabel
{
  return (id)-[STUsageCellAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("_itemNameLabel, _usageLabel"));
}

@end
