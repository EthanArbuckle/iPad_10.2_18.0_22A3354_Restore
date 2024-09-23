@implementation LockScreenPosterCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PosterBoard.LockScreenPosterCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("PosterBoard.LockScreenPosterCollectionViewCell"), CFSTR("PosterCollectionViewCell"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("PosterBoard.LockScreenPosterCollectionViewCell"), CFSTR("PosterPairCollectionViewCell"));
  objc_msgSend(v3, "validateClass:", CFSTR("PosterBoard.PosterSectionHeaderView"));
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("PosterBoard.PosterSectionHeaderView"), CFSTR("title"), "@");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("UIWindow"), CFSTR("_delegateViewController"), "UIViewController");
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("UICollectionViewController"), CFSTR("collectionView"), "@");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PosterBoard.PosterRackCollectionViewController"), CFSTR("posterSectionRemovalView:didRequestRemovalOfPosterWithID:"), "v", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasSwiftFieldOfAnyClass:", CFSTR("PosterBoard.PosterPairCollectionViewCell"), CFSTR("posterPair"));
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("PosterBoard.PosterPair"), CFSTR("id"), "String");
  objc_msgSend(v3, "validateClass:hasSwiftFieldOfAnyClass:", CFSTR("PosterBoard.LockScreenPosterCollectionViewCell"), CFSTR("focusButton"));
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("CHSWidgetDescriptor"), CFSTR("displayName"), "@");
  objc_msgSend(v3, "validateClass:hasSwiftFieldOfAnyClass:", CFSTR("PosterBoard.LockScreenPosterCollectionViewCell"), CFSTR("prominentController"));
  objc_msgSend(v3, "validateClass:hasSwiftFieldOfAnyClass:", CFSTR("PosterBoard.LockScreenPosterCollectionViewCell"), CFSTR("widgetSidebarProminentController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CSProminentDisplayViewController"), CFSTR("subtitleComplicationViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PRInlineComplicationSnapshotViewController"), CFSTR("complicationDescriptor"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CSProminentDisplayViewController"), CFSTR("complicationContainerViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CSProminentDisplayViewController"), CFSTR("complicationSidebarViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PRWidgetGridViewController"), CFSTR("model"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PRWidgetGridModel"), CFSTR("complicationDescriptors"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PRComplicationDescriptor"), CFSTR("widgetDescriptor"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("PosterBoard.PosterSectionRemovalView"));

}

- (id)accessibilityLabel
{
  void *v3;
  uint64_t v4;

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = AXLayoutMode(v3);

  if (v4 == 3)
    accessibilityLocalizedString(CFSTR("lock.screen.poster.cell.customize.label"));
  else
    -[LockScreenPosterCollectionViewCellAccessibility _axHeaderLabel](self, "_axHeaderLabel");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)accessibilityHint
{
  void *v3;
  uint64_t v4;
  void *v5;
  objc_super v7;
  char v8;

  v8 = 0;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = AXLayoutMode(v3);

  if (v4 == 3)
  {
    v7.receiver = self;
    v7.super_class = (Class)LockScreenPosterCollectionViewCellAccessibility;
    -[LockScreenPosterCollectionViewCellAccessibility accessibilityHint](&v7, sel_accessibilityHint);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    accessibilityLocalizedString(CFSTR("lock.screen.poster.collection.view.cell.hint"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (BOOL)isAccessibilityElement
{
  void *v3;
  uint64_t v4;
  objc_super v6;
  char v7;

  v7 = 0;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = AXLayoutMode(v3);

  if (v4 == 3)
    return 1;
  v6.receiver = self;
  v6.super_class = (Class)LockScreenPosterCollectionViewCellAccessibility;
  return -[LockScreenPosterCollectionViewCellAccessibility isAccessibilityElement](&v6, sel_isAccessibilityElement);
}

- (BOOL)accessibilityViewIsModal
{
  return !-[LockScreenPosterCollectionViewCellAccessibility isAccessibilityElement](self, "isAccessibilityElement");
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

- (unsigned)_accessibilityMediaAnalysisOptions
{
  return 0;
}

- (id)_accessibilitySupplementaryFooterViews
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  -[LockScreenPosterCollectionViewCellAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("focusButton"));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    v9[0] = v3;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)LockScreenPosterCollectionViewCellAccessibility;
    -[LockScreenPosterCollectionViewCellAccessibility _accessibilitySupplementaryFooterViews](&v8, sel__accessibilitySupplementaryFooterViews);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)LockScreenPosterCollectionViewCellAccessibility;
  -[LockScreenPosterCollectionViewCellAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  objc_opt_class();
  -[LockScreenPosterCollectionViewCellAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("focusButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "accessibilitySetIdentification:", CFSTR("poster.switcher.focus.button"));
}

- (id)accessibilityCustomActions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int IsPad;
  uint64_t v8;
  void *v9;
  void *v10;
  id v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(id *, void *);
  void *v19;
  id v20;
  id v21;
  id v22;
  id location;
  _QWORD v24[4];
  id v25;
  objc_super v26;
  objc_super v27;

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  AXCollectionViewController(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[LockScreenPosterCollectionViewCellAccessibility _axCollectionView](self, "_axCollectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(location) = 0;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (AXLayoutMode(v6) == 3)
  {
    v27.receiver = self;
    v27.super_class = (Class)LockScreenPosterCollectionViewCellAccessibility;
    -[LockScreenPosterCollectionViewCellAccessibility accessibilityCustomActions](&v27, sel_accessibilityCustomActions);
LABEL_8:
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if (AXLockScreenPostersCount(v5) < 2 || AXLayoutMode(v6) != 1)
  {
    v26.receiver = self;
    v26.super_class = (Class)LockScreenPosterCollectionViewCellAccessibility;
    -[LockScreenPosterCollectionViewCellAccessibility accessibilityCustomActions](&v26, sel_accessibilityCustomActions);
    goto LABEL_8;
  }
  IsPad = AXDeviceIsPad();
  v8 = MEMORY[0x24BDAC760];
  if (IsPad)
  {
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __77__LockScreenPosterCollectionViewCellAccessibility_accessibilityCustomActions__block_invoke;
    v24[3] = &unk_2503081C0;
    v25 = v6;
    objc_msgSend(v5, "_accessibilityFindSubviewDescendant:", v24);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  objc_initWeak(&location, self);
  v12 = objc_alloc(MEMORY[0x24BDF6788]);
  accessibilityLocalizedString(CFSTR("lock.screen.poster.cell.delete.label"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v8;
  v17 = 3221225472;
  v18 = __77__LockScreenPosterCollectionViewCellAccessibility_accessibilityCustomActions__block_invoke_2;
  v19 = &unk_250308210;
  v20 = v4;
  v14 = v9;
  v21 = v14;
  objc_copyWeak(&v22, &location);
  v15 = (void *)objc_msgSend(v12, "initWithName:actionHandler:", v13, &v16);

  objc_msgSend(MEMORY[0x24BDBCE30], "axArrayByIgnoringNilElementsWithCount:", 1, v15, v16, v17, v18, v19);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

LABEL_9:
  return v10;
}

BOOL __77__LockScreenPosterCollectionViewCellAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  double v6;
  _BOOL8 v7;

  v3 = a2;
  MEMORY[0x23491A0AC](CFSTR("PosterBoard.PosterSectionRemovalView"));
  v7 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "frame");
    v5 = v4;
    objc_msgSend(*(id *)(a1 + 32), "frame");
    if (v5 == v6)
      v7 = 1;
  }

  return v7;
}

uint64_t __77__LockScreenPosterCollectionViewCellAccessibility_accessibilityCustomActions__block_invoke_2(id *a1, void *a2)
{
  id v3;
  id v5;
  id v6;
  id v7;

  v3 = a2;
  v5 = a1[4];
  v6 = a1[5];
  objc_copyWeak(&v7, a1 + 6);
  AXPerformSafeBlock();
  objc_destroyWeak(&v7);

  return 1;
}

void __77__LockScreenPosterCollectionViewCellAccessibility_accessibilityCustomActions__block_invoke_3(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  id WeakRetained;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "safeSwiftValueForKey:", CFSTR("posterPair"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeSwiftStringForKey:", CFSTR("id"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "posterSectionRemovalView:didRequestRemovalOfPosterWithID:", v2, v4);

}

- (id)_axHeaderLabel
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v16;
  void *v17;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  -[LockScreenPosterCollectionViewCellAccessibility _axCollectionView](self, "_axCollectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(v3, "_accessibilitySubviews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v21;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v8);
        MEMORY[0x23491A0AC](CFSTR("PosterBoard.PosterSectionHeaderView"));
        if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v9, "isHidden") & 1) == 0)
        {
          objc_msgSend(v9, "accessibilityFrame");
          v11 = v10;
          -[LockScreenPosterCollectionViewCellAccessibility accessibilityFrame](self, "accessibilityFrame");
          v13 = v12 + -1.0;
          v14 = v12 + 1.0;
          if (v13 <= v11 && v11 <= v14)
          {
            accessibilityLocalizedString(CFSTR("lock.screen.wallpaper.label"));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "safeStringForKey:", CFSTR("title"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            AXCFormattedString();
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_16;
          }
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v6);
  }
  v17 = 0;
LABEL_16:

  return v17;
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;

  objc_opt_class();
  -[LockScreenPosterCollectionViewCellAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("focusButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "accessibilityValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "accessibilityLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[LockScreenPosterCollectionViewCellAccessibility _axWallpaperWidgetsNames](self, "_axWallpaperWidgetsNames");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    __AXStringForVariables();
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[LockScreenPosterCollectionViewCellAccessibility _axWallpaperWidgetsNames](self, "_axWallpaperWidgetsNames");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)_axWallpaperWidgetsNames
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  -[LockScreenPosterCollectionViewCellAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("prominentController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[LockScreenPosterCollectionViewCellAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("widgetSidebarProminentController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKeyPath:", CFSTR("subtitleComplicationViewController.complicationDescriptor.widgetDescriptor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v3;
  objc_msgSend(v3, "safeValueForKeyPath:", CFSTR("complicationContainerViewController.model"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeArrayForKey:", CFSTR("complicationDescriptors"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  v33 = v4;
  objc_msgSend(v4, "safeValueForKeyPath:", CFSTR("complicationSidebarViewController.model"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "safeArrayForKey:", CFSTR("complicationDescriptors"));
  v10 = objc_claimAutoreleasedReturnValue();

  v31 = (void *)v10;
  objc_msgSend(v8, "axSafelyAddObjectsFromArray:", v10);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    AXTopWidgetAndAppName(v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "axSafelyAddObject:", v13);

  }
  v32 = v5;
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v14 = v8;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v40;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v40 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * v18), "safeValueForKey:", CFSTR("widgetDescriptor"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        AXMapAppNameToWidgets(v19, v12);

        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    }
    while (v16);
  }
  v30 = v14;

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  objc_msgSend(v12, "allKeys");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v36;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v36 != v23)
          objc_enumerationMutation(v20);
        objc_msgSend(v12, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v24));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        AXFormatAndListWithElements();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        __UIAXStringForVariables();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "axSafelyAddObject:", v27, v26, CFSTR("__AXStringForVariablesSentinel"));

        ++v24;
      }
      while (v22 != v24);
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
    }
    while (v22);
  }

  AXFormatAndListWithElements();
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

- (id)_axCollectionView
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_opt_class();
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  AXCollectionViewController(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("collectionView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
