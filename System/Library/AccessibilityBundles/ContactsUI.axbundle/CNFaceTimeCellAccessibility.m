@implementation CNFaceTimeCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CNFaceTimeCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityHitTestReverseOrder
{
  return 1;
}

@end
