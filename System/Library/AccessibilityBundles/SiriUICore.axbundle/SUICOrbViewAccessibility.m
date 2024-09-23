@implementation SUICOrbViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SUICOrbView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  if (AXProcessIsSpringBoard())
    objc_msgSend(v3, "validateClass:", CFSTR("AFUISiriCompactView"));

}

- (BOOL)isAccessibilityElement
{
  void *v2;
  char v3;

  -[SUICOrbViewAccessibility accessibilityIdentification](self, "accessibilityIdentification");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("EnrollmentSetupIntroView"));

  return v3 ^ 1;
}

- (void)accessibilityElementDidLoseFocus
{
  id v2;

  -[SUICOrbViewAccessibility _accessibilityViewAncestorIsKindOf:](self, "_accessibilityViewAncestorIsKindOf:", MEMORY[0x23491E544](CFSTR("AFUISiriCompactView"), a2));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityElementDidLoseFocus");

}

- (BOOL)_accessibilityInTopLevelTabLoop
{
  return 1;
}

@end
