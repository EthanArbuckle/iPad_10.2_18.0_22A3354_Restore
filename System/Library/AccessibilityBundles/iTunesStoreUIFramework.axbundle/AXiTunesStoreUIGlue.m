@implementation AXiTunesStoreUIGlue

+ (void)accessibilityInitializeBundle
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  if (!_Failover)
  {
    objc_msgSend(MEMORY[0x24BE00758], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global, &__block_literal_global_364, 0, &__block_literal_global_370);

    v4 = objc_msgSend(objc_allocWithZone((Class)AXiTunesStoreUIGlue), "init");
    v5 = (void *)_Failover;
    _Failover = v4;

    AXPerformBlockOnMainThreadAfterDelay();
  }
  if (objc_msgSend((id)*MEMORY[0x24BDF74F8], "_accessibilityBoolValueForKey:", CFSTR("_accessibilityWebKitLoaded")))
  {
    objc_msgSend(a1, "_webKitInitialized");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", a1, sel__webKitInitialized, CFSTR("UIApplicationLoadedWebKit"), 0);

  }
}

uint64_t __52__AXiTunesStoreUIGlue_accessibilityInitializeBundle__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "validateClass:", CFSTR("SUBannerCellConfiguration"));
  objc_msgSend(v2, "validateClass:", CFSTR("SUCompletionCellConfiguration"));
  objc_msgSend(v2, "validateClass:", CFSTR("SUTableCell"));
  objc_msgSend(v2, "validateClass:", CFSTR("SUMaskedView"));
  objc_msgSend(v2, "validateClass:", CFSTR("SUTableCellContentView"));
  objc_msgSend(v2, "validateClass:", CFSTR("SUItemOfferButton"));
  objc_msgSend(v2, "validateClass:", CFSTR("SUStorePageViewController"));
  objc_msgSend(v2, "validateClass:", CFSTR("SUCellConfigurationCache"));
  objc_msgSend(v2, "validateClass:", CFSTR("SUTermsAndConditionsView"));
  objc_msgSend(v2, "validateClass:", CFSTR("SULinkControl"));
  objc_msgSend(v2, "validateClass:", CFSTR("SUReviewsButton"));
  objc_msgSend(v2, "validateClass:", CFSTR("SUReviewCellConfiguration"));
  objc_msgSend(v2, "validateClass:", CFSTR("SUReviewsHeaderCellConfiguration"));
  objc_msgSend(v2, "validateClass:", CFSTR("SULoadMoreCellConfiguration"));
  objc_msgSend(v2, "validateClass:", CFSTR("SUTextContentView"));
  objc_msgSend(v2, "validateClass:", CFSTR("SUPlaceholderViewController"));
  objc_msgSend(v2, "validateClass:", CFSTR("SUViewController"));
  objc_msgSend(v2, "validateClass:", CFSTR("SUItem"));
  objc_msgSend(v2, "validateClass:", CFSTR("SUItemCellConfiguration"));
  objc_msgSend(v2, "validateClass:", CFSTR("SUOverlayBackgroundViewController"));
  objc_msgSend(v2, "validateClass:", CFSTR("SUSubtitledButton"));
  objc_msgSend(v2, "validateClass:", CFSTR("SUNavigationButton"));
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", CFSTR("SUStoreController"), CFSTR("sharedInstance"), "@", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", CFSTR("SUClientController"), CFSTR("sharedController"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ISUDownload"), CFSTR("title"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ISUDownload"), CFSTR("artistName"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUTouchCaptureView"), CFSTR("passThroughViews"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUTableHeaderView"), CFSTR("subtitle"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUTableHeaderView"), CFSTR("title"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUStoreController"), CFSTR("storeContentLanguage"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUStorePageViewController"), CFSTR("reloadForSectionsWithGroup:"), "B", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUItemOfferButton"), CFSTR("_reloadButton"), "v", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUArrayCellConfiguration"), CFSTR("_accessibilityStringsArrayPointer"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUCellConfigurationCache"), CFSTR("configurationForRow:"), "@", "Q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUTermsAndConditionsView"), CFSTR("_termsAndConditionsControl"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUItemOfferButton"), CFSTR("itemOfferButtonStyle"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUTextContentView"), CFSTR("placeholder"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUDeferredUISegmentedControl"), CFSTR("_commitDeferredInterfaceUpdates"), "v", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUStorePageViewController"), CFSTR("_handleViewControllerBecameReady:"), "v", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIScrollView"), CFSTR("setTopExtensionViewColor:"), "v", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUComposeTextFieldConfiguration"), CFSTR("label"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUItem"), CFSTR("reviewStatistics"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUItemReviewStatistics"), CFSTR("numberOfUserRatings"), "q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUItemReviewStatistics"), CFSTR("averageUserRating"), "f", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUItem"), CFSTR("contentRating"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUItemContentRating"), CFSTR("isExplicitContent"), "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UITableView"), CFSTR("_accessibilityUIScrollViewScrollStatus"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UITableView"), CFSTR("_accessibilityHeaderElement"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUClientController"), CFSTR("rootViewController"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUTabBarController"), CFSTR("overlayBackgroundViewController"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUSubtitledButton"), CFSTR("currentSubtitle"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SSDownload"), CFSTR("status"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SSDownloadStatus"), CFSTR("isFailed"), "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SSDownloadStatus"), CFSTR("isPaused"), "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUTableCell"), CFSTR("showHighlight"), "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUStorePageViewController"), CFSTR("_setActiveChildViewController: shouldTearDown:"), "v", "@", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUScriptNotificationObserver"), CFSTR("init"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUScriptNotificationObserver"), CFSTR("_accessibilityPerformScrollUp"), "v", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUScriptNotificationObserver"), CFSTR("_accessibilityPerformScrollDown"), "v", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUScriptNotificationObserver"), CFSTR("_accessibilityPerformScrollLeft"), "v", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUScriptNotificationObserver"), CFSTR("_accessibilityPerformScrollRight"), "v", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUScriptNotificationObserver"), CFSTR("_accessibilityPerformEscape"), "v", 0);
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("SUStorePageViewController"), CFSTR("_segmentedControl"), "SUSegmentedControl");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("SUItemCellConfiguration"), CFSTR("_representedObject"), "@");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("SUCellConfiguration"), CFSTR("_representedObject"), "@");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("SUTableCell"), CFSTR("_configurationView"), "SUTableCellContentView");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("SUTableCellContentView"), CFSTR("_configuration"), "SUCellConfiguration");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("SUCellConfigurationCache"), CFSTR("_configurations"), "NSMutableArray");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("SULinkControl"), CFSTR("_label"), "UILabel");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("SUReviewsButton"), CFSTR("_userRating"), "f");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("SUStorePageViewController"), CFSTR("_activeChildViewController"), "SUViewController");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("SUOverlayBackgroundViewController"), CFSTR("_viewControllers"), "NSMutableArray");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("SUOverlayBackgroundViewController"), CFSTR("_selectedViewControllerIndex"), "q");

  return 1;
}

