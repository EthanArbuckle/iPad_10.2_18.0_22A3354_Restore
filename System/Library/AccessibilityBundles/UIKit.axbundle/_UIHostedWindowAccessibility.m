@implementation _UIHostedWindowAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIHostedWindow");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityWindowIgnoresEntityTransform
{
  return 1;
}

@end
