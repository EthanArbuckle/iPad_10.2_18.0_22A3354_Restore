@implementation AXSafariServicesSharedGlue

+ (void)accessibilityInitializeBundle
{
  if (accessibilityInitializeBundle_onceToken != -1)
    dispatch_once(&accessibilityInitializeBundle_onceToken, &__block_literal_global);
}

void __59__AXSafariServicesSharedGlue_accessibilityInitializeBundle__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x24BE00758], "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global_177, &__block_literal_global_178, 0, &__block_literal_global_184);

}

uint64_t __59__AXSafariServicesSharedGlue_accessibilityInitializeBundle__block_invoke_2()
{
  return 1;
}

uint64_t __59__AXSafariServicesSharedGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("Safari Services Bundle"));
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("SafariServices"));
  objc_msgSend(v2, "setDebugBuild:", 0);

  return AXPerformValidationChecks();
}

void __59__AXSafariServicesSharedGlue_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
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
  v4 = objc_msgSend(v3, "hasPrefix:", *MEMORY[0x24BE00558]);

  if ((v4 & 1) == 0)
  {
    objc_msgSend(v5, "installSafeCategory:canInteractWithTargetClass:", CFSTR("_SFNavigationBarAccessibility"), 1);
    objc_msgSend(v5, "installSafeCategory:canInteractWithTargetClass:", CFSTR("_SFNavigationBarURLButtonAccessibility"), 1);
    objc_msgSend(v5, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SFBarRegistrationAccessibility"), 1);
    objc_msgSend(v5, "installSafeCategory:canInteractWithTargetClass:", CFSTR("_SFToolbarAccessibility"), 1);
    objc_msgSend(v5, "installSafeCategory:canInteractWithTargetClass:", CFSTR("_SFBrowserNavigationBarAccessibility"), 1);
    objc_msgSend(v5, "installSafeCategory:canInteractWithTargetClass:", CFSTR("_SFBrowserContentViewControllerAccessibility"), 1);
    objc_msgSend(v5, "installSafeCategory:canInteractWithTargetClass:", CFSTR("_SFNavigationBarLabelsContainerAccessibility"), 1);
    objc_msgSend(v5, "installSafeCategory:canInteractWithTargetClass:", CFSTR("_SFAutomaticPasswordInputViewControllerAccessibility"), 1);
    objc_msgSend(v5, "installSafeCategory:canInteractWithTargetClass:", CFSTR("_SFAutoFillInputViewAccessibility"), 1);
    objc_msgSend(v5, "installSafeCategory:canInteractWithTargetClass:", CFSTR("_SFFormAutoFillControllerAccessibility"), 1);
    objc_msgSend(v5, "installSafeCategory:canInteractWithTargetClass:", CFSTR("_SFMultipleLineAlertActionViewAccessibility"), 1);
    objc_msgSend(v5, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SFContactAutoFillTableViewCellAccessibility"), 1);
    objc_msgSend(v5, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SFPageZoomStepperControllerAccessibility"), 1);
    objc_msgSend(v5, "installSafeCategory:canInteractWithTargetClass:", CFSTR("_SFSiriReaderPlaybackPositionAndStateControllerAccessibility"), 1);
    objc_msgSend(v5, "installSafeCategory:canInteractWithTargetClass:", CFSTR("_SFSettingsAlertStepperAccessibility"), 1);
    objc_msgSend(v5, "installSafeCategory:canInteractWithTargetClass:", CFSTR("_SFSettingsAlertButtonAccessibility"), 1);
    objc_msgSend(v5, "installSafeCategory:canInteractWithTargetClass:", CFSTR("_SFPageFormatMenuControllerAccessibility"), 1);
    objc_msgSend(v5, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SFReaderTextSizeStepperControllerAccessibility"), 1);
    objc_msgSend(v5, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SFFindOnPageToolbarAccessibility"), 1);
    objc_msgSend(v5, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SFUnifiedBarRegistrationAccessibility"), 1);
    objc_msgSend(v5, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SFDownloadsUnifiedBarItemViewAccessibility"), 1);
    objc_msgSend(v5, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SFDownloadsBarButtonItemViewAccessibility"), 1);
    objc_msgSend(v5, "installSafeCategory:canInteractWithTargetClass:", CFSTR("_SFFindOnPageInputBarAccessibility"), 1);
    objc_msgSend(v5, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SFLinkPreviewHeaderContentViewAccessibility"), 1);
    objc_msgSend(v5, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SFAccountDetailViewControllerAccessibility"), 1);
    objc_msgSend(v5, "installSafeCategory:canInteractWithTargetClass:", CFSTR("_SFAccountPickerTableViewControllerAccessibility"), 1);
  }

}

@end
