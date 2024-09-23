@implementation ENUIExposureCheckCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ENUIExposureCheckCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ENUIExposureCheckCell"), CFSTR("sectionLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ENUIExposureCheckCell"), CFSTR("titleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ENUIExposureCheckCell"), CFSTR("subtitleLabel"), "@", 0);

}

- (id)accessibilityLabel
{
  return (id)-[ENUIExposureCheckCellAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("sectionLabel, titleLabel, subtitleLabel"));
}

@end
