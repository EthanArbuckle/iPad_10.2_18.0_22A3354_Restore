@implementation PLImageScrollViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PLImageScrollView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityIsScrollAncestor
{
  return 0;
}

@end
