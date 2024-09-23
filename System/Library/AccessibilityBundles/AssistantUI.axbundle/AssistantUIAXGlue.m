@implementation AssistantUIAXGlue

+ (void)accessibilityInitializeBundle
{
  if (accessibilityInitializeBundle_onceToken != -1)
    dispatch_once(&accessibilityInitializeBundle_onceToken, &__block_literal_global);
}

void __50__AssistantUIAXGlue_accessibilityInitializeBundle__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x24BE00758], "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global_183, &__block_literal_global_190, 0, &__block_literal_global_196);

}

uint64_t __50__AssistantUIAXGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AFUISiriViewController"), CFSTR("stopRequestWithOptions:"), "v", "@", 0);
  return 1;
}

uint64_t __50__AssistantUIAXGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("AssistantUI.framework AX Bundle"));
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("AssistantUI framework"));

  return AXPerformValidationChecks();
}

void __50__AssistantUIAXGlue_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("AFUISiriViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("AFUISiriCompactViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("AFUISiriSessionAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("AFUISiriViewControllerAccessibility"), 1);

}

+ (void)initialize
{
  void *v3;
  int v4;

  v3 = (void *)objc_opt_new();
  v4 = objc_msgSend(v3, "isClarityBoardEnabled");

  if (v4)
    objc_msgSend(a1, "accessibilityInitializeBundle");
}

@end
