@implementation LPLinkViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("LPLinkView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("LPCaptionBarView"), CFSTR("_playButton"), "LPPlayButtonView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("LPStreamingAudioPlayButtonControl"), CFSTR("_player"), "<LPAudioPlayer>");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("LPStreamingAudioPlayer"), CFSTR("state"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("LPStreamingAudioPlayer"), CFSTR("progress"), "f", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("LPPlayButtonControl"), CFSTR("buttonPressed:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("LPPlayButtonView"), CFSTR("_button"), "LPPlayButtonControl");
  objc_msgSend(v3, "validateClass:", CFSTR("LPVisualMediaView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("LPVisualMediaView"), CFSTR("isMuted"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("LPVisualMediaView"), CFSTR("_muteButtonTapRecognized:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("LPLinkView"), CFSTR("metadata"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("LPLinkView"), CFSTR("URL"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("LPLinkView"), CFSTR("_mediaTapRecognized:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("LPLinkMetadata"), CFSTR("URL"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("LPLinkMetadata"), CFSTR("video"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("LPImageView"), CFSTR("_imageView"), "UIImageView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("LPLinkView"), CFSTR("_properties"), "LPConcretePresentationProperties");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("LPWebLinkPresentationProperties"), CFSTR("quotedText"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("LPWebLinkPresentationProperties"), CFSTR("captionBar"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("LPLinkView"), CFSTR("_components"), "LPLinkViewComponents");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("LPLinkView"), CFSTR("_captionButton"), "LPCaptionButtonPresentationProperties");
  objc_msgSend(v3, "validateClass:", CFSTR("LPLinkViewComponents"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("LPLinkViewComponents"), CFSTR("captionBar"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("LPLinkViewComponents"), CFSTR("media"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("LPCaptionBarView"), CFSTR("collaborationFooterView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("LPCollaborationFooterView"), CFSTR("_optionsView"), "LPTextView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("LPCollaborationFooterView"), CFSTR("_subtitleView"), "LPTextView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("LPTextView"), CFSTR("attributedString"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("LPCaptionBarPresentationProperties"), CFSTR("top"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("LPCaptionBarPresentationProperties"), CFSTR("bottom"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("LPCaptionRowPresentationProperties"), CFSTR("leading"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("LPCaptionRowPresentationProperties"), CFSTR("trailing"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("LPCaptionPresentationProperties"), CFSTR("text"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("LPCaptionButtonPresentationProperties"), CFSTR("text"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("LPCaptionButtonPresentationProperties"), CFSTR("attributedText"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("LPCaptionBarView"), CFSTR("_bottomCaptionView"), "LPComponentView<LPTextStyleable><LPSubtitleButtonContainer>");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("LPCaptionBarView"), CFSTR("button"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("LPHorizontalCaptionPairView"), CFSTR("LPComponentView<LPTextStyleable><LPSubtitleButtonContainer>"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("LPHorizontalCaptionPairView"), CFSTR("_button"), "LPSubtitleButtonView");
  objc_msgSend(v3, "validateClass:", CFSTR("LPCaptionBarButtonView"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("LPCaptionBarButtonView"), CFSTR("_button"), "UIButton");

}

- (BOOL)isAccessibilityElement
{
  void *v2;
  BOOL v3;

  -[LPLinkViewAccessibility _axCaptionText](self, "_axCaptionText");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

- (id)accessibilityCustomActions
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  objc_super v37;
  _QWORD v38[4];
  id v39;
  _QWORD v40[4];
  id v41;
  id location;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPLinkViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("metadata"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("video"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x24BDF6788]);
    accessibilityLocalizedString(CFSTR("OpenURLStr"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithName:target:selector:", v7, self, sel__axFollowLink);

    objc_msgSend(v3, "addObject:", v8);
  }
  -[LPLinkViewAccessibility _axITunesPlayButton](self, "_axITunesPlayButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "_accessibilityViewIsVisible"))
  {
    NSClassFromString(CFSTR("LPStreamingAudioPlayButtonControl"));
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v9, "safeValueForKey:", CFSTR("_player"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "safeIntegerForKey:", CFSTR("state"));

      if (v11 == 2)
        v12 = CFSTR("pause.button");
      else
        v12 = CFSTR("play.button");
      accessibilityLocalizedString(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6788]), "initWithName:target:selector:", v13, self, sel__axPlayPause_);
      objc_msgSend(v3, "addObject:", v14);

    }
    else
    {
      NSClassFromString(CFSTR("LPPlayButtonControl"));
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_12;
      objc_msgSend(v9, "accessibilityCustomActions");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "axSafelyAddObjectsFromArray:", v13);
    }

  }
LABEL_12:
  -[LPLinkViewAccessibility _axMuteAction](self, "_axMuteAction");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    objc_msgSend(v3, "addObject:", v15);
  -[LPLinkViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_captionButton"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    -[LPLinkViewAccessibility _axCaptionText](self, "_axCaptionText");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "length"))
    {
      -[LPLinkViewAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("_components.captionBar"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "safeValueForKey:", CFSTR("_bottomCaptionView"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      NSClassFromString(CFSTR("LPHorizontalCaptionPairView"));
      v35 = v4;
      v32 = v19;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        LOBYTE(location) = 0;
        objc_opt_class();
        objc_msgSend(v19, "safeValueForKey:", CFSTR("_button"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        __UIAccessibilityCastAsClass();
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        objc_initWeak(&location, v21);
        v22 = objc_alloc(MEMORY[0x24BDF6788]);
        v40[0] = MEMORY[0x24BDAC760];
        v40[1] = 3221225472;
        v40[2] = __53__LPLinkViewAccessibility_accessibilityCustomActions__block_invoke;
        v40[3] = &unk_24FEF20C8;
        objc_copyWeak(&v41, &location);
        v23 = (void *)objc_msgSend(v22, "initWithName:actionHandler:", v17, v40);
        objc_msgSend(v3, "addObject:", v23);

        objc_destroyWeak(&v41);
        objc_destroyWeak(&location);

        v4 = v35;
        v19 = v32;
      }
      objc_msgSend(v18, "safeValueForKey:", CFSTR("button"), v32, v18, v35);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      NSClassFromString(CFSTR("LPCaptionBarButtonView"));
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        LOBYTE(location) = 0;
        objc_opt_class();
        objc_msgSend(v24, "safeValueForKeyPath:", CFSTR("_button"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        __UIAccessibilityCastAsClass();
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if ((_BYTE)location)
          abort();
        if (v26)
        {
          objc_initWeak(&location, v26);
          v27 = objc_alloc(MEMORY[0x24BDF6788]);
          v38[0] = MEMORY[0x24BDAC760];
          v38[1] = 3221225472;
          v38[2] = __53__LPLinkViewAccessibility_accessibilityCustomActions__block_invoke_2;
          v38[3] = &unk_24FEF20C8;
          objc_copyWeak(&v39, &location);
          v28 = (void *)objc_msgSend(v27, "initWithName:actionHandler:", v17, v38);
          objc_msgSend(v3, "addObject:", v28);

          objc_destroyWeak(&v39);
          objc_destroyWeak(&location);
        }

        v18 = v34;
        v4 = v36;
        v19 = v33;
      }

    }
  }
  if (objc_msgSend(v3, "count"))
  {
    v29 = v3;
  }
  else
  {
    v37.receiver = self;
    v37.super_class = (Class)LPLinkViewAccessibility;
    -[LPLinkViewAccessibility accessibilityCustomActions](&v37, sel_accessibilityCustomActions);
    v29 = (id)objc_claimAutoreleasedReturnValue();
  }
  v30 = v29;

  return v30;
}

uint64_t __53__LPLinkViewAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "sendActionsForControlEvents:", 64);

  return 1;
}

uint64_t __53__LPLinkViewAccessibility_accessibilityCustomActions__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "sendActionsForControlEvents:", 64);

  return 1;
}

- (id)automationElements
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
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
  void *v17;
  void *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)LPLinkViewAccessibility;
  -[LPLinkViewAccessibility automationElements](&v20, sel_automationElements);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  -[LPLinkViewAccessibility _axITunesPlayButton](self, "_axITunesPlayButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "_accessibilityViewIsVisible"))
  {
    NSClassFromString(CFSTR("LPStreamingAudioPlayButtonControl"));
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v7, "axSafelyAddObject:", v8);
  }
  -[LPLinkViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_captionButton"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPLinkViewAccessibility _axCaptionText](self, "_axCaptionText");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9 && objc_msgSend(v10, "length"))
  {
    -[LPLinkViewAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("_components.captionBar"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "safeValueForKey:", CFSTR("_bottomCaptionView"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    NSClassFromString(CFSTR("LPHorizontalCaptionPairView"));
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_opt_class();
      objc_msgSend(v13, "safeValueForKey:", CFSTR("_button"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      __UIAccessibilityCastAsClass();
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "axSafelyAddObject:", v15);
    }
    objc_msgSend(v12, "safeValueForKey:", CFSTR("button"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    NSClassFromString(CFSTR("LPCaptionBarButtonView"));
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_opt_class();
      objc_msgSend(v16, "safeValueForKeyPath:", CFSTR("_button"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      __UIAccessibilityCastAsClass();
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "axSafelyAddObject:", v18);
    }

  }
  return v7;
}

- (id)accessibilityLabel
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
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  LPLinkViewAccessibility *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v67;
  void *v68;
  const __CFString *v69;
  const __CFString *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  LPLinkViewAccessibility *v77;
  void *v78;
  void *v79;
  void *v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  _BYTE v85[128];
  uint64_t v86;

  v86 = *MEMORY[0x24BDAC8D0];
  -[LPLinkViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("metadata"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("video"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPLinkViewAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("_properties.captionBar"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    -[LPLinkViewAccessibility _accessibilityFindSubviewDescendantsPassingTest:](self, "_accessibilityFindSubviewDescendantsPassingTest:", &__block_literal_global_0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    AXLabelForElements();
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_35;
  }
  v77 = self;
  v73 = v3;
  objc_msgSend(v5, "safeValueForKey:", CFSTR("top"));
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "safeValueForKey:", CFSTR("leading"));
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "safeStringForKey:", CFSTR("text"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeValueForKey:", CFSTR("top"));
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "safeValueForKey:", CFSTR("trailing"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "safeStringForKey:", CFSTR("text"));
  v78 = v4;
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeValueForKey:", CFSTR("bottom"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "safeValueForKey:", CFSTR("leading"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "safeStringForKey:", CFSTR("text"));
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v6;
  v14 = (void *)v12;
  v72 = v13;
  objc_msgSend(v13, "safeValueForKey:", CFSTR("bottom"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "safeValueForKey:", CFSTR("trailing"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "safeStringForKey:", CFSTR("text"));
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = v78;
  if (v78)
  {
    accessibilityLocalizedString(CFSTR("VideoStr"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
  }
  __AXStringForVariables();
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v78)
  v22 = v77;
  -[LPLinkViewAccessibility safeValueForKey:](v77, "safeValueForKey:", CFSTR("_properties"), v17, CFSTR("__AXStringForVariablesSentinel"), v71, CFSTR("__AXStringForVariablesSentinel"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "safeStringForKey:", CFSTR("quotedText"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v24, "length"))
  {
    v25 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("quoted.text"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "stringWithFormat:", v26, v24);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = CFSTR("__AXStringForVariablesSentinel");
    __UIAXStringForVariables();
    v27 = objc_claimAutoreleasedReturnValue();

    v21 = (void *)v27;
  }
  -[LPLinkViewAccessibility _axMediaViews](v77, "_axMediaViews", v67, v69);
  v81 = 0u;
  v82 = 0u;
  v83 = 0u;
  v84 = 0u;
  v28 = (id)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v81, v85, 16);
  v80 = v28;
  if (!v29)
  {
LABEL_32:
    v54 = v21;

    goto LABEL_34;
  }
  v30 = v29;
  v76 = v24;
  v31 = 0;
  v32 = 0;
  v33 = *(_QWORD *)v82;
  do
  {
    for (i = 0; i != v30; ++i)
    {
      if (*(_QWORD *)v82 != v33)
        objc_enumerationMutation(v28);
      v35 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * i);
      NSClassFromString(CFSTR("LPImageView"));
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v35, "safeValueForKey:", CFSTR("_imageView"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "accessibilityLabel");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v37, "length") && (AXStringIsSymbolName(v37) & 1) == 0)
        {
          v38 = v31;
          v39 = (void *)MEMORY[0x24BDD17C8];
          accessibilityLocalizedString(CFSTR("caption.image"));
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "stringWithFormat:", v40, v37);
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          v70 = CFSTR("__AXStringForVariablesSentinel");
          __UIAXStringForVariables();
          v41 = objc_claimAutoreleasedReturnValue();
          v42 = v21;
          v21 = (void *)v41;

          v31 = v38;
          v28 = v80;
        }
        ++v32;

      }
      else
      {
        NSClassFromString(CFSTR("LPVisualMediaView"));
        if ((objc_opt_isKindOfClass() & 1) == 0)
          continue;
        objc_msgSend(v35, "accessibilityLabel");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v36, "length") && (AXStringIsSymbolName(v36) & 1) == 0)
        {
          v43 = (void *)MEMORY[0x24BDD17C8];
          accessibilityLocalizedString(CFSTR("caption.video"));
          v44 = v31;
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "stringWithFormat:", v45, v36);
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          v70 = CFSTR("__AXStringForVariablesSentinel");
          __UIAXStringForVariables();
          v46 = objc_claimAutoreleasedReturnValue();

          v28 = v80;
          v31 = v44;
          v21 = (void *)v46;
        }
        ++v31;
      }

    }
    v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v81, v85, 16);
  }
  while (v30);

  if (v32 >= 1)
  {
    v47 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("images.count.description"));
    v48 = v31;
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "localizedStringWithFormat:", v49, v32);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = CFSTR("__AXStringForVariablesSentinel");
    __UIAXStringForVariables();
    v50 = objc_claimAutoreleasedReturnValue();

    v31 = v48;
    v21 = (void *)v50;
  }
  v22 = v77;
  v4 = v78;
  v24 = v76;
  if (v31 >= 1)
  {
    v51 = v31;
    v52 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("videos.count.description"));
    v28 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "localizedStringWithFormat:", v28, v51);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = CFSTR("__AXStringForVariablesSentinel");
    __UIAXStringForVariables();
    v53 = objc_claimAutoreleasedReturnValue();

    v21 = (void *)v53;
    goto LABEL_32;
  }
  v54 = v21;
LABEL_34:
  -[LPLinkViewAccessibility safeValueForKey:](v22, "safeValueForKey:", CFSTR("_components"), v68, v70);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "safeValueForKey:", CFSTR("captionBar"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "safeValueForKey:", CFSTR("collaborationFooterView"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v57, "safeValueForKey:", CFSTR("_optionsView"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "safeValueForKey:", CFSTR("_subtitleView"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(v58, "safeValueForKey:", CFSTR("attributedString"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v61, "string");
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  objc_msgSend(v59, "safeValueForKey:", CFSTR("attributedString"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v64, "string");
  v65 = (void *)objc_claimAutoreleasedReturnValue();

  __UIAXStringForVariables();
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v72;
  v3 = v73;
LABEL_35:

  return v20;
}

uint64_t __45__LPLinkViewAccessibility_accessibilityLabel__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  NSClassFromString(CFSTR("LPTextView"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)accessibilityHint
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  -[LPLinkViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("metadata"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "safeValueForKey:", CFSTR("video"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      v10.receiver = self;
      v10.super_class = (Class)LPLinkViewAccessibility;
      -[LPLinkViewAccessibility accessibilityHint](&v10, sel_accessibilityHint);
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    v6 = CFSTR("link.video.hint");
  }
  else
  {
    v6 = CFSTR("link.load.hint");
  }
  accessibilityLocalizedString(v6);
  v7 = objc_claimAutoreleasedReturnValue();
LABEL_7:
  v8 = (void *)v7;

  return v8;
}

- (unint64_t)accessibilityTraits
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  objc_super v8;

  -[LPLinkViewAccessibility accessibilityUserDefinedTraits](self, "accessibilityUserDefinedTraits");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v8.receiver = self;
    v8.super_class = (Class)LPLinkViewAccessibility;
    return -[LPLinkViewAccessibility accessibilityTraits](&v8, sel_accessibilityTraits);
  }
  else
  {
    -[LPLinkViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("metadata"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "safeValueForKey:", CFSTR("video"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      v4 = *MEMORY[0x24BDF7408] | *MEMORY[0x24BDF73B0];
    else
      v4 = *MEMORY[0x24BDF73D8];

  }
  return v4;
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  -[LPLinkViewAccessibility _axITunesPlayButton](self, "_axITunesPlayButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("LPStreamingAudioPlayButtonControl"));
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(v3, "_accessibilityViewIsVisible");
LABEL_6:
    v10.receiver = self;
    v10.super_class = (Class)LPLinkViewAccessibility;
    -[LPLinkViewAccessibility accessibilityValue](&v10, sel_accessibilityValue);
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  objc_msgSend(v3, "safeValueForKey:", CFSTR("_player"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "safeIntegerForKey:", CFSTR("state"));

  if (!objc_msgSend(v3, "_accessibilityViewIsVisible") || v5 != 2)
    goto LABEL_6;
  objc_msgSend(v3, "safeValueForKey:", CFSTR("_player"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeDoubleForKey:", CFSTR("progress"));

  AXFormatFloatWithPercentage();
  v7 = objc_claimAutoreleasedReturnValue();
LABEL_7:
  v8 = (void *)v7;

  return v8;
}

- (BOOL)accessibilityActivate
{
  BOOL v3;
  void *v4;
  void *v5;
  float v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)LPLinkViewAccessibility;
  v3 = -[LPLinkViewAccessibility accessibilityActivate](&v14, sel_accessibilityActivate);
  if (-[LPLinkViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_hasVideo")))
  {
    -[LPLinkViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_player"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safeFloatForKey:", CFSTR("rate"));
    v5 = (void *)MEMORY[0x24BDFEA60];
    if (v6 == 0.0)
      v7 = CFSTR("PlayingStr");
    else
      v7 = CFSTR("PausedStr");
    accessibilityLocalizedString(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "axAttributedStringWithString:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setAttribute:forKey:", &unk_24FEF3530, *MEMORY[0x24BDFEAD8]);
    UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], v9);

  }
  -[LPLinkViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_components"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "safeValueForKey:", CFSTR("media"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("LPVisualMediaView"));
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v11, "safeBoolForKey:", CFSTR("isMuted")))
  {
    v13 = v11;
    AXPerformSafeBlock();

  }
  return v3;
}

uint64_t __48__LPLinkViewAccessibility_accessibilityActivate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_muteButtonTapRecognized:", 0);
}

- (unsigned)_accessibilityMediaAnalysisOptions
{
  void *v3;
  uint64_t v4;
  objc_super v6;

  -[LPLinkViewAccessibility _axMediaViews](self, "_axMediaViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
    return 0;
  v6.receiver = self;
  v6.super_class = (Class)LPLinkViewAccessibility;
  return -[LPLinkViewAccessibility _accessibilityMediaAnalysisOptions](&v6, sel__accessibilityMediaAnalysisOptions) | 0x10000;
}

- (id)_axITunesPlayButton
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[LPLinkViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_components"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("captionBar"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("_playButton"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("_button"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  NSClassFromString(CFSTR("LPPlayButtonControl"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;

  return v6;
}

- (id)_axMuteAction
{
  void *v2;
  void *v3;
  __CFString *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id location;

  -[LPLinkViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_components"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("media"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("LPVisualMediaView"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_initWeak(&location, v3);
    if (objc_msgSend(v3, "safeBoolForKey:", CFSTR("isMuted")))
      v4 = CFSTR("unmute.action.name");
    else
      v4 = CFSTR("mute.action.name");
    accessibilityLocalizedString(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc(MEMORY[0x24BDF6788]);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __40__LPLinkViewAccessibility__axMuteAction__block_invoke;
    v9[3] = &unk_24FEF20C8;
    objc_copyWeak(&v10, &location);
    v7 = (void *)objc_msgSend(v6, "initWithName:actionHandler:", v5, v9);
    objc_destroyWeak(&v10);

    objc_destroyWeak(&location);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __40__LPLinkViewAccessibility__axMuteAction__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v5;

  v3 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  AXPerformSafeBlock();
  objc_destroyWeak(&v5);

  return 1;
}

void __40__LPLinkViewAccessibility__axMuteAction__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_muteButtonTapRecognized:", 0);

}

- (BOOL)_axPlayPause:(id)a3
{
  id v3;
  void *v5;

  -[LPLinkViewAccessibility _axITunesPlayButton](self, "_axITunesPlayButton", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v5;
  AXPerformSafeBlock();

  return 1;
}

uint64_t __40__LPLinkViewAccessibility__axPlayPause___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "buttonPressed:", 0);
}

- (void)_axFollowLink
{
  AXPerformSafeBlock();
}

uint64_t __40__LPLinkViewAccessibility__axFollowLink__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_mediaTapRecognized:", 0);
}

- (id)_axMediaViews
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  -[LPLinkViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_components"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("captionBar"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __40__LPLinkViewAccessibility__axMediaViews__block_invoke;
  v8[3] = &unk_24FEF2138;
  v9 = v4;
  v5 = v4;
  -[LPLinkViewAccessibility _accessibilityFindSubviewDescendantsPassingTest:](self, "_accessibilityFindSubviewDescendantsPassingTest:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __40__LPLinkViewAccessibility__axMediaViews__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  char isKindOfClass;
  CGRect v19;
  CGRect v20;

  v3 = a2;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "accessibilityFrame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(v4, "accessibilityFrame");
  v20.origin.x = v13;
  v20.origin.y = v14;
  v20.size.width = v15;
  v20.size.height = v16;
  v19.origin.x = v6;
  v19.origin.y = v8;
  v19.size.width = v10;
  v19.size.height = v12;
  if (CGRectContainsRect(v19, v20))
  {
    isKindOfClass = 0;
  }
  else
  {
    NSClassFromString(CFSTR("LPImageView"));
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      isKindOfClass = 1;
    }
    else
    {
      NSClassFromString(CFSTR("LPVisualMediaView"));
      isKindOfClass = objc_opt_isKindOfClass();
    }
  }

  return isKindOfClass & 1;
}

- (id)_axCaptionText
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  -[LPLinkViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_captionButton"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "safeStringForKey:", CFSTR("text"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v4, "length"))
    {
      objc_opt_class();
      objc_msgSend(v3, "safeValueForKey:", CFSTR("attributedText"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      __UIAccessibilityCastAsClass();
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "string");
      v7 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v7;
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
