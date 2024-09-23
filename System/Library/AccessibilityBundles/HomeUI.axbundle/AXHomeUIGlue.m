@implementation AXHomeUIGlue

+ (id)accessibilityBundles
{
  return 0;
}

+ (void)accessibilityInitializeBundle
{
  if (accessibilityInitializeBundle_onceToken != -1)
    dispatch_once(&accessibilityInitializeBundle_onceToken, &__block_literal_global);
}

void __45__AXHomeUIGlue_accessibilityInitializeBundle__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDFE4F8], "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global_191, &__block_literal_global_203, 0, &__block_literal_global_207);

}

uint64_t __45__AXHomeUIGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "validateClass:", CFSTR("HFItem"));
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HMAccessory"), CFSTR("category"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HMAccessoryCategory"), CFSTR("localizedDescription"), "@", 0);

  return 1;
}

uint64_t __45__AXHomeUIGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("AX HomeUI"));
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("AX HomeUI"));
  objc_msgSend(v2, "setDebugBuild:", 0);

  return AXPerformValidationChecks();
}

void __45__AXHomeUIGlue_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;

  v2 = a2;
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("UITableViewCellAccessibility__UIKit__HomeUI"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HUGridCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HUChevronButtonAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HUGridActionSetCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HUGridServiceCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HUGridSectionHeaderViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HUDayOfWeekPickerCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HUIconCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HUQuickControlSliderViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HUQuickControlElasticSliderInteractionCoordinatorAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HUGridHeadlineCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HUQuickControlSummaryViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HUTitleControlCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HUColorSwatchViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HUQuickControlCircleButtonAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HUQuickControlColorViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HUColorWheelViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HUColorPickerViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HUControllableItemCollectionViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HUGridCameraCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HUWallpaperThumbnailCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HUNamedWallpaperCollectionViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HUWallpaperEditingViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HomeWallpaperScrollViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HUWallpaperPhotoCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HUIconPickerCollectionViewCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HUIconButtonAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HUQuickControlSwitchViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HUIconViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HUQuickControlViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HUQuickControlSingleControlViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HUQuickControlStepperViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HUQuickControlStepperSegmentViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HFTemperatureIconDescriptorAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HUSimpleControlCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HUQuickControlSegmentedControlSegmentAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HUHomePodStereoSwapperCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HUAlarmTableViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HUOLDAlarmTableViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HUAlarmEditSettingViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HUTriggerListViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HUDashboardNavigationTitleViewAccessibility"), 1);
  v4 = v2;
  v3 = v2;
  AXPerformBlockOnMainThreadAfterDelay();
  objc_msgSend(v3, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HUButtonCellAccessibility"), 1);
  objc_msgSend(v3, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HUCameraControllerAccessibility"), 1);
  objc_msgSend(v3, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HUItemTableViewControllerAccessibility"), 1);
  objc_msgSend(v3, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HUCardViewControllerAccessibility"), 1);
  objc_msgSend(v3, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HUInstructionsCellAccessibility"), 1);
  objc_msgSend(v3, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HUCalendarScrubberViewControllerAccessibility"), 1);
  objc_msgSend(v3, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HUCalendarScrubberContainerViewControllerAccessibility"), 1);
  objc_msgSend(v3, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HULegibilityLabelAccessibility"), 1);
  objc_msgSend(v3, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HUQuickControlWheelPickerViewAccessibility"), 1);
  objc_msgSend(v3, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HUQuickControlRingSliderViewAccessibility"), 1);
  objc_msgSend(v3, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HUSwitchCellAccessibility"), 1);
  objc_msgSend(v3, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HUQuickControlSummaryNavigationBarTitleViewAccessibility"), 1);
  objc_msgSend(v3, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HUQuickControlContainerViewAccessibility"), 1);
  objc_msgSend(v3, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HUCheckmarkCellAccessibility"), 1);
  objc_msgSend(v3, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HUQuickControlPushButtonViewAccessibility"), 1);
  objc_msgSend(v3, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HUClipScrubberViewControllerAccessibility"), 1);
  objc_msgSend(v3, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HUClipScrubberViewAccessibility"), 1);
  objc_msgSend(v3, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HFCameraPlaybackEngineAccessibility"), 1);
  objc_msgSend(v3, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HFCameraClipPlayerAccessibility"), 1);
  objc_msgSend(v3, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HUCameraEventReachabilityCellAccessibility"), 1);
  objc_msgSend(v3, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HUCameraEventRecordingCellAccessibility"), 1);
  objc_msgSend(v3, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HUCameraMicrophoneControlAccessibility"), 1);
  objc_msgSend(v3, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HUAccessoryButtonTableViewHeaderViewAccessibility"), 1);
  objc_msgSend(v3, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HUDashboardNavigationViewAccessibility"), 1);
  objc_msgSend(v3, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HUNaturalLightColorSwatchViewAccessibility"), 1);
  objc_msgSend(v3, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HUCameraPlayerFooterViewControllerAccessibility"), 1);
  objc_msgSend(v3, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HUQuickControlContainerViewControllerAccessibility"), 1);
  objc_msgSend(v3, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HUUIPageViewControllerAccessibility"), 1);
  objc_msgSend(v3, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HURecordingButtonAccessibility"), 1);
  objc_msgSend(v3, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HUAnnounceRecordingViewControllerAccessibility"), 1);
  objc_msgSend(v3, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HUAnnouncementGlobeViewAccessibility"), 1);
  objc_msgSend(v3, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HUDashboardViewControllerAccessibility"), 1);
  objc_msgSend(v3, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HUBannerCollectionViewCellAccessibility"), 1);
  objc_msgSend(v3, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HUDashboardFilterCategoryCellAccessibility"), 1);
  objc_msgSend(v3, "installSafeCategory:canInteractWithTargetClass:", CFSTR("_UICollectionViewListHeaderFooterAccessibility__HomeUI__UIKit"), 1);
  objc_msgSend(v3, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HUQuickControlCollectionViewAccessibility"), 1);
  objc_msgSend(v3, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HUServiceDetailsViewControllerAccessibility"), 1);
  objc_msgSend(v3, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HUMosaicCameraCellAccessibility"), 1);
  objc_msgSend(v3, "installSafeCategory:canInteractWithTargetClass:", CFSTR("UICollectionViewAccessibility__HomeUI__UIKit"), 1);
  objc_msgSend(v3, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HUTileCellAccessibility"), 1);
  objc_msgSend(v3, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HUSceneTileCellAccessibility"), 1);
  objc_msgSend(v3, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HUBannerTableViewCellAccessibility"), 1);
  objc_msgSend(v3, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HUAccessoryTileCellAccessibility"), 1);
  objc_msgSend(v3, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HUSideBarViewControllerAccessibility"), 1);
  objc_msgSend(v3, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HUCheckmarkIconCollectionListCellAccessibility"), 1);
  objc_msgSend(v3, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HUServiceDetailsHeaderCellAccessibility"), 1);
  objc_msgSend(v3, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HUTableViewCellAccessibility"), 1);
  objc_msgSend(v3, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HUMediaAccessControlEditorTableViewControllerAccessibility"), 1);
  objc_msgSend(v3, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HULinkedApplicationTableViewCellAccessibility"), 1);
  objc_msgSend(v3, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HUDownloadControlAccessibility"), 1);
  objc_msgSend(v3, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HUDownloadProgressViewAccessibility"), 1);
  objc_msgSend(v3, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HUAlarmTableViewCellAccessibility"), 1);
  objc_msgSend(v3, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HUQuickControlSectionHeaderViewAccessibility"), 1);
  objc_msgSend(v3, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HUEditLocationViewControllerAccessibility"), 1);
  objc_msgSend(v3, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HUSceneActionEditorViewControllerAccessibility"), 1);
  objc_msgSend(v3, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HUTimerTableViewCellAccessibility"), 1);
  objc_msgSend(v3, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HUTimerCancelButtonViewAccessibility"), 1);
  objc_msgSend(v3, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HUTitleValueDescriptionCellAccessibility"), 1);
  objc_msgSend(v3, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HUStringInLabelTapGestureRecognizerAccessibility"), 1);
  objc_msgSend(v3, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HUGridStatusCellAccessibility"), 1);
  objc_msgSend(v3, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HUHomePodDetailViewAccessibility"), 1);
  objc_msgSend(v3, "installSafeCategory:canInteractWithTargetClass:", CFSTR("HULockupViewAccessibility"), 1);

}

uint64_t __45__AXHomeUIGlue_accessibilityInitializeBundle__block_invoke_5(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "installSafeCategory:canInteractWithTargetClass:", CFSTR("HUViewControllerTableViewCellAccessibility"), 1);
  return objc_msgSend(*(id *)(a1 + 32), "installSafeCategory:canInteractWithTargetClass:", CFSTR("HUViewControllerCollectionViewCellAccessibility"), 1);
}

@end
