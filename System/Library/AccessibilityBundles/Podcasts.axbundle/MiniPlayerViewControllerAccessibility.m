@implementation MiniPlayerViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("NowPlayingUI.MiniPlayerViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NowPlayingUI.MiniPlayerViewController"), CFSTR("accessibilityNowPlayingItemTitleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NowPlayingUI.MiniPlayerViewController"), CFSTR("viewDidLoad"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NowPlayingUI.MiniPlayerViewController"), CFSTR("accessibilitySkipButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NowPlayingUI.MiniPlayerViewController"), CFSTR("accessibilityPlayPauseButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NowPlayingUI.MiniPlayerViewController"), CFSTR("accessibilityArtworkView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NowPlayingUI.MiniPlayerViewController"), CFSTR("accessibilityUpdateMetadata"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NowPlayingUI.MiniPlayerViewController"), CFSTR("accessibilityPlayerRequestController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MPRequestResponseController"), CFSTR("response"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MPCPlayerResponse"), CFSTR("tracklist"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MPCPlayerResponse"), CFSTR("state"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MPCPlayerResponseTracklist"), CFSTR("playingItem"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MPCPlayerResponseItem"), CFSTR("seekCommand"), "@", 0);
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("MPCPlayerSeekCommand"), CFSTR("preferredBackwardJumpIntervals"));
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("MPCPlayerSeekCommand"), CFSTR("preferredForwardJumpIntervals"));

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;
  _QWORD v17[5];
  _QWORD v18[5];
  char v19;

  v19 = 0;
  objc_opt_class();
  -[MiniPlayerViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityNowPlayingItemTitleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setAccessibilityRespondsToUserInteraction:", 1);
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[MiniPlayerViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityArtworkView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
    v8 = CFSTR("MiniPlayerArtworkVisible");
  else
    v8 = CFSTR("MiniPlayerArtworkNotVisible");
  objc_msgSend(v6, "setAccessibilityIdentifier:", v8);
  objc_msgSend(v4, "setAccessibilityIdentifier:", CFSTR("NowPlayingSongTitleBar"));
  -[MiniPlayerViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityPlayPauseButton"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setIsAccessibilityElement:", v5 != 0);
  objc_msgSend(v9, "setAccessibilityIdentifier:", CFSTR("MiniPlayerPlayPauseButton"));
  v10 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __83__MiniPlayerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v18[3] = &unk_2502FD078;
  v18[4] = self;
  objc_msgSend(v9, "_setAccessibilityLabelBlock:", v18);
  -[MiniPlayerViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilitySkipButton"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setIsAccessibilityElement:", v5 != 0);
  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __83__MiniPlayerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v17[3] = &unk_2502FD078;
  v17[4] = self;
  objc_msgSend(v11, "_setAccessibilityLabelBlock:", v17);
  objc_msgSend(v11, "setAccessibilityIdentifier:", CFSTR("FastForwardButton"));
  objc_msgSend(v11, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0]);
  v19 = 0;
  objc_opt_class();
  -[MiniPlayerViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("view"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
    abort();
  if (v5)
  {
    objc_msgSend(v13, "setAccessibilityContainerType:", 4);
    accessibilityLocalizedString(CFSTR("titlesView.hint"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setAccessibilityHint:", v14);

    objc_msgSend(v13, "setAccessibilityIdentifier:", CFSTR("MiniPlayerButton"));
  }
  else
  {
    objc_msgSend(v13, "setAccessibilityContainerType:", 0);
  }
  accessibilityLocalizedString(CFSTR("mini.player"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAccessibilityLabel:", v15);

  objc_msgSend(v13, "setAccessibilityIdentifier:", CFSTR("MiniPlayer"));
  v16.receiver = self;
  v16.super_class = (Class)MiniPlayerViewControllerAccessibility;
  -[MiniPlayerViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v16, sel__accessibilityLoadAccessibilityInformation);

}

id __83__MiniPlayerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x24BEDCDF0];
  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("accessibilityPlayerRequestController"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("response"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_accessibilityPlayPauseButtonString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __83__MiniPlayerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x24BEDCDF0];
  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("accessibilityPlayerRequestController"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("response"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_accessibilitySeekButtonStringInDirection:response:", 1, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MiniPlayerViewControllerAccessibility;
  -[MiniPlayerViewControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[MiniPlayerViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)accessibilityUpdateMetadata
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MiniPlayerViewControllerAccessibility;
  -[MiniPlayerViewControllerAccessibility accessibilityUpdateMetadata](&v3, sel_accessibilityUpdateMetadata);
  -[MiniPlayerViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
