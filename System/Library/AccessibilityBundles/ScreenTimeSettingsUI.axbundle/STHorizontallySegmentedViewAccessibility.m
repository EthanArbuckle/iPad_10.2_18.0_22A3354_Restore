@implementation STHorizontallySegmentedViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("STHorizontallySegmentedView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STHorizontallySegmentedView"), CFSTR("segmentViews"), "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)accessibilityElements
{
  return (id)-[STHorizontallySegmentedViewAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("segmentViews"));
}

@end
