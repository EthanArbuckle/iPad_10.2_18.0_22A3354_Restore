@implementation AXMessageUIFrameworkGlue

+ (void)accessibilityInitializeBundle
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  if (!_Failover)
  {
    objc_msgSend(MEMORY[0x24BDFE4F8], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global, &__block_literal_global_268, 0, &__block_literal_global_274);

    v4 = objc_msgSend(objc_allocWithZone((Class)AXMessageUIFrameworkGlue), "init");
    v5 = (void *)_Failover;
    _Failover = v4;

    objc_msgSend(MEMORY[0x24BDFE480], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addHandler:forFramework:", &__block_literal_global_350, CFSTR("WebKitLegacy"));

  }
  if (objc_msgSend((id)*MEMORY[0x24BDF74F8], "_accessibilityBoolValueForKey:", CFSTR("_accessibilityWebKitLoaded")))
  {
    objc_msgSend(a1, "_webKitInitialized");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", a1, sel__webKitInitialized, CFSTR("UIApplicationLoadedWebKit"), 0);

  }
}

uint64_t __57__AXMessageUIFrameworkGlue_accessibilityInitializeBundle__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "validateClass:", CFSTR("MFMailComposeView"));
  objc_msgSend(v2, "validateClass:", CFSTR("UITextField"));
  objc_msgSend(v2, "validateClass:", CFSTR("MFModernComposeRecipientAtom"));
  objc_msgSend(v2, "validateClass:", CFSTR("MFComposeFromView"));
  objc_msgSend(v2, "validateClass:", CFSTR("MFComposeSubjectView"));
  objc_msgSend(v2, "validateClass:", CFSTR("MFComposeRecipient"));
  objc_msgSend(v2, "validateClass:", CFSTR("MFRecipientTableViewCell"));
  objc_msgSend(v2, "validateClass:", CFSTR("MFModernAtomView"));
  objc_msgSend(v2, "validateClass:", CFSTR("MFModernLabelledAtomList"));
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFRecipientTableViewCell"), CFSTR("recipient"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFComposeRecipient"), CFSTR("displayString"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFComposeRecipient"), CFSTR("address"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFComposeRecipient"), CFSTR("label"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFMailComposeView"), CFSTR("initWithFrame: options: isQuickReply:"), "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", "Q", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFComposeSubjectView"), CFSTR("initWithFrame:"), "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFComposeRecipientView"), CFSTR("addRecipient: index: animate:"), "v", "@", "Q", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFComposeRecipientView"), CFSTR("addButton"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFComposeRecipientView"), CFSTR("recipients"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFComposeRecipientView"), CFSTR("_reflowAnimated:"), "v", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFComposeRecipientView"), CFSTR("removeRecipient:"), "v", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UITextContentView"), CFSTR("webView"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebView"), CFSTR("selectedDOMRange"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFComposeImageSizeView"), CFSTR("setSizeDescription:forScale:"), "v", "@", "Q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFComposeImageSizeView"), CFSTR("_scaleLabelIndexForScale:"), "Q", "Q", 0);
  objc_msgSend(v2, "validateClass:isKindOfClass:", CFSTR("_MFPlaceholderComposeRecipient"), CFSTR("MFComposeRecipient"));
  objc_msgSend(v2, "validateClass:isKindOfClass:", CFSTR("MFModernComposeRecipientAtom"), CFSTR("MFModernAtomView"));
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFModernAtomView"), CFSTR("presentationOptions"), "Q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFModernAtomView"), CFSTR("title"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("MFComposeImageSizeView"), CFSTR("_segmentedControl"), "UISegmentedControl");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("MFModernComposeRecipientAtom"), CFSTR("_recipient"), "MFComposeRecipient");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("MFMailComposeView"), CFSTR("_ccField"), "MFMailComposeRecipientTextView");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("MFMailComposeView"), CFSTR("_bccField"), "MFMailComposeRecipientTextView");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("MFMailComposeView"), CFSTR("_subjectField"), "MFComposeSubjectView");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("MFModernAddressAtom"), CFSTR("_atomView"), "CNAtomView");
  objc_msgSend(v2, "validateClass:", CFSTR("MFHeaderLabelView"));
  objc_msgSend(v2, "validateClass:", CFSTR("_MFMailRecipientTextField"));
  objc_msgSend(v2, "validateClass:", CFSTR("MFComposeMultiView"));

  return 1;
}

uint64_t __57__AXMessageUIFrameworkGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("MessageUI Framework AX Bundle"));
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("MessageUI"));

  return AXPerformValidationChecks();
}

void __57__AXMessageUIFrameworkGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("UITableViewAccessibility__MessageUI__UIKit"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("UITextViewAccessibility__MessageUI__UIKit"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MFComposeRecipientTextViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MFMailComposeViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MFHeaderLabelViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MFModernLabelledAtomListAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MFModernComposeRecipientAtomAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MFCaptionLabelAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MFComposeWebViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MFComposeRecipientAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MFComposeFromViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MFRecipientTableViewCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MFComposeRecipientViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MFComposeSubjectViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MFComposeImageSizeViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MFMailComposeControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MFModernAtomViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MFModernAddressAtomAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MFAtomTextViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("_MFAtomTextViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("UIDimmingViewAccessibility__MessageUI__UIKit"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MFAttachmentAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("UIViewAccessibility__MessageUI__UIKit"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MFAutocompleteResultsTableViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("_MFAtomFieldEditorAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MFComposeSendAccessoryButtonAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MFComposeStyleSelectorButtonAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MFComposeTextColorButtonAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MFPhotoPickerControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MFPhotoPickerCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MFMailComposeNavigationBarTitleViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MFComposeActionCardTitleViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MFComposeStyleSelectorViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("WKContentViewAccessibility__MessageUI__WebKit"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MFQuickReplyExpandButtonAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MFQuickReplySendAccessoryButtonAccessibility"), 1);

}

uint64_t __57__AXMessageUIFrameworkGlue_accessibilityInitializeBundle__block_invoke_4()
{
  return AXPerformBlockOnMainThreadAfterDelay();
}

void __57__AXMessageUIFrameworkGlue_accessibilityInitializeBundle__block_invoke_5()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDFE4F8], "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "performValidations:withPreValidationHandler:postValidationHandler:", &__block_literal_global_352, &__block_literal_global_357, &__block_literal_global_363);

}

uint64_t __57__AXMessageUIFrameworkGlue_accessibilityInitializeBundle__block_invoke_6(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UITextContentView"), CFSTR("_accessibilityShouldUpdateTextCache"), "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UITextContentView"), CFSTR("_accessibilitySetShouldUpdateCache:"), "v", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UITextContentView"), CFSTR("_accessibilitySetShouldUpdateCache:"), "v", "B", 0);

  return 1;
}

uint64_t __57__AXMessageUIFrameworkGlue_accessibilityInitializeBundle__block_invoke_7(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("MessageUI - WebKitLegacy"));
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("UIKitWeb"));
  objc_msgSend(v2, "setDebugBuild:", 0);

  return AXPerformValidationChecks();
}

+ (void)_webKitInitialized
{
  NSObject *v2;
  uint8_t v3[16];

  if (_UIApplicationIsExtension())
  {
    AXLogCommon();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_230B89000, v2, OS_LOG_TYPE_DEFAULT, "Not loading MessageUI.axbundle because we're in an extension", v3, 2u);
    }

  }
  else
  {
    AXPerformBlockOnMainThreadAfterDelay();
  }
}

void __46__AXMessageUIFrameworkGlue__webKitInitialized__block_invoke()
{
  if (_Failover_block_invoke_onceToken != -1)
    dispatch_once(&_Failover_block_invoke_onceToken, &__block_literal_global_372);
}

void __46__AXMessageUIFrameworkGlue__webKitInitialized__block_invoke_2()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDFE4F8], "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global_373, &__block_literal_global_374, 0, &__block_literal_global_379);

}

uint64_t __46__AXMessageUIFrameworkGlue__webKitInitialized__block_invoke_3()
{
  return 1;
}

uint64_t __46__AXMessageUIFrameworkGlue__webKitInitialized__block_invoke_4(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("MessageUI Web Framework AX Bundle"));
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("MessageUI - Web"));

  return AXPerformValidationChecks();
}

uint64_t __46__AXMessageUIFrameworkGlue__webKitInitialized__block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("WebAccessibilityObjectWrapperAccessibility__MessageUI__WebCore"), 1);
}

@end
