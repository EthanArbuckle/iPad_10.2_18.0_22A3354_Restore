@implementation SiriSystemGlue

+ (void)accessibilityInitializeBundle
{
  if (accessibilityInitializeBundle_onceToken != -1)
    dispatch_once(&accessibilityInitializeBundle_onceToken, &__block_literal_global);
}

void __47__SiriSystemGlue_accessibilityInitializeBundle__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x24BE00758], "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global_177, &__block_literal_global_183, 0, &__block_literal_global_189);

}

uint64_t __47__SiriSystemGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "validateClass:hasInstanceVariable:withType:", CFSTR("ACAssistantAlternateProviderResultView"), CFSTR("_providerNameLabel"), "UILabel");
  return 1;
}

uint64_t __47__SiriSystemGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("Siri System AX Bundle"));
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("Siri System"));

  return AXPerformValidationChecks();
}

uint64_t __47__SiriSystemGlue_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("ACAssistantAlternateProviderResultViewAccessibility"), 1);
}

@end
