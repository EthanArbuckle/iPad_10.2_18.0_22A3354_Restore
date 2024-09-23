@implementation VideosUI_MultiPlayerContainerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VideosUI.MultiPlayerContainerView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("VideosUI.MultiPlayerContainerView"), CFSTR("volumeIndicator"), "UIImageView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VideosUI.MultiPlayerContainerView"), CFSTR("accessibilityNotifySnapshotRemoval"), "v", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("VideosUI.MultiPlayerViewController"));
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("VideosUI.MultiPlayerContainerView"), CFSTR("playerViewController"), "AVPlayerViewController");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("VideosUI.MultiPlayerViewController"), CFSTR("playerView"), "MultiPlayerView");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("VideosUI.MultiPlayerView"), CFSTR("containerViews"), "Array<MultiPlayerContainerView>");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("VideosUI.MultiPlayerViewController"), CFSTR("isDetailsViewControllerVisible"), "Bool");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VideosUI.MultiPlayerViewController"), CFSTR("setDetailsViewControllerVisible:animated:completion:"), "v", "B", "B", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VideosUI.MultiPlayerViewController"), CFSTR("addPlayerViewController:animated:completion:"), "v", "@", "B", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VideosUI.MultiPlayerViewController"), CFSTR("removePlayerViewController:animated:completion:"), "v", "@", "B", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VideosUI.MultiPlayerViewController"), CFSTR("enterFullscreenWithPlayerViewController:completion:"), "v", "@", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VideosUI.MultiPlayerViewController"), CFSTR("replacePlayerViewController:atIndex:animated:completion:"), "v", "@", "q", "B", "@?", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("VUIPlaybackManager"));
  objc_msgSend(v3, "validateClass:", CFSTR("VideosUI.CardView"));
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("VUIPlaybackManager"), CFSTR("sharedInstance"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VUIPlaybackManager"), CFSTR("_multiviewInfoForPlayerViewController:"), "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VUIMultiviewPlaybackInfo"), CFSTR("player"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TVPPlaylist"), CFSTR("currentMediaItem"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VideosUI.CardView"), CFSTR("accessibilityLabelViews"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VUITextLayout"), CFSTR("textStyle"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VUILabel"), CFSTR("textLayout"), "@", 0);

}

