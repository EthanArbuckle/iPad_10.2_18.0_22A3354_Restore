@implementation ENUIRegionCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ENUIRegionCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ENUIRegionCell"), CFSTR("sectionLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ENUIRegionCell"), CFSTR("titleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ENUIRegionCell"), CFSTR("regionCapsuleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CapsuleLabel"), CFSTR("text"), "@", 0);

}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[ENUIRegionCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("sectionLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;

  -[ENUIRegionCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("regionCapsuleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENUIRegionCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("titleLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessibilityLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("text"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
