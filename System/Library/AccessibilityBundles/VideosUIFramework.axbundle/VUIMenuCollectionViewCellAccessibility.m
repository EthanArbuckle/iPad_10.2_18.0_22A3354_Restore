@implementation VUIMenuCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VUIMenuCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasProperty:withType:", CFSTR("VUIMenuCollectionViewCell"), CFSTR("titleLabel"), "@");
}

- (id)accessibilityLabel
{
  return (id)-[VUIMenuCollectionViewCellAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("titleLabel"));
}

@end
