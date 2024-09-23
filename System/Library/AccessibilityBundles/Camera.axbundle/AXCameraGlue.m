@implementation AXCameraGlue

+ (void)accessibilityInitializeBundle
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  if (!_Failover)
  {
    objc_msgSend(MEMORY[0x24BE00758], "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global, &__block_literal_global_183, 0, &__block_literal_global_189);

    v3 = objc_msgSend(objc_allocWithZone((Class)AXCameraGlue), "init");
    v4 = (void *)_Failover;
    _Failover = v3;

  }
  objc_msgSend(MEMORY[0x24BE005D8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addHandler:forFramework:", &__block_literal_global_195, CFSTR("CameraKit"));

  objc_msgSend(MEMORY[0x24BE005D8], "sharedInstance");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addHandler:forFramework:", &__block_literal_global_202, CFSTR("PhotosUI"));

}

uint64_t __45__AXCameraGlue_accessibilityInitializeBundle__block_invoke()
{
  return 1;
}

uint64_t __45__AXCameraGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("Camera AX Bundle"));
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("Camera Bundle"));
  objc_msgSend(v2, "setDebugBuild:", 0);

  return AXPerformValidationChecks();
}

uint64_t __45__AXCameraGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CAMApplicationAccessibility__Camera__CameraUI"), 1);
}

uint64_t __45__AXCameraGlue_accessibilityInitializeBundle__block_invoke_4()
{
  return AXPerformBlockOnMainThreadAfterDelay();
}

void __45__AXCameraGlue_accessibilityInitializeBundle__block_invoke_5()
{
  void *v0;
  id v1;

  v0 = (void *)MEMORY[0x24BEBADF8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CameraKit"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "loadAccessibilityBundleForBundle:didLoadCallback:", v1, 0);

}

uint64_t __45__AXCameraGlue_accessibilityInitializeBundle__block_invoke_6()
{
  return AXPerformBlockOnMainThreadAfterDelay();
}

void __45__AXCameraGlue_accessibilityInitializeBundle__block_invoke_7()
{
  void *v0;
  id v1;

  v0 = (void *)MEMORY[0x24BEBADF8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.PhotosUI"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "loadAccessibilityBundleForBundle:didLoadCallback:", v1, 0);

}

@end
