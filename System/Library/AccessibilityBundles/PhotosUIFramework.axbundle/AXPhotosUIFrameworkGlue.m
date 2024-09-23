@implementation AXPhotosUIFrameworkGlue

+ (BOOL)_shouldActuallyInstallBundle
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasPrefix:", *MEMORY[0x24BDFE428]);

  return v4 ^ 1;
}

+ (void)accessibilityInitializeBundle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if ((objc_msgSend(a1, "_shouldActuallyInstallBundle") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDFE4F8], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global, &__block_literal_global_296, 0, &__block_literal_global_302);

    objc_msgSend(MEMORY[0x24BDFE480], "sharedInstance");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addHandler:forFramework:", &__block_literal_global_439, CFSTR("PhotosEditUI"));
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", a1);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bundleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _AXLogWithFacility();

  }
}

uint64_t __56__AXPhotosUIFrameworkGlue_accessibilityInitializeBundle__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "validateClass:", CFSTR("PUPhotoCommentEntryView"));
  objc_msgSend(v2, "validateClass:", CFSTR("PUPhotoPostCommentTextEntryCell"));
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("PUPhotosGridCell"), CFSTR("_selectionBadgeVisible"), "BOOL");
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUPhotosGridCell"), CFSTR("isSelectionBadgeVisible"), "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUPhotosGridViewController"), CFSTR("photoCollectionAtIndex:"), "@", "Q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUFeedTextCell"), CFSTR("_setDetailLabel:"), "v", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUFeedViewControllerPhoneSpec"), CFSTR("configureTextCell: forSectionGroupHeaderWithText: collectionViewType:"), "v", "@", "@", "q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUFeedViewController"), CFSTR("_configureImageCell: forAssetAtIndexPath: inCollectionView:"), "v", "@", "@", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUFeedViewController"), CFSTR("_sectionInfoForSection: collectionView:"), "@", "q", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUFeedViewController"), CFSTR("collectionView: viewForSupplementaryElementOfKind: atIndexPath:"), "@", "@", "@", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXFeedSectionInfo"), CFSTR("assetForItemAtIndex:"), "@", "q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXFeedSectionInfo"), CFSTR("hasMultipleAssetsForItemAtIndex:"), "B", "q", 0);
  objc_msgSend(v2, "validateClass:isKindOfClass:", CFSTR("PUActivityViewController"), CFSTR("UIViewController"));
  objc_msgSend(v2, "validateProtocol:hasMethod:isInstanceMethod:isRequired:", CFSTR("PLAssetContainer"), CFSTR("assets"), 1, 1);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUBrowsingSession"), CFSTR("viewModel"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUAssetsDataSource"), CFSTR("numberOfAssetsWithMaximum:"), "q", "q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUTilingDataSource"), CFSTR("enumerateIndexPathsStartingAtIndexPath: reverseDirection: usingBlock:"), "v", "@", "B", "@?", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUNavigationController"), CFSTR("_extendedToolbar"), "@", 0);
  objc_msgSend(v2, "validateClass:", CFSTR("PUScrubberView"));
  objc_msgSend(v2, "validateProtocol:hasMethod:isInstanceMethod:isRequired:", CFSTR("PXLivePhotoTrimScrubberDelegate"), CFSTR("trimScrubber:didEndInteractivelyEditingElement:successful:"), 1, 0);
  objc_msgSend(v2, "validateProtocol:hasMethod:isInstanceMethod:isRequired:", CFSTR("PXLivePhotoTrimScrubberDelegate"), CFSTR("trimScrubber:didBeginInteractivelyEditingElement:"), 1, 0);
  objc_msgSend(v2, "validateClass:", CFSTR("PUFilterToolController"));
  objc_msgSend(v2, "validateClass:", CFSTR("PUAdjustmentsViewController"));
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUFilterToolController"), CFSTR("_effectForIndex:"), "@", "q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("PUFilterToolController"), CFSTR("_slider"), "CEKSlider");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("PUFilterToolController"), CFSTR("_scrubberView"), "CEKWheelScrubberView");
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUAdjustmentsViewController"), CFSTR("sliderWillBeginScrolling:"), "v", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUAdjustmentsViewController"), CFSTR("sliderDidEndScrolling:"), "v", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUAdjustmentsViewController"), CFSTR("sliderValueChanged:"), "v", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUFilterToolController"), CFSTR("sliderWillBeginScrolling:"), "v", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUFilterToolController"), CFSTR("sliderDidScroll:"), "v", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUFilterToolController"), CFSTR("sliderDidEndScrolling:"), "v", "@", 0);
  objc_msgSend(v2, "validateClass:", CFSTR("PUPhotoEditApertureToolbar"));
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUPhotoEditApertureToolbar"), CFSTR("_apertureSliderDidChangeValue:"), "v", "@", 0);

  return 1;
}

