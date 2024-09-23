@implementation CNAtomViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CNAtomView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNAtomView"), CFSTR("presentationOptions"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNAtomView"), CFSTR("title"), "@", 0);

}

- (id)accessibilityLabel
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[CNAtomViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("presentationOptions"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  if ((v4 & 0x10) != 0)
  {
    accessibilityLocalizedString(CFSTR("vip.sender"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
    v5 = 0;
    goto LABEL_7;
  }
  if ((*(_QWORD *)&v4 & 0x20001) == 0)
  {
    v6 = 0;
    goto LABEL_6;
  }
  accessibilityLocalizedString(CFSTR("address.failure.style"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
LABEL_7:
  -[CNAtomViewAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("title"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
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
