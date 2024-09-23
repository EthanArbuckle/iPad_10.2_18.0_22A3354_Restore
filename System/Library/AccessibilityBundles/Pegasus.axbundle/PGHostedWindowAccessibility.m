@implementation PGHostedWindowAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PGHostedWindow");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unsigned)_accessibilityContextId
{
  return 0;
}

@end
