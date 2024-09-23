@implementation ASAuthorizationAppleIDButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ASAuthorizationAppleIDButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ASAuthorizationAppleIDButton"), CFSTR("cornerRadius"), "d", 0);
}

- (id)accessibilityPath
{
  void *v3;
  void *v4;
  void *v5;

  -[ASAuthorizationAppleIDButtonAccessibility safeCGFloatForKey:](self, "safeCGFloatForKey:", CFSTR("cornerRadius"));
  v3 = (void *)MEMORY[0x24BDF6870];
  -[ASAuthorizationAppleIDButtonAccessibility bounds](self, "bounds");
  objc_msgSend(v3, "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", -1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityConvertPathFunction();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
