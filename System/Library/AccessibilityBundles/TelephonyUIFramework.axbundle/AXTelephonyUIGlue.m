@implementation AXTelephonyUIGlue

+ (void)accessibilityInitializeBundle
{
  void *v2;
  uint64_t v3;
  void *v4;

  if (!_Failover)
  {
    objc_msgSend(MEMORY[0x24BE00758], "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global, &__block_literal_global_260, 0, &__block_literal_global_264);

    v3 = objc_msgSend(objc_allocWithZone((Class)AXTelephonyUIGlue), "init");
    v4 = (void *)_Failover;
    _Failover = v3;

  }
}

uint64_t __50__AXTelephonyUIGlue_accessibilityInitializeBundle__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "validateClass:", CFSTR("TPButton"));
  objc_msgSend(v2, "validateClass:", CFSTR("TPLCDTextView"));
  objc_msgSend(v2, "validateClass:", CFSTR("TPPhonePad"));
  objc_msgSend(v2, "validateClass:", CFSTR("TPNumberPad"));
  objc_msgSend(v2, "validateClass:", CFSTR("TPNumberPadButton"));
  objc_msgSend(v2, "validateClass:", CFSTR("TPSetPINKeyPadButton"));
  objc_msgSend(v2, "validateClass:isKindOfClass:", CFSTR("TPBottomDoubleButtonBar"), CFSTR("TPBottomSingleButtonBar"));
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TPLCDView"), CFSTR("text"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TPLCDView"), CFSTR("secondLineText"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TPLCDView"), CFSTR("label"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TPLCDTextView"), CFSTR("sizeToFit"), "{CGSize=dd}", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TPLCDTextView"), CFSTR("textRect"), "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TPPhonePad"), CFSTR("_buttonForKeyAtIndex:"), "@", "Q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TPPhonePad"), CFSTR("_keyForPoint:"), "i", "{CGPoint=dd}", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TPPhonePad"), CFSTR("_rectForKey:"), "{CGRect={CGPoint=dd}{CGSize=dd}}", "Q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TPLCDTextView"), CFSTR("text"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TPBottomSingleButtonBar"), CFSTR("button"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TPBottomDoubleButtonBar"), CFSTR("button2"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TPNumberPadButton"), CFSTR("character"), "q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("TPLCDView"), CFSTR("_textView"), "TPLCDTextView");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("TPLCDView"), CFSTR("_labelView"), "TPLCDTextView");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("TPNumberPad"), CFSTR("_buttons"), "NSMutableArray");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("TPSlidingButton"), CFSTR("_acceptButton"), "_UIActionSlider");

  return 1;
}

uint64_t __50__AXTelephonyUIGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("TelephonyUI"));
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("TelephonyUI"));

  return AXPerformValidationChecks();
}

void __50__AXTelephonyUIGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("TPLCDTextViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("TPPhonePadAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("TPButtonAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("TPLCDViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("TPNumberPadButtonAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("TPSetPINKeyPadButtonAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("TPNumberPadAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("TPSlidingButtonAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("TPSimpleNumberPadAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("UIButtonAccessibility__TelephonyUI__UIKit"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("TPSetPINViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("TPPasscodeViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("TPPillViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("TPDialerNumberPadAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MessageIndicatorViewAccessibility"), 1);

}

@end
