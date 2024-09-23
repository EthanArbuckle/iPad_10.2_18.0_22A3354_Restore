@implementation AXSpringBoardFoundationGlue

+ (void)accessibilityInitializeBundle
{
  void *v2;
  AXSpringBoardFoundationGlue *v3;
  void *v4;

  if (!_Failover)
  {
    objc_msgSend(MEMORY[0x24BE00758], "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global, &__block_literal_global_180, 0, &__block_literal_global_186);

    v3 = objc_alloc_init(AXSpringBoardFoundationGlue);
    v4 = (void *)_Failover;
    _Failover = (uint64_t)v3;

  }
}

uint64_t __60__AXSpringBoardFoundationGlue_accessibilityInitializeBundle__block_invoke()
{
  return 1;
}

uint64_t __60__AXSpringBoardFoundationGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("SpringBoardFoundation AX"));
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("SpringBoardFoundation"));
  objc_msgSend(v2, "setDebugBuild:", 0);

  return AXPerformValidationChecks();
}

void __60__AXSpringBoardFoundationGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBFWallpaperViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBFLockScreenDateViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBFLockScreenDateSubtitleViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBFTouchPassThroughViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBFFocusIsolationViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SBFLockScreenDateSubtitleDateViewAccessibility"), 1);

}

@end
