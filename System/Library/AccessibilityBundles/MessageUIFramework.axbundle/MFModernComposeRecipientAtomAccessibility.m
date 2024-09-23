@implementation MFModernComposeRecipientAtomAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MFModernComposeRecipientAtom");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("MFModernComposeRecipientAtom"), CFSTR("MFModernAtomView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFModernAtomView"), CFSTR("presentationOptions"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFComposeRecipient"), CFSTR("normalizedAddress"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MFModernComposeRecipientAtom"), CFSTR("_recipient"), "MFComposeRecipient");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFComposeRecipient"), CFSTR("address"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NSString"), CFSTR("mf_addressDomain"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityHint
{
  void *v2;

  NSClassFromString(CFSTR("MFModernComposeRecipientAtom"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    accessibilityLocalizedString(CFSTR("address.atom.hint"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  __CFString *v10;
  uint64_t v11;
  uint64_t v12;
  void *v14;
  void *v15;
  const __CFString *v16;

  -[MFModernComposeRecipientAtomAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("recipient"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[MFModernComposeRecipientAtomAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("recipient"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeValueForKey:", CFSTR("normalizedAddress"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "isEqualToString:", v6))
  {

    v6 = 0;
  }
  __UIAXStringForVariables();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[MFModernComposeRecipientAtomAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("presentationOptions"), v6, CFSTR("__AXStringForVariablesSentinel"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (int)objc_msgSend(v8, "intValue");

  v10 = CFSTR("address.madrid.failure");
  if (v9 != 1 && v9 != 64)
  {
    if (v9 != 4)
      goto LABEL_8;
    v10 = CFSTR("address.madrid.loading");
  }
  accessibilityLocalizedString(v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = CFSTR("__AXStringForVariablesSentinel");
  __UIAXStringForVariables();
  v11 = objc_claimAutoreleasedReturnValue();

  v7 = (void *)v11;
LABEL_8:
  if (!-[MFModernComposeRecipientAtomAccessibility _axMFAddressIsSafeDomain](self, "_axMFAddressIsSafeDomain", v14, v16))
  {
    accessibilityLocalizedString(CFSTR("address.marked"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v12 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v12;
  }

  return v7;
}

- (BOOL)_axMFAddressIsSafeDomain
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  -[MFModernComposeRecipientAtomAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_recipient"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("address"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("mf_addressDomain"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "managedEmailDomains");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = objc_msgSend(v6, "containsObject:", v4);
  else
    v7 = 1;

  return v7;
}

@end
