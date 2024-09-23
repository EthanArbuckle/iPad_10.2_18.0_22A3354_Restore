@implementation AXCameraUIGlue

+ (id)integerFormatter
{
  if (integerFormatter_onceToken != -1)
    dispatch_once(&integerFormatter_onceToken, &__block_literal_global_0);
  return (id)integerFormatter___integerFormatter;
}

uint64_t __34__AXCameraUIGlue_integerFormatter__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD16F0]);
  v1 = (void *)integerFormatter___integerFormatter;
  integerFormatter___integerFormatter = (uint64_t)v0;

  return objc_msgSend((id)integerFormatter___integerFormatter, "setPositiveFormat:", CFSTR("0"));
}

+ (void)accessibilityInitializeBundle
{
  if (accessibilityInitializeBundle_onceToken != -1)
    dispatch_once(&accessibilityInitializeBundle_onceToken, &__block_literal_global_251);
}

void __47__AXCameraUIGlue_accessibilityInitializeBundle__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDFE4F8], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global_254, &__block_literal_global_279, 0, &__block_literal_global_285);

  objc_msgSend(MEMORY[0x24BDFE480], "sharedInstance");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addHandler:forFramework:", &__block_literal_global_477, CFSTR("Photos"));

  objc_msgSend(MEMORY[0x24BDFE480], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addHandler:forFramework:", &__block_literal_global_484, CFSTR("PhotosUICore"));

  objc_msgSend(MEMORY[0x24BDFE480], "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addHandler:forFramework:", &__block_literal_global_490, CFSTR("PhotosUI"));

}

uint64_t __47__AXCameraUIGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "validateClass:", CFSTR("CAMUserPreferences"));
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", CFSTR("CAMUserPreferences"), CFSTR("preferences"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMUserPreferences"), CFSTR("shouldShowGridView"), "B", 0);
  objc_msgSend(v2, "validateClass:", CFSTR("CAMViewfinderViewController"));
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMViewfinderViewController"), CFSTR("_filterTypeForItemIndex:"), "q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMViewfinderViewController"), CFSTR("_apertureSliderDidChangeApertureValue:"), "v", "@", 0);
  objc_msgSend(v2, "validateClass:", CFSTR("CAMSemanticStyleControl"));
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMSemanticStyleControl"), CFSTR("semanticStyle"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMSemanticStyle"), CFSTR("displayName"), "@", 0);

  return 1;
}

uint64_t __47__AXCameraUIGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("CameraUI AX Bundle"));
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("CameraUI"));
  objc_msgSend(v2, "setDebugBuild:", 0);

  return AXPerformValidationChecks();
}

void __47__AXCameraUIGlue_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CAMExpandableMenuButtonAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CAMImageWellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CAMHDRButtonAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CAMZoomSliderAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CAMFlipButtonAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CAMFilterButtonAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CAMBottomBarAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CAMModeDialAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CAMCaptureEngineAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CAMPreviewViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CAMFlashButtonAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CAMTimerButtonAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CAMBurstIndicatorViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CAMPanoramaArrowViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CAMButtonLabelAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CAMCaptureControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CUShutterButtonAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CAMViewfinderViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CAMImagePickerCameraViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CAMViewfinderViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CAMTopBarAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CAMExposureBiasSliderAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CAMApplicationDelegateAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CAMElapsedTimeViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CAMLivePhotoButtonAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CAMCameraViewControllerContainerViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CAMPreviewViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CAMPanoramaViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CAMCameraViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CAMZoomControlAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CAMMotionControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CAMCreativeCameraButtonAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CAMMessagesPhotosButtonAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CAMIntensityButtonAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CAMSpatialCaptureButtonAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CAMControlDrawerButtonAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CAMControlDrawerMenuButtonAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CAMDynamicShutterControlAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CAMDrawerFlashButtonAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CAMDrawerLivePhotoButtonAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CAMDrawerAspectRatioButtonAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CAMDrawerTimerButtonAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CAMControlDrawerCustomButtonAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CAMDrawerFilterButtonAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CAMDrawerLowLightButtonAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CAMControlDrawerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CAMDrawerHDRButtonAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CAMDrawerApertureButtonAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CAMDrawerIntensityButtonAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CAMFullscreenViewfinderAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CAMControlStatusBarAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CAMFlashStatusIndicatorAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CAMLivePhotoStatusIndicatorAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CAMHDRStatusIndicatorAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CAMFilterStatusIndicatorAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CAMTimerStatusIndicatorAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CAMApertureStatusIndicatorAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CAMIntensityStatusIndicatorAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CAMControlStatusIndicatorAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CAMDirectionalIndicatorAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CAMVideoConfigurationStatusIndicatorAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CAMLowLightSliderAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CAMLowLightStatusIndicatorAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CAMDescriptionOverlayViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CAMDrawerExposureButtonAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CAMExposureSliderAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CAMExposureBiasStatusIndicatorAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CAMZoomButtonAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CAMRAWStatusIndicatorAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CAMDrawerRAWButtonAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CAMDrawerSemanticStyleButtonAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CAMSemanticStyleControlAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CAMSemanticStylePickerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CAMSemanticStyleStatusIndicatorAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CAMSemanticStyleDetailViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CAMAutoMacroButtonAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CAMVideoStabilizationStatusIndicatorAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CAMDrawerVideoStabilizationButtonAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CAMSharedLibraryStatusIndicatorAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CAMDrawerSharedLibraryButtonAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CAMProResStatusIndicatorAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CAMSharedLibraryButtonAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CAMPhotoFormatStatusIndicatorAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("_CAMExpandingControlButtonAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CAMDepthEffectSuggestionButtonAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CAMExternalStorageButtonAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CAMFocalLengthLabelAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CAMFlashExpandableStatusIndicatorAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CAMExpandingControlAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CAMSystemOverlayViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CAMSpatialCaptureRecordingIndicatorAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CAMPhotoVideoModeSwitchAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CAMSmartStyleSettingsViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CAMDrawerSmartStyleButtonAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CAMSmartStyleStatusIndicatorAccessibility"), 1);

}

uint64_t __47__AXCameraUIGlue_accessibilityInitializeBundle__block_invoke_5()
{
  return AXPerformBlockOnMainThreadAfterDelay();
}

void __47__AXCameraUIGlue_accessibilityInitializeBundle__block_invoke_6()
{
  void *v0;
  id v1;

  v0 = (void *)MEMORY[0x24BEBADF8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.Photos"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "loadAccessibilityBundleForBundle:didLoadCallback:", v1, 0);

}

uint64_t __47__AXCameraUIGlue_accessibilityInitializeBundle__block_invoke_7()
{
  return AXPerformBlockOnMainThreadAfterDelay();
}

void __47__AXCameraUIGlue_accessibilityInitializeBundle__block_invoke_8()
{
  void *v0;
  id v1;

  v0 = (void *)MEMORY[0x24BEBADF8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.PhotosUICore"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "loadAccessibilityBundleForBundle:didLoadCallback:", v1, 0);

}

uint64_t __47__AXCameraUIGlue_accessibilityInitializeBundle__block_invoke_9()
{
  return AXPerformBlockOnMainThreadAfterDelay();
}

void __47__AXCameraUIGlue_accessibilityInitializeBundle__block_invoke_10()
{
  void *v0;
  id v1;

  v0 = (void *)MEMORY[0x24BEBADF8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.PhotosUI"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "loadAccessibilityBundleForBundle:didLoadCallback:", v1, 0);

}

@end
