@implementation BottomPlayerViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MusicApplication.BottomPlayerViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.BottomPlayerViewController"), CFSTR("nowPlayingItemStackView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.BottomPlayerViewController"), CFSTR("nowPlayingItemRouteLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.BottomPlayerViewController"), CFSTR("nowPlayingItemTitleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("MusicApplication.BottomPlayerViewController"), CFSTR("nowPlayingItemLargeTextTitleLabel"), "Optional<UILabel>");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("MusicApplication.BottomPlayerViewController"), CFSTR("nowPlayingItemLargeTextMarqueeView"), "Optional<MPUMarqueeView>");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.BottomPlayerViewController"), CFSTR("viewDidLoad"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.BottomPlayerViewController"), CFSTR("skipButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.BottomPlayerViewController"), CFSTR("reverseButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.BottomPlayerViewController"), CFSTR("playPauseButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.BottomPlayerViewController"), CFSTR("artworkView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.BottomPlayerViewController"), CFSTR("accessibilityUpdateMetadata"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.BottomPlayerViewController"), CFSTR("accessibilityNowPlayingResponse"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.BottomPlayerViewController"), CFSTR("sharedListeningParticipantsLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MPCPlayerResponse"), CFSTR("tracklist"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MPCPlayerResponse"), CFSTR("state"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MPCPlayerResponseTracklist"), CFSTR("playingItem"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.BottomPlayerViewController"), CFSTR("setArtworkView:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("MusicApplication.NowPlayingShuffleButton"));
  objc_msgSend(v3, "validateClass:", CFSTR("MusicApplication.NowPlayingRepeatButton"));

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
  void *v15;
  void *v16;
  id *v17;
  void *v18;
  _BOOL8 v19;
  void *v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  uint64_t v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  objc_super v58;
  _QWORD v59[4];
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  _QWORD v68[4];
  id v69;
  _QWORD v70[4];
  id v71;
  _QWORD v72[4];
  id v73;
  _QWORD v74[4];
  id v75;
  id v76;
  id v77;
  char v78;

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

  objc_opt_class();
  -[BottomPlayerViewControllerAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("nowPlayingItemLargeTextMarqueeView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v78 = 0;
  objc_opt_class();
  -[BottomPlayerViewControllerAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("sharedListeningParticipantsLabel"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setIsAccessibilityElement:", objc_msgSend(v12, "isHidden") ^ 1);
  objc_msgSend(v10, "accessibilityLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAccessibilityLabel:", v16, CFSTR("__AXStringForVariablesSentinel"));

  objc_msgSend(v12, "setAccessibilityIdentifier:", CFSTR("MiniPlayerNowPlayingSongTitleMarquee"));
  objc_msgSend(v4, "setIsAccessibilityElement:", objc_msgSend(v8, "isHidden") ^ 1);
  if (objc_msgSend(v6, "_accessibilityViewIsVisible"))
  {
    v74[0] = MEMORY[0x24BDAC760];
    v74[1] = 3221225472;
    v74[2] = __85__BottomPlayerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
    v74[3] = &unk_2502C9360;
    v17 = &v75;
    v75 = v14;
    v76 = v6;
    v77 = v8;
    objc_msgSend(v4, "_setAccessibilityLabelBlock:", v74);

  }
  else
  {
    v72[0] = MEMORY[0x24BDAC760];
    v72[1] = 3221225472;
    v72[2] = __85__BottomPlayerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
    v72[3] = &unk_2502C9388;
    v17 = &v73;
    v73 = v8;
    objc_msgSend(v4, "_setAccessibilityLabelBlock:", v72);
  }

  objc_msgSend(v8, "text");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = v10;
  if (v18)
  {
    v19 = 1;
  }
  else
  {
    objc_msgSend(v10, "text");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v20 != 0;

  }
  v54 = v14;
  v56 = v8;
  v57 = v6;

  -[BottomPlayerViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("artworkView"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v19)
    v23 = CFSTR("MiniPlayerArtworkVisible");
  else
    v23 = CFSTR("MiniPlayerArtworkNotVisible");
  objc_msgSend(v21, "setAccessibilityIdentifier:", v23);
  v24 = *MEMORY[0x24BDF73B0];
  objc_msgSend(v22, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0]);
  objc_msgSend(v4, "setAccessibilityIdentifier:", CFSTR("MiniPlayerNowPlayingSongTitleBar"));
  if ((objc_msgSend(v12, "isHidden") & 1) == 0)
  {
    objc_msgSend(v22, "frame");
    v26 = v25;
    objc_msgSend(v12, "frame");
    objc_msgSend(v12, "_accessibilitySetFrameExpansion:", 0.0, (v27 - v26) * -0.5);
  }
  v53 = v22;
  -[BottomPlayerViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityNowPlayingResponse"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = 0;
  objc_opt_class();
  -[BottomPlayerViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("reverseButton"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v78)
    goto LABEL_24;
  objc_msgSend(v30, "setIsAccessibilityElement:", objc_msgSend(v30, "isHidden") ^ 1);
  if ((objc_msgSend(MEMORY[0x24BEDCDF0], "accessibilityIsSeekEnabledInDirection:forResponse:", 2, v28) & 1) != 0)
    objc_msgSend(MEMORY[0x24BEDCDF0], "accessibilitySeekButtonStringInDirection:response:", 2, v28);
  else
    accessibilityMusicLocalizedString(CFSTR("button.prev.text"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setAccessibilityLabel:", v52);
  objc_msgSend(v30, "setAccessibilityIdentifier:", CFSTR("MiniPlayerPreviousTrack"));
  objc_msgSend(v30, "setAccessibilityTraits:", v24);
  -[BottomPlayerViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("playPauseButton"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setIsAccessibilityElement:", v19);
  v70[0] = MEMORY[0x24BDAC760];
  v70[1] = 3221225472;
  v70[2] = __85__BottomPlayerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3;
  v70[3] = &unk_2502C9388;
  v32 = v28;
  v71 = v32;
  objc_msgSend(v31, "_setAccessibilityLabelBlock:", v70);
  objc_msgSend(v31, "setAccessibilityIdentifier:", CFSTR("MiniPlayerPlayPauseButton"));
  -[BottomPlayerViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("skipButton"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setIsAccessibilityElement:", v19);
  v51 = v32;
  if ((objc_msgSend(MEMORY[0x24BEDCDF0], "accessibilityIsSeekEnabledInDirection:forResponse:", 1, v32) & 1) != 0)
    objc_msgSend(MEMORY[0x24BEDCDF0], "accessibilitySeekButtonStringInDirection:response:", 1, v32);
  else
    accessibilityMusicLocalizedString(CFSTR("button.next.text"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v4;
  v68[0] = MEMORY[0x24BDAC760];
  v68[1] = 3221225472;
  v68[2] = __85__BottomPlayerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_4;
  v68[3] = &unk_2502C9388;
  v50 = v34;
  v69 = v50;
  objc_msgSend(v33, "_setAccessibilityLabelBlock:", v68);
  objc_msgSend(v33, "setAccessibilityIdentifier:", CFSTR("MiniPlayerNextTrack"));
  objc_msgSend(v33, "setAccessibilityTraits:", v24);
  v78 = 0;
  objc_opt_class();
  -[BottomPlayerViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("view"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (v78)
LABEL_24:
    abort();
  if (v19)
  {
    objc_msgSend(v37, "setAccessibilityContainerType:", 4);
    accessibilityMusicLocalizedString(CFSTR("titlesView.hint"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setAccessibilityHint:", v38);

    objc_msgSend(v37, "setAccessibilityIdentifier:", CFSTR("MiniPlayerButton"));
  }
  else
  {
    objc_msgSend(v37, "setAccessibilityContainerType:", 0);
  }
  accessibilityMusicLocalizedString(CFSTR("mini.player"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setAccessibilityLabel:", v39);

  objc_msgSend(v37, "setAccessibilityIdentifier:", CFSTR("MiniPlayer"));
  objc_msgSend(v37, "_accessibilitySetShouldHitTestFallBackToNearestChild:", 1);
  objc_msgSend(v37, "_accessibilityFindSubviewDescendant:", &__block_literal_global_8);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setAccessibilityIdentifier:", CFSTR("MiniPlayerShuffle"));
  objc_msgSend(v37, "_accessibilityFindSubviewDescendant:", &__block_literal_global_266);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setAccessibilityIdentifier:", CFSTR("MiniPlayerRepeat"));
  v59[0] = MEMORY[0x24BDAC760];
  v59[1] = 3221225472;
  v59[2] = __85__BottomPlayerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_7;
  v59[3] = &unk_2502C93F0;
  v60 = v53;
  v61 = v35;
  v62 = v12;
  v63 = v40;
  v64 = v30;
  v65 = v31;
  v66 = v33;
  v67 = v41;
  v42 = v41;
  v43 = v33;
  v49 = v31;
  v44 = v30;
  v45 = v40;
  v46 = v12;
  v47 = v35;
  v48 = v53;
  objc_msgSend(v37, "_setAccessibilityElementsBlock:", v59);
  v58.receiver = self;
  v58.super_class = (Class)BottomPlayerViewControllerAccessibility;
  -[BottomPlayerViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v58, sel__accessibilityLoadAccessibilityInformation);

}

id __85__BottomPlayerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v6;

  objc_msgSend(a1[4], "accessibilityLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[6], "accessibilityLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
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
  MEMORY[0x234917594](CFSTR("MusicApplication.NowPlayingShuffleButton"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __85__BottomPlayerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_6(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  MEMORY[0x234917594](CFSTR("MusicApplication.NowPlayingRepeatButton"));
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
