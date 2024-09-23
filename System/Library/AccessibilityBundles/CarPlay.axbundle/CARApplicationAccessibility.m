@implementation CARApplicationAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CARApplication");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityIsStarkElement
{
  return 1;
}

@end
