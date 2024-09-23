@implementation ChartEpisodeCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ShelfKitCollectionViews.ChartEpisodeCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ShelfKitCollectionViews.ChartEpisodeCell"), CFSTR("accessibilityMoreButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ShelfKitCollectionViews.ChartEpisodeCell"), CFSTR("accessibilityInternalArtworkView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ShelfKitCollectionViews.ChartEpisodeCell"), CFSTR("accessibilityOrdinalLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ShelfKitCollectionViews.DynamicContextMenuButton"), CFSTR("accessibilityButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("ShelfKitCollectionViews.ChartEpisodeCell"), CFSTR("episodeInfoView"), "Optional<EpisodeInfoView>");

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

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ChartEpisodeCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityOrdinalLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ChartEpisodeCellAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("episodeInfoView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObject:", v4);
  objc_msgSend(v3, "axSafelyAddObject:", v5);
  MEMORY[0x234919BD4](v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
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
  -[ChartEpisodeCellAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("accessibilityMoreButton.accessibilityButton"));
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
    v12 = __59__ChartEpisodeCellAccessibility_accessibilityCustomActions__block_invoke;
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

uint64_t __59__ChartEpisodeCellAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1)
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
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)ChartEpisodeCellAccessibility;
  -[ChartEpisodeCellAccessibility automationElements](&v12, sel_automationElements);
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

  -[ChartEpisodeCellAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("accessibilityMoreButton.accessibilityButton"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "axSafelyAddObject:", v8);

  -[ChartEpisodeCellAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("accessibilityInternalArtworkView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "axSafelyAddObject:", v9);

  -[ChartEpisodeCellAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("accessibilityOrdinalLabel"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "axSafelyAddObject:", v10);

  return v7;
}

@end
