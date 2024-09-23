@implementation PSSliderTableCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PSSliderTableCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("PSSliderTableCell"), CFSTR("PSControlTableCell"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PSControlTableCell"), CFSTR("_control"), "UIControl");

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (CGPoint)accessibilityActivationPoint
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  -[PSSliderTableCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_control"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityActivationPoint");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

@end
