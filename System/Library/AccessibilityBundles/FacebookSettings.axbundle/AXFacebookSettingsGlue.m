@implementation AXFacebookSettingsGlue

+ (void)accessibilityInitializeBundle
{
  if (accessibilityInitializeBundle_onceToken != -1)
    dispatch_once(&accessibilityInitializeBundle_onceToken, &__block_literal_global);
}

void __55__AXFacebookSettingsGlue_accessibilityInitializeBundle__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x24BE00758], "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global_177, &__block_literal_global_188, 0, &__block_literal_global_194);

}

uint64_t __55__AXFacebookSettingsGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("SLFacebookRegistrationEmailPrompt"), CFSTR("_orLabel"), "UILabel");
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SLFacebookRegistrationEmailPrompt"), CFSTR("textField: shouldChangeCharactersInRange: replacementString:"), "B", "@", "{_NSRange=QQ}", "@", 0);

  return 1;
}

uint64_t __55__AXFacebookSettingsGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("Facebook Settings AX Bundle"));
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("FacebookSettings"));

  return AXPerformValidationChecks();
}

uint64_t __55__AXFacebookSettingsGlue_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SLFacebookRegistrationEmailPromptAccessibility"), 1);
}

@end
