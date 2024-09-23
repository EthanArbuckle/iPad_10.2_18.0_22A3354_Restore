@implementation AXPhotoLibraryFrameworkGlue

+ (void)accessibilityInitializeBundle
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  if (!_Failover)
  {
    objc_msgSend(MEMORY[0x24BDFE4F8], "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global, &__block_literal_global_292, 0, &__block_literal_global_298);

    v3 = objc_msgSend(objc_allocWithZone((Class)AXPhotoLibraryFrameworkGlue), "init");
    v4 = (void *)_Failover;
    _Failover = v3;

    objc_msgSend(MEMORY[0x24BDFE480], "sharedInstance");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addHandler:forFramework:", &__block_literal_global_340, CFSTR("MessageUI"));

  }
}

uint64_t __60__AXPhotoLibraryFrameworkGlue_accessibilityInitializeBundle__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "validateClass:", CFSTR("PLVideoRemaker"));
  objc_msgSend(v2, "validateClass:", CFSTR("PLCropOverlayBottomBar"));
  objc_msgSend(v2, "validateClass:", CFSTR("PLVideoView"));
  objc_msgSend(v2, "validateClass:", CFSTR("PLExpandableImageView"));
  objc_msgSend(v2, "validateClass:", CFSTR("PLProgressView"));
  objc_msgSend(v2, "validateClass:", CFSTR("PLCropOverlay"));
  objc_msgSend(v2, "validateClass:", CFSTR("PLUIImageViewController"));
  objc_msgSend(v2, "validateClass:isKindOfClass:", CFSTR("PLManagedAsset"), CFSTR("_PLManagedAsset"));
  objc_msgSend(v2, "validateClass:isKindOfClass:", CFSTR("PLProgressView"), CFSTR("UIView"));
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIToolbar"), CFSTR("delegate"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PLCropOverlayBottomBar"), CFSTR("_updatePreviewBottomBarForPlaybackState"), "v", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PLProgressView"), CFSTR("percentComplete"), "f", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PLProgressView"), CFSTR("setPercentComplete:"), "v", "f", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PLVideoRemaker"), CFSTR("cancel"), "v", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PLVideoRemaker"), CFSTR("_didEndRemakingWithTemporaryPath:"), "v", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PLUIImageViewController"), CFSTR("cropOverlayWasOKed:"), "v", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PLVideoView"), CFSTR("_showVideoOverlay"), "v", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PLVideoView"), CFSTR("_videoOverlayFadeOutDidFinish"), "v", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PLVideoView"), CFSTR("viewDidDisappear"), "v", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PLVideoView"), CFSTR("_createScrubberIfNeeded"), "v", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PLVideoView"), CFSTR("duration"), "d", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PLExpandableImageView"), CFSTR("videoView"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PLExpandableImageView"), CFSTR("image"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PLExpandableView"), CFSTR("state"), "i", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PLExpandableView"), CFSTR("setState: withDuration:"), "v", "i", "d", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PLExpandableImageView"), CFSTR("name"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PLPhotoTileViewController"), CFSTR("_configureViews"), "v", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PLExpandableImageView"), CFSTR("setPhoto:"), "v", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PLExpandableImageView"), CFSTR("photo"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIView"), CFSTR("_accessibilityViewIsVisible"), "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("PLProgressView"), CFSTR("_labelView"), "UILabel");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("PLVideoView"), CFSTR("_scrubber"), "UIMovieScrubber");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("PLVideoView"), CFSTR("_videoOverlayPlayButton"), "UIView<PLVideoOverlayButton>");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("PLVideoView"), CFSTR("_moviePlayer"), "PLMoviePlayerController");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("PLExpandableImageView"), CFSTR("_imageView"), "PLImageView");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("PLExpandableImageView"), CFSTR("_photo"), "PLManagedAsset");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("PLCropOverlayBottomBar"), CFSTR("_previewBottomBar"), "PLCropOverlayPreviewBottomBar");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("PLPhotoTileViewController"), CFSTR("_modelPhoto"), "PHAsset");

  return 1;
}

uint64_t __60__AXPhotoLibraryFrameworkGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("Photo Library Framework AX Bundle"));
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("PhotoLibrary"));
  objc_msgSend(v2, "setDebugBuild:", 0);

  return AXPerformValidationChecks();
}

void __60__AXPhotoLibraryFrameworkGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("UITextFieldAccessibility__PhotoLibrary__UIKit"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("UITableViewCellAccessibility__PhotoLibrary__UIKit"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("UIToolbarButtonAccessibility__PhotoLibrary__UIKit"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PLCropOverlayBottomBarAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PLVideoViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PLProgressViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PLVideoRemakerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PLUIImageViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PLCropOverlayAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PLImageScrollViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("UINavigationButtonAccessibility__PhotoLibrary__UIKit"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PLExpandableImageViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PLExpandableViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PLSlalomRegionEditorAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PLPhotoTileViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PLContactPhotoOverlayAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PLHighFidelityVideoOverlayButtonAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PLFlatVideoOverlayButtonAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PLVideoEditingOverlayViewAccessibility"), 1);

}

uint64_t __60__AXPhotoLibraryFrameworkGlue_accessibilityInitializeBundle__block_invoke_4()
{
  return AXPerformBlockOnMainThreadAfterDelay();
}

void __60__AXPhotoLibraryFrameworkGlue_accessibilityInitializeBundle__block_invoke_5()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDFE4F8], "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global_342, &__block_literal_global_343, &__block_literal_global_347, &__block_literal_global_348);

}

uint64_t __60__AXPhotoLibraryFrameworkGlue_accessibilityInitializeBundle__block_invoke_6()
{
  return 1;
}

uint64_t __60__AXPhotoLibraryFrameworkGlue_accessibilityInitializeBundle__block_invoke_7(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("Photo Library  - MessageUI Combo Framework AX Bundle"));
  objc_msgSend(v2, "setDebugBuild:", 0);

  return AXPerformValidationChecks();
}

void __60__AXPhotoLibraryFrameworkGlue_accessibilityInitializeBundle__block_invoke_9(uint64_t a1, void *a2)
{
  id v2;

  objc_msgSend(a2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MFComposeRecipientViewAccessibility__PhotoLibrary__MessageUI"), 1);
  objc_msgSend(MEMORY[0x24BEBADE8], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsLoadAccessibilityInformation");

}

@end
