@implementation AXMailAssistantUIGlue

+ (void)accessibilityInitializeBundle
{
  if (accessibilityInitializeBundle_onceToken != -1)
    dispatch_once(&accessibilityInitializeBundle_onceToken, &__block_literal_global);
}

void __54__AXMailAssistantUIGlue_accessibilityInitializeBundle__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x24BE00758], "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global_177, &__block_literal_global_223, 0, &__block_literal_global_229);

}

uint64_t __54__AXMailAssistantUIGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("MFEmailSnippetComposeView"), CFSTR("_toHeader"), "UILabel");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("MFEmailSnippetComposeView"), CFSTR("_toField"), "UILabel");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("MFEmailSnippetComposeView"), CFSTR("_ccHeader"), "UILabel");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("MFEmailSnippetComposeView"), CFSTR("_ccField"), "UILabel");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("MFEmailSnippetComposeView"), CFSTR("_bccHeader"), "UILabel");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("MFEmailSnippetComposeView"), CFSTR("_bccField"), "UILabel");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("MFEmailSnippetComposeView"), CFSTR("_subjectHeader"), "UILabel");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("MFEmailSnippetComposeView"), CFSTR("_subjectField"), "UILabel");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("MFEmailSnippetComposeView"), CFSTR("_bodyText"), "UILabel");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("MFEmailSnippetSearchResultCellView"), CFSTR("_addressLabel"), "UILabel");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("MFEmailSnippetSearchResultCellView"), CFSTR("_subjectLabel"), "UILabel");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("MFEmailSnippetSearchResultCellView"), CFSTR("_bodyLabel"), "UILabel");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("MFEmailSnippetSearchResultCellView"), CFSTR("_dateLabel"), "UIDateLabel");
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFAssistantEmail"), CFSTR("statusFlags"), "Q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFEmailSnippetSearchResultCellView"), CFSTR("setEmail:"), "v", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SAEmailEmail"), CFSTR("outgoing"), "@", 0);

  return 1;
}

uint64_t __54__AXMailAssistantUIGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("Assistant Mail AX Bundle"));
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("Assistant Mail"));

  return AXPerformValidationChecks();
}

void __54__AXMailAssistantUIGlue_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MFEmailSnippetComposeViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MFEmailSnippetSearchResultCellViewAccessibility"), 1);

}

@end
