@implementation AXDigitalTouchSharedGlue

+ (id)accessibilityBundles
{
  return 0;
}

+ (void)accessibilityInitializeBundle
{
  if (accessibilityInitializeBundle_onceToken != -1)
    dispatch_once(&accessibilityInitializeBundle_onceToken, &__block_literal_global);
}

void __57__AXDigitalTouchSharedGlue_accessibilityInitializeBundle__block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x24BE00758], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global_177, &__block_literal_global_178, 0, &__block_literal_global_182);

  objc_msgSend(MEMORY[0x24BE005D8], "sharedInstance");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addHandler:forFramework:", &__block_literal_global_198, CFSTR("DigitalTouchBalloonProvider"));

}

uint64_t __57__AXDigitalTouchSharedGlue_accessibilityInitializeBundle__block_invoke_2()
{
  return 1;
}

uint64_t __57__AXDigitalTouchSharedGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("AX DigitalTouchShared"));
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("AX DigitalTouchShared"));
  objc_msgSend(v2, "setDebugBuild:", 0);

  return AXPerformValidationChecks();
}

void __57__AXDigitalTouchSharedGlue_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("ETCanvasViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("UIColorAccessibility_ElectricTouch_UIKit"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("ETMessageAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("ETTapMessageAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("ETHeartbeatMessageAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("ETSketchMessageAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("ETPaletteCircleViewAccessibility"), 1);

}

void __57__AXDigitalTouchSharedGlue_accessibilityInitializeBundle__block_invoke_5()
{
  id v0;

  objc_msgSend(MEMORY[0x24BE00758], "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "performValidations:withPreValidationHandler:postValidationHandler:", &__block_literal_global_199, &__block_literal_global_202, &__block_literal_global_204);

}

uint64_t __57__AXDigitalTouchSharedGlue_accessibilityInitializeBundle__block_invoke_6(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "validateClass:", CFSTR("@\"GestureInstructionButton\"));
  return 1;
}

uint64_t __57__AXDigitalTouchSharedGlue_accessibilityInitializeBundle__block_invoke_7()
{
  return 1;
}

@end
