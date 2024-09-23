@implementation SPUISecureWindowAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SPUISecureWindow");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:isKindOfClass:", CFSTR("SPUISecureWindow"), CFSTR("UIWindow"));
}

- (BOOL)accessibilityElementsHidden
{
  void *v2;
  void *v3;
  BOOL v4;

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "windowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "activationState") != 0;
  else
    v4 = 1;

  return v4;
}

@end
