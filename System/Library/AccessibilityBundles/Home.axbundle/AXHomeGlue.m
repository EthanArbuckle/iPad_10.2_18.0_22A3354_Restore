@implementation AXHomeGlue

+ (id)accessibilityBundles
{
  return 0;
}

+ (void)accessibilityInitializeBundle
{
  if (accessibilityInitializeBundle_onceToken != -1)
    dispatch_once(&accessibilityInitializeBundle_onceToken, &__block_literal_global);
}

void __43__AXHomeGlue_accessibilityInitializeBundle__block_invoke()
{
  void *v0;
  void *v1;
  char v2;
  void *v3;
  _QWORD v4[4];
  char v5;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.Home"));

  objc_msgSend(MEMORY[0x24BE00758], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __43__AXHomeGlue_accessibilityInitializeBundle__block_invoke_4;
  v4[3] = &__block_descriptor_33_e29_v16__0__AXValidationManager_8l;
  v5 = v2;
  objc_msgSend(v3, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global_180, &__block_literal_global_181, 0, v4);

}

uint64_t __43__AXHomeGlue_accessibilityInitializeBundle__block_invoke_2()
{
  return 1;
}

uint64_t __43__AXHomeGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("AX Home"));
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("AX Home"));
  objc_msgSend(v2, "setDebugBuild:", 0);

  return AXPerformValidationChecks();
}

void __43__AXHomeGlue_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
{
  id v2;

  if (*(_BYTE *)(a1 + 32))
  {
    v2 = a2;
    objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HOAddLocationViewControllerAccessibility"), 1);
    objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HOTitleDescriptionAlertActionViewControllerAccessibility"), 1);
    objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("NUIContainerStackViewAccessibility"), 1);
    objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("UIContextMenuCellContentViewAccessibility__Home__UIKit"), 1);

  }
}

@end
