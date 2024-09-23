@implementation AXAppleAccountUIGlue

+ (void)accessibilityInitializeBundle
{
  if (accessibilityInitializeBundle_onceToken != -1)
    dispatch_once(&accessibilityInitializeBundle_onceToken, &__block_literal_global);
}

void __53__AXAppleAccountUIGlue_accessibilityInitializeBundle__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDFE4F8], "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global_183, &__block_literal_global_184, &__block_literal_global_188, &__block_literal_global_190);

}

uint64_t __53__AXAppleAccountUIGlue_accessibilityInitializeBundle__block_invoke_2()
{
  return 1;
}

uint64_t __53__AXAppleAccountUIGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("AppleAccountUI"));
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("AppleAccountUI"));
  objc_msgSend(v2, "setDebugBuild:", 0);

  return AXPerformValidationChecks();
}

void __53__AXAppleAccountUIGlue_accessibilityInitializeBundle__block_invoke_5(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("AAUISignInViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("AAUIImageControlAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("AAUIProfilePhotoViewAccessibility"), 1);

}

@end
