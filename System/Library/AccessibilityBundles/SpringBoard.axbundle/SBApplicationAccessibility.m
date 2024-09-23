@implementation SBApplicationAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBApplication");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBApplication"), CFSTR("displayName"), "@", 0);
}

- (id)accessibilityLabel
{
  return (id)-[SBApplicationAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("displayName"));
}

@end
