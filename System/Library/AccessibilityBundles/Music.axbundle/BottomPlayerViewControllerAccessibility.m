@implementation BottomPlayerViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("Music.BottomPlayerViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Music.BottomPlayerViewController"), CFSTR("nowPlayingItemStackView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Music.BottomPlayerViewController"), CFSTR("nowPlayingItemRouteLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Music.BottomPlayerViewController"), CFSTR("nowPlayingItemTitleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("Music.BottomPlayerViewController"), CFSTR("nowPlayingItemLargeTextTitleLabel"), "Optional<UILabel>");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("Music.BottomPlayerViewController"), CFSTR("nowPlayingItemLargeTextMarqueeView"), "Optional<MPUMarqueeView>");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Music.BottomPlayerViewController"), CFSTR("viewDidLoad"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Music.BottomPlayerViewController"), CFSTR("skipButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Music.BottomPlayerViewController"), CFSTR("reverseButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Music.BottomPlayerViewController"), CFSTR("playPauseButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Music.BottomPlayerViewController"), CFSTR("artworkView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Music.BottomPlayerViewController"), CFSTR("accessibilityUpdateMetadata"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Music.BottomPlayerViewController"), CFSTR("accessibilityNowPlayingResponse"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MPCPlayerResponse"), CFSTR("tracklist"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MPCPlayerResponse"), CFSTR("state"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MPCPlayerResponseTracklist"), CFSTR("playingItem"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Music.BottomPlayerViewController"), CFSTR("setArtworkView:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("Music.NowPlayingShuffleButton"));
  objc_msgSend(v3, "validateClass:", CFSTR("Music.NowPlayingRepeatButton"));

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id *v15;
  void *v16;
  _BOOL8 v17;
  void *v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  objc_super v55;
  _QWORD v56[4];
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  _QWORD v65[4];
  id v66;
  _QWORD v67[4];
  id v68;
  _QWORD v69[4];
  id v70;
  _QWORD v71[4];
  id v72;
  id v73;
  char v74;

  objc_opt_class();
  -[BottomPlayerViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("nowPlayingItemStackView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  -[BottomPlayerViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("nowPlayingItemRouteLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  -[BottomPlayerViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("nowPlayingItemTitleLabel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  -[BottomPlayerViewControllerAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("nowPlayingItemLargeTextTitleLabel"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v74 = 0;
  objc_opt_class();
  -[BottomPlayerViewControllerAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("nowPlayingItemLargeTextMarqueeView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setIsAccessibilityElement:", objc_msgSend(v12, "isHidden") ^ 1);
  objc_msgSend(v10, "accessibilityLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAccessibilityLabel:", v14, CFSTR("__AXStringForVariablesSentinel"));

  objc_msgSend(v12, "setAccessibilityIdentifier:", CFSTR("MiniPlayerNowPlayingSongTitleMarquee"));
  objc_msgSend(v4, "setIsAccessibilityElement:", objc_msgSend(v8, "isHidden") ^ 1);
  if (objc_msgSend(v6, "_accessibilityViewIsVisible"))
  {
    v71[0] = MEMORY[0x24BDAC760];
    v71[1] = 3221225472;
    v71[2] = __85__BottomPlayerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
    v71[3] = &unk_2502C2948;
    v15 = &v72;
    v72 = v6;
    v73 = v8;
    objc_msgSend(v4, "_setAccessibilityLabelBlock:", v71);

  }
  else
  {
    v69[0] = MEMORY[0x24BDAC760];
    v69[1] = 3221225472;
    v69[2] = __85__BottomPlayerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
    v69[3] = &unk_2502C2520;
    v15 = &v70;
    v70 = v8;
    objc_msgSend(v4, "_setAccessibilityLabelBlock:", v69);
  }

  objc_msgSend(v8, "text");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = v8;
  if (v16)
  {
    v17 = 1;
  }
  else
  {
    objc_msgSend(v10, "text");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v18 != 0;

  }
  v52 = v10;
  v54 = v6;

  -[BottomPlayerViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("artworkView"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v17)
    v21 = CFSTR("MiniPlayerArtworkVisible");
  else
    v21 = CFSTR("MiniPlayerArtworkNotVisible");
  objc_msgSend(v19, "setAccessibilityIdentifier:", v21);
  v22 = *MEMORY[0x24BDF73B0];
  objc_msgSend(v20, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0]);
  v51 = v4;
  objc_msgSend(v4, "setAccessibilityIdentifier:", CFSTR("MiniPlayerNowPlayingSongTitleBar"));
  if ((objc_msgSend(v12, "isHidden") & 1) == 0)
  {
    objc_msgSend(v20, "frame");
    v24 = v23;
    objc_msgSend(v12, "frame");
    objc_msgSend(v12, "_accessibilitySetFrameExpansion:", 0.0, (v25 - v24) * -0.5);
  }
  v50 = v20;
  -[BottomPlayerViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityNowPlayingResponse"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = 0;
  objc_opt_class();
  -[BottomPlayerViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("reverseButton"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v74)
    goto LABEL_24;
  objc_msgSend(v28, "setIsAccessibilityElement:", objc_msgSend(v28, "isHidden") ^ 1);
  if ((objc_msgSend(MEMORY[0x24BEDCDF0], "accessibilityIsSeekEnabledInDirection:forResponse:", 2, v26) & 1) != 0)
    objc_msgSend(MEMORY[0x24BEDCDF0], "accessibilitySeekButtonStringInDirection:response:", 2, v26);
  else
    accessibilityMusicLocalizedString(CFSTR("button.prev.text"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setAccessibilityLabel:", v49);
  objc_msgSend(v28, "setAccessibilityIdentifier:", CFSTR("MiniPlayerPreviousTrack"));
  objc_msgSend(v28, "setAccessibilityTraits:", v22);
  -[BottomPlayerViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("playPauseButton"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setIsAccessibilityElement:", v17);
  v67[0] = MEMORY[0x24BDAC760];
  v67[1] = 3221225472;
  v67[2] = __85__BottomPlayerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3;
  v67[3] = &unk_2502C2520;
  v30 = v26;
  v68 = v30;
  objc_msgSend(v29, "_setAccessibilityLabelBlock:", v67);
  objc_msgSend(v29, "setAccessibilityIdentifier:", CFSTR("MiniPlayerPlayPauseButton"));
  -[BottomPlayerViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("skipButton"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setIsAccessibilityElement:", v17);
  if ((objc_msgSend(MEMORY[0x24BEDCDF0], "accessibilityIsSeekEnabledInDirection:forResponse:", 1, v30) & 1) != 0)
    objc_msgSend(MEMORY[0x24BEDCDF0], "accessibilitySeekButtonStringInDirection:response:", 1, v30);
  else
    accessibilityMusicLocalizedString(CFSTR("button.next.text"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v65[0] = MEMORY[0x24BDAC760];
  v65[1] = 3221225472;
  v65[2] = __85__BottomPlayerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_4;
  v65[3] = &unk_2502C2520;
  v33 = v32;
  v66 = v33;
  objc_msgSend(v31, "_setAccessibilityLabelBlock:", v65);
  objc_msgSend(v31, "setAccessibilityIdentifier:", CFSTR("MiniPlayerNextTrack"));
  objc_msgSend(v31, "setAccessibilityTraits:", v22);
  v74 = 0;
  objc_opt_class();
  -[BottomPlayerViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("view"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v74)
LABEL_24:
    abort();
  v48 = v33;
  if (v17)
  {
    objc_msgSend(v35, "setAccessibilityContainerType:", 4);
    accessibilityMusicLocalizedString(CFSTR("titlesView.hint"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setAccessibilityHint:", v36);

    objc_msgSend(v35, "setAccessibilityIdentifier:", CFSTR("MiniPlayerButton"));
  }
  else
  {
    objc_msgSend(v35, "setAccessibilityContainerType:", 0);
  }
  accessibilityMusicLocalizedString(CFSTR("mini.player"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setAccessibilityLabel:", v37);

  objc_msgSend(v35, "setAccessibilityIdentifier:", CFSTR("MiniPlayer"));
  objc_msgSend(v35, "_accessibilitySetShouldHitTestFallBackToNearestChild:", 1);
  objc_msgSend(v35, "_accessibilityFindSubviewDescendant:", &__block_literal_global_7);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setAccessibilityIdentifier:", CFSTR("MiniPlayerShuffle"));
  objc_msgSend(v35, "_accessibilityFindSubviewDescendant:", &__block_literal_global_264);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setAccessibilityIdentifier:", CFSTR("MiniPlayerRepeat"));
  v56[0] = MEMORY[0x24BDAC760];
  v56[1] = 3221225472;
  v56[2] = __85__BottomPlayerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_7;
  v56[3] = &unk_2502C29B0;
  v57 = v50;
  v58 = v51;
  v59 = v12;
  v60 = v38;
  v61 = v28;
  v62 = v29;
  v63 = v31;
  v64 = v39;
  v40 = v39;
  v41 = v31;
  v47 = v29;
  v42 = v28;
  v43 = v38;
  v44 = v12;
  v45 = v51;
  v46 = v50;
  objc_msgSend(v35, "_setAccessibilityElementsBlock:", v56);
  v55.receiver = self;
  v55.super_class = (Class)BottomPlayerViewControllerAccessibility;
  -[BottomPlayerViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v55, sel__accessibilityLoadAccessibilityInformation);

}

id __85__BottomPlayerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "accessibilityLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "accessibilityLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __85__BottomPlayerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "accessibilityLabel");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

uint64_t __85__BottomPlayerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x24BEDCDF0], "accessibilityPlayPauseStopButtonString:", *(_QWORD *)(a1 + 32));
}

id __85__BottomPlayerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_4(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

uint64_t __85__BottomPlayerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_5(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  MEMORY[0x234917228](CFSTR("Music.NowPlayingShuffleButton"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __85__BottomPlayerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_6(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  MEMORY[0x234917228](CFSTR("Music.NowPlayingRepeatButton"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __85__BottomPlayerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_7(_QWORD *a1)
{
  return objc_msgSend(MEMORY[0x24BDBCE30], "axArrayByIgnoringNilElementsWithCount:", 8, a1[4], a1[5], a1[6], a1[7], a1[8], a1[9], a1[10], a1[11]);
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BottomPlayerViewControllerAccessibility;
  -[BottomPlayerViewControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[BottomPlayerViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)accessibilityUpdateMetadata
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BottomPlayerViewControllerAccessibility;
  -[BottomPlayerViewControllerAccessibility accessibilityUpdateMetadata](&v3, sel_accessibilityUpdateMetadata);
  -[BottomPlayerViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)setArtworkView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;
  char v8;

  v4 = a3;
  if (v4)
  {
    -[BottomPlayerViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
  }
  else
  {
    v8 = 0;
    objc_opt_class();
    -[BottomPlayerViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("view"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setAccessibilityElements:", MEMORY[0x24BDBD1A8]);
  }
  v7.receiver = self;
  v7.super_class = (Class)BottomPlayerViewControllerAccessibility;
  -[BottomPlayerViewControllerAccessibility setArtworkView:](&v7, sel_setArtworkView_, v4);

}

@end
