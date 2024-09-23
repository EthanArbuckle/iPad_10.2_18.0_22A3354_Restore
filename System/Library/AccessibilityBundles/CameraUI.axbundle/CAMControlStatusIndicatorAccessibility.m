@implementation CAMControlStatusIndicatorAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CAMControlStatusIndicator");
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
