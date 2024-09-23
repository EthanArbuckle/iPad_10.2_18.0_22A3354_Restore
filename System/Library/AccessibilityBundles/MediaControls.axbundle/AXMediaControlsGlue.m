@implementation AXMediaControlsGlue

+ (id)accessibilityBundles
{
  return 0;
}

+ (void)accessibilityInitializeBundle
{
  if (accessibilityInitializeBundle_onceToken != -1)
    dispatch_once(&accessibilityInitializeBundle_onceToken, &__block_literal_global_0);
}

void __52__AXMediaControlsGlue_accessibilityInitializeBundle__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDFE4F8], "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global_179, &__block_literal_global_180, 0, &__block_literal_global_184);

}

uint64_t __52__AXMediaControlsGlue_accessibilityInitializeBundle__block_invoke_2()
{
  return 1;
}

uint64_t __52__AXMediaControlsGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("MediaControls (ControlCenter)"));
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("MediaControls (ControlCenter)"));
  objc_msgSend(v2, "setDebugBuild:", 0);

  return AXPerformValidationChecks();
}

void __52__AXMediaControlsGlue_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v3 = a2;
  objc_msgSend(v3, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MRUControlCenterButtonAccessibility"), 1);
  objc_msgSend(v3, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MRUTransportButtonAccessibility"), 1);
  objc_msgSend(v3, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MRUNowPlayingHeaderViewAccessibility"), 1);
  objc_msgSend(v3, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MRUNowPlayingLabelViewAccessibility"), 1);
  objc_msgSend(v3, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MRUNowPlayingViewAccessibility"), 1);
  objc_msgSend(v3, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MRUNowPlayingTimeControlsViewAccessibility"), 1);
  objc_msgSend(v3, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MRUMediaSuggestionCollectionViewCellAccessibility"), 1);
  objc_msgSend(v3, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MRUMediaSuggestionsViewAccessibility"), 1);
  objc_msgSend(v3, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MRURoutingTableViewCellAccessibility"), 1);
  objc_msgSend(v3, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MRUVolumeStepperViewAccessibility"), 1);
  objc_msgSend(v3, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MRUControlCenterViewControllerAccessibility"), 1);
  objc_msgSend(v3, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MRUContinuousSliderViewAccessibility"), 1);
  objc_msgSend(v3, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MRUViewServiceRoutingViewAccessibility"), 1);
  objc_msgSend(v3, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MRUNowPlayingVolumeControlsViewAccessibility"), 1);
  objc_msgSend(v3, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MRUSliderAccessibility"), 1);
  objc_msgSend(v3, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MRUActivityNowPlayingViewAccessibility"), 1);
  objc_msgSend(v3, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MRUActivityMirroringViewAccessibility"), 1);
  objc_msgSend(v3, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MRUActivityTrailingAccessoryViewAccessibility"), 1);
  objc_msgSend(v3, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MRUHapticViewAccessibility"), 1);
  objc_msgSend(v3, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MediaControlsEndpointsViewControllerAccessibility"), 1);
  objc_msgSend(v3, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MRPlatterViewControllerAccessibility"), 1);
  objc_msgSend(v3, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MediaControlsTransportStackViewAccessibility"), 1);
  objc_msgSend(v3, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MediaControlsTransportButtonAccessibility"), 1);
  objc_msgSend(v3, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MediaControlsHeaderViewAccessibility"), 1);
  objc_msgSend(v3, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MediaControlsTimeControlAccessibility"), 1);
  objc_msgSend(v3, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MediaControlsRoutingCornerViewAccessibility"), 1);
  objc_msgSend(v3, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MediaControlsUIScrollViewAccessibility"), 1);
  objc_msgSend(v3, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MediaControlsRelativeVolumeStepperAccessibility"), 1);
  objc_msgSend(v3, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MediaControlsRoutingViewControllerAccessibility"), 1);
  objc_msgSend(MEMORY[0x24BEBADE8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsLoadAccessibilityInformation");

  objc_msgSend(v3, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MediaControlsParentContainerViewAccessibility"), 1);
  objc_msgSend(v3, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MediaControlsRoutingButtonViewAccessibility"), 1);
  objc_msgSend(v3, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MediaControlsRoundButtonAccessibility"), 1);
  objc_msgSend(v3, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MediaControlsExpandableButtonAccessibility"), 1);
  objc_msgSend(v3, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MediaControlsContainerViewAccessibility"), 1);
  objc_msgSend(v3, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MediaControlsBluetoothListeningModeButtonAccessibility"), 1);
  objc_msgSend(v3, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MRUNowPlayingTransportControlsViewAccessibility"), 1);
  objc_msgSend(v3, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MRUActivityNowPlayingViewControllerAccessibility"), 1);
  objc_msgSend(v3, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MRUControlCenterCollectionViewCellAccessibility"), 1);
  objc_msgSend(v3, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MRUAmbientCompactNowPlayingViewAccessibility"), 1);
  objc_msgSend(v3, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MRUAmbientNowPlayingVolumeControlsViewAccessibility"), 1);
  objc_msgSend(v3, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MRUControlCenterRouteButtonAccessibility"), 1);
  objc_msgSend(v3, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MRUVolumeViewControllerAccessibility"), 1);
  objc_msgSend(v3, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MRUMediaControlsModuleMoreButtonAccessibility"), 1);

}

@end
