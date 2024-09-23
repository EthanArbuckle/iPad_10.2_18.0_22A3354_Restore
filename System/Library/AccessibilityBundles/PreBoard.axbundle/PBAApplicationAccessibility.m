@implementation PBAApplicationAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PBAApplication");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return &stru_2503118B8;
}

@end
