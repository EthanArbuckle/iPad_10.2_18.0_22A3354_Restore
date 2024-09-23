@implementation PUScrubberViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PUScrubberView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("PUFilmstripTileViewController"), CFSTR("PUImageTileViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUScrubberView"), CFSTR("_tilingView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUScrubberView"), CFSTR("browsingSession"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PUScrubberView"), CFSTR("_transitionLayoutIdentifier"), "NSString");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUScrubberView"), CFSTR("_endScrubbing"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUScrubberView"), CFSTR("_updateScrollPositionAnimated:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUViewModel"), CFSTR("performChanges:"), "v", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUAssetViewModel"), CFSTR("videoPlayer"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUBrowsingViewModel"), CFSTR("setCurrentAssetReference:transitionProgress:transitionDriverIdentifier:animated:"), "v", "@", "d", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUBrowsingViewModel"), CFSTR("assetViewModelForAssetReference:"), "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUBrowsingViewModel"), CFSTR("currentAssetReference"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUBrowsingViewModel"), CFSTR("assetsDataSource"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUBrowsingViewModel"), CFSTR("leadingAssetReference"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUBrowsingViewModel"), CFSTR("trailingAssetReference"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUTilingView"), CFSTR("enumerateAllTileControllersUsingBlock:"), "v", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUTilingView"), CFSTR("layout"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUTilingView"), CFSTR("presentedTileControllerWithIndexPath: kind: dataSourceIdentifier:"), "@", "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUScrubberTilingLayout"), CFSTR("slitAspectRatio"), "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUTileLayoutInfo"), CFSTR("tileKind"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUTileLayoutInfo"), CFSTR("dataSourceIdentifier"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUTileLayoutInfo"), CFSTR("indexPath"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUAssetReference"), CFSTR("asset"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUAssetReference"), CFSTR("indexPath"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUBrowsingVideoPlayer"), CFSTR("videoSession"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXVideoSession"), CFSTR("currentTime"), "{?=qiIq}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXVideoSession"), CFSTR("videoDuration"), "{?=qiIq}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUBrowsingVideoPlayer"), CFSTR("isActivated"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUImageTileViewController"), CFSTR("asset"), "@", 0);
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("PUDisplayAsset"), CFSTR("mediaSubtypes"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("PUScrubberView"), CFSTR("UIView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIView"), CFSTR("canBecomeFocused"), "B", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  uint64_t v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  if (-[PUScrubberViewAccessibility _axIsVideoPlayerActivated](self, "_axIsVideoPlayerActivated"))
  {
    -[PUScrubberViewAccessibility _axVideoPlayer](self, "_axVideoPlayer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "safeIntegerForKey:", CFSTR("desiredPlayState"));

    v5 = CFSTR("scrubber.playing");
    if (v4 == 2)
      v5 = CFSTR("scrubber.paused");
    v6 = v5;
    accessibilityPULocalizedString(CFSTR("video.playbackcontrol.label"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    accessibilityPULocalizedString(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    __UIAXStringForVariables();
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PUScrubberViewAccessibility _axShowingType](self, "_axShowingType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x24BDD17C8];
    accessibilityPULocalizedString(CFSTR("photo.scrubber.label.format"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", v8, v7);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)v9;

  return v11;
}

- (id)accessibilityHint
{
  __CFString *v3;
  void *v4;
  int v5;
  void *v6;
  objc_super v8;

  if (-[PUScrubberViewAccessibility _axIsVideoPlayerActivated](self, "_axIsVideoPlayerActivated"))
  {
    v3 = CFSTR("video.playbackcontrol.hint.expanded");
  }
  else
  {
    -[PUScrubberViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AXIsVideoOnlyScrubber"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLValue");

    if (!v5)
    {
      v8.receiver = self;
      v8.super_class = (Class)PUScrubberViewAccessibility;
      -[PUScrubberViewAccessibility accessibilityHint](&v8, sel_accessibilityHint);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      return v6;
    }
    v3 = CFSTR("video.playbackcontrol.hint.collapsed");
  }
  accessibilityPULocalizedString(v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  return v6;
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  void *v5;

  if (-[PUScrubberViewAccessibility _axIsVideoPlayerActivated](self, "_axIsVideoPlayerActivated"))
  {
    -[PUScrubberViewAccessibility _axVideoPlaybackValue](self, "_axVideoPlaybackValue");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PUScrubberViewAccessibility _axShowingType](self, "_axShowingType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUScrubberViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("browsingSession"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    AXScrollStatusForBrowsingSession(v5, v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (unint64_t)accessibilityTraits
{
  id v3;
  objc_super v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PUScrubberViewAccessibility;
  v3 = -[PUScrubberViewAccessibility accessibilityTraits](&v6, sel_accessibilityTraits);
  if (!-[PUScrubberViewAccessibility _axIsVideoPlayerActivated](self, "_axIsVideoPlayerActivated"))
  {
    v5.receiver = self;
    v5.super_class = (Class)PUScrubberViewAccessibility;
    return *MEMORY[0x24BDF73A0] | -[PUScrubberViewAccessibility accessibilityTraits](&v5, sel_accessibilityTraits);
  }
  return (unint64_t)v3;
}

- (id)accessibilityCustomActions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  if (!-[PUScrubberViewAccessibility _axIsVideoPlayerActivated](self, "_axIsVideoPlayerActivated"))
    return 0;
  v3 = objc_alloc(MEMORY[0x24BDF6788]);
  accessibilityPULocalizedString(CFSTR("video.playbackcontrol.closeAction.name"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:target:selector:", v4, self, sel__axCloseVideoPlaybackAction);

  v8[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)accessibilityIncrement
{
  void *v3;
  void *v4;
  id v5;

  -[PUScrubberViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("browsingSession"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("viewModel"));
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "safeValueForKey:", CFSTR("trailingAssetReference"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUScrubberViewAccessibility _axScrollToAssetReference:inViewModel:forThreeFingerScroll:](self, "_axScrollToAssetReference:inViewModel:forThreeFingerScroll:", v4, v5, 0);

}

- (void)accessibilityDecrement
{
  void *v3;
  void *v4;
  id v5;

  -[PUScrubberViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("browsingSession"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("viewModel"));
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "safeValueForKey:", CFSTR("leadingAssetReference"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUScrubberViewAccessibility _axScrollToAssetReference:inViewModel:forThreeFingerScroll:](self, "_axScrollToAssetReference:inViewModel:forThreeFingerScroll:", v4, v5, 0);

}

- (BOOL)_axIncrementForThreeFingerScroll
{
  void *v3;
  void *v4;
  void *v5;

  -[PUScrubberViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("browsingSession"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("viewModel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "safeValueForKey:", CFSTR("trailingAssetReference"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    -[PUScrubberViewAccessibility _axScrollToAssetReference:inViewModel:forThreeFingerScroll:](self, "_axScrollToAssetReference:inViewModel:forThreeFingerScroll:", v5, v4, 1);

  return v5 != 0;
}

- (BOOL)_axDecrementForThreeFingerScroll
{
  void *v3;
  void *v4;
  void *v5;

  -[PUScrubberViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("browsingSession"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("viewModel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "safeValueForKey:", CFSTR("leadingAssetReference"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    -[PUScrubberViewAccessibility _axScrollToAssetReference:inViewModel:forThreeFingerScroll:](self, "_axScrollToAssetReference:inViewModel:forThreeFingerScroll:", v5, v4, 1);

  return v5 != 0;
}

- (void)_axCloseVideoPlaybackAction
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void (**v7)(_QWORD, _QWORD);
  void *v8;
  id v9;
  void (**v10)(_QWORD, _QWORD);
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  PUScrubberViewAccessibility *v15;

  -[PUScrubberViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("browsingSession"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("viewModel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "safeValueForKey:", CFSTR("leadingAssetReference"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5
    || (objc_msgSend(v4, "safeValueForKey:", CFSTR("trailingAssetReference")),
        (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __58__PUScrubberViewAccessibility__axCloseVideoPlaybackAction__block_invoke;
    v13[3] = &unk_24FF15650;
    v6 = v4;
    v14 = v6;
    v15 = self;
    v7 = (void (**)(_QWORD, _QWORD))MEMORY[0x2348C1EC0](v13);
    objc_msgSend(v6, "safeValueForKey:", CFSTR("_currentAssetReference"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v7)[2](v7, v5);
    v11 = v8;
    v12 = v7;
    v9 = v8;
    v10 = v7;
    AXPerformBlockOnMainThreadAfterDelay();

  }
}

void __58__PUScrubberViewAccessibility__axCloseVideoPlaybackAction__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;

  v3 = a2;
  v5 = *(id *)(a1 + 32);
  v4 = v3;
  AXPerformSafeBlock();

}

void __58__PUScrubberViewAccessibility__axCloseVideoPlaybackAction__block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;
  uint64_t v8;

  v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __58__PUScrubberViewAccessibility__axCloseVideoPlaybackAction__block_invoke_3;
  v5[3] = &unk_24FF15330;
  v6 = v2;
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v7 = v3;
  v8 = v4;
  objc_msgSend(v6, "performChanges:", v5);

}

void __58__PUScrubberViewAccessibility__axCloseVideoPlaybackAction__block_invoke_3(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "safeValueForKey:", CFSTR("_scrubbingIdentifier"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setCurrentAssetReference:transitionProgress:transitionDriverIdentifier:animated:", v2, v3, 1, 0.0);

}

uint64_t __58__PUScrubberViewAccessibility__axCloseVideoPlaybackAction__block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)_axScrollToAssetReference:(id)a3 inViewModel:(id)a4 forThreeFingerScroll:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  UIAccessibilityNotifications *v15;
  void *v16;
  id v17;
  id v18;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8 && v9)
  {
    v17 = v9;
    v18 = v8;
    AXPerformSafeBlock();
    objc_msgSend(v18, "safeValueForKey:", CFSTR("asset"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUScrubberViewAccessibility accessibilityValue](self, "accessibilityValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "accessibilityLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "accessibilityValue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (UIAccessibilityNotifications *)MEMORY[0x24BDF72E0];
    if (!v5)
      v15 = (UIAccessibilityNotifications *)MEMORY[0x24BDF72C8];
    UIAccessibilityPostNotification(*v15, v14);

  }
}

void __90__PUScrubberViewAccessibility__axScrollToAssetReference_inViewModel_forThreeFingerScroll___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;
  uint64_t v8;

  v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __90__PUScrubberViewAccessibility__axScrollToAssetReference_inViewModel_forThreeFingerScroll___block_invoke_2;
  v5[3] = &unk_24FF15330;
  v6 = v2;
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v7 = v3;
  v8 = v4;
  objc_msgSend(v6, "performChanges:", v5);

}

void __90__PUScrubberViewAccessibility__axScrollToAssetReference_inViewModel_forThreeFingerScroll___block_invoke_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "safeValueForKey:", CFSTR("_scrubbingIdentifier"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setCurrentAssetReference:transitionProgress:transitionDriverIdentifier:animated:", v2, v3, 1, 0.0);

}

- (id)_axVideoPlaybackValue
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  -[PUScrubberViewAccessibility _axVideoSession](self, "_axVideoSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v24 = &v23;
  v25 = 0x3810000000;
  v26 = &unk_230BF71E9;
  v27 = 0;
  v3 = MEMORY[0x24BDAC760];
  v28 = 0;
  v29 = 0;
  v22 = v2;
  AXPerformSafeBlock();

  _Block_object_dispose(&v23, 8);
  v23 = 0;
  v24 = &v23;
  v25 = 0x3810000000;
  v26 = &unk_230BF71E9;
  v27 = 0;
  v28 = 0;
  v29 = 0;
  v21 = v3;
  v4 = v22;
  AXPerformSafeBlock();

  _Block_object_dispose(&v23, 8);
  UIAXTimeStringForDuration();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  UIAXTimeStringForDuration();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD17C8];
  accessibilityPULocalizedString(CFSTR("video.playbackcontrol.value.format"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", v8, v5, v6, v21, 3221225472, __52__PUScrubberViewAccessibility__axVideoPlaybackValue__block_invoke_2, &unk_24FF14FC8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "rangeOfString:", v5);
  v12 = v11;
  v13 = objc_msgSend(v9, "rangeOfString:options:", v6, 4);
  if (v12)
    v15 = v14 == 0;
  else
    v15 = 1;
  if (v15)
  {
    v18 = 0;
  }
  else
  {
    v16 = v13;
    v17 = v14;
    objc_msgSend(MEMORY[0x24BDFEA60], "axAttributedStringWithString:", v9);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = MEMORY[0x24BDBD1C8];
    objc_msgSend(v18, "setAttribute:forKey:withRange:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDFEB38], v10, v12);
    objc_msgSend(v18, "setAttribute:forKey:withRange:", v19, *MEMORY[0x24BDFEB38], v16, v17);
  }

  return v18;
}

double __52__PUScrubberViewAccessibility__axVideoPlaybackValue__block_invoke(uint64_t a1)
{
  uint64_t v2;
  double result;
  __int128 v4;
  uint64_t v5;

  objc_msgSend(*(id *)(a1 + 32), "currentTime");
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  result = *(double *)&v4;
  *(_OWORD *)(v2 + 32) = v4;
  *(_QWORD *)(v2 + 48) = v5;
  return result;
}

double __52__PUScrubberViewAccessibility__axVideoPlaybackValue__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  double result;
  __int128 v4;
  uint64_t v5;

  objc_msgSend(*(id *)(a1 + 32), "videoDuration");
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  result = *(double *)&v4;
  *(_OWORD *)(v2 + 32) = v4;
  *(_QWORD *)(v2 + 48) = v5;
  return result;
}

- (id)_axTileControllerForAsset:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "safeValueForKey:", CFSTR("indexPath"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("dataSourceIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUScrubberViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_tilingView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "presentedTileControllerWithIndexPath:kind:dataSourceIdentifier:", v5, CFSTR("PUTileKindItemContent"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_axShowingType
{
  void *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  -[PUScrubberViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AXIsVideoOnlyScrubber"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v9 = 0;
    v10 = &v9;
    v11 = 0x2020000000;
    v12 = 1;
    -[PUScrubberViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_tilingView"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __45__PUScrubberViewAccessibility__axShowingType__block_invoke;
    v8[3] = &unk_24FF156A0;
    v8[4] = &v9;
    objc_msgSend(v4, "enumerateAllTileControllersUsingBlock:", v8);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *((unsigned __int8 *)v10 + 24));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUScrubberViewAccessibility _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", v3, CFSTR("AXIsVideoOnlyScrubber"));
    _Block_object_dispose(&v9, 8);
  }
  if (objc_msgSend(v3, "BOOLValue"))
    v5 = CFSTR("photo.scrubber.video");
  else
    v5 = CFSTR("photo.scrubber.photo");
  accessibilityPULocalizedString(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __45__PUScrubberViewAccessibility__axShowingType__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  id v6;

  v6 = a2;
  NSClassFromString(CFSTR("PUFilmstripTileViewController"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "safeValueForKey:", CFSTR("asset"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "conformsToProtocol:", &unk_255EB6D68)
      && (objc_msgSend(v5, "safeUnsignedIntegerForKey:", CFSTR("mediaSubtypes")) & 8) != 0)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
      *a3 = 1;
    }

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    *a3 = 1;
  }

}

- (id)_axVideoPlayer
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  -[PUScrubberViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("browsingSession"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("viewModel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "safeValueForKey:", CFSTR("currentAssetReference"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__8;
  v13 = __Block_byref_object_dispose__8;
  v14 = 0;
  v7 = v3;
  v8 = v4;
  AXPerformSafeBlock();
  v5 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  return v5;
}

void __45__PUScrubberViewAccessibility__axVideoPlayer__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "assetViewModelForAssetReference:", *(_QWORD *)(a1 + 40));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeValueForKey:", CFSTR("videoPlayer"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_axVideoSession
{
  void *v2;
  void *v3;

  -[PUScrubberViewAccessibility _axVideoPlayer](self, "_axVideoPlayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("videoSession"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_axIsVideoPlayerActivated
{
  void *v2;
  void *v3;
  char v4;

  -[PUScrubberViewAccessibility _axVideoPlayer](self, "_axVideoPlayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "safeBoolForKey:", CFSTR("isActivated"));
  else
    v4 = 0;

  return v4;
}

- (BOOL)canBecomeFocused
{
  unsigned __int8 v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PUScrubberViewAccessibility;
  v3 = -[PUScrubberViewAccessibility canBecomeFocused](&v5, sel_canBecomeFocused);
  return -[PUScrubberViewAccessibility _accessibilityIsFKARunningForFocusItem](self, "_accessibilityIsFKARunningForFocusItem") | v3;
}

@end
