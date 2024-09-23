@implementation MAResultViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MAResultView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MAResultView"), CFSTR("_nameLabel"), "_MKUILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MAResultView"), CFSTR("_detailLine1aLabel"), "_MKUILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MAResultView"), CFSTR("_detailLine1bLabel"), "_MKUILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MAResultView"), CFSTR("_detailLine2Label"), "MKTransitInfoLabelView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MAResultView"), CFSTR("_placeDataMapItem"), "MKMapItem");

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;

  -[MAResultViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_nameLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAResultViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_detailLine1aLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilityLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAResultViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_detailLine1bLabel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accessibilityLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAResultViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_detailLine2Label"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "accessibilityLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
