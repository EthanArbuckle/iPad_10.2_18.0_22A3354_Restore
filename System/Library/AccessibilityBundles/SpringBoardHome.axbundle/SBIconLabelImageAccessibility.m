@implementation SBIconLabelImageAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBIconLabelImage");
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
