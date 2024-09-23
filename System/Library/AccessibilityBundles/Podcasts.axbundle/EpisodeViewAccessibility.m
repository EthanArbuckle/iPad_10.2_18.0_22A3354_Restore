@implementation EpisodeViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ShelfKitCollectionViews.EpisodeView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ShelfKitCollectionViews.EpisodeView"), CFSTR("accessibilityCaptionLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ShelfKitCollectionViews.EpisodeView"), CFSTR("accessibilityTitleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ShelfKitCollectionViews.EpisodeView"), CFSTR("accessibilitySummaryLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ShelfKitCollectionViews.EpisodeView"), CFSTR("accessibilityPlaybackView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ShelfKitCollectionViews.EpisodeView"), CFSTR("accessibilitySummaryButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ShelfKitCollectionViews.EpisodeView"), CFSTR("accessibilityArtworkView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ShelfKitCollectionViews.EpisodeView"), CFSTR("accessibilityDurationLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ShelfKitCollectionViews.ArtworkView"), CFSTR("accessibilityTitle"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ShelfKitCollectionViews.ArtworkContainer"), CFSTR("accessibilityContextButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ShelfKitCollectionViews.EpisodeView"), CFSTR("accessibilityIsPlaying"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ShelfKitCollectionViews.EpisodeView"), CFSTR("accessibilityPerformPlayPauseAction"), "v", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  if (-[EpisodeViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("accessibilityIsPlaying")))
  {
    -[EpisodeViewAccessibility _accessibilityLabelForPlaybackState:](self, "_accessibilityLabelForPlaybackState:", 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = 0;
  }
  -[EpisodeViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityArtworkView"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "safeValueForKey:", CFSTR("accessibilityTitle"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[EpisodeViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityCaptionLabel"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "accessibilityLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[EpisodeViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityTitleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EpisodeViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityDurationLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilityLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EpisodeViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityArtworkView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "_accessibilityViewIsVisible");
  if (v8)
  {
    -[EpisodeViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityArtworkView"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "accessibilityLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  -[EpisodeViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityPlaybackView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "accessibilityLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {

  }
  accessibilityStripUnfavorableCharacters(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)accessibilityCustomContent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EpisodeViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilitySummaryLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessibilityLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "length"))
  {
    v6 = (void *)MEMORY[0x24BDB3D68];
    accessibilityLocalizedString(CFSTR("summary.title"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "customContentWithLabel:value:", v7, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "addObject:", v8);
  }

  return v3;
}

- (id)_accessibilityLabelForPlaybackState:(BOOL)a3
{
  __CFString *v3;

  if (a3)
    v3 = CFSTR("now.playing");
  else
    v3 = CFSTR("paused");
  accessibilityLocalizedString(v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)accessibilityTraits
{
  void *v2;
  unint64_t *v3;

  -[EpisodeViewAccessibility _accessibilityViewAncestorIsKindOf:](self, "_accessibilityViewAncestorIsKindOf:", MEMORY[0x234919BBC](CFSTR("ShelfKitCollectionViews.EpisodeCollectionViewCell"), a2));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = (unint64_t *)MEMORY[0x24BDF73B0];
  if (v2)
    v3 = (unint64_t *)MEMORY[0x24BDF73E0];
  return *v3;
}

- (BOOL)_accessibilityPerformSummaryButton:(id)a3
{
  void *v3;

  -[EpisodeViewAccessibility _axSummaryButton](self, "_axSummaryButton", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sendActionsForControlEvents:", 64);

  return 1;
}

- (id)_axSummaryButton
{
  void *v3;
  void *v4;

  objc_opt_class();
  -[EpisodeViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilitySummaryButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)accessibilityCustomActions
{
  int v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  uint64_t v8;
  id v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  _QWORD v23[4];
  id v24;
  id location;
  _QWORD v26[5];
  objc_super v27;

  v3 = -[EpisodeViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("accessibilityIsPlaying"));
  v4 = (void *)MEMORY[0x24BDBCEB8];
  v27.receiver = self;
  v27.super_class = (Class)EpisodeViewAccessibility;
  -[EpisodeViewAccessibility accessibilityCustomActions](&v27, sel_accessibilityCustomActions);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[EpisodeViewAccessibility _accessibilityActivateShouldPerformPlayPause](self, "_accessibilityActivateShouldPerformPlayPause");
  v8 = MEMORY[0x24BDAC760];
  if (!v7)
  {
    v9 = objc_alloc(MEMORY[0x24BDF6788]);
    if (v3)
      v10 = CFSTR("AX_Pause");
    else
      v10 = CFSTR("AX_Play");
    accessibilityLocalizedString(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v8;
    v26[1] = 3221225472;
    v26[2] = __54__EpisodeViewAccessibility_accessibilityCustomActions__block_invoke;
    v26[3] = &unk_2502FD000;
    v26[4] = self;
    v12 = (void *)objc_msgSend(v9, "initWithName:actionHandler:", v11, v26);

    objc_msgSend(v6, "addObject:", v12);
  }
  -[EpisodeViewAccessibility _axSummaryButton](self, "_axSummaryButton");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "_accessibilityViewIsVisible"))
  {
    objc_msgSend(v13, "accessibilityLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "length"))
    {
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6788]), "initWithName:target:selector:", v14, self, sel__accessibilityPerformSummaryButton_);
      objc_msgSend(v6, "axSafelyAddObject:", v15);

    }
  }
  LOBYTE(location) = 0;
  objc_opt_class();
  -[EpisodeViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("accessibilityContextButton"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "superview");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_initWeak(&location, v17);
    v19 = objc_alloc(MEMORY[0x24BDF6788]);
    accessibilityLocalizedString(CFSTR("more.info"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v8;
    v23[1] = 3221225472;
    v23[2] = __54__EpisodeViewAccessibility_accessibilityCustomActions__block_invoke_3;
    v23[3] = &unk_2502FD050;
    objc_copyWeak(&v24, &location);
    v21 = (void *)objc_msgSend(v19, "initWithName:actionHandler:", v20, v23);

    objc_msgSend(v6, "axSafelyAddObject:", v21);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }

  return v6;
}

uint64_t __54__EpisodeViewAccessibility_accessibilityCustomActions__block_invoke()
{
  AXPerformSafeBlock();
  return 1;
}

uint64_t __54__EpisodeViewAccessibility_accessibilityCustomActions__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessibilityPerformPlayPauseAction");
}

uint64_t __54__EpisodeViewAccessibility_accessibilityCustomActions__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "sendActionsForControlEvents:", 64);

  return 1;
}

- (void)_axAddExtraButtonsToArray:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[EpisodeViewAccessibility _axSummaryButton](self, "_axSummaryButton");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "axSafelyAddObject:", v5);

}

- (id)automationElements
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)EpisodeViewAccessibility;
  -[EpisodeViewAccessibility automationElements](&v9, sel_automationElements);
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

  -[EpisodeViewAccessibility _axAddExtraButtonsToArray:](self, "_axAddExtraButtonsToArray:", v7);
  return v7;
}

- (id)_accessibilitySupplementaryFooterViews
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x24BDBCEB8];
  v7.receiver = self;
  v7.super_class = (Class)EpisodeViewAccessibility;
  -[EpisodeViewAccessibility _accessibilitySupplementaryFooterViews](&v7, sel__accessibilitySupplementaryFooterViews);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (AXRequestingClient() == 5)
    -[EpisodeViewAccessibility _axAddExtraButtonsToArray:](self, "_axAddExtraButtonsToArray:", v5);
  return v5;
}

- (BOOL)_accessibilityActivateShouldPerformPlayPause
{
  return 0;
}

@end
