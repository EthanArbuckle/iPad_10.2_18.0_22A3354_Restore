@implementation MultiShowEpisodeCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ShelfKitCollectionViews.MultiShowEpisodeCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ShelfKitCollectionViews.MultiShowEpisodeCell"), CFSTR("accessibilityEpisodeInfoView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ShelfKitCollectionViews.MultiShowEpisodeCell"), CFSTR("accessibilityPlayControlsView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ShelfKitCollectionViews.EpisodeInfoView"), CFSTR("accessibilityDescriptionLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ShelfKitCollectionViews.EpisodeInfoView"), CFSTR("accessibilityTitleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ShelfKitCollectionViews.PlayControlsStackView"), CFSTR("accessibilityPlayPauseButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ShelfKitCollectionViews.PlayControlsStackView"), CFSTR("accessibilityNewPlayPauseButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ShelfKitCollectionViews.PlayControlsStackView"), CFSTR("accessibilityEpisodeStateControls"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ShelfKitCollectionViews.EpisodeStateControlsStackView"), CFSTR("accessibilityMoreButton"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("ShelfKitCollectionViews.CachingArtworkView"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("ShelfKitCollectionViews.CachingArtworkView"), CFSTR("ArtworkView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ShelfKitCollectionViews.ArtworkView"), CFSTR("accessibilityTitle"), "@", 0);
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("ShelfKitCollectionViews.MultiShowEpisodeCell"), CFSTR("internalArtworkView"), "Optional<CachingArtworkView>");

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
  void *v8;

  -[MultiShowEpisodeCellAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("internalArtworkView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("accessibilityTitle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MultiShowEpisodeCellAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("accessibilityEpisodeInfoView, accessibilityPlayControlsView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityStripUnfavorableCharacters(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MultiShowEpisodeCellAccessibility;
  return *MEMORY[0x24BDF73B0] | -[MultiShowEpisodeCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
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
  -[MultiShowEpisodeCellAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("accessibilityEpisodeInfoView.accessibilityDescriptionLabel"));
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

    objc_msgSend(v3, "axSafelyAddObject:", v8);
  }

  return v3;
}

- (id)_axPlayPauseButton
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  id location;

  -[MultiShowEpisodeCellAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("accessibilityPlayControlsView.accessibilityNewPlayPauseButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MultiShowEpisodeCellAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("accessibilityPlayControlsView.accessibilityPlayPauseButton"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v3)
    v6 = v3;
  else
    v6 = (void *)v4;
  v7 = v6;
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __55__MultiShowEpisodeCellAccessibility__axPlayPauseButton__block_invoke;
  v9[3] = &unk_2502FD028;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v7, "_setAccessibilityValueBlock:", v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v7;
}

id __55__MultiShowEpisodeCellAccessibility__axPlayPauseButton__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "safeValueForKeyPath:", CFSTR("accessibilityEpisodeInfoView.accessibilityTitleLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_accessibilitySupplementaryFooterViews
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7.receiver = self;
  v7.super_class = (Class)MultiShowEpisodeCellAccessibility;
  -[MultiShowEpisodeCellAccessibility _accessibilitySupplementaryFooterViews](&v7, sel__accessibilitySupplementaryFooterViews);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObjectsFromArray:", v4);

  -[MultiShowEpisodeCellAccessibility _axPlayPauseButton](self, "_axPlayPauseButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "_accessibilityViewIsVisible"))
    objc_msgSend(v3, "axSafelyAddObject:", v5);

  return v3;
}

- (id)accessibilityCustomActions
{
  id v3;
  void *v4;
  id v5;
  char v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  void *v19;
  id v20;
  id from;
  _QWORD v22[4];
  id v23;
  id location;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[MultiShowEpisodeCellAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("accessibilityPlayControlsView.accessibilityEpisodeStateControls.accessibilityMoreButton"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v4);

  v5 = objc_loadWeakRetained(&location);
  v6 = objc_msgSend(v5, "_accessibilityViewIsVisible");

  if ((v6 & 1) != 0)
  {
    v7 = objc_alloc(MEMORY[0x24BDF6788]);
    accessibilityLocalizedString(CFSTR("more.button"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x24BDAC760];
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __63__MultiShowEpisodeCellAccessibility_accessibilityCustomActions__block_invoke;
    v22[3] = &unk_2502FD050;
    objc_copyWeak(&v23, &location);
    v10 = (void *)objc_msgSend(v7, "initWithName:actionHandler:", v8, v22);
    objc_msgSend(v3, "axSafelyAddObject:", v10);

    objc_destroyWeak(&v23);
    objc_initWeak(&from, self);
    v11 = objc_alloc(MEMORY[0x24BDF6788]);
    accessibilityLocalizedString(CFSTR("show.context.menu"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v9;
    v17 = 3221225472;
    v18 = __63__MultiShowEpisodeCellAccessibility_accessibilityCustomActions__block_invoke_2;
    v19 = &unk_2502FD050;
    objc_copyWeak(&v20, &from);
    v13 = (void *)objc_msgSend(v11, "initWithName:actionHandler:", v12, &v16);

    objc_msgSend(v3, "axSafelyAddObject:", v13, v16, v17, v18, v19);
    v14 = v3;

    objc_destroyWeak(&v20);
    objc_destroyWeak(&from);
  }
  else
  {
    v14 = 0;
  }
  objc_destroyWeak(&location);

  return v14;
}

uint64_t __63__MultiShowEpisodeCellAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_accessibilityShowContextMenuForElement:targetPointValue:", WeakRetained, 0);

  return 1;
}

uint64_t __63__MultiShowEpisodeCellAccessibility_accessibilityCustomActions__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_accessibilityShowContextMenuForElement:targetPointValue:", WeakRetained, 0);

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
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MultiShowEpisodeCellAccessibility;
  -[MultiShowEpisodeCellAccessibility automationElements](&v11, sel_automationElements);
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

  -[MultiShowEpisodeCellAccessibility _axPlayPauseButton](self, "_axPlayPauseButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "axSafelyAddObject:", v8);

  -[MultiShowEpisodeCellAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("accessibilityPlayControlsView.accessibilityEpisodeStateControls.accessibilityMoreButton"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "axSafelyAddObject:", v9);

  return v7;
}

@end
