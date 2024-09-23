@implementation SBUIRemoteKeyboardWindowAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIRemoteKeyboardWindow");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityWindowVisible
{
  void *v3;
  void *v4;
  BOOL v5;
  objc_super v7;
  char v8;

  AXUIKeyboardWindow();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 == v4 && (AXUIKeyboardIsOnScreen() & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBUIRemoteKeyboardWindowAccessibility;
    v5 = -[SBUIRemoteKeyboardWindowAccessibility _accessibilityWindowVisible](&v7, sel__accessibilityWindowVisible);
  }

  return v5;
}

@end
