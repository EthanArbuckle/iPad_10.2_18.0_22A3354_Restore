@implementation MPModalPresentationWindowAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MPModalPresentationWindow");
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
