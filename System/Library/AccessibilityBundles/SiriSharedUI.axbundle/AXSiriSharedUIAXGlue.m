@implementation AXSiriSharedUIAXGlue

+ (void)accessibilityInitializeBundle
{
  if (accessibilityInitializeBundle_onceToken != -1)
    dispatch_once(&accessibilityInitializeBundle_onceToken, &__block_literal_global);
}

void __53__AXSiriSharedUIAXGlue_accessibilityInitializeBundle__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x24BE00758], "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global_177, &__block_literal_global_183, 0, &__block_literal_global_189);

}

uint64_t __53__AXSiriSharedUIAXGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AceObject"), CFSTR("propertyForKey:"), "@", 0);
  return 1;
}

uint64_t __53__AXSiriSharedUIAXGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("SiriSharedUI AX Bundle"));
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("SiriSharedUI"));

  return AXPerformValidationChecks();
}

void __53__AXSiriSharedUIAXGlue_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SiriSharedUICompactServerUtteranceViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SiriSharedUICompactUserUtteranceViewAccessibility"), 1);

}

@end
