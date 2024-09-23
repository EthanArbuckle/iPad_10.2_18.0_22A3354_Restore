@implementation SBIconViewAccessibility

- (void)_updateCloseBoxAnimated:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBIconViewAccessibility;
  -[SBIconViewAccessibility _updateCloseBoxAnimated:](&v4, sel__updateCloseBoxAnimated_, a3);
  -[SBIconViewAccessibility _accessibilitySetupCloseBox](self, "_accessibilitySetupCloseBox");
}

- (void)_accessibilitySetupCloseBox
{
  void *v3;
  id v4;

  -[SBIconViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_closeBox"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("DeleteButton"));

  -[SBIconViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_closeBox"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsAccessibilityElement:", 0);

}

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBIconView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("SBHLibraryPodIndicatorIcon"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconView"), CFSTR("icon"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconView"), CFSTR("location"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconView"), CFSTR("_isShowingCloseBox"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconView"), CFSTR("_createCloseBoxIfNecessary"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconView"), CFSTR("_updateCloseBoxAnimated:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconView"), CFSTR("contextMenuInteraction:configurationForMenuAtLocation:"), "@", "@", "{CGPoint=dd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconView"), CFSTR("contextMenuInteraction:willEndForConfiguration:animator:"), "v", "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconView"), CFSTR("canBecomeFocused"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBIconView"), CFSTR("_closeBox"), "SBCloseBoxView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBIconView"), CFSTR("_accessoryView"), "UIView<SBIconAccessoryView>");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconView"), CFSTR("canReceiveGrabbedIcon:"), "B", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconListModel"), CFSTR("directlyContainsIcon:"), "B", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconListModel"), CFSTR("directlyContainsLeafIconWithIdentifier:"), "B", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHIconManager"), CFSTR("effectiveDockListView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFolderController"), CFSTR("currentIconListView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconView"), CFSTR("icon"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconListModel"), CFSTR("indexForIcon:"), "Q", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHIconManager"), CFSTR("isEditing"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIcon"), CFSTR("isFolderIcon"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIcon"), CFSTR("isPlaceholder"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIcon"), CFSTR("isWidgetIcon"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIcon"), CFSTR("isCategoryIcon"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIcon"), CFSTR("isWidgetStackIcon"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIcon"), CFSTR("canBeAddedToMultiItemDrag"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIcon"), CFSTR("gridSizeClass"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconListView"), CFSTR("isFull"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIcon"), CFSTR("labelAccessoryType"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFolder"), CFSTR("containsIcon:"), "B", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHIconManager"), CFSTR("openedFolder"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconView"), CFSTR("_iconImageView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconView"), CFSTR("folderIcon"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconView"), CFSTR("iconImageCornerRadius"), "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconView"), CFSTR("isCustomIconImageViewHitTestingDisabled"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconView"), CFSTR("_updateCustomIconImageViewControllerHitTesting"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconView"), CFSTR("customIconImageViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBIconView"), CFSTR("_iconLocation"), "NSString");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBIconView"), CFSTR("_focusEffectPlatterView"), "SBIconFocusEffectPlatterView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBIconView"), CFSTR("_delegate"), "<SBIconViewDelegate>");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconDragManager"), CFSTR("enumerateIconDragContextsUsingBlock:"), "v", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconDragContext"), CFSTR("isUserActive"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconDragContext"), CFSTR("draggedIcons"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFolderController"), CFSTR("setCurrentPageIndex: animated: completion:"), "B", "q", "B", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBIconView"), CFSTR("_accessoryView"), "UIView<SBIconAccessoryView>");
  objc_msgSend(v3, "validateProtocol:hasOptionalInstanceMethod:", CFSTR("SBIconViewDelegate"), CFSTR("iconTapped:"));
  objc_msgSend(v3, "validateProtocol:hasOptionalInstanceMethod:", CFSTR("SBIconViewDelegate"), CFSTR("iconCloseBoxTapped:"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFloatingDockViewController"), CFSTR("suggestionsViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIView"), CFSTR("_accessibilityCanDrag"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIView"), CFSTR("_accessibilityBeginDragAtPoint:endpoint:completion:"), "v", "{CGPoint=dd}", "@", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconDragManager"), CFSTR("cancelAllDrags"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconDragManager"), CFSTR("isTrackingWidgetIconDrags"), "B", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("SBHIconManager"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHIconManager"), CFSTR("currentRootIconList"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHIconManager"), CFSTR("_effectiveTodayViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHIconManager"), CFSTR("openedFolderController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHIconManager"), CFSTR("hasOpenFolder"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHIconManager"), CFSTR("setEditing:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("SBIconListView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconListView"), CFSTR("iconColumnsForCurrentOrientation"), "Q", 0);
  objc_msgSend(v3, "validateProtocol:hasOptionalInstanceMethod:", CFSTR("_UIFocusItemInternal"), CFSTR("_viewToAddFocusLayer"));
  objc_msgSend(v3, "validateProtocol:hasOptionalInstanceMethod:", CFSTR("_UIFocusItemInternal"), CFSTR("_insertionIndexOfFocusLayerInView"));
  objc_msgSend(v3, "validateClass:", CFSTR("SBHPageManagementIcon"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHLibraryViewController"), CFSTR("podFolderViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHLibraryViewController"), CFSTR("popNestedViewControllerAnimated:withCompletion:"), "v", "B", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHLibraryPodFolderController"), CFSTR("_nestingViewControllerForPushing"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconView"), CFSTR("behaviorDelegate"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NSObject"), CFSTR("_accessibilityFrameForSorting"), "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NSObject"), CFSTR("_accessibilityCompareFrameForScrollParent:frame:fromOrientation:toOrientation:"), "{CGRect={CGPoint=dd}{CGSize=dd}}", "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", "q", "q", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("SBHLibraryCategoryStackView"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBHLibraryCategoryStackView"), CFSTR("_iconImageViews"), "NSMutableArray");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconView"), CFSTR("presentStackConfigurationCard"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBHStackConfigurationViewController"), CFSTR("_presenter"), "<SBHWidgetSheetViewControllerPresenter>");
  objc_msgSend(v3, "validateClass:", CFSTR("SBHStackConfigurationViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconListView"), CFSTR("coordinateAtPoint:"), "{SBIconCoordinate=qq}", "{CGPoint=dd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconListView"), CFSTR("centerForIconCoordinate:"), "{CGPoint=dd}", "{SBIconCoordinate=qq}", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("_SBHStackConfigurationIconView"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("_SBHStackConfigurationIconView"), CFSTR("SBIconView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_SBHStackConfigurationIconView"), CFSTR("_stackConfigurationViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_SBHStackConfigurationIconView"), CFSTR("_iconListView"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SBIconView"), CFSTR("UIView"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBIconView"), CFSTR("_delegate"), "<SBIconViewDelegate>");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconView"), CFSTR("isShowingResizeHandle"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBIconView"), CFSTR("_customIconImageViewController"), "UIViewController<SBIconViewCustomImageViewControlling>");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconView"), CFSTR("supportedIconGridSizeClasses"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconView"), CFSTR("iconGridSizeClassSizes"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHIconGridSizeClassSizeMap"), CFSTR("gridSizeClassesSortedByGridAreaWithAllowedGridSizeClasses:"), "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconView"), CFSTR("listLayout"), "@", 0);
  objc_msgSend(v3, "validateProtocol:hasMethod:isInstanceMethod:isRequired:", CFSTR("SBIconListLayout"), CFSTR("iconImageInfoForGridSizeClass:"), 1, 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconView"), CFSTR("setIconImageInfo:"), "v", "{SBIconImageInfo={CGSize=dd}dd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconListModel"), CFSTR("bestGridCellIndexForInsertingIcon:maintainingPositionBeforeIcon:ignoringPlaceholders:gridCellInfoOptions:mutationOptions:"), "Q", "@", "@", "B", "Q", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconListModel"), CFSTR("bestGridCellIndexForInsertingIcon:maintainingPositionAfterIcon:ignoringPlaceholders:gridCellInfoOptions:mutationOptions:"), "Q", "@", "@", "B", "Q", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconListModel"), CFSTR("iconAtGridCellIndex:gridCellInfoOptions:"), "@", "Q", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconListView"), CFSTR("iconViewForIcon:"), "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconListModel"), CFSTR("iconWithIdentifier:"), "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBIconListView"), CFSTR("_placeholderAssertions"), "NSHashTable");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconListViewPlaceholderAssertion"), CFSTR("placeholderIcon"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconListView"), CFSTR("displayedModel"), "@", 0);

}

