@implementation PINViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PINView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

@end
