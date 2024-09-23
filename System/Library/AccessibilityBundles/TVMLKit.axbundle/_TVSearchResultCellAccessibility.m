@implementation _TVSearchResultCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_TVSearchResultCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilitySupportsSemanticContext
{
  return 0;
}

@end