- (BOOL)_accessibilityIsInCmdTabSwitcher
{
  void *v2;
  char v3;

  -[SBIconViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AXIsInCmdTabSwitcher"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)_accessibilityIsInShortcutMenu
{
  void *v2;
  char v3;

  -[SBIconViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AXIsInShortcutMenu"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (unint64_t)_accessibilityAutomationType
{
  return 44;
}

- (BOOL)_axIsAppLibraryInDock
{
  void *v3;
  char isKindOfClass;

  -[SBIconViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("icon"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SBIconViewAccessibility _axIsInDock](self, "_axIsInDock"))
  {
    NSClassFromString(CFSTR("SBHLibraryPodIndicatorIcon"));
    isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (BOOL)_axIsInControlCenterGallery
{
  void *v2;
  char isKindOfClass;

  -[SBIconViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("delegate"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("ControlCenterUIServices.ControlsGalleryManager"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)_axIsInControlCenter
{
  void *v2;
  char v3;

  -[SBIconViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("location"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("controlCenter"));

  return v3;
}

- (id)accessibilityLabel
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  char v11;
  void *v12;
  __CFString *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  SBIconViewAccessibility *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  if (-[SBIconViewAccessibility _axIsAppLibraryInDock](self, "_axIsAppLibraryInDock"))
  {
    accessibilityLocalizedString(CFSTR("app.library"));
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[SBIconViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("icon"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    AXSBMainSwitcherControllerCoordinatorSharedInstance();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "safeBoolForKey:", CFSTR("_axIsAppSwitcherPeekingSlideOver")))
    {
      objc_msgSend(v5, "safeValueForKeyPath:", CFSTR("_activeDisplaySwitcherController._currentLayoutState.floatingAppLayout"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_appLayoutContainingDisplayItem:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else if (objc_msgSend(v5, "safeBoolForKey:", CFSTR("_axIsAppSwitcherPeekingSplitView")))
    {
      objc_msgSend(v5, "safeValueForKeyPath:", CFSTR("_activeDisplaySwitcherController._currentLayoutState.appLayout"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
    objc_msgSend(v4, "accessibilityLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v7)
    {
      v19 = 0;
      v20 = &v19;
      v21 = 0x3032000000;
      v22 = __Block_byref_object_copy__8;
      v23 = __Block_byref_object_dispose__8;
      v24 = 0;
      v17 = MEMORY[0x24BDAC760];
      v18 = self;
      AXPerformSafeBlock();
      v10 = (id)v20[5];
      _Block_object_dispose(&v19, 8);

      v11 = objc_msgSend(v10, "safeBoolForKey:", CFSTR("isMedusaCapable"));
      if ((v11 & 1) != 0)
      {
        objc_msgSend(v7, "safeStringForKey:", CFSTR("_axDisplayName"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v5, "safeBoolForKey:", CFSTR("_axIsAppSwitcherPeekingSlideOver")))
          v13 = CFSTR("create.slide.over.with.home.icon");
        else
          v13 = CFSTR("create.split.view.with.home.icon");
        accessibilityLocalizedString(v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v14, v12, v9, v17, 3221225472, __45__SBIconViewAccessibility_accessibilityLabel__block_invoke, &unk_250383BC0, v18, &v19);
        v15 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v16 = (void *)MEMORY[0x24BDD17C8];
        accessibilityLocalizedString(CFSTR("incompatible.split.view.icon"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "stringWithFormat:", v12, v9);
        v15 = (id)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      v15 = v8;
    }

    return v15;
  }
}

void __45__SBIconViewAccessibility_accessibilityLabel__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  AXSBApplicationControllerSharedInstance();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_accessibilityBundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applicationWithBundleIdentifier:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)accessibilityIdentifier
{
  __CFString *v3;
  void *v4;

  if (-[SBIconViewAccessibility _axIsAppLibraryInDock](self, "_axIsAppLibraryInDock"))
  {
    v3 = CFSTR("AppLibrary");
  }
  else
  {
    -[SBIconViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("icon"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accessibilityIdentifier");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (int64_t)_accessibilityExpandedStatus
{
  void *v3;
  char v4;
  objc_super v6;

  if (-[SBIconViewAccessibility _axIsAppLibraryInDock](self, "_axIsAppLibraryInDock"))
  {
    -[SBIconViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("delegate"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "safeBoolForKey:", CFSTR("isPresentingLibrary"));

    if ((v4 & 1) != 0)
      return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)SBIconViewAccessibility;
  return -[SBIconViewAccessibility _accessibilityExpandedStatus](&v6, sel__accessibilityExpandedStatus);
}

- (BOOL)_accessibilityIsFolderIconView
{
  void *v2;
  BOOL v3;

  -[SBIconViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("folderIcon"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)_accessibilityIsWidgetIconView
{
  void *v2;
  char v3;

  -[SBIconViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("icon"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeBoolForKey:", CFSTR("isWidgetIcon"));

  return v3;
}

- (BOOL)_accessibilityIsWidgetStackIconView
{
  void *v2;
  char v3;

  -[SBIconViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("icon"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeBoolForKey:", CFSTR("isWidgetStackIcon"));

  return v3;
}

- (BOOL)_accessibilityIsWidgetInAddWidgetSheet
{
  void *v2;
  _QWORD *v3;
  void *v4;
  char v5;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  -[SBIconViewAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("location"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v3 = (_QWORD *)getSBIconLocationAddWidgetSheetSymbolLoc_ptr;
  v10 = getSBIconLocationAddWidgetSheetSymbolLoc_ptr;
  if (!getSBIconLocationAddWidgetSheetSymbolLoc_ptr)
  {
    v4 = (void *)SpringBoardHomeLibrary_0();
    v3 = dlsym(v4, "SBIconLocationAddWidgetSheet");
    v8[3] = (uint64_t)v3;
    getSBIconLocationAddWidgetSheetSymbolLoc_ptr = (uint64_t)v3;
  }
  _Block_object_dispose(&v7, 8);
  if (!v3)
    -[SBIconViewAccessibility _accessibilityIsWidgetInAddWidgetSheet].cold.1();
  v5 = objc_msgSend(v2, "containsString:", *v3, v7);

  return v5;
}

- (BOOL)_accessibilityIsCategoryIconView
{
  void *v2;
  char v3;

  -[SBIconViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("icon"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeBoolForKey:", CFSTR("isCategoryIcon"));

  return v3;
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

- (CGRect)accessibilityBrailleMapRenderRegion
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  -[SBIconViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_iconImageView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  -[SBIconViewAccessibility convertRect:fromView:](self, "convertRect:fromView:", v3);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (unsigned)_accessibilityMediaAnalysisOptions
{
  return 0x100000;
}

- (int64_t)accessibilityContainerType
{
  int v3;
  void *v4;
  void *v5;
  int v6;

  v3 = !-[SBIconViewAccessibility _accessibilityIsWidgetIconView](self, "_accessibilityIsWidgetIconView")
    || (-[SBIconViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isCustomIconImageViewHitTestingDisabled")) & 1) != 0|| -[SBIconViewAccessibility _axIsIconEditing](self, "_axIsIconEditing");
  -[SBIconViewAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("location"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  getSBIconLocationAppLibrary();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "containsString:", v5);

  if (v6)
    v3 = !-[SBIconViewAccessibility _accessibilityIsCategoryIconView](self, "_accessibilityIsCategoryIconView");
  if (-[SBIconViewAccessibility _axIsInControlCenter](self, "_axIsInControlCenter")
    || -[SBIconViewAccessibility _axIsInControlCenterGallery](self, "_axIsInControlCenterGallery")
    || v3)
  {
    return 0;
  }
  else
  {
    return 4;
  }
}

- (BOOL)_accessibilityIsInFolder
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  if (!AXProcessIsSpringBoard())
    return 0;
  -[SBIconViewAccessibility _axIconManager](self, "_axIconManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SBIconViewAccessibility _axIconManagerHasOpenFolder](self, "_axIconManagerHasOpenFolder"))
  {
    if (-[SBIconViewAccessibility _axIsInControlCenter](self, "_axIsInControlCenter"))
    {
      -[SBIconViewAccessibility _axFolderController](self, "_axFolderController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "safeValueForKeyPath:", CFSTR("folderView.folder"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v3, "safeValueForKey:", CFSTR("openedFolder"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[SBIconViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("icon"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    v12 = &v11;
    v13 = 0x2020000000;
    v14 = 0;
    v9 = v5;
    v10 = v7;
    AXPerformSafeBlock();
    v6 = *((_BYTE *)v12 + 24) != 0;

    _Block_object_dispose(&v11, 8);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t __51__SBIconViewAccessibility__accessibilityIsInFolder__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "containsIcon:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (BOOL)_accessibilityHasBadge
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  -[SBIconViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("icon"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("badgeNumberOrString"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_opt_class();
    -[SBIconViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_accessoryView"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "_accessibilityViewIsVisible");
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)_accessibilityIsTimedOut
{
  void *v2;
  uint64_t v3;

  -[SBIconViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_icon"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeIntegerForKey:", CFSTR("labelAccessoryType"));

  return v3 == 4;
}

- (BOOL)_accessibilityCanReceiveIcons:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  int v11;
  BOOL v12;
  id obj;
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = a3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v23 != v5)
          objc_enumerationMutation(obj);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "safeBoolForKey:", CFSTR("isPlaceholder")))
        {
          LOBYTE(v16) = 0;
          AXSBIconControllerSharedInstance();
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "safeValueForKey:", CFSTR("iconDragManager"));
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          __UIAccessibilitySafeClass();
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          if ((_BYTE)v16)
            abort();
          v16 = 0;
          v17 = &v16;
          v18 = 0x3032000000;
          v19 = __Block_byref_object_copy__8;
          v20 = __Block_byref_object_dispose__8;
          v21 = 0;
          v15 = v9;
          AXPerformSafeBlock();
          v10 = -[SBIconViewAccessibility _accessibilityCanReceiveIcons:](self, "_accessibilityCanReceiveIcons:", v17[5]);

          _Block_object_dispose(&v16, 8);
          if (!v10)
            goto LABEL_13;
        }
        v16 = 0;
        v17 = &v16;
        v18 = 0x2020000000;
        LOBYTE(v19) = 0;
        AXPerformSafeBlock();
        v11 = *((unsigned __int8 *)v17 + 24);
        _Block_object_dispose(&v16, 8);
        if (!v11)
        {
LABEL_13:
          v12 = 0;
          goto LABEL_14;
        }
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v4)
        continue;
      break;
    }
  }
  v12 = 1;
LABEL_14:

  return v12;
}

uint64_t __57__SBIconViewAccessibility__accessibilityCanReceiveIcons___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __57__SBIconViewAccessibility__accessibilityCanReceiveIcons___block_invoke_2;
  v3[3] = &unk_250383CD0;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v1, "enumerateIconDragContextsUsingBlock:", v3);
}

void __57__SBIconViewAccessibility__accessibilityCanReceiveIcons___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "safeBoolForKey:", CFSTR("isUserActive")))
  {
    objc_msgSend(v6, "safeArrayForKey:", CFSTR("draggedIcons"));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
}

uint64_t __57__SBIconViewAccessibility__accessibilityCanReceiveIcons___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "canReceiveGrabbedIcon:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (BOOL)_accessibilityCanReceiveGrabbedIcons
{
  SBIconViewAccessibility *v2;
  void *v3;
  void *v4;

  v2 = self;
  -[SBIconViewAccessibility _axDragManager](self, "_axDragManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_axGrabbedIcons");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = -[SBIconViewAccessibility _accessibilityCanReceiveIcons:](v2, "_accessibilityCanReceiveIcons:", v4);

  return (char)v2;
}

- (id)accessibilityHint
{
  void *v3;
  void *v4;
  BOOL v5;
  id v6;
  void *v7;
  int v8;
  __CFString *v9;
  void *v10;
  void *v11;
  BOOL v13;
  int v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  __CFString *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  char v23;
  uint64_t v24;
  void *v25;

  -[SBIconViewAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("location"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  getSBIconLocationAppLibrary();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "containsString:", v4))
  {

    goto LABEL_5;
  }
  v5 = -[SBIconViewAccessibility _accessibilityIsCategoryIconView](self, "_accessibilityIsCategoryIconView");

  if (!v5)
  {
LABEL_5:
    if (-[SBIconViewAccessibility _axIsAppLibraryInDock](self, "_axIsAppLibraryInDock"))
    {
      -[SBIconViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("delegate"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "safeBoolForKey:", CFSTR("isPresentingLibrary"));

      if (v8)
      {
        v9 = CFSTR("app.library.hide.hint");
LABEL_13:
        accessibilityLocalizedString(v9);
        v6 = (id)objc_claimAutoreleasedReturnValue();
        return v6;
      }
    }
    if (-[SBIconViewAccessibility _axIsInControlCenterGallery](self, "_axIsInControlCenterGallery"))
    {
      if (AXProcessIsPosterBoard())
      {
        v9 = CFSTR("quick.actions.add.control.hint");
        goto LABEL_13;
      }
      if (AXProcessIsSpringBoard())
      {
        v9 = CFSTR("control.center.add.control.hint");
        goto LABEL_13;
      }
    }
    -[SBIconViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("icon"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "accessibilityHint");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
LABEL_18:
      v6 = v11;

      return v6;
    }
    if (!AXProcessIsSpringBoard()
      || -[SBIconViewAccessibility _accessibilityIsWidgetIconView](self, "_accessibilityIsWidgetIconView"))
    {
      v11 = 0;
      goto LABEL_18;
    }
    v13 = -[SBIconViewAccessibility _axIsIconEditing](self, "_axIsIconEditing");
    v14 = -[SBIconViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_isShowingCloseBox"));
    -[SBIconViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_icon"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "safeIntegerForKey:", CFSTR("labelAccessoryType"));

    if (!v13 && !v14)
    {
      v17 = -[SBIconViewAccessibility accessibilityTraits](self, "accessibilityTraits");
      if ((*MEMORY[0x24BEBB130] & v17) != 0)
      {
        if (-[SBIconViewAccessibility _accessibilityIsTimedOut](self, "_accessibilityIsTimedOut"))
        {
          v18 = CFSTR("app.icon.timed.out.hint");
        }
        else if (v16 == 3)
        {
          v18 = CFSTR("app.icon.cloud.hint");
        }
        else
        {
          v18 = CFSTR("app.icon.hint");
        }
        goto LABEL_35;
      }
      if (-[SBIconViewAccessibility _axIsInDock](self, "_axIsInDock"))
      {
        v18 = CFSTR("dock.full.hint");
        goto LABEL_35;
      }
LABEL_31:
      v11 = 0;
      goto LABEL_36;
    }
    -[SBIconViewAccessibility _axDragManager](self, "_axDragManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "_axGrabbedIcons");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "count");

    if (v21)
    {
      -[SBIconViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("icon"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "safeBoolForKey:", CFSTR("canBeAddedToMultiItemDrag"));

      if ((v23 & 1) == 0)
        goto LABEL_31;
      v18 = CFSTR("app.icon.add.to.drag.hint");
    }
    else
    {
      v18 = CFSTR("app.icon.reorder.hint");
    }
LABEL_35:
    accessibilityLocalizedString(v18);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_36:
    if (AXForceTouchAvailableAndEnabled())
    {
      accessibilityLocalizedString(CFSTR("icons.with.forcetouch.hint"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      __UIAXStringForVariables();
      v24 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v24;
    }
    goto LABEL_18;
  }
  v6 = 0;
  return v6;
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  float v26;
  float v27;
  __n128 v28;
  uint64_t v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v36;
  void *v37;
  void *v38;
  const __CFString *v39;

  if (!-[SBIconViewAccessibility _accessibilityIsTimedOut](self, "_accessibilityIsTimedOut"))
  {
    -[SBIconViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_icon"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "safeIntegerForKey:", CFSTR("labelAccessoryType"));

    if ((unint64_t)(v5 - 1) > 2)
    {
      v6 = 0;
    }
    else
    {
      accessibilityLocalizedString(off_250384080[v5 - 1]);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[SBIconViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("icon"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "accessibilityValue");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!-[SBIconViewAccessibility _accessibilityIsFolderIconView](self, "_accessibilityIsFolderIconView", v36, CFSTR("__AXStringForVariablesSentinel")))
    {
LABEL_18:
      if (-[SBIconViewAccessibility _axIsInControlCenter](self, "_axIsInControlCenter", v37, v38, v39)
        || -[SBIconViewAccessibility _axIsInControlCenterGallery](self, "_axIsInControlCenterGallery"))
      {
        if (-[SBIconViewAccessibility _axIsIconEditing](self, "_axIsIconEditing"))
        {
          -[SBIconViewAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("icon.gridSizeClass"));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBIconViewAccessibility _axStringForGridSizeClass:](self, "_axStringForGridSizeClass:", v30);
          v3 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_30:
          return v3;
        }
        accessibilityLocalizedString(CFSTR("control.icon"));
        v31 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (-[SBIconViewAccessibility _accessibilityIsWidgetIconView](self, "_accessibilityIsWidgetIconView"))
        {
          accessibilityLocalizedString(CFSTR("widget.icon"));
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          if (-[SBIconViewAccessibility _accessibilityIsWidgetStackIconView](self, "_accessibilityIsWidgetStackIconView"))
          {
            accessibilityLocalizedString(CFSTR("widget.icon.stack"));
            v33 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v33 = 0;
          }
          __UIAXStringForVariables();
          v34 = objc_claimAutoreleasedReturnValue();

          v8 = (void *)v34;
        }
        v31 = v8;
        v8 = v31;
      }
      v3 = v31;
      goto LABEL_30;
    }
    objc_opt_class();
    -[SBIconViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("folderIcon"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "safeValueForKey:", CFSTR("_folder"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "safeValueForKey:", CFSTR("allIcons"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_msgSend(v12, "count");
    -[SBIconViewAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("location"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    getSBIconLocationAppLibrary();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "containsString:", v15);

    if (v16)
      v17 = v13 + 3;
    else
      v17 = v13;
    v18 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("folder.icon.count"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringWithFormat:", v19, v17);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    -[SBIconViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("icon"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "safeIntegerForKey:", CFSTR("progressState"));

    if (v22 == 2)
    {
      -[SBIconViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("icon"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "safeFloatForKey:", CFSTR("progressPercent"));
      v27 = v26;

      if (v27 < 1.0)
      {
        v28.n128_f32[0] = v27;
        if (v27 >= 0.0)
        {
          MEMORY[0x234920004](0, v28);
          v23 = objc_claimAutoreleasedReturnValue();
          goto LABEL_13;
        }
      }
    }
    else if (v22 == 1)
    {
      accessibilityLocalizedString(CFSTR("icon.state.download.waiting"));
      v23 = objc_claimAutoreleasedReturnValue();
LABEL_13:
      v24 = (void *)v23;
LABEL_17:
      v38 = v8;
      v39 = CFSTR("__AXStringForVariablesSentinel");
      v37 = v20;
      __UIAXStringForVariables();
      v29 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v29;
      goto LABEL_18;
    }
    v24 = 0;
    goto LABEL_17;
  }
  accessibilityLocalizedString(CFSTR("screen.time.timed.out"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  return v3;
}

- (BOOL)isAccessibilityElement
{
  SBIconViewAccessibility *v2;
  void *v3;
  void *v4;
  void *v5;
  char isKindOfClass;
  void *v8;
  char v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v2 = self;
  -[SBIconViewAccessibility storedIsAccessibilityElement](self, "storedIsAccessibilityElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SBIconViewAccessibility storedIsAccessibilityElement](v2, "storedIsAccessibilityElement");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v2) = objc_msgSend(v4, "BOOLValue");
LABEL_3:

    return (char)v2;
  }
  if (-[SBIconViewAccessibility _accessibilityIsInCmdTabSwitcher](v2, "_accessibilityIsInCmdTabSwitcher")
    || -[SBIconViewAccessibility _accessibilityIsInShortcutMenu](v2, "_accessibilityIsInShortcutMenu")
    || (-[SBIconViewAccessibility safeValueForKey:](v2, "safeValueForKey:", CFSTR("icon")),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        NSClassFromString(CFSTR("SBGrabbedPlaceholderIcon")),
        isKindOfClass = objc_opt_isKindOfClass(),
        v5,
        (isKindOfClass & 1) != 0))
  {
LABEL_7:
    LOBYTE(v2) = 0;
    return (char)v2;
  }
  if (-[SBIconViewAccessibility _axIsInDock](v2, "_axIsInDock")
    || -[SBIconViewAccessibility _axIsInControlCenterGallery](v2, "_axIsInControlCenterGallery"))
  {
LABEL_11:
    LOBYTE(v2) = 1;
    return (char)v2;
  }
  if (!-[SBIconViewAccessibility _accessibilityIsWidgetIconView](v2, "_accessibilityIsWidgetIconView"))
  {
    -[SBIconViewAccessibility safeStringForKey:](v2, "safeStringForKey:", CFSTR("location"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    getSBIconLocationAppLibrarySearch();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v4, "isEqualToString:", v8);

    if ((v9 & 1) != 0)
      goto LABEL_17;
    getSBIconLocationAppLibrary();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v4, "containsString:", v10);

    if (v11)
    {
      LODWORD(v2) = !-[SBIconViewAccessibility _accessibilityIsCategoryIconView](v2, "_accessibilityIsCategoryIconView");
      goto LABEL_3;
    }
    getAPUIIconLocationAppPredictions();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v4, "isEqualToString:", v12);

    if ((v13 & 1) != 0)
    {
      LOBYTE(v2) = 1;
      goto LABEL_3;
    }
    if (!AXProcessIsSpringBoard())
    {
LABEL_17:
      LOBYTE(v2) = 0;
      goto LABEL_3;
    }
    AXSBIconControllerSharedInstance();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "safeValueForKey:", CFSTR("iconManager"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "safeBoolForKey:", CFSTR("hasOpenFolder")))
    {
      objc_msgSend(v15, "safeValueForKey:", CFSTR("openedFolder"));
      v21 = 0;
      v22 = &v21;
      v23 = 0x2020000000;
      v24 = 0;
      v16 = (id)objc_claimAutoreleasedReturnValue();
      AXPerformSafeBlock();
      LOBYTE(v2) = *((_BYTE *)v22 + 24) != 0;
      v17 = v16;
    }
    else
    {
      objc_msgSend(v15, "safeValueForKey:", CFSTR("currentRootIconList"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "safeValueForKey:", CFSTR("model"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v21 = 0;
      v22 = &v21;
      v23 = 0x2020000000;
      v24 = 0;
      v16 = v19;
      AXPerformSafeBlock();
      v20 = *((unsigned __int8 *)v22 + 24);

      _Block_object_dispose(&v21, 8);
      if (v20)
      {
        LOBYTE(v2) = 1;
LABEL_29:

        goto LABEL_3;
      }
      v21 = 0;
      v22 = &v21;
      v23 = 0x2020000000;
      v24 = 0;
      v16 = v16;
      AXPerformSafeBlock();
      LOBYTE(v2) = *((_BYTE *)v22 + 24) != 0;
      v17 = v16;
    }

    _Block_object_dispose(&v21, 8);
    goto LABEL_29;
  }
  if (-[SBIconViewAccessibility _accessibilityIsWidgetInAddWidgetSheet](v2, "_accessibilityIsWidgetInAddWidgetSheet"))
    goto LABEL_7;
  if ((-[SBIconViewAccessibility safeBoolForKey:](v2, "safeBoolForKey:", CFSTR("isCustomIconImageViewHitTestingDisabled")) & 1) != 0)goto LABEL_11;
  return -[SBIconViewAccessibility _axIsIconEditing](v2, "_axIsIconEditing");
}

void __49__SBIconViewAccessibility_isAccessibilityElement__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "safeValueForKey:", CFSTR("icon"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v2, "containsIcon:", v3);

}

void __49__SBIconViewAccessibility_isAccessibilityElement__block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "safeValueForKey:", CFSTR("icon"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v2, "directlyContainsIcon:", v3);

}

void __49__SBIconViewAccessibility_isAccessibilityElement__block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "safeValueForKey:", CFSTR("icon"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("leafIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v2, "directlyContainsLeafIconWithIdentifier:", v3);

}

- (id)automationElements
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;

  -[SBIconViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("icon"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "automationElements");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (-[SBIconViewAccessibility _axIsAppLibraryInDock](self, "_axIsAppLibraryInDock"))
  {
    -[SBIconViewAccessibility _accessibilityDescendantOfType:](self, "_accessibilityDescendantOfType:", NSClassFromString(CFSTR("SBHLibraryCategoryStackView")));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "safeArrayForKey:", CFSTR("_iconImageViews"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "axSafelyAddObjectsFromArray:", v10);

  }
  if (-[SBIconViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_isShowingCloseBox")))
  {
    -[SBIconViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_closeBox"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "axSafelyAddObject:", v11);

  }
  else if (!-[SBIconViewAccessibility isAccessibilityElement](self, "isAccessibilityElement")
         || !objc_msgSend(v8, "count"))
  {
    objc_opt_class();
    __UIAccessibilityCastAsClass();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "subviews");
    v12 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_14;
  }
  v12 = v8;
LABEL_14:

  return v12;
}

- (unint64_t)accessibilityTraits
{
  uint64_t v3;
  _BOOL4 v4;
  uint64_t v5;

  v3 = *MEMORY[0x24BDF73E0];
  if (!-[SBIconViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_isShowingCloseBox"))
    || _AXSAutomationEnabled())
  {
    v3 |= *MEMORY[0x24BEBB130];
  }
  v4 = -[SBIconViewAccessibility _axIsIconEditing](self, "_axIsIconEditing");
  v5 = *MEMORY[0x24BEBB128];
  if (!v4)
    v5 = 0;
  return v5 | v3 | *MEMORY[0x24BDF7430];
}

- (id)_accessibilityBundleIdentifier
{
  void *v2;
  void *v3;

  -[SBIconViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("icon"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accessibilityBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (CGRect)_accessibilityFrameForSorting
{
  void *v3;
  void *v4;
  int v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  objc_super v28;
  objc_super v29;
  CGRect result;

  if (!AXDeviceIsPad())
    goto LABEL_15;
  if (!-[SBIconViewAccessibility _accessibilityIsWidgetIconView](self, "_accessibilityIsWidgetIconView"))
    goto LABEL_15;
  -[SBIconViewAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("_iconLocation"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  getSBIconLocationRoot();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  if (!v5)
    goto LABEL_15;
  -[SBIconViewAccessibility accessibilityFrame](self, "accessibilityFrame");
  AX_CGRectGetCenter();
  v7 = v6;
  v9 = v8;
  -[SBIconViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("icon"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "safeStringForKey:", CFSTR("gridSizeClass"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BEB0988]))
  {
    if ((objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BEB09D0]) & 1) != 0
      || (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BEB09A8]) & 1) != 0
      || objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BEB09B0]))
    {
      goto LABEL_12;
    }
    if ((objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BEB09A0]) & 1) != 0
      || objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BEB0990]))
    {
      -[SBIconViewAccessibility accessibilityFrame](self, "accessibilityFrame");
      v9 = v9 + v17 * -0.25;
LABEL_12:
      -[SBIconViewAccessibility accessibilityFrame](self, "accessibilityFrame");
      v16 = v18;
      -[SBIconViewAccessibility accessibilityFrame](self, "accessibilityFrame");
      goto LABEL_13;
    }

LABEL_15:
    v28.receiver = self;
    v28.super_class = (Class)SBIconViewAccessibility;
    -[SBIconViewAccessibility _accessibilityFrameForSorting](&v28, sel__accessibilityFrameForSorting);
    v7 = v20;
    v9 = v21;
    v16 = v22;
    v19 = v23;
    goto LABEL_16;
  }
  v29.receiver = self;
  v29.super_class = (Class)SBIconViewAccessibility;
  -[SBIconViewAccessibility _accessibilityFrameForSorting](&v29, sel__accessibilityFrameForSorting);
  v7 = v13;
  v9 = v14;
  v16 = v15;
LABEL_13:
  v19 = v12;

LABEL_16:
  v24 = v7;
  v25 = v9;
  v26 = v16;
  v27 = v19;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (CGRect)_accessibilityCompareFrameForScrollParent:(id)a3 frame:(CGRect)a4 fromOrientation:(int64_t)a5 toOrientation:(int64_t)a6
{
  double height;
  double width;
  double y;
  double x;
  id v13;
  void *v14;
  void *v15;
  char v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  objc_super v25;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v13 = a3;
  if (!AXDeviceIsPad()
    || !-[SBIconViewAccessibility _accessibilityIsWidgetIconView](self, "_accessibilityIsWidgetIconView")
    || (-[SBIconViewAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("_iconLocation")),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        getSBIconLocationRoot(),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        v16 = objc_msgSend(v14, "isEqualToString:", v15),
        v15,
        v14,
        (v16 & 1) == 0))
  {
    v25.receiver = self;
    v25.super_class = (Class)SBIconViewAccessibility;
    -[SBIconViewAccessibility _accessibilityCompareFrameForScrollParent:frame:fromOrientation:toOrientation:](&v25, sel__accessibilityCompareFrameForScrollParent_frame_fromOrientation_toOrientation_, v13, a5, a6, x, y, width, height);
    x = v17;
    y = v18;
    width = v19;
    height = v20;
  }

  v21 = x;
  v22 = y;
  v23 = width;
  v24 = height;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (CGRect)accessibilityFrame
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  double v33;
  double v34;
  double v35;
  double v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect result;
  CGRect v44;
  CGRect v45;

  -[SBIconViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("superview"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SBIconViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("bounds"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rectValue");

    -[SBIconViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_accessoryView"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_labelView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 && (objc_msgSend(v5, "superview"), v7 = (void *)objc_claimAutoreleasedReturnValue(), v7, v7))
    {
      UIAccessibilityFrameForBounds();
      v9 = v8;
      v11 = v10;
      v13 = v12;
      v15 = v14;
      objc_msgSend(v5, "accessibilityFrame");
      v44.origin.x = v16;
      v44.origin.y = v17;
      v44.size.width = v18;
      v44.size.height = v19;
      v37.origin.x = v9;
      v37.origin.y = v11;
      v37.size.width = v13;
      v37.size.height = v15;
      v38 = CGRectUnion(v37, v44);
    }
    else
    {
      UIAccessibilityFrameForBounds();
    }
    x = v38.origin.x;
    y = v38.origin.y;
    width = v38.size.width;
    height = v38.size.height;
    objc_msgSend(v6, "superview");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      objc_msgSend(v6, "accessibilityFrame");
      v45.origin.x = v29;
      v45.origin.y = v30;
      v45.size.width = v31;
      v45.size.height = v32;
      v39.origin.x = x;
      v39.origin.y = y;
      v39.size.width = width;
      v39.size.height = height;
      v40 = CGRectUnion(v39, v45);
      x = v40.origin.x;
      y = v40.origin.y;
      width = v40.size.width;
      height = v40.size.height;
    }
    v41.origin.x = x;
    v41.origin.y = y;
    v41.size.width = width;
    v41.size.height = height;
    v42 = CGRectInset(v41, -2.0, -2.0);
    v20 = v42.origin.x;
    v21 = v42.origin.y;
    v22 = v42.size.width;
    v23 = v42.size.height;

  }
  else
  {
    v20 = *MEMORY[0x24BDBF090];
    v21 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v22 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v23 = *(double *)(MEMORY[0x24BDBF090] + 24);
  }
  v33 = v20;
  v34 = v21;
  v35 = v22;
  v36 = v23;
  result.size.height = v36;
  result.size.width = v35;
  result.origin.y = v34;
  result.origin.x = v33;
  return result;
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  void *v5;
  void *v6;
  BOOL v7;
  objc_super v9;

  AXSBIconControllerSharedInstance();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a3 == 2)
  {
    if (objc_msgSend(v5, "_axNeedsToDismissHomeScreenTodayView"))
    {
      objc_msgSend(v6, "_axHideTodayView");
      goto LABEL_7;
    }
LABEL_8:
    v9.receiver = self;
    v9.super_class = (Class)SBIconViewAccessibility;
    v7 = -[SBIconViewAccessibility accessibilityScroll:](&v9, sel_accessibilityScroll_, a3);
    goto LABEL_9;
  }
  if (a3 != 1 || !objc_msgSend(v5, "_axIsShowingAppLibrary"))
    goto LABEL_8;
  objc_msgSend(v6, "_axHideAppLibrary");
LABEL_7:
  v7 = 1;
LABEL_9:

  return v7;
}

- (CGPoint)accessibilityActivationPoint
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  objc_super v10;
  CGPoint result;

  if (-[SBIconViewAccessibility _axIsAppLibraryInDock](self, "_axIsAppLibraryInDock")
    || -[SBIconViewAccessibility _axIsInControlCenterGallery](self, "_axIsInControlCenterGallery"))
  {
    v10.receiver = self;
    v10.super_class = (Class)SBIconViewAccessibility;
    -[SBIconViewAccessibility accessibilityActivationPoint](&v10, sel_accessibilityActivationPoint);
  }
  else
  {
    -[SBIconViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_iconImageView"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accessibilityActivationPoint");
    v7 = v6;
    v9 = v8;

    v3 = v7;
    v4 = v9;
  }
  result.y = v4;
  result.x = v3;
  return result;
}

- (id)_accessibilityScrollStatus
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t);
  void *v51;
  id v52;
  id v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t);
  void *v58;
  id v59;
  id v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t (*v64)(uint64_t);
  void *v65;
  id v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t *v73;
  uint64_t v74;
  uint64_t v75;
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x24BDAC8D0];
  AXSBIconControllerSharedInstance();
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  AXSBHIconManagerFromSharedIconController();
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("icon"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = 0;
  v73 = &v72;
  v74 = 0x2020000000;
  v75 = 0x7FFFFFFFFFFFFFFFLL;
  if (-[SBIconViewAccessibility _axIsInDock](self, "_axIsInDock"))
  {
    -[SBIconViewAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("_iconLocation"));
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "safeValueForKey:", CFSTR("effectiveDockListView"));
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "isEqual:", CFSTR("SBIconLocationFloatingDockSuggestions")))
    {
      AXSBFloatingDockControllerFromActiveDisplayWindowScene();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "safeValueForKey:", CFSTR("_viewController"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "safeValueForKey:", CFSTR("floatingDockViewController"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "safeValueForKey:", CFSTR("suggestionsViewController"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "safeValueForKey:", CFSTR("listView"));
      v9 = objc_claimAutoreleasedReturnValue();

      v4 = (id)v9;
    }
    objc_msgSend(v4, "safeValueForKey:", CFSTR("model"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v73[3] = 0x7FFFFFFFFFFFFFFFLL;
    v48 = MEMORY[0x24BDAC760];
    v49 = 3221225472;
    v50 = __53__SBIconViewAccessibility__accessibilityScrollStatus__block_invoke_3;
    v51 = &unk_250383B98;
    v54 = &v72;
    v11 = v10;
    v52 = v11;
    v12 = v42;
    v53 = v12;
    AXPerformSafeBlock();
    if (v73[3] != 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_15;
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    objc_msgSend(v11, "safeArrayForKey:", CFSTR("icons"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v44, v76, 16);
    if (v14)
    {
      v15 = 0;
      v16 = *(_QWORD *)v45;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v45 != v16)
            objc_enumerationMutation(v13);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * i), "isEqual:", v12))
            v73[3] = v15 + i;
        }
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v44, v76, 16);
        v15 += i;
      }
      while (v14);
    }

    if (v73[3] != 0x7FFFFFFFFFFFFFFFLL)
    {
LABEL_15:
      getSBIconLocationDock();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v3, "isEqual:", v18);

      if (v19)
      {
        v20 = (void *)MEMORY[0x24BDD17C8];
        accessibilityLocalizedString(CFSTR("finished.moving.app.in.dock"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        MEMORY[0x234920010](v73[3] + 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "stringWithFormat:", v21, v22);
        v23 = objc_claimAutoreleasedReturnValue();
LABEL_26:
        v31 = (void *)v23;

LABEL_28:
        goto LABEL_29;
      }
      if (objc_msgSend(v3, "isEqual:", CFSTR("SBIconLocationFloatingDockSuggestions")))
      {
        v36 = (void *)MEMORY[0x24BDD17C8];
        accessibilityLocalizedString(CFSTR("suggestions.dock.position"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        MEMORY[0x234920010](v73[3] + 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "stringWithFormat:", v21, v22);
        v23 = objc_claimAutoreleasedReturnValue();
        goto LABEL_26;
      }
    }
    v31 = 0;
    goto LABEL_28;
  }
  if (objc_msgSend(v43, "safeBoolForKey:", CFSTR("hasOpenFolder")))
  {
    -[SBIconViewAccessibility _axFolderController](self, "_axFolderController");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "safeValueForKey:", CFSTR("currentIconListView"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilitySafeClass();
    v26 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v43, "safeValueForKey:", CFSTR("currentRootIconList"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v26, "safeValueForKey:", CFSTR("model"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = 0;
  v69 = &v68;
  v70 = 0x2020000000;
  v28 = MEMORY[0x24BDAC760];
  v71 = 0;
  v62 = MEMORY[0x24BDAC760];
  v63 = 3221225472;
  v64 = __53__SBIconViewAccessibility__accessibilityScrollStatus__block_invoke;
  v65 = &unk_250383BC0;
  v67 = &v68;
  v3 = v26;
  v66 = v3;
  AXPerformSafeBlock();
  v29 = v69[3];

  _Block_object_dispose(&v68, 8);
  v55 = v28;
  v56 = 3221225472;
  v57 = __53__SBIconViewAccessibility__accessibilityScrollStatus__block_invoke_2;
  v58 = &unk_250383B98;
  v61 = &v72;
  v4 = v27;
  v59 = v4;
  v60 = v42;
  AXPerformSafeBlock();
  v30 = v73[3];
  if (v30 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v31 = 0;
  }
  else
  {
    v32 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("finished.moving.app"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x234920010](v30 / v29 + 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x234920010](v30 % v29 + 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "stringWithFormat:", v33, v34, v35);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v11 = v59;
LABEL_29:

  -[SBIconViewAccessibility _accessibilityScrollAncestor](self, "_accessibilityScrollAncestor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "_accessibilityScrollStatus");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v72, 8);
  return v38;
}

uint64_t __53__SBIconViewAccessibility__accessibilityScrollStatus__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "iconColumnsForCurrentOrientation");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __53__SBIconViewAccessibility__accessibilityScrollStatus__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "indexForIcon:", *(_QWORD *)(a1 + 40));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

uint64_t __53__SBIconViewAccessibility__accessibilityScrollStatus__block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "indexForIcon:", *(_QWORD *)(a1 + 40));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (BOOL)_accessibilityScrollToVisible
{
  void *v3;
  void *v4;
  BOOL v5;
  unsigned __int8 v6;
  BOOL v7;
  void *v9;
  void *v10;
  objc_super v11;
  objc_super v12;
  objc_super v13;

  -[SBIconViewAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("_iconLocation"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  getSBIconLocationAppLibrary();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "containsString:", v4) & 1) == 0)
  {
    v5 = -[SBIconViewAccessibility _axIsInControlCenterGallery](self, "_axIsInControlCenterGallery");

    if (v5)
      goto LABEL_4;
    if (AXProcessIsCarPlay())
    {
      v12.receiver = self;
      v12.super_class = (Class)SBIconViewAccessibility;
      v6 = -[SBIconViewAccessibility _accessibilityScrollToVisible](&v12, sel__accessibilityScrollToVisible);
      goto LABEL_5;
    }
    -[SBIconViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("delegate"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSClassFromString(CFSTR("SBHStackConfigurationViewController"));
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v9, "safeValueForKey:", CFSTR("_presenter"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      NSClassFromString(CFSTR("AMUIInfographViewController"));
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11.receiver = self;
        v11.super_class = (Class)SBIconViewAccessibility;
        v7 = -[SBIconViewAccessibility _accessibilityScrollToVisible](&v11, sel__accessibilityScrollToVisible);

LABEL_14:
        goto LABEL_6;
      }

    }
    v7 = 1;
    goto LABEL_14;
  }

LABEL_4:
  v13.receiver = self;
  v13.super_class = (Class)SBIconViewAccessibility;
  v6 = -[SBIconViewAccessibility _accessibilityScrollToVisible](&v13, sel__accessibilityScrollToVisible);
LABEL_5:
  v7 = v6;
LABEL_6:

  return v7;
}

- (BOOL)accessibilityActivate
{
  _BOOL4 v4;
  int v5;
  void *v6;
  int v7;
  void *v8;
  char v9;
  void *v10;
  objc_super v11;
  objc_super v12;

  if ((AXProcessIsCarPlay() & 1) != 0)
    return 0;
  v4 = -[SBIconViewAccessibility _axIsIconEditing](self, "_axIsIconEditing");
  v5 = -[SBIconViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_isShowingCloseBox"));
  -[SBIconViewAccessibility _axDragManager](self, "_axDragManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "_axIsIconDragging");

  if (v7)
  {
    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
    return -[SBIconViewAccessibility accessibilityActivate](&v12, sel_accessibilityActivate, v11.receiver, v11.super_class, self, SBIconViewAccessibility);
  }
  else if ((v4 & v5) == 1)
  {
    return -[SBIconViewAccessibility _accessibilityDeleteApp](self, "_accessibilityDeleteApp");
  }
  else
  {
    -[SBIconViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_delegate"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      -[SBIconViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_delegate"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "iconTapped:", self);

      return 1;
    }
    else
    {
      return -[SBIconViewAccessibility accessibilityActivate](&v11, sel_accessibilityActivate, self, SBIconViewAccessibility, v12.receiver, v12.super_class);
    }
  }
}

- (BOOL)_accessibilityDeleteApp
{
  void *v3;
  char v4;

  -[SBIconViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_delegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();
  if ((v4 & 1) != 0)
    objc_msgSend(v3, "iconCloseBoxTapped:", self);

  return v4 & 1;
}

- (BOOL)_accessibilityResizeControl:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v10;

  v10 = a3;
  v4 = v10;
  AXPerformSafeBlock();
  v5 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("control.resize.announcement"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconViewAccessibility _axStringForGridSizeClass:](self, "_axStringForGridSizeClass:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringWithFormat:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], self);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], v8);

  return 1;
}

void __55__SBIconViewAccessibility__accessibilityResizeControl___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("_customIconImageViewController"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("_delegate"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "safeSwiftValueForKey:", CFSTR("listLayout"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "iconImageInfoForGridSizeClass:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setIconImageInfo:");
  objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
  objc_msgSend(v5, "setGridSizeClass:", objc_msgSend(*(id *)(a1 + 32), "_axIconToCCUIGridSize:", *(_QWORD *)(a1 + 40)));
  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("icon"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "changeGridSizeClassOfIcon:toGridSizeClass:", v4, *(_QWORD *)(a1 + 40));

  objc_msgSend(v2, "resetEndEditingTimerIfNecessary");
}

- (int64_t)_axIconToCCUIGridSize:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CCUIIconGridSizeClassSmall")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CCUIIconGridSizeClassSmallTall")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CCUIIconGridSizeClassSmallWide")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CCUIIconGridSizeClassSmallExtraWide")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CCUIIconGridSizeClassMedium")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CCUIIconGridSizeClassMediumWide")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CCUIIconGridSizeClassLarge")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CCUIIconGridSizeClassLargeTall")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CCUIIconGridSizeClassLargeWide")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CCUIIconGridSizeClassLargeExtraTall")) & 1) != 0)
  {
    v4 = 9;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("CCUIIconGridSizeClassLargeExtraWide")))
  {
    v4 = 10;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)_accessibilityElementShouldBeInvalid
{
  void *v3;
  objc_super v5;

  -[SBIconViewAccessibility superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 1;
  v5.receiver = self;
  v5.super_class = (Class)SBIconViewAccessibility;
  return -[SBIconViewAccessibility _accessibilityElementShouldBeInvalid](&v5, sel__accessibilityElementShouldBeInvalid);
}

- (BOOL)_accessibilityCanPerformEscapeAction
{
  void *v2;
  char v3;

  AXSBHIconManagerFromSharedIconController();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeBoolForKey:", CFSTR("hasOpenFolder"));

  return v3;
}

- (BOOL)_accessibilityOverridesInvisibility
{
  return _AXSAutomationEnabled() != 0;
}

- (BOOL)accessibilityPerformEscape
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  BOOL v10;

  AXSBIconControllerSharedInstance();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "safeBoolForKey:", CFSTR("areAnyIconViewContextMenusShowing")))
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "postNotificationName:object:", CFSTR("AXDismissShortcutMenu"), 0);
LABEL_6:

    goto LABEL_7;
  }
  if (objc_msgSend(v3, "_axIsShowingAppLibrary"))
  {
    -[SBIconViewAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("location"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    getSBIconLocationAppLibraryCategoryPodExpanded();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

    if (!v7)
    {
      objc_msgSend(v3, "_axHideAppLibrary");
      goto LABEL_7;
    }
    AXLibraryViewController(CFSTR("activeDisplayWindowScene"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "safeValueForKeyPath:", CFSTR("podFolderViewController._nestingViewControllerForPushing"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = v9;
    AXPerformSafeBlock();

    goto LABEL_6;
  }
  if (!objc_msgSend(v3, "_axNeedsToDismissHomeScreenTodayView"))
  {
    v10 = 0;
    goto LABEL_8;
  }
  objc_msgSend(v3, "_axHideTodayView");
LABEL_7:
  v10 = 1;
LABEL_8:

  return v10;
}

uint64_t __53__SBIconViewAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "popNestedViewControllerAnimated:withCompletion:", 1, 0);
}

- (id)accessibilityCustomActions
{
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _BOOL4 v12;
  const __CFString *v13;
  void *v14;
  char v15;
  NSObject *v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  id v20;
  int v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if (-[SBIconViewAccessibility _axIsInControlCenterGallery](self, "_axIsInControlCenterGallery"))
    return 0;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconViewAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("_iconLocation"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  AXLogSpringboardServer();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v21 = 138412290;
    v22 = (uint64_t)v5;
    _os_log_impl(&dword_232A63000, v6, OS_LOG_TYPE_INFO, "[Custom Action]: Icon located in %@.", (uint8_t *)&v21, 0xCu);
  }

  getAPUIIconLocationAppPredictions();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", v7) & 1) != 0)
  {
    v8 = 1;
  }
  else
  {
    getSBIconLocationAppLibrary();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "containsString:", v9))
    {
      getSBIconLocationAppLibraryCategoryPodExpanded();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v5, "isEqualToString:", v10) & 1) != 0)
        v8 = 0;
      else
        v8 = !-[SBIconViewAccessibility _accessibilityIsCategoryIconView](self, "_accessibilityIsCategoryIconView");

    }
    else
    {
      v8 = 0;
    }

  }
  AXLogSpringboardServer();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = -[SBIconViewAccessibility _accessibilityIsCategoryIconView](self, "_accessibilityIsCategoryIconView");
    v13 = CFSTR("NO");
    if (v12)
      v13 = CFSTR("YES");
    v21 = 138412290;
    v22 = (uint64_t)v13;
    _os_log_impl(&dword_232A63000, v11, OS_LOG_TYPE_INFO, "[Custom Action]: Icon is a category view: %@.", (uint8_t *)&v21, 0xCu);
  }

  if (AXProcessIsSpringBoard())
  {
    objc_msgSend(MEMORY[0x24BE006F0], "server");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isShowingNonSystemApp");

    if ((v15 & 1) == 0)
    {
      AXLogSpringboardServer();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        LOWORD(v21) = 0;
        _os_log_impl(&dword_232A63000, v16, OS_LOG_TYPE_INFO, "[Custom Action]: SpringBoard process is focused and SpringBoard is visible.", (uint8_t *)&v21, 2u);
      }

      if ((v8 & 1) == 0)
        -[SBIconViewAccessibility _accessibilityAddEditActions:](self, "_accessibilityAddEditActions:", v4);
      -[SBIconViewAccessibility _accessibilityDeleteActions:](self, "_accessibilityDeleteActions:", v4);
      -[SBIconViewAccessibility _accessibilityDropFromFolderAction:](self, "_accessibilityDropFromFolderAction:", v4);
    }
  }
  if ((v8 & 1) == 0 && !-[SBIconViewAccessibility _axIsInControlCenter](self, "_axIsInControlCenter"))
  {
    -[SBIconViewAccessibility _accessibilityInDockActions:](self, "_accessibilityInDockActions:", v4);
    -[SBIconViewAccessibility _accessibilityAddTodayViewAction:](self, "_accessibilityAddTodayViewAction:", v4);
    -[SBIconViewAccessibility _accessibilityAddAppLibraryViewAction:](self, "_accessibilityAddAppLibraryViewAction:", v4);
  }
  if (-[SBIconViewAccessibility _axIsInControlCenter](self, "_axIsInControlCenter"))
  {
    -[SBIconViewAccessibility _accessibilityResizeActions:](self, "_accessibilityResizeActions:", v4);
    -[SBIconViewAccessibility _accessibilityAddControlsGalleryViewAction:](self, "_accessibilityAddControlsGalleryViewAction:", v4);
  }
  if (objc_msgSend(v4, "count"))
    v17 = v4;
  else
    v17 = 0;
  AXLogSpringboardServer();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    v19 = objc_msgSend(v17, "count");
    v21 = 134217984;
    v22 = v19;
    _os_log_impl(&dword_232A63000, v18, OS_LOG_TYPE_INFO, "[Custom Action]: %li actions found.", (uint8_t *)&v21, 0xCu);
  }

  v20 = v17;
  return v20;
}

- (void)_accessibilityDeleteActions:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  id v7;

  v7 = a3;
  if (-[SBIconViewAccessibility _axIsIconEditing](self, "_axIsIconEditing"))
  {
    -[SBIconViewAccessibility _axDragManager](self, "_axDragManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "_axIsIconDragging") & 1) != 0)
    {
LABEL_5:

      goto LABEL_6;
    }
    v5 = -[SBIconViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_isShowingCloseBox"));

    if (v5)
    {
      accessibilityLocalizedString(CFSTR("delete.key"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6788]), "initWithName:target:selector:", v4, self, sel__accessibilityDeleteApp);
      objc_msgSend(v7, "addObject:", v6);

      goto LABEL_5;
    }
  }
LABEL_6:

}

- (void)_accessibilityAddEditActions:(id)a3
{
  id v4;
  _BOOL4 v5;
  int v6;
  void *v7;
  char isKindOfClass;
  NSObject *v9;
  const __CFString *v10;
  NSObject *v11;
  const __CFString *v12;
  void *v13;
  NSObject *v14;
  const __CFString *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  int v21;
  const __CFString *v22;
  uint8_t buf[4];
  const __CFString *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[SBIconViewAccessibility _axIsIconEditing](self, "_axIsIconEditing");
  if (!v5 || !-[SBIconViewAccessibility _axInAmbientPresentationMode](self, "_axInAmbientPresentationMode"))
  {
    v6 = -[SBIconViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isCustomIconImageViewHitTestingDisabled"));
    -[SBIconViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("icon"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSClassFromString(CFSTR("SBHPageManagementIcon"));
    isKindOfClass = objc_opt_isKindOfClass();

    AXLogSpringboardServer();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      if (v6)
        v10 = CFSTR("YES");
      else
        v10 = CFSTR("NO");
      *(_DWORD *)buf = 138412290;
      v24 = v10;
      _os_log_impl(&dword_232A63000, v9, OS_LOG_TYPE_INFO, "[Custom Action]: Icon image view hit testing disabled: %@.", buf, 0xCu);
    }

    AXLogSpringboardServer();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      if ((isKindOfClass & 1) != 0)
        v12 = CFSTR("YES");
      else
        v12 = CFSTR("NO");
      *(_DWORD *)buf = 138412290;
      v24 = v12;
      _os_log_impl(&dword_232A63000, v11, OS_LOG_TYPE_INFO, "[Custom Action]: Icon view is page management icon: %@.", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x24BE006F0], "server");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v13, "isAppSwitcherVisible") & 1) != 0
      || (AXContextMenuIsShowing & 1) != 0
      || (-[SBIconViewAccessibility _accessibilityIsWidgetIconView](self, "_accessibilityIsWidgetIconView") & v6 & 1) != 0)
    {
      goto LABEL_29;
    }

    if ((isKindOfClass & 1) == 0)
    {
      AXLogSpringboardServer();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_232A63000, v14, OS_LOG_TYPE_INFO, "[Custom Action]: Icon view edit action can be added to icon view.", buf, 2u);
      }

      if (-[SBIconViewAccessibility _axIsInControlCenter](self, "_axIsInControlCenter"))
        v15 = CFSTR("control.center.editing.%@");
      else
        v15 = CFSTR("jiggly.mode.%@");
      v16 = CFSTR("start");
      if (v5)
        v16 = CFSTR("end");
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      accessibilityLocalizedString(v17);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6788]), "initWithName:target:selector:", v13, self, sel__accessibilityToggleJigglyMode);
      objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setIgnoreWhenVoiceOverTouches:", objc_msgSend(v19, "voiceOverEditAppsActionEnabled") ^ 1);

      AXLogSpringboardServer();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        v21 = objc_msgSend(v18, "ignoreWhenVoiceOverTouches");
        v22 = &stru_250385500;
        if (v21)
          v22 = CFSTR(" not");
        *(_DWORD *)buf = 138412290;
        v24 = v22;
        _os_log_impl(&dword_232A63000, v20, OS_LOG_TYPE_INFO, "[Custom Action]: Icon edit action is%@ visible to VO.", buf, 0xCu);
      }

      objc_msgSend(v4, "addObject:", v18);
LABEL_29:

    }
  }

}

- (void)_accessibilityDropFromFolderAction:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  if (AXProcessIsSpringBoard())
  {
    AXSBIconControllerSharedInstance();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconViewAccessibility _axDragManager](self, "_axDragManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "_axIsIconDragging");

    if (v6)
    {
      AXSBHIconManagerFromSharedIconController();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "safeBoolForKey:", CFSTR("hasOpenFolder"));

      if (v8)
      {
        v9 = objc_alloc(MEMORY[0x24BDF6788]);
        accessibilityLocalizedString(CFSTR("move.app.out.of.folder.short"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)objc_msgSend(v9, "initWithName:target:selector:", v10, v4, sel__accessibilityCloseOpenFolder);

        accessibilityLocalizedString(CFSTR("move.app.out.of.folder.short"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "_setShortName:", v12);

        objc_msgSend(v13, "addObject:", v11);
      }
    }

  }
}

- (void)_accessibilityInDockActions:(id)a3
{
  uint64_t v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __CFString *v18;
  uint64_t v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;

  v39 = a3;
  v4 = objc_msgSend((id)*MEMORY[0x24BDF74F8], "userInterfaceLayoutDirection");
  objc_msgSend(MEMORY[0x24BE006F0], "server");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "canLaunchAsPinnedApplicationForIconView:", self);

  if (v6)
  {
    -[SBIconViewAccessibility accessibilityLabel](self, "accessibilityLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x24BDD17C8];
    if (v4 == 1)
    {
      accessibilityLocalizedString(CFSTR("app.launch.right"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", v9, v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = (void *)MEMORY[0x24BDD17C8];
      v12 = CFSTR("app.launch.right.short");
    }
    else
    {
      accessibilityLocalizedString(CFSTR("app.launch.left"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", v13, v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = (void *)MEMORY[0x24BDD17C8];
      v12 = CFSTR("app.launch.left.short");
    }
    accessibilityLocalizedString(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", v14, v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6788]), "initWithName:target:selector:", v10, self, sel__accessibilityLaunchLeading_);
    objc_msgSend(v16, "_setShortName:", v15);
    v17 = (void *)MEMORY[0x24BDD17C8];
    if (v4 == 1)
      v18 = CFSTR("app.launch.left");
    else
      v18 = CFSTR("app.launch.right");
    v19 = v4;
    if (v4 == 1)
      v20 = CFSTR("app.launch.left.short");
    else
      v20 = CFSTR("app.launch.right.short");
    accessibilityLocalizedString(v18);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", v21, v7);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = (void *)MEMORY[0x24BDD17C8];
    v24 = (__CFString *)v20;
    v4 = v19;
    accessibilityLocalizedString(v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "stringWithFormat:", v25, v7);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6788]), "initWithName:target:selector:", v22, self, sel__accessibilityLaunchTrailing_);
    objc_msgSend(v27, "_setShortName:", v26);
    if (v19 == 1)
    {
      _UIAccessibilityCustomActionLaunchAppPinRightImage();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setImage:", v28);

      _UIAccessibilityCustomActionLaunchAppPinLeftImage();
    }
    else
    {
      _UIAccessibilityCustomActionLaunchAppPinLeftImage();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setImage:", v29);

      _UIAccessibilityCustomActionLaunchAppPinRightImage();
    }
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setImage:", v30);

    objc_msgSend(v39, "addObject:", v16);
    objc_msgSend(v39, "addObject:", v27);

  }
  objc_msgSend(MEMORY[0x24BE006F0], "server");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "canLaunchAsFloatingApplicationForIconView:", self);

  if (v32)
  {
    accessibilityLocalizedString(CFSTR("app.launch.floating.trailing"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    accessibilityLocalizedString(CFSTR("app.launch.floating.trailing.short"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6788]), "initWithName:target:selector:", v33, self, sel__accessibilityLaunchFloatingTrailing_);
    objc_msgSend(v35, "_setShortName:", v34);
    _UIAccessibilityCustomActionLaunchAppFloatImage();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v36;
    if (v4 == 1)
    {
      objc_msgSend(v36, "imageWithHorizontallyFlippedOrientation");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setImage:", v38);

    }
    else
    {
      objc_msgSend(v35, "setImage:", v36);
    }
    objc_msgSend(v39, "addObject:", v35);

  }
}

- (void)_accessibilityAddTodayViewAction:(id)a3
{
  int IsSpringBoard;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  void *v11;
  id v12;

  v12 = a3;
  IsSpringBoard = AXProcessIsSpringBoard();
  v5 = v12;
  if (IsSpringBoard)
  {
    AXSBHIconManagerFromSharedIconController();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "safeBoolForKey:", CFSTR("isEditing")) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BE006F0], "server");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v7, "isShowingHomescreen"))
      {
LABEL_8:

        goto LABEL_9;
      }
      AXSBIconControllerSharedInstance();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "_axIsShowingHomeScreenTodayView"))
      {

        goto LABEL_8;
      }
      v9 = objc_msgSend(v6, "safeBoolForKey:", CFSTR("hasOpenFolder"));

      if ((v9 & 1) == 0)
      {
        v10 = objc_alloc(MEMORY[0x24BDF6788]);
        accessibilityLocalizedString(CFSTR("today.visible.key"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = (void *)objc_msgSend(v10, "initWithName:target:selector:", v11, self, sel__accessibilityShowTodayView);

        objc_msgSend(v7, "setIgnoreWhenVoiceOverTouches:", 1);
        objc_msgSend(v12, "addObject:", v7);
        goto LABEL_8;
      }
    }
LABEL_9:

    v5 = v12;
  }

}

- (void)_accessibilityAddAppLibraryViewAction:(id)a3
{
  int IsSpringBoard;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  void *v11;
  id v12;

  v12 = a3;
  IsSpringBoard = AXProcessIsSpringBoard();
  v5 = v12;
  if (IsSpringBoard)
  {
    AXSBHIconManagerFromSharedIconController();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "safeBoolForKey:", CFSTR("isEditing")) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BE006F0], "server");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v7, "isShowingHomescreen"))
      {
LABEL_8:

        goto LABEL_9;
      }
      AXSBIconControllerSharedInstance();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "_axIsShowingAppLibrary"))
      {

        goto LABEL_8;
      }
      v9 = objc_msgSend(v6, "safeBoolForKey:", CFSTR("hasOpenFolder"));

      if ((v9 & 1) == 0)
      {
        v10 = objc_alloc(MEMORY[0x24BDF6788]);
        accessibilityLocalizedString(CFSTR("app.library"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = (void *)objc_msgSend(v10, "initWithName:target:selector:", v11, self, sel__accessibilityShowAppLibrary);

        objc_msgSend(v7, "setIgnoreWhenVoiceOverTouches:", 1);
        objc_msgSend(v12, "addObject:", v7);
        goto LABEL_8;
      }
    }
LABEL_9:

    v5 = v12;
  }

}

- (void)_accessibilityAddControlsGalleryViewAction:(id)a3
{
  id v4;
  void *v5;
  char v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[5];

  v4 = a3;
  if (-[SBIconViewAccessibility _axIsInControlCenter](self, "_axIsInControlCenter"))
  {
    if (-[SBIconViewAccessibility _axIsIconEditing](self, "_axIsIconEditing"))
    {
      -[SBIconViewAccessibility _axDragManager](self, "_axDragManager");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "_axIsIconDragging");

      if ((v6 & 1) == 0)
      {
        v7 = objc_alloc(MEMORY[0x24BDF6788]);
        accessibilityLocalizedString(CFSTR("show.controls.gallery"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v10[0] = MEMORY[0x24BDAC760];
        v10[1] = 3221225472;
        v10[2] = __70__SBIconViewAccessibility__accessibilityAddControlsGalleryViewAction___block_invoke;
        v10[3] = &unk_250383F20;
        v10[4] = self;
        v9 = (void *)objc_msgSend(v7, "initWithName:actionHandler:", v8, v10);

        objc_msgSend(v4, "addObject:", v9);
      }
    }
  }

}

uint64_t __70__SBIconViewAccessibility__accessibilityAddControlsGalleryViewAction___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("_delegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(v4, "safeSwiftValueForKey:", CFSTR("addButton"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "sendActionsForControlEvents:", 64);
  return 1;
}

- (id)_axSortedSupportedGridSizeClasses
{
  id v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__8;
  v8 = __Block_byref_object_dispose__8;
  v9 = 0;
  AXPerformSafeBlock();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __60__SBIconViewAccessibility__axSortedSupportedGridSizeClasses__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "iconGridSizeClassSizes");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "supportedIconGridSizeClasses");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "gridSizeClassesSortedByGridAreaWithAllowedGridSizeClasses:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)_axStringForGridSizeClass:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  __int16 v11;

  v4 = a3;
  -[SBIconViewAccessibility _axIconToCCUIGridSize:](self, "_axIconToCCUIGridSize:", v4);
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  AXPerformSafeBlock();
  _Block_object_dispose(&v8, 8);
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  AXPerformSafeBlock();
  _Block_object_dispose(&v8, 8);
  accessibilityLocalizedString(CFSTR("control.size.dimensions"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  AXCFormattedString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __53__SBIconViewAccessibility__axStringForGridSizeClass___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = CCUINumberOfRowsForGridSizeClass();
  *(_WORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __53__SBIconViewAccessibility__axStringForGridSizeClass___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = CCUINumberOfColumnsForGridSizeClass();
  *(_WORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (void)_accessibilityResizeActions:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[6];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v16 = a3;
  if (-[SBIconViewAccessibility _axIsIconEditing](self, "_axIsIconEditing")
    && -[SBIconViewAccessibility _axIsInControlCenter](self, "_axIsInControlCenter")
    && -[SBIconViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isShowingResizeHandle")))
  {
    -[SBIconViewAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("icon.gridSizeClass"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconViewAccessibility _axSortedSupportedGridSizeClasses](self, "_axSortedSupportedGridSizeClasses");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v19;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v19 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v9);
          if (v10 != v4 && (objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v9), "isEqualToString:", v4) & 1) == 0)
          {
            accessibilityLocalizedString(CFSTR("control.resize"));
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            -[SBIconViewAccessibility _axStringForGridSizeClass:](self, "_axStringForGridSizeClass:", v10);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            AXCFormattedString();
            v12 = (void *)objc_claimAutoreleasedReturnValue();

            v13 = objc_alloc(MEMORY[0x24BDF6788]);
            v17[0] = MEMORY[0x24BDAC760];
            v17[1] = 3221225472;
            v17[2] = __55__SBIconViewAccessibility__accessibilityResizeActions___block_invoke;
            v17[3] = &unk_250383F70;
            v17[4] = self;
            v17[5] = v10;
            v14 = (void *)objc_msgSend(v13, "initWithName:actionHandler:", v12, v17, v15);
            objc_msgSend(v16, "addObject:", v14);

          }
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v7);
    }

  }
}

uint64_t __55__SBIconViewAccessibility__accessibilityResizeActions___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_accessibilityResizeControl:", *(_QWORD *)(a1 + 40));
  return 1;
}

- (BOOL)_accessibilityShowTodayView
{
  void *v2;

  AXSBIconControllerSharedInstance();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_axShowTodayView");

  return 1;
}

- (BOOL)_accessibilityShowAppLibrary
{
  void *v2;

  AXSBIconControllerSharedInstance();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_axShowAppLibrary");

  return 1;
}

- (BOOL)_accessibilityLaunchLeading:(id)a3
{
  return -[SBIconViewAccessibility _accessibilityLaunchAppWithRole:onLeadingSide:](self, "_accessibilityLaunchAppWithRole:onLeadingSide:", 2, 1);
}

- (BOOL)_accessibilityLaunchTrailing:(id)a3
{
  return -[SBIconViewAccessibility _accessibilityLaunchAppWithRole:onLeadingSide:](self, "_accessibilityLaunchAppWithRole:onLeadingSide:", 2, 0);
}

- (BOOL)_accessibilityLaunchFloatingTrailing:(id)a3
{
  return -[SBIconViewAccessibility _accessibilityLaunchAppWithRole:onLeadingSide:](self, "_accessibilityLaunchAppWithRole:onLeadingSide:", 3, 0);
}

- (BOOL)_accessibilityLaunchAppWithRole:(int64_t)a3 onLeadingSide:(BOOL)a4
{
  AXPerformSafeBlock();
  return 1;
}

void __73__SBIconViewAccessibility__accessibilityLaunchAppWithRole_onLeadingSide___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__8;
  v11 = __Block_byref_object_dispose__8;
  v12 = 0;
  v5 = MEMORY[0x24BDAC760];
  v6 = *(_QWORD *)(a1 + 32);
  AXPerformSafeBlock();
  v2 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  v3 = *(_QWORD *)(a1 + 40);
  switch(v3)
  {
    case 1:
      objc_msgSend(MEMORY[0x24BE006F0], "server", v5, 3221225472, __73__SBIconViewAccessibility__accessibilityLaunchAppWithRole_onLeadingSide___block_invoke_2, &unk_250383BC0, v6, &v7);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "launchApplication:", v2);
      goto LABEL_7;
    case 2:
      objc_msgSend(MEMORY[0x24BE006F0], "server", v5, 3221225472, __73__SBIconViewAccessibility__accessibilityLaunchAppWithRole_onLeadingSide___block_invoke_2, &unk_250383BC0, v6, &v7);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "launchPinnedApplication:onLeadingSide:", v2, *(unsigned __int8 *)(a1 + 48));
      goto LABEL_7;
    case 3:
      objc_msgSend(MEMORY[0x24BE006F0], "server", v5, 3221225472, __73__SBIconViewAccessibility__accessibilityLaunchAppWithRole_onLeadingSide___block_invoke_2, &unk_250383BC0, v6, &v7);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "launchFloatingApplication:", v2);
LABEL_7:

      break;
  }

}

void __73__SBIconViewAccessibility__accessibilityLaunchAppWithRole_onLeadingSide___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  AXSBApplicationControllerSharedInstance();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_accessibilityBundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applicationWithBundleIdentifier:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (BOOL)_accessibilitySupportsActivateAction
{
  return !-[SBIconViewAccessibility _accessibilityIsWidgetIconView](self, "_accessibilityIsWidgetIconView");
}

- (id)_accessibilitySupportGesturesAttributes
{
  void *v2;
  void *v3;
  _QWORD v5[2];
  _QWORD v6[2];
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v5[0] = CFSTR("AXSupportedGestureTypeKey");
  v5[1] = CFSTR("AXOrbGestureMode");
  v6[0] = &unk_25038F698;
  v6[1] = &unk_25038F6B0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_axIsIconEditing
{
  int IsSpringBoard;

  IsSpringBoard = AXProcessIsSpringBoard();
  if (IsSpringBoard)
    LOBYTE(IsSpringBoard) = -[SBIconViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isEditing"));
  return IsSpringBoard;
}

- (void)_accessibilityEditAmbientIcon
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  -[SBIconViewAccessibility _accessibilityFindAncestor:startWithSelf:](self, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_7, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_accessibilityViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "safeValueForKey:", CFSTR("delegate"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v4;
    v6 = v5;
    AXPerformSafeBlock();

  }
  else
  {
    objc_opt_class();
    -[SBIconViewAccessibility _accessibilityFindAncestor:startWithSelf:](self, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_681, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_accessibilityViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v6 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setEditing:", 1);
  }

}

uint64_t __56__SBIconViewAccessibility__accessibilityEditAmbientIcon__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  char isKindOfClass;

  objc_msgSend(a2, "_accessibilityViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("AMUIInfographViewController"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void __56__SBIconViewAccessibility__accessibilityEditAmbientIcon__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[5];

  objc_msgSend(*(id *)(a1 + 32), "createUnlockRequestForViewController:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setName:", CFSTR("AMUIInfographViewController"));
  accessibilityLocalizedString(CFSTR("UNLOCK_WIDGET_STACK_EDITING"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setUnlockDestination:", v3);

  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __56__SBIconViewAccessibility__accessibilityEditAmbientIcon__block_invoke_3;
  v6[3] = &unk_250383FC0;
  v6[4] = *(_QWORD *)(a1 + 48);
  objc_msgSend(v4, "requestUnlockForViewController:withRequest:completion:", v5, v2, v6);

}

uint64_t __56__SBIconViewAccessibility__accessibilityEditAmbientIcon__block_invoke_3(uint64_t a1, int a2)
{
  uint64_t result;

  if (a2)
    return AXPerformSafeBlock();
  return result;
}

uint64_t __56__SBIconViewAccessibility__accessibilityEditAmbientIcon__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentStackConfigurationCard");
}

uint64_t __56__SBIconViewAccessibility__accessibilityEditAmbientIcon__block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  char isKindOfClass;

  objc_msgSend(a2, "_accessibilityViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("CCUIPagingViewController"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)_accessibilityToggleJigglyMode
{
  int IsSpringBoard;

  IsSpringBoard = AXProcessIsSpringBoard();
  if (IsSpringBoard)
    AXPerformSafeBlock();
  return IsSpringBoard;
}

void __57__SBIconViewAccessibility__accessibilityToggleJigglyMode__block_invoke(uint64_t a1)
{
  int v2;
  id v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_axIsIconEditing");
  if (objc_msgSend(*(id *)(a1 + 32), "_axIsInControlCenter"))
  {
    objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("_delegate"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v4;
    AXPerformSafeBlock();

  }
  else
  {
    AXSBHIconManagerFromSharedIconController();
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setEditing:", v2 ^ 1u);
  }

  if (((objc_msgSend(*(id *)(a1 + 32), "_accessibilityIsWidgetIconView") ^ 1 | v2) & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "_accessibilityEditAmbientIcon");
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

uint64_t __57__SBIconViewAccessibility__accessibilityToggleJigglyMode__block_invoke_2(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_axDragManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancelAllDrags");

  return objc_msgSend(*(id *)(a1 + 40), "setEditing:", *(_BYTE *)(a1 + 48) == 0);
}

- (id)accessibilityDragSourceDescriptors
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v3 = -[SBIconViewAccessibility _axIsIconEditing](self, "_axIsIconEditing");
  -[SBIconViewAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("_iconLocation"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  getSBIconLocationAppLibrarySearch();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "containsString:", v5);

  if ((v6 & 1) == 0 && !v3)
    return MEMORY[0x24BDBD1A8];
  -[SBIconViewAccessibility _axDragManager](self, "_axDragManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_axGrabbedIcons");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    -[SBIconViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("icon"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "safeBoolForKey:", CFSTR("canBeAddedToMultiItemDrag"));

    if (!v10)
      return MEMORY[0x24BDBD1A8];
  }
  else
  {

  }
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("drag.start"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconViewAccessibility accessibilityLabel](self, "accessibilityLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_alloc(MEMORY[0x24BDF67B0]);
  objc_msgSend(v12, "bounds");
  UIRectGetCenter();
  v18 = (void *)objc_msgSend(v17, "initWithName:point:inView:", v16, v12);
  v20[0] = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (void)accessibilityElementDidBecomeFocused
{
  void *v2;

  v2 = (void *)dropIndicies;
  dropIndicies = 0;

}

- (id)accessibilityDropPointDescriptors
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  char v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  _BOOL4 v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  id v39;
  id v40;
  id v41;
  double MinX;
  double v43;
  double MinY;
  double v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  id v50;
  id v51;
  id v52;
  double MaxX;
  double v54;
  double MaxY;
  double v56;
  void *v57;
  int v58;
  uint64_t v59;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  _BOOL4 v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  id v75;
  void *v76;
  id v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  __CFString *v83;
  void *v84;
  void *v85;
  void *v86;
  id v87;
  id v88;
  void *v89;
  id v90;
  void *v91;
  void *v92;
  id v93;
  id v94;
  id v95;
  id v96;
  id v97;
  id v98;
  id v99;
  id v100;
  id v101;
  id v102;
  uint64_t v103;
  uint64_t *v104;
  uint64_t v105;
  uint64_t (*v106)(uint64_t, uint64_t);
  void (*v107)(uint64_t);
  id v108;
  _QWORD v109[2];
  _QWORD v110[4];
  CGRect v111;
  CGRect v112;
  CGRect v113;
  CGRect v114;

  v110[2] = *MEMORY[0x24BDAC8D0];
  if (AXProcessIsSpringBoard())
  {
    -[SBIconViewAccessibility _axIconManager](self, "_axIconManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconViewAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("_iconLocation"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("SBIconLocationFloatingDockSuggestions")) & 1) != 0
      || -[SBIconViewAccessibility _axIsInDock](self, "_axIsInDock")
      && (objc_msgSend(v3, "safeValueForKey:", CFSTR("effectiveDockListView")),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v7 = objc_msgSend(v6, "safeBoolForKey:", CFSTR("isFull")),
          v6,
          (v7 & 1) != 0))
    {
      v5 = (id)MEMORY[0x24BDBD1A8];
LABEL_35:

      return v5;
    }
    v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    -[SBIconViewAccessibility _axDragManager](self, "_axDragManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_axGrabbedIcons");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v10, "count"))
      goto LABEL_33;
    objc_msgSend(v10, "firstObject");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    __UIAccessibilityCastAsClass();
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v11, "superview");
    v89 = (void *)objc_claimAutoreleasedReturnValue();

    -[SBIconViewAccessibility _axRootList](self, "_axRootList");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "safeValueForKey:", CFSTR("displayedModel"));
    v103 = 0;
    v104 = &v103;
    v105 = 0x3032000000;
    v106 = __Block_byref_object_copy__8;
    v107 = __Block_byref_object_dispose__8;
    v108 = 0;
    v88 = (id)objc_claimAutoreleasedReturnValue();
    AXPerformSafeBlock();
    v90 = (id)v104[5];

    _Block_object_dispose(&v103, 8);
    -[SBIconViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("icon"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v11) = v92 == v12;

    if ((v11 & 1) != 0)
    {
      v5 = 0;
      v26 = 1;
      goto LABEL_32;
    }
    objc_msgSend(v92, "safeStringForKey:", CFSTR("gridSizeClass"));
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "safeStringForKey:", CFSTR("gridSizeClass"));
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconViewAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("_iconLocation"));
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    getSBIconLocationAppLibrary();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v86, "containsString:", v13);

    if (v14)
    {
      v15 = (void *)MEMORY[0x24BDD17C8];
      accessibilityLocalizedString(CFSTR("move.to.app.library"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBIconViewAccessibility _axDragManager](self, "_axDragManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "_axGrabbedIconsLabel");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBIconViewAccessibility accessibilityLabel](self, "accessibilityLabel");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringWithFormat:", v16, v18, v19);
      v87 = (id)objc_claimAutoreleasedReturnValue();

      if (UIAccessibilityIsSwitchControlRunning())
      {
        accessibilityLocalizedString(CFSTR("move.to.app.library.short"));
        v20 = objc_claimAutoreleasedReturnValue();

        v87 = (id)v20;
      }
      v21 = objc_alloc(MEMORY[0x24BDF67B0]);
      LOBYTE(v103) = 0;
      objc_opt_class();
      __UIAccessibilityCastAsClass();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if ((_BYTE)v103)
        abort();
      v23 = v22;
      objc_msgSend(v22, "frame");
      AX_CGRectGetCenter();
      v24 = (void *)objc_msgSend(v21, "initWithName:point:inView:", v87, v89);

      objc_msgSend(v8, "addObject:", v24);
      v25 = v8;
      v26 = 1;
    }
    else
    {
      objc_msgSend(v91, "safeValueForKey:", CFSTR("placeholderAssertions"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "allObjects");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "firstObject");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "safeValueForKey:", CFSTR("placeholderIcon"));
      v87 = (id)objc_claimAutoreleasedReturnValue();

      if (!v87)
        v87 = v92;
      v30 = (void *)dropIndicies;
      if (!dropIndicies)
      {
        v103 = 0;
        v104 = &v103;
        v105 = 0x2020000000;
        v106 = 0;
        v100 = v88;
        v101 = v87;
        v102 = v90;
        AXPerformSafeBlock();
        v82 = v104[3];

        _Block_object_dispose(&v103, 8);
        v103 = 0;
        v104 = &v103;
        v105 = 0x2020000000;
        v106 = 0;
        v97 = v100;
        v98 = v101;
        v99 = v102;
        AXPerformSafeBlock();
        v31 = v104[3];

        _Block_object_dispose(&v103, 8);
        v109[0] = CFSTR("beforeIndex");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v82);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v109[1] = CFSTR("afterIndex");
        v110[0] = v32;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v31);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v110[1] = v33;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v110, v109, 2);
        v34 = objc_claimAutoreleasedReturnValue();
        v35 = (void *)dropIndicies;
        dropIndicies = v34;

        v30 = (void *)dropIndicies;
      }
      objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("beforeIndex"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "unsignedIntegerValue");

      if (v37 != 0x7FFFFFFFFFFFFFFFLL)
      {
        -[SBIconViewAccessibility _axDropPointLabel:](self, "_axDropPointLabel:", 1);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v103 = 0;
        v104 = &v103;
        v105 = 0x3032000000;
        v106 = __Block_byref_object_copy__8;
        v107 = __Block_byref_object_dispose__8;
        v108 = 0;
        v96 = v88;
        AXPerformSafeBlock();
        v39 = (id)v104[5];

        _Block_object_dispose(&v103, 8);
        v103 = 0;
        v104 = &v103;
        v105 = 0x3032000000;
        v106 = __Block_byref_object_copy__8;
        v107 = __Block_byref_object_dispose__8;
        v108 = 0;
        v95 = v91;
        v40 = v39;
        AXPerformSafeBlock();
        v41 = (id)v104[5];

        _Block_object_dispose(&v103, 8);
        objc_msgSend(v41, "frame");
        MinX = CGRectGetMinX(v111);
        objc_msgSend(v41, "frame");
        AX_CGRectGetCenter();
        MinY = v43;
        if (-[SBIconViewAccessibility _axInAmbientPresentationMode](self, "_axInAmbientPresentationMode"))
        {
          objc_msgSend(v41, "frame");
          AX_CGRectGetCenter();
          MinX = v45;
          objc_msgSend(v41, "frame");
          MinY = CGRectGetMinY(v112);
        }
        v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF67B0]), "initWithName:point:inView:", v38, v89, MinX, MinY);
        objc_msgSend(v8, "addObject:", v46);

      }
      objc_msgSend((id)dropIndicies, "objectForKeyedSubscript:", CFSTR("afterIndex"));
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v47, "unsignedIntegerValue");

      if (v48 != 0x7FFFFFFFFFFFFFFFLL)
      {
        -[SBIconViewAccessibility _axDropPointLabel:](self, "_axDropPointLabel:", 0);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v103 = 0;
        v104 = &v103;
        v105 = 0x3032000000;
        v106 = __Block_byref_object_copy__8;
        v107 = __Block_byref_object_dispose__8;
        v108 = 0;
        v94 = v88;
        AXPerformSafeBlock();
        v50 = (id)v104[5];

        _Block_object_dispose(&v103, 8);
        v103 = 0;
        v104 = &v103;
        v105 = 0x3032000000;
        v106 = __Block_byref_object_copy__8;
        v107 = __Block_byref_object_dispose__8;
        v108 = 0;
        v93 = v91;
        v51 = v50;
        AXPerformSafeBlock();
        v52 = (id)v104[5];

        _Block_object_dispose(&v103, 8);
        objc_msgSend(v52, "frame");
        MaxX = CGRectGetMaxX(v113);
        objc_msgSend(v52, "frame");
        AX_CGRectGetCenter();
        MaxY = v54;
        if (-[SBIconViewAccessibility _axInAmbientPresentationMode](self, "_axInAmbientPresentationMode"))
        {
          objc_msgSend(v52, "frame");
          AX_CGRectGetCenter();
          MaxX = v56;
          objc_msgSend(v52, "frame");
          MaxY = CGRectGetMaxY(v114);
        }
        v57 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF67B0]), "initWithName:point:inView:", v49, v89, MaxX, MaxY);
        objc_msgSend(v8, "addObject:", v57);

      }
      v58 = objc_msgSend(v92, "safeBoolForKey:", CFSTR("isFolderIcon"));
      v59 = *MEMORY[0x24BEB0988];
      if (!objc_msgSend(v85, "isEqualToString:", *MEMORY[0x24BEB0988])
        || ((objc_msgSend(v84, "isEqualToString:", v59) ^ 1 | v58) & 1) != 0)
      {
        v26 = 0;
        goto LABEL_31;
      }
      objc_msgSend(v3, "safeValueForKey:", CFSTR("currentRootIconList"));
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v91 == v61;

      if (!v26)
        goto LABEL_31;
      -[SBIconViewAccessibility _axDragManager](self, "_axDragManager");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "_axGrabbedIconsLabel");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v63 = (void *)MEMORY[0x24BDD17C8];
      accessibilityLocalizedString(CFSTR("create.new.folder"));
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBIconViewAccessibility accessibilityLabel](self, "accessibilityLabel");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "stringWithFormat:", v64, v65, v24);
      v66 = (void *)objc_claimAutoreleasedReturnValue();

      if (-[SBIconViewAccessibility _accessibilityIsWidgetIconView](self, "_accessibilityIsWidgetIconView"))
      {
        v67 = -[SBIconViewAccessibility _accessibilityIsWidgetStackIconView](self, "_accessibilityIsWidgetStackIconView");
        v68 = (void *)MEMORY[0x24BDD17C8];
        if (v67)
        {
          accessibilityLocalizedString(CFSTR("add.to.stack"));
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "stringWithFormat:", v81, v24);
          v69 = objc_claimAutoreleasedReturnValue();
          v83 = CFSTR("add.to.stack.short");
        }
        else
        {
          accessibilityLocalizedString(CFSTR("create.new.widget.stack"));
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBIconViewAccessibility accessibilityLabel](self, "accessibilityLabel");
          v70 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "stringWithFormat:", v81, v70, v24);
          v69 = objc_claimAutoreleasedReturnValue();

          v83 = CFSTR("create.new.widget.stack.short");
          v66 = (void *)v70;
        }

        v66 = (void *)v69;
      }
      else
      {
        v83 = CFSTR("create.new.folder.short");
      }
      if (objc_msgSend(v90, "safeBoolForKey:", CFSTR("isFolderIcon")))
      {
        v71 = (void *)MEMORY[0x24BDD17C8];
        accessibilityLocalizedString(CFSTR("add.to.folder"));
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBIconViewAccessibility accessibilityLabel](self, "accessibilityLabel");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "stringWithFormat:", v72, v24, v73);
        v74 = objc_claimAutoreleasedReturnValue();

        v83 = CFSTR("add.to.folder.short");
        v66 = (void *)v74;
      }
      v75 = v66;
      v76 = v75;
      if (UIAccessibilityIsSwitchControlRunning())
      {
        accessibilityLocalizedString(v83);
        v76 = (void *)objc_claimAutoreleasedReturnValue();

      }
      v77 = objc_alloc(MEMORY[0x24BDF67B0]);
      LOBYTE(v103) = 0;
      objc_opt_class();
      __UIAccessibilityCastAsClass();
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      if ((_BYTE)v103)
        abort();
      v79 = v78;
      objc_msgSend(v78, "frame");
      AX_CGRectGetCenter();
      v80 = (void *)objc_msgSend(v77, "initWithName:point:inView:", v76, v89);

      objc_msgSend(v8, "addObject:", v80);
      v26 = 0;
    }

