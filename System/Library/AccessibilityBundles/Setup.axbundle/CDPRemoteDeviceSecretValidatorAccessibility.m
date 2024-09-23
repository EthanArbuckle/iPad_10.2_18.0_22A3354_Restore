@implementation CDPRemoteDeviceSecretValidatorAccessibility

uint64_t __91__CDPRemoteDeviceSecretValidatorAccessibility__CoreCDPUI__Setup_initWithContext_validator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 40), "_accessibilitySetUnsignedIntegerValue:forKey:", objc_msgSend(*(id *)(a1 + 32), "safeUnsignedIntForKey:", CFSTR("supportedEscapeOfferMask")), CFSTR("AXEscapeOffer"));
}

@end
