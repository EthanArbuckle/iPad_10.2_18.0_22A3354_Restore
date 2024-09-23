@implementation CNComposeRecipientAtomAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CNComposeRecipientAtom");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CNComposeRecipientAtom"), CFSTR("CNAtomView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNAtomView"), CFSTR("presentationOptions"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNComposeRecipient"), CFSTR("displayString"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNComposeRecipient"), CFSTR("compositeName"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNComposeRecipient"), CFSTR("normalizedAddress"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CNComposeRecipientAtom"), CFSTR("_recipient"), "CNComposeRecipient");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNComposeRecipient"), CFSTR("address"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NSString"), CFSTR("mf_addressDomain"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNAtomView"), CFSTR("isSelected"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNComposeRecipientAtom"), CFSTR("delegate"), "@", 0);
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("CNComposeRecipientAtomDelegate"), CFSTR("selectComposeRecipientAtom:"));
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("CNComposeRecipientTextView"), CFSTR("delegate"), "@");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNComposeHeaderView"), CFSTR("delegate"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CNComposeRecipientTextView"), CFSTR("CNComposeHeaderView"));
  objc_msgSend(v3, "validateProtocol:hasOptionalInstanceMethod:", CFSTR("CNComposeRecipientTextViewDelegate"), CFSTR("composeRecipientView:disambiguateRecipientForAtom:"));

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityHint
{
  void *v2;

  NSClassFromString(CFSTR("CNComposeRecipientAtom"));
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
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  __CFString *v12;
  uint64_t v13;
  uint64_t v14;
  void *v16;
  void *v17;
  const __CFString *v18;

  -[CNComposeRecipientAtomAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("recipient"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("displayString"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "isEqualToString:", &stru_2501D5788))
  {
    -[CNComposeRecipientAtomAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("recipient"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "safeStringForKey:", CFSTR("compositeName"));
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v6;
  }
  -[CNComposeRecipientAtomAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("recipient"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safeStringForKey:", CFSTR("normalizedAddress"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "isEqualToString:", v8))
  {

    v8 = 0;
  }
  __UIAXStringForVariables();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNComposeRecipientAtomAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("presentationOptions"), v8, CFSTR("__AXStringForVariablesSentinel"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (int)objc_msgSend(v10, "intValue");

  v12 = CFSTR("address.madrid.failure");
  if (v11 <= 63)
  {
    if (v11 != 1)
    {
      if (v11 != 4)
        goto LABEL_12;
      v12 = CFSTR("address.madrid.loading");
    }
    goto LABEL_11;
  }
  if (v11 == 64 || v11 == 0x20000)
  {
LABEL_11:
    accessibilityLocalizedString(v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = CFSTR("__AXStringForVariablesSentinel");
    __UIAXStringForVariables();
    v13 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v13;
  }
LABEL_12:
  if (!-[CNComposeRecipientAtomAccessibility _axMFAddressIsSafeDomain](self, "_axMFAddressIsSafeDomain", v16, v18))
  {
    accessibilityLocalizedString(CFSTR("address.marked"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v14 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v14;
  }

  return v9;
}

- (id)_accessibilityElementHelp
{
  void *v2;

  if (-[CNComposeRecipientAtomAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isSelected")))
  {
    accessibilityLocalizedString(CFSTR("address.atom.macos.hint"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)accessibilityCustomActions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];
  id v9;
  id location;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  objc_initWeak(&location, self);
  v3 = objc_alloc(MEMORY[0x24BDF6788]);
  accessibilityLocalizedString(CFSTR("show.alternate.addresses"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __65__CNComposeRecipientAtomAccessibility_accessibilityCustomActions__block_invoke;
  v8[3] = &unk_2501D5468;
  objc_copyWeak(&v9, &location);
  v8[4] = self;
  v5 = (void *)objc_msgSend(v3, "initWithName:actionHandler:", v4, v8);

  v11[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return v6;
}

uint64_t __65__CNComposeRecipientAtomAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v5;

  v3 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 40));
  AXPerformSafeBlock();
  objc_destroyWeak(&v5);

  return 1;
}

void __65__CNComposeRecipientAtomAccessibility_accessibilityCustomActions__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "safeValueForKey:", CFSTR("delegate"));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "safeValueForKey:", CFSTR("delegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectComposeRecipientAtom:", *(_QWORD *)(a1 + 32));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "composeRecipientView:disambiguateRecipientForAtom:", v4, *(_QWORD *)(a1 + 32));

}

- (BOOL)_axMFAddressIsSafeDomain
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  -[CNComposeRecipientAtomAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_recipient"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeStringForKey:", CFSTR("address"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mf_addressDomain");
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