uint64_t __52__AXiTunesStoreUIGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("iTunes Store UI AX Bundle"));
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("iTunes Store UI"));

  return AXPerformValidationChecks();
}

void __52__AXiTunesStoreUIGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SUTableCellContentViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SUItemOfferButtonAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SUTableCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SUCellConfigurationAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SUCompletionCellConfigurationAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SUTouchCaptureViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SUCellConfigurationCacheAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SUBannerCellConfigurationAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SUBannerCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SUStructuredPageViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SUTermsAndConditionsViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SUReviewsButtonAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SUApplicationAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SUStorePageViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SUReviewCellConfigurationAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SUReviewsHeaderCellConfigurationAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SULoadMoreCellConfigurationAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SUTextContentViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SUTableHeaderViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SUDeferredUISegmentedControlAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SUUIScrollViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SUShortLinkCellConfigurationAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SUTallLinkCellConfigurationAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SUThreeLineTrackCellConfigurationAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SULoadMoreMediaCellConfigurationAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SUItemCellConfigurationAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SUMaskedViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SUTwoLineTrackCellConfigurationAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SUTableViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SUButtonCellConfigurationAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SUSubtitledButtonAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SUNavigationButtonAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SUScriptNotificationObserverAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SURedeemCameraViewControllerAccessibility"), 1);

}

+ (void)_webKitInitialized
{
  AXPerformBlockAsynchronouslyOnMainThread();
}

void __41__AXiTunesStoreUIGlue__webKitInitialized__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x24BE00758], "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global_448, &__block_literal_global_455, 0, &__block_literal_global_460);

}

uint64_t __41__AXiTunesStoreUIGlue__webKitInitialized__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUWebViewController"), CFSTR("_removePlaceholderBackgroundView"), "v", 0);
  objc_msgSend(v2, "validateClass:", CFSTR("SUWebView"));

  return 1;
}

uint64_t __41__AXiTunesStoreUIGlue__webKitInitialized__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("iTunesStoreUI Web Framework AX Bundle"));
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("iTunesStoreUI - Web"));

  return AXPerformValidationChecks();
}

void __41__AXiTunesStoreUIGlue__webKitInitialized__block_invoke_4(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SUWebViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SUWebViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SUUIWebDocumentViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SUiBooksOverrideWebViewAccessibility"), 1);

}

@end
