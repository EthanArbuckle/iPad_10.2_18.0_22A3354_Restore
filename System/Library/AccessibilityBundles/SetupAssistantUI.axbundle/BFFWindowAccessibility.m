@implementation BFFWindowAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("BFFWindow");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityIsUserInteractionEnabled
{
  return 1;
}

@end
