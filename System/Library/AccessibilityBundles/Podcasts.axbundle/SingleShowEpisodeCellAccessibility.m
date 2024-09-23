@implementation SingleShowEpisodeCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ShelfKitCollectionViews.SingleShowEpisodeCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ShelfKitCollectionViews.SingleShowEpisodeCell"), CFSTR("accessibilityEpisodeInfoView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ShelfKitCollectionViews.SingleShowEpisodeCell"), CFSTR("accessibilityPlayControlsView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ShelfKitCollectionViews.EpisodeInfoView"), CFSTR("accessibilityDescriptionLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ShelfKitCollectionViews.EpisodeInfoView"), CFSTR("accessibilityTitleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ShelfKitCollectionViews.PlayControlsStackView"), CFSTR("accessibilityPlayPauseButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ShelfKitCollectionViews.PlayControlsStackView"), CFSTR("accessibilityNewPlayPauseButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ShelfKitCollectionViews.PlayControlsStackView"), CFSTR("accessibilityEpisodeStateControls"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ShelfKitCollectionViews.EpisodeStateControlsStackView"), CFSTR("accessibilityMoreButton"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)-[SingleShowEpisodeCellAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("accessibilityEpisodeInfoView, accessibilityPlayControlsView"));
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SingleShowEpisodeCellAccessibility;
  return *MEMORY[0x24BDF73B0] | -[SingleShowEpisodeCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
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
  -[SingleShowEpisodeCellAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("accessibilityEpisodeInfoView.accessibilityDescriptionLabel"));
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

  -[SingleShowEpisodeCellAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("accessibilityPlayControlsView.accessibilityNewPlayPauseButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SingleShowEpisodeCellAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("accessibilityPlayControlsView.accessibilityPlayPauseButton"));
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
  v9[2] = __56__SingleShowEpisodeCellAccessibility__axPlayPauseButton__block_invoke;
  v9[3] = &unk_2502FD028;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v7, "_setAccessibilityValueBlock:", v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v7;
}

id __56__SingleShowEpisodeCellAccessibility__axPlayPauseButton__block_invoke(uint64_t a1)
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
  v7.super_class = (Class)SingleShowEpisodeCellAccessibility;
  -[SingleShowEpisodeCellAccessibility _accessibilitySupplementaryFooterViews](&v7, sel__accessibilitySupplementaryFooterViews);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObjectsFromArray:", v4);

  -[SingleShowEpisodeCellAccessibility _axPlayPauseButton](self, "_axPlayPauseButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "_accessibilityViewIsVisible"))
    objc_msgSend(v3, "axSafelyAddObject:", v5);

  return v3;
}

- (id)accessibilityCustomActions
{
  void *v2;
  id v3;
  char v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
  void *v13;
  id v14;
  id location;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  -[SingleShowEpisodeCellAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("accessibilityPlayControlsView.accessibilityEpisodeStateControls.accessibilityMoreButton"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v2);

  v3 = objc_loadWeakRetained(&location);
  v4 = objc_msgSend(v3, "_accessibilityViewIsVisible");

  if ((v4 & 1) != 0)
  {
    v5 = objc_alloc(MEMORY[0x24BDF6788]);
    accessibilityLocalizedString(CFSTR("more.button"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x24BDAC760];
    v11 = 3221225472;
    v12 = __64__SingleShowEpisodeCellAccessibility_accessibilityCustomActions__block_invoke;
    v13 = &unk_2502FD050;
    objc_copyWeak(&v14, &location);
    v7 = (void *)objc_msgSend(v5, "initWithName:actionHandler:", v6, &v10);
    v16[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 1, v10, v11, v12, v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(&v14);
  }
  else
  {
    v8 = 0;
  }
  objc_destroyWeak(&location);
  return v8;
}

uint64_t __64__SingleShowEpisodeCellAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1)
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
  v11.super_class = (Class)SingleShowEpisodeCellAccessibility;
  -[SingleShowEpisodeCellAccessibility automationElements](&v11, sel_automationElements);
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

  -[SingleShowEpisodeCellAccessibility _axPlayPauseButton](self, "_axPlayPauseButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "axSafelyAddObject:", v8);

  -[SingleShowEpisodeCellAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("accessibilityPlayControlsView.accessibilityEpisodeStateControls.accessibilityMoreButton"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "axSafelyAddObject:", v9);

  return v7;
}

@end
