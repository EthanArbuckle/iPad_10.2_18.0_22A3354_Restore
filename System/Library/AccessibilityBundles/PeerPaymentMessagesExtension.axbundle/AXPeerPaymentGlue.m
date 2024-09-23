@implementation AXPeerPaymentGlue

+ (id)accessibilityBundles
{
  return 0;
}

+ (void)accessibilityInitializeBundle
{
  void *v2;
  AXPeerPaymentGlue *v3;
  void *v4;

  if (!_Failover)
  {
    objc_msgSend(MEMORY[0x24BE00758], "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global, &__block_literal_global_176, 0, &__block_literal_global_182);

    v3 = objc_alloc_init(AXPeerPaymentGlue);
    v4 = (void *)_Failover;
    _Failover = (uint64_t)v3;

  }
}

uint64_t __50__AXPeerPaymentGlue_accessibilityInitializeBundle__block_invoke()
{
  return 1;
}

uint64_t __50__AXPeerPaymentGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("MessagesExtension PeerPayment AX"));
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("MessagesExtension PeerPayment"));

  return AXPerformValidationChecks();
}

void __50__AXPeerPaymentGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PKPeerPaymentMessagesAmountStepperViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PKPeerPaymentNumberPadActionButtonAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PKPeerPaymentMessagesNumberPadViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PKPeerPaymentMessagesContentViewAccessibility"), 1);

}

@end
