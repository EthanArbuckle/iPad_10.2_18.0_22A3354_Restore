@implementation AXBiometricKitUIGlue

+ (void)accessibilityInitializeBundle
{
  uint64_t v2;
  void *v3;
  id v4;

  if (!_Failover)
  {
    v2 = objc_msgSend(objc_allocWithZone((Class)AXBiometricKitUIGlue), "init");
    v3 = (void *)_Failover;
    _Failover = v2;

    objc_msgSend(MEMORY[0x24BE00758], "sharedInstance");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global, &__block_literal_global_182, &__block_literal_global_188, &__block_literal_global_190);

  }
}

uint64_t __53__AXBiometricKitUIGlue_accessibilityInitializeBundle__block_invoke()
{
  return 1;
}

uint64_t __53__AXBiometricKitUIGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("BiometricKitUI AX Bundle"));
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("BiometricKitUI"));
  objc_msgSend(v2, "setDebugBuild:", 0);

  return AXPerformValidationChecks();
}

void __53__AXBiometricKitUIGlue_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("BKUIPearlEnrollViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("BKUIPearlEnrollViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("BKUIPearlPillContainerViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("BKUIPearlCoachingDeviceViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("BKUIPearlEnrollControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("BKUIFingerprintEnrollViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("BKUICurvesViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("BKUIFingerPrintEnrollTutorialViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("BKUIFingerPrintEnrollmentPhaseViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("BKUIButtonTrayAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("BKUIJindoContainerScrollviewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("BKUIPearlInstructionViewAccessibility"), 1);

}

@end
