@implementation CKActionMenuViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKActionMenuView");
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
