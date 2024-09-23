@implementation SBLeafIconAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBLeafIcon");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBLeafIcon"), CFSTR("applicationBundleID"), "@", 0);
}

- (id)_accessibilityBundleIdentifier
{
  return (id)-[SBLeafIconAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("applicationBundleID"));
}

@end
