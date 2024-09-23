@implementation SBHomeScreenButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBHomeScreenButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHomeScreenButton"), CFSTR("backgroundView"), "@", 0);
}

- (id)accessibilityPath
{
  void *v2;
  void *v3;

  -[SBHomeScreenButtonAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("backgroundView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
