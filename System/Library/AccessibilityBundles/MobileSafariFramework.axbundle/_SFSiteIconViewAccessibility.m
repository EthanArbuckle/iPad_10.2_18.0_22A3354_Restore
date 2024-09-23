@implementation _SFSiteIconViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_SFSiteIconView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityElementsHidden
{
  return 1;
}

@end
