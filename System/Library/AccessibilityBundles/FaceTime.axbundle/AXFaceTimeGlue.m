@implementation AXFaceTimeGlue

+ (void)accessibilityInitializeBundle
{
  if (accessibilityInitializeBundle_onceToken != -1)
    dispatch_once(&accessibilityInitializeBundle_onceToken, &__block_literal_global);
}

void __47__AXFaceTimeGlue_accessibilityInitializeBundle__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x24BE00758], "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global_177, &__block_literal_global_214, 0, &__block_literal_global_220);

}

uint64_t __47__AXFaceTimeGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "validateClass:", CFSTR("PHHandsetDialerNameLabelView"));
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIView"), CFSTR("initWithFrame:"), "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHHandsetDialerLCDView"), CFSTR("delegate"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHAbstractDialerView"), CFSTR("delegate"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHHandsetDialerLCDView"), CFSTR("deleteCharacter"), "v", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHHandsetDialerLCDView"), CFSTR("setText: needsFormat:"), "v", "@", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHAbstractDialerView"), CFSTR("lcdView"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("PHAbstractDialerView"), CFSTR("_addContactButton"), "UIControl");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("PHAbstractDialerView"), CFSTR("_deleteButton"), "UIControl");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("PHAbstractDialerView"), CFSTR("_callButton"), "UIControl");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("PHHandsetDialerLCDView"), CFSTR("_numberTextField"), "PHLCDViewTextField");
  objc_msgSend(v2, "validateClass:isKindOfClass:", CFSTR("PHLCDViewTextField"), CFSTR("UITextField"));

  return 1;
}

uint64_t __47__AXFaceTimeGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("Facetime AX Bundle"));
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("Facetime"));

  return AXPerformValidationChecks();
}

void __47__AXFaceTimeGlue_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PhoneContentViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("FaceTimeApplicationAccesssibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MobilePhoneUIButtonAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MobilePhoneUILabelAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PHAbstractDialerViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PHHandsetDialerLCDViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PHLCDViewTextFieldAccessibility"), 1);

}

@end
