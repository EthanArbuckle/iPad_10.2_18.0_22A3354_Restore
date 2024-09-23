@implementation AXSiriGlue

+ (void)accessibilityInitializeBundle
{
  id v2;

  if (accessibilityInitializeBundle_onceToken != -1)
    dispatch_once(&accessibilityInitializeBundle_onceToken, &__block_literal_global);
  objc_msgSend(MEMORY[0x24BE005C0], "server");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "registerSiriViewServicePID:", getpid());

}

void __43__AXSiriGlue_accessibilityInitializeBundle__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x24BE00758], "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global_177, &__block_literal_global_185, 0, &__block_literal_global_191);

}

uint64_t __43__AXSiriGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AceObject"), CFSTR("propertyForKey:"), "@", 0);
  objc_msgSend(v2, "validateClass:", CFSTR("SRSecureWindow"));

  return 1;
}

uint64_t __43__AXSiriGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("Siri AX Bundle"));
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("Siri"));

  return AXPerformValidationChecks();
}

void __43__AXSiriGlue_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SRSiriViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SRUserUtteranceViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SRGuideViewHeaderAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SRGuideViewCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SRGuideDetailSectionHeaderCollectionViewCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SRSpeechAlternativeTapToEditCellViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SRSecureWindowAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SRCompactTextRequestViewControllerAccessibility"), 1);

}

@end
