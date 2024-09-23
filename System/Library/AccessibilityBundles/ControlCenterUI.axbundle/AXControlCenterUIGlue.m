@implementation AXControlCenterUIGlue

+ (id)accessibilityBundles
{
  return 0;
}

+ (void)accessibilityInitializeBundle
{
  if (accessibilityInitializeBundle_onceToken != -1)
    dispatch_once(&accessibilityInitializeBundle_onceToken, &__block_literal_global);
}

void __54__AXControlCenterUIGlue_accessibilityInitializeBundle__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDFE4F8], "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global_177, &__block_literal_global_215, 0, &__block_literal_global_219);

}

uint64_t __54__AXControlCenterUIGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CCUIContentModuleContainerViewController"), CFSTR("isExpanded"), "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CCUIContentModuleContainerViewController"), CFSTR("expandModule"), "v", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CCUIContentModuleContainerViewController"), CFSTR("dismissExpandedModuleAnimated:"), "v", "B", 0);
  objc_msgSend(v2, "validateClass:", CFSTR("ControlCenterUIServices.ControlsGalleryManager"));
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CCUIPagingViewController"), CFSTR("setEditing:"), "v", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CCUIPagingViewController"), CFSTR("changeGridSizeClassOfIcon:toGridSizeClass:"), "v", "@", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CCUIPagingViewController"), CFSTR("resetEndEditingTimerIfNecessary"), "v", 0);
  objc_msgSend(v2, "validateClass:hasSwiftField:withSwiftType:", CFSTR("CCUIPagingViewController"), CFSTR("addButton"), "Optional<UIButton>");
  objc_msgSend(v2, "validateClass:hasSwiftField:withSwiftType:", CFSTR("CCUIPagingViewController"), CFSTR("__rootFolderController"), "Optional<IconListRootFolderController>");
  objc_msgSend(v2, "validateClass:hasSwiftField:withSwiftType:", CFSTR("CCUIPagingViewController"), CFSTR("iconDragManager"), "Optional<SBIconDragManager>");
  objc_msgSend(v2, "validateClass:", CFSTR("ControlCenterUI.IconListRootFolderView"));
  objc_msgSend(v2, "validateClass:isKindOfClass:", CFSTR("ControlCenterUI.IconListRootFolderView"), CFSTR("SBFolderView"));
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ControlCenterUI.IconListRootFolderView"), CFSTR("indicatorDescriptionForPageIndex:"), "@", "q", 0);

  return 1;
}

uint64_t __54__AXControlCenterUIGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("ControlCenterUI (ControlCenter)"));
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("ControlCenterUI (ControlCenter)"));
  objc_msgSend(v2, "setDebugBuild:", 0);

  return AXPerformValidationChecks();
}

void __54__AXControlCenterUIGlue_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CCUIContentModuleContainerViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CCUIContentModuleContainerTransitionAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CCUISensorAttributionExpandedViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CCUISensorAttributionCompactControlAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CCUISensorAttributionSensorButtonAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CCUIHeaderPocketViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CCUIPagingViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CCUIMainViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CCUIIconScrollViewAccessibility"), 1);

}

@end
