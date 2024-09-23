@implementation ENUILoggingStatusCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ENUILoggingStatusCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ENUILoggingStatusCell"), CFSTR("sectionLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ENUILoggingStatusCell"), CFSTR("titleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ENUILoggingStatusCell"), CFSTR("subtitleLabel"), "@", 0);

}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[ENUILoggingStatusCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("sectionLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityValue
{
  return (id)-[ENUILoggingStatusCellAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("titleLabel, subtitleLabel"));
}

@end
