@implementation AXAvatarKitGlue

+ (void)accessibilityInitializeBundle
{
  void *v2;
  AXAvatarKitGlue *v3;
  void *v4;

  if (!_Failover)
  {
    objc_msgSend(MEMORY[0x24BE00758], "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global, &__block_literal_global_176, 0, &__block_literal_global_182);

    v3 = objc_alloc_init(AXAvatarKitGlue);
    v4 = (void *)_Failover;
    _Failover = (uint64_t)v3;

  }
}

uint64_t __48__AXAvatarKitGlue_accessibilityInitializeBundle__block_invoke()
{
  return 1;
}

uint64_t __48__AXAvatarKitGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("AvatarKit AX"));
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("AvatarKit"));

  return AXPerformValidationChecks();
}

void __48__AXAvatarKitGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("AVTRecordViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("AVTViewAccessibility"), 1);

}

@end
