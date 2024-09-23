@implementation AXDefaultMediaPlayerGlue

+ (void)accessibilityInitializeBundle
{
  id v2;

  objc_msgSend(MEMORY[0x24BDFE4F8], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global, &__block_literal_global_182, 0, &__block_literal_global_188);

}

uint64_t __57__AXDefaultMediaPlayerGlue_accessibilityInitializeBundle__block_invoke()
{
  return 1;
}

uint64_t __57__AXDefaultMediaPlayerGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("MobileQuickLook Default Player AX Bundle"));
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("MobileQuickLook Default Player"));

  return AXPerformValidationChecks();
}

@end