LABEL_31:
    v5 = v8;
LABEL_32:

    if (v26)
    {
LABEL_34:

      goto LABEL_35;
    }
LABEL_33:
    v5 = v8;
    goto LABEL_34;
  }
  v5 = (id)MEMORY[0x24BDBD1A8];
  return v5;
}

void __60__SBIconViewAccessibility_accessibilityDropPointDescriptors__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "safeValueForKey:", CFSTR("icon"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safeStringForKey:", CFSTR("nodeIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iconWithIdentifier:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

uint64_t __60__SBIconViewAccessibility_accessibilityDropPointDescriptors__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "bestGridCellIndexForInsertingIcon:maintainingPositionBeforeIcon:ignoringPlaceholders:gridCellInfoOptions:mutationOptions:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0, 0, 0);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = result;
  return result;
}

uint64_t __60__SBIconViewAccessibility_accessibilityDropPointDescriptors__block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "bestGridCellIndexForInsertingIcon:maintainingPositionAfterIcon:ignoringPlaceholders:gridCellInfoOptions:mutationOptions:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0, 0, 0);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = result;
  return result;
}

void __60__SBIconViewAccessibility_accessibilityDropPointDescriptors__block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "iconAtGridCellIndex:gridCellInfoOptions:", *(_QWORD *)(a1 + 48), 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __60__SBIconViewAccessibility_accessibilityDropPointDescriptors__block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "iconViewForIcon:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __60__SBIconViewAccessibility_accessibilityDropPointDescriptors__block_invoke_6(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "iconAtGridCellIndex:gridCellInfoOptions:", *(_QWORD *)(a1 + 48), 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __60__SBIconViewAccessibility_accessibilityDropPointDescriptors__block_invoke_7(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "iconViewForIcon:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_axDropPointLabel:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL4 IsSwitchControlRunning;
  __CFString *v6;
  __CFString *v7;
  _BOOL4 v8;
  const __CFString *v9;
  __CFString *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = a3;
  IsSwitchControlRunning = UIAccessibilityIsSwitchControlRunning();
  v6 = CFSTR("place.before.app");
  if (IsSwitchControlRunning)
    v6 = CFSTR("place.before.app.short");
  v7 = v6;
  v8 = UIAccessibilityIsSwitchControlRunning();
  v9 = CFSTR("place.after.app");
  if (v8)
    v9 = CFSTR("place.after.app.short");
  if (v3)
    v10 = v7;
  else
    v10 = (__CFString *)v9;
  accessibilityLocalizedString(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (UIAccessibilityIsSwitchControlRunning())
  {
    v12 = v11;
  }
  else
  {
    v13 = (void *)MEMORY[0x24BDD17C8];
    -[SBIconViewAccessibility _axDragManager](self, "_axDragManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_axGrabbedIconsLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconViewAccessibility accessibilityLabel](self, "accessibilityLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", v11, v15, v16);
    v12 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

- (CGPoint)_accessibilityAmbientModeDropPoint:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  double v18;
  uint64_t v19;
  double *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  CGPoint result;

  v3 = a3;
  -[SBIconViewAccessibility _axDragManager](self, "_axDragManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeCGPointForKey:", CFSTR("_accessibilityLastPausedLocation"));
  v6 = v5;
  v8 = v7;

  LOBYTE(v19) = 0;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "frame");
  UIRectGetCenter();
  v11 = v10;
  v13 = v12;
  v19 = 0;
  v20 = (double *)&v19;
  v21 = 0x3010000000;
  v23 = 0;
  v24 = 0;
  v22 = &unk_232A885F5;
  AXPerformSafeBlock();
  v14 = *((_QWORD *)v20 + 5);
  _Block_object_dispose(&v19, 8);
  v19 = 0;
  v20 = (double *)&v19;
  v21 = 0x3010000000;
  v23 = 0;
  v24 = 0;
  v22 = &unk_232A885F5;
  AXPerformSafeBlock();
  v15 = *((_QWORD *)v20 + 5);
  _Block_object_dispose(&v19, 8);
  if (v3)
  {
    if (v15 < v14 && v15 == v14 - 1)
      v13 = v8;
    else
      v6 = v11;
    if ((v15 >= v14 || v15 != v14 - 1) && v15 < v14 && v15 != v14 - 1)
    {
LABEL_14:
      v19 = 0;
      v20 = (double *)&v19;
      v21 = 0x3010000000;
      v23 = 0;
      v24 = 0;
      v22 = &unk_232A885F5;
      AXPerformSafeBlock();
      v13 = v20[5];
      _Block_object_dispose(&v19, 8);
LABEL_15:
      v6 = v11;
    }
  }
  else
  {
    v16 = v14 + 1;
    if (v15 <= v14 || v15 != v16)
    {
      if (v15 <= v14 || v15 == v16)
        goto LABEL_15;
      goto LABEL_14;
    }
    v13 = v8;
  }

  v17 = v6;
  v18 = v13;
  result.y = v18;
  result.x = v17;
  return result;
}

void __62__SBIconViewAccessibility__accessibilityAmbientModeDropPoint___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_axRootList");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "coordinateAtPoint:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  *(_QWORD *)(v3 + 32) = v2;
  *(_QWORD *)(v3 + 40) = v4;

}

