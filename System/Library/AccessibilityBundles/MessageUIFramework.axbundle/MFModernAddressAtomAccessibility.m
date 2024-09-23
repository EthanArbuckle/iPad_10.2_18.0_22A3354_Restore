@implementation MFModernAddressAtomAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MFModernAddressAtom");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MFModernAddressAtom"), CFSTR("_atomView"), "CNAtomView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFModernLabelledAtomList"), CFSTR("label"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("MFModernLabelledAtomList"));

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (BOOL)_accessibilityIsSpeakThisElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;

  -[MFModernAddressAtomAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_atomView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  accessibilityLocalizedString(CFSTR("address.atom.type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFModernAddressAtomAccessibility _accessibilityFindAncestor:startWithSelf:](self, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_3, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
    goto LABEL_5;
  objc_opt_class();
  objc_msgSend(v6, "safeValueForKey:", CFSTR("label"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  accessibilityLocalizedString(CFSTR("from.text"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "text");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByTrimmingCharactersInSet:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v10, "containsString:", v12);

  if (!v13)
  {

LABEL_5:
    __UIAXStringForVariables();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  __UIAXStringForVariables();
  v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
  return v14;
}

uint64_t __54__MFModernAddressAtomAccessibility_accessibilityLabel__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  NSClassFromString(CFSTR("MFModernLabelledAtomList"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
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
