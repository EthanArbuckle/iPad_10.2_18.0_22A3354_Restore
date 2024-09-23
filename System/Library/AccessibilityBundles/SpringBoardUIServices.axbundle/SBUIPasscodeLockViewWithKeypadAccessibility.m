@implementation SBUIPasscodeLockViewWithKeypadAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBUIPasscodeLockViewWithKeypad");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBUIPasscodeLockViewWithKeypad"), CFSTR("updateStatusText: subtitle: animated:"), "v", "@", "@", "B", 0);
}

@end
