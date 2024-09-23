@implementation AXMapsAssistantUIGlue

+ (void)accessibilityInitializeBundle
{
  if (accessibilityInitializeBundle_onceToken != -1)
    dispatch_once(&accessibilityInitializeBundle_onceToken, &__block_literal_global_182);
}

void __54__AXMapsAssistantUIGlue_accessibilityInitializeBundle__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x24BE00758], "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global_185, &__block_literal_global_202, 0, &__block_literal_global_208);

}

uint64_t __54__AXMapsAssistantUIGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MAListSnippetView"), CFSTR("tableView: cellForRowAtIndexPath:"), "@", "@", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SALocalSearchMapItem"), CFSTR("detailType"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SALocalSearchMapItem"), CFSTR("detail"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("MAResultView"), CFSTR("_mapItem"), "SALocalSearchMapItem");

  return 1;
}

uint64_t __54__AXMapsAssistantUIGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("MapsAssistantUI"));
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("Maps AssistantUI Accessibility Bundle"));

  return AXPerformValidationChecks();
}

void __54__AXMapsAssistantUIGlue_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MAListSnippetViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MAResultViewAccessibility"), 1);

}

@end
