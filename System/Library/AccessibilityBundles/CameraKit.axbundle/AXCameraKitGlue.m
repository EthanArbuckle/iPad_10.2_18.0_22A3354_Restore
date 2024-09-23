@implementation AXCameraKitGlue

+ (void)accessibilityInitializeBundle
{
  if (accessibilityInitializeBundle_onceToken != -1)
    dispatch_once(&accessibilityInitializeBundle_onceToken, &__block_literal_global);
}

void __48__AXCameraKitGlue_accessibilityInitializeBundle__block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x24BDFE4F8], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global_208, &__block_literal_global_209, 0, &__block_literal_global_215);

  objc_msgSend(MEMORY[0x24BDFE480], "sharedInstance");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addHandler:forFramework:", &__block_literal_global_219, CFSTR("Photos"));

}

uint64_t __48__AXCameraKitGlue_accessibilityInitializeBundle__block_invoke_2()
{
  return 1;
}

uint64_t __48__AXCameraKitGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("CameraKit AX Bundle"));
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("CameraKit"));
  objc_msgSend(v2, "setDebugBuild:", 0);

  return AXPerformValidationChecks();
}

void __48__AXCameraKitGlue_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  char v4;
  id v5;

  v5 = a2;
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDFE3C8]);

  if ((v4 & 1) == 0)
    objc_msgSend(v5, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CMKShutterButtonAccessibility"), 1);

}

uint64_t __48__AXCameraKitGlue_accessibilityInitializeBundle__block_invoke_5()
{
  return AXPerformBlockOnMainThreadAfterDelay();
}

void __48__AXCameraKitGlue_accessibilityInitializeBundle__block_invoke_6()
{
  void *v0;
  id v1;

  v0 = (void *)MEMORY[0x24BEBADF8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.Photos"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "loadAccessibilityBundleForBundle:didLoadCallback:", v1, 0);

}

@end