void __62__SBIconViewAccessibility__accessibilityAmbientModeDropPoint___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_axRootList");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "coordinateAtPoint:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  *(_QWORD *)(v3 + 32) = v2;
  *(_QWORD *)(v3 + 40) = v4;

}

void __62__SBIconViewAccessibility__accessibilityAmbientModeDropPoint___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_axRootList");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "centerForIconCoordinate:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  *(_QWORD *)(v2 + 32) = v3;
  *(_QWORD *)(v2 + 40) = v4;

}

void __62__SBIconViewAccessibility__accessibilityAmbientModeDropPoint___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_axRootList");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "centerForIconCoordinate:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  *(_QWORD *)(v2 + 32) = v3;
  *(_QWORD *)(v2 + 40) = v4;

}

- (id)_accessibilityFilterInteractionLocationDescriptorsForVisible:(id)a3
{
  id v4;
  id v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  if (-[SBIconViewAccessibility _axInAmbientPresentationMode](self, "_axInAmbientPresentationMode")
    || -[SBIconViewAccessibility _axIsInControlCenter](self, "_axIsInControlCenter"))
  {
    v5 = v4;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBIconViewAccessibility;
    -[SBIconViewAccessibility _accessibilityFilterInteractionLocationDescriptorsForVisible:](&v8, sel__accessibilityFilterInteractionLocationDescriptorsForVisible_, v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (void)_accessibilityBeginDragAtPoint:(CGPoint)a3 endpoint:(id)a4 completion:(id)a5
{
  double y;
  double x;
  id v9;
  id v10;
  objc_super v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  SBIconViewAccessibility *v16;

  y = a3.y;
  x = a3.x;
  v12 = MEMORY[0x24BDAC760];
  v13 = 3221225472;
  v14 = __78__SBIconViewAccessibility__accessibilityBeginDragAtPoint_endpoint_completion___block_invoke;
  v15 = &unk_250383A68;
  v16 = self;
  v9 = a5;
  v10 = a4;
  AXPerformSafeBlock();
  v11.receiver = self;
  v11.super_class = (Class)SBIconViewAccessibility;
  -[SBIconViewAccessibility _accessibilityBeginDragAtPoint:endpoint:completion:](&v11, sel__accessibilityBeginDragAtPoint_endpoint_completion_, v10, v9, x, y);

  SBAXPerformingAXDrag = 1;
}

void __78__SBIconViewAccessibility__accessibilityBeginDragAtPoint_endpoint_completion___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_axDragManager");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "cancelAllDrags");

}

- (id)_accessibilityPreferredScrollActions
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  v2 = -[SBIconViewAccessibility _accessibilityIsRTL](self, "_accessibilityIsRTL");
  if (v2)
    v3 = 2009;
  else
    v3 = 2008;
  if (v2)
    v4 = 2008;
  else
    v4 = 2009;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)_accessibilityCanDrag
{
  void *v3;
  int v4;
  objc_super v6;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v6.receiver = self,
        v6.super_class = (Class)SBIconViewAccessibility,
        -[SBIconViewAccessibility _accessibilityCanDrag](&v6, sel__accessibilityCanDrag)))
  {
    -[SBIconViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("icon"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "safeBoolForKey:", CFSTR("isPlaceholder")) ^ 1;

  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (BOOL)_accessibilityUpdatesSwitchMenu
{
  return 1;
}

- (BOOL)_accessibilityShouldIncludeArrowKeyCommandsForDirectionalFocusMovement
{
  return 1;
}

- (BOOL)_axIsInDock
{
  void *v2;
  void *v3;
  _QWORD *v4;
  void *v5;
  char v6;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  -[SBIconViewAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("_iconLocation"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  getSBIconLocationDock();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqual:", v3) & 1) != 0)
    goto LABEL_6;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v4 = (_QWORD *)getSBIconLocationFloatingDockSymbolLoc_ptr;
  v11 = getSBIconLocationFloatingDockSymbolLoc_ptr;
  if (!getSBIconLocationFloatingDockSymbolLoc_ptr)
  {
    v5 = (void *)SpringBoardHomeLibrary_0();
    v4 = dlsym(v5, "SBIconLocationFloatingDock");
    v9[3] = (uint64_t)v4;
    getSBIconLocationFloatingDockSymbolLoc_ptr = (uint64_t)v4;
  }
  _Block_object_dispose(&v8, 8);
  if (!v4)
    -[SBIconViewAccessibility _axIsInDock].cold.1();
  if ((objc_msgSend(v2, "isEqualToString:", *v4, v8) & 1) != 0)
LABEL_6:
    v6 = 1;
  else
    v6 = objc_msgSend(v2, "isEqual:", CFSTR("SBIconLocationFloatingDockSuggestions"));

  return v6;
}

- (BOOL)_axInAmbientPresentationMode
{
  void *v2;
  void *v3;
  char v4;

  AXWindowScene(CFSTR("activeDisplayWindowScene"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("ambientPresentationController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "safeBoolForKey:", CFSTR("isPresented"));

  return v4;
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SBIconViewAccessibility;
  -[SBIconViewAccessibility contextMenuInteraction:configurationForMenuAtLocation:](&v12, sel_contextMenuInteraction_configurationForMenuAtLocation_, v7, x, y);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "window");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAccessibilityViewIsModal:", 1);

  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], (id)*MEMORY[0x24BDFEF50]);
  if (v8)
    AXContextMenuIsShowing = 1;

  return v8;
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  objc_super v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v13.receiver = self;
  v13.super_class = (Class)SBIconViewAccessibility;
  -[SBIconViewAccessibility contextMenuInteraction:willEndForConfiguration:animator:](&v13, sel_contextMenuInteraction_willEndForConfiguration_animator_, v8, v9, v10);
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "window");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAccessibilityViewIsModal:", 0);

  AXContextMenuIsShowing = 0;
}

- (id)_viewToAddFocusLayer
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  -[SBIconViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_iconImageView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_opt_class();
    -[SBIconViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("customIconImageViewController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "view");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)accessibilityPath
{
  SBIconViewAccessibility *v3;
  SBIconViewAccessibility *v4;
  SBIconViewAccessibility *v5;
  void *v6;

  if (-[SBIconViewAccessibility _accessibilityIsFKARunningForFocusItem](self, "_accessibilityIsFKARunningForFocusItem"))
  {
    -[SBIconViewAccessibility safeCGFloatForKey:](self, "safeCGFloatForKey:", CFSTR("iconImageCornerRadius"));
    -[SBIconViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_focusEffectPlatterView"));
    v3 = (SBIconViewAccessibility *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3
      || (-[SBIconViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_iconImageView")),
          v5 = (SBIconViewAccessibility *)objc_claimAutoreleasedReturnValue(),
          v4 = self,
          !v5))
    {
      v5 = v4;
    }
    -[SBIconViewAccessibility accessibilityFrame](v5, "accessibilityFrame");
    UIRectInsetEdges();
    objc_msgSend(MEMORY[0x24BDF6870], "bezierPathWithRoundedRect:cornerRadius:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)focusGroupIdentifier
{
  _BOOL4 v3;
  __CFString *v4;
  objc_super v6;

  if (-[SBIconViewAccessibility _accessibilityIsFKARunningForFocusItem](self, "_accessibilityIsFKARunningForFocusItem"))
  {
    v3 = -[SBIconViewAccessibility _axIsInDock](self, "_axIsInDock");
    v4 = CFSTR("SBIconView");
    if (v3)
      v4 = CFSTR("SBIconViewDock");
    return v4;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)SBIconViewAccessibility;
    -[SBIconViewAccessibility focusGroupIdentifier](&v6, sel_focusGroupIdentifier);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (int64_t)_insertionIndexOfFocusLayerInView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;

  -[SBIconViewAccessibility _viewToAddFocusLayer](self, "_viewToAddFocusLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_accessoryView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sublayers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "indexOfObject:", v7);

  return v8;
}

- (id)_accessibilityAddToDragSessionCustomAction
{
  objc_super v4;

  if (-[SBIconViewAccessibility _accessibilityIsDraggingWidget](self, "_accessibilityIsDraggingWidget"))
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)SBIconViewAccessibility;
  -[SBIconViewAccessibility _accessibilityAddToDragSessionCustomAction](&v4, sel__accessibilityAddToDragSessionCustomAction);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)_accessibilityIsDraggingWidget
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  AXSBIconControllerSharedInstance();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("iconDragManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = objc_msgSend(v4, "safeBoolForKey:", CFSTR("isTrackingWidgetIconDrags"));
  else
    v5 = 0;

  return v5;
}

- (id)_axDragManager
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = -[SBIconViewAccessibility _axIsInControlCenter](self, "_axIsInControlCenter");
  -[SBIconViewAccessibility _axIconController](self, "_axIconController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "safeSwiftValueForKey:", CFSTR("iconDragManager"));
  else
    objc_msgSend(v4, "safeValueForKey:", CFSTR("iconDragManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_axIconController
{
  void *v3;

  NSClassFromString(CFSTR("_SBHStackConfigurationIconView"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SBIconViewAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("_stackConfigurationViewController"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (-[SBIconViewAccessibility _axIsInControlCenter](self, "_axIsInControlCenter"))
      -[SBIconViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_delegate"));
    else
      AXSBIconControllerSharedInstance();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)_axIconManager
{
  if (-[SBIconViewAccessibility _axIsInControlCenter](self, "_axIsInControlCenter"))
    return 0;
  AXSBHIconManagerFromSharedIconController();
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_axFolderController
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = -[SBIconViewAccessibility _axIsInControlCenter](self, "_axIsInControlCenter");
  -[SBIconViewAccessibility _axIconController](self, "_axIconController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "safeSwiftValueForKey:", CFSTR("__rootFolderController"));
  else
    objc_msgSend(v4, "safeValueForKey:", CFSTR("_currentFolderController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)_axIconManagerHasOpenFolder
{
  void *v3;
  void *v4;
  const __CFString *v5;
  char v6;

  if (-[SBIconViewAccessibility _axIsInControlCenter](self, "_axIsInControlCenter"))
  {
    -[SBIconViewAccessibility _axFolderController](self, "_axFolderController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("isOpen");
  }
  else
  {
    AXSBHIconManagerFromSharedIconController();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("hasOpenFolder");
  }
  v6 = objc_msgSend(v3, "safeBoolForKey:", v5);

  return v6;
}

- (id)_axRootList
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  _QWORD *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  -[SBIconViewAccessibility _axIconManager](self, "_axIconManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SBIconViewAccessibility _axIconManagerHasOpenFolder](self, "_axIconManagerHasOpenFolder");
  -[SBIconViewAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("_iconLocation"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconViewAccessibility _axFolderController](self, "_axFolderController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v4)
  {
    v8 = CFSTR("currentIconListView");
  }
  else
  {
    v8 = CFSTR("currentRootIconList");
    v6 = v3;
  }
  objc_msgSend(v6, "safeValueForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v10 = (_QWORD *)getSBIconLocationTodayViewSymbolLoc_ptr;
  v18 = getSBIconLocationTodayViewSymbolLoc_ptr;
  if (!getSBIconLocationTodayViewSymbolLoc_ptr)
  {
    v11 = (void *)SpringBoardHomeLibrary_0();
    v10 = dlsym(v11, "SBIconLocationTodayView");
    v16[3] = (uint64_t)v10;
    getSBIconLocationTodayViewSymbolLoc_ptr = (uint64_t)v10;
  }
  _Block_object_dispose(&v15, 8);
  if (!v10)
    -[SBIconViewAccessibility _axRootList].cold.1();
  if (objc_msgSend(v5, "containsString:", *v10, v15))
  {
    objc_msgSend(v3, "safeValueForKeyPath:", CFSTR("_effectiveTodayViewController.listView"));
    v12 = objc_claimAutoreleasedReturnValue();
LABEL_11:
    v13 = (void *)v12;

    v9 = v13;
    goto LABEL_12;
  }
  if (-[SBIconViewAccessibility _axInAmbientPresentationMode](self, "_axInAmbientPresentationMode"))
  {
    -[SBIconViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_iconListView"));
    v12 = objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
LABEL_12:

  return v9;
}

- (BOOL)canBecomeFocused
{
  objc_super v4;

  if (-[SBIconViewAccessibility _accessibilityIsFKARunningForFocusItem](self, "_accessibilityIsFKARunningForFocusItem"))return -[SBIconViewAccessibility isAccessibilityElement](self, "isAccessibilityElement");
  v4.receiver = self;
  v4.super_class = (Class)SBIconViewAccessibility;
  return -[SBIconViewAccessibility canBecomeFocused](&v4, sel_canBecomeFocused);
}

- (void)_updateCustomIconImageViewControllerHitTesting
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBIconViewAccessibility;
  -[SBIconViewAccessibility _updateCustomIconImageViewControllerHitTesting](&v7, sel__updateCustomIconImageViewControllerHitTesting);
  if (-[SBIconViewAccessibility _accessibilityIsWidgetInAddWidgetSheet](self, "_accessibilityIsWidgetInAddWidgetSheet"))
    v3 = 0;
  else
    v3 = -[SBIconViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isCustomIconImageViewHitTestingDisabled"));
  objc_opt_class();
  -[SBIconViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("customIconImageViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityElementsHidden:", v3);

}

- (void)_createCloseBoxIfNecessary
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBIconViewAccessibility;
  -[SBIconViewAccessibility _createCloseBoxIfNecessary](&v3, sel__createCloseBoxIfNecessary);
  -[SBIconViewAccessibility _accessibilitySetupCloseBox](self, "_accessibilitySetupCloseBox");
}

- (void)_accessibilityIsWidgetInAddWidgetSheet
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getSBIconLocationAddWidgetSheet(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("SBIconViewAccessibility.m"), 31, CFSTR("%s"), OUTLINED_FUNCTION_0());

  __break(1u);
}

- (void)_axIsInDock
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getSBIconLocationFloatingDock(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("SBIconViewAccessibility.m"), 25, CFSTR("%s"), OUTLINED_FUNCTION_0());

  __break(1u);
}

- (void)_axRootList
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getSBIconLocationTodayView(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("SBIconViewAccessibility.m"), 28, CFSTR("%s"), OUTLINED_FUNCTION_0());

  __break(1u);
}

@end
