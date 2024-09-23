@implementation AXControlCenterUIKitGlue

+ (id)accessibilityBundles
{
  return 0;
}

+ (void)accessibilityInitializeBundle
{
  if (accessibilityInitializeBundle_onceToken != -1)
    dispatch_once(&accessibilityInitializeBundle_onceToken, &__block_literal_global);
}

void __57__AXControlCenterUIKitGlue_accessibilityInitializeBundle__block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x24BE00758], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global_177, &__block_literal_global_178, 0, &__block_literal_global_182);

  objc_msgSend(MEMORY[0x24BE005D8], "sharedInstance");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addHandler:forBundleName:", &__block_literal_global_212, CFSTR("SleepModeControlCenterButton"));

}

uint64_t __57__AXControlCenterUIKitGlue_accessibilityInitializeBundle__block_invoke_2()
{
  return 1;
}

uint64_t __57__AXControlCenterUIKitGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("ControlCenterUIKit (ControlCenter)"));
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("ControlCenterUIKit (ControlCenter)"));
  objc_msgSend(v2, "setDebugBuild:", 0);

  return AXPerformValidationChecks();
}

void __57__AXControlCenterUIKitGlue_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CCUIButtonModuleViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CCUIToggleViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CCUIMenuModuleViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CCUIAppLauncherViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CCUILabeledRoundButtonViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CCUIMenuModuleItemViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CCUIButtonModuleViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CCUIBaseSliderViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CCUIContinuousSliderViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CCUISteppedSliderViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CCUILabeledRoundButtonAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CCUIRoundButtonAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CCUIMenuModuleStackViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CCUIControlTemplateViewAccessibility"), 1);

}

void __57__AXControlCenterUIKitGlue_accessibilityInitializeBundle__block_invoke_5()
{
  id v0;

  objc_msgSend(MEMORY[0x24BE00758], "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global_213, &__block_literal_global_216, 0, &__block_literal_global_219);

}

uint64_t __57__AXControlCenterUIKitGlue_accessibilityInitializeBundle__block_invoke_6(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "validateClass:", CFSTR("SleepModeControlCenterButton.SleepModeButtonViewController"));
  return 1;
}

uint64_t __57__AXControlCenterUIKitGlue_accessibilityInitializeBundle__block_invoke_7(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("ControlCenterUIKit (SleepModule)"));
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("ControlCenterUIKit (SleepModule)"));
  objc_msgSend(v2, "setDebugBuild:", 0);

  return AXPerformValidationChecks();
}

@end
