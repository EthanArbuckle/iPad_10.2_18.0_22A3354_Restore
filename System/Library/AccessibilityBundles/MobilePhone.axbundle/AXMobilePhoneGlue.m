@implementation AXMobilePhoneGlue

+ (void)accessibilityInitializeBundle
{
  void *v2;
  uint64_t v3;
  void *v4;

  if (!_Failover)
  {
    objc_msgSend(MEMORY[0x24BE00758], "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global, &__block_literal_global_246, 0, &__block_literal_global_252);

    v3 = objc_msgSend(objc_allocWithZone((Class)AXMobilePhoneGlue), "init");
    v4 = (void *)_Failover;
    _Failover = v3;

  }
}

uint64_t __50__AXMobilePhoneGlue_accessibilityInitializeBundle__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", CFSTR("PHVoicemailPlayerController"), CFSTR("sharedPlayerController"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("DialerController"), CFSTR("phonePad: appendString:"), "v", "@", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("DialerController"), CFSTR("phonePad: replaceLastDigitWithString:"), "v", "@", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("DialerController"), CFSTR("viewWillDisappear:"), "v", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("DialerController"), CFSTR("viewWillAppear:"), "v", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VMVoicemail"), CFSTR("flags"), "Q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHVoicemailPlayerController"), CFSTR("isPlaying"), "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("DialerController"), CFSTR("_dialerView"), "PHAbstractDialerView");
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("DialerController"), CFSTR("_phonePad: appendString: suppressClearingDialedNumber:"), "v", "@", "@", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("DialerController"), CFSTR("phonePadDeleteLastDigit:"), "v", "@", 0);
  objc_msgSend(v2, "validateClass:", CFSTR("DialerController"));
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("DialerController"), CFSTR("_callButtonPressed:"), "v", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("DialerController"), CFSTR("phonePadDeleteLastDigit:"), "v", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("DialerController"), CFSTR("phonePad: appendString:"), "v", "@", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("DialerController"), CFSTR("loadView"), "v", 0);
  objc_msgSend(v2, "validateClass:isKindOfClass:", CFSTR("MPKeypadViewController"), CFSTR("DialerController"));
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

uint64_t __50__AXMobilePhoneGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("MobilePhone AX Bundle"));
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("Phone"));

  return AXPerformValidationChecks();
}

void __50__AXMobilePhoneGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("DialerControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PhoneRootViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PHTextCycleLabelAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("VMPlayerTimelineSliderAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PHVoicemailGreetingViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PHVoicemailPlayerControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PhoneApplicationAccesssibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MPRecentsTableViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PHRecentCallDetailsItemViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MobilePhoneUIButtonAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MobilePhoneUILabelAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PHAbstractDialerViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PHHandsetDialerLCDViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PHLCDViewTextFieldAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PHVoicemailInboxListViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PHVoicemailMessageTableViewCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("VMMessageMetadataViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PHHandsetDialerDeleteButtonAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PHHandsetDialerViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("VMRoundButtonAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("VMPlayerControlButtonAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PHVoicemailMessageTableViewCellScrollViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PersonalNicknameMenuViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MPLegacyRecentsTableViewCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MPVoicemailMessageViewModelAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MPVoicemailTableViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("VMMessageTranscriptViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("UITextViewAccessibility__MobilePhone__UIKit"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PHDialerContactResultButtonViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SearchHeaderCellAccessibility"), 1);

}

@end
