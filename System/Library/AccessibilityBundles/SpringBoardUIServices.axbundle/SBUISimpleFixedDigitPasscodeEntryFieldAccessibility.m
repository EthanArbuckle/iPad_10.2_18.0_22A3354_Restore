@implementation SBUISimpleFixedDigitPasscodeEntryFieldAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBUISimpleFixedDigitPasscodeEntryField");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("SBUIPasscodeLockViewBase"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBUIPasscodeEntryField"), CFSTR("_textField"), "SBUIPasscodeTextField");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBUINumericPasscodeEntryFieldBase"), CFSTR("maxNumbersAllowed"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBUISimpleFixedDigitPasscodeEntryField"), CFSTR("_deleteLastCharacter"), "v", 0);

}

- (BOOL)isAccessibilityElement
{
  void *v3;
  int v4;

  -[SBUISimpleFixedDigitPasscodeEntryFieldAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", NSClassFromString(CFSTR("SBUIPasscodeLockViewBase")));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_accessibilityViewIsVisible");

  if (v4)
    return -[SBUISimpleFixedDigitPasscodeEntryFieldAccessibility _accessibilityViewIsVisible](self, "_accessibilityViewIsVisible");
  else
    return 0;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[SBUISimpleFixedDigitPasscodeEntryFieldAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_textField"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityValue
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  -[SBUISimpleFixedDigitPasscodeEntryFieldAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("maxNumbersAllowed"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  objc_opt_class();
  -[SBUISimpleFixedDigitPasscodeEntryFieldAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_textField"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  v9 = (void *)MEMORY[0x24BDD17C8];
  accessibilitySBLocalizedString(CFSTR("passcode.values.entered"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringWithFormat:", v10, v8, v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (unint64_t)accessibilityTraits
{
  void *v2;
  unint64_t v3;

  -[SBUISimpleFixedDigitPasscodeEntryFieldAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_textField"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "accessibilityTraits");

  return v3;
}

- (void)_deleteLastCharacter
{
  UIAccessibilityNotifications v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBUISimpleFixedDigitPasscodeEntryFieldAccessibility;
  -[SBUISimpleFixedDigitPasscodeEntryFieldAccessibility _deleteLastCharacter](&v5, sel__deleteLastCharacter);
  v3 = *MEMORY[0x24BDF71E8];
  -[SBUISimpleFixedDigitPasscodeEntryFieldAccessibility accessibilityValue](self, "accessibilityValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v3, v4);

}

- (BOOL)_accessibilitySupportsTextInsertionAndDeletion
{
  return 1;
}

- (BOOL)_accessibilityHandwritingAttributeAcceptsContractedBraille
{
  return 0;
}

@end
