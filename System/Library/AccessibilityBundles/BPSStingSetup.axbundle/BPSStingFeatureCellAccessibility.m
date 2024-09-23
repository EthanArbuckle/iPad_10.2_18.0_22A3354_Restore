@implementation BPSStingFeatureCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("BPSStingFeatureCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("BPSStingFeatureCell"), CFSTR("titleLabel"), "@");
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("BPSStingFeatureCell"), CFSTR("subtitleLabel"), "@");

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v6;

  -[BPSStingFeatureCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BPSStingFeatureCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("subtitleLabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
