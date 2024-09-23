@implementation SiriGeneralKnowledgeGlue

+ (void)accessibilityInitializeBundle
{
  if (accessibilityInitializeBundle_onceToken != -1)
    dispatch_once(&accessibilityInitializeBundle_onceToken, &__block_literal_global);
}

void __57__SiriGeneralKnowledgeGlue_accessibilityInitializeBundle__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x24BE00758], "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global_177, &__block_literal_global_198, 0, &__block_literal_global_204);

}

uint64_t __57__SiriGeneralKnowledgeGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("SiriGKImageLinkView"), CFSTR("_imageLinkedAnswer"), "SAGKImageLinkedAnswer");
  objc_msgSend(v2, "validateClass:isKindOfClass:", CFSTR("SiriGKAttributionView"), CFSTR("SiriGKView"));
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SAGKLinkedAnswer"), CFSTR("name"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SiriGKView"), CFSTR("command"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SAUIAppPunchOut"), CFSTR("punchOutUri"), "@", 0);

  return 1;
}

uint64_t __57__SiriGeneralKnowledgeGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("Siri General Knowledge AX Bundle"));
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("Siri General Knowledge"));

  return AXPerformValidationChecks();
}

void __57__SiriGeneralKnowledgeGlue_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SiriGKImageLinkViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SiriGKAttributionViewAccessibility"), 1);

}

@end
