@implementation SBFolderAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBFolder");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFolder"), CFSTR("lists"), "@", 0);
}

- (id)automationElements
{
  return (id)-[SBFolderAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("lists"));
}

@end
