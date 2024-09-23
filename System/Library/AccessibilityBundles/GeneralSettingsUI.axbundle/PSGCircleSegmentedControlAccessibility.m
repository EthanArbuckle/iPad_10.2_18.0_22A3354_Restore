@implementation PSGCircleSegmentedControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PSGCircleSegmentedControl");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceVariable:withType:", CFSTR("PSGCircleSegmentedControl"), CFSTR("_segments"), "NSMutableArray");
}

- (id)accessibilityElements
{
  return (id)-[PSGCircleSegmentedControlAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("_segments"));
}

@end
