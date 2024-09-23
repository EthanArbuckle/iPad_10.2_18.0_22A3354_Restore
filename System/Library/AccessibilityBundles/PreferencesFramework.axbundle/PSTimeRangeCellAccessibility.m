@implementation PSTimeRangeCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PSTimeRangeCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PSTimeRangeCell"), CFSTR("_fromTitle"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PSTimeRangeCell"), CFSTR("_fromTime"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PSTimeRangeCell"), CFSTR("_toTitle"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PSTimeRangeCell"), CFSTR("_toTime"), "UILabel");

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PSTimeRangeCellAccessibility;
  -[PSTimeRangeCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
  return _AXTraitsRemoveTrait();
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

  -[PSTimeRangeCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_fromTitle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSTimeRangeCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_fromTime"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilityLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSTimeRangeCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_toTitle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accessibilityLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSTimeRangeCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_toTime"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "accessibilityLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
