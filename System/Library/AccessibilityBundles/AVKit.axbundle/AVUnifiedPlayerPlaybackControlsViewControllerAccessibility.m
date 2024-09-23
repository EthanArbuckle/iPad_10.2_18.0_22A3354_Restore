@implementation AVUnifiedPlayerPlaybackControlsViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AVUnifiedPlayerPlaybackControlsViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVNowPlayingPlaybackControlsViewController"), CFSTR("_playbackMetadataViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("AVUnifiedPlayerPlaybackMetadataViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVNowPlayingPlaybackControlsViewController"), CFSTR("overlayViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVxOverlayViewController"), CFSTR("collectionViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("AVxCollectionViewController"), CFSTR("UICollectionViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("AVNowPlayingPlaybackControlsViewController"), CFSTR("_transportBar"), "UIView<AVTransportControlsProviding>");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("AVNowPlayingPlaybackControlsViewController"), CFSTR("_infoPanelViewController"), "AVInfoPanelViewController");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVInfoMenuController"), CFSTR("collectionView"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AVUnifiedPlayerPlaybackControlsViewControllerAccessibility;
  -[AVUnifiedPlayerPlaybackControlsViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v7, sel__accessibilityLoadAccessibilityInformation);
  objc_initWeak(&location, self);
  -[AVUnifiedPlayerPlaybackControlsViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("view"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __104__AVUnifiedPlayerPlaybackControlsViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v4[3] = &unk_250141368;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "_setAccessibilityElementsBlock:", v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

id __104__AVUnifiedPlayerPlaybackControlsViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "safeValueForKeyPath:", CFSTR("_playbackMetadataViewController.view"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeArrayForKey:", CFSTR("subviews"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "axSafelyAddObjectsFromArray:", v4);

  objc_msgSend(WeakRetained, "safeValueForKeyPath:", CFSTR("_overlayViewController.collectionViewController.collectionView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "axSafelyAddObject:", v5);

  objc_msgSend(WeakRetained, "safeValueForKey:", CFSTR("_transportBar"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "axSafelyAddObject:", v6);

  objc_msgSend(WeakRetained, "safeValueForKeyPath:", CFSTR("_infoPanelViewController._tabBarController.collectionView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "axSafelyAddObject:", v7);

  return v2;
}

@end
