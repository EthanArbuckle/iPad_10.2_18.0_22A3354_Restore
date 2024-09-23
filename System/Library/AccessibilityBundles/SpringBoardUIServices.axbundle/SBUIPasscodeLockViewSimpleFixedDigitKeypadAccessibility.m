@implementation SBUIPasscodeLockViewSimpleFixedDigitKeypadAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBUIPasscodeLockViewSimpleFixedDigitKeypad");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityViewIsModal
{
  double v2;
  double v3;

  -[SBUIPasscodeLockViewSimpleFixedDigitKeypadAccessibility _accessibilityVisibleFrame](self, "_accessibilityVisibleFrame");
  return v3 > 0.0 && v2 > 0.0;
}

@end
