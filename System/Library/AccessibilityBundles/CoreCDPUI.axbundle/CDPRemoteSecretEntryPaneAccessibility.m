@implementation CDPRemoteSecretEntryPaneAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CDPRemoteSecretEntryPane");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:", CFSTR("PSPasscodeField"));
}

- (id)_accessibilityResponderElement
{
  return (id)-[CDPRemoteSecretEntryPaneAccessibility _accessibilityDescendantOfType:](self, "_accessibilityDescendantOfType:", MEMORY[0x23490C52C](CFSTR("PSPasscodeField"), a2));
}

@end
