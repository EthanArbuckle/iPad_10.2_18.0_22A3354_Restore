@implementation DirectionsStartEndTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("DirectionsStartEndTableViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("DirectionsStartEndTableViewCell"), CFSTR("_startEndView"), "DirectionsStartEndContentView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("DirectionsStartEndContentView"), CFSTR("_overviewLabel"), "UILabel");

}

- (id)accessibilityTableViewCellText
{
  void *v2;
  void *v3;
  void *v4;

  -[DirectionsStartEndTableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_startEndView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("_overviewLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
