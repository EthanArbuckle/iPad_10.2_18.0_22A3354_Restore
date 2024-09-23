@implementation AXMobilePiPGlue

+ (void)accessibilityInitializeBundle
{
  void *v2;
  uint64_t v3;
  void *v4;

  if (!_Failover)
  {
    objc_msgSend(MEMORY[0x24BE00758], "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global, &__block_literal_global_197, 0, &__block_literal_global_203);

    v3 = objc_msgSend(objc_allocWithZone((Class)AXMobilePiPGlue), "init");
    v4 = (void *)_Failover;
    _Failover = v3;

  }
}

uint64_t __48__AXMobilePiPGlue_accessibilityInitializeBundle__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "validateClass:", CFSTR("PGHostedWindow"));
  objc_msgSend(v2, "validateClass:", CFSTR("PGPictureInPictureViewController"));
  objc_msgSend(v2, "validateClass:isKindOfClass:", CFSTR("PGHitTestExtendableView"), CFSTR("UIView"));
  objc_msgSend(v2, "validateClass:isKindOfClass:", CFSTR("PGStashView"), CFSTR("UIView"));
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PGHitTestExtendableView"), CFSTR("hitTestExtenderView"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("PGPictureInPictureViewController"), CFSTR("_stashView"), "PGStashView");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("PGStashedMaskView"), CFSTR("_tab"), "UIView");

  return 1;
}

uint64_t __48__AXMobilePiPGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("Pegasus AX Bundle"));
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("Pegasus"));

  return AXPerformValidationChecks();
}

void __48__AXMobilePiPGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PGButtonViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PGPictureInPictureViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("__PGViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PGControlsContainerViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PGProgressIndicatorAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PGStashViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PGHitTestExtendableViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PGLayerHostViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PGHostedWindowAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("_PGPictureInPictureContainerViewAccessibility"), 1);

}

@end
