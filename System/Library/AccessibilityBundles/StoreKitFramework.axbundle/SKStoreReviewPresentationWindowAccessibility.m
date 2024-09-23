@implementation SKStoreReviewPresentationWindowAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SKStoreReviewPresentationWindow");
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
