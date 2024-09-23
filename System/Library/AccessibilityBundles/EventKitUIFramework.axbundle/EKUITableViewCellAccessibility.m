@implementation EKUITableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("EKUITableViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild
{
  return 1;
}

@end
