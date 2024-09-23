@implementation GKButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("GKButton");
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
