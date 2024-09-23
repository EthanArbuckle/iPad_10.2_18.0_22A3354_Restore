@implementation PSUICircleSegmentAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PSUICircleSegment");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PSUICircleSegmentAccessibility;
  -[PSUICircleSegmentAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
  return _AXTraitsRemoveTrait();
}

@end
