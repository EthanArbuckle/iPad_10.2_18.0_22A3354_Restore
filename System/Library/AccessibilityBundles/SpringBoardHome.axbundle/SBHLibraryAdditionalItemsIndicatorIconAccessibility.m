@implementation SBHLibraryAdditionalItemsIndicatorIconAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBHLibraryAdditionalItemsIndicatorIcon");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityHint
{
  return 0;
}

@end
