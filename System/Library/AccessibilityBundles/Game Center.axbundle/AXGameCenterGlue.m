@implementation AXGameCenterGlue

+ (void)accessibilityInitializeBundle
{
  if (accessibilityInitializeBundle_onceToken != -1)
    dispatch_once(&accessibilityInitializeBundle_onceToken, &__block_literal_global_181);
}

void __49__AXGameCenterGlue_accessibilityInitializeBundle__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x24BE00758], "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global_184, &__block_literal_global_185, 0, &__block_literal_global_189);

}

uint64_t __49__AXGameCenterGlue_accessibilityInitializeBundle__block_invoke_2()
{
  void *v0;

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "userInterfaceIdiom");

  return 1;
}

uint64_t __49__AXGameCenterGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("GameCenter"));
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("GameCenter Accessibility Bundle"));
  objc_msgSend(v2, "setDebugBuild:", 0);

  return AXPerformValidationChecks();
}

@end
