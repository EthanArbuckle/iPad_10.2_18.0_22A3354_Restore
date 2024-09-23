@implementation SBAlertItemWindowAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBAlertItemWindow");
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