uint64_t __56__AXPhotosUIFrameworkGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("Photos UI Framework AX Bundle"));
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("PhotosUI Framework"));
  objc_msgSend(v2, "setDebugBuild:", 0);

  return AXPerformValidationChecks();
}

void __56__AXPhotosUIFrameworkGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("UIButtonAccessibility__PhotosUI__UIKit"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("UIImageViewAccessibility__PhotosUI__UIKit"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("UIToolbarTextButtonAccessibility__PhotosUI__UIKit"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("UITextViewAccessibility__PhotosUI__UIKit"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PUScrubberViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PUOneUpViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("UICollectionViewAccessibility__PhotosUI__UIKit"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PUVideoPlayerViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PUTileControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PUPhotosGridCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PUGridRenderedStripAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PUFeedViewControllerPhoneSpecAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PUFeedTextCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PUFeedImageCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PUFeedViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PUPhotosGridViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PUPhotosSharingGridCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PUActivityViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PUPhotoStreamCreateTitleViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PUCollectionViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PUAlbumListTableViewCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PUAvalancheReviewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PUOneUpBarsControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PUImageTileViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PUUserTransformViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PUSlideshowViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PUSlideshowSpeedCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PUPhotosAlbumViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PUTilingViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PUOneUpSelectionIndicatorTileViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PUAdjustmentsToolControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PUFilterToolControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PHLivePhotoViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PUVideoTileViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PUAlbumListCellContentViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PUAlbumListViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PUFeedCollectionViewLayoutAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PUReviewScreenControlBarAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PUPhotoCommentEntryViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PUPhotoPostCommentTextEntryCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PUFeedCaptionCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PUHorizontalAlbumListGadgetAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PUPhotoEditViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PUCropToolControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PUPhotoEditMediaToolControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PUPhotoEditPortraitToolControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PUCropAspectViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PUCropHandleViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PUAdjustmentsViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PUPhotoEditBaseAdjustmentCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PUCropAspectFlipperViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PURedeyeToolControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PUTrimToolControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PUCarouselSharingViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PUPhotoEditToolControllerViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PUOutlineCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PUOneUpDetailsBarButtonControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PUPickerSearchSuggestionsHeaderViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PULivePhotoVideoOverlayTileViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PUCinematicSubjectIndicatorAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PUVideoEditOverlayViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PUPickerOnboardingHeaderViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PUWallpaperPosterEditorControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("AmbientPhotoFrameControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PUFilmstripWrapperViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PUPhotoEditToolControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PUAudioToolControllerAccessibility"), 1);

}

uint64_t __56__AXPhotosUIFrameworkGlue_accessibilityInitializeBundle__block_invoke_4()
{
  return AXPerformBlockOnMainThreadAfterDelay();
}

void __56__AXPhotosUIFrameworkGlue_accessibilityInitializeBundle__block_invoke_5()
{
  void *v0;
  id v1;

  v0 = (void *)MEMORY[0x24BEBADF8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.PhotosEditUI"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "loadAccessibilityBundleForBundle:didLoadCallback:force:loadAllAccessibilityInfo:", v1, 0, 1, 1);

}

@end
