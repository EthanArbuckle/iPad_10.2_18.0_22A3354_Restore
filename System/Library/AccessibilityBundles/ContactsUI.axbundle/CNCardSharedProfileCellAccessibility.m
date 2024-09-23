@implementation CNCardSharedProfileCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CNCardSharedProfileCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end
