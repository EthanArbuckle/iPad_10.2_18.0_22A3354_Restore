@implementation MFModernAtomViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MFModernAtomView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFModernAtomView"), CFSTR("presentationOptions"), "Q", 0);
}

- (id)accessibilityLabel
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;

  -[MFModernAtomViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("presentationOptions"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  if ((v4 & 0x10) != 0)
  {
    accessibilityLocalizedString(CFSTR("vip.sender"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ((v4 & 1) != 0)
    {
      accessibilityLocalizedString(CFSTR("address.failure.style"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 0;
      goto LABEL_7;
    }
    v5 = 0;
  }
  v6 = 0;
LABEL_7:
  -[MFModernAtomViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("title"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFModernAtomViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("ActualEmail"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(CFSTR("address.atom.hint"));
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

@end
