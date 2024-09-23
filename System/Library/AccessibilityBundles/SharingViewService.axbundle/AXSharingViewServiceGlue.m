@implementation AXSharingViewServiceGlue

+ (void)accessibilityInitializeBundle
{
  if (accessibilityInitializeBundle_onceToken != -1)
    dispatch_once(&accessibilityInitializeBundle_onceToken, &__block_literal_global);
}

void __57__AXSharingViewServiceGlue_accessibilityInitializeBundle__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDFE4F8], "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global_177, &__block_literal_global_178, 0, &__block_literal_global_182);

}

uint64_t __57__AXSharingViewServiceGlue_accessibilityInitializeBundle__block_invoke_2()
{
  return 1;
}

uint64_t __57__AXSharingViewServiceGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("SharingViewService"));
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("SharingViewService"));
  objc_msgSend(v2, "setDebugBuild:", 0);

  return AXPerformValidationChecks();
}

void __57__AXSharingViewServiceGlue_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SVSBaseViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("AppleTVSetupStartViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("ProximityPairingViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("ProximityStatusViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PINEntryViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("iOSSetupStartViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("RepairStartViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("WHASetupStartViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("BroadwayActivationStartViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("BroadwayCardViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("BroadwayActivationDoneViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("UIButtonAccessibility__Sharing__UIKit"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SVSCardContainerViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("LabelledBatteryViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HeadphoneMovieBatteryViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HeadphoneBatteryContainerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HeadphoneImageBatteryViewAccessibility"), 1);

}

@end