- (id)_axMultiView
{
  void *v3;
  void *v4;

  objc_opt_class();
  -[VideosUI_MultiPlayerContainerViewAccessibility _accessibilityFindAncestor:startWithSelf:](self, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_axAVPlayer
{
  return (id)-[VideosUI_MultiPlayerContainerViewAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("playerViewController"));
}

- (id)_axAllPlayerViewControls
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[VideosUI_MultiPlayerContainerViewAccessibility _axMultiView](self, "_axMultiView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accessibilityViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "safeSwiftValueForKey:", CFSTR("playerView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeSwiftArrayForKey:", CFSTR("containerViews"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ax_mappedArrayUsingBlock:", &__block_literal_global_245);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_axAllMultiviewContainers
{
  void *v2;
  void *v3;
  void *v4;

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "_accessibilityFindSubviewDescendantsPassingTest:", &__block_literal_global_247);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isAccessibilityElement
{
  void *v3;
  void *v4;
  int v5;

  objc_opt_class();
  -[VideosUI_MultiPlayerContainerViewAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("editView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "_accessibilityViewIsVisible") ^ 1;
  return v5;
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v11;
  void *v12;
  const __CFString *v13;

  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  -[VideosUI_MultiPlayerContainerViewAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("volumeIndicator"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[VideosUI_MultiPlayerContainerViewAccessibility _accessibilityDescendantOfType:](self, "_accessibilityDescendantOfType:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if ((objc_msgSend(v5, "isHidden") & 1) == 0)
  {
    objc_msgSend(v5, "alpha");
    if (v6 > 0.0)
    {
      accessibilityLocalizedString(CFSTR("sports.audio.current"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = CFSTR("__AXStringForVariablesSentinel");
      __AXStringForVariables();
      v7 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v7;
    }
  }
  -[VideosUI_MultiPlayerContainerViewAccessibility _axAllMultiviewContainers](self, "_axAllMultiviewContainers", v11, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "indexOfObject:", self))
  {
    accessibilityLocalizedString(CFSTR("multiview.status.prominent"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    __AXStringForVariables();
    v9 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v9;
  }

  return v3;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  _QWORD v44[4];
  id v45;
  objc_super v46;
  _QWORD v47[9];
  id v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;

  objc_msgSend((id)MEMORY[0x2349244BC](CFSTR("VUIPlaybackManager"), a2), "safeValueForKey:", CFSTR("sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosUI_MultiPlayerContainerViewAccessibility _axAVPlayer](self, "_axAVPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_multiviewInfoForPlayerViewController:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "safeValueForKeyPath:", CFSTR("player.currentMediaItem"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = 0;
  v51 = &v50;
  v52 = 0x3032000000;
  v53 = __Block_byref_object_copy_;
  v54 = __Block_byref_object_dispose_;
  v7 = MEMORY[0x24BDAC760];
  v55 = 0;
  v47[5] = MEMORY[0x24BDAC760];
  v47[6] = 3221225472;
  v47[7] = __68__VideosUI_MultiPlayerContainerViewAccessibility_accessibilityLabel__block_invoke;
  v47[8] = &unk_2503D22A8;
  v49 = &v50;
  v48 = v6;
  AXPerformSafeBlock();
  v41 = v48;
  v42 = v5;
  v43 = v3;
  v8 = (id)v51[5];

  _Block_object_dispose(&v50, 8);
  v9 = MEMORY[0x2349244BC](CFSTR("VideosUI.MultiViewPlayerHUDTemplateController"));
  LOBYTE(v50) = 0;
  objc_opt_class();
  -[VideosUI_MultiPlayerContainerViewAccessibility _axMultiView](self, "_axMultiView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v47[0] = v7;
  v47[1] = 3221225472;
  v47[2] = __68__VideosUI_MultiPlayerContainerViewAccessibility_accessibilityLabel__block_invoke_2;
  v47[3] = &__block_descriptor_40_e8_B16__0_8lu32l8;
  v47[4] = v9;
  objc_msgSend(v10, "_accessibilityFindSubviewDescendant:", v47);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if ((_BYTE)v50)
    goto LABEL_14;
  objc_msgSend(v12, "_accessibilityViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "safeSwiftValueForKey:", CFSTR("templateViewModel"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "safeSwiftArrayForKey:", CFSTR("children"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "firstObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "safeSwiftArrayForKey:", CFSTR("groups"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "firstObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "safeSwiftArrayForKey:", CFSTR("items"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "count"))
  {
    v39 = v16;
    v40 = v14;
    v44[0] = v7;
    v44[1] = 3221225472;
    v44[2] = __68__VideosUI_MultiPlayerContainerViewAccessibility_accessibilityLabel__block_invoke_3;
    v44[3] = &unk_2503D22F0;
    v45 = v8;
    objc_msgSend(v19, "ax_firstObjectUsingBlock:", v44);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "indexOfObject:");
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", v20, 0);
    v21 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "view");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "_accessibilityFindSubviewDescendant:", &__block_literal_global_278);
    v23 = objc_claimAutoreleasedReturnValue();

    LOBYTE(v50) = 0;
    objc_opt_class();
    v37 = (void *)v23;
    __UIAccessibilityCastAsClass();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (!(_BYTE)v50)
    {
      v25 = v24;
      v36 = (void *)v21;
      objc_msgSend(v24, "cellForItemAtIndexPath:", v21);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "_accessibilityFindSubviewDescendant:", &__block_literal_global_282);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "safeArrayForKey:", CFSTR("accessibilityLabelViews"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (void *)objc_msgSend(v28, "mutableCopy");

      if (objc_msgSend(v29, "count"))
      {
        v30 = v8;
        objc_msgSend(v29, "sortUsingComparator:", &__block_literal_global_286);
        objc_msgSend(v29, "firstObject");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "accessibilityLabel");
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v32, "length"))
        {
          if (!v32)
          {
LABEL_7:
            accessibilityLocalizedString(CFSTR("multiview.game.unknown"));
            v33 = (id)objc_claimAutoreleasedReturnValue();
LABEL_12:
            v34 = v33;

            v16 = v39;
            v14 = v40;
            goto LABEL_13;
          }
LABEL_11:
          v33 = v32;
          v32 = v33;
          goto LABEL_12;
        }

        v8 = v30;
      }
      v30 = v8;
      objc_msgSend(v27, "accessibilityLabel");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v32)
        goto LABEL_7;
      goto LABEL_11;
    }
LABEL_14:
    abort();
  }
  v30 = v8;
  v46.receiver = self;
  v46.super_class = (Class)VideosUI_MultiPlayerContainerViewAccessibility;
  -[VideosUI_MultiPlayerContainerViewAccessibility accessibilityLabel](&v46, sel_accessibilityLabel);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:

  return v34;
}

- (id)accessibilityCustomActions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *inited;
  _BOOL4 v25;
  void *v26;
  void *v27;
  id v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  id v35;
  _QWORD v36[4];
  id v37;
  id v38;
  _QWORD v39[4];
  id v40;
  id v41;
  _QWORD v42[4];
  id v43;
  char v44;
  id from;
  id location;
  objc_super v47;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v47.receiver = self;
  v47.super_class = (Class)VideosUI_MultiPlayerContainerViewAccessibility;
  -[VideosUI_MultiPlayerContainerViewAccessibility accessibilityCustomActions](&v47, sel_accessibilityCustomActions);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObjectsFromArray:", v4);

  -[VideosUI_MultiPlayerContainerViewAccessibility _axMultiView](self, "_axMultiView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_accessibilityViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  MEMORY[0x2349244BC](CFSTR("VideosUI.MultiPlayerViewController"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_initWeak(&location, self);
    objc_initWeak(&from, v6);
    v7 = objc_msgSend(v6, "safeSwiftBoolForKey:", CFSTR("isDetailsViewControllerVisible"));
    v8 = objc_alloc(MEMORY[0x24BDF6788]);
    if (v7)
      v9 = CFSTR("multiview.addMoreGames.grabber.hide");
    else
      v9 = CFSTR("multiview.addMoreGames.grabber.show");
    accessibilityLocalizedString(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = MEMORY[0x24BDAC760];
    v42[1] = 3221225472;
    v42[2] = __76__VideosUI_MultiPlayerContainerViewAccessibility_accessibilityCustomActions__block_invoke;
    v42[3] = &unk_2503D23C0;
    objc_copyWeak(&v43, &from);
    v44 = v7;
    v11 = (void *)objc_msgSend(v8, "initWithName:actionHandler:", v10, v42);

    objc_msgSend(v3, "axSafelyAddObject:", v11);
    -[VideosUI_MultiPlayerContainerViewAccessibility _axAVPlayer](self, "_axAVPlayer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = objc_alloc(MEMORY[0x24BDF6788]);
      accessibilityLocalizedString(CFSTR("multiview.removePlayer"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v39[0] = MEMORY[0x24BDAC760];
      v39[1] = 3221225472;
      v39[2] = __76__VideosUI_MultiPlayerContainerViewAccessibility_accessibilityCustomActions__block_invoke_3;
      v39[3] = &unk_2503D2410;
      objc_copyWeak(&v40, &from);
      objc_copyWeak(&v41, &location);
      v15 = objc_msgSend(v13, "initWithName:actionHandler:", v14, v39);

      objc_msgSend(v3, "axSafelyAddObject:", v15);
      v30 = (void *)v15;
      v16 = objc_alloc(MEMORY[0x24BDF6788]);
      accessibilityLocalizedString(CFSTR("multiview.enterFullscreen"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v36[0] = MEMORY[0x24BDAC760];
      v36[1] = 3221225472;
      v36[2] = __76__VideosUI_MultiPlayerContainerViewAccessibility_accessibilityCustomActions__block_invoke_5;
      v36[3] = &unk_2503D2410;
      objc_copyWeak(&v37, &from);
      objc_copyWeak(&v38, &location);
      v18 = (void *)objc_msgSend(v16, "initWithName:actionHandler:", v17, v36);

      objc_msgSend(v3, "axSafelyAddObject:", v18);
      -[VideosUI_MultiPlayerContainerViewAccessibility _axAllPlayerViewControls](self, "_axAllPlayerViewControls");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[VideosUI_MultiPlayerContainerViewAccessibility _axAVPlayer](self, "_axAVPlayer");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v19, "indexOfObject:", v20);

      if (objc_msgSend(v19, "count"))
      {
        LOBYTE(v35) = 0;
        objc_opt_class();
        objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        __UIAccessibilityCastAsClass();
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        inited = objc_initWeak(&v35, v23);
        v25 = 0;
        if (v21)
        {
          if (v21 != 0x7FFFFFFFFFFFFFFFLL)
          {
            objc_msgSend(v23, "view");
            inited = (void *)objc_claimAutoreleasedReturnValue();
            v25 = inited != 0;
          }
          if (v21 != 0x7FFFFFFFFFFFFFFFLL)

        }
        if (v25)
        {
          v29 = objc_alloc(MEMORY[0x24BDF6788]);
          accessibilityLocalizedString(CFSTR("multiview.move.prominent"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v31[0] = MEMORY[0x24BDAC760];
          v31[1] = 3221225472;
          v31[2] = __76__VideosUI_MultiPlayerContainerViewAccessibility_accessibilityCustomActions__block_invoke_7;
          v31[3] = &unk_2503D2460;
          objc_copyWeak(&v32, &location);
          objc_copyWeak(&v33, &from);
          objc_copyWeak(&v34, &v35);
          v27 = (void *)objc_msgSend(v29, "initWithName:actionHandler:", v26, v31);

          objc_msgSend(v3, "axSafelyAddObject:", v27);
          objc_destroyWeak(&v34);
          objc_destroyWeak(&v33);
          objc_destroyWeak(&v32);
        }
        objc_destroyWeak(&v35);

      }
      objc_destroyWeak(&v38);
      objc_destroyWeak(&v37);

      objc_destroyWeak(&v41);
      objc_destroyWeak(&v40);
    }

    objc_destroyWeak(&v43);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }

  return v3;
}

- (BOOL)_accessibilityShouldIncludeRowRangeInElementDescription
{
  return 1;
}

- (_NSRange)accessibilityRowRange
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  NSUInteger v6;
  NSUInteger v7;
  objc_super v8;
  _NSRange result;

  v8.receiver = self;
  v8.super_class = (Class)VideosUI_MultiPlayerContainerViewAccessibility;
  -[VideosUI_MultiPlayerContainerViewAccessibility accessibilityRowRange](&v8, sel_accessibilityRowRange);
  -[VideosUI_MultiPlayerContainerViewAccessibility _axAllMultiviewContainers](self, "_axAllMultiviewContainers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  v5 = objc_msgSend(v3, "indexOfObject:", self);

  v6 = v5;
  v7 = v4;
  result.length = v7;
  result.location = v6;
  return result;
}

- (void)removeFromSuperview
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;

  -[VideosUI_MultiPlayerContainerViewAccessibility accessibilityLabel](self, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosUI_MultiPlayerContainerViewAccessibility _axAVPlayer](self, "_axAVPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "connectedScenes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ax_flatMappedArrayUsingBlock:", &__block_literal_global_310);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lastObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v16.receiver = self;
  v16.super_class = (Class)VideosUI_MultiPlayerContainerViewAccessibility;
  -[VideosUI_MultiPlayerContainerViewAccessibility removeFromSuperview](&v16, sel_removeFromSuperview);
  v13 = v9;
  v14 = v4;
  v15 = v3;
  v10 = v3;
  v11 = v4;
  v12 = v9;
  AXPerformBlockOnMainThreadAfterDelay();

}

@end
