@implementation SBFFocusIsolationViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBFFocusIsolationView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityViewIsModal
{
  return 1;
}

@end
