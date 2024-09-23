@implementation CKPresentationControllerWindowAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKPresentationControllerWindow");
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
