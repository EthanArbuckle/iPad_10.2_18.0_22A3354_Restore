@implementation CDPRemoteSecretEntryViewControllerAccessibility__Setup__CoreCDPUI

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CDPRemoteSecretEntryViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CDPRemoteSecretEntryViewController"), CFSTR("PSDetailController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PSDetailController"), CFSTR("pane"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CDPRemoteSecretEntryViewController"), CFSTR("_validator"), "CDPRemoteDeviceSecretValidator");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CDPRemoteDeviceSecretValidator"), CFSTR("supportedEscapeOfferMask"), "Q", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("CDPRemoteSecretEntryPane"));

}

- (BOOL)accessibilityShowsEscapeOffer
{
  void *v3;
  uint64_t v4;
  void *v5;

  -[CDPRemoteSecretEntryViewControllerAccessibility__Setup__CoreCDPUI safeValueForKey:](self, "safeValueForKey:", CFSTR("_validator"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_accessibilityUnsignedIntegerValueForKey:", CFSTR("AXEscapeOffer"));
  -[CDPRemoteSecretEntryViewControllerAccessibility__Setup__CoreCDPUI safeValueForKey:](self, "safeValueForKey:", CFSTR("pane"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("CDPRemoteSecretEntryPane"));
  LOBYTE(v4) = objc_opt_isKindOfClass() & (v4 != 1);

  return v4;
}

@end
